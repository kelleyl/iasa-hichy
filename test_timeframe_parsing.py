#!/usr/bin/env python3

import sys
sys.path.insert(0, '/home/kmlynch/clams_apps/app-llama-video-summarizer')

from mmif import Mmif, AnnotationTypes
import yaml

# Load the config
config_path = '/home/kmlynch/clams_apps/app-llama-video-summarizer/config/iasa-hichy-chyron-llava.yaml'
with open(config_path, 'r') as f:
    config = yaml.safe_load(f)

# Load MMIF file
mmif_path = '/home/kmlynch/clams_apps/iasa-hichy/output/llava/hi-chy-annotator_instructions-4/cpb-aacip-058a21352e3.mmif'
with open(mmif_path, 'r') as f:
    mmif = Mmif(f.read())

print("Testing TimeFrame parsing...")
print(f"Config app_uri: {config['context_config']['timeframe']['app_uri']}")

# Find TimeFrame views
views = mmif.get_views_contain(AnnotationTypes.TimeFrame)
print(f"Found {len(views)} views containing TimeFrame annotations")

timeframe_config = config['context_config']['timeframe']
summary_segments = []

for i, _view in enumerate(views):
    print(f"View {i} app: {_view.metadata.app}")
    if timeframe_config['app_uri'] in _view.metadata.app:
        print(f"  ✓ View {i} matches app_uri")
        timeframes = list(_view.get_annotations(AnnotationTypes.TimeFrame))
        print(f"  Found {len(timeframes)} timeframes")
        
        for j, timeframe in enumerate(timeframes[:3]):  # Test first 3 timeframes
            targets = timeframe.properties.get('targets', [])
            label = timeframe.properties.get('label')
            print(f"    TimeFrame {j}: label={label}, targets count={len(targets)}")
            
            if targets:
                timepoints = []
                for target_id in targets[:5]:  # Test first 5 targets
                    if ':' in target_id:
                        view_id, tp_id = target_id.split(':', 1)
                        print(f"      Target: {target_id} -> view={view_id}, tp={tp_id}")
                        
                        # Find the view containing TimePoints
                        for target_view in mmif.views:
                            if target_view.id == view_id:
                                # Look for the timepoint annotation
                                for tp_annotation in target_view.get_annotations(AnnotationTypes.TimePoint):
                                    if tp_annotation.id == tp_id:
                                        timepoint = tp_annotation.properties.get('timePoint')
                                        if timepoint is not None:
                                            timepoints.append(timepoint)
                                            print(f"        Found timepoint: {timepoint}")
                                        break
                                break
                
                if timepoints:
                    start_time = min(timepoints)
                    end_time = max(timepoints)
                    print(f"    ✓ TimeFrame {j}: {start_time} - {end_time} ms")
                    summary_segments.append({
                        'start_time': start_time,
                        'end_time': end_time,
                        'label': label
                    })
                else:
                    print(f"    ✗ No timepoints found for TimeFrame {j}")

print(f"\nResult: Found {len(summary_segments)} valid summary segments")
for i, seg in enumerate(summary_segments[:5]):
    print(f"  Segment {i}: {seg}")