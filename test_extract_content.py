#!/usr/bin/env python3

import sys
sys.path.insert(0, '/home/kmlynch/clams_apps/app-llama-video-summarizer')

from mmif import Mmif, AnnotationTypes, DocumentTypes
import yaml
import re

def extract_content_test(mmif: Mmif, app_uri: str, start_time: float, end_time: float) -> str:
    """
    Test version of extract_content with debug output
    """
    contents = []
    
    print(f"    Looking for app: {app_uri}")
    
    # Find the view from the specified app (e.g., LLaVA captioner)
    target_view = None
    for view in mmif.views:
        print(f"      Checking view {view.id}: {view.metadata.app}")
        if app_uri in view.metadata.app:
            target_view = view
            print(f"      ✓ Found matching view: {view.id}")
            break
    
    if not target_view:
        print(f"      ✗ No view found for {app_uri}")
        return ""
    
    # Get all TextDocuments from this view
    text_documents = list(target_view.get_annotations(DocumentTypes.TextDocument))
    alignments = list(target_view.get_annotations(AnnotationTypes.Alignment))
    print(f"      Found {len(text_documents)} TextDocuments and {len(alignments)} Alignments")
    
    # For each TextDocument, check if it's aligned to a TimeFrame in our time range
    for i, text_doc in enumerate(text_documents):
        print(f"        TextDoc {i}: {text_doc.id}")
        if hasattr(text_doc, 'text_value') and text_doc.text_value:
            print(f"          Text preview: {repr(text_doc.text_value[:50])}")
        
        # Get alignments to find what TimeFrame this text is aligned to
        for alignment in alignments:
            if alignment.properties.get('target') == text_doc.long_id:
                print(f"          Found alignment: {alignment.properties}")
                source_id = alignment.properties.get('source')
                if source_id and ':' in source_id:
                    print(f"          Source ID: {source_id}")
                    # Parse the timepoint reference (format: v_X:tp_Y)
                    view_id, tp_id = source_id.split(':', 1)
                    
                    # Find the timepoint in the referenced view
                    for tp_view in mmif.views:
                        if tp_view.id == view_id:
                            for tp_annotation in tp_view.get_annotations(AnnotationTypes.TimePoint):
                                if tp_annotation.id == tp_id:
                                    timepoint = tp_annotation.properties.get('timePoint')
                                    if timepoint is not None:
                                        print(f"          TimePoint value: {timepoint}")
                                        print(f"          Query range: {start_time} - {end_time}")
                                        
                                        # Check if this timepoint falls within our desired range
                                        if start_time <= timepoint <= end_time:
                                            print(f"          ✓ TimePoint within range!")
                                            if hasattr(text_doc, 'text_value') and text_doc.text_value:
                                                # Clean the text
                                                cleaned_text = re.sub(r"\[INST\].*?\[/INST\]", "", text_doc.text_value, flags=re.DOTALL).strip()
                                                if cleaned_text:
                                                    contents.append(cleaned_text + "\n")
                                                    print(f"          Added content: {repr(cleaned_text[:50])}")
                                        else:
                                            print(f"          TimePoint outside range")
                                    break
                            break
    
    result = "".join(contents)
    print(f"      Total content length: {len(result)}")
    return result

# Load config and MMIF
config_path = '/home/kmlynch/clams_apps/app-llama-video-summarizer/config/iasa-hichy-chyron-llava.yaml'
with open(config_path, 'r') as f:
    config = yaml.safe_load(f)

mmif_path = '/home/kmlynch/clams_apps/iasa-hichy/output/llava/hi-chy-annotator_instructions-4/cpb-aacip-058a21352e3.mmif'
with open(mmif_path, 'r') as f:
    mmif = Mmif(f.read())

print("Testing extract_content method...")

# Get first timeframe
views = mmif.get_views_contain(AnnotationTypes.TimeFrame)
timeframe_config = config['context_config']['timeframe']
app_mappings = config['context_config'].get('apps', {})

for i, _view in enumerate(views):
    if timeframe_config['app_uri'] in _view.metadata.app:
        timeframes = list(_view.get_annotations(AnnotationTypes.TimeFrame))
        print(f"\nTesting first timeframe from view {i}:")
        
        timeframe = timeframes[0]
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
                print(f"  TimeFrame range: {start_time} - {end_time} ms")
                
                # Test content extraction
                for app_uri, placeholder in app_mappings.items():
                    print(f"  Testing {placeholder} from {app_uri}:")
                    content = extract_content_test(mmif, app_uri, start_time, end_time)
                    print(f"  Result: {len(content)} chars")
                    if content:
                        print(f"  Content: {repr(content[:200])}")
        break