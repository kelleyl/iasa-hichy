#!/usr/bin/env python3

import sys
sys.path.insert(0, '/home/kmlynch/clams_apps/app-llama-video-summarizer')

from mmif import Mmif, AnnotationTypes, DocumentTypes
import yaml
import re

# Import the actual app
from app import LlamaVideoSummarizer

def test_content_extraction_only():
    """Test just the content extraction without model loading"""
    
    # Create app instance but skip model loading
    app = LlamaVideoSummarizer.__new__(LlamaVideoSummarizer)
    
    # Load config manually
    config_path = '/home/kmlynch/clams_apps/app-llama-video-summarizer/config/iasa-hichy-chyron-llava.yaml'
    with open(config_path, 'r') as f:
        config = yaml.safe_load(f)
    
    app.config = config
    app.system_message = config.get("default_prompt", {}).get("system", "You are a helpful assistant.")
    app.user_prompt = config.get("default_prompt", {}).get("user", "")
    app.input_context = config['context_config'].get('input_context', 'timeframe')
    app.app_mappings = config['context_config'].get('apps', {})
    app.label_mapping = config['context_config'].get('timeframe', {}).get('label_mapping', {})
    app.prompts = config.get('custom_prompts', {})
    
    # Load MMIF
    mmif_path = '/home/kmlynch/clams_apps/iasa-hichy/output/llava/hi-chy-annotator_instructions-4/cpb-aacip-058a21352e3.mmif'
    with open(mmif_path, 'r') as f:
        mmif = Mmif(f.read())
    
    print("Testing content extraction and prompt building...")
    
    # Get first few timeframes
    summary_segments = []
    timeframe_config = app.config['context_config']['timeframe']
    
    views = mmif.get_views_contain(AnnotationTypes.TimeFrame)
    print(f"Found {len(views)} views containing TimeFrame annotations")
    
    for i, _view in enumerate(views):
        print(f"View {i} app: {_view.metadata.app}")
        if timeframe_config['app_uri'] in _view.metadata.app:
            print(f"View {i} matches app_uri: {timeframe_config['app_uri']}")
            timeframes = list(_view.get_annotations(AnnotationTypes.TimeFrame))
            print(f"Found {len(timeframes)} timeframes in view {i}")
            
            # Just test first 3 timeframes
            for timeframe in timeframes[:3]:
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
                        label = timeframe.properties.get("label")
                        summary_segments.append({
                            'start_time': start_time,
                            'end_time': end_time,
                            'label': label
                        })
            break
    
    print(f"\nTesting {len(summary_segments)} segments:")
    
    for i, segment in enumerate(summary_segments):
        print(f"\n=== Segment {i} ===")
        print(f"Time range: {segment['start_time']} - {segment['end_time']} ms")
        print(f"Label: {segment['label']}")
        
        # Test content extraction
        for app_uri, placeholder in app.app_mappings.items():
            print(f"\nExtracting {placeholder} from {app_uri}:")
            content = app.extract_content(mmif, app_uri, segment['start_time'], segment['end_time'])
            print(f"Content length: {len(content)} chars")
            if content:
                print(f"Content preview: {repr(content[:100])}")
        
        # Test context building
        try:
            context = app.build_context(mmif, segment['start_time'], segment['end_time'], segment.get('label'))
            print(f"\nBuilt context length: {len(context)} chars")
            print(f"Context preview: {repr(context[:200])}")
        except Exception as e:
            print(f"Error building context: {e}")

if __name__ == "__main__":
    test_content_extraction_only()