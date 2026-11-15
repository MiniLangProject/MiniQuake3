"""Measure retained fog/projected-light construction without a game window."""
import re
import subprocess
import sys
from toolchain import ROOT


def main():
    subprocess.run([sys.executable, str(ROOT / "scripts/build.py"), "--source",
                    "tests/playable_effect_build_benchmark.ml", "--output", "playable_effect_build_benchmark.exe"],
                   cwd=ROOT, check=True)
    result = subprocess.run([str(ROOT / "build/playable_effect_build_benchmark.exe")],
                            cwd=ROOT / "build", text=True, capture_output=True, check=True)
    lines = result.stdout.strip().splitlines()
    if len(lines) != 4:
        raise RuntimeError(result.stdout + result.stderr)
    for count, line in zip((1024, 2048, 4096, 8192), lines):
        if not re.fullmatch(rf"count={count} worldMs=\d+ orientedMs=\d+ fogMs=\d+", line):
            raise RuntimeError(line)
    print(result.stdout.strip())


if __name__ == "__main__":
    main()
