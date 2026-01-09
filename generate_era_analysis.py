#!/usr/bin/env python3
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
        # Extract video IDs from filenames like "cpb-aacip-225-01pg4ftd_01785183_01332032_01332030.jpg"
        # We want just "cpb-aacip-225-01pg4ftd"
        basenames = set()
        for entry in data:
            filename = entry[0]
            # Split by underscore and take the first part (video ID)
            video_id = filename.split('_')[0]
            basenames.add(video_id)
        return basenames
    
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
    
    # Find the Raw Results section and CSV data
    in_raw_results = False
    in_csv = False
    
    for line in lines:
        line = line.strip()
        
        # Look for Raw Results section
        if line == "## Raw Results":
            in_raw_results = True
            continue
        
        # Look for start of CSV block after Raw Results
        if in_raw_results and line == "```":
            in_csv = True
            continue
        
        # Look for CSV header
        if in_csv and line.startswith('GUID,mean-CER-cased,mean-CER-uncased'):
            continue
            
        # End of CSV block
        if in_csv and line == '```':
            break
            
        # Parse CSV data lines
        if in_csv and ',' in line and not line.startswith('GUID'):
            parts = line.split(',')
            if len(parts) >= 3:
                basename = parts[0]
                try:
                    metric1_str = parts[1]
                    metric2_str = parts[2]
                    
                    # Parse as floats first
                    metric1 = float(metric1_str)
                    metric2 = float(metric2_str)
                    
                    # Skip rows where either metric is -1
                    if metric1 == -1.0 or metric2 == -1.0:
                        continue
                        
                    results[basename] = (metric1, metric2)
                except (ValueError, IndexError):
                    continue
    
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
    print(f"Processing {len(eval_files)} evaluation files...")
    
    for eval_file in eval_files:
        # Extract model/config from path
        rel_path = os.path.relpath(eval_file, results_dir)
        path_parts = rel_path.split('/')
        
        if len(path_parts) >= 3:
            model_config = '/'.join(path_parts[:-1])  # Everything except evaluation_results.md
        else:
            model_config = os.path.dirname(rel_path)
        
        print(f"Processing: {model_config}")
        
        # Parse evaluation results
        results = parse_evaluation_file(eval_file)
        print(f"  Found {len(results)} valid results")
        
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
        f.write('# Era-Based Performance Analysis (Pre/Post 2000)\n\n')
        date_str = os.popen('date').read().strip()
        f.write(f'Generated on: {date_str}\n\n')
        
        f.write('## Dataset Overview\n\n')
        f.write(f'- **Pre-2000 Dataset**: {pre_2000_total} entries\n')
        f.write(f'- **Post-2000 Dataset**: {post_2000_total} entries\n')
        f.write(f'- **Total**: {pre_2000_total + post_2000_total} entries\n')
        f.write(f'- **Era Distribution**: {pre_2000_total/(pre_2000_total+post_2000_total)*100:.1f}% pre-2000, {post_2000_total/(pre_2000_total+post_2000_total)*100:.1f}% post-2000\n\n')
        
        # Generate summary for each era
        for era in ['pre-2000', 'post-2000']:
            f.write(f'## {era.title()} Performance\n\n')
            f.write('| Model/Config | Count | Avg CER Cased | Avg CER Uncased |\n')
            f.write('|--------------|-------|---------------|------------------|\n')
            
            for model_config, stats in sorted(era_stats[era].items()):
                if stats['count'] > 0 and not model_config.startswith('gptoss/'):
                    avg_metric1 = stats['metric1_sum'] / stats['count']
                    avg_metric2 = stats['metric2_sum'] / stats['count']
                    f.write(f'| {model_config} | {stats["count"]} | {avg_metric1:.3f} | {avg_metric2:.3f} |\n')
            
            f.write('\n')
        
        # Generate comparative analysis
        f.write('## Comparative Analysis\n\n')
        f.write('| Model/Config | Pre-2000 CER Cased | Post-2000 CER Cased | Difference | Pre-2000 CER Uncased | Post-2000 CER Uncased | Difference |\n')
        f.write('|--------------|---------------------|----------------------|------------|----------------------|------------------------|------------|\n')
        
        # Find common model/config combinations (excluding gptoss)
        common_configs = set(era_stats['pre-2000'].keys()) & set(era_stats['post-2000'].keys())
        common_configs = {config for config in common_configs if not config.startswith('gptoss/')}
        
        for model_config in sorted(common_configs):
            pre_stats = era_stats['pre-2000'][model_config]
            post_stats = era_stats['post-2000'][model_config]
            
            if pre_stats['count'] > 0 and post_stats['count'] > 0:
                pre_m1 = pre_stats['metric1_sum'] / pre_stats['count']
                post_m1 = post_stats['metric1_sum'] / post_stats['count']
                pre_m2 = pre_stats['metric2_sum'] / pre_stats['count']
                post_m2 = post_stats['metric2_sum'] / post_stats['count']
                
                diff_m1 = post_m1 - pre_m1
                diff_m2 = post_m2 - pre_m2
                
                f.write(f'| {model_config} | {pre_m1:.3f} | {post_m1:.3f} | {diff_m1:+.3f} | {pre_m2:.3f} | {post_m2:.3f} | {diff_m2:+.3f} |\n')
        
        f.write('\n')
        
        # Add interpretation notes
        f.write('## Analysis Notes\n\n')
        f.write('- **Positive Difference**: Post-2000 performance is worse (higher error rates)\n')
        f.write('- **Negative Difference**: Post-2000 performance is better (lower error rates)\n')
        f.write('- **CER Cased**: Character Error Rate with case sensitivity - lower is better\n')
        f.write('- **CER Uncased**: Character Error Rate ignoring case - lower is better\n\n')

    print(f'Era analysis report generated: {output_file}')

if __name__ == "__main__":
    generate_era_report('results', 'results/era_analysis.md')