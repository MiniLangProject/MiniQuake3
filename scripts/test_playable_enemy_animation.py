#!/usr/bin/env python3
"""Build and run hostile preview-player animation-state contracts."""
from __future__ import annotations

import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main() -> int:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py",
         "--source", "tests/playable_enemy_animation_contracts.ml",
         "--output", "playable_enemy_animation_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    reference = ROOT / "build/reference/playable_enemy_animation"
    reference.mkdir(parents=True, exist_ok=True)
    value = run(
        [ROOT / "build/playable_enemy_animation_contracts.exe"],
        ROOT / "build",
        log=reference / "contracts.log",
    ).strip()
    expected = "PASS: 29 playable enemy-animation contracts"
    if value != expected:
        raise RuntimeError(value)
    files = [
        ROOT / "src/mq3/format/player_animation.ml",
        ROOT / "tests/playable_enemy_animation_contracts.ml",
    ]
    report = {
        "passed": True,
        "contracts": 29,
        "scope": "Preview-enemy idle, walk, run, attack, pain, death, dead and respawn animation states with Baseq3 indices and FrameSample-driven one-shot transitions.",
        "sources": {
            str(path.relative_to(ROOT)).replace("\\", "/"): sha(path)
            for path in files
        },
    }
    (reference / "result.json").write_text(
        json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n"
    )
    print(expected)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
