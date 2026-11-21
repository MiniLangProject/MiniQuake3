#!/usr/bin/env python3
"""Check saved video mode and live mode changes in the packaged Retail build."""
from __future__ import annotations

import ctypes
from ctypes import wintypes
from contextlib import contextmanager
import os
from pathlib import Path
import subprocess
import tempfile
import time

from toolchain import ROOT


user32 = ctypes.WinDLL("user32", use_last_error=True)
user32.GetClientRect.argtypes = (wintypes.HWND, ctypes.POINTER(wintypes.RECT))
user32.GetWindowLongPtrW.argtypes = (wintypes.HWND, ctypes.c_int)
user32.GetWindowLongPtrW.restype = ctypes.c_ssize_t
user32.PostMessageW.argtypes = (wintypes.HWND, wintypes.UINT, wintypes.WPARAM, wintypes.LPARAM)

CALLBACK = ctypes.WINFUNCTYPE(wintypes.BOOL, wintypes.HWND, wintypes.LPARAM)
MAIN_MENU = "MiniQuake3 | Quake III Arena Main Menu"
GWL_STYLE = -16
WS_POPUP = 0x80000000


def find_window(pid: int, matches) -> int:
    windows = []

    @CALLBACK
    def visit(hwnd: int, _unused: int) -> bool:
        owner = wintypes.DWORD()
        user32.GetWindowThreadProcessId(hwnd, ctypes.byref(owner))
        if owner.value == pid:
            title = ctypes.create_unicode_buffer(256)
            user32.GetWindowTextW(hwnd, title, len(title))
            if matches(title.value):
                windows.append(hwnd)
        return True

    user32.EnumWindows(visit, 0)
    return windows[0] if windows else 0


def wait_for(process, condition, description):
    deadline = time.monotonic() + 25
    while time.monotonic() < deadline and process.poll() is None:
        result = condition()
        if result:
            return result
        time.sleep(0.05)
    raise RuntimeError(f"{description} failed (process exit {process.poll()})")


def client_size(hwnd: int) -> tuple[int, int]:
    rect = wintypes.RECT()
    if not user32.GetClientRect(hwnd, ctypes.byref(rect)):
        raise ctypes.WinError(ctypes.get_last_error())
    return rect.right, rect.bottom


def fullscreen(hwnd: int) -> bool:
    return bool(user32.GetWindowLongPtrW(hwnd, GWL_STYLE) & WS_POPUP)


def post(hwnd: int, message: int, key: int = 0, flags: int = 0) -> None:
    if not user32.PostMessageW(hwnd, message, key, flags):
        raise ctypes.WinError(ctypes.get_last_error())


def press(hwnd: int, vk: int) -> None:
    scan = user32.MapVirtualKeyW(vk, 0) << 16
    post(hwnd, 0x0100, vk, scan | 1)  # WM_KEYDOWN
    post(hwnd, 0x0101, vk, scan | 0xC0000001)  # WM_KEYUP


@contextmanager
def launch(package: Path, log_path: Path, matches):
    with log_path.open("w", encoding="utf-8") as log:
        process = subprocess.Popen([package / "MiniQuake3.exe"], cwd=ROOT, stdout=log, stderr=subprocess.STDOUT)
        hwnd = 0
        try:
            hwnd = wait_for(process, lambda: find_window(process.pid, matches), "Retail game window")
            yield process, hwnd
            post(hwnd, 0x0010)  # WM_CLOSE
            assert process.wait(timeout=15) == 0
        finally:
            if process.poll() is None:
                if hwnd:
                    user32.PostMessageW(hwnd, 0x0010, 0, 0)
                try:
                    process.wait(timeout=5)
                except subprocess.TimeoutExpired:
                    process.kill()
                    process.wait(timeout=5)


def main() -> None:
    build = ROOT / "build"
    with tempfile.TemporaryDirectory(dir=build, prefix="retail-video-") as directory:
        package = Path(directory)
        (package / "baseq3").mkdir()
        (package / "qvms").mkdir()
        assert (build / "baseq3/pak0.pk3").is_file(), "Retail pak0.pk3 is required in build/baseq3"
        paths = [build / "MiniQuake3.exe"]
        paths.extend(build.glob("*.dll"))
        paths.extend(build.glob("qvms/*.qvm"))
        paths.extend(build.glob("baseq3/pak*.pk3"))
        for source in paths:
            os.link(source, package / source.relative_to(build))
        config = package / "baseq3/q3config.cfg"
        config.write_text('seta r_mode "4"\nseta r_fullscreen "0"\n', encoding="ascii")
        with launch(package, build / "desktop-video-retail.log", lambda title: title == MAIN_MENU) as (process, hwnd):
            assert client_size(hwnd) == (800, 600), client_size(hwnd)
            assert not fullscreen(hwnd)
            post(hwnd, 0x0104, 0x0D, 1 << 29)  # WM_SYSKEYDOWN, Alt+Enter
            wait_for(process, lambda: fullscreen(hwnd), "enter fullscreen on the same HWND")
            post(hwnd, 0x0104, 0x0D, 1 << 29)
            wait_for(process, lambda: not fullscreen(hwnd) and client_size(hwnd) == (800, 600),
                     "restore 800x600 windowed mode")
        assert 'seta r_fullscreen "0"' in config.read_text(encoding="utf-8")

        autoexec = package / "baseq3/autoexec.cfg"
        autoexec.write_text('bind F8 "seta r_mode 6; vid_restart"\nbind F9 disconnect\nspmap q3dm0\n', encoding="ascii")
        def in_match(title):
            return title.endswith("Original QVM q3dm0") and "| -- FPS |" not in title

        with launch(package, build / "desktop-video-match-retail.log", in_match) as (process, hwnd):
            assert client_size(hwnd) == (800, 600), client_size(hwnd)
            press(hwnd, 0x77)  # F8 runs a normal command-buffer binding.
            wait_for(process, lambda: client_size(hwnd) == (1024, 768), "live in-match vid_restart")
            assert find_window(process.pid, in_match) == hwnd
            press(hwnd, 0x78)  # F9 returns from the match to the main menu.
            wait_for(process, lambda: find_window(process.pid, lambda title: title == MAIN_MENU) == hwnd,
                     "return to the main menu on the same HWND")
        assert 'seta r_mode "6"' in config.read_text(encoding="utf-8")
    print("PASS: Retail main menu and match, 800x600 to 1024x768, live Alt+Enter and clean close")


if __name__ == "__main__":
    main()
