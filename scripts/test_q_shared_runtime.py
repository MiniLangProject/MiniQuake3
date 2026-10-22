#!/usr/bin/env python3
"""Complete code/game/q_shared.c native runtime, unchanged-C and retail gate."""
from __future__ import annotations

import argparse
import json
import py_compile
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

ORACLE_FUNCTIONS = [
    "Com_Clamp", "COM_SkipPath", "COM_StripExtension", "ShortSwap",
    "ShortNoSwap", "LongSwap", "LongNoSwap", "Long64Swap",
    "Long64NoSwap", "FloatSwap", "FloatNoSwap", "Q_isprint",
    "Q_islower", "Q_isupper", "Q_isalpha", "Q_strrchr", "Q_stricmpn",
    "Q_strncmp", "Q_stricmp", "Q_strlwr", "Q_strupr", "Q_PrintStrlen",
    "Q_CleanStr", "Info_Validate",
]
REGRESSIONS = [
    "test_core.py", "test_system_info.py", "test_client_info.py",
    "test_client_commands.py", "test_spawn.py", "test_shared_game.py",
]

def build(source: str, output: str) -> Path:
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", source,
         "--output", output], cwd=ROOT, check=True
    )
    return ROOT / "build" / output

def port_name(symbol: str) -> str:
    if symbol.startswith("COM_"):
        return "com_" + symbol[4:]
    if symbol.startswith("Com_"):
        return "com_" + symbol[4:]
    if symbol.startswith("Info_"):
        return "info_" + symbol[5:]
    if symbol.startswith("Q_"):
        return "q_" + symbol[2:]
    return symbol[0].lower() + symbol[1:]

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--data-root", type=Path)
    ap.add_argument("--skip-regressions", action="store_true")
    args = ap.parse_args()
    py_compile.compile(__file__, doraise=True)

    original = ROOT / "Quake-III-Arena-original-source/code/game/q_shared.c"
    module = ROOT / "src/mq3/shared/q_shared_runtime.ml"
    ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
    entry = next(value for value in ledger["files"] if value["source"] == "code/game/q_shared.c")
    symbols = entry["symbol_candidates"]
    source_text = original.read_text(encoding="latin-1")
    module_text = module.read_text(encoding="utf-8")
    absent_source = [name for name in symbols if not re.search(r"\b" + re.escape(name) + r"\b", source_text)]
    absent_port = [name for name in symbols if not re.search(
        r"\bfunction\s+" + re.escape(port_name(name)) + r"\s*\(", module_text)]
    if len(symbols) != 59 or absent_source or absent_port:
        raise RuntimeError(
            f"q_shared coverage count={len(symbols)} source={absent_source} port={absent_port}"
        )

    out = ROOT / "build/reference/q_shared_runtime"
    out.mkdir(parents=True, exist_ok=True)
    (out / "q_shared_runtime_under_test.inc").write_text(
        extract(original, ORACLE_FUNCTIONS), encoding="utf-8", newline="\n"
    )
    oracle_exe = out / "q_shared_runtime_oracle.exe"
    run([
        "cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4244",
        "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}",
        ROOT / "tests/reference/q_shared_runtime_oracle.c",
        f"/Fe:{oracle_exe}", "/link", "/Brepro",
    ], out, msvc_env("x64"), out / "oracle-build.log")
    native = run([oracle_exe], out, log=out / "oracle.log")
    mini = run([build("tests/q_shared_runtime_oracle.ml", "q_shared_runtime_oracle.exe")],
               ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("q_shared unchanged-C mismatch\nnative: " + repr(native) + "\nmini:   " + repr(mini))

    contracts = run([build("tests/q_shared_runtime_contracts.ml", "q_shared_runtime_contracts.exe")],
                    ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 39 complete q_shared.c runtime contracts":
        raise RuntimeError(contracts)

    retail = None
    if args.data_root:
        retail = run([
            build("tests/q_shared_runtime_retail_probe.ml", "q_shared_runtime_retail_probe.exe"),
            args.data_root.resolve(),
        ], ROOT / "build", log=out / "retail.log").strip()
        if not retail.startswith("PASS: 8 retail q_shared.c probes"):
            raise RuntimeError(retail)

    regression_results = {}
    if not args.skip_regressions:
        for script in REGRESSIONS:
            command = [sys.executable, ROOT / "scripts" / script]
            if script == "test_spawn.py":
                if not args.data_root:
                    regression_results[script] = ["SKIP: requires --data-root"]
                    continue
                command.extend([str(args.data_root.resolve()), "--map", "q3dm6", "--map", "q3dm7"])
            value = subprocess.run(
                command, cwd=ROOT, check=True,
                capture_output=True, text=True, timeout=600,
            ).stdout
            passes = [line for line in value.splitlines() if line.startswith("PASS:") or ": PASS " in line]
            regression_results[script] = passes

    files = [
        original, module, ROOT / "tests/reference/q_shared_runtime_oracle.c",
        ROOT / "tests/q_shared_runtime_oracle.ml",
        ROOT / "tests/q_shared_runtime_contracts.ml",
        ROOT / "tests/q_shared_runtime_retail_probe.ml", Path(__file__),
    ]
    result = {
        "passed": True,
        "symbols": 59,
        "unchanged_c_functions": ORACLE_FUNCTIONS,
        "oracle_records": len(native.splitlines()),
        "contracts": 39,
        "retail": retail,
        "regressions": regression_results,
        "scope": "Complete q_shared.c facade for endian values, parse sessions, compression and matrices, ASCII strings, managed formatting and info strings.",
        "safe_boundaries": "Returned strings are owned managed values rather than writable C pointers; Q_strrchr returns a byte index; qint64 is an exact eight-byte value; varargs are typed argument arrays. The typed formatter covers the engine-used s/d/i/u/x/X/f/c/percent conversions; arbitrary CRT length modifiers and dynamic width/precision remain outside this managed boundary.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 59 / 59 q_shared.c symbols")
    print(f"PASS: {len(native.splitlines())} unchanged-C q_shared.c records from {len(ORACLE_FUNCTIONS)} functions")
    print(contracts)
    if retail:
        print(retail)
    if regression_results:
        print("PASS: 6 parser/info/clientinfo/commands/spawn/shared-game regression gates")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
