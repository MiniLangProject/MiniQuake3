#!/usr/bin/env python3
"""Build and run deterministic BSP mark-fragment projection contracts."""
import subprocess
import sys
import argparse
from pathlib import Path

from toolchain import ROOT, run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak", type=Path)
    args = parser.parse_args()
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/mark_fragments_contracts.ml",
         "--output", "mark_fragments_contracts.exe"], cwd=ROOT, check=True)
    value = run([ROOT / "build/mark_fragments_contracts.exe"], ROOT / "build").strip()
    expected = "PASS: 17 mark-fragment contracts"
    if value != expected:
        raise RuntimeError(value)
    print(value)
    if args.pak:
        subprocess.run(
            [sys.executable, ROOT / "scripts/build.py", "--source", "tests/mark_fragments_retail_probe.ml",
             "--output", "mark_fragments_retail_probe.exe"], cwd=ROOT, check=True)
        value = run([ROOT / "build/mark_fragments_retail_probe.exe", args.pak.resolve()], ROOT / "build").strip()
        if not value.startswith("PASS: retail q3dm1 mark fragments="):
            raise RuntimeError(value)
        print(value)


if __name__ == "__main__":
    main()
