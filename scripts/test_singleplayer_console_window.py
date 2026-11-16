#!/usr/bin/env python3
"""Send the physical console key to a Retail singleplayer graphics replay."""

import argparse
import ctypes
from ctypes import wintypes
from pathlib import Path
import subprocess
import time

from toolchain import ROOT


user32 = ctypes.WinDLL("user32", use_last_error=True)


def game_window(process_id: int) -> int:
    handles: list[int] = []
    callback_type = ctypes.WINFUNCTYPE(wintypes.BOOL, wintypes.HWND, wintypes.LPARAM)

    @callback_type
    def visit(window: int, _parameter: int) -> bool:
        owner = wintypes.DWORD()
        user32.GetWindowThreadProcessId(window, ctypes.byref(owner))
        if owner.value == process_id and user32.IsWindowVisible(window):
            handles.append(window)
        return True

    user32.EnumWindows(visit, 0)
    return handles[0] if handles else 0


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    parser.add_argument("--frames", type=int, default=2000)
    args = parser.parse_args()
    binary = ROOT / "build/singleplayer_graphics_replay.exe"
    process = subprocess.Popen(
        [binary, (args.data_root / "baseq3/pak0.pk3").resolve(),
         ROOT / "build/reference/qvms", str(args.frames), "q3dm0"],
        cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True,
    )
    try:
        deadline = time.monotonic() + 30
        window = 0
        while not window and time.monotonic() < deadline:
            if process.poll() is not None:
                raise RuntimeError(f"graphics replay exited before creating a window: {process.returncode}")
            window = game_window(process.pid)
            if not window:
                time.sleep(0.1)
        if not window:
            raise RuntimeError("singleplayer window was not created")
        time.sleep(5)
        # VK_OEM_3 translates to Quake's backtick/tilde console binding.
        user32.PostMessageW(window, 0x100, 0xC0, 0)
        user32.PostMessageW(window, 0x101, 0xC0, 0)
        output, _ = process.communicate(timeout=120)
        if process.returncode != 0 or "QVM loop profile:" not in output:
            raise RuntimeError(f"console-key replay failed ({process.returncode}): {output[-3000:]}")
        print("PASS: Retail q3dm0 console key graphics replay completed without a crash")
        for line in output.splitlines():
            if line.startswith("QVM loop profile:"):
                print(line)
        return 0
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
