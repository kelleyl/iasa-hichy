#!/bin/bash
set -euo pipefail
shopt -s nullglob

# Set CUDA devices - only GPU 0 is visible
export CUDA_VISIBLE_DEVICES=0
# Ensure Flash Attention can find torch libs
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/kmlynch/clams_apps/app-smolvlm2-captioner/.venv/lib/python3.10/site-packages/torch/lib

# Set directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
MMIF_INPUT_DIR="$PROJECT_ROOT/mmif"
COMP_MMIF_DIR="$PROJECT_ROOT/comps_mmif"
COMP_MMIF_SOURCE="/llc_data/clams/hichy-evaluation-dataset/mmifs-from-swt"

# Updated to match your requested structure: results/ and comps_results/
HAWAII_RESULTS_DIR="$PROJECT_ROOT/results"
COMPS_RESULTS_DIR="$PROJECT_ROOT/comps_results"

SMOLVLM2_ROOT="/home/kmlynch/clams_apps/app-smolvlm2-captioner"

# Ensure directories exist
mkdir -p "$COMP_MMIF_DIR"
mkdir -p "$HAWAII_RESULTS_DIR"
mkdir -p "$COMPS_RESULTS_DIR"

setup_comparison_mmifs() {
  echo "Setting up comparison MMIF files..."
  if [[ ! -d "$COMP_MMIF_SOURCE" ]]; then return 0; fi
  for mmif_path in "$COMP_MMIF_SOURCE"/*hi-chy-comps*.mmif; do
    if [[ -f "$mmif_path" ]]; then
      filename=$(basename "$mmif_path")
      new_path="$COMP_MMIF_DIR/${filename%%_*}.mmif"
      if [[ ! -f "$new_path" ]]; then
        sed 's|file:///data/|file:///llc_data/clams/hichy-evaluation-dataset/videos/250717/hi-chy-comps/|g' "$mmif_path" > "$new_path"
      fi
    fi
  done
}

# Active Config
#declare -a CONFIGS=("owen39-cl1")
declare -a CONFIGS=("owen39-structured")

# Discover files
declare -a VIDEO_FILES=()
for mmif_path in "$MMIF_INPUT_DIR"/*_HI_pass2_candidates_1.mmif; do
  VIDEO_FILES+=($(basename "$mmif_path" "_HI_pass2_candidates_1.mmif"))
done

declare -a COMP_VIDEO_FILES=()
for mmif_path in "$COMP_MMIF_DIR"/*.mmif; do
  COMP_VIDEO_FILES+=($(basename "$mmif_path" ".mmif"))
done

process_captioner_file() {
  local basename="$1" config_name="$2" model_type="$3" is_comparison="$4"
  
  # Determine base results directory
  local base_out
  if [[ "$is_comparison" == "true" ]]; then
    base_out="$COMPS_RESULTS_DIR"
    local mmif_file="$COMP_MMIF_DIR/${basename}.mmif"
  else
    base_out="$HAWAII_RESULTS_DIR"
    local mmif_file="$MMIF_INPUT_DIR/${basename}_HI_pass2_candidates_1.mmif"
  fi
  
  # Path structure: [results/comps_results]/model_name/config_name/file.mmif
  local output_dir="$base_out/$model_type/$config_name"
  local output_file="$output_dir/${basename}.mmif"
  
  local app_venv="$SMOLVLM2_ROOT/.venv"
  local app_cli="$SMOLVLM2_ROOT/cli.py"

  mkdir -p "$output_dir"

  # -s checks if file exists and has size > 0
  if [[ ! -s "$output_file" ]]; then
    echo "[INFO] Running $model_type: $basename ($config_name) [COMPARISON: $is_comparison]"
    (cd "$SMOLVLM2_ROOT" && "$app_venv/bin/python" "$app_cli" --config "config/$config_name.yaml" --num_beams 3 "$mmif_file") > "$output_file"
    
    # Check if the output is actually valid or just an empty MMIF
    if [[ ! -s "$output_file" ]]; then
        echo "[ERROR] $basename produced an empty file. Check cli.py logs."
        rm -f "$output_file"
    fi
  else
    echo "[SKIP] $basename already exists in $output_dir"
  fi
}

# --- Execute ---
setup_comparison_mmifs

echo "Starting phase: Hawaii Dataset"
for basename in "${VIDEO_FILES[@]}"; do
  for cfg in "${CONFIGS[@]}"; do
    process_captioner_file "$basename" "$cfg" "smol-vlm2" "false"
  done
done

echo "Starting phase: Comparison Dataset"
for basename in "${COMP_VIDEO_FILES[@]}"; do
  for cfg in "${CONFIGS[@]}"; do
    process_captioner_file "$basename" "$cfg" "smol-vlm2" "true"
  done
done

echo "All processing complete."
