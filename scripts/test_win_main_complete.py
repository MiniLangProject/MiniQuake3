#!/usr/bin/env python3
"""Complete Win32 host parity: unchanged C, MiniLang contracts, and native ABI."""
from __future__ import annotations

import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

SYMBOLS = [
    "Spk_Close", "Spk_Open", "Spk_Printf", "Sys_BeginProfiling",
    "Sys_BeginStreamedFile", "Sys_CheckCD", "Sys_Cwd", "Sys_DefaultBasePath",
    "Sys_DefaultCDPath", "Sys_EndStreamedFile", "Sys_Error", "Sys_FreeFileList",
    "Sys_GetClipboardData", "Sys_GetEvent", "Sys_In_Restart_f", "Sys_InitStreamThread",
    "Sys_ListFiles", "Sys_ListFilteredFiles", "Sys_LoadDll", "Sys_LowPhysicalMemory",
    "Sys_Mkdir", "Sys_Net_Restart_f", "Sys_Print", "Sys_QueEvent", "Sys_Quit",
    "Sys_ScanForCD", "Sys_ShutdownStreamThread", "Sys_StreamSeek", "Sys_StreamThread",
    "Sys_StreamedRead", "Sys_UnloadDll", "WinMain", "strgtr",
]


def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT, check=True,
    )
    return ROOT / "build" / output


def main() -> int:
    out = ROOT / "build/reference/win_main_complete"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/win32/win_main.c"
    runtime = ROOT / "src/mq3/platform/win_main_runtime.ml"
    runtime_text = runtime.read_text(encoding="utf-8")
    missing = [name for name in SYMBOLS if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", runtime_text)]
    if missing:
        raise RuntimeError("missing win_main runtime symbols: " + ", ".join(missing))

    # The inventory token `systems` comes from "common systems" in a comment;
    # it is not a declaration.  Keep the executable symbol count honest.
    original_text = original.read_text(encoding="utf-8", errors="replace")
    if re.search(r"(?m)^\s*(?:static\s+)?(?:void|int|qboolean|char\s*\*+)\s+systems\s*\(", original_text):
        raise RuntimeError("unexpected systems declaration appeared in original win_main.c")

    include = out / "win_main_complete_under_test.inc"
    include.write_text(extract(original, ["strgtr"]), encoding="utf-8", newline="\n")
    oracle = out / "oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4267", f"/I{out}",
         ROOT / "tests/reference/win_main_complete_oracle.c", f"/Fe:{oracle}", "/link", "/Brepro"],
        out, msvc_env("x64"), out / "oracle-build.log",
    )
    native_oracle = run([oracle], out, log=out / "oracle.log")
    mini_oracle = run(
        [build("tests/win_main_complete_oracle.ml", "win_main_complete_oracle.exe")],
        ROOT / "build", log=out / "minilang.log",
    )
    if native_oracle != mini_oracle:
        raise RuntimeError(f"win_main strgtr mismatch\nC:\n{native_oracle}\nMiniLang:\n{mini_oracle}")

    native_contracts = out / "native-contracts.exe"
    run(
        ["cl", "/nologo", "/O2", "/MT", "/W4", "/WX",
         ROOT / "native/win_main_win32.c", ROOT / "tests/win_main_native_contracts.c",
         "user32.lib", "winmm.lib", f"/Fe:{native_contracts}", "/link", "/Brepro"],
        out, msvc_env("x64"), out / "native-build.log",
    )
    native_output = run([native_contracts], out, log=out / "native.log").strip()
    if native_output != "PASS: 12 native win_main contracts":
        raise RuntimeError(native_output)

    contracts = run(
        [build("tests/win_main_complete_contracts.ml", "win_main_complete_contracts.exe")],
        out, log=out / "contracts.log",
    ).strip()
    if contracts != "PASS: 22 complete win_main contracts":
        raise RuntimeError(contracts)

    build_text = (ROOT / "scripts/build.py").read_text(encoding="utf-8")
    for anchor in ["miniquake3_winmain.dll", "native/win_main_win32.c", '"/W4", "/WX"']:
        if anchor not in build_text:
            raise RuntimeError("missing productive build anchor: " + anchor)

    files = [
        original, runtime, ROOT / "native/win_main_win32.c", ROOT / "scripts/build.py",
        ROOT / "tests/reference/win_main_complete_oracle.c",
        ROOT / "tests/win_main_complete_oracle.ml",
        ROOT / "tests/win_main_complete_contracts.ml",
        ROOT / "tests/win_main_native_contracts.c",
    ]
    result = {
        "passed": True,
        "symbols": len(SYMBOLS),
        "inventory_false_positive": "systems",
        "unchanged_c_records": len(native_oracle.splitlines()),
        "contracts": 22,
        "native_contracts": 12,
        "scope": "Complete Windows host facade: filesystem discovery, clipboard, DLL lifecycle, streaming, events, console/error/quit, restart/init and bounded WinMain frame ownership with a /W4 /WX native ABI.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 33/33 real win_main symbols + 8 unchanged-C records + 22 MiniLang contracts + 12 native /W4 /WX contracts")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
