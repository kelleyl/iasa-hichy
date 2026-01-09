#!/bin/bash
set -euo pipefail
shopt -s nullglob

# ==============================================================================
# CONFIGURATION & ENVIRONMENT
# ==============================================================================

# 1. Project Root (Where data inputs/outputs live)
# We assume this script is at /home/kmlynch/clams_apps/iasa-hichy/scripts/
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# 2. App Logic (Where the python code lives)
CLI_SCRIPT="/home/kmlynch/clams_apps/app-vlm-ocr/cli.py"

# 3. Environment (Where python and libraries live)
VENV_ROOT="/home/kmlynch/clams_apps/app-smolvlm2-captioner/.venv"
VENV_PYTHON="$VENV_ROOT/bin/python"

# Set CUDA devices - only GPU 0 is visible
export CUDA_VISIBLE_DEVICES=0

# Ensure Flash Attention can find torch libs in the captioner venv
# Note: Checks for python3.10 inside that specific venv
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VENV_ROOT/lib/python3.10/site-packages/torch/lib

# Data Directories (Inside iasa-hichy)
MMIF_INPUT_DIR="$PROJECT_ROOT/mmif"
COMP_MMIF_DIR="$PROJECT_ROOT/comps_mmif"
COMP_MMIF_SOURCE="/llc_data/clams/hichy-evaluation-dataset/mmifs-from-swt"

# Results Directories (Inside iasa-hichy)
HAWAII_RESULTS_DIR="$PROJECT_ROOT/results"
COMPS_RESULTS_DIR="$PROJECT_ROOT/comps_results"

# Ensure directories exist
mkdir -p "$COMP_MMIF_DIR"
mkdir -p "$HAWAII_RESULTS_DIR"
mkdir -p "$COMPS_RESULTS_DIR"

# ==============================================================================
# MODEL CONFIGURATION
# ==============================================================================

MODEL_NAME="rednote-hilab/dots.ocr"
MODEL_SHORTNAME="dots-ocr"
CONFIG_NAME="chyron-ocr"
TARGET_LABEL="chyron"

# ==============================================================================
# HELPER FUNCTIONS
# ==============================================================================

setup_comparison_mmifs() {
  echo "Setting up comparison MMIF files..."
  if [[ ! -d "$COMP_MMIF_SOURCE" ]]; then
    echo "Warning: Comparison source $COMP_MMIF_SOURCE not found. Skipping setup."
    return 0
  fi
  
  for mmif_path in "$COMP_MMIF_SOURCE"/*hi-chy-comps*.mmif; do
    if [[ -f "$mmif_path" ]]; then
      filename=$(basename "$mmif_path")
      new_path="$COMP_MMIF_DIR/${filename%%_*}.mmif"
      
      if [[ ! -f "$new_path" ]]; then
        # sed 's|file:///data/|file:///llc_data/clams/hichy-evaluation-dataset/videos/250717/hi-chy-comps/|g' "$mmif_path" > "$new_path"
        # Since we are cross-referencing apps, ensure we just copy or sed correctly.
        # Assuming the standard copy/sed from previous scripts:
        sed 's|file:///data/|file:///llc_data/clams/hichy-evaluation-dataset/videos/250717/hi-chy-comps/|g' "$mmif_path" > "$new_path"
      fi
    fi
  done
}

process_ocr_file() {
  local basename="$1" is_comparison="$2"
  
  local base_out
  local mmif_file
  
  if [[ "$is_comparison" == "true" ]]; then
    base_out="$COMPS_RESULTS_DIR"
    mmif_file="$COMP_MMIF_DIR/${basename}.mmif"
  else
    base_out="$HAWAII_RESULTS_DIR"
    mmif_file="$MMIF_INPUT_DIR/${basename}_HI_pass2_candidates_1.mmif"
  fi
  
  local output_dir="$base_out/$MODEL_SHORTNAME/$CONFIG_NAME"
  local output_file="$output_dir/${basename}.mmif"
  
  mkdir -p "$output_dir"

  if [[ ! -s "$output_file" ]]; then
    echo "[INFO] Running $MODEL_SHORTNAME: $basename [COMPARISON: $is_comparison]"
    
    APP_DIR=$(dirname "$CLI_SCRIPT")
    
    (
        cd "$APP_DIR" || exit
        # MOVED INPUT/OUTPUT TO THE FRONT
        "$VENV_PYTHON" "$CLI_SCRIPT" \
            "$mmif_file" "$output_file" \
            --config "config/$CONFIG_NAME.yaml" \
            --hfModel "$MODEL_NAME" \
            --tfLabel "$TARGET_LABEL"
    )
    
    if [[ ! -s "$output_file" ]]; then
        echo "[ERROR] $basename produced an empty file or failed."
        rm -f "$output_file"
    fi
  else
    echo "[SKIP] $basename already exists in $output_dir"
  fi
}

# ==============================================================================
# MAIN EXECUTION
# ==============================================================================

setup_comparison_mmifs

# Discover Hawaii Files
declare -a VIDEO_FILES=()
for mmif_path in "$MMIF_INPUT_DIR"/*_HI_pass2_candidates_1.mmif; do
  VIDEO_FILES+=($(basename "$mmif_path" "_HI_pass2_candidates_1.mmif"))
done

# Discover Comparison Files
declare -a COMP_VIDEO_FILES=()
for mmif_path in "$COMP_MMIF_DIR"/*.mmif; do
  COMP_VIDEO_FILES+=($(basename "$mmif_path" ".mmif"))
done

echo "=================================================="
echo "Starting phase: Hawaii Dataset"
echo "Found ${#VIDEO_FILES[@]} files."
echo "=================================================="
for basename in "${VIDEO_FILES[@]}"; do
    process_ocr_file "$basename" "false"
done

echo ""
echo "=================================================="
echo "Starting phase: Comparison Dataset"
echo "Found ${#COMP_VIDEO_FILES[@]} files."
echo "=================================================="
for basename in "${COMP_VIDEO_FILES[@]}"; do
    process_ocr_file "$basename" "true"
done

echo "All processing complete."
