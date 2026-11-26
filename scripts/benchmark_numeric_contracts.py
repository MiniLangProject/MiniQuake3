#!/usr/bin/env python3
"""Interleaved 1.3.9 MiniLang integer-helper benchmark with checksum parity."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import statistics
import subprocess
import sys
import time

from toolchain import ROOT

OPS = ("u32", "i32", "add32", "mul32")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(binary: Path, operation: str, iterations: int) -> tuple[str, float]:
    started = time.perf_counter_ns()
    result = subprocess.run([binary, operation, str(iterations)], cwd=ROOT / "build",
                            capture_output=True, text=True, encoding="utf-8",
                            errors="replace", timeout=120)
    elapsed = (time.perf_counter_ns() - started) / 1_000_000
    if result.returncode or not result.stdout.startswith("checksum="):
        raise RuntimeError(f"{binary.name} {operation} failed: {result.stdout} {result.stderr}")
    return result.stdout.strip(), elapsed


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--iterations", type=int, default=3_000_000)
    parser.add_argument("--repeat", type=int, default=9)
    parser.add_argument("--warmup", type=int, default=2)
    parser.add_argument("--reuse-build", action="store_true")
    parser.add_argument("--source", type=Path, default=Path("tests/typed_numeric_hotpaths_bench.ml"))
    parser.add_argument("--binary-name", default="typed_numeric_hotpaths_bench.exe")
    parser.add_argument("--operations", default=",".join(OPS),
                        help="Comma-separated operation names supported by the fixture")
    parser.add_argument("--compare-binary", type=Path,
                        help="Earlier baseline EXE, run alternately with current candidate")
    parser.add_argument("--output", type=Path,
                        default=ROOT / "build/reports/typed_numeric_contracts.json")
    args = parser.parse_args()
    if args.iterations<1 or args.repeat<3 or args.warmup<0:
        parser.error("positive iterations, at least three runs and non-negative warmup required")
    operations = tuple(name.strip() for name in args.operations.split(",") if name.strip())
    if not operations or len(set(operations)) != len(operations):
        parser.error("operations must be a non-empty unique comma-separated list")
    if Path(args.binary_name).name != args.binary_name:
        parser.error("binary-name must be a filename")
    source = args.source if args.source.is_absolute() else ROOT / args.source
    if not source.is_file():
        parser.error(f"missing fixture source: {source}")
    binary = ROOT / "build" / args.binary_name
    if not args.reuse_build:
        env = os.environ.copy()
        env["MQ3_BUILD_TOOLCHAIN"] = "release"
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                        str(source), "--output", binary.name],
                       cwd=ROOT, env=env, check=True)
    candidates = {"candidate": binary}
    if args.compare_binary:
        candidates["baseline"] = args.compare_binary.resolve()
    for value in candidates.values():
        if not value.is_file():
            parser.error(f"missing binary: {value}")
    measurements = {}
    for operation in operations:
        for _ in range(args.warmup):
            for name, executable in candidates.items():
                run(executable, operation, args.iterations)
        times = {name: [] for name in candidates}
        checksums = set()
        for attempt in range(args.repeat):
            order = list(candidates)
            if attempt % 2:
                order.reverse()
            for name in order:
                checksum, elapsed = run(candidates[name], operation, args.iterations)
                checksums.add(checksum)
                times[name].append(elapsed)
        if len(checksums)!=1:
            raise RuntimeError(f"checksum mismatch for {operation}: {sorted(checksums)}")
        measurements[operation] = {
            "checksum": checksums.pop(),
            "runs_ms": times,
            "median_ms": {name: statistics.median(samples) for name, samples in times.items()},
        }
        print(operation, measurements[operation]["checksum"], measurements[operation]["median_ms"])
    result = {
        "compiler": "published MiniLang 1.3.9 via scripts/build.py",
        "iterations": args.iterations,
        "repeats": args.repeat,
        "warmups": args.warmup,
        "fixture": {"path": str(source), "sha256": sha256(source)},
        "binaries": {name: {"path": str(path), "sha256": sha256(path)}
                     for name, path in candidates.items()},
        "measurements": measurements,
        "scope": "isolated helper loops, not whole-game FPS; process startup included",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(f"PASS: equal checksums for {len(operations)} operations; {args.output}")


if __name__ == "__main__":
    main()
