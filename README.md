# IASA Hawaii Chyron Analysis Repository

This repository contains tools and scripts for analyzing Hawaii chyron detection and transcription using various vision-language models. The project evaluates the performance of different models (LLaVA and SmolVLM2) on transcribing text from video frames.



## Gold Standard Data

The gold standard annotations are stored in `hi-chy/img_arr_prog_2_I-transcribed.json` and contain:
- Frame identifiers with timestamps
- Human-transcribed text for each frame

## Model Configurations

The pipeline tests two instruction configurations:
- `hi-chy-annotator_instructions-3`: basic transcription instructions
- `hi-chy-annotator_instructions-4`: structured transcription instructions


## Output Structure

Results are organized hierarchically:
```
output/
├── llava/
│   ├── hi-chy-annotator_instructions-3/
│   │   ├── cpb-aacip-225-12z34w2c.mmif
│   │   └── ...
│   └── hi-chy-annotator_instructions-4/
└── smol-vlm2/
    ├── hi-chy-annotator_instructions-3/
    └── hi-chy-annotator_instructions-4/

html/
├── llava/
│   ├── hi-chy-annotator_instructions-3/
│   │   ├── cpb-aacip-225-12z34w2c.html
│   │   └── ...
│   └── hi-chy-annotator_instructions-4/
└── smol-vlm2/
    ├── hi-chy-annotator_instructions-3/
    └── hi-chy-annotator_instructions-4/
```
