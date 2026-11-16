#!/usr/bin/env python3
"""Capture real 1280x720 frames through MiniQuake3's existing MQ3_CAPTURE hook.

Requires Windows, Pillow, a built game and singleplayer_graphics_replay.exe,
compatible qvms, and user-supplied build/baseq3/pak0.pk3. No desktop capture,
resizing, image generation, retouching or retail-asset extraction is performed.
"""
from __future__ import annotations
import argparse
import ctypes
from ctypes import wintypes as w
import hashlib
import io
import json
import os
from pathlib import Path
import re
import subprocess
import time

from PIL import Image, ImageStat
from toolchain import ROOT

BUILD = ROOT / "build"
WORK = BUILD / "readme-captures"


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def title_for(pid: int) -> str:
    user = ctypes.WinDLL("user32", use_last_error=True)
    callback_type = ctypes.WINFUNCTYPE(w.BOOL, w.HWND, w.LPARAM)
    user.EnumWindows.argtypes = [callback_type, w.LPARAM]
    user.GetWindowThreadProcessId.argtypes = [w.HWND, ctypes.POINTER(w.DWORD)]
    user.IsWindowVisible.argtypes = [w.HWND]
    user.GetWindowTextW.argtypes = [w.HWND, w.LPWSTR, ctypes.c_int]
    titles = []
    @callback_type
    def visit(hwnd, _):
        owner = w.DWORD()
        user.GetWindowThreadProcessId(hwnd, ctypes.byref(owner))
        if owner.value == pid and user.IsWindowVisible(hwnd):
            text = ctypes.create_unicode_buffer(512)
            user.GetWindowTextW(hwnd, text, len(text))
            titles.append(text.value)
        return True
    user.EnumWindows(visit, 0)
    return titles[0] if titles else ""


def read_frame(path: Path) -> Image.Image:
    # Reading the complete bytes first avoids lazily decoding a file while the
    # next present overwrites it. A partial concurrent write is retried by caller.
    with Image.open(io.BytesIO(path.read_bytes())) as frame:
        frame.load()
        if frame.size != (1280, 720):
            raise RuntimeError("Unexpected framebuffer dimensions: " + str(frame.size))
        result = frame.convert("RGB")
    if max(ImageStat.Stat(result).stddev) < 8:
        raise RuntimeError("Framebuffer is blank or nearly uniform")
    return result


def capture(name: str, command: list[str], destination: Path, *, menu=False, frames=120) -> dict:
    raw = WORK / (name + ".bmp")
    log = WORK / (name + ".log")
    raw.unlink(missing_ok=True)
    env = os.environ.copy()
    env["MQ3_CAPTURE"] = str(raw)
    ready = None
    last_good = None
    last_title = ""
    started = time.monotonic()
    with log.open("w", encoding="utf-8") as output:
        process = subprocess.Popen(command, cwd=ROOT, env=env, stdout=output, stderr=subprocess.STDOUT)
        try:
            while process.poll() is None and time.monotonic() - started < 600:
                last_title = title_for(process.pid)
                if menu and last_title == "MiniQuake3 | Quake III Arena Main Menu":
                    if ready is None:
                        ready = time.monotonic()
                    if time.monotonic() - ready >= 1.0:
                        try:
                            last_good = read_frame(raw)
                        except (OSError, ValueError, RuntimeError):
                            pass
                    if last_good is not None and time.monotonic() - ready >= 2.0:
                        break
                time.sleep(0.1)
            if menu:
                if last_good is None or process.poll() is not None:
                    raise RuntimeError("Main menu did not reach a stable rendered state; see " + str(log))
                termination = "intentional capture-harness stop after stable main-menu title"
            else:
                if process.poll() is None:
                    raise TimeoutError(name + " did not finish within 600 seconds")
                text = log.read_text(encoding="utf-8", errors="replace")
                completed = re.search(r"QVM preview:[^\r\n]*\bframes=(\d+)", text)
                if process.returncode != 0 or not completed or int(completed.group(1)) != frames or "QVM loop profile:" not in text:
                    raise RuntimeError(name + " did not complete its requested frames: " + text[-2000:])
                last_good = read_frame(raw)
                termination = "natural exit 0 after completed replay"
        finally:
            if process.poll() is None:
                process.terminate()
                try:
                    process.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    process.kill()
                    process.wait(timeout=10)
    target = destination / (name + ".png")
    last_good.save(target, format="PNG", optimize=True)
    text = log.read_text(encoding="utf-8", errors="replace")
    renderer = re.search(r"QVM renderer: ([^\r\n]+)", text)
    record = {"file": target.name, "sha256": digest(target), "dimensions": list(last_good.size),
              "command": command, "last_window_title": last_title, "termination": termination,
              "frames_completed": None if menu else frames,
              "renderer": renderer.group(1) if renderer else "menu 2D path; no renderer metric emitted",
              "audio_unavailable": "audio output unavailable" in text,
              "seconds": round(time.monotonic() - started, 3)}
    print("PASS: " + name + " full framebuffer, " + termination, flush=True)
    return record


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=ROOT / "docs/screenshots")
    parser.add_argument("--frames", type=int, default=120)
    args = parser.parse_args()
    if args.frames < 30:
        parser.error("at least 30 frames are required to settle the game view")
    args.output.mkdir(parents=True, exist_ok=True)
    WORK.mkdir(parents=True, exist_ok=True)
    exe = BUILD / "MiniQuake3.exe"
    replay = BUILD / "singleplayer_graphics_replay.exe"
    pak = BUILD / "baseq3/pak0.pk3"
    for path in (exe, replay, pak, BUILD / "qvms/ui.qvm", BUILD / "qvms/cgame.qvm", BUILD / "qvms/qagame.qvm"):
        if not path.is_file():
            raise FileNotFoundError(path)
    report = {"source_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
              "workflow_run": os.environ.get("GITHUB_RUN_ID"), "capture_method": "MQ3_CAPTURE native framebuffer BMP -> lossless PNG",
              "image_processing": "RGB encoding only; no crop, resize, enhancement or generated pixels",
              "game_sha256": digest(exe), "replay_sha256": digest(replay), "pak0_sha256": digest(pak),
              "compiler": "published MiniLang 1.3.9; not historical frozen-toolchain parity",
              "captures": [], "limits": ["Automated capture, not an interactive playthrough", "Capture I/O is enabled; timings are not benchmarks"]}
    report["captures"].append(capture("main-menu", [str(exe)], args.output, menu=True))
    for arena in ("q3dm0", "q3dm1"):
        command = [str(replay), str(pak), str(BUILD / "qvms"), str(args.frames), arena]
        report["captures"].append(capture(arena, command, args.output, frames=args.frames))
    (args.output / "capture-manifest.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
