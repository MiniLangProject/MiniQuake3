"""Boot the retail qagame and cgame QVMs through a real local snapshot."""
import argparse
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    pak = args.data_root / "baseq3" / "pak0.pk3"
    if not pak.is_file():
        raise RuntimeError(f"missing retail pak: {pak}")
    qvms = ROOT / "build/reference/qvms"
    subprocess.run([sys.executable, ROOT / "scripts/build_qvms.py"], check=True, cwd=ROOT)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/retail_qagame_boot_smoke.ml", "--output", "retail_qagame_boot_smoke.exe"],
        check=True,
        cwd=ROOT,
    )
    subprocess.run([ROOT / "build/retail_qagame_boot_smoke.exe", pak, qvms], check=True, cwd=ROOT)


if __name__ == "__main__":
    main()
