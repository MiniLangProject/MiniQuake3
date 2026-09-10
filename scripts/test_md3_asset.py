#!/usr/bin/env python3
"""Build MD3 parser contracts and optionally smoke a retail pak0 model."""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, run


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak", type=Path)
    args = parser.parse_args()
    subprocess.run([
        sys.executable, ROOT / "scripts/build.py", "--source",
        "tests/md3_asset_contracts.ml", "--output", "md3_asset_contracts.exe",
    ], cwd=ROOT, check=True)
    output = run([ROOT / "build/md3_asset_contracts.exe"], ROOT / "build").strip()
    expected = "PASS: 37 MD3 asset contracts"
    if output != expected:
        raise RuntimeError(output)
    print(expected)
    if args.pak:
        subprocess.run([
            sys.executable, ROOT / "scripts/build.py", "--source",
            "tests/md3_asset_retail_smoke.ml", "--output", "md3_asset_retail_smoke.exe",
        ], cwd=ROOT, check=True)
        print(run([ROOT / "build/md3_asset_retail_smoke.exe", args.pak], ROOT / "build").strip())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
