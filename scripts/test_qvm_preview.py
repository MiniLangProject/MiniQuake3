"""Render one native frame from the unchanged retail QVM scene."""
import argparse
import re
import subprocess
from pathlib import Path
from toolchain import ROOT


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    pak = args.data_root / "baseq3/pak0.pk3"
    qvms = ROOT / "build/reference/qvms"
    if not pak.is_file() or not (qvms / "cgame.qvm").is_file():
        raise RuntimeError("retail pak0.pk3 and rebuilt QVMs are required")
    result = subprocess.run(
        [ROOT / "build/MiniQuake3.exe", "--play-qvm-smoke", pak, "maps/q3dm1.bsp", qvms, "1"],
        cwd=ROOT,
        check=True,
        text=True,
        capture_output=True,
    )
    match = re.search(r"selected=(\d+)x(\d+) models=(\d+) triangles=(\d+) textures=(\d+) frames=(\d+)", result.stdout)
    if not match or min(map(int, match.groups())) <= 0 or int(match.group(6)) != 1:
        raise RuntimeError(f"invalid QVM preview report: {result.stdout!r}")
    print("PASS: native original-QVM frame " + match.group(0))


if __name__ == "__main__":
    main()
