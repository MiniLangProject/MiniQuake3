#!/usr/bin/env python3
"""Build and run the deterministic assembled-player render-cache contracts."""
from __future__ import annotations

import subprocess
import sys

from toolchain import ROOT, run


def main() -> int:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source",
         "tests/player_render_cache_contracts.ml", "--output",
         "player_render_cache_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    actual = run(
        [ROOT / "build/player_render_cache_contracts.exe"], ROOT / "build"
    ).strip()
    expected = "PASS: 26 player-render cache contracts"
    if actual != expected:
        raise RuntimeError(actual)
    print(expected)
    print("cache: 2 quantized-phase hits avoided assembly/interpolation; "
          "4 triangles/target, 3 targets/frame, 2 FIFO entries")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
