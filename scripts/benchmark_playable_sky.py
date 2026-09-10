#!/usr/bin/env python3
import subprocess
import sys

from toolchain import ROOT


def main() -> int:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/playable_sky_benchmark.ml", "--output", "playable_sky_benchmark.exe"],
        cwd=ROOT,
        check=True,
    )
    subprocess.run([ROOT / "build/playable_sky_benchmark.exe"], cwd=ROOT / "build", check=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
