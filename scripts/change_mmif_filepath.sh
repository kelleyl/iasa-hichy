#!/bin/bash

# Directory containing MMIF files
MMIF_DIR="../mmif"

# Check if directory exists
if [ ! -d "$MMIF_DIR" ]; then
    echo "Error: Directory $MMIF_DIR not found"
    exit 1
fi

# Process each MMIF file
for file in "$MMIF_DIR"/*.mmif; do
    if [ -f "$file" ]; then
        echo "Processing $file..."
        # Create a backup of the original file
        cp "$file" "$file.bak"
        
        # Replace the file path pattern using sed
        # This replaces "file:///data/" with "file:///data/kmlynch/"
        sed -i 's|"file:///data/|"file:///data/kmlynch/|g' "$file"
        
        # Check if the sed command was successful
        if [ $? -eq 0 ]; then
            echo "Successfully updated $file"
            # Remove backup if successful
            rm "$file.bak"
        else
            echo "Error processing $file, restoring from backup"
            mv "$file.bak" "$file"
        fi
    fi
done

echo "All files processed"
