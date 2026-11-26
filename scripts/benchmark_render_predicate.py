#!/usr/bin/env python3
"""Alternate prebuilt MiniLang renderer predicate binaries without recompiling."""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import statistics
import subprocess
import time

from toolchain import ROOT


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--baseline", required=True, type=Path)
    parser.add_argument("--candidate", required=True, type=Path)
    parser.add_argument("--iterations", type=int, default=3_000_000)
    parser.add_argument("--pairs", type=int, default=15)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    if args.iterations < 1 or args.pairs < 2:
        parser.error("positive iteration count and at least two pairs required")
    binaries = {"baseline": args.baseline.resolve(), "candidate": args.candidate.resolve()}
    for path in binaries.values():
        if not path.is_file():
            parser.error(f"binary missing: {path}")
    hashes = {name: sha256(path) for name, path in binaries.items()}
    if hashes["baseline"] == hashes["candidate"]:
        parser.error("baseline and candidate binaries are identical")

    report = {"iterations": args.iterations, "pairs": args.pairs,
              "binaries": hashes, "operations": {}}
    for operation in ("sky", "depth", "both"):
        samples = {"baseline": [], "candidate": []}
        expected = None
        for pair in range(args.pairs):
            order = ("baseline", "candidate") if pair % 2 == 0 else ("candidate", "baseline")
            for name in order:
                started = time.perf_counter()
                result = subprocess.run(
                    [str(binaries[name]), operation, str(args.iterations)],
                    cwd=ROOT / "build", capture_output=True, text=True, timeout=60,
                )
                elapsed = (time.perf_counter() - started) * 1000
                if result.returncode or not result.stdout.startswith("checksum="):
                    raise RuntimeError(f"{name}/{operation} failed: {result.stdout} {result.stderr}")
                if expected is None:
                    expected = result.stdout
                elif result.stdout != expected:
                    raise RuntimeError(f"{name}/{operation} checksum mismatch")
                samples[name].append(elapsed)
        report["operations"][operation] = {
            "checksum": expected.strip(),
            "median_ms": {name: statistics.median(values) for name, values in samples.items()},
            "samples_ms": samples,
        }
        print(operation, report["operations"][operation]["median_ms"], flush=True)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
