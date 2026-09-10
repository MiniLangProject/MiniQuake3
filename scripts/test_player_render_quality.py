#!/usr/bin/env python3
"""Build full-mesh player rendering contracts and the retail Sarge probe."""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, run


def build(source: str, output: str) -> None:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak", type=Path)
    args = parser.parse_args()
    build("tests/player_render_quality_contracts.ml", "player_render_quality_contracts.exe")
    output = run([ROOT / "build/player_render_quality_contracts.exe"], ROOT / "build").strip()
    expected = "PASS: 20 player-render quality contracts"
    if output != expected:
        raise RuntimeError(output)
    print(expected)
    if args.pak is not None:
        pak = args.pak.resolve()
        if not pak.is_file():
            raise FileNotFoundError(pak)
        build("tests/player_render_quality_retail_probe.ml", "player_render_quality_retail_probe.exe")
        print(run([ROOT / "build/player_render_quality_retail_probe.exe", pak], ROOT / "build").strip())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
