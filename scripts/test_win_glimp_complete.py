#!/usr/bin/env python3
"""Complete unchanged-C and productive gate for code/win32/win_glimp.c."""
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
    "GLW_CheckOSVersion", "GLW_ChoosePFD", "GLW_CreatePFD", "GLW_CreateWindow",
    "GLW_InitDriver", "GLW_InitExtensions", "GLW_LoadOpenGL", "GLW_MakeContext",
    "GLW_SetMode", "GLW_StartDriverAndSetMode", "GLW_StartOpenGL", "GLimp_EndFrame",
    "GLimp_FrontEndSleep", "GLimp_Init", "GLimp_LogComment", "GLimp_RenderThreadWrapper",
    "GLimp_RendererSleep", "GLimp_Shutdown", "GLimp_SpawnRenderThread",
    "GLimp_WakeRenderer", "PrintCDSError",
]
EXACT = ["GLW_CreatePFD"]


def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output],
        cwd=ROOT,
        check=True,
    )
    return ROOT / "build" / output


def main() -> int:
    out = ROOT / "build/reference/win_glimp_complete"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/win32/win_glimp.c"
    runtime = ROOT / "src/mq3/platform/win_glimp_runtime.ml"
    source = runtime.read_text(encoding="utf-8")
    missing = [name for name in SYMBOLS if not re.search(rf"\bfunction\s+{re.escape(name)}\s*\(", source)]
    if missing:
        raise RuntimeError("missing win_glimp runtime symbols: " + ", ".join(missing))

    include = out / "win_glimp_complete_under_test.inc"
    include.write_text(extract(original, EXACT), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/win_glimp_complete_oracle.c"
    oracle = out / "oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/MT", "/W4", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"],
        out,
        msvc_env("x64"),
        out / "oracle-build.log",
    )
    native = run([oracle], out, log=out / "oracle.log")
    mini = run(
        [build("tests/win_glimp_complete_oracle.ml", "win_glimp_complete_oracle.exe")],
        ROOT / "build",
        log=out / "minilang.log",
    )
    if native != mini:
        left = native.splitlines()
        right = mini.splitlines()
        for index, (c_record, mini_record) in enumerate(zip(left, right), 1):
            if c_record != mini_record:
                raise RuntimeError(f"win_glimp mismatch record {index}\nC: {c_record}\nM: {mini_record}")
        raise RuntimeError(f"win_glimp record count mismatch C={len(left)} MiniLang={len(right)}")

    contracts = run(
        [build("tests/win_glimp_complete_contracts.ml", "win_glimp_complete_contracts.exe")],
        ROOT / "build",
        log=out / "contracts.log",
    ).strip()
    if contracts != "PASS: 31 complete win_glimp contracts":
        raise RuntimeError(contracts)

    subprocess.run([sys.executable, ROOT / "scripts/playable_window_build_test.py"], cwd=ROOT, check=True)
    native_source = (ROOT / "native/playable_win32.c").read_text(encoding="utf-8")
    facade_source = (ROOT / "src/mq3/platform/playable_window.ml").read_text(encoding="utf-8")
    required_native = [
        "LoadLibraryW", "ChoosePixelFormat", "DescribePixelFormat", "SetPixelFormat",
        "wglCreateContext", "wglMakeCurrent", "wglDeleteContext", "wglGetProcAddress",
        "glGetString", "glDrawPixels", "SwapBuffers", "ChangeDisplaySettingsW",
        "GetDeviceGammaRamp", "SetDeviceGammaRamp", "playable_window_gl_end_frame",
    ]
    required_facade = [
        "openConfigured", "glConfiguration", "glInfo", "glHasExtension",
        "glSetSwapInterval", "glSetGamma", "glRestoreGamma", "glActivate", "endFrame",
    ]
    absent = [item for item in required_native if item not in native_source]
    absent += [f"facade:{item}" for item in required_facade if item not in facade_source]
    if absent:
        raise RuntimeError("missing productive Win32 GLimp anchors: " + ", ".join(absent))

    files = [
        original, runtime, ROOT / "native/playable_win32.c",
        ROOT / "src/mq3/platform/playable_window.ml", harness,
        ROOT / "tests/win_glimp_complete_oracle.ml",
        ROOT / "tests/win_glimp_complete_contracts.ml",
        ROOT / "tests/playable_window_gl_native.c",
    ]
    result = {
        "passed": True,
        "symbols": len(SYMBOLS),
        "exact_functions": EXACT,
        "unchanged_c_records": len(native.splitlines()),
        "contracts": 31,
        "productive_anchors": len(required_native) + len(required_facade),
        "scope": "All win_glimp.c entry points through a C-named MiniLang runtime and the playable Win32 backend: WGL driver loading, pixel format selection, context current/delete lifecycle, fullscreen display mode restoration, GL strings/extensions, gamma, swap interval, end-frame presentation and render-thread handoff contracts.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(
        f"PASS: {len(SYMBOLS)}/{len(SYMBOLS)} win_glimp symbols + "
        f"{result['unchanged_c_records']} unchanged-C records + 31 contracts + productive WGL build"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
