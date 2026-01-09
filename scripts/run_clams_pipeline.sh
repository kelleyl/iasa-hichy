#!/bin/bash
set -euo pipefail
shopt -s nullglob

# Set CUDA devices - only GPU 0 is visible to this script
export CUDA_VISIBLE_DEVICES=0

# Set directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
MMIF_INPUT_DIR="$PROJECT_ROOT/mmif"
COMP_MMIF_DIR="$PROJECT_ROOT/comps_mmif"
COMP_MMIF_SOURCE="/llc_data/clams/hichy-evaluation-dataset/mmifs-from-swt"
LLAVA_ROOT="/home/kmlynch/clams_apps/app-llava-captioner"
SMOLVLM2_ROOT="/home/kmlynch/clams_apps/app-smolvlm2-captioner"
LLAMA_ROOT="/home/kmlynch/clams_apps/app-llama-video-summarizer"

# Create comps_mmif directory if it doesn't exist
if [[ ! -d "$COMP_MMIF_DIR" ]]; then
  echo "Creating comps_mmif directory: $COMP_MMIF_DIR"
  mkdir -p "$COMP_MMIF_DIR"
fi

# Function to copy and update comparison MMIF files
setup_comparison_mmifs() {
  echo "Setting up comparison MMIF files..."
  
  if [[ ! -d "$COMP_MMIF_SOURCE" ]]; then
    echo "[WARN] Comparison MMIF source directory not found: $COMP_MMIF_SOURCE"
    return 0
  fi
  
  for mmif_path in "$COMP_MMIF_SOURCE"/*hi-chy-comps*.mmif; do
    if [[ -f "$mmif_path" ]]; then
      filename=$(basename "$mmif_path")
      new_name="${filename%%_*}.mmif"
      new_path="$COMP_MMIF_DIR/$new_name"
      
      echo "Processing comparison MMIF: $filename -> $new_name"
      
      if [[ -f "$new_path" ]]; then
        echo "[INFO] Skipping existing comparison MMIF: $new_name"
      else
        temp_file=$(mktemp)
        sed 's|file:///data/|file:///llc_data/clams/hichy-evaluation-dataset/videos/250717/hi-chy-comps/|g' "$mmif_path" > "$temp_file"
        mv "$temp_file" "$new_path"
        echo "[INFO] Created comparison MMIF: $new_name"
      fi
    fi
  done
}

# Config files to run
declare -a CONFIGS=("owen39-cl1")

# Captioner models
declare -a CAPTIONER_MODELS=("smol-vlm2")

# Mapping of model names to their app directories
declare -A MODEL_ROOTS=(
  ["llava"]="$LLAVA_ROOT"
  ["smol-vlm2"]="$SMOLVLM2_ROOT"
)

# Discover Hawaii MMIF basenames
declare -a VIDEO_FILES=()
for mmif_path in "$MMIF_INPUT_DIR"/*_HI_pass2_candidates_1.mmif; do
  base=$(basename "$mmif_path" "_HI_pass2_candidates_1.mmif")
  VIDEO_FILES+=("$base")
done

# Discover comparison MMIF basenames
declare -a COMP_VIDEO_FILES=()
for mmif_path in "$COMP_MMIF_DIR"/*.mmif; do
  if [[ -f "$mmif_path" ]]; then
    base=$(basename "$mmif_path" ".mmif")
    COMP_VIDEO_FILES+=("$base")
  fi
done

# Parse arguments
NUM_RUNS=1; MODE="cli"; LLAVA_PORT=5000; SMOLVLM2_PORT=5001; LLAMA_PORT=5002
while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode) MODE="$2"; shift 2;;
    *) NUM_RUNS="$1"; shift;;
  esac
done

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

process_captioner_file() {
  local basename="$1" config_name="$2" model_type="$3" run_number="$4" mode="$5" port="$6" is_comparison="$7"
  local app_root="${MODEL_ROOTS[$model_type]}"
  local config_path="$app_root/config/$config_name.yaml"

  if [[ ! -f "$config_path" ]]; then
    echo "[WARN] Skipping missing config: $config_path" >&2
    return 0
  fi

  local output_model_dir="$model_type"
  (( run_number > 1 )) && output_model_dir+="-run-$run_number"
  
  if [[ "$is_comparison" == "true" ]]; then
    local output_dir="$PROJECT_ROOT/comps_outputs/$output_model_dir/$config_name"
    local mmif_file="$COMP_MMIF_DIR/${basename}.mmif"
  else
    local output_dir="$PROJECT_ROOT/output/$output_model_dir/$config_name"
    local mmif_file="$MMIF_INPUT_DIR/${basename}_HI_pass2_candidates_1.mmif"
  fi
  
  local output_file="$output_dir/${basename}.mmif"
  local app_venv="$app_root/.venv" app_config="config/$config_name.yaml" app_cli="$app_root/cli.py"

  mkdir -p "$output_dir"

  if [[ "$mode" == "cli" ]]; then
    if [[ ! -s "$output_file" ]]; then
      echo "[INFO] Running $model_type: $basename ($config_name) [COMPARISON: $is_comparison]"
      start_time=$(date +%s)
      local gpu_log="$output_dir/gpu_utilization.log"
      
      # Since CUDA_VISIBLE_DEVICES=0, we always use internal index 0
      local gpu_id=0
      
      monitor_gpu_to_file "$gpu_log" 0.5 "$model_type" "$basename" "$config_name" "$run_number" "$gpu_id" &
      local monitor_pid=$!
      
      (cd "$app_root" && "$app_venv/bin/python" "$app_cli" --config "$app_config" --num_beams 3 "$mmif_file") > "$output_file"
      
      status=$?
      end_time=$(date +%s)
      echo "$model_type,$basename,$mode,3,$((end_time-start_time))" >> "$output_dir/timing.log"
      kill "$monitor_pid" 2>/dev/null; wait "$monitor_pid" 2>/dev/null
      [[ $status -ne 0 ]] && return 1
    fi
  fi
}

# Setup comparison MMIFs
setup_comparison_mmifs

# Phase 1: Hawaii Dataset
echo "Starting captioner processing: Hawaii Dataset"
for (( run=1; run<=NUM_RUNS; run++ )); do
  for basename in "${VIDEO_FILES[@]}"; do
    for cfg in "${CONFIGS[@]}"; do
       process_captioner_file "$basename" "$cfg" "smol-vlm2" "$run" "$MODE" "$SMOLVLM2_PORT" "false"
    done
  done
done

# Phase 1b: Comparison Dataset
echo "Starting captioner processing: Comparison Dataset"
for (( run=1; run<=NUM_RUNS; run++ )); do
  for basename in "${COMP_VIDEO_FILES[@]}"; do
    for cfg in "${CONFIGS[@]}"; do
       process_captioner_file "$basename" "$cfg" "smol-vlm2" "$run" "$MODE" "$SMOLVLM2_PORT" "true"
    done
  done
done

echo "All processing complete."