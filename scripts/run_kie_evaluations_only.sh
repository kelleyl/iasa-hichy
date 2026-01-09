#!/bin/bash
set -euo pipefail
shopt -s nullglob

# Parse command line arguments
RERUN_ALL=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --rerun)
            RERUN_ALL=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--rerun]"
            echo "  --rerun    Rerun all KIE evaluations, even if output files already exist"
            echo "  -h, --help Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Base directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
EVAL_ROOT="/home/kmlynch/clams_apps/aapb-evaluations"
OUTPUT_DIR="$PROJECT_ROOT/output"
RESULTS_DIR="$PROJECT_ROOT/results"
GOLD_DIR="/home/kmlynch/clams_apps/aapb-annotations/understanding-chyrons/golds"

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

# Function to run KeyedInformationExtraction evaluation
run_keyed_info_eval() {
    local input_dir="$1"
    local model_name="$2"
    local config_name="$3"
    local output_file="$4"
    
    if [[ ! -d "$input_dir" ]]; then
        echo "Skipping non-existent directory: $input_dir"
        return
    fi
    
    # Check if evaluation already exists and skip if not rerunning
    if [[ "$RERUN_ALL" == "false" && -f "$output_file" ]]; then
        echo "Skipping KeyedInformationExtraction evaluation for $model_name/$config_name (output exists)"
        return
    fi
    
    echo "Running KeyedInformationExtraction evaluation for $model_name/$config_name"
    
    # Run with error handling - capture both stdout and stderr
    if python3 -m KeyedInformationExtraction.evaluate \
        -g "$GOLD_DIR" \
        -p "$input_dir" \
        -s > "$output_file" 2>&1; then
        echo "✓ Completed KeyedInformationExtraction evaluation for $model_name/$config_name"
        echo "  Results saved to: $output_file"
    else
        echo "✗ Failed KeyedInformationExtraction evaluation for $model_name/$config_name"
        echo "  Check $output_file for error details"
        echo "  Common issue: Gold and pred dictionaries have different keys"
    fi
    echo
}

# Run KeyedInformationExtraction evaluations for specific directories
echo "Running KeyedInformationExtraction evaluations..."

# Process subdirectories containing "4" in output/llava and output/smol-vlm2
for model_dir in "$OUTPUT_DIR"/llava "$OUTPUT_DIR"/smol-vlm2; do
    if [[ -d "$model_dir" ]]; then
        model_name=$(basename "$model_dir")
        echo "Processing $model_name for KeyedInformationExtraction..."
        
        # Find directories containing "4"
        for config_dir in "$model_dir"/*4*; do
            [[ -d "$config_dir" ]] || continue
            config_name=$(basename "$config_dir")
            
            # Create results directory
            results_subdir="$RESULTS_DIR/$model_name/$config_name"
            mkdir -p "$results_subdir"
            
            # Run KeyedInformationExtraction evaluation
            run_keyed_info_eval "$config_dir" "$model_name" "$config_name" "$results_subdir/keyed_info_results.md"
        done
    fi
done

# Process output/llama/doctr
if [[ -d "$OUTPUT_DIR/llama/doctr" ]]; then
    echo "Processing llama/doctr for KeyedInformationExtraction..."
    results_subdir="$RESULTS_DIR/llama/doctr"
    mkdir -p "$results_subdir"
    
    run_keyed_info_eval "$OUTPUT_DIR/llama/doctr" "llama" "doctr" "$results_subdir/keyed_info_results.md"
fi

# Process each sub-sub directory in output/llama (llava and smol-vlm2)
for subdir in llava smol-vlm2; do
    if [[ -d "$OUTPUT_DIR/llama/$subdir" ]]; then
        echo "Processing llama/$subdir for KeyedInformationExtraction..."
        
        # Process each config in the subdirectory
        for config_dir in "$OUTPUT_DIR/llama/$subdir"/*; do
            [[ -d "$config_dir" ]] || continue
            config_name=$(basename "$config_dir")
            
            # Create results directory
            results_subdir="$RESULTS_DIR/llama/$subdir/$config_name"
            mkdir -p "$results_subdir"
            
            # Run KeyedInformationExtraction evaluation
            run_keyed_info_eval "$config_dir" "llama/$subdir" "$config_name" "$results_subdir/keyed_info_results.md"
        done
    fi
done

# Run evaluations for comps_outputs directory
echo "Running KeyedInformationExtraction evaluations for comps_outputs directory..."

COMPS_OUTPUT_DIR="$PROJECT_ROOT/comps_outputs"
COMPS_RESULTS_DIR="$PROJECT_ROOT/comps_results"

# Create comps results directory
mkdir -p "$COMPS_RESULTS_DIR"

# Process subdirectories containing "4" in comps_outputs/llava and comps_outputs/smol-vlm2
for model_dir in "$COMPS_OUTPUT_DIR"/llava "$COMPS_OUTPUT_DIR"/smol-vlm2; do
    if [[ -d "$model_dir" ]]; then
        model_name=$(basename "$model_dir")
        echo "Processing comps $model_name for KeyedInformationExtraction..."
        
        # Find directories containing "4"
        for config_dir in "$model_dir"/*4*; do
            [[ -d "$config_dir" ]] || continue
            config_name=$(basename "$config_dir")
            
            # Create results directory
            results_subdir="$COMPS_RESULTS_DIR/$model_name/$config_name"
            mkdir -p "$results_subdir"
            
            # Run KeyedInformationExtraction evaluation
            run_keyed_info_eval "$config_dir" "$model_name" "$config_name" "$results_subdir/keyed_info_results.md"
        done
    fi
done

echo "All KeyedInformationExtraction evaluations completed!"
