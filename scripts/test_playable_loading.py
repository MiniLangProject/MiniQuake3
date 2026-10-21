#!/usr/bin/env python3
"""Verify the early playable-window loading contract and launch ordering."""
from __future__ import annotations

import subprocess
import sys

from toolchain import ROOT, run


def main() -> int:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source",
         "tests/playable_loading_contracts.ml", "--output",
         "playable_loading_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run([ROOT / "build/playable_loading_contracts.exe"], ROOT / "build").strip()
    expected = "PASS: 6 playable loading contracts"
    if value != expected:
        raise RuntimeError(value)

    main_source = (ROOT / "src/main.ml").read_text(encoding="utf-8")
    branch = main_source[main_source.index('if len(args)==3 and args[0]=="--play" then'):]
    branch = branch[:branch.index('if len(args)==2 and args[0]=="--play-bsp" then')]
    if not (branch.index("playableWindow.open") < branch.index("pk3.open") < branch.index("bsp.load")):
        raise RuntimeError("playable launch no longer opens its window before retail data loading")

    app_source = (ROOT / "src/mq3/client/playable_app.ml").read_text(encoding="utf-8")
    run_limited = app_source[app_source.index("function runLimited"):]
    if run_limited.index("window.open") > run_limited.index("materials.buildScriptIndex"):
        raise RuntimeError("playable app no longer opens before asset catalog loading")
    for phase in ("Preparing arena", "Loading world textures", "Loading player and item models",
                  "Loading HUD and menus", "Uploading renderer assets", "Entering arena"):
        if phase not in run_limited:
            raise RuntimeError(f"missing loading phase: {phase}")
    print(expected + "; early launch ordering PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
