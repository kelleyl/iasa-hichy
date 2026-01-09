#!/usr/bin/env python3

import sys
sys.path.insert(0, '/home/kmlynch/clams_apps/app-llama-video-summarizer')

import yaml

# Test the prompt handling logic
config_path = '/home/kmlynch/clams_apps/app-llama-video-summarizer/config/iasa-hichy-chyron-llava.yaml'
with open(config_path, 'r') as f:
    config = yaml.safe_load(f)

print("Testing prompt configuration...")

# Simulate the app's prompt loading logic
default_prompt = config.get("default_prompt", {})
user_prompt = default_prompt.get("user", "")
prompts = config.get('custom_prompts', {})
label_mapping = config['context_config'].get('timeframe', {}).get('label_mapping', {})

print(f"Default user prompt length: {len(user_prompt)} chars")
print(f"Custom prompts: {list(prompts.keys())}")
print(f"Label mapping: {label_mapping}")

# Test the label resolution logic
label = "chyron"
label_id = label_mapping.get(label)
print(f"\nLabel '{label}' maps to: {label_id}")

if label_id and label_id in prompts:
    custom_prompt = prompts[label_id]
    print(f"Custom prompt type: {type(custom_prompt)}")
    
    # Apply the fix logic
    if isinstance(custom_prompt, dict) and 'user' in custom_prompt:
        selected_prompt = custom_prompt['user']
        print(f"Extracted user prompt length: {len(selected_prompt)} chars")
        print(f"User prompt starts with: {selected_prompt[:100]}...")
    else:
        selected_prompt = custom_prompt
        print(f"Direct prompt: {selected_prompt}")
else:
    selected_prompt = user_prompt
    print("Using default user prompt")

# Test prompt formatting with placeholder
context_dict = {"ocr_text": "JOHN DOE CNN CORRESPONDENT"}
try:
    formatted_prompt = selected_prompt.format(**context_dict)
    print(f"\n✅ Prompt formatting successful!")
    print(f"Formatted prompt length: {len(formatted_prompt)} chars")
    print(f"Contains OCR text: {'JOHN DOE' in formatted_prompt}")
except Exception as e:
    print(f"\n❌ Prompt formatting failed: {e}")