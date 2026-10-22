#!/usr/bin/env python3
"""Differential and native contracts for the Win32 gamma implementation."""
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = ["WG_CheckHardwareGamma", "GLimp_SetGamma", "WG_RestoreGamma", "mapGammaMax"]


def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return ROOT / "build" / output


def main() -> int:
    out = ROOT / "build/reference/win_gamma"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/win32/win_gamma.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        if name not in text:
            raise RuntimeError(f"missing original symbol {name}")
    (out / "win_gamma_under_test.inc").write_text(extract(source, FUNCTIONS), encoding="utf-8", newline="\n")
    native = out / "win_gamma_oracle.exe"
    run(
        [
            "cl", "/nologo", "/Od", "/fp:strict", "/MT", "/W4", "/WX",
            "/wd4244", "/wd4996", f"/I{out}", ROOT / "tests/reference/win_gamma_oracle.c",
            f"/Fe:{native}", "/link", "/Brepro",
        ],
        out,
        msvc_env("x86"),
        out / "oracle-build.log",
    )
    native_text = run([native], out, log=out / "oracle.log")
    mini = build("tests/win_gamma_oracle.ml", "win_gamma_oracle.exe")
    mini_text = run([mini], ROOT / "build", log=out / "minilang.log")
    if native_text != mini_text:
        raise RuntimeError(f"Win32 gamma differential mismatch\nC:\n{native_text}\nMiniLang:\n{mini_text}")
    contracts = build("tests/win_gamma_contracts.ml", "win_gamma_contracts.exe")
    contract_text = run([contracts], ROOT / "build", log=out / "contracts.log").strip()
    if contract_text != "PASS: 17 Win32 gamma contracts / 4 symbols":
        raise RuntimeError(contract_text)
    print("PASS: 7 unchanged Win32 gamma records match MiniLang")
    print(contract_text)
    print(f"original_sha256={sha(source)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
