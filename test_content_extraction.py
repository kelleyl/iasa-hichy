#!/usr/bin/env python3

import sys
sys.path.insert(0, '/home/kmlynch/clams_apps/app-llama-video-summarizer')

from mmif import Mmif, AnnotationTypes, DocumentTypes
import yaml

# Load the config and MMIF file
config_path = '/home/kmlynch/clams_apps/app-llama-video-summarizer/config/iasa-hichy-chyron-llava.yaml'
with open(config_path, 'r') as f:
    config = yaml.safe_load(f)

mmif_path = '/home/kmlynch/clams_apps/iasa-hichy/output/llava/hi-chy-annotator_instructions-4/cpb-aacip-058a21352e3.mmif'
with open(mmif_path, 'r') as f:
    mmif = Mmif(f.read())

print("Testing content extraction...")

# Get the first few timeframes to test with
views = mmif.get_views_contain(AnnotationTypes.TimeFrame)
timeframe_config = config['context_config']['timeframe']
app_mappings = config['context_config'].get('apps', {})

print(f"App mappings: {app_mappings}")

for i, _view in enumerate(views):
    if timeframe_config['app_uri'] in _view.metadata.app:
        timeframes = list(_view.get_annotations(AnnotationTypes.TimeFrame))
        print(f"\nTesting first 3 timeframes from view {i}:")
        
        for j, timeframe in enumerate(timeframes[:3]):
            # Get the timeframe time range
            targets = timeframe.properties.get('targets', [])
            if targets:
                timepoints = []
                for target_id in targets:
                    if ':' in target_id:
                        view_id, tp_id = target_id.split(':', 1)
                        for target_view in mmif.views:
                            if target_view.id == view_id:
                                for tp_annotation in target_view.get_annotations(AnnotationTypes.TimePoint):
                                    if tp_annotation.id == tp_id:
                                        timepoint = tp_annotation.properties.get('timePoint')
                                        if timepoint is not None:
                                            timepoints.append(timepoint)
                                        break
                                break
                
                if timepoints:
                    start_time = min(timepoints)
                    end_time = max(timepoints)
                    print(f"\n  TimeFrame {j}: {start_time} - {end_time} ms")
                    
                    # Test content extraction for each app
                    for app_uri, placeholder in app_mappings.items():
                        print(f"    Extracting {placeholder} from {app_uri}:")
                        
                        # Look for views containing this app
                        for view in mmif.get_views_contain(AnnotationTypes.TimeFrame):
                            if app_uri in view.metadata.app:
                                print(f"      Found matching view: {view.id}")
                                
                                # Look for timeframes that overlap with our time range
                                for tf in view.get_annotations(AnnotationTypes.TimeFrame):
                                    tf_targets = tf.properties.get('targets', [])
                                    if tf_targets:
                                        tf_timepoints = []
                                        for target_id in tf_targets:
                                            if ':' in target_id:
                                                view_id, tp_id = target_id.split(':', 1)
                                                for target_view in mmif.views:
                                                    if target_view.id == view_id:
                                                        for tp_annotation in target_view.get_annotations(AnnotationTypes.TimePoint):
                                                            if tp_annotation.id == tp_id:
                                                                timepoint = tp_annotation.properties.get('timePoint')
                                                                if timepoint is not None:
                                                                    tf_timepoints.append(timepoint)
                                                                break
                                                        break
                                        
                                        if tf_timepoints:
                                            tf_start = min(tf_timepoints)
                                            tf_end = max(tf_timepoints)
                                            
                                            # Check if timeframes overlap
                                            if tf_end >= start_time and tf_start <= end_time:
                                                print(f"        Overlapping timeframe: {tf_start} - {tf_end}")
                                                
                                                # Check for aligned text content
                                                aligned_content = list(tf.get_all_aligned())
                                                print(f"        Aligned annotations: {len(aligned_content)}")
                                                
                                                for aligned in aligned_content:
                                                    print(f"          Type: {aligned.at_type}")
                                                    if hasattr(aligned, 'text_value') and aligned.text_value:
                                                        print(f"          Text preview: {repr(aligned.text_value[:100])}")
                                                    break  # Just show first one
                                break  # Found the view, move to next app
                        
        break  # Only process first matching view