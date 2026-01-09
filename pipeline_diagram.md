# CLAMS Pipeline Architecture

This diagram shows the complete pipeline structure implemented in `run_clams_pipeline.sh`.

## Pipeline Overview

```mermaid
graph TD
    %% Input Sources
    A[MMIF Files<br/>*_HI_pass2_candidates_1.mmif + hi-chy-comps*.mmif] --> B[Phase 1: Captioner Models]
    
    %% Phase 1: Captioner Models 
    B --> C1[LLaVA]
    B --> C2[SmolVLM2]
    
    %% Phase 1 Outputs
    C1 --> D1[LLaVA Outputs]
    C2 --> D2[SmolVLM2 Outputs]
    
    %% Phase 2: Llama Processing
    D1 --> E1[Llama]
    D2 --> E2[Llama]
    
    %% Phase 2 Outputs
    E1 --> F1[Llama Outputs]
    E2 --> F2[Llama Outputs]
    
    %% Styling
    classDef inputClass fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    classDef phase1Class fill:#f3e5f5,stroke:#4a148c,stroke-width:2px
    classDef phase2Class fill:#e8f5e8,stroke:#1b5e20,stroke-width:2px
    classDef outputClass fill:#fce4ec,stroke:#880e4f,stroke-width:2px
    
    class A inputClass
    class B,C1,C2 phase1Class
    class E1,E2 phase2Class
    class D1,D2,F1,F2 outputClass
```

## Pipeline Phases

### Phase 1: Captioner Models
- **LLaVA**: Processes video files to generate captions
- **SmolVLM2**: Alternative captioning model running in parallel
- **Processing**: Both models run simultaneously for each video file

### Phase 2: Llama Video Summarizer
- **Input**: Captioner outputs from Phase 1
- **Processing**: Sequential processing after all captioner outputs are complete

## Dataset Types

- **Main Dataset**: `mmif/*_HI_pass2_candidates_1.mmif` files
- **Comparison Dataset**: `comps_mmif/*.mmif` files (processed from external source)
- **Unified Processing**: Both datasets follow the same pipeline flow

## Execution Modes

- **CLI Mode**: Direct execution of Python scripts
- **Service Mode**: HTTP requests to running services on specified ports

## Key Features

- **Parallel Processing**: Captioner models run simultaneously
- **Dependency Management**: Later phases wait for captioner completion
- **Multiple Runs**: Support for multiple execution runs with run-specific output directories
- **Error Handling**: Individual model failures don't stop the entire pipeline
- **GPU Monitoring**: GPU utilization logging during processing
