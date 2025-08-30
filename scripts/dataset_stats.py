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


def analyze_chyron_file_array_format(filepath):
    """Analyze a JSON file with array format (pre/post-2000 files)."""
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # Count only non-null entries with at least 7 elements (to access structured data)
    valid_entries = [entry for entry in data if entry is not None and len(entry) >= 7]
    
    file_stats = {
        'total_chyrons': len(valid_entries),
        'total_chars_text': 0,
        'total_words_text': 0,
        'total_attributes': 0,
        'total_chars_attributes': 0,
        'name_lengths': [],
        'chyron_lengths': [],
        'only_names_count': 0,
        'normalized_vs_unnormalized_diffs': [],  # Track length differences for analysis
        'program_chyron_counts': {}  # Track chyrons per program
    }
    
    for entry in valid_entries:
        # Array format: [filename, boolean, type, subtype, transitional, text_transcript, structured_transcript]
        if len(entry) < 7:
            continue
            
        # Extract program ID from filename (everything before first underscore)
        filename = entry[0] if entry[0] else ''
        program_id = filename.split('_')[0] if filename else 'unknown'
        
        # Count chyrons per program
        if program_id in file_stats['program_chyron_counts']:
            file_stats['program_chyron_counts'][program_id] += 1
        else:
            file_stats['program_chyron_counts'][program_id] = 1
            
        text_transcript = entry[5] if entry[5] else ''
        structured_transcript = entry[6] if entry[6] else ''
        
        text_length = len(text_transcript)
        file_stats['total_chars_text'] += text_length
        file_stats['total_words_text'] += count_words(text_transcript)
        file_stats['chyron_lengths'].append(text_length)
        
        # Parse structured transcript to extract name and attributes
        if structured_transcript:
            parts = structured_transcript.split('\n\n')
            if len(parts) >= 2:
                unnormalized_name = parts[0].strip()
                normalized_name = parts[1].strip()
                attributes = [part.strip() for part in parts[2:] if part.strip()]
                
                # Track difference in name lengths for analysis
                name_length_diff = len(unnormalized_name) - len(normalized_name)
                file_stats['normalized_vs_unnormalized_diffs'].append(name_length_diff)
                
                # Count attributes
                file_stats['total_attributes'] += len(attributes)
                
                # Count characters in attributes
                for attr in attributes:
                    file_stats['total_chars_attributes'] += len(attr)
                
                # Check if this is a name-only chyron (no attributes)
                if text_length > 0 and len(attributes) == 0:
                    file_stats['only_names_count'] += 1
                    file_stats['name_lengths'].append(len(unnormalized_name))
                elif text_length > 0:
                    # Has attributes, still count the name length for comparison
                    file_stats['name_lengths'].append(len(unnormalized_name))
            else:
                # Fallback if structured format is incomplete
                if text_length > 0:
                    file_stats['only_names_count'] += 1
                    file_stats['name_lengths'].append(text_length)
        else:
            # No structured data, use text transcript
            if text_length > 0:
                file_stats['only_names_count'] += 1
                file_stats['name_lengths'].append(text_length)
    
    return file_stats


def analyze_chyron_file_object_format(filepath):
    """Analyze a JSON file with object format (golds files)."""
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # Extract program ID from filename (everything before .json)
    filename = Path(filepath).stem  # Gets filename without extension
    program_id = filename
    
    # Count only non-null chyrons
    valid_chyrons = [c for c in data if c is not None]
    
    file_stats = {
        'total_chyrons': len(valid_chyrons),
        'total_chars_text': 0,
        'total_words_text': 0,
        'total_attributes': 0,
        'total_chars_attributes': 0,
        'name_lengths': [],
        'chyron_lengths': [],
        'only_names_count': 0,
        'normalized_vs_unnormalized_diffs': [],  # Not applicable for object format
        'program_chyron_counts': {}  # Track chyrons per program
    }
    
    # Initialize program count
    if len(valid_chyrons) > 0:
        file_stats['program_chyron_counts'][program_id] = len(valid_chyrons)
    
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


def analyze_chyron_file(filepath):
    """Analyze a single JSON file and return statistics. Auto-detects format."""
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # Detect format based on first non-null entry
    if data and len(data) > 0:
        first_entry = None
        for entry in data:
            if entry is not None:
                first_entry = entry
                break
        
        if first_entry is not None:
            # Check if it's an array (list) or object (dict)
            if isinstance(first_entry, list):
                return analyze_chyron_file_array_format(filepath)
            elif isinstance(first_entry, dict):
                return analyze_chyron_file_object_format(filepath)
    
    # Return empty stats if we can't determine format
    return {
        'total_chyrons': 0,
        'total_chars_text': 0,
        'total_words_text': 0,
        'total_attributes': 0,
        'total_chars_attributes': 0,
        'name_lengths': [],
        'chyron_lengths': [],
        'only_names_count': 0,
        'normalized_vs_unnormalized_diffs': [],
        'program_chyron_counts': {}
    }


def compute_total_stats(json_files):
    total_stats = {
        'total_chyrons': 0,
        'total_chars_text': 0,
        'total_words_text': 0,
        'total_attributes': 0,
        'total_chars_attributes': 0,
        'name_lengths': [],
        'chyron_lengths': [],
        'only_names_count': 0,
        'normalized_vs_unnormalized_diffs': [],
        'program_chyron_counts': {}
    }

    for json_file in json_files:
        try:
            file_stats = analyze_chyron_file(json_file)
            for key in total_stats:
                if key in ['name_lengths', 'chyron_lengths', 'normalized_vs_unnormalized_diffs']:
                    total_stats[key].extend(file_stats.get(key, []))
                elif key == 'program_chyron_counts':
                    # Merge program counts
                    for program_id, count in file_stats.get(key, {}).items():
                        if program_id in total_stats[key]:
                            total_stats[key][program_id] += count
                        else:
                            total_stats[key][program_id] = count
                else:
                    total_stats[key] += file_stats.get(key, 0)
        except Exception as e:
            print(f"Error processing {json_file}: {e}")
            continue

    return total_stats


def print_results(label, json_files, total_stats):
    total_chyrons = total_stats['total_chyrons']
    total_attributes = total_stats['total_attributes']

    if total_chyrons == 0:
        print(f"No chyrons found in any files for {label}.")
        return

    print(f"=== {label} CHYRON ANALYSIS RESULTS ===")
    print(f"Total files processed: {len(json_files)}")
    print(f"Total chyrons: {total_chyrons}")
    print(f"Chyrons with only names (no attributes): {total_stats['only_names_count']}")
    
    # Program statistics
    program_counts = total_stats.get('program_chyron_counts', {})
    if program_counts:
        distinct_programs = len(program_counts)
        chyrons_per_program = list(program_counts.values())
        avg_chyrons_per_program = np.mean(chyrons_per_program)
        std_chyrons_per_program = np.std(chyrons_per_program)
        
        print(f"Distinct programs: {distinct_programs}")
        print(f"Average chyrons per program: {avg_chyrons_per_program:.2f}")
        print(f"Standard deviation chyrons per program: {std_chyrons_per_program:.2f}")
    
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
        print()
    else:
        print("No attributes found in any chyrons.")
        print()
    
    # Analysis of name normalization differences
    if total_stats.get('normalized_vs_unnormalized_diffs'):
        diffs = total_stats['normalized_vs_unnormalized_diffs']
        positive_diffs = [d for d in diffs if d > 0]
        negative_diffs = [d for d in diffs if d < 0]
        zero_diffs = [d for d in diffs if d == 0]
        
        print("=== NAME NORMALIZATION ANALYSIS ===")
        print(f"Names with additional info in unnormalized version: {len(positive_diffs)} ({len(positive_diffs)/len(diffs)*100:.1f}%)")
        print(f"Names shorter in unnormalized version: {len(negative_diffs)} ({len(negative_diffs)/len(diffs)*100:.1f}%)")
        print(f"Names with no length change: {len(zero_diffs)} ({len(zero_diffs)/len(diffs)*100:.1f}%)")
        if positive_diffs:
            print(f"Average additional characters in unnormalized names: {np.mean(positive_diffs):.2f}")
        print()


def print_comparison_table(pre_stats, post_stats, combined_stats, comps_stats):
    """Print a comparison table of key metrics."""
    print("=" * 80)
    print("=== COMPARISON TABLE ===")
    print("=" * 80)
    
    # Table header
    print(f"{'Metric':<40} {'PRE-2000':<12} {'POST-2000':<12} {'COMBINED':<12} {'comps':<12}")
    print("-" * 80)
    
    # Basic counts
    print(f"{'Total chyrons':<40} {pre_stats['total_chyrons']:<12} {post_stats['total_chyrons']:<12} {combined_stats['total_chyrons']:<12} {comps_stats['total_chyrons']:<12}")
    print(f"{'Name-only chyrons':<40} {pre_stats['only_names_count']:<12} {post_stats['only_names_count']:<12} {combined_stats['only_names_count']:<12} {comps_stats['only_names_count']:<12}")
    
    # Program counts
    pre_programs = len(pre_stats.get('program_chyron_counts', {}))
    post_programs = len(post_stats.get('program_chyron_counts', {}))
    combined_programs = len(combined_stats.get('program_chyron_counts', {}))
    comps_programs = len(comps_stats.get('program_chyron_counts', {}))
    
    print(f"{'Distinct programs':<40} {pre_programs:<12} {post_programs:<12} {combined_programs:<12} {comps_programs:<12}")
    
    # Percentages
    pre_name_only_pct = pre_stats['only_names_count'] / pre_stats['total_chyrons'] * 100 if pre_stats['total_chyrons'] > 0 else 0
    post_name_only_pct = post_stats['only_names_count'] / post_stats['total_chyrons'] * 100 if post_stats['total_chyrons'] > 0 else 0
    combined_name_only_pct = combined_stats['only_names_count'] / combined_stats['total_chyrons'] * 100 if combined_stats['total_chyrons'] > 0 else 0
    comps_name_only_pct = comps_stats['only_names_count'] / comps_stats['total_chyrons'] * 100 if comps_stats['total_chyrons'] > 0 else 0
    
    print(f"{'Name-only chyrons (%)':<40} {pre_name_only_pct:<12.1f} {post_name_only_pct:<12.1f} {combined_name_only_pct:<12.1f} {comps_name_only_pct:<12.1f}")
    
    # Averages per chyron
    pre_avg_chars = pre_stats['total_chars_text'] / pre_stats['total_chyrons'] if pre_stats['total_chyrons'] > 0 else 0
    post_avg_chars = post_stats['total_chars_text'] / post_stats['total_chyrons'] if post_stats['total_chyrons'] > 0 else 0
    combined_avg_chars = combined_stats['total_chars_text'] / combined_stats['total_chyrons'] if combined_stats['total_chyrons'] > 0 else 0
    comps_avg_chars = comps_stats['total_chars_text'] / comps_stats['total_chyrons'] if comps_stats['total_chyrons'] > 0 else 0
    
    print(f"{'Avg chars per chyron':<40} {pre_avg_chars:<12.2f} {post_avg_chars:<12.2f} {combined_avg_chars:<12.2f} {comps_avg_chars:<12.2f}")
    
    pre_avg_words = pre_stats['total_words_text'] / pre_stats['total_chyrons'] if pre_stats['total_chyrons'] > 0 else 0
    post_avg_words = post_stats['total_words_text'] / post_stats['total_chyrons'] if post_stats['total_chyrons'] > 0 else 0
    combined_avg_words = combined_stats['total_words_text'] / combined_stats['total_chyrons'] if combined_stats['total_chyrons'] > 0 else 0
    comps_avg_words = comps_stats['total_words_text'] / comps_stats['total_chyrons'] if comps_stats['total_chyrons'] > 0 else 0
    
    print(f"{'Avg words per chyron':<40} {pre_avg_words:<12.2f} {post_avg_words:<12.2f} {combined_avg_words:<12.2f} {comps_avg_words:<12.2f}")
    
    pre_avg_attrs = pre_stats['total_attributes'] / pre_stats['total_chyrons'] if pre_stats['total_chyrons'] > 0 else 0
    post_avg_attrs = post_stats['total_attributes'] / post_stats['total_chyrons'] if post_stats['total_chyrons'] > 0 else 0
    combined_avg_attrs = combined_stats['total_attributes'] / combined_stats['total_chyrons'] if combined_stats['total_chyrons'] > 0 else 0
    comps_avg_attrs = comps_stats['total_attributes'] / comps_stats['total_chyrons'] if comps_stats['total_chyrons'] > 0 else 0
    
    print(f"{'Avg attributes per chyron':<40} {pre_avg_attrs:<12.2f} {post_avg_attrs:<12.2f} {combined_avg_attrs:<12.2f} {comps_avg_attrs:<12.2f}")
    
    # Attribute statistics
    pre_avg_attr_chars = pre_stats['total_chars_attributes'] / pre_stats['total_attributes'] if pre_stats['total_attributes'] > 0 else 0
    post_avg_attr_chars = post_stats['total_chars_attributes'] / post_stats['total_attributes'] if post_stats['total_attributes'] > 0 else 0
    combined_avg_attr_chars = combined_stats['total_chars_attributes'] / combined_stats['total_attributes'] if combined_stats['total_attributes'] > 0 else 0
    comps_avg_attr_chars = comps_stats['total_chars_attributes'] / comps_stats['total_attributes'] if comps_stats['total_attributes'] > 0 else 0
    
    print(f"{'Avg chars per attribute':<40} {pre_avg_attr_chars:<12.2f} {post_avg_attr_chars:<12.2f} {combined_avg_attr_chars:<12.2f} {comps_avg_attr_chars:<12.2f}")
    
    # Program statistics
    pre_chyrons_per_program = list(pre_stats.get('program_chyron_counts', {}).values())
    post_chyrons_per_program = list(post_stats.get('program_chyron_counts', {}).values())
    combined_chyrons_per_program = list(combined_stats.get('program_chyron_counts', {}).values())
    comps_chyrons_per_program = list(comps_stats.get('program_chyron_counts', {}).values())
    
    pre_avg_chyrons_per_program = np.mean(pre_chyrons_per_program) if pre_chyrons_per_program else 0
    post_avg_chyrons_per_program = np.mean(post_chyrons_per_program) if post_chyrons_per_program else 0
    combined_avg_chyrons_per_program = np.mean(combined_chyrons_per_program) if combined_chyrons_per_program else 0
    comps_avg_chyrons_per_program = np.mean(comps_chyrons_per_program) if comps_chyrons_per_program else 0
    
    print(f"{'Avg chyrons per program':<40} {pre_avg_chyrons_per_program:<12.2f} {post_avg_chyrons_per_program:<12.2f} {combined_avg_chyrons_per_program:<12.2f} {comps_avg_chyrons_per_program:<12.2f}")
    
    # Name length statistics
    pre_avg_name = np.mean(pre_stats['name_lengths']) if pre_stats['name_lengths'] else 0
    post_avg_name = np.mean(post_stats['name_lengths']) if post_stats['name_lengths'] else 0
    combined_avg_name = np.mean(combined_stats['name_lengths']) if combined_stats['name_lengths'] else 0
    comps_avg_name = np.mean(comps_stats['name_lengths']) if comps_stats['name_lengths'] else 0
    
    print(f"{'Avg name length (chars)':<40} {pre_avg_name:<12.2f} {post_avg_name:<12.2f} {combined_avg_name:<12.2f} {comps_avg_name:<12.2f}")
    
    # Normalization analysis
    if pre_stats.get('normalized_vs_unnormalized_diffs') and post_stats.get('normalized_vs_unnormalized_diffs'):
        pre_diffs = pre_stats['normalized_vs_unnormalized_diffs']
        post_diffs = post_stats['normalized_vs_unnormalized_diffs']
        combined_diffs = combined_stats['normalized_vs_unnormalized_diffs']
        comps_diffs = comps_stats['normalized_vs_unnormalized_diffs']
        
        pre_additional_info_pct = len([d for d in pre_diffs if d > 0]) / len(pre_diffs) * 100 if pre_diffs else 0
        post_additional_info_pct = len([d for d in post_diffs if d > 0]) / len(post_diffs) * 100 if post_diffs else 0
        combined_additional_info_pct = len([d for d in combined_diffs if d > 0]) / len(combined_diffs) * 100 if combined_diffs else 0
        comps_additional_info_pct = len([d for d in comps_diffs if d > 0]) / len(comps_diffs) * 100 if comps_diffs else 0
        
        print(f"{'Names w/ extra info (%)':<40} {pre_additional_info_pct:<12.1f} {post_additional_info_pct:<12.1f} {combined_additional_info_pct:<12.1f} {comps_additional_info_pct:<12.1f}")
    
    print("=" * 80)


def main():
    base_dir = Path("aapb-annotations/understanding-chyrons")
    pre_dir = base_dir / "250606-hi-chy-hi-pre-2000"
    post_dir = base_dir / "250606-hi-chy-hi-post-2000"
    comps_dir = base_dir / "250829-hi-chy-comps"

    pre_files = list(pre_dir.glob("*.json"))
    post_files = list(post_dir.glob("*.json"))
    comps_files = list(comps_dir.glob("*.json"))

    if not pre_files and not post_files and not comps_files:
        print(f"No JSON files found in {pre_dir}, {post_dir}, or {comps_dir}")
        return

    # Initialize empty stats for missing datasets
    empty_stats = {
        'total_chyrons': 0,
        'total_chars_text': 0,
        'total_words_text': 0,
        'total_attributes': 0,
        'total_chars_attributes': 0,
        'name_lengths': [],
        'chyron_lengths': [],
        'only_names_count': 0,
        'normalized_vs_unnormalized_diffs': [],
        'program_chyron_counts': {}
    }

    # Pre-2000
    if pre_files:
        pre_stats = compute_total_stats(pre_files)
        print_results("PRE-2000", pre_files, pre_stats)
        print()
    else:
        print(f"No JSON files found for PRE-2000 in {pre_dir}\n")
        pre_stats = empty_stats

    # Post-2000
    if post_files:
        post_stats = compute_total_stats(post_files)
        print_results("POST-2000", post_files, post_stats)
        print()
    else:
        print(f"No JSON files found for POST-2000 in {post_dir}\n")
        post_stats = empty_stats

    # Comps
    if comps_files:
        comps_stats = compute_total_stats(comps_files)
        print_results("comps", comps_files, comps_stats)
        print()
    else:
        print(f"No JSON files found for comps in {comps_dir}\n")
        comps_stats = empty_stats

    # Combined (PRE-2000 + POST-2000 only)
    combined_files = pre_files + post_files
    if combined_files:
        combined_stats = compute_total_stats(combined_files)
        print_results("COMBINED (PRE-2000 + POST-2000)", combined_files, combined_stats)
        print()
        
        # Print comparison table
        print_comparison_table(pre_stats, post_stats, combined_stats, comps_stats)


if __name__ == "__main__":
    main()