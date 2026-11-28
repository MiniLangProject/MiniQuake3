#!/usr/bin/env python3
"""Keep no-argument GUI startup on the retail asset and original-QVM path."""

from pathlib import Path

from toolchain import ROOT


def pe_subsystem(path: Path) -> int:
    data = path.read_bytes()
    pe = int.from_bytes(data[0x3C:0x40], "little")
    return int.from_bytes(data[pe + 24 + 68:pe + 24 + 70], "little")


def main() -> int:
    entry = (ROOT / "src" / "main.ml").read_text(encoding="utf-8")
    entry_required = [
        'if len(args)==0 then',
        'playableWindow.executableDirectory()',
        'startupAssets.openRetailArchive(executableRoot)',
        'startupAssets.showMissingPaks()',
        'qvmRoot=executableRoot+"/qvms"',
        'qvmMenuApp.run(data.archive,void,qvmRoot,data.directory)',
    ]
    missing_entry = [item for item in entry_required if item not in entry]
    if missing_entry:
        raise RuntimeError("no-argument EXE startup is incomplete: " + ", ".join(missing_entry))
    if entry.index('if len(args)==0 then') > entry.index('if len(args)==4 and args[0]=="--menu-qvm" then'):
        raise RuntimeError("no-argument EXE startup must be the first main dispatch path")
    launcher = (ROOT / "Play-MiniQuake3.cmd").read_text(encoding="utf-8").lower()
    required = [
        "build\\qvms",
        "qagame.qvm",
        "cgame.qvm",
        "ui.qvm",
        "scripts\\build.py",
    ]
    missing = [item for item in required if item not in launcher]
    if missing:
        raise RuntimeError("default launcher is missing original-QVM requirements: " + ", ".join(missing))
    if "pak0.pk3" in launcher:
        raise RuntimeError("default launcher must leave retail PK3 discovery to the executable")
    launch_lines = [line.strip() for line in launcher.splitlines() if "miniquake3.exe" in line and line.strip().startswith("start")]
    if launch_lines != ['start "" "build\\miniquake3.exe"']:
        raise RuntimeError("default launcher must detach the colocated no-argument GUI executable")
    binary = ROOT / "build" / "MiniQuake3.exe"
    if not binary.is_file() or pe_subsystem(binary) != 2:
        raise RuntimeError("MiniQuake3.exe must use IMAGE_SUBSYSTEM_WINDOWS_GUI")
    print("PASS: no-argument GUI EXE owns retail PK3 discovery and starts without a console window")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
