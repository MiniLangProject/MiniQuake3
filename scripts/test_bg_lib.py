#!/usr/bin/env python3
"""Run unchanged active bg_lib.c helpers and native MiniLang contracts."""
from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    "AddFloat", "AddInt", "AddString", "_atof", "_atoi", "abs", "acos",
    "atan2", "atof", "atoi", "cos", "create_acostable", "fabs", "floor",
    "memcpy", "memmove", "memset", "rand", "sin", "sqrt", "srand", "sscanf",
    "strcat", "strchr", "strcmp", "strcpy", "strlen", "strncpy", "strstr",
    "tan", "tolower", "toupper", "vsprintf",
]
DISABLED_IF0 = ["floor", "memset", "memcpy", "strncpy", "sqrt", "sin", "cos", "create_acostable", "acos", "atan2"]
ORACLE_FUNCTIONS = [
    "strlen", "strcat", "strcpy", "strcmp", "strchr", "strstr", "tolower",
    "toupper", "memmove", "srand", "rand", "atof", "_atof", "atoi", "_atoi",
    "abs", "fabs", "AddInt", "AddFloat", "AddString",
]


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def main() -> int:
    source = ROOT / "Quake-III-Arena-original-source/code/game/bg_lib.c"
    module = ROOT / "src/mq3/game/bg_lib.ml"
    original = source.read_text(encoding="utf-8", errors="replace")
    port = module.read_text(encoding="utf-8")
    for name in FUNCTIONS:
        assert name in original, f"missing original symbol {name}"
        assert f"function {name}(" in port, f"missing MiniLang symbol {name}"
    assert "function qsort(" in port and "qsort(a, n, es, cmp)" in original
    for name in DISABLED_IF0:
        assert f'"{name}"' in port.split("end function", 1)[0] or f'"{name}"' in port

    out = ROOT / "build/reference/bg_lib"
    out.mkdir(parents=True, exist_ok=True)
    (out / "bg_lib_under_test.inc").write_text(extract(source, ORACLE_FUNCTIONS), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/bg_lib_oracle.c"
    native = out / "oracle.exe"
    run(["cl", "/nologo", "/O2", "/Oi-", "/MT", "/W4", "/WX", "/wd4100", "/wd4244", "/wd4267", "/wd4996",
         "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro"],
        out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")
    oracle = build("tests/bg_lib_oracle.ml", "bg_lib_oracle.exe")
    actual = run([oracle], ROOT / "build", log=out / "minilang.log")
    if expected != actual:
        raise RuntimeError(f"bg_lib oracle mismatch\nC:\n{expected}\nMiniLang:\n{actual}")
    contracts = run([build("tests/bg_lib_contracts.ml", "bg_lib_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if not contracts.startswith("PASS: ") or not contracts.endswith(" native bg_lib contracts (33 ledger symbols + qsort)"):
        raise RuntimeError(contracts)
    files = [source, module, host, ROOT / "tests/bg_lib_oracle.ml", ROOT / "tests/bg_lib_contracts.ml"]
    result = {
        "passed": True, "ledger_symbols": 33, "additional_active_symbol": "qsort",
        "unchanged_c_functions": len(ORACLE_FUNCTIONS), "disabled_if0": DISABLED_IF0,
        "contracts": contracts,
        "scope": "Q3_VM string/memory, numeric parsing, random, formatting, scanning and generic sorting semantics; callable but explicitly marked #if 0 translations.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(f"PASS: 33 bg_lib ledger symbols + qsort + {len(ORACLE_FUNCTIONS)} unchanged-C functions")
    print(contracts)
    print("INFO: 10 symbols are complete callable translations of original #if 0 paths")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
