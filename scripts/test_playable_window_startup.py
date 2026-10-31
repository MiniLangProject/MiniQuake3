#!/usr/bin/env python3
"""Exercise the productive MiniLang FFI boundary that opens the Win32 game window."""
from __future__ import annotations

import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main() -> int:
    output = ROOT / "build/reference/playable_window_startup"
    output.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [
            sys.executable,
            ROOT / "scripts/build.py",
            "--source",
            "tests/playable_window_open_smoke.ml",
            "--output",
            "playable_window_open_smoke.exe",
        ],
        cwd=ROOT,
        check=True,
    )
    result = run(
        [ROOT / "build/playable_window_open_smoke.exe"],
        ROOT / "build",
        log=output / "startup.log",
    ).strip()
    expected = "PASS: MiniLang Win32 playable window opened"
    if result != expected:
        raise RuntimeError(result)
    files = [
        ROOT / "src/mq3/platform/playable_window.ml",
        ROOT / "native/playable_win32.c",
        ROOT / "tests/playable_window_open_smoke.ml",
    ]
    report = {
        "passed": True,
        "scope": "Productive MiniLang FFI startup, Win32 window creation, WGL initialization and clean shutdown.",
        "sources": {
            str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files
        },
    }
    (output / "result.json").write_text(
        json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n"
    )
    print(expected)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
