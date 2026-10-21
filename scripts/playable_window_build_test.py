#!/usr/bin/env python3
"""Build the dependency-free Win32 playable-window DLL and run its safe lifecycle test."""
from __future__ import annotations

from pathlib import Path
import shutil
import subprocess
import sys
from toolchain import msvc_env

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "build" / "playable_window"
SOURCE = ROOT / "native" / "playable_win32.c"
TEST = ROOT / "tests" / "playable_window_lifecycle.c"
WORLD_BATCH_TEST = ROOT / "tests" / "playable_world_batch_native.c"
RASTER_STATE_TEST = ROOT / "tests" / "playable_window_raster_state_native.c"
RASTER_EXPORTS = (
    "playable_window_set_title_utf8",
    "playable_window_clear_depth",
    "playable_window_sample_depth",
    "playable_window_set_depth_range",
    "playable_window_upload_texture",
    "playable_window_upload_texture_mipmapped",
    "playable_window_release_texture",
    "playable_window_draw_triangle",
    "playable_window_draw_triangle_colored",
    "playable_window_draw_triangle_multitexture",
    "playable_window_set_raster_state",
    "playable_window_set_alpha_test",
    "playable_window_set_polygon_offset",
    "playable_window_draw_triangle_batch",
    "playable_window_draw_world_triangle_batch",
    "playable_window_draw_world_triangle_batch_viewport",
    "playable_window_jpeg_info",
    "playable_window_decode_jpeg",
)


def run(command: list[str], env: dict[str, str]) -> None:
    print("+", " ".join(command))
    subprocess.run(command, cwd=ROOT, env=env, check=True)


def main() -> int:
    if sys.platform != "win32":
        print("playable window build: SKIP (Windows only)")
        return 0
    OUT.mkdir(parents=True, exist_ok=True)
    env = msvc_env("x64")
    compiler = shutil.which("cl.exe", path=env.get("PATH"))
    if not compiler:
        raise RuntimeError("vcvars initialized, but cl.exe is not on PATH")
    dll = OUT / "playable_window.dll"
    lib = OUT / "playable_window.lib"
    exe = OUT / "playable_window_lifecycle.exe"
    world_batch_exe = OUT / "playable_world_batch_native.exe"
    raster_state_exe = OUT / "playable_window_raster_state_native.exe"
    run([compiler, "/nologo", "/W4", "/WX", "/O2", "/LD", str(SOURCE),
         "/link", "user32.lib", "gdi32.lib", f"/OUT:{dll}", f"/IMPLIB:{lib}"], env)
    dumpbin = shutil.which("dumpbin.exe", path=env.get("PATH"))
    if not dumpbin:
        raise RuntimeError("vcvars initialized, but dumpbin.exe is not on PATH")
    exports = subprocess.check_output([dumpbin, "/nologo", "/exports", str(dll)],
                                      cwd=ROOT, env=env, text=True, errors="replace")
    missing = [name for name in RASTER_EXPORTS if name not in exports]
    if missing:
        raise RuntimeError(f"playable window raster exports missing: {', '.join(missing)}")
    run([compiler, "/nologo", "/W4", "/WX", str(TEST), str(lib), "user32.lib",
         f"/Fe:{exe}"], env)
    run([str(exe)], env)
    run([compiler, "/nologo", "/W4", "/WX", "/O2", str(WORLD_BATCH_TEST),
         "user32.lib", "gdi32.lib", f"/Fe:{world_batch_exe}"], env)
    run([str(world_batch_exe)], env)
    run([compiler, "/nologo", "/W4", "/WX", "/O2", str(RASTER_STATE_TEST),
         "user32.lib", "gdi32.lib", f"/Fe:{raster_state_exe}"], env)
    run([str(raster_state_exe)], env)
    print(f"playable window build: PASS ({dll})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
