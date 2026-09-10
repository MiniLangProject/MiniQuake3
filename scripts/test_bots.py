"""Run every focused MiniQuake3 bot parity suite in a stable order."""
import subprocess
import sys

from toolchain import ROOT


def main():
    scripts = sorted(
        path for path in (ROOT / "scripts").glob("test_bot_*.py")
        if path.name != "test_bots.py"
    )
    if not scripts:
        raise RuntimeError("No bot parity suites found")
    for index, script in enumerate(scripts, 1):
        print(f"{index}/{len(scripts)} {script.name}", flush=True)
        subprocess.run([sys.executable, script], cwd=ROOT, check=True)
    print(f"PASS: {len(scripts)} bot parity suites")


if __name__ == "__main__":
    main()
