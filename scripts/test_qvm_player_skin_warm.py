"""Check bounded registered-player skin warmup with the original Retail PK3."""
import argparse
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/qvm_player_skin_warm_retail_probe.ml", "--output", "qvm_player_skin_warm_retail_probe.exe"],
        cwd=ROOT,
        check=True,
    )
    pak = args.data_root / "baseq3" / "pak0.pk3"
    value = run([ROOT / "build/qvm_player_skin_warm_retail_probe.exe", pak], ROOT / "build", timeout=240).strip()
    if value != "PASS: 6 QVM player skin warm retail contracts":
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
