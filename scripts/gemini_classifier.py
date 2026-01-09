import os
import time
import json
import re
import pandas as pd
from google import genai
from dotenv import load_dotenv

# --- CONFIGURATION ---
load_dotenv()
API_KEY = os.getenv("GEMINI_API_KEY")

if not API_KEY:
    raise ValueError("API Key not found. Please set GEMINI_API_KEY in your .env file.")

FILE_PATHS = [
    "aapb-annotations/understanding-chyrons/250606-hi-chy-hi-post-2000/hi-chy-hi-post-2000_img_labels.json",
    "aapb-annotations/understanding-chyrons/250829-hi-chy-comps-pre-2000/hi-chy-comps-pre-2000_img_labels.json",
    "aapb-annotations/understanding-chyrons/250829-hi-chy-comps-post-2000/hi-chy-comps-post-2000_img_labels.json",
    "aapb-annotations/understanding-chyrons/250606-hi-chy-hi-pre-2000/hi-chy-hi-pre-2000_img_labels.json"
]

OUTPUT_CSV = "merged_labeled_chyrons.csv"
BATCH_SIZE = 20
MODEL_NAME = 'gemini-2.5-flash-lite' 

client = genai.Client(
    api_key=API_KEY,
    http_options={'api_version': 'v1beta'} 
)

def get_dataset_type(filename):
    if "hi-chy-comps" in filename:
        return "comps"
    elif "hi-chy-hi" in filename:
        return "hi"
    else:
        return "unknown"

def preprocess_text(text):
    """
    Removes 'Hawaii', 'Hawaiian', 'Hawai'i', etc. so the model 
    doesn't label everything 'H' just because the state name is there.
    """
    if not isinstance(text, str):
        return ""
    # Matches Hawaii/Hawaiian with optional okina characters: ' ` or ʻ
    pattern = r"\bHawai['`ʻ]?i(?:an)?\b"
    clean = re.sub(pattern, '', text, flags=re.IGNORECASE)
    return " ".join(clean.split())

def build_batch_prompt(texts):
    formatted_list = ""
    for i, text in enumerate(texts):
        # Clean text first
        clean_text = text.replace('"', "'")
        formatted_list += f"{i}. {clean_text}\n"
    
    # --- UPDATED PROMPT ---
    # Simplified, Example-Driven, Explicitly mentions Places
    return f"""
    Classify the proper nouns (People, Places, Streets) in the following list.

    Categories:
    H = Hawaiian origin (Includes places like Kailua, Waipahu, Manoa, Kaneohe, etc.)
    J = Japanese origin (e.g., Takumi, Suzuki, Tanaka)
    B = Both Hawaiian and Japanese
    N = Neither

    Examples:
    - "WHITNEY ANDERSON (R) District 25 Kailua, Waimanalo" -> H (Kailua & Waimanalo are Hawaiian)
    - "ROY TAKUMI (D) District 36 Pearl City, Waipahu" -> B (Takumi is Japanese, Waipahu is Hawaiian)
    - "DAN BOYLAN Newsmakers" -> N
    - "Keiko Bonk" -> B (Keiko is Japanese, Bonk is neither)
    
    Task:
    Return exactly one line per item: "Index. Label" (e.g. "0. H")

    List:
    {formatted_list}
    """

def parse_text_response(response_text, expected_count):
    labels = ["ERR"] * expected_count
    matches = re.findall(r"(\d+)\.\s*([HJBN])", response_text, re.IGNORECASE)
    for index_str, label in matches:
        idx = int(index_str)
        if 0 <= idx < expected_count:
            labels[idx] = label.upper()
    return labels

def process_batch_with_backoff(texts):
    prompt = build_batch_prompt(texts)
    max_retries = 5
    base_wait_time = 30 
    
    for attempt in range(max_retries):
        try:
            response = client.models.generate_content(
                model=MODEL_NAME,
                contents=prompt
            )
            return parse_text_response(response.text, len(texts))

        except Exception as e:
            wait_time = base_wait_time * (2 ** attempt) 
            print(f"\n⚠️ Error on Attempt {attempt+1}/{max_retries}: {e}")
            print(f"   Sleeping for {wait_time} seconds before retrying...")
            time.sleep(wait_time)
            
    raise RuntimeError("Max retries exceeded. API is blocking us.")

def main():
    base_dir = os.path.expanduser("~/clams/")
    all_parsed_data = []

    # 1. CLEAN START
    if os.path.exists(OUTPUT_CSV):
        print(f"🗑️  Deleting existing {OUTPUT_CSV} to start fresh...")
        os.remove(OUTPUT_CSV)

    print("--- Loading Files ---")
    for relative_path in FILE_PATHS:
        full_path = os.path.join(base_dir, relative_path)
        dataset_type = get_dataset_type(relative_path)
        try:
            with open(full_path, 'r', encoding='utf-8') as f:
                raw_data = json.load(f)
            for row in raw_data:
                if len(row) > 5:
                    all_parsed_data.append({
                        "filename": row[0],
                        "chyron_text": row[5],
                        "dataset_type": dataset_type
                    })
        except FileNotFoundError:
            print(f"❌ Error: File not found at {full_path}")
            continue

    df = pd.DataFrame(all_parsed_data)
    total_rows = len(df)
    print(f"Total rows: {total_rows}")

    print(f"\n--- Processing (Clean Text / Simple Prompt / Slow Mode) ---")
    
    for i in range(0, total_rows, BATCH_SIZE):
        batch = df.iloc[i : i + BATCH_SIZE]
        
        # We process the text to remove 'Hawaii' before sending to API
        original_texts = batch['chyron_text'].tolist()
        cleaned_texts_for_ai = [preprocess_text(t) for t in original_texts]
        
        print(f"Rows {i}-{min(i + BATCH_SIZE, total_rows)}: ", end="", flush=True)
        
        try:
            labels = process_batch_with_backoff(cleaned_texts_for_ai)
            
            # Prepare & Save
            batch = batch.copy()
            batch['origin_label'] = labels
            
            # Keep original text in CSV
            batch = batch[['filename', 'chyron_text', 'dataset_type', 'origin_label']]
            
            header = not os.path.exists(OUTPUT_CSV)
            batch.to_csv(OUTPUT_CSV, mode='a', header=header, index=False)
            
            print(f"✅ Saved. (Labels: {labels[:3]}...)")
            
            # Slow & Steady
            time.sleep(20) 
            
        except RuntimeError:
            print("\n❌ CRITICAL STOP: API is rejecting connections.")
            break
        except KeyboardInterrupt:
            print("\nStopped by user.")
            break

    print("Job Complete.")

if __name__ == "__main__":
    main()