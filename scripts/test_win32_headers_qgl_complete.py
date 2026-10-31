#!/usr/bin/env python3
"""Complete Win32 header/QGL parity gate against the unchanged id sources."""
from __future__ import annotations

import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

HELPERS = ["BooleanToString", "FuncToString", "PrimToString", "CapToString", "TypeToString", "BlendToName"]
LIFECYCLE = ["QGL_Init", "QGL_Shutdown", "QGL_EnableLogging"]


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def main() -> int:
    out = ROOT / "build/reference/win32_headers_qgl"
    out.mkdir(parents=True, exist_ok=True)
    original_dir = ROOT / "Quake-III-Arena-original-source/code/win32"
    original_qgl = original_dir / "win_qgl.c"
    qgl_source = original_qgl.read_text(encoding="latin-1")
    runtime = ROOT / "src/mq3/platform/win_qgl_runtime.ml"
    runtime_source = runtime.read_text(encoding="utf-8")
    headers = ROOT / "src/mq3/platform/win_headers.ml"
    header_source = headers.read_text(encoding="utf-8")

    original_logs = sorted(set(re.findall(r"\b(log[A-Za-z0-9_]+)\s*\(", qgl_source)))
    renderer_source = (ROOT / "src/mq3/renderer/qgl.ml").read_text(encoding="utf-8")
    core_match = re.search(r"function coreEntryPoints\(\) return \[(.*?)\] end function", renderer_source, re.S)
    if not core_match:
        raise RuntimeError("missing canonical QGL core inventory")
    core = re.findall(r'"(qgl[A-Za-z0-9_]+)"', core_match.group(1))
    projected_logs = sorted("log" + name[3:] for name in core if name not in {"qglActiveTextureARB", "qglClientActiveTextureARB", "qglMultiTexCoord2fARB", "qglLockArraysEXT", "qglUnlockArraysEXT"})
    if original_logs != projected_logs:
        raise RuntimeError(f"QGL log wrapper inventory mismatch original={len(original_logs)} projected={len(projected_logs)}")
    missing = [name for name in HELPERS + LIFECYCLE if not re.search(rf"\bfunction\s+{name}\s*\(", runtime_source)]
    if missing or "__LOG_FUNCTIONS__" in runtime_source:
        raise RuntimeError("missing Win32 QGL ownership: " + ", ".join(missing))

    expected_header_names = [
        "GLWState", "WinVars", "DIRECTSOUND_VERSION", "DIRECTINPUT_VERSION",
        "IDS_STRING1", "IDI_ICON1", "IDB_BITMAP1", "IDB_BITMAP2", "IDC_CURSOR1", "IDC_CURSOR2", "IDC_CURSOR3",
        "IN_MouseEvent", "Sys_QueEvent", "Sys_CreateConsole", "Sys_DestroyConsole", "Sys_ConsoleInput", "Sys_GetPacket",
        "IN_Init", "IN_Shutdown", "IN_JoystickCommands", "IN_Move", "IN_DeactivateWin32Mouse", "IN_Activate", "IN_Frame",
        "MainWndProc", "Conbuf_AppendText", "SNDDMA_Activate", "SNDDMA_InitDS",
    ]
    absent = [name for name in expected_header_names if name not in header_source]
    if absent:
        raise RuntimeError("missing Win32 header ownership: " + ", ".join(absent))

    include = out / "win_qgl_helpers_under_test.inc"
    include.write_text(extract(original_qgl, HELPERS), encoding="utf-8", newline="\n")
    header_oracle = out / "headers.exe"
    helper_oracle = out / "helpers.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", f"/I{original_dir}", ROOT / "tests/reference/win32_headers_oracle.c", f"/Fe:{header_oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "headers-build.log")
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", f"/I{out}", ROOT / "tests/reference/win_qgl_helpers_oracle.c", f"/Fe:{helper_oracle}", "/link", "/Brepro", "opengl32.lib"], out, msvc_env("x64"), out / "helpers-build.log")

    native_headers = run([header_oracle], out, log=out / "headers-native.log")
    mini_headers = run([build("tests/win32_headers_oracle.ml", "win32_headers_oracle.exe")], ROOT / "build", log=out / "headers-mini.log")
    if native_headers != mini_headers:
        raise RuntimeError("Win32 header layout/constants differ from original\nC:\n" + native_headers + "\nMiniLang:\n" + mini_headers)
    native_helpers = run([helper_oracle], out, log=out / "helpers-native.log")
    mini_helpers = run([build("tests/win_qgl_helpers_oracle.ml", "win_qgl_helpers_oracle.exe")], ROOT / "build", log=out / "helpers-mini.log")
    if native_helpers != mini_helpers:
        raise RuntimeError("Win32 QGL helper behavior differs from original\nC:\n" + native_helpers + "\nMiniLang:\n" + mini_helpers)
    contracts = run([build("tests/win_qgl_contracts.ml", "win_qgl_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 13 win_qgl contracts":
        raise RuntimeError(contracts)

    subprocess.run([sys.executable, ROOT / "scripts/test_win_glimp_complete.py"], cwd=ROOT, check=True)
    productive = (ROOT / "src/mq3/platform/win_glimp_runtime.ml").read_text(encoding="utf-8")
    for anchor in ["winQgl.QGL_Init", "winQgl.QGL_Shutdown", "winHeaders.createGLWState"]:
        if anchor not in productive:
            raise RuntimeError("missing productive Windows integration: " + anchor)

    files = [original_qgl, original_dir / "glw_win.h", original_dir / "win_local.h", original_dir / "resource.h", runtime, headers, ROOT / "src/mq3/platform/win_glimp_runtime.ml"]
    result = {
        "passed": True,
        "original_log_wrappers": len(original_logs),
        "helpers": len(HELPERS),
        "lifecycle_functions": len(LIFECYCLE),
        "header_symbols": len(expected_header_names),
        "contracts": 13,
        "scope": "Complete Win32 QGL loader/logging ownership and original x86 glw/win/resource header ABI, integrated into the productive GLimp startup and shutdown path.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {len(original_logs)} QGL wrappers + {len(HELPERS)} helpers + 13 contracts + Win32 x86 ABI + productive GLimp integration")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
