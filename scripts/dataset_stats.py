#!/usr/bin/env python3
"""
Script to analyze chyron JSON files and calculate statistics.
Processes files in aapb-annotations/understanding-chyrons/golds/
"""

import json
import os
import glob
import re
import numpy as np
from pathlib import Path


def count_words(text):
    """Count words in text, handling newlines and multiple spaces."""
    return len(re.findall(r'\b\w+\b', text))


def analyze_chyron_file(filepath):
    """Analyze a single JSON file and return statistics."""
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # Count only non-null chyrons
    valid_chyrons = [c for c in data if c is not None]
    
    file_stats = {
        'total_chyrons': len(valid_chyrons),
        'total_chars_text': 0,
        'total_words_text': 0,
        'total_attributes': 0,
        'total_chars_attributes': 0,
        'name_lengths': [],  # List to store lengths of each name for std calculation
        'chyron_lengths': [],  # List to store lengths of each chyron for std calculation
        'only_names_count': 0  # Count of chyrons with only names (no attributes)
    }
    
    for chyron in data:
        # Skip null entries
        if chyron is None:
            continue
            
        # Analyze text-transcript
        text_transcript = chyron.get('text-transcript', '')
        text_length = len(text_transcript)
        file_stats['total_chars_text'] += text_length
        file_stats['total_words_text'] += count_words(text_transcript)
        file_stats['chyron_lengths'].append(text_length)
        
        # Analyze attributes
        keyed_info = chyron.get('keyed-information', {})
        if keyed_info is None:
            keyed_info = {}
        attributes = keyed_info.get('attributes', [])
        if attributes is None:
            attributes = []
        
        # Check if this is a name-only chyron (has text but no attributes)
        if text_length > 0 and len(attributes) == 0:
            file_stats['only_names_count'] += 1
            file_stats['name_lengths'].append(text_length)
            
        file_stats['total_attributes'] += len(attributes)
        
        for attr in attributes:
            if attr is not None:
                file_stats['total_chars_attributes'] += len(attr)
    
    return file_stats


def main():
    # Find all JSON files in the directory
    json_dir = Path("aapb-annotations/understanding-chyrons/golds")
    json_files = list(json_dir.glob("*.json"))
    
    if not json_files:
        print(f"No JSON files found in {json_dir}")
        return
    
    print(f"Analyzing {len(json_files)} JSON files...")
    print()
    
    # Aggregate statistics across all files
    total_stats = {
        'total_chyrons': 0,
        'total_chars_text': 0,
        'total_words_text': 0,
        'total_attributes': 0,
        'total_chars_attributes': 0,
        'name_lengths': [],  # List to store lengths of each name for std calculation
        'chyron_lengths': [],  # List to store lengths of each chyron for std calculation
        'only_names_count': 0  # Count of chyrons with only names (no attributes)
    }
    
    # Process each file
    for json_file in json_files:
        try:
            file_stats = analyze_chyron_file(json_file)
            
            # Add to totals
            for key in total_stats:
                if key in ['name_lengths', 'chyron_lengths']:
                    total_stats[key].extend(file_stats[key])
                else:
                    total_stats[key] += file_stats[key]
                
        except Exception as e:
            print(f"Error processing {json_file}: {e}")
            continue
    
    # Calculate averages
    total_chyrons = total_stats['total_chyrons']
    total_attributes = total_stats['total_attributes']
    
    if total_chyrons == 0:
        print("No chyrons found in any files.")
        return
    
    print("=== CHYRON ANALYSIS RESULTS ===")
    print(f"Total files processed: {len(json_files)}")
    print(f"Total chyrons: {total_chyrons}")
    print(f"Chyrons with only names (no attributes): {total_stats['only_names_count']}")
    print()
    print("=== PER CHYRON STATISTICS ===")
    print(f"Average characters per chyron: {total_stats['total_chars_text'] / total_chyrons:.2f}")
    print(f"Standard deviation of characters per chyron: {np.std(total_stats['chyron_lengths']):.2f}")
    print(f"Average words per chyron: {total_stats['total_words_text'] / total_chyrons:.2f}")
    print(f"Average number of attributes per chyron: {total_attributes / total_chyrons:.2f}")
    print()
    
    if total_stats['name_lengths']:
        print("=== NAME-ONLY CHYRON STATISTICS ===")
        avg_name_chars = np.mean(total_stats['name_lengths'])
        std_name_chars = np.std(total_stats['name_lengths'])
        print(f"Average characters per name: {avg_name_chars:.2f}")
        print(f"Standard deviation of characters per name: {std_name_chars:.2f}")
        print()
    
    if total_attributes > 0:
        print("=== PER ATTRIBUTE STATISTICS ===")
        print(f"Average characters per attribute: {total_stats['total_chars_attributes'] / total_attributes:.2f}")
    else:
        print("No attributes found in any chyrons.")


if __name__ == "__main__":
    main()