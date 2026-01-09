# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

IASA Hawaii Chyron Analysis Repository - Evaluates the performance of vision-language models (LLaVA and SmolVLM2) on transcribing chyron text from video frames. The project compares model outputs against human-annotated gold standard data using Character Error Rate (CER) and Word Error Rate (WER) metrics.

## Architecture

### Core Components

- **Gold Standard Data**: Human-transcribed annotations in `hi-chy/img_arr_prog_2_I-transcribed.json`
- **MMIF Processing**: Video metadata and analysis results stored in MMIF format in `mmif/` directory
- **Model Evaluation**: Two vision-language models (LLaVA, SmolVLM2) with multiple instruction configurations
- **Metrics Calculation**: Python script computes CER/WER metrics against gold standard
- **Output Generation**: HTML reports and CSV summaries for analysis

### Directory Structure

```
output/           # Model outputs organized by model/config/file.mmif
metrics/          # Calculated metrics as JSON files
html/             # Generated HTML comparison reports
hi-chy/           # Gold standard data and image labeling tools
scripts/          # Processing pipeline scripts
dataset_explorer/ # FAISS-based dataset exploration tool
```

### Data Flow

1. Input MMIF files contain video frame metadata and candidate annotations
2. Models process frames using different instruction configurations
3. Python metrics script compares outputs to gold standard
4. HTML generator creates visual comparison reports
5. CSV aggregation provides summary statistics

## Key Commands

### Run Full Pipeline
```bash
./scripts/run_clams_pipeline.sh [NUM_RUNS] [--mode cli|service] [--llava-port PORT] [--smolvlm2-port PORT]
```

### Generate Metrics and HTML Reports
```bash
./scripts/generate_html.sh
```

### Generate CSV Summary
```bash
./scripts/generate_metrics_csv.sh
```

### Compute Overall Statistics
```bash
./scripts/compute_overall_metrics.sh
```

### Dataset Explorer (Flask App)
```bash
cd dataset_explorer
python app.py
```

## Model Configurations

- `hi-chy-annotator_instructions-3`: Basic transcription instructions
- `hi-chy-annotator_instructions-4`: Structured transcription instructions
- Multiple runs supported for statistical validation

## Python Dependencies

Main requirements in `scripts/requirements.txt`:
- Levenshtein (text distance metrics)
- mmif-python (MMIF format handling)
- Pillow (image processing)

Dataset explorer uses Flask, FAISS, and sentence-transformers.

## Development Notes

- CUDA_VISIBLE_DEVICES=0 set for single GPU usage
- GPU monitoring during model runs
- Parallel processing of LLaVA and SmolVLM2 models
- Error handling for missing files and failed processing
- HTML reports include sortable tables and metric visualization

## Image Labeling Tool

The `hi-chy/` directory contains a keystroke-based image labeling application with extensive category definitions for different types of video frames (chyrons, slates, logos, etc.). Configuration in `conf.js` defines labels and behavior.