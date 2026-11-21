#!/usr/bin/env python3
"""Toggle the physical console key and execute commands in the packaged Retail game."""
from __future__ import annotations

import argparse
import os
from pathlib import Path
import shutil
import tempfile
import time

from test_desktop_video_retail import find_window, launch, post, press, wait_for
from toolchain import ROOT


def in_match(title: str) -> bool:
    return title.endswith("Original QVM q3dm0") and "| -- FPS |" not in title


def caret(window: int) -> None:
    # Original keypad mapping uses scan code 0x29, independently of the
    # current layout's virtual key. German ^ can generate WM_DEADCHAR.
    post(window, 0x0100, 0xC0, 0x00290001)
    post(window, 0x0103, ord("^"), 0x00290001)
    post(window, 0x0102, ord("^"), 0x00290001)
    post(window, 0x0101, 0xC0, 0xC0290001)


def run_command(window: int, text: str) -> None:
    for char in "/" + text:
        post(window, 0x0102, ord(char), 1)
    press(window, 0x0D)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    build = ROOT / "build"
    archives = args.data_root.resolve() / "baseq3"
    if not (archives / "pak0.pk3").is_file():
        parser.error(f"expected Retail pak0.pk3 in {archives}")
    log = build / "desktop-console-retail.log"
    with tempfile.TemporaryDirectory(dir=build, prefix="retail-console-") as directory:
        package = Path(directory)
        (package / "baseq3").mkdir()
        (package / "qvms").mkdir()
        for source in [build / "MiniQuake3.exe", *build.glob("*.dll"), *build.glob("qvms/*.qvm")]:
            os.link(source, package / source.relative_to(build))
        for source in archives.glob("pak*.pk3"):
            target = package / "baseq3" / source.name
            try:
                os.link(source, target)
            except OSError:
                shutil.copyfile(source, target)
        config = package / "baseq3/q3config.cfg"
        config.write_text('seta r_mode "4"\nseta r_fullscreen "0"\nseta name "BeforeConsole"\n', encoding="ascii")
        (package / "baseq3/autoexec.cfg").write_text("spmap q3dm0\n", encoding="ascii")
        try:
            with launch(package, log, in_match) as (process, window):
                for marker in ("ConsoleFirst", "ConsoleReopened"):
                    post(window, 0x0100, ord("W"), 0x00110001)
                    time.sleep(0.10)
                    caret(window)
                    post(window, 0x0101, ord("W"), 0xC0110001)
                    time.sleep(0.35)
                    assert find_window(process.pid, in_match) == window, "left match when opening console"
                    run_command(window, "seta name " + marker)
                    wait_for(process, lambda: f'seta name "{marker}"' in config.read_text(encoding="utf-8"),
                             "console command saved from the in-game console")
                    caret(window)
                    time.sleep(0.35)
                    assert find_window(process.pid, in_match) == window, "left match when closing console"
        except Exception as exc:
            raise RuntimeError(log.read_text(encoding="utf-8", errors="replace")) from exc
    print("PASS: Retail q3dm0 physical console opened, accepted commands, closed and reopened on the same window")


if __name__ == "__main__":
    main()
