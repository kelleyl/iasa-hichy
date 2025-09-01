#!/bin/bash
set -euo pipefail
shopt -s nullglob

# Base directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
EVAL_ROOT="/home/kmlynch/clams_apps/aapb-evaluations"
GOLD_DIR="/home/kmlynch/clams_apps/aapb-annotations/understanding-chyrons/golds"

# Parse command line arguments
PIPELINE_OUTPUT_DIR=""
RESULTS_DIR=""

show_usage() {
    echo "Usage: $0 <pipeline_output_dir> <results_dir>"
    echo ""
    echo "Arguments:"
    echo "  pipeline_output_dir  Directory containing pipeline outputs (e.g., output/ or comps_outputs/)"
    echo "  results_dir          Directory to store generated results and summaries"
    echo ""
    echo "Example:"
    echo "  $0 output results"
    echo "  $0 comps_outputs comps_results"
}

if [[ $# -ne 2 ]]; then
    show_usage
    exit 1
fi

PIPELINE_OUTPUT_DIR="$PROJECT_ROOT/$1"
RESULTS_DIR="$PROJECT_ROOT/$2"

if [[ ! -d "$PIPELINE_OUTPUT_DIR" ]]; then
    echo "Error: Pipeline output directory does not exist: $PIPELINE_OUTPUT_DIR"
    exit 1
fi

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

echo "Pipeline output directory: $PIPELINE_OUTPUT_DIR"
echo "Results directory: $RESULTS_DIR"
echo "Configs to process: ${CONFIGS[*]}"
echo

# Function to determine which evaluation module to use based on model type
get_evaluation_module() {
    local model_name="$1"
    if [[ "$model_name" == "llama" || "$model_name" == "gptoss" ]]; then
        echo "KeyedInformationExtraction"
    else
        echo "TextRecognition"
    fi
}

# Function to extract metrics from evaluation results
extract_metrics() {
    local eval_file="$1"
    local model_name="$2"
    local config_name="$3"
    
    if [[ ! -f "$eval_file" ]]; then
        echo "Warning: Evaluation file not found: $eval_file"
        return 1
    fi
    
    # Extract the average metrics line
    local avg_line=$(grep "^Average," "$eval_file" || echo "")
    if [[ -z "$avg_line" ]]; then
        echo "Warning: No average metrics found in $eval_file"
        return 1
    fi
    
    # Parse the CSV line
    IFS=',' read -r -a fields <<< "$avg_line"
    
    # Output in a consistent format
    echo "$model_name,$config_name,${fields[1]},${fields[2]}"
}

# Function to run evaluation for a specific model/config
run_evaluation() {
    local model_name="$1"
    local config_name="$2"
    local input_dir="$3"
    local results_subdir="$4"
    
    local eval_module=$(get_evaluation_module "$model_name")
    local eval_file="$results_subdir/evaluation_results.md"
    
    # Skip if evaluation already exists
    if [[ -f "$eval_file" ]]; then
        echo "  ✓ Evaluation already exists: $eval_file"
        return 0
    fi
    
    echo "  Running $eval_module evaluation for $model_name/$config_name"
    
    # Create results directory
    mkdir -p "$results_subdir"
    
    # Run the appropriate evaluation
    if [[ "$eval_module" == "KeyedInformationExtraction" ]]; then
        python3 -m KeyedInformationExtraction.evaluate \
            -g "$GOLD_DIR" \
            -p "$input_dir" \
            -e "$eval_file" \
            -s
    else
        python3 -m TextRecognition.evaluate \
            -g "$GOLD_DIR" \
            -p "$input_dir" \
            -e "$eval_file" \
            -s
    fi
    
    echo "  ✓ Completed evaluation for $model_name/$config_name"
}

# Process each model directory in pipeline output
echo "Processing pipeline outputs..."
for model_dir in "$PIPELINE_OUTPUT_DIR"/*; do
    [[ -d "$model_dir" ]] || continue
    model_name=$(basename "$model_dir")
    echo "Processing model: $model_name"

    # Check if this is a nested model directory (like llama/llava, llama/smol-vlm2)
    if [[ "$model_name" == "llama" || "$model_name" == "gptoss" ]]; then
        # Process nested captioner models
        for captioner_dir in "$PIPELINE_OUTPUT_DIR/$model_name"/*; do
            [[ -d "$captioner_dir" ]] || continue
            captioner_name=$(basename "$captioner_dir")
            
            # Process each config
            for config_name in "${CONFIGS[@]}"; do
                input_dir="$PIPELINE_OUTPUT_DIR/$model_name/$captioner_name/$config_name"
                if [[ ! -d "$input_dir" ]]; then
                    echo "  Skipping non-existent config directory: $input_dir"
                    continue
                fi

                # Create corresponding results directory
                results_subdir="$RESULTS_DIR/$model_name/$captioner_name/$config_name"
                
                # Run evaluation
                run_evaluation "$model_name/$captioner_name" "$config_name" "$input_dir" "$results_subdir"
            done
        done
    else
        # Process direct model directories (like llava, smol-vlm2)
        for config_name in "${CONFIGS[@]}"; do
            input_dir="$PIPELINE_OUTPUT_DIR/$model_name/$config_name"
            if [[ ! -d "$input_dir" ]]; then
                echo "  Skipping non-existent config directory: $input_dir"
                continue
            fi

            # Create corresponding results directory
            results_subdir="$RESULTS_DIR/$model_name/$config_name"
            
            # Run evaluation
            run_evaluation "$model_name" "$config_name" "$input_dir" "$results_subdir"
        done
    fi
    echo
done

# Generate comparison summary
echo "Generating comparison summary..."
SUMMARY_FILE="$RESULTS_DIR/pipeline_comparison_summary.csv"

# Create header
echo "model,config,metric1,metric2" > "$SUMMARY_FILE"

# Extract metrics from all evaluation results
for model_dir in "$RESULTS_DIR"/*; do
    [[ -d "$model_dir" ]] || continue
    model_name=$(basename "$model_dir")
    
    # Check if this is a nested model directory
    if [[ "$model_name" == "llama" || "$model_name" == "gptoss" ]]; then
        # Process nested captioner models
        for captioner_dir in "$RESULTS_DIR/$model_name"/*; do
            [[ -d "$captioner_dir" ]] || continue
            captioner_name=$(basename "$captioner_dir")
            
            for config_name in "${CONFIGS[@]}"; do
                eval_file="$RESULTS_DIR/$model_name/$captioner_name/$config_name/evaluation_results.md"
                if [[ -f "$eval_file" ]]; then
                    extract_metrics "$eval_file" "$model_name/$captioner_name" "$config_name" >> "$SUMMARY_FILE"
                fi
            done
        done
    else
        # Process direct model directories
        for config_name in "${CONFIGS[@]}"; do
            eval_file="$RESULTS_DIR/$model_name/$config_name/evaluation_results.md"
            if [[ -f "$eval_file" ]]; then
                extract_metrics "$eval_file" "$model_name" "$config_name" >> "$SUMMARY_FILE"
            fi
        done
    fi
done

echo "✓ Comparison summary saved to: $SUMMARY_FILE"

# Generate detailed comparison report
echo "Generating detailed comparison report..."
REPORT_FILE="$RESULTS_DIR/pipeline_comparison_report.md"

cat > "$REPORT_FILE" << EOF
# Pipeline Comparison Report

Generated on: $(date)

## Overview
This report compares the performance of different pipeline configurations on the chyron recognition task.

## Pipeline Outputs Analyzed
- Source directory: \`$PIPELINE_OUTPUT_DIR\`
- Results directory: \`$RESULTS_DIR\`

## Evaluation Methods
- **TextRecognition**: Used for captioner models (llava, smol-vlm2)
- **KeyedInformationExtraction**: Used for summarizer models (llama, gptoss)

## Summary Metrics

EOF

# Add summary table
echo "| Model | Config | Metric 1 | Metric 2 |" >> "$REPORT_FILE"
echo "|-------|--------|----------|----------|" >> "$REPORT_FILE"

# Skip header line and add data
tail -n +2 "$SUMMARY_FILE" | while IFS=',' read -r model config metric1 metric2; do
    echo "| $model | $config | $metric1 | $metric2 |" >> "$REPORT_FILE"
done

cat >> "$REPORT_FILE" << EOF

## Detailed Results

EOF

# Add links to individual evaluation results
for model_dir in "$RESULTS_DIR"/*; do
    [[ -d "$model_dir" ]] || continue
    model_name=$(basename "$model_dir")
    
    # Check if this is a nested model directory
    if [[ "$model_name" == "llama" || "$model_name" == "gptoss" ]]; then
        echo "### $model_name" >> "$REPORT_FILE"
        
        # Process nested captioner models
        for captioner_dir in "$RESULTS_DIR/$model_name"/*; do
            [[ -d "$captioner_dir" ]] || continue
            captioner_name=$(basename "$captioner_dir")
            
            echo "#### $captioner_name" >> "$REPORT_FILE"
            
            for config_name in "${CONFIGS[@]}"; do
                eval_file="$RESULTS_DIR/$model_name/$captioner_name/$config_name/evaluation_results.md"
                if [[ -f "$eval_file" ]]; then
                    echo "- [$config_name](./$model_name/$captioner_name/$config_name/evaluation_results.md)" >> "$REPORT_FILE"
                fi
            done
            echo "" >> "$REPORT_FILE"
        done
    else
        echo "### $model_name" >> "$REPORT_FILE"
        
        for config_name in "${CONFIGS[@]}"; do
            eval_file="$RESULTS_DIR/$model_name/$config_name/evaluation_results.md"
            if [[ -f "$eval_file" ]]; then
                echo "- [$config_name](./$model_name/$config_name/evaluation_results.md)" >> "$REPORT_FILE"
            fi
        done
        echo "" >> "$REPORT_FILE"
    fi
done

echo "✓ Detailed comparison report saved to: $REPORT_FILE"

# Generate performance ranking
echo "Generating performance ranking..."
RANKING_FILE="$RESULTS_DIR/performance_ranking.md"

cat > "$RANKING_FILE" << EOF
# Performance Ranking

Generated on: $(date)

## Ranking by Metric 1 (Lower is Better)

EOF

# Sort by metric 1 (assuming it's the primary metric)
tail -n +2 "$SUMMARY_FILE" | sort -t',' -k3,3n | while IFS=',' read -r model config metric1 metric2; do
    echo "- **$model/$config**: $metric1" >> "$RANKING_FILE"
done

cat >> "$RANKING_FILE" << EOF

## Ranking by Metric 2 (Lower is Better)

EOF

# Sort by metric 2
tail -n +2 "$SUMMARY_FILE" | sort -t',' -k4,4n | while IFS=',' read -r model config metric1 metric2; do
    echo "- **$model/$config**: $metric2" >> "$RANKING_FILE"
done

echo "✓ Performance ranking saved to: $RANKING_FILE"

echo
echo "=== COMPARISON COMPLETE ==="
echo "Summary CSV: $SUMMARY_FILE"
echo "Detailed Report: $REPORT_FILE"
echo "Performance Ranking: $RANKING_FILE"
echo
echo "Individual evaluation results are available in: $RESULTS_DIR"
