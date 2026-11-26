#!/usr/bin/env python3
"""Exercise Retail remote play, demo playback and a mod in the packaged Windows EXE."""
from __future__ import annotations

import argparse
import os
from pathlib import Path
import shutil
import socket
import subprocess
import tempfile
import time

from test_desktop_demo_retail import DEMO_NAME, record_original_demo
from test_desktop_video_retail import MAIN_MENU, client_size, find_window, launch, press
from test_mod_stack_retail import write_package
from test_remote_play_retail import wait_for_map, write_reference_qvm_package
from toolchain import ROOT


def wait_for_window(process, matches, timeout=45):
    deadline = time.monotonic() + timeout
    while process.poll() is None and time.monotonic() < deadline:
        hwnd = find_window(process.pid, matches)
        if hwnd:
            return hwnd
        time.sleep(0.05)
    raise RuntimeError(f"Expected Windows game view (process exit {process.poll()})")


def gameplay(map_name):
    return lambda title: title.endswith("Original QVM " + map_name) and "| -- FPS |" not in title


def check_server(package, reference, base, build, pure):
    if pure:
        write_reference_qvm_package(package / "baseq3", build / "reference/qvms")
    data_root = package if pure else base.parent
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as reservation:
        reservation.bind(("127.0.0.1", 0))
        port = reservation.getsockname()[1]
    with tempfile.TemporaryDirectory(dir=build, prefix="desktop-server-") as directory:
        home = Path(directory)
        (home / "baseq3").mkdir()
        shutil.copy2(reference.with_name("qagamex86.dll"), home / "baseq3")
        log = home / "baseq3/qconsole.log"
        startup = subprocess.STARTUPINFO()
        startup.dwFlags |= subprocess.STARTF_USESHOWWINDOW
        startup.wShowWindow = subprocess.SW_HIDE
        server = subprocess.Popen([reference, "+set", "dedicated", "1", "+set", "net_ip", "127.0.0.1",
                                   "+set", "net_port", str(port), "+set", "fs_basepath", home,
                                   "+set", "fs_homepath", home, "+set", "fs_cdpath", data_root,
                                   "+set", "logfile", "2", "+set", "vm_game", "0", "+set", "sv_pure", str(int(pure)),
                                   "+map", "q3dm1"], cwd=home, startupinfo=startup)
        try:
            wait_for_map(server, log)
            autoexec = package / "baseq3/autoexec.cfg"
            autoexec.write_text(f"bind F9 disconnect\nconnect 127.0.0.1:{port}\n", encoding="ascii")
            with launch(package, build / "desktop-remote-retail.log", gameplay("q3dm1")) as (client, hwnd):
                press(hwnd, 0x78)
                assert wait_for_window(client, lambda title: title == MAIN_MENU) == hwnd
            assert "ClientDisconnect:" in log.read_text(encoding="latin1")
        finally:
            server.terminate()
            server.wait(timeout=5)
            if log.exists():
                shutil.copy2(log, build / "desktop-remote-reference.log")


def check_demo(package, reference, base, build):
    with tempfile.TemporaryDirectory(dir=build, prefix="desktop-demo-recording-") as directory:
        fixture = record_original_demo(base, Path(directory), reference, build / "reference/qvms")
        target = package / "baseq3/demos"
        target.mkdir()
        shutil.copy2(fixture, target)
    (package / "baseq3/autoexec.cfg").write_text("demo " + DEMO_NAME + "\n", encoding="ascii")
    with launch(package, build / "desktop-demo-retail.log", gameplay("q3dm1")) as (client, hwnd):
        assert wait_for_window(client, lambda title: title == MAIN_MENU) == hwnd


def check_mod(package, build):
    game = package / "fixturemod"
    game.mkdir()
    write_package(game / "pak0.pk3", {"description.txt": b"Desktop test mod"})
    (game / "q3config.cfg").write_text(
        'seta r_mode "4"\nseta r_fullscreen "0"\nbind F8 "set fs_game baseq3; fs_restart"\n',
        encoding="ascii",
    )
    (package / "baseq3/q3config.cfg").write_text(
        'seta r_mode "3"\nseta r_fullscreen "0"\n', encoding="ascii",
    )
    autoexec = package / "baseq3/autoexec.cfg"
    autoexec.write_text("set fs_game fixturemod; fs_restart; spmap q3dm0\n", encoding="ascii")
    with launch(package, build / "desktop-mod-retail.log", gameplay("q3dm0")) as (client, hwnd):
        assert client_size(hwnd) == (800, 600)
        autoexec.unlink()
        press(hwnd, 0x77)
        assert wait_for_window(client, lambda title: title == MAIN_MENU) == hwnd
        assert client_size(hwnd) == (640, 480)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data-root", type=Path, required=True)
    parser.add_argument("--case", choices=("server", "demo", "mod", "all"), default="all")
    parser.add_argument("--pure", action="store_true", help="require original server PK3 verification")
    args = parser.parse_args()
    build = ROOT / "build"
    base = args.data_root.resolve() / "baseq3"
    if not (base / "pak0.pk3").is_file():
        parser.error(f"expected Retail archives in {base}")
    reference = build / "reference/quake3-reference.exe"
    with tempfile.TemporaryDirectory(dir=build, prefix="retail-streams-") as directory:
        package = Path(directory)
        (package / "baseq3").mkdir()
        (package / "qvms").mkdir()
        for path in [build / "MiniQuake3.exe", *build.glob("*.dll"), *build.glob("qvms/*.qvm")]:
            os.link(path, package / path.relative_to(build))
        for path in base.glob("pak*.pk3"):
            target = package / "baseq3" / path.name
            try:
                os.link(path, target)
            except OSError:
                shutil.copy2(path, target)
        if args.case in ("server", "all"):
            check_server(package, reference, base, build, args.pure)
            print(f"PASS: Retail Windows EXE joined original server (sv_pure={int(args.pure)}) and disconnected on the same HWND")
        if args.case in ("demo", "all"):
            check_demo(package, reference, base, build)
            print("PASS: Retail Windows EXE rendered original demo and returned to menu on the same HWND")
        if args.case in ("mod", "all"):
            check_mod(package, build)
            print("PASS: Retail Windows EXE booted a mod with its own config, played q3dm0 and switched back to Baseq3")


if __name__ == "__main__":
    main()
