"""Verify MiniLang remote play against the original engine with retail baseq3 data."""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import shutil
import socket
import subprocess
import sys
import tempfile
import time
from zipfile import ZIP_DEFLATED, ZipFile

from toolchain import ROOT, run


def wait_for_map(server: subprocess.Popen, log: Path) -> None:
    deadline = time.monotonic() + 30
    while time.monotonic() < deadline and server.poll() is None:
        if log.exists() and "------- Game Initialization -------" in log.read_text(encoding="latin1"):
            return
        time.sleep(0.05)
    raise RuntimeError("The original dedicated server did not initialize q3dm1")


def write_reference_qvm_package(baseq3: Path, qvms: Path) -> Path:
    """Install only the pinned reference protocol-68 QVMs in a disposable test game."""
    path = baseq3 / "zz-miniquake3-reference-qvms.pk3"
    with ZipFile(path, "x", ZIP_DEFLATED) as package:
        for name in ("cgame.qvm", "ui.qvm", "qagame.qvm"):
            package.write(qvms / name, "vm/" + name)
    return path


def verify_server(probe: Path, server_exe: Path, qagame: Path, data_root: Path,
                  output: Path, pure: bool) -> str:
    output.mkdir(parents=True, exist_ok=True)
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as reservation:
        reservation.bind(("127.0.0.1", 0))
        port = reservation.getsockname()[1]
    with tempfile.TemporaryDirectory(prefix="mq3-remote-") as temp:
        home = Path(temp)
        base = home / "baseq3"
        base.mkdir()
        shutil.copy2(qagame, base)
        log = base / "qconsole.log"
        command = [
            server_exe, "+set", "dedicated", "1", "+set", "net_ip", "127.0.0.1", "+set", "net_port", str(port),
            "+set", "fs_basepath", home, "+set", "fs_homepath", home, "+set", "fs_cdpath", data_root,
            "+set", "logfile", "2", "+set", "vm_game", "0", "+set", "sv_pure", str(int(pure)),
            "+map", "q3dm1",
        ]
        startup = subprocess.STARTUPINFO()
        startup.dwFlags |= subprocess.STARTF_USESHOWWINDOW
        startup.wShowWindow = subprocess.SW_HIDE
        server = subprocess.Popen([str(value) for value in command], cwd=home, startupinfo=startup)
        try:
            wait_for_map(server, log)
            text = run(
                [probe, f"127.0.0.1:{port}", data_root / "baseq3", str(int(pure))],
                probe.parent, timeout=30, log=output / "client.log",
            ).strip()
            if not text.startswith("PASS: Retail q3dm1 original server;"):
                raise RuntimeError(text)
            deadline = time.monotonic() + 2
            while time.monotonic() < deadline:
                if "ClientDisconnect:" in log.read_text(encoding="latin1"):
                    break
                time.sleep(0.02)
            else:
                raise RuntimeError("The server did not receive the client's reliable disconnect")
        finally:
            server.terminate()
            server.wait(timeout=5)
            if log.exists():
                shutil.copy2(log, output / "server.log")
    return text


def verify_qvm_boot(build_script: str, base: Path, reference_qvms: Path, demo: Path, output: Path) -> str:
    """Check the actual compressed QVM boot with an original protocol-68 snapshot."""
    if not demo.is_file() or demo.parent.name.lower() != "demos" or demo.suffix.lower() != ".dm_68":
        raise ValueError("--qvm-demo must point to a recorded .dm_68 in a demos directory")
    if any(not (reference_qvms / name).is_file() for name in ("cgame.qvm", "ui.qvm", "qagame.qvm")):
        subprocess.run([sys.executable, ROOT / "scripts/build_qvms.py"], cwd=ROOT, check=True)
    probe = ROOT / "build/remote_pure_qvm_probe.exe"
    subprocess.run(
        [sys.executable, ROOT / "scripts" / build_script, "--source", "tests/remote_pure_qvm_probe.ml",
         "--output", probe.name], cwd=ROOT, check=True,
    )
    with tempfile.TemporaryDirectory(dir=ROOT / "build", prefix="mq3-pure-qvm-") as temp:
        baseq3 = Path(temp) / "baseq3"
        baseq3.mkdir()
        for path in base.glob("*.pk3"):
            target = baseq3 / path.name
            try:
                os.link(path, target)
            except OSError:
                shutil.copy2(path, target)
        write_reference_qvm_package(baseq3, reference_qvms)
        result = run(
            [probe, baseq3, demo.parent.parent, demo.name], probe.parent,
            timeout=30, log=output / "qvm-boot.log",
        ).strip()
    if result != "PASS: Retail PK3 cgame and in-game UI from verified packages":
        raise RuntimeError(result)
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data-root", type=Path, default=ROOT / "build")
    parser.add_argument("--release", action="store_true", help="use the published MiniLang toolchain")
    parser.add_argument("--qvm-demo", type=Path, help="also test compressed QVM boot with this original .dm_68 recording")
    args = parser.parse_args()
    data_root = args.data_root.resolve()
    if not (data_root / "baseq3/pak0.pk3").is_file():
        parser.error("expected retail baseq3/pak0.pk3 under --data-root")
    build_script = "build_release.py" if args.release else "build.py"
    probe = ROOT / "build/remote_play_retail_probe.exe"
    reference = ROOT / "build/reference"
    server_exe = reference / "quake3-reference.exe"
    qagame = reference / "qagamex86.dll"
    output = reference / "remote_play"
    output.mkdir(parents=True, exist_ok=True)
    if not (server_exe.is_file() and qagame.is_file()):
        subprocess.run([sys.executable, ROOT / "scripts/build_reference.py"], cwd=ROOT, check=True)
    subprocess.run(
        [sys.executable, ROOT / "scripts" / build_script, "--source", "tests/remote_play_retail_probe.ml",
         "--output", probe.name], cwd=ROOT, check=True,
    )
    results = {}
    for pure in (False, True):
        mode = "pure" if pure else "regular"
        text = verify_server(probe, server_exe, qagame, data_root, output / mode, pure)
        print(text)
        results[mode] = text
    if args.qvm_demo:
        text = verify_qvm_boot(build_script, data_root / "baseq3", reference / "qvms", args.qvm_demo.resolve(), output)
        print(text)
        results["qvm_boot"] = text
    (output / "result.json").write_text(json.dumps({
        "passed": True, "reference": "original C engine", "retail_data_root": str(data_root),
        "map": "q3dm1", "protocol": 68, "results": results,
    }, indent=2) + "\n", encoding="utf-8", newline="\n")

if __name__ == "__main__":
    main()
