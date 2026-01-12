#!/usr/bin/env python3
"""
Evaluate OCR model performance on chyron transcription.

Compares DeepSeek and SmolVLM2 predictions against gold standard,
computing CER/WER metrics across different dataset splits.
"""

import argparse
import csv
import re
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional

try:
    import Levenshtein
except ImportError:
    print("Installing Levenshtein library...")
    import subprocess
    subprocess.check_call(["pip", "install", "Levenshtein"])
    import Levenshtein


def detect_diacritics(text: str) -> dict:
    """
    Detect Hawaiian diacritics in text.

    Returns dict with:
        has_okina: bool - whether text contains 'okina
        has_kahako: bool - whether text contains kahakō (macron vowels)
        has_any: bool - whether text contains any diacritics
        okina_count: int - number of 'okina found
        kahako_count: int - number of kahakō found
    """
    if not text or text == "[NO GOLD MATCH]":
        return {"has_okina": False, "has_kahako": False, "has_any": False,
                "okina_count": 0, "kahako_count": 0}

    # Kahakō (macron) vowels
    kahako_chars = set("āēīōūĀĒĪŌŪ")
    kahako_count = sum(1 for c in text if c in kahako_chars)

    # Proper 'okina (U+02BB)
    proper_okina = text.count("ʻ")

    # Apostrophe-like characters that may represent 'okina
    # Check if they appear before a vowel
    apostrophe_chars = ["'", "'", "`", "'"]  # U+0027, U+2019, U+0060, U+2018
    vowels = set("aeiouAEIOU")

    apostrophe_okina_count = 0
    for i, c in enumerate(text):
        if c in apostrophe_chars:
            # Check if next character is a vowel
            if i + 1 < len(text) and text[i + 1] in vowels:
                apostrophe_okina_count += 1

    okina_count = proper_okina + apostrophe_okina_count

    return {
        "has_okina": okina_count > 0,
        "has_kahako": kahako_count > 0,
        "has_any": okina_count > 0 or kahako_count > 0,
        "okina_count": okina_count,
        "kahako_count": kahako_count,
    }


@dataclass
class Prediction:
    """A single prediction record with gold and model outputs."""
    guid: str
    time_ms: str
    gold_text: str
    gold_text_normalized: str
    smolvlm2_prediction: str = ""
    smolvlm2_prediction_normalized: str = ""
    deepseek_prediction: str = ""
    deepseek_prediction_normalized: str = ""
    dataset: str = ""  # HI or comps
    origin_label: str = ""  # N, H, J, etc.
    flowers_label: str = ""
    has_okina: bool = False
    has_kahako: bool = False
    has_diacritics: bool = False


@dataclass
class Metrics:
    """Aggregated metrics for a set of predictions."""
    total: int = 0
    matched: int = 0  # predictions with gold match
    cer_sum: float = 0.0
    wer_sum: float = 0.0
    exact_matches: int = 0
    cer_values: list = field(default_factory=list)
    wer_values: list = field(default_factory=list)

    def add(self, cer: float, wer: float, is_exact: bool):
        self.total += 1
        self.matched += 1
        self.cer_sum += cer
        self.wer_sum += wer
        self.cer_values.append(cer)
        self.wer_values.append(wer)
        if is_exact:
            self.exact_matches += 1

    def add_no_match(self):
        self.total += 1

    @property
    def avg_cer(self) -> float:
        return self.cer_sum / self.matched if self.matched > 0 else 0.0

    @property
    def avg_wer(self) -> float:
        return self.wer_sum / self.matched if self.matched > 0 else 0.0

    @property
    def std_cer(self) -> float:
        if self.matched < 2:
            return 0.0
        mean = self.avg_cer
        variance = sum((x - mean) ** 2 for x in self.cer_values) / self.matched
        return variance ** 0.5

    @property
    def std_wer(self) -> float:
        if self.matched < 2:
            return 0.0
        mean = self.avg_wer
        variance = sum((x - mean) ** 2 for x in self.wer_values) / self.matched
        return variance ** 0.5

    @property
    def accuracy(self) -> float:
        return self.exact_matches / self.matched if self.matched > 0 else 0.0


def normalize_text(text: str) -> str:
    """
    Normalize text for comparison.
    - Lowercase
    - Remove newlines
    - Collapse whitespace
    - Remove punctuation except apostrophes
    """
    if not text or text == "[NO GOLD MATCH]":
        return ""

    text = text.lower()
    text = text.replace("\n", " ")
    # Remove punctuation except apostrophes
    text = re.sub(r"[^\w\s']", " ", text)
    # Collapse whitespace
    text = re.sub(r"\s+", " ", text).strip()
    return text


def compute_cer(reference: str, hypothesis: str) -> float:
    """Compute Character Error Rate, capped at 1.0."""
    if not reference:
        return 0.0 if not hypothesis else 1.0
    distance = Levenshtein.distance(reference, hypothesis)
    return min(distance / len(reference), 1.0)


def compute_wer(reference: str, hypothesis: str) -> float:
    """Compute Word Error Rate, capped at 1.0."""
    ref_words = reference.split()
    hyp_words = hypothesis.split()

    if not ref_words:
        return 0.0 if not hyp_words else 1.0

    # Use Levenshtein on word sequences
    distance = Levenshtein.distance(ref_words, hyp_words)
    return min(distance / len(ref_words), 1.0)


def load_smolvlm2_data(filepath: Path) -> dict[tuple[str, str], Prediction]:
    """Load SmolVLM2 results file as base dataset."""
    predictions = {}

    with open(filepath, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            key = (row['GUID'], row['Time_MS'])

            gold_text = row.get('Gold_Text', '')
            gold_normalized = row.get('Gold_Text normalized', '')

            # Use existing normalized if available, else compute
            if not gold_normalized and gold_text and gold_text != "[NO GOLD MATCH]":
                gold_normalized = normalize_text(gold_text)

            smolvlm2_pred = row.get('smolvlm2 prediction', '')
            smolvlm2_norm = row.get('smolvlm2 prediction normalized', '')
            if not smolvlm2_norm and smolvlm2_pred:
                smolvlm2_norm = normalize_text(smolvlm2_pred)

            # Detect diacritics in gold text
            diacritics = detect_diacritics(gold_text)

            pred = Prediction(
                guid=row['GUID'],
                time_ms=row['Time_MS'],
                gold_text=gold_text,
                gold_text_normalized=gold_normalized,
                smolvlm2_prediction=smolvlm2_pred,
                smolvlm2_prediction_normalized=smolvlm2_norm,
                dataset=row.get('Set', ''),
                origin_label=row.get('Origin label', ''),
                flowers_label=row.get('Flowers label', ''),
                has_okina=diacritics["has_okina"],
                has_kahako=diacritics["has_kahako"],
                has_diacritics=diacritics["has_any"],
            )
            predictions[key] = pred

    return predictions


def load_deepseek_data(filepath: Path, predictions: dict[tuple[str, str], Prediction], dataset: str):
    """Load DeepSeek results and merge into predictions dict."""
    with open(filepath, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            key = (row['GUID'], row['Time_MS'])

            deepseek_pred = row.get('Prediction', '')
            deepseek_norm = normalize_text(deepseek_pred)

            if key in predictions:
                predictions[key].deepseek_prediction = deepseek_pred
                predictions[key].deepseek_prediction_normalized = deepseek_norm
            else:
                # Create new prediction if not in SmolVLM2 data
                gold_text = row.get('Gold_Text', '')
                gold_normalized = normalize_text(gold_text) if gold_text and gold_text != "[NO GOLD MATCH]" else ""
                diacritics = detect_diacritics(gold_text)

                pred = Prediction(
                    guid=row['GUID'],
                    time_ms=row['Time_MS'],
                    gold_text=gold_text,
                    gold_text_normalized=gold_normalized,
                    deepseek_prediction=deepseek_pred,
                    deepseek_prediction_normalized=deepseek_norm,
                    dataset=dataset,
                    has_okina=diacritics["has_okina"],
                    has_kahako=diacritics["has_kahako"],
                    has_diacritics=diacritics["has_any"],
                )
                predictions[key] = pred


def evaluate_model(
    predictions: dict[tuple[str, str], Prediction],
    model: str,
    use_normalized: bool = True,
    filter_dataset: Optional[str] = None,
    filter_origin: Optional[str] = None,
    filter_flowers: Optional[str] = None,
    filter_diacritics: Optional[str] = None,
) -> Metrics:
    """
    Evaluate a model's predictions.

    Args:
        predictions: Dict of all predictions
        model: "smolvlm2" or "deepseek"
        use_normalized: Whether to use normalized text for comparison
        filter_dataset: Filter by dataset (HI, comps)
        filter_origin: Filter by origin label (N, H, J, etc.)
        filter_flowers: Filter by flowers label (F, G, S, or "none" for empty/#N/A)
        filter_diacritics: Filter by diacritics ("okina", "kahako", "any", "none")

    Returns:
        Metrics object with aggregated results
    """
    metrics = Metrics()

    for pred in predictions.values():
        # Apply filters
        if filter_dataset and pred.dataset.upper() != filter_dataset.upper():
            continue
        if filter_origin and pred.origin_label != filter_origin:
            continue
        if filter_flowers is not None:
            fl = pred.flowers_label.strip()
            if filter_flowers == "none":
                # Match empty or #N/A
                if fl not in ("", "#N/A"):
                    continue
            else:
                if fl != filter_flowers:
                    continue
        if filter_diacritics is not None:
            if filter_diacritics == "okina" and not pred.has_okina:
                continue
            elif filter_diacritics == "kahako" and not pred.has_kahako:
                continue
            elif filter_diacritics == "any" and not pred.has_diacritics:
                continue
            elif filter_diacritics == "none" and pred.has_diacritics:
                continue

        # Get gold text
        if use_normalized:
            gold = pred.gold_text_normalized
        else:
            gold = pred.gold_text

        # Skip if no gold match
        if not gold or gold == "[NO GOLD MATCH]" or gold == "[no gold match]":
            metrics.add_no_match()
            continue

        # Get model prediction
        if model == "smolvlm2":
            if use_normalized:
                hypothesis = pred.smolvlm2_prediction_normalized
            else:
                hypothesis = pred.smolvlm2_prediction
        elif model == "deepseek":
            if use_normalized:
                hypothesis = pred.deepseek_prediction_normalized
            else:
                hypothesis = pred.deepseek_prediction
        else:
            raise ValueError(f"Unknown model: {model}")

        # Skip if no prediction
        if not hypothesis:
            metrics.add_no_match()
            continue

        # Compute metrics
        cer = compute_cer(gold, hypothesis)
        wer = compute_wer(gold, hypothesis)
        is_exact = (gold == hypothesis)

        metrics.add(cer, wer, is_exact)

    return metrics


def print_metrics(metrics: Metrics, label: str):
    """Print metrics in a formatted way."""
    print(f"\n{label}")
    print("-" * len(label))
    print(f"  Total predictions:    {metrics.total:,}")
    print(f"  With gold match:      {metrics.matched:,}")
    print(f"  Exact matches:        {metrics.exact_matches:,} ({metrics.accuracy:.1%})")
    print(f"  Avg CER:              {metrics.avg_cer:.4f} (std: {metrics.std_cer:.4f})")
    print(f"  Avg WER:              {metrics.avg_wer:.4f} (std: {metrics.std_wer:.4f})")


def main():
    parser = argparse.ArgumentParser(description="Evaluate OCR model performance")
    parser.add_argument(
        "--smolvlm2",
        type=Path,
        default=Path("hawaii_review--normalized - hawaii_review.csv"),
        help="Path to SmolVLM2 results CSV",
    )
    parser.add_argument(
        "--deepseek-hawaii",
        type=Path,
        default=Path("deepseek_hawaii_review.csv"),
        help="Path to DeepSeek Hawaii results CSV",
    )
    parser.add_argument(
        "--deepseek-comps",
        type=Path,
        default=Path("deepseek_comps_review.csv"),
        help="Path to DeepSeek comps results CSV",
    )
    parser.add_argument(
        "--dataset",
        choices=["HI", "comps", "all"],
        default="all",
        help="Filter by dataset",
    )
    parser.add_argument(
        "--origin",
        type=str,
        default=None,
        help="Filter by origin label (N, H, J, etc.)",
    )
    parser.add_argument(
        "--unnormalized",
        action="store_true",
        help="Use unnormalized text for comparison",
    )
    parser.add_argument(
        "--by-dataset",
        action="store_true",
        help="Show breakdown by dataset",
    )
    parser.add_argument(
        "--by-origin",
        action="store_true",
        help="Show breakdown by origin label",
    )
    parser.add_argument(
        "--by-flowers",
        action="store_true",
        help="Show breakdown by visual features (F=flowers/lei, S=Hawaiian shirt, G=opaque graphics)",
    )
    parser.add_argument(
        "--by-diacritics",
        action="store_true",
        help="Show breakdown by Hawaiian diacritics ('okina, kahakō)",
    )
    parser.add_argument(
        "--csv-output",
        type=Path,
        default=None,
        help="Output results to CSV file",
    )
    args = parser.parse_args()

    # Load data
    print("Loading data...")
    predictions = load_smolvlm2_data(args.smolvlm2)
    print(f"  Loaded {len(predictions):,} SmolVLM2 predictions")

    if args.deepseek_hawaii.exists():
        initial_count = len(predictions)
        load_deepseek_data(args.deepseek_hawaii, predictions, "HI")
        print(f"  Merged DeepSeek Hawaii data ({len(predictions) - initial_count:,} new records)")

    if args.deepseek_comps.exists():
        initial_count = len(predictions)
        load_deepseek_data(args.deepseek_comps, predictions, "comps")
        print(f"  Merged DeepSeek comps data ({len(predictions) - initial_count:,} new records)")

    print(f"  Total predictions: {len(predictions):,}")

    use_normalized = not args.unnormalized
    norm_label = "normalized" if use_normalized else "unnormalized"

    results = []  # For CSV output

    # Overall metrics
    print(f"\n{'='*60}")
    print(f"OVERALL RESULTS ({norm_label})")
    print('='*60)

    filter_dataset = None if args.dataset == "all" else args.dataset

    for model in ["smolvlm2", "deepseek"]:
        metrics = evaluate_model(
            predictions, model, use_normalized,
            filter_dataset=filter_dataset,
            filter_origin=args.origin,
        )
        print_metrics(metrics, f"{model.upper()}")
        results.append({
            "model": model,
            "dataset": args.dataset,
            "origin": args.origin or "all",
            "flowers": "all",
            "diacritics": "all",
            "normalized": use_normalized,
            "total": metrics.total,
            "matched": metrics.matched,
            "exact_matches": metrics.exact_matches,
            "accuracy": metrics.accuracy,
            "avg_cer": metrics.avg_cer,
            "std_cer": metrics.std_cer,
            "avg_wer": metrics.avg_wer,
            "std_wer": metrics.std_wer,
        })

    # Breakdown by dataset
    if args.by_dataset:
        print(f"\n{'='*60}")
        print(f"BREAKDOWN BY DATASET ({norm_label})")
        print('='*60)

        for dataset in ["HI", "comps"]:
            print(f"\n>>> Dataset: {dataset}")
            for model in ["smolvlm2", "deepseek"]:
                metrics = evaluate_model(
                    predictions, model, use_normalized,
                    filter_dataset=dataset,
                    filter_origin=args.origin,
                )
                print_metrics(metrics, f"{model.upper()}")
                results.append({
                    "model": model,
                    "dataset": dataset,
                    "origin": args.origin or "all",
                    "flowers": "all",
                    "diacritics": "all",
                    "normalized": use_normalized,
                    "total": metrics.total,
                    "matched": metrics.matched,
                    "exact_matches": metrics.exact_matches,
                    "accuracy": metrics.accuracy,
                    "avg_cer": metrics.avg_cer,
                    "std_cer": metrics.std_cer,
                    "avg_wer": metrics.avg_wer,
                    "std_wer": metrics.std_wer,
                })

    # Breakdown by origin label
    if args.by_origin:
        print(f"\n{'='*60}")
        print(f"BREAKDOWN BY ORIGIN LABEL ({norm_label})")
        print('='*60)

        # Collect unique origin labels
        origin_labels = set()
        for pred in predictions.values():
            if pred.origin_label and pred.origin_label not in ("#N/A", ""):
                origin_labels.add(pred.origin_label)

        for origin in sorted(origin_labels):
            print(f"\n>>> Origin: {origin}")
            for model in ["smolvlm2", "deepseek"]:
                metrics = evaluate_model(
                    predictions, model, use_normalized,
                    filter_dataset=filter_dataset,
                    filter_origin=origin,
                )
                if metrics.matched > 0:
                    print_metrics(metrics, f"{model.upper()}")
                    results.append({
                        "model": model,
                        "dataset": args.dataset,
                        "origin": origin,
                        "flowers": "all",
                        "diacritics": "all",
                        "normalized": use_normalized,
                        "total": metrics.total,
                        "matched": metrics.matched,
                        "exact_matches": metrics.exact_matches,
                        "accuracy": metrics.accuracy,
                        "avg_cer": metrics.avg_cer,
                        "std_cer": metrics.std_cer,
                        "avg_wer": metrics.avg_wer,
                        "std_wer": metrics.std_wer,
                    })

    # Breakdown by flowers label
    if args.by_flowers:
        print(f"\n{'='*60}")
        print(f"BREAKDOWN BY FLOWERS LABEL ({norm_label})")
        print('='*60)

        # F, G, S are the labeled values; "none" means empty or #N/A
        flowers_labels = [("F", "F (Flower)"), ("G", "G"), ("S", "S"), ("none", "No label")]

        for flowers_val, flowers_name in flowers_labels:
            print(f"\n>>> Flowers: {flowers_name}")
            for model in ["smolvlm2", "deepseek"]:
                metrics = evaluate_model(
                    predictions, model, use_normalized,
                    filter_dataset=filter_dataset,
                    filter_origin=args.origin,
                    filter_flowers=flowers_val,
                )
                if metrics.matched > 0:
                    print_metrics(metrics, f"{model.upper()}")
                    results.append({
                        "model": model,
                        "dataset": args.dataset,
                        "origin": args.origin or "all",
                        "flowers": flowers_val,
                        "diacritics": "all",
                        "normalized": use_normalized,
                        "total": metrics.total,
                        "matched": metrics.matched,
                        "exact_matches": metrics.exact_matches,
                        "accuracy": metrics.accuracy,
                        "avg_cer": metrics.avg_cer,
                        "std_cer": metrics.std_cer,
                        "avg_wer": metrics.avg_wer,
                        "std_wer": metrics.std_wer,
                    })

    # Breakdown by diacritics
    if args.by_diacritics:
        print(f"\n{'='*60}")
        print(f"BREAKDOWN BY DIACRITICS ({norm_label})")
        print('='*60)

        # Count diacritics distribution
        okina_count = sum(1 for p in predictions.values() if p.has_okina)
        kahako_count = sum(1 for p in predictions.values() if p.has_kahako)
        any_count = sum(1 for p in predictions.values() if p.has_diacritics)
        print(f"\nDiacritics distribution:")
        print(f"  With 'okina:  {okina_count:,}")
        print(f"  With kahakō:  {kahako_count:,}")
        print(f"  With any:     {any_count:,}")
        print(f"  Without:      {len(predictions) - any_count:,}")

        diacritics_labels = [
            ("any", "Has diacritics ('okina or kahakō)"),
            ("okina", "Has 'okina"),
            ("kahako", "Has kahakō"),
            ("none", "No diacritics"),
        ]

        for diacritics_val, diacritics_name in diacritics_labels:
            print(f"\n>>> {diacritics_name}")
            for model in ["smolvlm2", "deepseek"]:
                metrics = evaluate_model(
                    predictions, model, use_normalized,
                    filter_dataset=filter_dataset,
                    filter_origin=args.origin,
                    filter_diacritics=diacritics_val,
                )
                if metrics.matched > 0:
                    print_metrics(metrics, f"{model.upper()}")
                    results.append({
                        "model": model,
                        "dataset": args.dataset,
                        "origin": args.origin or "all",
                        "flowers": "all",
                        "diacritics": diacritics_val,
                        "normalized": use_normalized,
                        "total": metrics.total,
                        "matched": metrics.matched,
                        "exact_matches": metrics.exact_matches,
                        "accuracy": metrics.accuracy,
                        "avg_cer": metrics.avg_cer,
                        "std_cer": metrics.std_cer,
                        "avg_wer": metrics.avg_wer,
                        "std_wer": metrics.std_wer,
                    })

    # CSV output
    if args.csv_output:
        with open(args.csv_output, 'w', newline='') as f:
            fieldnames = ["model", "dataset", "origin", "flowers", "diacritics", "normalized", "total",
                         "matched", "exact_matches", "accuracy", "avg_cer", "std_cer", "avg_wer", "std_wer"]
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(results)
        print(f"\nResults written to {args.csv_output}")


if __name__ == "__main__":
    main()
