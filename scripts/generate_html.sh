#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

# Base directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$PROJECT_ROOT/output"
GOLD_FILE="$PROJECT_ROOT/hi-chy/img_arr_prog_2_I-transcribed.json"

for model_dir in "$OUTPUT_DIR"/*; do
    [[ -d "$model_dir" ]] || continue
    model_name=$(basename "$model_dir")
    echo "Processing model: $model_name"

    # Directly iterate over each config under this model
    for config_dir in "$model_dir"/*; do
        [[ -d "$config_dir" ]] || continue
        config_name=$(basename "$config_dir")
        echo "  Processing config: $config_name"

        # Preserve the sub‐path under OUTPUT_DIR
        REL_PATH=$(realpath --relative-to="$OUTPUT_DIR" "$config_dir")

        # Prepare metrics and HTML output dirs
        METRICS_DIR="$PROJECT_ROOT/metrics/$REL_PATH"
        HTML_DIR="$PROJECT_ROOT/html/$REL_PATH"
        mkdir -p "$METRICS_DIR" "$HTML_DIR"

        # Loop over each MMIF in this config
        for mmif in "$config_dir"/*.mmif; do
            [[ -f "$mmif" ]] || continue
            filename=$(basename "$mmif" .mmif)
            metrics_file="$METRICS_DIR/$filename.metrics.json"
            html_file="$HTML_DIR/$filename.html"

            echo "    Generating metrics and extracting frames for $filename..."
            python "$SCRIPT_DIR/calculate_metrics.py" \
                "$GOLD_FILE" "$mmif" > "$metrics_file"

            if [[ ! -s "$metrics_file" ]]; then
                echo "    ⚠️  No metrics for $filename, skipping HTML."
                continue
            fi

            echo "    Building HTML for $filename..."
            cat > "$html_file" <<EOF
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Results – $model_name / $config_name / $filename</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
    .container { max-width: 1600px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
    .overall-metrics { background:#f8f8f8; padding:20px; margin-bottom:30px; border:1px solid #ddd; border-radius:5px; }
    .model-section { padding:15px; margin:10px 0; background:#fff; border:1px solid #eee; border-radius:4px; }
    .model-header { font-weight:bold; margin-bottom:5px; border-bottom:2px solid #eee; }
    table { border-collapse:collapse; width:100%; margin-top:20px; }
    th, td { border:1px solid #ddd; padding:12px; vertical-align:top; text-align: left; }
    th { background:#f2f2f2; cursor: pointer; position: relative; }
    th:hover { background:#e6e6e6; }
    th::after { content: '↕'; position: absolute; right: 8px; color: #999; }
    th.sort-asc::after { content: '↑'; color: #4CAF50; }
    th.sort-desc::after { content: '↓'; color: #f44336; }
    .text-content { white-space:pre-wrap; font-family:monospace; max-width:300px; font-size: 12px; }
    .metrics { font-size:0.9em; color:#666; margin-top:5px; }
    .reference { background:#f8f8f8; padding:15px; border-left:4px solid #4CAF50; margin:15px 0; }
    .better-score { color:#4CAF50; font-weight:bold; }
    .worse-score { color:#f44336; font-weight:bold; }
    .image-cell { text-align: center; }
    .frame-image { max-width: 200px; max-height: 150px; border: 1px solid #ddd; border-radius: 4px; }
    .image-not-found { color: #999; font-style: italic; }
    .sortable { cursor: pointer; }
    .metrics-cell { text-align: center; }
    .cer-wer { font-size: 11px; }
    .cer { color: #2196F3; }
    .wer { color: #FF9800; }
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
    <h1>$filename</h1>
    <h2>Model: $model_name | Config: $config_name</h2>
EOF

            # overall numbers
            total=$(jq -r '.overall.total_instances' "$metrics_file")
            m1=$(jq -r '.overall.model1 | "CER: \(.cer*100|round/100)%, WER: \(.wer*100|round/100)%"' "$metrics_file")

            cat >> "$html_file" <<EOF
    <div class="overall-metrics">
      <h2>Overall Results</h2>
      <p><strong>Total Images Processed:</strong> $total</p>
      <div class="model-section"><div class="model-header">Model 1</div><p>$m1</p></div>
    </div>
    <table id="resultsTable">
      <thead>
        <tr>
          <th onclick="sortTable(this.closest('table'), 0, 'text')" class="sortable">Original Image</th>
          <th onclick="sortTable(this.closest('table'), 1, 'text')" class="sortable">Reference Text</th>
          <th onclick="sortTable(this.closest('table'), 2, 'text')" class="sortable">Model Output</th>
          <th onclick="sortTable(this.closest('table'), 3, 'number')" class="sortable">CER</th>
          <th onclick="sortTable(this.closest('table'), 4, 'number')" class="sortable">WER</th>
        </tr>
      </thead>
      <tbody>
EOF

            # per‐frame breakdown
            for frame in $(jq -r 'keys[] | select(startswith("frame_"))' "$metrics_file" | sort); do
                time_ms=${frame#frame_}
                ref=$(jq -r ".$frame.model1.reference" "$metrics_file")
                h1=$(jq -r ".$frame.model1.hypothesis" "$metrics_file")
                cer1=$(jq -r ".$frame.model1.cer" "$metrics_file")
                wer1=$(jq -r ".$frame.model1.wer" "$metrics_file")
                
                # Format metrics as percentages
                cer1_pct=$(awk "BEGIN {printf \"%.2f\", $cer1 * 100}")
                wer1_pct=$(awk "BEGIN {printf \"%.2f\", $wer1 * 100}")

                frame_key=$frame
                img_uri=$(jq -r ".\"$frame_key\".image" "$metrics_file")
                if [[ "$img_uri" != "null" && -n "$img_uri" ]]; then
                    cat >> "$html_file" <<EOF
        <tr>
          <td class="image-cell">
            <img src="$img_uri" alt="Frame ${time_ms}ms" class="frame-image" />
          </td>
          <td>
            <div class="reference">
              <div class="text-content">$ref</div>
            </div>
          </td>
          <td>
            <div class="model-section">
              <div class="text-content">$h1</div>
            </div>
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
        </tr>
EOF
                else
                    echo "    <!-- no image for $frame_key -->" >> "$html_file"
                    cat >> "$html_file" <<EOF
        <tr>
          <td class="image-cell">
            <div class="image-not-found">Image not found</div>
          </td>
          <td>
            <div class="reference">
              <div class="text-content">$ref</div>
            </div>
          </td>
          <td>
            <div class="model-section">
              <div class="text-content">$h1</div>
            </div>
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
        </tr>
EOF
                fi
            done

            cat >> "$html_file" <<EOF
      </tbody>
    </table>
  </div>
</body>
</html>
EOF

            echo "    → HTML at: $html_file"
        done

        echo "  ✔ Finished $config_name"
    done

    echo "✔ Finished model $model_name"
done

echo "All done. Metrics under metrics/, HTML under html/." 
