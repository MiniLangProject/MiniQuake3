#!/usr/bin/env python3
import argparse
import subprocess
import sys

from toolchain import ROOT


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--prepare-only", action="store_true", help="measure retained sky packing without opening a window")
    args = parser.parse_args()
    stem = "playable_sky_prepare_benchmark" if args.prepare_only else "playable_sky_benchmark"
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/" + stem + ".ml", "--output", stem + ".exe"],
        cwd=ROOT,
        check=True,
    )
    subprocess.run([ROOT / ("build/" + stem + ".exe")], cwd=ROOT / "build", check=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
