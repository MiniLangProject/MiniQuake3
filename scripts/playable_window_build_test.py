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
TRIANGLE_FILL_TEST = ROOT / "tests" / "playable_triangle_fill_native.c"
INPUT_EVENTS_TEST = ROOT / "tests" / "playable_window_input_events_native.c"
RAW_INPUT_TEST = ROOT / "tests" / "playable_raw_input_native.c"
WNDPROC_TEST = ROOT / "tests" / "playable_window_wndproc_native.c"
WIN_SHARED_TEST = ROOT / "tests" / "playable_window_win_shared_native.c"
GL_TEST = ROOT / "tests" / "playable_window_gl_native.c"
RASTER_EXPORTS = (
    "playable_window_set_title_utf8",
    "playable_window_next_input_event",
    "playable_window_input_key_down",
    "playable_window_input_init",
    "playable_window_input_activate",
    "playable_window_input_frame",
    "playable_window_input_clear_states",
    "playable_window_input_configure_joystick",
    "playable_window_input_configure_midi",
    "playable_window_input_joystick_available",
    "playable_window_input_midi_device_count",
    "playable_window_take_video_restart",
    "playable_window_window_state",
    "playable_system_current_user",
    "playable_system_current_directory",
    "playable_system_executable_directory",
    "playable_system_processor_id",
    "playable_window_gl_configure",
    "playable_window_gl_configure_driver",
    "playable_window_gl_configure_pixel_format",
    "playable_window_gl_configure_display",
    "playable_window_gl_available",
    "playable_window_gl_pixel_format",
    "playable_window_gl_color_bits",
    "playable_window_gl_depth_bits",
    "playable_window_gl_stencil_bits",
    "playable_window_gl_stereo",
    "playable_window_gl_fullscreen",
    "playable_window_gl_info",
    "playable_window_gl_has_extension",
    "playable_window_gl_set_swap_interval",
    "playable_window_gl_set_gamma",
    "playable_window_gl_restore_gamma",
    "playable_window_gl_activate",
    "playable_window_gl_end_frame",
    "playable_window_gl_log_comment",
    "playable_window_presented_non_black",
    "playable_window_clear_depth",
    "playable_window_sample_depth",
    "playable_window_set_depth_range",
    "playable_window_clear_stencil",
    "playable_window_set_stencil_pass",
    "playable_window_finish_stencil_shadow",
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
    triangle_fill_exe = OUT / "playable_triangle_fill_native.exe"
    input_events_exe = OUT / "playable_window_input_events_native.exe"
    raw_input_exe = OUT / "playable_raw_input_native.exe"
    wndproc_exe = OUT / "playable_window_wndproc_native.exe"
    win_shared_exe = OUT / "playable_window_win_shared_native.exe"
    gl_exe = OUT / "playable_window_gl_native.exe"
    run([compiler, "/nologo", "/W4", "/WX", "/O2", "/LD", str(SOURCE),
         "/link", "user32.lib", "gdi32.lib", "winmm.lib", f"/OUT:{dll}", f"/IMPLIB:{lib}"], env)
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
         "user32.lib", "gdi32.lib", "winmm.lib", f"/Fe:{world_batch_exe}"], env)
    run([str(world_batch_exe)], env)
    run([compiler, "/nologo", "/W4", "/WX", "/O2", str(RASTER_STATE_TEST),
         "user32.lib", "gdi32.lib", "winmm.lib", f"/Fe:{raster_state_exe}"], env)
    run([str(raster_state_exe)], env)
    run([compiler, "/nologo", "/W4", "/WX", "/O2", str(TRIANGLE_FILL_TEST),
         "user32.lib", "gdi32.lib", "winmm.lib", f"/Fe:{triangle_fill_exe}"], env)
    run([str(triangle_fill_exe)], env)
    run([compiler, "/nologo", "/W4", "/WX", "/O2", str(INPUT_EVENTS_TEST),
         "user32.lib", "gdi32.lib", "winmm.lib", f"/Fe:{input_events_exe}"], env)
    run([str(input_events_exe)], env)
    run([compiler, "/nologo", "/W4", "/WX", "/O2", str(RAW_INPUT_TEST),
         "user32.lib", "gdi32.lib", "winmm.lib", f"/Fe:{raw_input_exe}"], env)
    run([str(raw_input_exe)], env)
    run([compiler, "/nologo", "/W4", "/WX", "/O2", str(WNDPROC_TEST),
         "user32.lib", "gdi32.lib", "winmm.lib", f"/Fe:{wndproc_exe}"], env)
    run([str(wndproc_exe)], env)
    run([compiler, "/nologo", "/W4", "/WX", "/O2", str(WIN_SHARED_TEST),
         "user32.lib", "gdi32.lib", "winmm.lib", f"/Fe:{win_shared_exe}"], env)
    run([str(win_shared_exe)], env)
    run([compiler, "/nologo", "/W4", "/WX", "/O2", str(GL_TEST), str(lib),
         "user32.lib", "gdi32.lib", f"/Fe:{gl_exe}"], env)
    run([str(gl_exe)], env)
    print(f"playable window build: PASS ({dll})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
