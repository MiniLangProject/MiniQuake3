#!/usr/bin/env python3
"""Launch MiniQuake3 without arguments and require the original menu window."""

import ctypes
from ctypes import wintypes
import subprocess
import time

from toolchain import ROOT


user32 = ctypes.WinDLL("user32", use_last_error=True)


def window_title(process_id: int) -> str:
    titles: list[str] = []
    callback_type = ctypes.WINFUNCTYPE(wintypes.BOOL, wintypes.HWND, wintypes.LPARAM)

    @callback_type
    def visit(window: int, _parameter: int) -> bool:
        owner = wintypes.DWORD()
        user32.GetWindowThreadProcessId(window, ctypes.byref(owner))
        if owner.value != process_id or not user32.IsWindowVisible(window):
            return True
        length = user32.GetWindowTextLengthW(window)
        if length > 0:
            buffer = ctypes.create_unicode_buffer(length + 1)
            user32.GetWindowTextW(window, buffer, len(buffer))
            titles.append(buffer.value)
        return True

    user32.EnumWindows(visit, 0)
    return titles[0] if titles else ""


def main() -> int:
    binary = ROOT / "build" / "MiniQuake3.exe"
    expected = "MiniQuake3 | Quake III Arena Main Menu"
    started = time.monotonic()
    process = subprocess.Popen(
        [binary],
        # Deliberately differ from the EXE directory: asset discovery must not
        # depend on a shortcut's or shell's current working directory.
        cwd=ROOT,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
    )
    title = ""
    try:
        deadline = started + 45.0
        while time.monotonic() < deadline:
            if process.poll() is not None:
                output = process.stdout.read() if process.stdout else ""
                raise RuntimeError(f"MiniQuake3 exited with {process.returncode}: {output}")
            title = window_title(process.pid)
            if title == expected:
                elapsed = time.monotonic() - started
                print(f"PASS: no-argument colocated baseq3 startup reached the original menu in {elapsed:.2f}s")
                return 0
            time.sleep(0.1)
        raise RuntimeError(f"original menu was not ready after 45 seconds; last title: {title}")
    finally:
        if process.poll() is None:
            process.terminate()
            try:
                process.wait(timeout=5)
            except subprocess.TimeoutExpired:
                process.kill()
                process.wait(timeout=5)


if __name__ == "__main__":
    raise SystemExit(main())
