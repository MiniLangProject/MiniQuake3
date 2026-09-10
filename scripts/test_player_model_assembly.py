#!/usr/bin/env python3
"""Build player-model assembly contracts and optionally probe a retail pak0."""
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
    parser.add_argument(
        "--pak",
        type=Path,
        help=r"optional retail pak0.pk3 (for example D:\Quake3\baseq3\pak0.pk3)",
    )
    args = parser.parse_args()

    build("tests/player_model_assembly_contracts.ml", "player_model_assembly_contracts.exe")
    output = run([ROOT / "build/player_model_assembly_contracts.exe"], ROOT / "build").strip()
    expected = "PASS: 32 player-model assembly contracts"
    if output != expected:
        raise RuntimeError(output)
    print(expected)

    if args.pak is not None:
        pak = args.pak.resolve()
        if not pak.is_file():
            raise FileNotFoundError(pak)
        build("tests/player_model_assembly_retail_smoke.ml", "player_model_assembly_retail_smoke.exe")
        print(run([ROOT / "build/player_model_assembly_retail_smoke.exe", pak], ROOT / "build").strip())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
