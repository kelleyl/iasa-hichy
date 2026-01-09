import argparse
from pathlib import Path
import pandas as pd
from mmif import Mmif, DocumentTypes, AnnotationTypes
from mmif.utils import timeunit_helper as tuh

def inspect_timing(mmif_path, gold_dir):
    print(f"\n====== INSPECTING: {mmif_path.name} ======")
    
    # 1. Load Gold Data
    clean_name = mmif_path.name.replace('.mmif', '')
    guid = clean_name.split('_')[0]
    gold_file = gold_dir / f"{guid}.json"
    
    if not gold_file.exists():
        print(f"[ERR] Gold file not found: {gold_file}")
        return

    gold_df = pd.read_json(gold_file)
    
    # Print first few Gold ranges for reference
    print(f"\n--- GOLD RANGES (First 3) ---")
    
    # Helper to parse ISO time
    def parse_iso(x): 
        return int(tuh.convert(x, 'iso', 'milliseconds', 1))

    # Convert gold to ms for display
    if 'at' in gold_df.columns:
        gold_df['start_ms'] = gold_df['at'].apply(parse_iso)
        gold_df['end_ms'] = gold_df['start_ms'] + 1000 # dummy duration
    else:
        gold_df['start_ms'] = gold_df['start'].apply(parse_iso)
        gold_df['end_ms'] = gold_df['end'].apply(parse_iso)
        
    for i, row in gold_df.head(3).iterrows():
        print(f"Gold #{i}: {row['start_ms']}ms -> {row['end_ms']}ms | Text: '{str(row.get('text-transcript',''))[:20]}...'")

    # 2. Inspect MMIF Predictions
    try:
        mmif = Mmif(open(mmif_path).read())
    except Exception as e:
        print(f"[ERR] Failed to parse MMIF: {e}")
        return

    # Check FPS
    fps = 29.97
    try:
        fps_doc = next(doc for doc in mmif.documents if doc.get_property('fps'))
        fps = fps_doc.get_property('fps')
        print(f"\n[INFO] FPS found in MMIF: {fps}")
    except StopIteration:
        print(f"\n[WARN] No FPS found in MMIF. Using default: {fps}")

    print(f"\n--- PREDICTION TIMING DEBUG ---")
    tr_views = mmif.get_all_views_contain(DocumentTypes.TextDocument)
    
    found_preds = 0
    for view in tr_views:
        print(f"Scanning View: {view.id}")
        for td in view.get_annotations(DocumentTypes.TextDocument):
            if found_preds >= 5: break # Only show first 5 predictions
            
            origin_id = td.get_property('origin')
            if origin_id:
                # Trace the chain: TextDoc -> TimeFrame -> TimePoint
                try:
                    tf_obj = mmif[origin_id]
                    reps = tf_obj.get_property('representatives')
                    if reps:
                        tp_id = reps[0]
                        tp_obj = mmif[tp_id]
                        
                        # RAW VALUES
                        raw_tp_val = tp_obj.get_property('timePoint')
                        
                        # CALCULATION 1: Assume it is a Frame Index
                        calc_from_frame = int((raw_tp_val / fps) * 1000)
                        
                        # CALCULATION 2: Assume it is already Milliseconds
                        calc_raw_ms = int(raw_tp_val)

                        print(f"Pred #{found_preds}: '{td.text_value[:20]}...'")
                        print(f"   > Origin ID: {origin_id} -> Rep ID: {tp_id}")
                        print(f"   > Raw 'timePoint' value: {raw_tp_val}")
                        print(f"   > If Frame: {calc_from_frame} ms")
                        print(f"   > If Millis: {calc_raw_ms} ms")
                        
                        # Check matches
                        match_frame = any(r['start_ms'] <= calc_from_frame <= r['end_ms'] for _, r in gold_df.iterrows())
                        match_raw = any(r['start_ms'] <= calc_raw_ms <= r['end_ms'] for _, r in gold_df.iterrows())
                        
                        if match_frame: print("   > MATCH STATUS: Matches Gold if treated as FRAME")
                        elif match_raw: print("   > MATCH STATUS: Matches Gold if treated as MILLISECONDS")
                        else: print("   > MATCH STATUS: NO MATCH in either calculation")
                        print("-" * 30)
                        
                        found_preds += 1
                except Exception as e:
                    print(f"Error tracing {td.id}: {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('mmif_file', help="Path to a single MMIF output file")
    parser.add_argument('--gold_dir', required=True)
    args = parser.parse_args()
    
    inspect_timing(Path(args.mmif_file), Path(args.gold_dir))