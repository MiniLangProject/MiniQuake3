#!/usr/bin/env python3
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]

anchors = {
    ROOT / "Quake-III-Arena-original-source/code/client/cl_cgame.c": (
        "case CG_REAL_TIME:",
        "return Com_RealTime( VMA(1) );",
        "case CG_SNAPVECTOR:",
        "Sys_SnapVector( VMA(1) );",
        "case CG_GET_ENTITY_TOKEN:",
        "return re.GetEntityToken( VMA(1), args[2] );",
    ),
    ROOT / "Quake-III-Arena-original-source/code/qcommon/common.c": (
        "int Com_RealTime(qtime_t *qtime)",
        "qtime->tm_isdst = tms->tm_isdst;",
    ),
    ROOT / "Quake-III-Arena-original-source/code/renderer/tr_bsp.c": (
        "qboolean R_GetEntityToken( char *buffer, int size )",
        "s_worldData.entityParsePoint = s_worldData.entityString;",
    ),
    ROOT / "Quake-III-Arena-original-source/code/win32/win_shared.c": (
        "void Sys_SnapVector( float *v )",
        "__asm\tfistp\ti;",
    ),
}
for path, required in anchors.items():
    text = path.read_text(encoding="latin-1")
    for anchor in required:
        if anchor not in text:
            raise SystemExit(f"FAIL: missing original ABI anchor {anchor!r} in {path.name}")

subprocess.run(
    [sys.executable, ROOT / "scripts/build.py", "--source", "tests/cgame_misc_traps_contracts.ml", "--output", "cgame_misc_traps_contracts.exe"],
    cwd=ROOT,
    check=True,
)
result = subprocess.run(
    [ROOT / "build/cgame_misc_traps_contracts.exe"],
    cwd=ROOT / "build",
    text=True,
    capture_output=True,
    check=True,
).stdout.strip()
if result != "PASS: 17 cgame misc-trap contracts":
    raise SystemExit(result)
print(result + " + original source anchors")

subprocess.run(
    [sys.executable, ROOT / "scripts/build.py", "--source", "tests/cgame_misc_dispatch_contracts.ml", "--output", "cgame_misc_dispatch_contracts.exe"],
    cwd=ROOT,
    check=True,
)
dispatch = subprocess.run(
    [ROOT / "build/cgame_misc_dispatch_contracts.exe"],
    cwd=ROOT / "build",
    text=True,
    capture_output=True,
    check=True,
).stdout.strip()
if dispatch != "PASS: 12 cgame misc-dispatch contracts":
    raise SystemExit(dispatch)
print(dispatch)
