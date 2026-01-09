# JCDL Paper: Evaluating Vision-Language Models for Chyron Text Transcription in Historical Broadcast Video

## Paper Outline and Research Notes

### 1. Introduction

#### 1.1 Problem Statement
- Challenge of making historical broadcast video content searchable and accessible
- Importance of chyron text (lower-third graphics) for identifying speakers and contextual information
- Manual transcription is labor-intensive and does not scale for large archival collections
- Need for automated approaches using modern vision-language models

#### 1.2 Research Questions
- How effectively can modern vision-language models (LLaVA, SmolVLM2) transcribe chyron text from historical broadcast video?
- What is the impact of different instruction prompting strategies on transcription accuracy?
- How do these models perform across different types of chyron formats and content complexity?

#### 1.3 Contributions
- First systematic evaluation of vision-language models for chyron transcription in archival broadcast video
- Creation of a gold-standard dataset of human-annotated chyron text from Hawaii public television archives
- Comparative analysis of two state-of-the-art models with multiple instruction configurations
- Analysis of error patterns and model limitations for this specialized OCR task

### 2. Related Work

#### 2.1 Digital Archives and Video Processing
- Historical context of broadcast video digitization efforts
- Challenges in making audiovisual content searchable
- Previous work on automatic speech recognition and video content analysis

#### 2.2 Vision-Language Models for OCR
- Evolution from traditional OCR to vision-language approaches
- Recent advances in multimodal models (LLaVA, SmolVLM2, etc.)
- Applications to document analysis and scene text recognition

#### 2.3 Evaluation Methodologies for OCR
- Traditional metrics: Character Error Rate (CER) and Word Error Rate (WER)
- Challenges in evaluating OCR for broadcast graphics
- Case sensitivity and formatting considerations

### 3. Dataset Creation and Methodology

#### 3.1 Source Material
- **Archive**: Hawaii Public Television broadcast recordings from IASA (International Association of Sound and Audiovisual Archives)
- **Time Period**: Historical broadcasts spanning multiple decades
- **Content Type**: News programs, political discussions, and public affairs programming
- **Video Format**: Digitized historical recordings in MMIF (Multi-Media Interchange Format)

#### 3.2 Frame Selection Process
- **Automatic Detection**: Use of CLAMS (Computational Linguistics Applications for Multimedia Services) pipeline to identify candidate frames
- **Filtering Criteria**: Focus on frames containing "I" type annotations (person identification chyrons)
- **Timepoint Extraction**: Precise millisecond-level frame identification using video metadata
- **Quality Control**: Manual verification of selected frames for chyron presence and legibility

#### 3.3 Gold Standard Creation
- **Human Annotation Process**: Manual transcription of chyron text by domain experts
- **Annotation Guidelines**: 
  - Verbatim transcription preserving exact text, spacing, and line breaks
  - Focus on lower-third chyron areas only (excluding upper screen text)
  - Hawaiian character handling (okina using backtick character)
  - Multi-line text preservation with proper formatting
- **Quality Assurance**: 
  - Duplicate detection and marking using `mark_dupe_trans.py`
  - Cross-validation of transcriptions
  - Consistency checks across annotators

#### 3.4 Dataset Statistics
- **Total Frames**: ~1000+ annotated frames across multiple video files
- **Text Complexity**: Range from simple names to complex multi-line identifications
- **Format Variety**: Different chyron styles, fonts, and background treatments
- **Content Types**: 
  - Speaker names and titles
  - Institutional affiliations
  - Geographic locations
  - Professional roles and credentials

### 4. Experimental Setup

#### 4.1 Model Selection
- **LLaVA (Large Language and Vision Assistant)**: State-of-the-art vision-language model
- **SmolVLM2**: Efficient vision-language model optimized for speed and accuracy
- **Model Configuration**: Default parameters with 3-beam search for generation

#### 4.2 Instruction Engineering
Two distinct prompting strategies tested:
- **Basic Instructions (instructions-3)**: Simple transcription request
- **Structured Instructions (instructions-4)**: Detailed formatting and content guidelines
- **Prompt Design**: Specific instructions for chyron text extraction and formatting

#### 4.3 Evaluation Framework
- **MMIF Pipeline Integration**: Seamless processing of video metadata and frame extraction
- **Automated Processing**: Parallel execution of both models for efficiency
- **Multiple Runs**: Statistical validation through repeated experiments
- **GPU Monitoring**: Resource utilization tracking during inference

#### 4.4 Metrics Implementation
- **Character Error Rate (CER)**: Character-level accuracy using Levenshtein distance
- **Word Error Rate (WER)**: Word-level accuracy assessment
- **Case-Sensitive vs. Case-Insensitive**: Both metrics computed for comprehensive analysis
- **Text Cleaning Pipeline**: 
  - Removal of model-specific formatting tokens
  - Normalization of whitespace and line breaks
  - Handling of special characters and Hawaiian text

### 5. Results and Analysis

#### 5.1 Overall Performance
Based on preliminary results from `overall_metrics_summary.json`:
- **Best Performing Configuration**: SmolVLM2 with structured instructions (instructions-4)
  - CER: 36.30% (case-sensitive), 16.53% (case-insensitive)
  - WER: 214.75% (case-sensitive), 72.24% (case-insensitive)
- **Performance Variation**: Significant differences between instruction strategies
- **Model Comparison**: Detailed analysis of LLaVA vs. SmolVLM2 performance patterns

#### 5.2 Instruction Strategy Impact
- **Structured Instructions**: Generally improved performance across both models
- **Error Pattern Analysis**: Different types of errors with basic vs. structured prompts
- **Consistency**: Variation in performance across multiple runs

#### 5.3 Error Analysis
- **Common Error Types**:
  - Character recognition errors in challenging fonts
  - Line break and spacing issues
  - Hawaiian character handling (okina transcription)
  - Multi-line text alignment problems
- **Performance by Content Type**:
  - Simple names vs. complex titles
  - Impact of background graphics and overlay styles
  - Font size and clarity effects

#### 5.4 Case Sensitivity Analysis
- **Significant Performance Difference**: Case-insensitive metrics substantially better
- **Implications**: Models struggle with exact case preservation but capture semantic content
- **Practical Applications**: Case-insensitive evaluation more relevant for search applications

### 6. Discussion

#### 6.1 Practical Applications
- **Archive Searchability**: Enabling full-text search across historical broadcast content
- **Speaker Identification**: Automated extraction of participant information
- **Content Analysis**: Understanding program structure and participant roles
- **Accessibility**: Supporting hearing-impaired access to visual information

#### 6.2 Limitations and Challenges
- **Historical Video Quality**: Degraded source material affects OCR accuracy
- **Font and Style Variation**: Inconsistent chyron designs across time periods
- **Context Sensitivity**: Models may hallucinate text based on visual context
- **Computational Requirements**: Resource-intensive processing for large archives

#### 6.3 Future Work
- **Model Fine-tuning**: Domain-specific training on broadcast graphics
- **Multi-modal Approaches**: Combining OCR with speech recognition and video understanding
- **Active Learning**: Iterative improvement through selective human annotation
- **Temporal Consistency**: Leveraging temporal continuity in video sequences

### 7. Technical Implementation Details

#### 7.1 Processing Pipeline
- **CLAMS Framework**: Integration with computational linguistics multimedia pipeline
- **MMIF Format**: Standardized metadata interchange for multimedia processing
- **Parallel Processing**: Concurrent model execution for efficiency
- **Error Handling**: Robust pipeline with failure recovery and logging

#### 7.2 Evaluation Infrastructure
- **Automated Metrics Calculation**: Python-based evaluation using `calculate_metrics.py`
- **HTML Report Generation**: Visual comparison interface for qualitative analysis
- **CSV Export**: Structured data export for statistical analysis
- **GPU Utilization Monitoring**: Resource tracking during model inference

#### 7.3 Reproducibility
- **Configuration Management**: YAML-based model and instruction configuration
- **Version Control**: Complete pipeline reproducibility through scripted execution
- **Data Sharing**: Anonymized dataset preparation for research community

### 8. Conclusion

#### 8.1 Key Findings
- Vision-language models show promise for chyron transcription but significant room for improvement
- Instruction engineering has measurable impact on performance
- Case-insensitive evaluation more practically relevant than strict character matching
- Model choice and configuration significantly affect accuracy

#### 8.2 Implications for Digital Archives
- Automated processing can accelerate archival video processing workflows
- Human-in-the-loop approaches likely necessary for production systems
- Cost-benefit analysis of automated vs. manual transcription approaches

#### 8.3 Research Impact
- Establishes baseline performance for vision-language models on broadcast graphics
- Provides methodology for systematic evaluation of OCR in archival contexts
- Opens new research directions in multimodal content analysis