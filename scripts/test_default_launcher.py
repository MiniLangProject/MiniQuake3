#!/usr/bin/env python3
"""Keep no-argument EXE startup on the colocated original-QVM path."""

from pathlib import Path

from toolchain import ROOT


def main() -> int:
    entry = (ROOT / "src" / "main.ml").read_text(encoding="utf-8")
    entry_required = [
        'if len(args)==0 then',
        'playableWindow.executableDirectory()',
        'baseq3Path=executableRoot+"/baseq3"',
        'pk3.openStandard(baseq3Path)',
        'pk3.read(archive,"maps/q3dm1.bsp")',
        'qvmRoot=executableRoot+"/qvms"',
        'qvmMenuApp.run(archive,map,qvmRoot)',
    ]
    missing_entry = [item for item in entry_required if item not in entry]
    if missing_entry:
        raise RuntimeError("no-argument EXE startup is incomplete: " + ", ".join(missing_entry))
    if entry.index('if len(args)==0 then') > entry.index('if len(args)==4 and args[0]=="--menu-qvm" then'):
        raise RuntimeError("no-argument EXE startup must be the first main dispatch path")
    launcher = (ROOT / "Play-MiniQuake3.cmd").read_text(encoding="utf-8").lower()
    required = [
        "--menu-qvm",
        "build\\reference\\qvms",
        "qagame.qvm",
        "cgame.qvm",
        "ui.qvm",
        "scripts\\build_qvms.py",
    ]
    missing = [item for item in required if item not in launcher]
    if missing:
        raise RuntimeError("default launcher is missing original-QVM requirements: " + ", ".join(missing))
    launch_lines = [line.strip() for line in launcher.splitlines() if "miniquake3.exe" in line and line.strip().startswith('"')]
    if len(launch_lines) != 1 or " --play " in launch_lines[0] or "--menu-qvm" not in launch_lines[0]:
        raise RuntimeError("default launcher must start exactly one original-QVM menu path")
    if "load only after you start a match" not in launcher:
        raise RuntimeError("default launcher must document deferred qagame/cgame loading")
    print("PASS: no-argument EXE discovers colocated baseq3 and starts original retail QVMs")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
