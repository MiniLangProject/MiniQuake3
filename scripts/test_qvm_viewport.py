#!/usr/bin/env python3
"""Build the original-QVM refdef viewport mapping contracts."""
import subprocess
import sys

from toolchain import ROOT, run


def main():
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/qvm_viewport_contracts.ml",
         "--output", "qvm_viewport_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run([ROOT / "build/qvm_viewport_contracts.exe"], ROOT / "build").strip()
    expected = "PASS: 23 QVM viewport contracts"
    if value != expected:
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
