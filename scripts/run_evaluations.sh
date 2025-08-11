#!/bin/bash
set -euo pipefail
shopt -s nullglob

# Base directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
EVAL_ROOT="/home/kmlynch/clams_apps/aapb-evaluations"
OUTPUT_DIR="$PROJECT_ROOT/output"
RESULTS_DIR="$PROJECT_ROOT/results"
GOLD_DIR="/home/kmlynch/clams_apps/aapb-annotations/understanding-chyrons/golds"

# Config files to run (only those with '3' in their name)
declare -a CONFIGS=(
  "hi-chy-annotator_instructions-3"
  "hi-chy-revised-3"
)

# Create results directory
mkdir -p "$RESULTS_DIR"

# Setup Python environment
if [[ ! -d "$EVAL_ROOT/.venv" ]]; then
    echo "Setting up Python virtual environment..."
    cd "$EVAL_ROOT"
    python3 -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
else
    source "$EVAL_ROOT/.venv/bin/activate"
fi

# Ensure we're in the evaluation directory for Python module imports
cd "$EVAL_ROOT"

# Process each model directory in output
for model_dir in "$OUTPUT_DIR"/*; do
    [[ -d "$model_dir" ]] || continue
    model_name=$(basename "$model_dir")
    echo "Processing model: $model_name"

    # Process each config that contains '3'
    for config_name in "${CONFIGS[@]}"; do
        input_dir="$OUTPUT_DIR/$model_name/$config_name"
        if [[ ! -d "$input_dir" ]]; then
            echo "Skipping non-existent config directory: $input_dir"
            continue
        fi

        # Create corresponding results directory
        results_subdir="$RESULTS_DIR/$model_name/$config_name"
        mkdir -p "$results_subdir"

        echo "Running evaluation for $model_name/$config_name"
        python3 -m TextRecognition.evaluate \
            -g "$GOLD_DIR" \
            -p "$input_dir" \
            -e "$results_subdir/evaluation_results.md" \
            -s

        echo "✓ Completed evaluation for $model_name/$config_name"
        echo "  Results saved to: $results_subdir/evaluation_results.md"
        echo
    done
done

echo "All evaluations complete. Results saved in: $RESULTS_DIR"
