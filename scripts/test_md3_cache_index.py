#!/usr/bin/env python3
"""Bounded MD3 cache hash lookup, complete-key and FIFO eviction contracts."""
import subprocess
import sys
from toolchain import ROOT, run


def main():
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/md3_cache_index_contracts.ml", "--output", "md3_cache_index_contracts.exe"], cwd=ROOT, check=True)
    result = run([ROOT / "build/md3_cache_index_contracts.exe"], ROOT / "build").strip()
    if not result.startswith("PASS: 13 MD3 cache index contracts lookupSteps="):
        raise RuntimeError(result)
    print(result)


if __name__ == "__main__":
    main()
