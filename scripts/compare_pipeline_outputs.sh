id #!/bin/bash
set -euo pipefail
shopt -s nullglob

# Base directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
EVAL_ROOT="/home/kmlynch/clams_apps/aapb-evaluations"
GOLD_DIR="/home/kmlynch/clams_apps/aapb-annotations/understanding-chyrons/golds"
CHYRON_ANNOTATIONS_DIR="/home/kmlynch/clams_apps/aapb-annotations/understanding-chyrons"

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

# Generate era-based analysis (pre/post 2000)
echo "Generating era-based analysis (pre/post 2000)..."
ERA_ANALYSIS_FILE="$RESULTS_DIR/era_analysis.md"

# Create Python script to perform era segmentation analysis
cat > "$RESULTS_DIR/era_segmentation.py" << 'PYTHON_EOF'
import json
import os
import sys
from collections import defaultdict
import glob

def load_era_datasets():
    """Load pre/post 2000 dataset segmentations."""
    base_path = '/home/kmlynch/clams_apps/aapb-annotations/understanding-chyrons'
    
    pre_2000_file = f'{base_path}/250606-hi-chy-hi-pre-2000/hi-chy-hi-pre-2000_img_labels.json'
    post_2000_file = f'{base_path}/250606-hi-chy-hi-post-2000/hi-chy-hi-post-2000_img_labels.json'
    
    def extract_basenames(json_file):
        with open(json_file, 'r') as f:
            data = json.load(f)
        return {os.path.splitext(entry[0])[0] for entry in data}
    
    pre_2000_basenames = extract_basenames(pre_2000_file)
    post_2000_basenames = extract_basenames(post_2000_file)
    
    return pre_2000_basenames, post_2000_basenames

def get_era(basename, pre_2000_set, post_2000_set):
    """Determine era for a given basename."""
    if basename in pre_2000_set:
        return "pre-2000"
    elif basename in post_2000_set:
        return "post-2000"
    else:
        return "unknown"

def parse_evaluation_file(eval_file):
    """Parse evaluation results file and extract metrics by basename."""
    results = {}
    
    with open(eval_file, 'r') as f:
        lines = f.readlines()
    
    # Find the start of the results table
    in_results = False
    for line in lines:
        line = line.strip()
        if line.startswith('|') and 'basename' in line.lower():
            in_results = True
            continue
        elif in_results and line.startswith('|') and not line.startswith('|---'):
            # Parse table row
            parts = [p.strip() for p in line.split('|')[1:-1]]  # Remove empty first/last
            if len(parts) >= 3:
                basename = parts[0]
                try:
                    metric1 = float(parts[1])
                    metric2 = float(parts[2])
                    results[basename] = (metric1, metric2)
                except (ValueError, IndexError):
                    continue
        elif in_results and not line.startswith('|'):
            break
    
    return results

def analyze_by_era(results_dir):
    """Analyze evaluation results segmented by era."""
    pre_2000_set, post_2000_set = load_era_datasets()
    
    era_stats = {
        'pre-2000': defaultdict(lambda: {'count': 0, 'metric1_sum': 0, 'metric2_sum': 0, 'metrics': []}),
        'post-2000': defaultdict(lambda: {'count': 0, 'metric1_sum': 0, 'metric2_sum': 0, 'metrics': []}),
        'unknown': defaultdict(lambda: {'count': 0, 'metric1_sum': 0, 'metric2_sum': 0, 'metrics': []})
    }
    
    # Find all evaluation result files
    eval_files = glob.glob(f"{results_dir}/**/evaluation_results.md", recursive=True)
    
    for eval_file in eval_files:
        # Extract model/config from path
        rel_path = os.path.relpath(eval_file, results_dir)
        path_parts = rel_path.split('/')
        
        if len(path_parts) >= 3:
            model_config = '/'.join(path_parts[:-1])  # Everything except evaluation_results.md
        else:
            model_config = os.path.dirname(rel_path)
        
        # Parse evaluation results
        results = parse_evaluation_file(eval_file)
        
        # Segment by era
        for basename, (metric1, metric2) in results.items():
            era = get_era(basename, pre_2000_set, post_2000_set)
            
            era_stats[era][model_config]['count'] += 1
            era_stats[era][model_config]['metric1_sum'] += metric1
            era_stats[era][model_config]['metric2_sum'] += metric2
            era_stats[era][model_config]['metrics'].append((metric1, metric2))
    
    return era_stats, len(pre_2000_set), len(post_2000_set)

def generate_era_report(results_dir, output_file):
    """Generate era-based analysis report."""
    era_stats, pre_2000_total, post_2000_total = analyze_by_era(results_dir)
    
    with open(output_file, 'w') as f:
        f.write("# Era-Based Performance Analysis (Pre/Post 2000)\n\n")
        f.write(f"Generated on: {os.popen('date').read().strip()}\n\n")
        
        f.write("## Dataset Overview\n\n")
        f.write(f"- **Pre-2000 Dataset**: {pre_2000_total} entries\n")
        f.write(f"- **Post-2000 Dataset**: {post_2000_total} entries\n")
        f.write(f"- **Total**: {pre_2000_total + post_2000_total} entries\n")
        f.write(f"- **Era Distribution**: {pre_2000_total/(pre_2000_total+post_2000_total)*100:.1f}% pre-2000, {post_2000_total/(pre_2000_total+post_2000_total)*100:.1f}% post-2000\n\n")
        
        # Generate summary for each era
        for era in ['pre-2000', 'post-2000']:
            f.write(f"## {era.title()} Performance\n\n")
            f.write("| Model/Config | Count | Avg Metric 1 | Avg Metric 2 |\n")
            f.write("|--------------|-------|--------------|-------------|\n")
            
            for model_config, stats in era_stats[era].items():
                if stats['count'] > 0:
                    avg_metric1 = stats['metric1_sum'] / stats['count']
                    avg_metric2 = stats['metric2_sum'] / stats['count']
                    f.write(f"| {model_config} | {stats['count']} | {avg_metric1:.3f} | {avg_metric2:.3f} |\n")
            
            f.write("\n")
        
        # Generate comparative analysis
        f.write("## Comparative Analysis\n\n")
        f.write("| Model/Config | Pre-2000 Avg M1 | Post-2000 Avg M1 | Difference | Pre-2000 Avg M2 | Post-2000 Avg M2 | Difference |\n")
        f.write("|--------------|------------------|-------------------|------------|------------------|-------------------|------------|\n")
        
        # Find common model/config combinations
        common_configs = set(era_stats['pre-2000'].keys()) & set(era_stats['post-2000'].keys())
        
        for model_config in common_configs:
            pre_stats = era_stats['pre-2000'][model_config]
            post_stats = era_stats['post-2000'][model_config]
            
            if pre_stats['count'] > 0 and post_stats['count'] > 0:
                pre_m1 = pre_stats['metric1_sum'] / pre_stats['count']
                post_m1 = post_stats['metric1_sum'] / post_stats['count']
                pre_m2 = pre_stats['metric2_sum'] / pre_stats['count']
                post_m2 = post_stats['metric2_sum'] / post_stats['count']
                
                diff_m1 = post_m1 - pre_m1
                diff_m2 = post_m2 - pre_m2
                
                f.write(f"| {model_config} | {pre_m1:.3f} | {post_m1:.3f} | {diff_m1:+.3f} | {pre_m2:.3f} | {post_m2:.3f} | {diff_m2:+.3f} |\n")
        
        f.write("\n")
        
        # Add interpretation notes
        f.write("## Analysis Notes\n\n")
        f.write("- **Positive Difference**: Post-2000 performance is worse (higher error rates)\n")
        f.write("- **Negative Difference**: Post-2000 performance is better (lower error rates)\n")
        f.write("- **Metric 1**: Typically Character Error Rate (CER)\n")
        f.write("- **Metric 2**: Typically Word Error Rate (WER)\n\n")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python era_segmentation.py <results_dir> <output_file>")
        sys.exit(1)
    
    results_dir = sys.argv[1]
    output_file = sys.argv[2]
    
    generate_era_report(results_dir, output_file)
    print(f"Era analysis report generated: {output_file}")
PYTHON_EOF

# Run the era segmentation analysis
python3 "$RESULTS_DIR/era_segmentation.py" "$RESULTS_DIR" "$ERA_ANALYSIS_FILE"

echo "✓ Era-based analysis saved to: $ERA_ANALYSIS_FILE"

echo
echo "=== COMPARISON COMPLETE ==="
echo "Summary CSV: $SUMMARY_FILE"
echo "Detailed Report: $REPORT_FILE"
echo "Performance Ranking: $RANKING_FILE"
echo "Era Analysis: $ERA_ANALYSIS_FILE"
echo
echo "Individual evaluation results are available in: $RESULTS_DIR"
