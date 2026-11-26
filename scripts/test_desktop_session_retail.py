#!/usr/bin/env python3
"""Exercise desktop commands and durable user settings with the retail UI QVM."""

import argparse
from pathlib import Path
import subprocess
import sys
import tempfile

from toolchain import ROOT


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data-root", required=True, type=Path)
    parser.add_argument("--published", action="store_true")
    parser.add_argument("--reuse-build", action="store_true")
    args = parser.parse_args()
    build = ROOT / "build"
    data = args.data_root.resolve()
    if (data / "baseq3").is_dir():
        data /= "baseq3"
    if not (data / "pak0.pk3").is_file():
        parser.error(f"missing retail data in {data}")
    binary = build / "desktop_session_retail_probe.exe"
    if not args.reuse_build:
        builder = "build_release.py" if args.published else "build.py"
        subprocess.run(
            [sys.executable, ROOT / "scripts" / builder, "--source",
             "tests/desktop_session_retail_probe.ml", "--output", binary.name],
            cwd=ROOT,
            check=True,
        )
    with tempfile.TemporaryDirectory(prefix="mq3-desktop-session-") as storage:
        result = subprocess.run(
            [binary, data, build / "qvms", storage],
            cwd=build,
            capture_output=True,
            encoding="utf-8",
            errors="replace",
            timeout=90,
        )
    print(result.stdout, end="")
    if result.returncode or "PASS: Retail q3dm0 commands" not in result.stdout:
        print(result.stderr, end="", file=sys.stderr)
        raise RuntimeError("Retail desktop session did not complete")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
