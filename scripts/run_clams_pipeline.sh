#!/bin/bash
set -euo pipefail
shopt -s nullglob

# Set CUDA to only use one GPU
export CUDA_VISIBLE_DEVICES=0,1

# Set directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
MMIF_INPUT_DIR="$PROJECT_ROOT/mmif"
LLAVA_ROOT="/home/kmlynch/clams_apps/app-llava-captioner"
SMOLVLM2_ROOT="/home/kmlynch/clams_apps/app-smolvlm2-captioner"
MOONDREAM_ROOT="/home/kmlynch/clams_apps/app-moondream-captioner"

# List of video files to process
declare -a VIDEO_FILES=(
    "cpb-aacip-225-12z34w2c"
    "cpb-aacip-225-15bcc3x8"
    "cpb-aacip-225-31qftxh5"
    "cpb-aacip-225-48sbchm7"
    "cpb-aacip-225-20ftth6f"
    "cpb-aacip-225-37vmd093"
    "cpb-aacip-225-51vdnj5t"
    "cpb-aacip-225-27zkh3tm"
    "cpb-aacip-225-44bnzxh7"
    "cpb-aacip-225-65v6x41w"
)

# Parse arguments for mode and custom ports
NUM_RUNS=5
MODE="cli"
LLAVA_PORT=5000
SMOLVLM2_PORT=5001

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    --mode)
      MODE="$2"; shift; shift
      ;;
    --llava-port)
      LLAVA_PORT="$2"; shift; shift
      ;;
    --smolvlm2-port)
      SMOLVLM2_PORT="$2"; shift; shift
      ;;
    *)
      NUM_RUNS="$1"; shift
      ;;
  esac
done

# PID for CLI GPU monitor
MONITOR_PROCESS_FILE_PID=""

# Cleanup for GPU monitor
cleanup() {
  if [ -n "$MONITOR_PROCESS_FILE_PID" ] && ps -p "$MONITOR_PROCESS_FILE_PID" > /dev/null; then
    kill "$MONITOR_PROCESS_FILE_PID"
    wait "$MONITOR_PROCESS_FILE_PID" 2>/dev/null
  fi
}
trap cleanup EXIT INT TERM

# Function to monitor GPU and log to a specific file
monitor_gpu_to_file() {
    local log_file="$1"; local interval="$2"; local model_type="$3"
    local basename="$4"; local config_name="$5"; local run_number="$6"
    local target_gpu_id="$7"

    if [ ! -s "$log_file" ]; then
        echo "model_type,basename,config_name,run_number,num_beams,Timestamp,GPU_ID,GPU_Name,Utilization_%,Memory_Used_MiB,Memory_Total_MiB,Temperature_C" > "$log_file"
    fi

    while true; do
        TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
        nvidia-smi --query-gpu=index,name,utilization.gpu,memory.used,memory.total,temperature.gpu \
          --format=csv,noheader,nounits -i "$target_gpu_id" | \
        while IFS= read -r line; do
            echo "$model_type,$basename,$config_name,$run_number,3,$TIMESTAMP,$line" >> "$log_file"
        done
        sleep "$interval"
    done
}

# Function to process MMIF files with a specific config
process_file() {
    local basename="$1"; local config_name="$2"; local app_root="$3"
    local run_number="$4"; local mode="$5"; local port="$6"

    local model_type=""
    if [[ "$app_root" == *"llava"* ]]; then
        model_type="llava"
    elif [[ "$app_root" == *"smolvlm2"* ]]; then
        model_type="smol-vlm2"
    elif [[ "$app_root" == *"moondream"* ]]; then
        model_type="moondream"
    else
        model_type="unknown"
    fi

    local output_model_dir="$model_type"
    if [ "$run_number" -gt 1 ]; then
        output_model_dir="${model_type}-run-${run_number}"
    fi
    local output_dir="$PROJECT_ROOT/output/$output_model_dir/$config_name"
    local mmif_file="$MMIF_INPUT_DIR/${basename}_HI_pass2_candidates_1.mmif"
    local output_file="$output_dir/${basename}.mmif"
    local app_venv="$app_root/.venv"
    local app_config="config/$config_name.yaml"
    local app_cli="$app_root/cli.py"

    mkdir -p "$output_dir"

    if [ ! -f "$mmif_file" ]; then
        echo "Error: Input MMIF file not found: $mmif_file" >&2
        return 1
    fi

    if [ "$mode" == "cli" ]; then
        if [ ! -s "$output_file" ]; then
            echo "Running captioning: $basename ($config_name, run $run_number)"
            start_time=$(date +%s)

            local gpu_log="$output_dir/gpu_utilization.log"
            monitor_gpu_to_file "$gpu_log" 0.5 "$model_type" "$basename" "$config_name" "$run_number" "0" &
            MONITOR_PROCESS_FILE_PID=$!

            (cd "$app_root" && "$app_venv/bin/python" "$app_cli" --config "$app_config" --num_beams 3 "$mmif_file") > "$output_file"
            status=$?

            end_time=$(date +%s)
            echo "$model_type,$basename,$mode,3,$((end_time - start_time))" >> "$output_dir/timing.log"

            kill "$MONITOR_PROCESS_FILE_PID" 2>/dev/null
            wait "$MONITOR_PROCESS_FILE_PID" 2>/dev/null
            MONITOR_PROCESS_FILE_PID=""

            if [ $status -ne 0 ]; then
                echo "Error: Captioning failed: $basename ($config_name, run $run_number)" >&2
                return 1
            fi
        else
            echo "Skipping existing output: $basename ($config_name, run $run_number)"
        fi
    else
        if [ ! -s "$output_file" ]; then
            echo "Posting to web service: $basename ($config_name)"
            start_time=$(date +%s)

            curl -s --fail-with-body -H "Accept: application/json" \
              -X POST -d@"$mmif_file" "http://localhost:$port?config=$app_config&num_beams=3" \
              > "$output_file"
            status=$?

            end_time=$(date +%s)
            echo "$model_type,$basename,$mode,3,$((end_time - start_time))" >> "$output_dir/timing.log"

            if [ $status -ne 0 ]; then
                echo "Error: Web service request failed: $basename ($config_name)" >&2
                rm -f "$output_file"
                return 1
            fi
        else
            echo "Skipping existing output: $basename ($config_name)"
        fi
    fi
}

# Main processing loop: run llava and smolvlm2 groups in parallel,
# but only one llava job at a time and one smolvlm2 job at a time.
for ((run=1; run<=NUM_RUNS; run++)); do
  for basename in "${VIDEO_FILES[@]}"; do
    (
      process_file "$basename" "hi-chy-annotator_instructions-3" "$LLAVA_ROOT"    "$run" "$MODE" "$LLAVA_PORT"
      process_file "$basename" "hi-chy-annotator_instructions-4" "$LLAVA_ROOT"    "$run" "$MODE" "$LLAVA_PORT"
    ) &
    pid_llava=$!

    (
      process_file "$basename" "hi-chy-annotator_instructions-3" "$SMOLVLM2_ROOT" "$run" "$MODE" "$SMOLVLM2_PORT"
      process_file "$basename" "hi-chy-annotator_instructions-4" "$SMOLVLM2_ROOT" "$run" "$MODE" "$SMOLVLM2_PORT"
    ) &
    pid_smol=$!

    # wait for both service‐specific groups to finish
    wait "$pid_llava" "$pid_smol"
    echo ""
  done
done

echo "All processing complete."
