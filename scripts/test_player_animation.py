#!/usr/bin/env python3
"""Build player-animation contracts and optionally probe retail Sarge assets."""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

from toolchain import ROOT, run


def build(source: str, output: str) -> None:
    compiler = ROOT / "artifacts/toolchain/build/mlc_win64.exe"
    run(
        [compiler, ROOT / source, ROOT / "build" / output,
         "-I", ROOT / "src", "-I", ROOT / "artifacts/toolchain",
         "--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "64m"],
        ROOT / "build",
        log=ROOT / "build" / (output + ".compile.log"),
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak", type=Path, help="retail Quake III pak0.pk3")
    args = parser.parse_args()
    build("tests/player_animation_contracts.ml", "player_animation_contracts.exe")
    output = run([ROOT / "build/player_animation_contracts.exe"], ROOT / "build").strip()
    expected = "PASS: 27 player-animation contracts"
    if output != expected:
        raise RuntimeError(output)
    print(expected)
    if args.pak:
        build("tests/player_animation_retail_smoke.ml", "player_animation_retail_smoke.exe")
        retail = run([ROOT / "build/player_animation_retail_smoke.exe", args.pak.resolve()], ROOT / "build").strip()
        if not retail.startswith("PASS: retail Sarge animation rows=36 "):
            raise RuntimeError(retail)
        print(retail)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
