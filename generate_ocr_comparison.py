import argparse
from pathlib import Path
import pandas as pd
from tqdm import tqdm
from mmif import Mmif, DocumentTypes, AnnotationTypes
from mmif.utils import timeunit_helper as tuh

# --- Configuration ---
# Threshold in milliseconds to match Gold (3s window)
TIMING_MS_THRESHOLD = 3000 

def get_gold_data(gold_file: Path) -> list:
    """
    Reads Gold JSON/CSV, normalizes columns, returns list of dicts.
    """
    if not gold_file.exists():
        # Fallback: try finding it with a glob
        parent = gold_file.parent
        guid = gold_file.stem
        potentials = list(parent.glob(f"*{guid}*.json"))
        if potentials:
            gold_file = potentials[0]
        else:
            return []

    try:
        if gold_file.suffix == '.csv':
            df = pd.read_csv(gold_file)
        elif gold_file.suffix == '.json':
            df = pd.read_json(gold_file)
        else:
            return []
    except Exception:
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
        return []

    return df[['start', 'end', 'text']].to_dict('records')

def get_pred_data(mmif_file: Path) -> dict:
    """
    Parses MMIF. Handles TextDocument -> Origin (TimeFrame) -> Representative (TimePoint) chain.
    """
    try:
        mmif = Mmif(open(mmif_file).read())
    except Exception:
        return {}

    preds = {}
    
    # Find the view containing TextDocuments
    tr_views = mmif.get_all_views_contain(DocumentTypes.TextDocument)
    
    for view in tr_views:
        for td in view.get_annotations(DocumentTypes.TextDocument):
            text_content = td.text_value
            if not text_content: continue

            # --- RESOLUTION LOGIC ---
            # Strategy: TextDocument -> origin (TimeFrame) -> representatives (TimePoint) -> timePoint value
            origin_id = td.get_property('origin')
            
            if origin_id:
                try:
                    # Get the TimeFrame object
                    tf_obj = mmif[origin_id]
                    
                    # Look for representatives
                    reps = tf_obj.get_property('representatives')
                    if reps:
                        tp_id = reps[0] 
                        tp_obj = mmif[tp_id]
                        
                        # RAW VALUE is already in milliseconds for SmolVLM2/CLAMS
                        raw_val = tp_obj.get_property('timePoint')
                        ms = int(raw_val)
                        preds[ms] = text_content
                except Exception:
                    continue
            
            # Fallback: Explicit alignments
            elif td.get_all_aligned():
                for alignment in td.get_all_aligned():
                    if alignment.at_type == AnnotationTypes.TimePoint:
                        try:
                            raw_time = mmif.get_start(alignment)
                            time_unit = alignment.get_property('timeunit') or 'milliseconds'
                            if time_unit == 'milliseconds':
                                preds[int(raw_time)] = text_content
                        except Exception:
                            continue

    return preds

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--pred_dir', type=str, required=True, help="Directory with .mmif files")
    parser.add_argument('--gold_dir', type=str, required=True, help="Directory with .json gold files")
    parser.add_argument('--output', type=str, default="comparison_report.csv")
    args = parser.parse_args()
    
    pred_dir = Path(args.pred_dir)
    gold_dir = Path(args.gold_dir)
    results = []
    
    mmif_files = sorted(list(pred_dir.glob("*.mmif")))
    print(f"Found {len(mmif_files)} MMIF files in {pred_dir}")
    print("Starting processing...")

    # TQDM Loop
    for mmif_file in tqdm(mmif_files, desc="Extracting OCR", unit="file"):
        
        # 1. Clean GUID Extraction
        clean_name = mmif_file.name.replace('.mmif', '')
        guid = clean_name.split('_')[0]
        
        # 2. Locate Gold File
        gold_file = gold_dir / f"{guid}.json"
        
        # 3. Load Data
        gold_data = get_gold_data(gold_file)
        pred_data = get_pred_data(mmif_file)
        
        if not pred_data:
            continue

        # 4. Match Predictions to Gold
        for pred_time, pred_text in pred_data.items():
            matched_gold_text = None
            
            if gold_data:
                for item in gold_data:
                    # Check window match
                    if (item['start'] - TIMING_MS_THRESHOLD) <= pred_time <= (item['end'] + TIMING_MS_THRESHOLD):
                        matched_gold_text = item['text']
                        break
            
            results.append({
                'GUID': guid,
                'Time_MS': pred_time,
                'Gold_Text': matched_gold_text if matched_gold_text else "[NO GOLD MATCH]",
                'Prediction': pred_text
            })

    # 5. Save Report
    if results:
        df = pd.DataFrame(results)
        # Reorder columns for readability
        df = df[['GUID', 'Time_MS', 'Gold_Text', 'Prediction']]
        df.to_csv(args.output, index=False)
        print(f"\n[SUCCESS] Generated {args.output} with {len(results)} rows.")
    else:
        print("\n[WARN] No matching predictions found.")

if __name__ == "__main__":
    main()