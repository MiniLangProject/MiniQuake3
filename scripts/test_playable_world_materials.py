#!/usr/bin/env python3
import argparse
import subprocess
import sys

from toolchain import ROOT


def build(source: str, output: str) -> None:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak")
    parser.add_argument("--map", default="maps/q3dm1.bsp")
    args = parser.parse_args()
    build("tests/playable_world_batch_contracts.ml", "playable_world_batch_contracts.exe")
    subprocess.run([ROOT / "build/playable_world_batch_contracts.exe"], cwd=ROOT / "build", check=True)
    if args.pak:
        build("tests/playable_world_material_retail_probe.ml", "playable_world_material_retail_probe.exe")
        subprocess.run([ROOT / "build/playable_world_material_retail_probe.exe", args.pak, args.map], cwd=ROOT / "build", check=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
