"""Check that typed triangle writers retain their error propagation."""

from __future__ import annotations

import subprocess
import sys

from toolchain import ROOT


def main() -> None:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source",
         "tests/playable_window_contract_errors.ml", "--output",
         "playable_window_contract_errors.exe"],
        cwd=ROOT, check=True,
    )
    result = subprocess.run(
        [ROOT / "build/playable_window_contract_errors.exe"],
        cwd=ROOT / "build", capture_output=True, text=True, timeout=30,
    )
    expected = "PASS: propagated native/byte-boundary errors"
    if result.returncode != 0 or result.stdout.strip() != expected:
        raise RuntimeError(
            f"triangle writer contracts failed (exit {result.returncode}): "
            f"{result.stdout!r} {result.stderr!r}"
        )
    print(expected)


if __name__ == "__main__":
    main()
