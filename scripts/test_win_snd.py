#!/usr/bin/env python3
"""Differential error mapping and native contracts for win_snd.c."""
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def main() -> int:
    out = ROOT / "build/reference/win_snd"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/win32/win_snd.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    symbols = ["DSoundError", "SNDDMA_Activate", "SNDDMA_BeginPainting", "SNDDMA_GetDMAPos", "SNDDMA_Init", "SNDDMA_InitDS", "SNDDMA_Shutdown", "SNDDMA_Submit"]
    for symbol in symbols:
        if symbol not in text:
            raise RuntimeError(f"missing original symbol {symbol}")
    (out / "win_snd_under_test.inc").write_text(extract(source, ["DSoundError"]), encoding="utf-8", newline="\n")
    native = out / "win_snd_oracle.exe"
    run(["cl", "/nologo", "/Od", "/MT", "/W4", "/WX", f"/I{out}", ROOT / "tests/reference/win_snd_oracle.c", f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native_text = run([native], out, log=out / "oracle.log")
    mini_text = run([build("tests/win_snd_oracle.ml", "win_snd_oracle.exe")], ROOT / "build", log=out / "minilang.log")
    if native_text != mini_text:
        raise RuntimeError(f"Win32 DirectSound differential mismatch\nC:\n{native_text}\nMiniLang:\n{mini_text}")
    contract_text = run([build("tests/win_snd_contracts.ml", "win_snd_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if contract_text != "PASS: 24 Win32 DirectSound contracts / 8 symbols":
        raise RuntimeError(contract_text)
    print("PASS: 5 unchanged Win32 DirectSound error records match MiniLang")
    print(contract_text)
    print(f"original_sha256={sha(source)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
