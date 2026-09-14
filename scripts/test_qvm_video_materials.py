"""Build and run shader-bound RoQ material contracts against retail pak0."""
import argparse
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    pak = args.data_root / "baseq3" / "pak0.pk3"
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/qvm_video_materials_retail_probe.ml", "--output", "qvm_video_materials_retail_probe.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run([ROOT / "build/qvm_video_materials_retail_probe.exe", pak], ROOT / "build", timeout=240).strip()
    if not value.startswith("PASS: 16 QVM video material retail contracts"):
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
