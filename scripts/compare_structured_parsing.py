#!/usr/bin/env python3
import argparse
import re
from pathlib import Path
from typing import List, Tuple, Dict, Optional


AVERAGE_LINE_PREFIX = "Average,"
RESULTS_FILENAME = "keyed_info_results.md"


def find_results_files(paths: List[Path]) -> List[Path]:
    results: List[Path] = []
    for p in paths:
        if p.is_dir():
            # search recursively for keyed_info_results.md
            results.extend(p.rglob(RESULTS_FILENAME))
        elif p.is_file():
            if p.name == RESULTS_FILENAME:
                results.append(p)
        else:
            # Path does not exist; skip silently
            continue
    # Deduplicate while preserving order
    seen = set()
    unique_results: List[Path] = []
    for f in results:
        if f not in seen:
            seen.add(f)
            unique_results.append(f)
    return unique_results


def parse_average_line(line: str) -> Optional[Tuple[List[float], List[float]]]:
    if not line.startswith(AVERAGE_LINE_PREFIX):
        return None
    # Expect two quoted lists after the prefix, e.g.,
    # Average,"[np.float64(0.1), ...]","[np.float64(0.2), ...]"
    # Extract the content inside the first and second brackets
    parts = re.findall(r"\[(.*?)\]", line)
    if len(parts) < 2:
        return None
    def extract_floats(inner: str) -> List[float]:
        # Handle empty lists
        if not inner.strip():
            return []
        # Extract numbers from np.float64(...) patterns specifically
        # Look for patterns like np.float64(0.123) and extract the number inside
        nums = re.findall(r"np\.float64\(([-+]?\d*\.\d+|\d+)\)", inner)
        if not nums:
            # Fallback to general numeric extraction if no np.float64 pattern
            nums = re.findall(r"[-+]?\d*\.\d+|\d+", inner)
        return [float(n) for n in nums]
    cased_vals = extract_floats(parts[0])
    uncased_vals = extract_floats(parts[1])
    # Keep only first three (name-as-written, name-normalized, attributes)
    return cased_vals[:3], uncased_vals[:3]


def read_average_scores(result_file: Path) -> Optional[Tuple[List[float], List[float]]]:
    try:
        with result_file.open("r", encoding="utf-8", errors="ignore") as f:
            for raw in f:
                line = raw.strip()
                if not line:
                    continue
                parsed = parse_average_line(line)
                if parsed is not None:
                    return parsed
    except Exception:
        return None
    return None


def derive_label(path: Path, name_from: int) -> str:
    # Try to make a readable label from the path
    # Use last N components (excluding filename)
    parts = list(path.parts)
    if parts and path.name == RESULTS_FILENAME:
        parts = parts[:-1]
    
    # Remove common prefixes to make labels cleaner
    if "results" in parts:
        results_idx = parts.index("results")
        parts = parts[results_idx + 1:]
    
    label_parts = parts[-name_from:] if name_from > 0 else parts[-2:]
    return "/".join(label_parts) if label_parts else str(path)


def build_table(rows: List[Tuple[str, List[float], List[float]]]) -> str:
    # Markdown table header
    header = [
        "Pipeline",
        "cased:name-as-written",
        "cased:name-normalized", 
        "cased:attributes",
        "uncased:name-as-written",
        "uncased:name-normalized",
        "uncased:attributes",
    ]
    lines = ["| " + " | ".join(header) + " |",
             "|" + "|".join(["---"] * len(header)) + "|"]
    for label, cased, uncased in rows:
        def format_vals(vals: List[float]) -> List[str]:
            result = []
            for i in range(3):
                if i < len(vals):
                    result.append(f"{vals[i]:.15f}")
                else:
                    result.append("N/A")
            return result
        c = format_vals(cased)
        u = format_vals(uncased)
        line = [label] + c + u
        lines.append("| " + " | ".join(line) + " |")
    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(
        description=(
            "Create a comparison table for the structured parsing step "
            "using Average cased/uncased CER per field from KIE evaluate outputs."
        )
    )
    parser.add_argument(
        "paths",
        nargs="+",
        help=(
            "Paths to result files or directories. If a directory is given, "
            "the script searches recursively for 'keyed_info_results.md'."
        ),
    )
    parser.add_argument(
        "--labels",
        nargs="*",
        default=None,
        help=(
            "Optional custom labels per provided path, in order. "
            "If fewer labels than inputs are provided, remaining labels are derived from paths."
        ),
    )
    parser.add_argument(
        "--name-from",
        type=int,
        default=3,
        help=(
            "Number of trailing path components to use for auto-derived labels (default: 3)."
        ),
    )
    parser.add_argument(
        "--out",
        type=Path,
        default=None,
        help="Optional output file to write the Markdown table to. If omitted, prints to stdout.",
    )

    args = parser.parse_args()

    input_paths = [Path(p).expanduser().resolve() for p in args.paths]
    files = find_results_files(input_paths)
    if not files:
        raise SystemExit("No results files found.")

    # Map labels to files in the order discovered
    provided_labels: List[str] = args.labels or []
    rows: List[Tuple[str, List[float], List[float]]] = []
    for idx, f in enumerate(files):
        label = provided_labels[idx] if idx < len(provided_labels) else derive_label(f, args.name_from)
        scores = read_average_scores(f)
        if scores is None:
            # Skip files without a parsable Average line
            continue
        cased, uncased = scores
        rows.append((label, cased, uncased))

    if not rows:
        raise SystemExit("No parsable 'Average' rows found in provided results.")

    table_md = build_table(rows)
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(table_md, encoding="utf-8")
    else:
        print(table_md)


if __name__ == "__main__":
    main()


