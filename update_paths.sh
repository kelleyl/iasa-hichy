#!/bin/bash

MMIF_DIR="mmif"
search_dirs=(
  "/llc_data/clams/hichy-evaluation-dataset/videos/250717/hi-chy-comps/"
  "/llc_data/clams/hichy-evaluation-dataset/videos/250717/hi-chy-hi/"
)

for file in "$MMIF_DIR"/*.mmif; do
  [ -f "$file" ] || continue
  echo "Processing $file…"
  cp "$file" "$file.bak"
  temp_file=$(mktemp)
  replaced=0

  while IFS= read -r line || [[ -n $line ]]; do
    if [[ $replaced -eq 0 ]] && [[ $line =~ \"file:///data/([^.\"]+)\.mp4\" ]]; then
      guid="${BASH_REMATCH[1]}"
      # find full path
      found_path=""
      for dir in "${search_dirs[@]}"; do
        if [ -f "${dir}${guid}.mp4" ]; then
          found_path="${dir}${guid}.mp4"
          break
        fi
      done

      if [[ -n $found_path ]]; then
        # replace *only this first* occurrence
        printf '%s\n' "${line/\"file:\/\/\/data\/${guid}.mp4\"/\"file://${found_path}\"}"
        replaced=1
      else
        printf '%s\n' "$line"
      fi
    else
      printf '%s\n' "$line"
    fi
  done < "$file" > "$temp_file"

  if mv "$temp_file" "$file"; then
    echo "✔ Updated $file"
    rm "$file.bak"
  else
    echo "✖ Failed, restoring $file"
    mv "$file.bak" "$file"
    rm -f "$temp_file"
  fi
done
