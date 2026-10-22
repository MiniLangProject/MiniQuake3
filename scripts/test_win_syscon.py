#!/usr/bin/env python3
"""Differential text normalization and native contracts for win_syscon.c."""
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source",source,"--output",output],cwd=ROOT,check=True)
    return ROOT/"build"/output

def main() -> int:
    out=ROOT/"build/reference/win_syscon";out.mkdir(parents=True,exist_ok=True)
    source=ROOT/"Quake-III-Arena-original-source/code/win32/win_syscon.c";text=source.read_text(encoding="utf-8",errors="replace")
    symbols=["ConWndProc","Conbuf_AppendText","InputLineWndProc","Sys_ConsoleInput","Sys_CreateConsole","Sys_DestroyConsole","Sys_SetErrorText","Sys_ShowConsole"]
    for symbol in symbols:
        if symbol not in text:raise RuntimeError(f"missing original symbol {symbol}")
    (out/"win_syscon_under_test.inc").write_text(extract(source,["Conbuf_AppendText"]),encoding="utf-8",newline="\n")
    native=out/"win_syscon_oracle.exe"
    run(["cl","/nologo","/Od","/MT","/W4","/WX","/wd4244",f"/I{out}",ROOT/"tests/reference/win_syscon_oracle.c",f"/Fe:{native}","/link","/Brepro"],out,msvc_env("x64"),out/"oracle-build.log")
    expected=run([native],out,log=out/"oracle.log")
    actual=run([build("tests/win_syscon_oracle.ml","win_syscon_oracle.exe")],ROOT/"build",log=out/"minilang.log")
    if expected!=actual:raise RuntimeError(f"Win32 console text mismatch\nC:\n{expected}\nMiniLang:\n{actual}")
    contracts=run([build("tests/win_syscon_contracts.ml","win_syscon_contracts.exe")],ROOT/"build",log=out/"contracts.log").strip()
    if contracts!="PASS: 21 Win32 console contracts / 8 symbols":raise RuntimeError(contracts)
    print("PASS: 3 unchanged C console-buffer records + 21 contracts / 8 symbols")
    print(f"original_sha256={sha(source)}");return 0
if __name__=="__main__":raise SystemExit(main())
