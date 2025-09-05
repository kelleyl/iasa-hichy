#!/bin/bash
set -euo pipefail
shopt -s nullglob

# Set CUDA devices for different models
# GPU 0 will be used for LLaVA, GPU 1 for SmolVLM2
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
  
  # Check if source directory exists
  if [[ ! -d "$COMP_MMIF_SOURCE" ]]; then
    echo "[WARN] Comparison MMIF source directory not found: $COMP_MMIF_SOURCE"
    return 0
  fi
  
  # Find MMIF files with 'hi-chy-comps' in the filename
  for mmif_path in "$COMP_MMIF_SOURCE"/*hi-chy-comps*.mmif; do
    if [[ -f "$mmif_path" ]]; then
      # Extract filename before first underscore
      filename=$(basename "$mmif_path")
      new_name="${filename%%_*}.mmif"
      new_path="$COMP_MMIF_DIR/$new_name"
      
      echo "Processing comparison MMIF: $filename -> $new_name"
      
      # Copy and update the MMIF file
      if [[ -f "$new_path" ]]; then
        echo "[INFO] Skipping existing comparison MMIF: $new_name"
      else
        # Create a temporary file for processing
        temp_file=$(mktemp)
        
        # Update video file paths in the MMIF file to point to the correct subdirectory
        sed 's|file:///data/|file:///llc_data/clams/hichy-evaluation-dataset/videos/250717/hi-chy-comps/|g' "$mmif_path" > "$temp_file"
        
        # Move to final location
        mv "$temp_file" "$new_path"
        echo "[INFO] Created comparison MMIF: $new_name"
      fi
    fi
  done
}

# Config files to run (without .yaml) - only those with '3' in their names
declare -a CONFIGS=(
  "hi-chy-annotator_instructions-3"
  "hi-chy-revised-3"
  "hi-chy-annotator_instructions-4"
  "hi-chy-revised-4"

)

# Captioner models
declare -a CAPTIONER_MODELS=("llava" "smol-vlm2")

# Mapping of model names to their app directories
declare -A MODEL_ROOTS=(
  ["llava"]="$LLAVA_ROOT"
  ["smol-vlm2"]="$SMOLVLM2_ROOT"
)

# Discover MMIF basenames dynamically
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

# Discover doctr MMIF basenames
declare -a DOCTR_VIDEO_FILES=()
DOCTR_INPUT_DIR="/home/krim/app-doctr-sdk134@hi-chy-hi-full"

if [[ -d "$DOCTR_INPUT_DIR" ]]; then
  for mmif_path in "$DOCTR_INPUT_DIR"/*.mmif; do
    if [[ -f "$mmif_path" ]]; then
      base=$(basename "$mmif_path" ".mmif")
      DOCTR_VIDEO_FILES+=("$base")
    fi
  done
fi

# Parse arguments: [NUM_RUNS] [--mode <cli|service>] [--llava-port <port>] [--smolvlm2-port <port>] [--llama-port <port>]
NUM_RUNS=1; MODE="cli"; LLAVA_PORT=5000; SMOLVLM2_PORT=5001; LLAMA_PORT=5002
while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode) MODE="$2"; shift 2;;
    --llava-port) LLAVA_PORT="$2"; shift 2;;
    --smolvlm2-port) SMOLVLM2_PORT="$2"; shift 2;;
    --llama-port) LLAMA_PORT="$2"; shift 2;;
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

# Function to process captioner MMIF files
process_captioner_file() {
  local basename="$1" config_name="$2" model_type="$3" run_number="$4" mode="$5" port="$6" is_comparison="$7"
  
  local app_root="${MODEL_ROOTS[$model_type]}"
  
  # Ensure config file exists
  local config_path="$app_root/config/$config_name.yaml"
  if [[ ! -f "$config_path" ]]; then
    echo "[WARN] Skipping missing config: $config_path" >&2
    return 0
  fi

  local output_model_dir="$model_type"
  (( run_number > 1 )) && output_model_dir+="-run-$run_number"
  
  # Determine output directory based on whether this is comparison data
  if [[ "$is_comparison" == "true" ]]; then
    local output_dir="$PROJECT_ROOT/comps_outputs/$output_model_dir/$config_name"
  else
    local output_dir="$PROJECT_ROOT/output/$output_model_dir/$config_name"
  fi
  
  # Determine input MMIF file
  if [[ "$is_comparison" == "true" ]]; then
    local mmif_file="$COMP_MMIF_DIR/${basename}.mmif"
  else
    local mmif_file="$MMIF_INPUT_DIR/${basename}_HI_pass2_candidates_1.mmif"
  fi
  
  local output_file="$output_dir/${basename}.mmif"
  local app_venv="$app_root/.venv" app_config="config/$config_name.yaml" app_cli="$app_root/cli.py"

  mkdir -p "$output_dir"
  if [[ ! -f "$mmif_file" ]]; then
    echo "Error: Input MMIF file not found: $mmif_file" >&2
    return 1
  fi

  if [[ "$mode" == "cli" ]]; then
    if [[ ! -s "$output_file" ]]; then
      echo "[INFO] Running $model_type processing: $basename ($config_name, run $run_number) [COMPARISON: $is_comparison]"
      start_time=$(date +%s)
      local gpu_log="$output_dir/gpu_utilization.log"
      
      # Set GPU device based on model type
      local gpu_id
      if [[ "$model_type" == "llava" ]]; then
        gpu_id=0
      else
        gpu_id=1
      fi
      
      monitor_gpu_to_file "$gpu_log" 0.5 "$model_type" "$basename" "$config_name" "$run_number" "$gpu_id" &
      local monitor_pid=$!
      
      (cd "$app_root" && CUDA_VISIBLE_DEVICES="$gpu_id" "$app_venv/bin/python" "$app_cli" --config "$app_config" --num_beams 3 "$mmif_file") > "$output_file"
      
      status=$?
      end_time=$(date +%s)
      echo "$model_type,$basename,$mode,3,$((end_time-start_time))" >> "$output_dir/timing.log"
      kill "$monitor_pid" 2>/dev/null; wait "$monitor_pid" 2>/dev/null
      if (( status != 0 )); then
        echo "Error: $model_type processing failed: $basename ($config_name, run $run_number)" >&2
        return 1
      fi
    else
      echo "[INFO] Skipping existing $model_type output: $basename ($config_name, run $run_number) [COMPARISON: $is_comparison]"
    fi
  else
    if [[ ! -s "$output_file" ]]; then
      echo "[INFO] Posting to $model_type service: $basename ($config_name) [COMPARISON: $is_comparison]"
      start_time=$(date +%s)
      
      # Set GPU device based on model type for service mode
      local gpu_id
      if [[ "$model_type" == "llava" ]]; then
        gpu_id=0
      else
        gpu_id=1
      fi
      
      curl -s --fail-with-body -H "Accept: application/json" -X POST -d@"$mmif_file" "http://localhost:$port?config=$app_config&num_beams=3&gpu_id=$gpu_id" > "$output_file"
      
      status=$?
      end_time=$(date +%s)
      echo "$model_type,$basename,$mode,3,$((end_time-start_time))" >> "$output_dir/timing.log"
      if (( status != 0 )); then
        echo "Error: $model_type service request failed: $basename ($config_name)" >&2
        rm -f "$output_file"
        return 1
      fi
    else
      echo "[INFO] Skipping existing $model_type output: $basename ($config_name) [COMPARISON: $is_comparison]"
    fi
  fi
}

# Function to process llama with captioner outputs
process_llama_file() {
  local basename="$1" config_name="$2" captioner_model="$3" run_number="$4" mode="$5" port="$6" is_comparison="$7"
  
  # Determine captioner output directory based on whether this is comparison data
  if [[ "$is_comparison" == "true" ]]; then
    local captioner_output_dir="$captioner_model"
    (( run_number > 1 )) && captioner_output_dir+="-run-$run_number"
    local captioner_input_file="$PROJECT_ROOT/comps_outputs/$captioner_output_dir/$config_name/${basename}.mmif"
    
    # Setup llama output directory
    local llama_output_dir="llama/$captioner_model"
    (( run_number > 1 )) && llama_output_dir+="-run-$run_number"
    local output_dir="$PROJECT_ROOT/comps_outputs/$llama_output_dir/$config_name"
  else
    local captioner_output_dir="$captioner_model"
    (( run_number > 1 )) && captioner_output_dir+="-run-$run_number"
    local captioner_input_file="$PROJECT_ROOT/output/$captioner_output_dir/$config_name/${basename}.mmif"
    
    # Setup llama output directory
    local llama_output_dir="llama/$captioner_model"
    (( run_number > 1 )) && llama_output_dir+="-run-$run_number"
    local output_dir="$PROJECT_ROOT/output/$llama_output_dir/$config_name"
  fi
  
  # Check if captioner output exists
  if [[ ! -f "$captioner_input_file" ]]; then
    echo "[WARN] Captioner input file not found: $captioner_input_file"
    return 0
  fi
  
  local output_file="$output_dir/${basename}.mmif"
  
  mkdir -p "$output_dir"
  
  # Determine which llama config to use based on captioner model
  local llama_config
  if [[ "$captioner_model" == "llava" ]]; then
    llama_config="iasa-hichy-chyron-llava"
  else
    llama_config="iasa-hichy-chyron-smolvlm2"
  fi
  
  # Ensure config file exists
  local config_path="$LLAMA_ROOT/config/$llama_config.yaml"
  if [[ ! -f "$config_path" ]]; then
    echo "[WARN] Skipping missing llama config: $config_path" >&2
    return 0
  fi

  if [[ "$mode" == "cli" ]]; then
    if [[ ! -s "$output_file" ]]; then
      echo "[INFO] Running llama processing: $basename ($config_name -> $captioner_model, run $run_number) [COMPARISON: $is_comparison]"
      start_time=$(date +%s)
      
      (cd "$LLAMA_ROOT" && "$LLAMA_ROOT/.venv/bin/python" "$LLAMA_ROOT/cli.py" --config "config/$llama_config.yaml" "$captioner_input_file") > "$output_file"
      
      status=$?
      end_time=$(date +%s)
      echo "llama,$basename,$mode,3,$((end_time-start_time))" >> "$output_dir/timing.log"
      if (( status != 0 )); then
        echo "Error: Llama processing failed: $basename ($config_name -> $captioner_model, run $run_number)" >&2
        rm -f "$output_file"
        return 1
      fi
    else
      echo "[INFO] Skipping existing llama output: $basename ($config_name -> $captioner_model, run $run_number) [COMPARISON: $is_comparison]"
    fi
  else
    if [[ ! -s "$output_file" ]]; then
      echo "[INFO] Posting to llama service: $basename ($config_name -> $captioner_model) [COMPARISON: $is_comparison]"
      start_time=$(date +%s)
      
      curl -s --fail-with-body -H "Accept: application/json" -X POST -d@"$captioner_input_file" "http://localhost:$port?config=config/$llama_config.yaml" > "$output_file"
      
      status=$?
      end_time=$(date +%s)
      echo "llama,$basename,$mode,3,$((end_time-start_time))" >> "$output_dir/timing.log"
      if (( status != 0 )); then
        echo "Error: Llama service request failed: $basename ($config_name -> $captioner_model)" >&2
        rm -f "$output_file"
        return 1
      fi
    else
      echo "[INFO] Skipping existing llama output: $basename ($config_name -> $captioner_model) [COMPARISON: $is_comparison]"
    fi
  fi
}

# Function to process llama with doctr files
process_llama_doctr_file() {
  local basename="$1" run_number="$2" mode="$3" port="$4"
  
  local doctr_input_file="$DOCTR_INPUT_DIR/${basename}.mmif"
  
  # Setup llama output directory for doctr
  local llama_output_dir="llama/doctr"
  (( run_number > 1 )) && llama_output_dir+="-run-$run_number"
  local output_dir="$PROJECT_ROOT/output/$llama_output_dir"
  
  # Check if doctr input exists
  if [[ ! -f "$doctr_input_file" ]]; then
    echo "[WARN] Doctr input file not found: $doctr_input_file"
    return 0
  fi
  
  local output_file="$output_dir/${basename}.mmif"
  
  mkdir -p "$output_dir"
  
  # Use the llava config for doctr processing
  local llama_config="iasa-hichy-chyron-llava"
  
  # Ensure config file exists
  local config_path="$LLAMA_ROOT/config/$llama_config.yaml"
  if [[ ! -f "$config_path" ]]; then
    echo "[WARN] Skipping missing llama config: $config_path" >&2
    return 0
  fi

  if [[ "$mode" == "cli" ]]; then
    if [[ ! -s "$output_file" ]]; then
      echo "[INFO] Running llama doctr processing: $basename (run $run_number)"
      start_time=$(date +%s)
      
      (cd "$LLAMA_ROOT" && "$LLAMA_ROOT/.venv/bin/python" "$LLAMA_ROOT/cli.py" --config "config/$llama_config.yaml" "$doctr_input_file") > "$output_file"
      
      status=$?
      end_time=$(date +%s)
      echo "llama-doctr,$basename,$mode,3,$((end_time-start_time))" >> "$output_dir/timing.log"
      if (( status != 0 )); then
        echo "Error: Llama doctr processing failed: $basename (run $run_number)" >&2
        rm -f "$output_file"
        return 1
      fi
    else
      echo "[INFO] Skipping existing llama doctr output: $basename (run $run_number)"
    fi
  else
    if [[ ! -s "$output_file" ]]; then
      echo "[INFO] Posting to llama service for doctr: $basename"
      start_time=$(date +%s)
      
      curl -s --fail-with-body -H "Accept: application/json" -X POST -d@"$doctr_input_file" "http://localhost:$port?config=config/$llama_config.yaml" > "$output_file"
      
      status=$?
      end_time=$(date +%s)
      echo "llama-doctr,$basename,$mode,3,$((end_time-start_time))" >> "$output_dir/timing.log"
      if (( status != 0 )); then
        echo "Error: Llama doctr service request failed: $basename" >&2
        rm -f "$output_file"
        return 1
      fi
    else
      echo "[INFO] Skipping existing llama doctr output: $basename"
    fi
  fi
}

# Setup comparison MMIF files
setup_comparison_mmifs

# Phase 1: Run captioner models (LLaVA and SmolVLM2) in parallel for main dataset
echo "Starting captioner processing phase for main dataset"
for (( run=1; run<=NUM_RUNS; run++ )); do
  for basename in "${VIDEO_FILES[@]}"; do
    # Process both captioner models in parallel for each video file
    (for cfg in "${CONFIGS[@]}"; do
       process_captioner_file "$basename" "$cfg" "llava" "$run" "$MODE" "$LLAVA_PORT" "false"
     done) & pid_llava=$!

    (for cfg in "${CONFIGS[@]}"; do
       process_captioner_file "$basename" "$cfg" "smol-vlm2" "$run" "$MODE" "$SMOLVLM2_PORT" "false"
     done) & pid_smol=$!

    wait "$pid_llava"
    llava_status=$?
    wait "$pid_smol"
    smol_status=$?
    
    if (( llava_status != 0 )); then
      echo "[ERROR] LLAVA processing failed for $basename with exit code $llava_status"
    fi
    if (( smol_status != 0 )); then
      echo "[ERROR] SmolVLM2 processing failed for $basename with exit code $smol_status"
    fi
  done
done

# Phase 1b: Run captioner models for comparison dataset
if [[ ${#COMP_VIDEO_FILES[@]} -gt 0 ]]; then
  echo "Starting captioner processing phase for comparison dataset"
  for (( run=1; run<=NUM_RUNS; run++ )); do
    for basename in "${COMP_VIDEO_FILES[@]}"; do
      # Process both captioner models in parallel for each comparison video file
      (for cfg in "${CONFIGS[@]}"; do
         process_captioner_file "$basename" "$cfg" "llava" "$run" "$MODE" "$LLAVA_PORT" "true"
       done) & pid_llava=$!

      (for cfg in "${CONFIGS[@]}"; do
         process_captioner_file "$basename" "$cfg" "smol-vlm2" "$run" "$MODE" "$SMOLVLM2_PORT" "true"
       done) & pid_smol=$!

      wait "$pid_llava"
      llava_status=$?
      wait "$pid_smol"
      smol_status=$?
      
      if (( llava_status != 0 )); then
        echo "[ERROR] LLAVA processing failed for comparison $basename with exit code $llava_status"
      fi
      if (( smol_status != 0 )); then
        echo "[ERROR] SmolVLM2 processing failed for comparison $basename with exit code $smol_status"
      fi
    done
  done
fi

# Phase 2: Run Llama processing on captioner outputs for main dataset
echo "Starting Llama processing phase for main dataset"
for (( run=1; run<=NUM_RUNS; run++ )); do
  for basename in "${VIDEO_FILES[@]}"; do
    for config_name in "${CONFIGS[@]}"; do
      # Process llama for each captioner model output
      for captioner_model in "${CAPTIONER_MODELS[@]}"; do
        process_llama_file "$basename" "$config_name" "$captioner_model" "$run" "$MODE" "$LLAMA_PORT" "false"
      done
    done
  done
done

# Phase 2b: Run Llama processing on captioner outputs for comparison dataset
if [[ ${#COMP_VIDEO_FILES[@]} -gt 0 ]]; then
  echo "Starting Llama processing phase for comparison dataset"
  for (( run=1; run<=NUM_RUNS; run++ )); do
    for basename in "${COMP_VIDEO_FILES[@]}"; do
      for config_name in "${CONFIGS[@]}"; do
        # Process llama for each captioner model output
        for captioner_model in "${CAPTIONER_MODELS[@]}"; do
          process_llama_file "$basename" "$config_name" "$captioner_model" "$run" "$MODE" "$LLAMA_PORT" "true"
        done
      done
    done
  done
fi

# Phase 3: Run Llama processing on doctr files
if [[ ${#DOCTR_VIDEO_FILES[@]} -gt 0 ]]; then
  echo "Starting Llama processing phase for doctr dataset"
  for (( run=1; run<=NUM_RUNS; run++ )); do
    for basename in "${DOCTR_VIDEO_FILES[@]}"; do
      process_llama_doctr_file "$basename" "$run" "$MODE" "$LLAMA_PORT"
    done
  done
fi

echo "All processing complete."
