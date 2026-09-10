#!/usr/bin/env python3
"""Build and run the native retained-world raster benchmark."""
from __future__ import annotations

from pathlib import Path
import shutil
import subprocess
import sys

from toolchain import msvc_env

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "tests" / "playable_world_batch_benchmark_native.c"
OUTPUT = ROOT / "build" / "playable_world_batch_benchmark_native.exe"


def main() -> int:
    if sys.platform != "win32":
        print("native world raster benchmark: SKIP (Windows only)")
        return 0
    env = msvc_env("x64")
    compiler = shutil.which("cl.exe", path=env.get("PATH"))
    if not compiler:
        raise RuntimeError("vcvars initialized, but cl.exe is not on PATH")
    subprocess.run(
        [compiler, "/nologo", "/W4", "/WX", "/O2", str(SOURCE),
         "user32.lib", "gdi32.lib", f"/Fe:{OUTPUT}"],
        cwd=ROOT, env=env, check=True,
    )
    subprocess.run([OUTPUT], cwd=ROOT / "build", env=env, check=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
