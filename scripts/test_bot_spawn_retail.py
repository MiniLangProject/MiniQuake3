"""Drive the retail addbot command through the first unported Bot-AI trap."""
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
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/bot_spawn_retail_probe.ml", "--output", "bot_spawn_retail_probe.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run(
        [ROOT / "build/bot_spawn_retail_probe.exe", args.data_root / "baseq3/pak0.pk3", args.qvm_root],
        ROOT,
        timeout=240,
    ).strip()
    expected = "PASS: 18 retail original-bot spawn contracts setup=complete frames=512 running=BOTLIB_USER_COMMAND command=123,-31,0 weapon=8 goal=2 chat=1 move=1"
    if value != expected:
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
