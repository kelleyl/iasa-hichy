#!/bin/bash
set -euo pipefail
shopt -s nullglob

# Enable debug logging
echo "[DEBUG] Invoked script: $0 $*"

# Set CUDA to only use one GPU
export CUDA_VISIBLE_DEVICES=0

# Set directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
MMIF_INPUT_DIR="$PROJECT_ROOT/mmif"
LLAVA_ROOT="/home/kmlynch/clams_apps/app-llava-captioner"
SMOLVLM2_ROOT="/home/kmlynch/clams_apps/app-smolvlm2-captioner"
MOONDREAM_ROOT="/home/kmlynch/clams_apps/app-moondream-captioner"

# Config files to run (without .yaml)
declare -a CONFIGS=(
  "hi-chy-annotator_instructions-3"
  "hi-chy-annotator_instructions-4"
  "hi-chy-revised-4"
)

# Discover MMIF basenames dynamically
declare -a VIDEO_FILES=()

for mmif_path in "$MMIF_INPUT_DIR"/*_HI_pass2_candidates_1.mmif; do
  base=$(basename "$mmif_path" "_HI_pass2_candidates_1.mmif")
  VIDEO_FILES+=("$base")
done

# Parse arguments: [NUM_RUNS] [--mode <cli|service>] [--llava-port <port>] [--smolvlm2-port <port>]
NUM_RUNS=1; MODE="cli"; LLAVA_PORT=5000; SMOLVLM2_PORT=5001
while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode) MODE="$2"; shift 2;;
    --llava-port) LLAVA_PORT="$2"; shift 2;;
    --smolvlm2-port) SMOLVLM2_PORT="$2"; shift 2;;
    *) NUM_RUNS="$1"; shift;;
  esac
done

# Function to monitor GPU and log to a specific file
monitor_gpu_to_file() {
  local log_file="$1" interval="$2" model_type="$3" basename="$4" config_name="$5" run_number="$6" target_gpu_id="$7"
  if [[ ! -s "$log_file" ]]; then
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
  local basename="$1" config_name="$2" app_root="$3" run_number="$4" mode="$5" port="$6"
  echo "[DEBUG] process_file: basename=$basename config=$config_name app_root=$app_root run=$run_number mode=$mode"
  local model_type="unknown"
  [[ "$app_root" == *"llava"* ]]    && model_type="llava"
  [[ "$app_root" == *"smolvlm2"* ]] && model_type="smol-vlm2"
  [[ "$app_root" == *"moondream"* ]] && model_type="moondream"

  # Ensure config file exists
  local config_path="$app_root/config/$config_name.yaml"
  if [[ ! -f "$config_path" ]]; then
    echo "[WARN] Skipping missing config: $config_path" >&2
    return 0
  fi

  local output_model_dir="$model_type"
  (( run_number > 1 )) && output_model_dir+="-run-$run_number"
  local output_dir="$PROJECT_ROOT/output/$output_model_dir/$config_name"
  local mmif_file="$MMIF_INPUT_DIR/${basename}_HI_pass2_candidates_1.mmif"
  local output_file="$output_dir/${basename}.mmif"
  local app_venv="$app_root/.venv" app_config="config/$config_name.yaml" app_cli="$app_root/cli.py"

  mkdir -p "$output_dir"
  if [[ ! -f "$mmif_file" ]]; then
    echo "Error: Input MMIF file not found: $mmif_file" >&2
    return 1
  fi

  if [[ "$mode" == "cli" ]]; then
    if [[ ! -s "$output_file" ]]; then
      echo "[INFO] Running captioning: $basename ($config_name, run $run_number)"
      start_time=$(date +%s)
      local gpu_log="$output_dir/gpu_utilization.log"
      monitor_gpu_to_file "$gpu_log" 0.5 "$model_type" "$basename" "$config_name" "$run_number" 0 &
      local monitor_pid=$!
      (cd "$app_root" && "$app_venv/bin/python" "$app_cli" --config "$app_config" --num_beams 3 "$mmif_file") > "$output_file"
      status=$?
      end_time=$(date +%s)
      echo "$model_type,$basename,$mode,3,$((end_time-start_time))" >> "$output_dir/timing.log"
      kill "$monitor_pid" 2>/dev/null; wait "$monitor_pid" 2>/dev/null
      if (( status != 0 )); then
        echo "Error: Captioning failed: $basename ($config_name, run $run_number)" >&2
        return 1
      fi
    else
      echo "[INFO] Skipping existing output: $basename ($config_name, run $run_number)"
    fi
  else
    if [[ ! -s "$output_file" ]]; then
      echo "[INFO] Posting to service: $basename ($config_name)"
      start_time=$(date +%s)
      curl -s --fail-with-body -H "Accept: application/json" -X POST -d@"$mmif_file" "http://localhost:$port?config=$app_config&num_beams=3" > "$output_file"
      status=$?
      end_time=$(date +%s)
      echo "$model_type,$basename,$mode,3,$((end_time-start_time))" >> "$output_dir/timing.log"
      if (( status != 0 )); then
        echo "Error: Service request failed: $basename ($config_name)" >&2
        rm -f "$output_file"
        return 1
      fi
    else
      echo "[INFO] Skipping existing output: $basename ($config_name)"
    fi
  fi
}

# Main processing loop: run LLAVA and SmolVLM2 in parallel per run
for (( run=1; run<=NUM_RUNS; run++ )); do
  echo "[DEBUG] Starting run $run"
  for basename in "${VIDEO_FILES[@]}"; do
    echo "[DEBUG] Processing basename: $basename"
    (for cfg in "${CONFIGS[@]}"; do
       process_file "$basename" "$cfg" "$LLAVA_ROOT" "$run" "$MODE" "$LLAVA_PORT"
     done) & pid_llava=$!

    (for cfg in "${CONFIGS[@]}"; do
       process_file "$basename" "$cfg" "$SMOLVLM2_ROOT" "$run" "$MODE" "$SMOLVLM2_PORT"
     done) & pid_smol=$!

    echo "[DEBUG] Started parallel processes: LLAVA=$pid_llava, SmolVLM2=$pid_smol"
    wait "$pid_llava"
    llava_status=$?
    wait "$pid_smol"
    smol_status=$?
    
    echo "[DEBUG] Parallel processes completed: LLAVA=$llava_status, SmolVLM2=$smol_status"
    
    if (( llava_status != 0 )); then
      echo "[ERROR] LLAVA processing failed for $basename with exit code $llava_status"
    fi
    if (( smol_status != 0 )); then
      echo "[ERROR] SmolVLM2 processing failed for $basename with exit code $smol_status"
    fi
    
    echo ""
  done
done

echo "All processing complete."
