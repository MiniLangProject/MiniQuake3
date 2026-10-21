#!/usr/bin/env python3
"""Run native Baseq3 item-goal selection oracle and MiniLang contracts."""
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, msvc_env, run


def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return ROOT / "build" / output


def main() -> int:
    out = ROOT / "build/reference/ai_goal_selection"
    out.mkdir(parents=True, exist_ok=True)
    native = out / "ai_goal_selection_oracle.exe"
    run(
        [
            "cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", "/WX",
            ROOT / "tests/reference/ai_goal_selection_oracle.c",
            f"/Fe:{native}", "/link", "/Brepro",
        ],
        out,
        msvc_env("x64"),
        out / "oracle-build.log",
    )
    observed = run([native], out).strip()
    expected = "PASS: 8 native Baseq3 goal-selection scenarios / 35 exact observations"
    if observed != expected:
        raise RuntimeError(observed)
    mini = run(
        [build("tests/ai_goal_selection_contracts.ml", "ai_goal_selection_contracts.exe")],
        ROOT / "build",
    ).strip()
    expected_mini = "PASS: 32 AI goal-selection contracts opcodes=535,536,538,539,545,564-566"
    if mini != expected_mini:
        raise RuntimeError(mini)
    print(observed)
    print(mini)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
