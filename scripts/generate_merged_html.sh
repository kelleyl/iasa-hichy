#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

# Base directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$PROJECT_ROOT/output"
METRICS_DIR="$PROJECT_ROOT/metrics"
MERGED_HTML_DIR="$PROJECT_ROOT/merged_html"
GOLD_FILE="$PROJECT_ROOT/hi-chy/img_arr_prog_2_I-transcribed.json"

# Create merged HTML directory
mkdir -p "$MERGED_HTML_DIR"

echo "Generating merged HTML reports..."

# Collect all unique MMIF filenames and all model/config combinations
declare -A mmif_files
declare -A model_configs

# Find all MMIF files and model/config combinations
for model_dir in "$OUTPUT_DIR"/*; do
    [[ -d "$model_dir" ]] || continue
    model_name=$(basename "$model_dir")
    
    for config_dir in "$model_dir"/*; do
        [[ -d "$config_dir" ]] || continue
        config_name=$(basename "$config_dir")
        
        # Store model/config combination
        model_configs["$model_name/$config_name"]=1
        
        # Find MMIF files in this config
        for mmif in "$config_dir"/*.mmif; do
            [[ -f "$mmif" ]] || continue
            filename=$(basename "$mmif" .mmif)
            mmif_files["$filename"]=1
        done
    done
done

echo "Found ${#mmif_files[@]} unique MMIF files"
echo "Found ${#model_configs[@]} model/config combinations"

# Generate merged HTML for each MMIF file
for mmif_filename in "${!mmif_files[@]}"; do
    echo "Processing MMIF: $mmif_filename"
    
    # Find which model/configs have metrics for this MMIF
    declare -A available_models
    for model_config in "${!model_configs[@]}"; do
        model_name="${model_config%/*}"
        config_name="${model_config#*/}"
        metrics_file="$METRICS_DIR/$model_name/$config_name/$mmif_filename.metrics.json"
        
        if [[ -f "$metrics_file" && -s "$metrics_file" ]]; then
            available_models["$model_config"]=1
        fi
    done
    
    if [[ ${#available_models[@]} -eq 0 ]]; then
        echo "  ⚠️  No metrics found for $mmif_filename, skipping"
        continue
    fi
    
    echo "  Found metrics for ${#available_models[@]} model/configs"
    
    # Generate merged HTML file
    merged_html_file="$MERGED_HTML_DIR/$mmif_filename.html"
    
    cat > "$merged_html_file" <<EOF
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Merged Results – $mmif_filename</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
    .container { max-width: 95vw; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
    .overall-metrics { background:#f8f8f8; padding:20px; margin-bottom:30px; border:1px solid #ddd; border-radius:5px; }
    .model-section { padding:15px; margin:10px 0; background:#fff; border:1px solid #eee; border-radius:4px; }
    .model-header { font-weight:bold; margin-bottom:5px; border-bottom:2px solid #eee; }
    table { border-collapse:collapse; width:100%; margin-top:20px; }
    th, td { border:1px solid #ddd; padding:8px; vertical-align:top; text-align: left; font-size: 12px; }
    th { background:#f2f2f2; cursor: pointer; position: relative; }
    th:hover { background:#e6e6e6; }
    th::after { content: '↕'; position: absolute; right: 8px; color: #999; }
    th.sort-asc::after { content: '↑'; color: #4CAF50; }
    th.sort-desc::after { content: '↓'; color: #f44336; }
    .text-content { white-space:pre-wrap; font-family:monospace; max-width:200px; font-size: 11px; }
    .reference { background:#f8f8f8; padding:10px; border-left:4px solid #4CAF50; margin:10px 0; }
    .image-cell { text-align: center; }
    .frame-image { max-width: 150px; max-height: 100px; border: 1px solid #ddd; border-radius: 4px; }
    .image-not-found { color: #999; font-style: italic; }
    .sortable { cursor: pointer; }
    .metrics-cell { text-align: center; }
    .cer-wer { font-size: 10px; }
    .cer { color: #2196F3; }
    .wer { color: #FF9800; }
    .model-column { background: #f9f9f9; }
    .time-column { background: #f0f0f0; font-weight: bold; }
    .reference-column { background: #f8f8f8; }
    .image-column { background: #f5f5f5; }
  </style>
  <script>
    function sortTable(table, column, type) {
      const tbody = table.querySelector('tbody');
      const rows = Array.from(tbody.querySelectorAll('tr'));
      const header = table.querySelector('th:nth-child(' + (column + 1) + ')');
      
      // Remove existing sort classes
      table.querySelectorAll('th').forEach(th => {
        th.classList.remove('sort-asc', 'sort-desc');
      });
      
      // Determine sort direction
      const currentDir = header.classList.contains('sort-asc') ? 'desc' : 'asc';
      header.classList.add('sort-' + currentDir);
      
      // Sort rows
      rows.sort((a, b) => {
        let aVal = a.cells[column].textContent.trim();
        let bVal = b.cells[column].textContent.trim();
        
        if (type === 'number') {
          aVal = parseFloat(aVal) || 0;
          bVal = parseFloat(bVal) || 0;
        } else if (type === 'time') {
          aVal = parseInt(aVal) || 0;
          bVal = parseInt(bVal) || 0;
        }
        
        if (currentDir === 'asc') {
          return aVal > bVal ? 1 : -1;
        } else {
          return aVal < bVal ? 1 : -1;
        }
      });
      
      // Reorder rows
      rows.forEach(row => tbody.appendChild(row));
    }
  </script>
</head>
<body>
  <div class="container">
    <h1>$mmif_filename</h1>
    <h2>Merged Results - ${#available_models[@]} Models</h2>
    
    <div class="overall-metrics">
      <h3>Available Models</h3>
      <h4>Overall CER and WER</h4>
      <table style="border-collapse:collapse; margin-bottom:15px;">
        <tr>
          <th style='padding:4px 8px;'>Model/Config</th>
          <th style='padding:4px 8px;'>Metrics File</th>
          <th style='padding:4px 8px;'>CER</th>
          <th style='padding:4px 8px;'>WER</th>
        </tr>
EOF

    # Output overall CER and WER for each model/config
    for model_config in "${!available_models[@]}"; do
        model_name="${model_config%/*}"
        config_name="${model_config#*/}"
        metrics_file="$METRICS_DIR/$model_name/$config_name/$mmif_filename.metrics.json"
        cer="-"
        wer="-"
        if [[ -f "$metrics_file" ]]; then
            cer=$(jq -r '.overall.model1.cer // empty' "$metrics_file" 2>/dev/null)
            wer=$(jq -r '.overall.model1.wer // empty' "$metrics_file" 2>/dev/null)
            if [[ -n "$cer" ]]; then
                cer=$(awk "BEGIN {printf \"%.2f\", $cer * 100}")
            else
                cer="-"
            fi
            if [[ -n "$wer" ]]; then
                wer=$(awk "BEGIN {printf \"%.2f\", $wer * 100}")
            else
                wer="-"
            fi
        fi
        cat >> "$merged_html_file" <<EOF
        <tr>
          <td style='padding:4px 8px;'>$model_name / $config_name</td>
          <td style='padding:4px 8px;'>$mmif_filename.metrics.json</td>
          <td style='padding:4px 8px;'>$cer%</td>
          <td style='padding:4px 8px;'>$wer%</td>
        </tr>
EOF
    done

    cat >> "$merged_html_file" <<EOF
      </table>
      <ul>
EOF

    # List available models
    for model_config in "${!available_models[@]}"; do
        model_name="${model_config%/*}"
        config_name="${model_config#*/}"
        cat >> "$merged_html_file" <<EOF
        <li><strong>$model_name</strong> / <em>$config_name</em></li>
EOF
    done

    cat >> "$merged_html_file" <<EOF
      </ul>
    </div>
    
    <div style="overflow-x: auto;">
      <table id="resultsTable">
        <thead>
          <tr>
            <th onclick="sortTable(this.closest('table'), 0, 'time')" class="sortable time-column">Time (ms)</th>
            <th class="image-column">Image</th>
            <th onclick="sortTable(this.closest('table'), 2, 'text')" class="sortable reference-column">Reference Text</th>
EOF

    # Add columns for each model
    for model_config in "${!available_models[@]}"; do
        model_name="${model_config%/*}"
        config_name="${model_config#*/}"
        cat >> "$merged_html_file" <<EOF
            <th class="model-column">$model_name<br><small>$config_name</small></th>
            <th onclick="sortTable(this.closest('table'), $((3 + ${#available_models[@]} * 2)), 'number')" class="sortable metrics-cell">CER</th>
            <th onclick="sortTable(this.closest('table'), $((4 + ${#available_models[@]} * 2)), 'number')" class="sortable metrics-cell">WER</th>
EOF
    done

    cat >> "$merged_html_file" <<EOF
          </tr>
        </thead>
        <tbody>
EOF

    # Get all frame timestamps from the first available model
    first_model_config=""
    for model_config in "${!available_models[@]}"; do
        first_model_config="$model_config"
        break
    done
    
    if [[ -n "$first_model_config" ]]; then
        model_name="${first_model_config%/*}"
        config_name="${first_model_config#*/}"
        first_metrics_file="$METRICS_DIR/$model_name/$config_name/$mmif_filename.metrics.json"
        
        # Get all frame timestamps
        frame_timestamps=($(jq -r 'keys[] | select(startswith("frame_"))' "$first_metrics_file" | sort))
        
        # Process each frame
        for frame in "${frame_timestamps[@]}"; do
            time_ms=${frame#frame_}
            
            # Get reference text from first model (should be same across all)
            ref=$(jq -r ".$frame.model1.reference" "$first_metrics_file")
            
            # Get image from first model
            img_uri=$(jq -r ".\"$frame\".image" "$first_metrics_file")
            
            cat >> "$merged_html_file" <<EOF
          <tr>
            <td class="time-column">$time_ms</td>
            <td class="image-cell">
EOF

            if [[ "$img_uri" != "null" && -n "$img_uri" ]]; then
                cat >> "$merged_html_file" <<EOF
              <img src="$img_uri" alt="Frame ${time_ms}ms" class="frame-image" />
EOF
            else
                cat >> "$merged_html_file" <<EOF
              <div class="image-not-found">Image not found</div>
EOF
            fi

            cat >> "$merged_html_file" <<EOF
            </td>
            <td class="reference-column">
              <div class="reference">
                <div class="text-content">$ref</div>
              </div>
            </td>
EOF

            # Add data for each model
            for model_config in "${!available_models[@]}"; do
                model_name="${model_config%/*}"
                config_name="${model_config#*/}"
                metrics_file="$METRICS_DIR/$model_name/$config_name/$mmif_filename.metrics.json"
                
                # Get prediction and metrics for this model
                if [[ -f "$metrics_file" ]]; then
                    h1=$(jq -r ".$frame.model1.hypothesis" "$metrics_file" 2>/dev/null || echo "")
                    cer1=$(jq -r ".$frame.model1.cer" "$metrics_file" 2>/dev/null || echo "0")
                    wer1=$(jq -r ".$frame.model1.wer" "$metrics_file" 2>/dev/null || echo "0")
                    
                    # Format metrics as percentages
                    cer1_pct=$(awk "BEGIN {printf \"%.2f\", $cer1 * 100}" 2>/dev/null || echo "0.00")
                    wer1_pct=$(awk "BEGIN {printf \"%.2f\", $wer1 * 100}" 2>/dev/null || echo "0.00")
                else
                    h1=""
                    cer1_pct="0.00"
                    wer1_pct="0.00"
                fi

                cat >> "$merged_html_file" <<EOF
            <td class="model-column">
              <div class="text-content">$h1</div>
            </td>
            <td class="metrics-cell">
              <div class="cer-wer">
                <span class="cer">$cer1_pct%</span>
              </div>
            </td>
            <td class="metrics-cell">
              <div class="cer-wer">
                <span class="wer">$wer1_pct%</span>
              </div>
            </td>
EOF
            done

            cat >> "$merged_html_file" <<EOF
          </tr>
EOF
        done
    fi

    cat >> "$merged_html_file" <<EOF
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
EOF

    echo "  → Merged HTML at: $merged_html_file"
done

echo "All done. Merged HTML reports under merged_html/" 