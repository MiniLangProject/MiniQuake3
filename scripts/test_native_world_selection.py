"""Compare native candidate filtering with the managed retained world selector."""
import argparse
import re
import subprocess
import sys
import zipfile
from pathlib import Path
from toolchain import ROOT, run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    output = ROOT / "build/reference/native_world_selection"
    output.mkdir(parents=True, exist_ok=True)
    retained = ROOT / "build/reference/bodies/cd_q3dm1.bsp"
    if args.data_root:
        retained = output / "q3dm1.bsp"
        with zipfile.ZipFile(args.data_root / "baseq3/pak0.pk3") as archive:
            retained.write_bytes(archive.read("maps/q3dm1.bsp"))
    if not retained.is_file():
        raise RuntimeError("q3dm1 retail BSP is required")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/native_world_selection_probe.ml", "--output", "native_world_selection_probe.exe"],
                   cwd=ROOT, check=True)
    result = run([ROOT / "build/native_world_selection_probe.exe", retained], ROOT / "build",
                 log=output / "result.log").strip()
    if not re.fullmatch(r"PASS: 384 native world-selection differential cases; frames=200 native_ms=\d+ managed_ms=\d+", result):
        raise RuntimeError(result)
    print(result)


if __name__ == "__main__":
    main()
