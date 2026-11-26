"""Play the Retail tier video in the actual Windows renderer and follow nextmap."""
import argparse
from pathlib import Path
import subprocess

from toolchain import ROOT


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    archive = (args.data_root / "baseq3/pak0.pk3").resolve()
    binary = ROOT / "build/MiniQuake3.exe"
    result = subprocess.run(
        [binary, "--cinematic-smoke", archive, "tier1.RoQ"],
        cwd=ROOT, capture_output=True, text=True, timeout=60,
    )
    if result.returncode or "PASS: Retail cinematic rendered and returned to level selection" not in result.stdout:
        raise RuntimeError(f"Retail tier cinematic failed ({result.returncode}):\n{result.stdout[-1500:]}\n{result.stderr[-1500:]}")
    print(result.stdout.strip())


if __name__ == "__main__":
    main()
