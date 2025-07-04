#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

# Base directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
METRICS_DIR="$PROJECT_ROOT/metrics"
OUTPUT_FILE="$PROJECT_ROOT/overall_metrics_summary.json"

echo "Computing overall metrics across all files..."

# Initialize associative arrays to store cumulative metrics
declare -A total_cer
declare -A total_wer
declare -A total_cer_lower
declare -A total_wer_lower
declare -A frame_counts

# Find all model directories
for model_dir in "$METRICS_DIR"/*; do
    [[ -d "$model_dir" ]] || continue
    model_name=$(basename "$model_dir")
    
    # Find all config directories
    for config_dir in "$model_dir"/*; do
        [[ -d "$config_dir" ]] || continue
        config_name=$(basename "$config_dir")
        model_config="$model_name/$config_name"
        
        # Initialize counters for this model/config
        total_cer["$model_config"]=0
        total_wer["$model_config"]=0
        total_cer_lower["$model_config"]=0
        total_wer_lower["$model_config"]=0
        frame_counts["$model_config"]=0
        
        echo "Processing $model_config..."
        
        # Process all metrics files in this config
        for metrics_file in "$config_dir"/*.metrics.json; do
            [[ -f "$metrics_file" ]] || continue
            
            echo "  Processing $(basename "$metrics_file")"
            
            # Check for non-empty predictions
            has_nonempty_prediction=0
            # Extract all frame-level CER, WER, and prediction values
            while IFS=$'\t' read -r frame cer wer cer_lower wer_lower pred; do
                if [[ -n "$cer" && "$cer" != "null" && "$cer" != "0" ]]; then
                    total_cer["$model_config"]=$(awk "BEGIN {printf \"%.6f\", ${total_cer[$model_config]} + $cer}")
                    total_wer["$model_config"]=$(awk "BEGIN {printf \"%.6f\", ${total_wer[$model_config]} + $wer}")
                    total_cer_lower["$model_config"]=$(awk "BEGIN {printf \"%.6f\", ${total_cer_lower[$model_config]} + $cer_lower}")
                    total_wer_lower["$model_config"]=$(awk "BEGIN {printf \"%.6f\", ${total_wer_lower[$model_config]} + $wer_lower}")
                    frame_counts["$model_config"]=$((frame_counts["$model_config"] + 1))
                fi
                if [[ -n "$pred" ]]; then
                    has_nonempty_prediction=1
                fi
            done < <(jq -r 'to_entries[] | select(.key | startswith("frame_")) | [.key, .value.model1.cer, .value.model1.wer, .value.model1.cer_lower, .value.model1.wer_lower, .value.model1.prediction // ""] | @tsv' "$metrics_file" 2>/dev/null || true)
            if [[ $has_nonempty_prediction -eq 0 ]]; then
                echo "WARNING: No non-empty predictions found in $metrics_file" >&2
            fi
        done
    done
done

# Compute averages and generate output
echo "Computing averages and generating summary..."

# Start JSON output
cat > "$OUTPUT_FILE" <<EOF
{
  "summary": {
    "total_models": ${#total_cer[@]},
    "computation_method": "frame-level averaging across all files",
    "generated_at": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  },
  "models": {
EOF

first_model=true
for model_config in "${!total_cer[@]}"; do
    model_name="${model_config%/*}"
    config_name="${model_config#*/}"
    
    # Compute averages
    frame_count=${frame_counts["$model_config"]}
    if [[ $frame_count -gt 0 ]]; then
        avg_cer=$(awk "BEGIN {printf \"%.6f\", ${total_cer[$model_config]} / $frame_count}")
        avg_wer=$(awk "BEGIN {printf \"%.6f\", ${total_wer[$model_config]} / $frame_count}")
        avg_cer_lower=$(awk "BEGIN {printf \"%.6f\", ${total_cer_lower[$model_config]} / $frame_count}")
        avg_wer_lower=$(awk "BEGIN {printf \"%.6f\", ${total_wer_lower[$model_config]} / $frame_count}")
        
        # Format as percentages for display
        cer_pct=$(awk "BEGIN {printf \"%.2f\", $avg_cer * 100}")
        wer_pct=$(awk "BEGIN {printf \"%.2f\", $avg_wer * 100}")
        cer_lower_pct=$(awk "BEGIN {printf \"%.2f\", $avg_cer_lower * 100}")
        wer_lower_pct=$(awk "BEGIN {printf \"%.2f\", $avg_wer_lower * 100}")
    else
        avg_cer=0
        avg_wer=0
        avg_cer_lower=0
        avg_wer_lower=0
        cer_pct=0
        wer_pct=0
        cer_lower_pct=0
        wer_lower_pct=0
    fi
    
    # Add comma separator for JSON (except first entry)
    if [[ "$first_model" == "true" ]]; then
        first_model=false
    else
        echo "," >> "$OUTPUT_FILE"
    fi
    
    # Output model data
    cat >> "$OUTPUT_FILE" <<EOF
    "$model_config": {
      "model": "$model_name",
      "config": "$config_name",
      "total_frames": $frame_count,
      "average_cer": $avg_cer,
      "average_wer": $avg_wer,
      "average_cer_percent": $cer_pct,
      "average_wer_percent": $wer_pct,
      "average_cer_lower": $avg_cer_lower,
      "average_wer_lower": $avg_wer_lower,
      "average_cer_lower_percent": $cer_lower_pct,
      "average_wer_lower_percent": $wer_lower_pct
    }
EOF
    
    echo "  $model_config: CER=${cer_pct}%, WER=${wer_pct}%, CER_lower=${cer_lower_pct}%, WER_lower=${wer_lower_pct}% (${frame_count} frames)"
done

# Close JSON structure
cat >> "$OUTPUT_FILE" <<EOF
  }
}
EOF

echo ""
echo "Overall metrics summary saved to: $OUTPUT_FILE"
echo ""
echo "Summary by model:"
echo "================="

# Sort and display summary
for model_config in "${!total_cer[@]}"; do
    frame_count=${frame_counts["$model_config"]}
    if [[ $frame_count -gt 0 ]]; then
        avg_cer=$(awk "BEGIN {printf \"%.2f\", ${total_cer[$model_config]} * 100 / $frame_count}")
        avg_wer=$(awk "BEGIN {printf \"%.2f\", ${total_wer[$model_config]} * 100 / $frame_count}")
        avg_cer_lower=$(awk "BEGIN {printf \"%.2f\", ${total_cer_lower[$model_config]} * 100 / $frame_count}")
        avg_wer_lower=$(awk "BEGIN {printf \"%.2f\", ${total_wer_lower[$model_config]} * 100 / $frame_count}")
        printf "%-30s CER: %6.2f%%  WER: %6.2f%%  CER_lower: %6.2f%%  WER_lower: %6.2f%%  (%d frames)\n" "$model_config" "$avg_cer" "$avg_wer" "$avg_cer_lower" "$avg_wer_lower" "$frame_count"
    fi
done | sort

echo ""
echo "Done!" 