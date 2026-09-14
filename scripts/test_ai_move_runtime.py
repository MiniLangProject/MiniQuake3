#!/usr/bin/env python3
"""Run native and MiniLang contracts for op549 travel and movement-AI traps."""
import subprocess
import sys
from pathlib import Path

from test_aas_route_extras import fixture
from toolchain import ROOT, msvc_env, run


def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return ROOT / "build" / output


def main() -> int:
    out = ROOT / "build/reference/ai_move_runtime"
    out.mkdir(parents=True, exist_ok=True)
    data = out / "move_runtime.aas"
    data.write_bytes(fixture())
    native = out / "ai_move_runtime_oracle.exe"
    run(
        [
            "cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", "/WX",
            ROOT / "tests/reference/ai_move_runtime_oracle.c",
            f"/Fe:{native}", "/link", "/Brepro",
        ],
        out,
        msvc_env("x64"),
        out / "oracle-build.log",
    )
    observed = run([native], out).strip()
    expected = "PASS: 40 native Baseq3 move-runtime scenarios / 73 exact observations"
    if observed != expected:
        raise RuntimeError(observed)
    mini = run(
        [build("tests/ai_move_runtime_contracts.ml", "ai_move_runtime_contracts.exe"), data],
        ROOT / "build",
    ).strip()
    expected_mini = "PASS: 73 AI move-runtime contracts opcodes=549,550,553,554,557"
    if mini != expected_mini:
        raise RuntimeError(mini)
    print(observed)
    print(mini)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
