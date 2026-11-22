"""Check typed DotProduct's runtime tag and error paths."""

from __future__ import annotations

import subprocess
import sys

from toolchain import ROOT


def main() -> None:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source",
         "tests/typed_math_dot_contracts.ml", "--output",
         "typed_math_dot_contracts.exe"],
        cwd=ROOT, check=True,
    )
    result = subprocess.run(
        [ROOT / "build/typed_math_dot_contracts.exe"],
        cwd=ROOT / "build", capture_output=True, text=True, timeout=30,
    )
    expected = "PASS: DotProduct float tag and errors"
    if result.returncode != 0 or result.stdout.strip() != expected:
        raise RuntimeError(
            f"DotProduct contracts failed (exit {result.returncode}): "
            f"{result.stdout!r} {result.stderr!r}"
        )
    print(expected)


if __name__ == "__main__":
    main()
