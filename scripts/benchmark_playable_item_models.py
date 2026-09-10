#!/usr/bin/env python3
"""Build and run the pickup/viewmodel shared-vertex transform benchmark."""
from __future__ import annotations

import subprocess
import sys

from toolchain import ROOT, run


def main() -> int:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/playable_item_models_benchmark.ml", "--output", "playable_item_models_benchmark.exe"],
        cwd=ROOT,
        check=True,
    )
    print(run([ROOT / "build/playable_item_models_benchmark.exe"], ROOT / "build", timeout=240))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
