#!/usr/bin/env python3
"""Keep the user-facing launcher on the original-QVM interaction path."""

from pathlib import Path

from toolchain import ROOT


def main() -> int:
    launcher = (ROOT / "Play-MiniQuake3.cmd").read_text(encoding="utf-8").lower()
    required = [
        "--play-qvm",
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
    if len(launch_lines) != 1 or " --play " in launch_lines[0] or "--play-qvm" not in launch_lines[0]:
        raise RuntimeError("default launcher must start exactly one original-QVM game path")
    print("PASS: default launcher uses original qagame/cgame/ui QVM interaction path")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
