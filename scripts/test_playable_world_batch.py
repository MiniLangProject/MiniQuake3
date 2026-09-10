#!/usr/bin/env python3
import subprocess
import sys

from toolchain import ROOT


def main() -> int:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/playable_world_batch_contracts.ml", "--output", "playable_world_batch_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    result = subprocess.run(
        [ROOT / "build/playable_world_batch_contracts.exe"],
        cwd=ROOT / "build",
        check=True,
        capture_output=True,
        text=True,
    )
    output = result.stdout.strip()
    if output != "PASS: 20 playable world batch contracts":
        raise RuntimeError(output)
    print(output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
