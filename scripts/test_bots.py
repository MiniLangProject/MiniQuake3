"""Run every focused MiniQuake3 bot parity suite in a stable order."""
import argparse
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    scripts = sorted(
        path for path in (ROOT / "scripts").glob("test_bot_*.py")
        if path.name not in {"test_bots.py", "test_bot_spawn_retail.py"}
    )
    if not scripts:
        raise RuntimeError("No bot parity suites found")
    for index, script in enumerate(scripts, 1):
        print(f"{index}/{len(scripts)} {script.name}", flush=True)
        command = [sys.executable, script]
        if args.data_root and "--data-root" in script.read_text(encoding="utf-8", errors="replace"):
            command.extend(["--data-root", str(args.data_root)])
        subprocess.run(command, cwd=ROOT, check=True)
    print(f"PASS: {len(scripts)} bot parity suites")


if __name__ == "__main__":
    main()
