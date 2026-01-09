#!/bin/bash

PROJECT_ROOT="$(pwd)"
LLAMA_ROOT="/home/kmlynch/clams_apps/app-llama-video-summarizer"

# Test with one file
basename="cpb-aacip-058a21352e3"
captioner_cfg="hi-chy-annotator_instructions-4"

llava_input_file="$PROJECT_ROOT/output/llava/$captioner_cfg/${basename}.mmif"
output_dir="$PROJECT_ROOT/output/llama/$captioner_cfg"
output_file="$output_dir/${basename}.mmif"

echo "Input file: $llava_input_file"
echo "Output file: $output_file"

if [[ -f "$llava_input_file" ]]; then
    echo "Input file exists"
    mkdir -p "$output_dir"
    echo "Running llama processing..."
    (cd "$LLAMA_ROOT" && "$LLAMA_ROOT/.venv/bin/python" "$LLAMA_ROOT/cli.py" --config "config/iasa-hichy-chyron-llava.yaml" "$llava_input_file") > "$output_file"
    echo "Exit status: $?"
    echo "Output file size: $(wc -c < "$output_file" 2>/dev/null || echo "0") bytes"
else
    echo "Input file not found!"
fi