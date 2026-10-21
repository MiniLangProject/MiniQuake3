"""Check suspended q3dm17 item goals against live retail AAS jump-pad simulation."""
import argparse
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    parser.add_argument("--qvm-root", type=Path, default=ROOT / "build/reference/qvms")
    args = parser.parse_args()
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/jump_pad_items_retail_probe.ml", "--output", "jump_pad_items_retail_probe.exe"], cwd=ROOT, check=True)
    exe = ROOT / "build/jump_pad_items_retail_probe.exe"
    value = run([exe, args.data_root / "baseq3/pak0.pk3", args.qvm_root], ROOT, timeout=240).strip()
    expected = "PASS: 3 q3dm17 suspended-item contracts floating=8 reachable=8"
    if value != expected:
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
