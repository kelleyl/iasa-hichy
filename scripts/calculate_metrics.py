import json
import Levenshtein
import sys
import os
from typing import Dict, Tuple, List
from mmif import Mmif, View, Document, AnnotationTypes, DocumentTypes
from mmif.utils import video_document_helper as vdh
from pathlib import Path
from PIL import Image
import argparse
import base64

def clean_model1_text(text: str) -> str:
    """Clean text from model 1 output."""
    # Extract text after [/INST]
    if '[/INST]' in text:
        text = text.split('[/INST]')[1]
    # Remove backticks
    text = text.replace('`', '')
    # Strip leading/trailing newlines and normalize internal newlines
    text = text.strip()
    text = text.replace('\n', '\n\n')
    return text

def clean_model2_text(text: str) -> str:
    """Clean text from model 2 output."""
    try:
        # Parse JSON and get value
        data = json.loads(text)
        text = data.get('value', '')
        # Strip leading/trailing newlines and normalize internal newlines
        text = text.strip()
        text = text.replace('\n', '\n\n')
        return text
    except json.JSONDecodeError:
        return ''

def calculate_metrics(hyp: str, ref: str) -> Tuple[float, float]:
    """Calculate CER and WER for a hypothesis and reference text."""
    # print("\nCalculating metrics:", file=sys.stderr)
    # print("Hypothesis:", repr(hyp), file=sys.stderr)
    # print("Reference:", repr(ref), file=sys.stderr)
    
    # Character Error Rate
    cer = Levenshtein.distance(hyp, ref) / len(ref) if ref else 0.0
    
    # Word Error Rate
    hyp_words = hyp.split()
    ref_words = ref.split()
    wer = Levenshtein.distance(
        ' '.join(hyp_words), 
        ' '.join(ref_words)
    ) / len(ref_words) if ref_words else 0.0
    
    print(f"CER: {cer}, WER: {wer}", file=sys.stderr)
    return cer, wer

def extract_text_with_timepoints(mmif_data: Mmif) -> List[Dict]:
    """Extract text documents and their timepoint alignments from LLaVA app view."""
    text_annotations = []
    
    # Find the LLaVA app view that contains text documents
    ocr_view = None
    for view in mmif_data.get_views_contain(DocumentTypes.TextDocument):
        if 'captioner' in view.metadata.app.lower():
            ocr_view = view
            break
    
    if not ocr_view:
        print("No OCR app view found", file=sys.stderr)
        return text_annotations
    
    print(f"Found OCR view: {ocr_view.metadata.app}", file=sys.stderr)
    
    # Get all text documents from this view
    text_docs = list(ocr_view.get_annotations(DocumentTypes.TextDocument))
    print(f"Found {len(text_docs)} text documents", file=sys.stderr)
    
    # Get all alignment annotations from this view
    alignments = list(ocr_view.get_annotations(AnnotationTypes.Alignment))
    print(f"Found {len(alignments)} alignment annotations", file=sys.stderr)
    
    # Create a mapping from text document ID to alignment
    text_to_alignment = {}
    for alignment in alignments:
        target = alignment.get_property('target')
        source = alignment.get_property('source')
        if target:
            text_to_alignment[target] = source
    
    # Get all timepoint annotations to map source IDs to timepoints
    timepoint_map = {}
    for view in mmif_data.get_views_contain(AnnotationTypes.TimePoint):
        timepoints = list(view.get_annotations(AnnotationTypes.TimePoint))
        for tp in timepoints:
            timepoint_map[tp.long_id] = tp.get_property('timePoint')
    
    # Combine text documents with their timepoints
    for text_doc in text_docs:
        all_aligned = text_doc.get_all_aligned()
        for aligned in all_aligned:
            if aligned.at_type == AnnotationTypes.TimePoint:
                ms = aligned.get_property('timePoint')
                text_annotations.append({
                    'text': text_doc.text_value,
                    'timepoint': ms,
                    'text_id': text_doc.long_id
                })
                print(f"Text document {text_doc.long_id} aligned to timepoint {ms}", file=sys.stderr)
    return text_annotations

def create_gold_standard_lookup(gold_file: str) -> Dict[str, str]:
    """Create a lookup dictionary from gold standard data."""
    with open(gold_file, 'r') as f:
        gold_data = json.load(f)
    
    # Create gold standard lookup: {frame_key: reference_text}
    gold_dict = {entry[0]: entry[5] for entry in gold_data}
    print(f"Loaded {len(gold_dict)} gold standard entries", file=sys.stderr)
    print("Sample gold standard keys:", list(gold_dict.keys())[:5], file=sys.stderr)
    
    return gold_dict

def find_closest_gold_match(timepoint: int, gold_dict: Dict[str, str], mmif_filename: str) -> Tuple[str, str]:
    """Find the closest matching gold standard entry for a given timepoint."""
    # Extract GUID from MMIF filename
    base_name = os.path.basename(mmif_filename).replace('.mmif', '')
    
    # Look for gold standard keys that start with this GUID
    matching_keys = [key for key in gold_dict.keys() if key.startswith(base_name)]
    
    if not matching_keys:
        return None, ""
    
    # Find the key that contains the timepoint in the middle position
    # Gold standard key format: guid_total-length_requested-ms_frame-time-ms.jpg
    for key in matching_keys:
        parts = key.split('_')
        if len(parts) >= 4:
            try:
                # Use the middle number (parts[2]) instead of the last number
                frame_time = int(parts[2])
                if frame_time == timepoint:
                    return key, gold_dict[key]
            except ValueError:
                continue
    
    return None, ""

def extract_frame_data_uri(mmif_data, timepoint, mmif_file):
    """Extract a frame for a given timepoint (ms) from the MMIF video document and return a Base64 data URI."""
    try:
        video_docs = mmif_data.get_documents_by_type(DocumentTypes.VideoDocument)
        if not video_docs:
            print(f"No video document found in {mmif_file}", file=sys.stderr)
            return None
        video_doc = video_docs[0]
        # Get FPS using the correct method
        try:
            fps = float(video_doc.get_property('fps'))
        except (KeyError, TypeError, ValueError):
            fps = 29.97  # Default fallback
        frame_number = int((timepoint / 1000.0) * fps)
        images = vdh.extract_frames_as_images(video_doc, [frame_number], as_PIL=True)
        if not images:
            print(f"Could not extract frame {frame_number} for timepoint {timepoint}ms", file=sys.stderr)
            return None
        image = images[0]
        import io
        import base64
        buf = io.BytesIO()
        image.save(buf, format='JPEG', quality=85)
        b64 = base64.b64encode(buf.getvalue()).decode('ascii')
        mime = 'image/jpeg'
        image_uri = f'data:{mime};base64,{b64}'
        return image_uri
    except Exception as e:
        print(f"Error extracting frame for timepoint {timepoint}ms: {e}", file=sys.stderr)
        return None

def process_files(gold_file: str, mmif_file: str) -> Dict[str, Dict[str, float]]:
    """Process gold and hypothesis files to calculate metrics."""
    try:
        # Load gold standard data
        gold_dict = create_gold_standard_lookup(gold_file)
        
        # Load MMIF data using SDK
        print(f"Loading MMIF file: {mmif_file}", file=sys.stderr)
        with open(mmif_file, 'r') as f:
            mmif_data = Mmif(json.load(f))
        
        # Extract text annotations with timepoints
        text_annotations = extract_text_with_timepoints(mmif_data)
        
        if not text_annotations:
            print("No text annotations found", file=sys.stderr)
            return {
                'overall': {
                    'model1': {'cer': 0.0, 'wer': 0.0},
                    'total_instances': 0
                }
            }
        
        results = {}
        model1_total_cer = 0.0
        model1_total_wer = 0.0
        model1_total_cer_lower = 0.0
        model1_total_wer_lower = 0.0
        total_instances = 0
        
        # Process each text annotation
        for i, annotation in enumerate(text_annotations):
            timepoint = annotation['timepoint']
            text_content = annotation['text']
            
            # Find matching gold standard entry
            frame_key, ref_text = find_closest_gold_match(timepoint, gold_dict, mmif_file)
            
            if frame_key and ref_text:
                print(f"Processing timepoint {timepoint}ms -> {frame_key}", file=sys.stderr)
                print(f"Reference text: {repr(ref_text)}", file=sys.stderr)
                print(f"Raw model text: {repr(text_content)}", file=sys.stderr)
                
                # Clean the model text
                model_text = clean_model1_text(text_content)
                print(f"Cleaned model text: {repr(model_text)}", file=sys.stderr)
                
                # Calculate metrics
                cer, wer = calculate_metrics(model_text, ref_text)
                # Calculate lowercased metrics
                cer_lower, wer_lower = calculate_metrics(model_text.lower(), ref_text.lower())
                
                # Store results for this frame
                frame_id = f"frame_{timepoint}"
                # Extract frame and convert to Base64 data URI
                image_uri = extract_frame_data_uri(mmif_data, timepoint, mmif_file)
                results[frame_id] = {
                    'model1': {
                        'cer': cer,
                        'wer': wer,
                        'cer_lower': cer_lower,
                        'wer_lower': wer_lower,
                        'hypothesis': model_text,
                        'reference': ref_text,
                        'raw': text_content
                    },
                    'image': image_uri
                }
                model1_total_cer += cer
                model1_total_wer += wer
                model1_total_cer_lower += cer_lower
                model1_total_wer_lower += wer_lower
                total_instances += 1
            else:
                print(f"Skipping timepoint {timepoint}ms - no gold standard entry found", file=sys.stderr)
        
        # Add overall metrics for model1 only
        results['overall'] = {
            'model1': {
                'cer': model1_total_cer / total_instances if total_instances > 0 else 0.0,
                'wer': model1_total_wer / total_instances if total_instances > 0 else 0.0,
                'cer_lower': model1_total_cer_lower / total_instances if total_instances > 0 else 0.0,
                'wer_lower': model1_total_wer_lower / total_instances if total_instances > 0 else 0.0
            },
            'total_instances': total_instances
        }
        
        return results
        
    except Exception as e:
        print(f"Error processing files: {e}", file=sys.stderr)
        import traceback
        traceback.print_exc()
        return {
            'overall': {
                'model1': {'cer': 0.0, 'wer': 0.0},
                'total_instances': 0
            }
        }

def main():
    parser = argparse.ArgumentParser(description="Calculate CER/WER metrics and extract frames as Base64 data URIs.")
    parser.add_argument("gold_file", help="Path to gold standard JSON file")
    parser.add_argument("mmif_file", help="Path to MMIF file")
    args = parser.parse_args()
    try:
        results = process_files(args.gold_file, args.mmif_file)
        print("\nFinal results:", file=sys.stderr)
        print(json.dumps(results, indent=2))
    except Exception as e:
        print(f"Error processing files: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == '__main__':
    main() 