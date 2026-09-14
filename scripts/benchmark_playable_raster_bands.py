#!/usr/bin/env python3
"""Compare the former four-band raster limit with the six-band renderer."""
from __future__ import annotations

from pathlib import Path
import re
import shutil
import subprocess
import sys

from toolchain import msvc_env

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "tests" / "playable_world_batch_benchmark_native.c"
OUT = ROOT / "build"


def build_and_run(compiler: str, env: dict[str, str], bands: int) -> tuple[str, float, str]:
    executable = OUT / f"playable_raster_{bands}_bands.exe"
    subprocess.run(
        [compiler, "/nologo", "/W4", "/WX", "/O2",
         f"/DPLAYABLE_RASTER_MAX_BANDS={bands}", str(SOURCE),
         "user32.lib", "gdi32.lib", f"/Fe:{executable}"],
        cwd=ROOT, env=env, check=True,
    )
    output = subprocess.run(
        [executable], cwd=OUT, env=env, check=True,
        capture_output=True, text=True,
    ).stdout.strip()
    elapsed = re.search(r"parallel_ms=([0-9.]+)", output)
    image_hash = re.search(r"hash=([0-9]+)", output)
    if not elapsed or not image_hash:
        raise RuntimeError(f"unexpected benchmark output: {output}")
    return output, float(elapsed.group(1)), image_hash.group(1)


def main() -> int:
    if sys.platform != "win32":
        print("raster band comparison: SKIP (Windows only)")
        return 0
    OUT.mkdir(exist_ok=True)
    env = msvc_env("x64")
    compiler = shutil.which("cl.exe", path=env.get("PATH"))
    if not compiler:
        raise RuntimeError("vcvars initialized, but cl.exe is not on PATH")
    baseline, baseline_ms, baseline_hash = build_and_run(compiler, env, 4)
    optimized, optimized_ms, optimized_hash = build_and_run(compiler, env, 6)
    if baseline_hash != optimized_hash:
        raise RuntimeError("four- and six-band render hashes differ")
    print("baseline:  " + baseline)
    print("optimized: " + optimized)
    print(f"raster band comparison: speedup={baseline_ms / optimized_ms:.2f}x hash={optimized_hash}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
