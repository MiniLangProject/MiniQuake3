"""Exercise BotLib lifecycle traps through the pinned retail qagame QVM."""
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
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/botlib_retail_qagame_probe.ml", "--output", "botlib_retail_qagame_probe.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run(
        [ROOT / "build/botlib_retail_qagame_probe.exe", args.data_root / "baseq3/pak0.pk3", args.qvm_root],
        ROOT,
        timeout=240,
    ).strip()
    if not value.startswith("PASS: 11 retail qagame botlib lifecycle contracts"):
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
