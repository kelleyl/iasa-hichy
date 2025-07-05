#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

# Base directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
METRICS_DIR="$PROJECT_ROOT/metrics"
OUTPUT_CSV="$PROJECT_ROOT/metrics_summary.csv"

# Create CSV header
echo "video_id,frame_id,model_name,run_number,config,hypothesis,reference,cer,cer_lower,wer_lower" > "$OUTPUT_CSV"

# Function to extract run number from directory name
extract_run_number() {
    local dirname="$1"
    if [[ "$dirname" =~ -run-([0-9]+)$ ]]; then
        echo "${BASH_REMATCH[1]}"
    else
        echo "1"
    fi
}

# Function to extract model name from directory name
extract_model_name() {
    local dirname="$1"
    if [[ "$dirname" =~ -run-[0-9]+$ ]]; then
        echo "${dirname%-run-*}"
    else
        echo "$dirname"
    fi
}

# Process each model directory
for model_dir in "$METRICS_DIR"/*; do
    [[ -d "$model_dir" ]] || continue
    model_name=$(extract_model_name "$(basename "$model_dir")")
    run_number=$(extract_run_number "$(basename "$model_dir")")
    
    echo "Processing model: $model_name (run $run_number)"

    # Process each config directory
    for config_dir in "$model_dir"/*; do
        [[ -d "$config_dir" ]] || continue
        config_name=$(basename "$config_dir")
        
        echo "  Processing config: $config_name"

        # Process each metrics file
        for metrics_file in "$config_dir"/*.metrics.json; do
            [[ -f "$metrics_file" ]] || continue
            video_id=$(basename "$metrics_file" .metrics.json)
            
            echo "    Processing video: $video_id"

            # Extract data from metrics file using jq
            jq -r --arg video_id "$video_id" \
                   --arg model_name "$model_name" \
                   --arg run_number "$run_number" \
                   --arg config_name "$config_name" '
                # Get all frame keys (excluding "overall") and process each frame
                to_entries[] | 
                select(.key | startswith("frame_")) | 
                .key as $frame_id |
                .value.model1 | 
                # Output CSV line
                [$video_id, $frame_id, $model_name, $run_number, $config_name, 
                 .hypothesis, .reference, .cer, .cer_lower, .wer_lower] | 
                @csv
            ' "$metrics_file" >> "$OUTPUT_CSV"
        done
    done
done

echo "CSV generation complete. Output saved to: $OUTPUT_CSV"
echo "Total lines in CSV: $(wc -l < "$OUTPUT_CSV")" 