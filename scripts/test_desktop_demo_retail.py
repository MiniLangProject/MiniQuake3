#!/usr/bin/env python3
"""Record a local Retail match in the original engine and replay it in MiniQuake3."""

from __future__ import annotations

import argparse
from pathlib import Path
import struct
import subprocess
import sys
import tempfile
from zipfile import ZIP_DEFLATED, ZipFile

from toolchain import ROOT, run


DEMO_NAME = "miniquake_original_retail"
CHAT_LINE = "MiniQuake3 retail replay check"
QVM_NAMES = ("qagame.qvm", "cgame.qvm", "ui.qvm")


def record_original_demo(base: Path, home: Path, reference: Path, qvms: Path) -> Path:
    """Return the new demo. The original engine writes only under home."""
    isolated_base = home / "baseq3"
    isolated_base.mkdir()
    # The original CD may contain pre-protocol-68 QVMs. For this test use the
    # QVMs compiled from the same pinned source as the reference executable.
    with ZipFile(isolated_base / "pak9.pk3", "w", ZIP_DEFLATED) as package:
        for name in QVM_NAMES:
            package.write(qvms / name, "vm/" + name)

    (isolated_base / "record_fixture.cfg").write_text(
        "devmap q3dm1\nwait 100\n"
        f"record {DEMO_NAME}\nwait 20\n"
        "+forward\nwait 75\n-forward\n"
        f"say {CHAT_LINE}\nwait 130\nstoprecord\nquit\n",
        encoding="ascii",
    )
    startup = subprocess.STARTUPINFO()
    startup.dwFlags |= subprocess.STARTF_USESHOWWINDOW
    startup.wShowWindow = subprocess.SW_HIDE
    args = [
        str(reference), "+set", "fs_basepath", str(base.parent),
        "+set", "fs_homepath", str(home), "+set", "logfile", "2",
        "+set", "r_fullscreen", "0", "+set", "r_mode", "3",
        "+set", "s_initsound", "0", "+set", "sv_pure", "0",
        "+set", "vm_ui", "1", "+set", "vm_game", "1", "+set", "vm_cgame", "1",
        "+set", "g_synchronousClients", "1", "+set", "com_maxfps", "125",
        "+exec", "record_fixture.cfg",
    ]
    subprocess.run(args, cwd=home, startupinfo=startup, check=True, timeout=45)
    log = (isolated_base / "qconsole.log").read_text(encoding="latin1")
    demo = isolated_base / "demos" / (DEMO_NAME + ".dm_68")
    if "Stopped demo." not in log or CHAT_LINE not in log or not demo.is_file():
        raise RuntimeError(f"original engine did not finish recording; see {isolated_base / 'qconsole.log'}")
    return demo


def make_edge_cases(demo: Path) -> Path:
    data = demo.read_bytes()
    records = []
    position = 0
    while position + 8 <= len(data):
        sequence, size = struct.unpack_from("<ii", data, position)
        if size == -1:
            break
        payload = data[position + 8:position + 8 + size]
        if size <= 0 or len(payload) != size:
            raise ValueError("invalid framing in original recording")
        records.append((sequence, payload))
        position += 8 + size
    if not records or data[position:] != b"\xff" * 8:
        raise ValueError("missing original demo terminator")
    # Retain authentic gamestate and delta messages. Offset only the packet
    # numbers so the second epoch occupies a distinct part of the wire sequence.
    repeat = b"".join(
        struct.pack("<ii", sequence + records[-1][0] + 1, len(payload)) + payload
        for sequence, payload in records
    )
    (demo.parents[2] / "fixturemod").mkdir()
    archive = demo.parents[2] / "demo-edge-cases.pk3"
    with ZipFile(archive, "w", ZIP_DEFLATED) as package:
        package.writestr("demos/rollover.dm_68", data[:position] + repeat + b"\xff" * 8)
        package.writestr("demos/truncated.dm_68", data[:11])
    return archive


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data-root", required=True, type=Path)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--record-only", action="store_true", help="keep the fixture for interactive playback")
    mode.add_argument("--reuse-build", action="store_true", help="use the existing MiniQuake3 test executable")
    args = parser.parse_args()
    if sys.platform != "win32":
        parser.error("the original Win32 reference executable requires Windows")
    base = args.data_root.resolve()
    if (base / "baseq3").is_dir():
        base /= "baseq3"
    pak0 = base / "pak0.pk3"
    if not pak0.is_file():
        parser.error(f"expected retail pak0.pk3 in {base}")
    build = ROOT / "build"
    reference = build / "reference/quake3-reference.exe"
    qvms = build / "reference/qvms"
    if not reference.is_file():
        subprocess.run([sys.executable, ROOT / "scripts/build_reference.py"], cwd=ROOT, check=True)
    if any(not (qvms / name).is_file() for name in QVM_NAMES):
        subprocess.run([sys.executable, ROOT / "scripts/build_qvms.py"], cwd=ROOT, check=True)
    if args.record_only:
        home = Path(tempfile.mkdtemp(prefix="mq3-demo-fixture-", dir=build))
        print(record_original_demo(base, home, reference, qvms))
        return 0

    executable = build / "desktop_demo_retail_probe.exe"
    if not args.reuse_build:
        subprocess.run(
            [sys.executable, ROOT / "scripts/build_release.py",
             "--source", "tests/desktop_demo_retail_probe.ml", "--output", executable.name],
            cwd=ROOT,
            check=True,
        )
    with tempfile.TemporaryDirectory(prefix="mq3-demo-fixture-", dir=build) as temporary:
        home = Path(temporary)
        demo = record_original_demo(base, home, reference, qvms)
        edges = make_edge_cases(demo)
        result = run([executable, pak0, qvms, home / "baseq3", DEMO_NAME, edges], build, timeout=45)
        if not result.startswith("PASS: original Retail demo"):
            raise RuntimeError(result)
        print(result, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
