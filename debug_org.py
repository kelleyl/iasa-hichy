import json
import csv
import argparse
from pathlib import Path
import pandas as pd
from mmif import Mmif, DocumentTypes, AnnotationTypes
from mmif.utils import timeunit_helper as tuh

# --- Configuration ---
TIMING_MS_THRESHOLD = 2000 

def get_gold_data(gold_file: Path) -> list:
    if not gold_file.exists():
        print(f"  [DEBUG] Gold file NOT FOUND: {gold_file}")
        return []
        
    print(f"  [DEBUG] Loading Gold: {gold_file.name}")
    try:
        if gold_file.suffix == '.csv':
            df = pd.read_csv(gold_file)
        elif gold_file.suffix == '.json':
            df = pd.read_json(gold_file)
        else:
            return []
    except Exception as e:
        print(f"  [ERR] Failed to read gold file: {e}")
        return []

    # Normalize column names and convert to milliseconds
    if 'at' in df.columns:
        df = df.rename(columns={'at': 'start'})
        df['start'] = df['start'].apply(lambda x: tuh.convert(x, 'iso', 'milliseconds', 1))
        df['end'] = df['start'] + 1
    elif 'start' in df.columns and 'end' in df.columns:
        df['start'] = df['start'].apply(lambda x: tuh.convert(x, 'iso', 'milliseconds', 1))
        df['end'] = df['end'].apply(lambda x: tuh.convert(x, 'iso', 'milliseconds', 1))
    
    if 'text-transcript' in df.columns:
        df['text'] = df['text-transcript'].apply(lambda x: str(x).replace('\\n', '\n'))
    
    if 'text' not in df.columns:
        print(f"  [ERR] Gold file missing 'text' column. Columns: {df.columns}")
        return []

    data = df[['start', 'end', 'text']].to_dict('records')
    return data

def get_pred_data(mmif_file: Path) -> dict:
    print(f"  [DEBUG] Parsing MMIF: {mmif_file.name}")
    try:
        mmif = Mmif(open(mmif_file).read())
    except Exception as e:
        print(f"  [ERR] MMIF Parse Failed: {e}")
        return {}

    fps = 29.97
    try:
        fps_doc = next(doc for doc in mmif.documents if doc.get_property('fps'))
        fps = fps_doc.get_property('fps')
    except StopIteration:
        pass

    preds = {}
    tr_views = mmif.get_all_views_contain(DocumentTypes.TextDocument)
    
    if not tr_views:
        print("  [DEBUG] No views containing TextDocument found.")
        return {}
    
    for view in tr_views:
        td_anns = list(view.get_annotations(DocumentTypes.TextDocument))
        for td in td_anns:
            text_content = td.text_value
            if not text_content: continue

            aligned = list(td.get_all_aligned())
            for alignment in aligned:
                if alignment.at_type == AnnotationTypes.TimePoint:
                    raw_time = mmif.get_start(alignment)
                    time_unit = alignment.get_property('timeunit') or 'milliseconds'
                    try:
                        ms = int(tuh.convert(raw_time, time_unit, 'milliseconds', fps))
                        preds[ms] = text_content
                    except Exception:
                        continue
                        
    print(f"  [DEBUG] Extracted {len(preds)} predictions.")
    return preds

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--pred_dir', type=str, required=True)
    parser.add_argument('--gold_dir', type=str, required=True)
    parser.add_argument('--output', type=str, default="debug_comparison.csv")
    args = parser.parse_args()
    
    pred_dir = Path(args.pred_dir)
    gold_dir = Path(args.gold_dir)
    results = []
    
    mmif_files = sorted(list(pred_dir.glob("*.mmif")))
    print(f"Found {len(mmif_files)} MMIF files. Processing first 5...")

    for i, mmif_file in enumerate(mmif_files):
        if i >= 5: break
        
        print(f"\n--- Processing File {i+1}: {mmif_file.name} ---")
        
        # --- FIX STARTS HERE ---
        # 1. Remove extension
        clean_name = mmif_file.name.replace('.mmif', '')
        # 2. Split by underscore (if any) and take first part
        guid = clean_name.split('_')[0]
        # --- FIX ENDS HERE ---
        
        print(f"  [DEBUG] Derived GUID: {guid}")
        
        gold_file = gold_dir / f"{guid}.json"
        
        if not gold_file.exists():
            print(f"  [WARN] Gold file missing: {gold_file}")
            continue

        gold_data = get_gold_data(gold_file)
        pred_data = get_pred_data(mmif_file)
        
        if not gold_data or not pred_data:
            print("  [DEBUG] Skipping (no data)")
            continue

        rows_added = 0
        for pred_time, pred_text in pred_data.items():
            matched_gold_text = None
            for item in gold_data:
                if (item['start'] - TIMING_MS_THRESHOLD) <= pred_time <= (item['end'] + TIMING_MS_THRESHOLD):
                    matched_gold_text = item['text']
                    break
            
            results.append({
                'GUID': guid,
                'Time_MS': pred_time,
                'Gold_Text': matched_gold_text if matched_gold_text else "[NO_MATCH]",
                'Prediction': pred_text
            })
            rows_added += 1
        print(f"  [DEBUG] Generated {rows_added} rows.")

    if results:
        df = pd.DataFrame(results)
        df = df[['GUID', 'Time_MS', 'Gold_Text', 'Prediction']]
        df.to_csv(args.output, index=False)
        print(f"\nSUCCESS: Wrote {len(results)} rows to {args.output}")
        print(df.head())
    else:
        print("\nFAILURE: No results found to write.")

if __name__ == "__main__":
    main()