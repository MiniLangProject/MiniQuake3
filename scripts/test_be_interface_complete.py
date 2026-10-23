#!/usr/bin/env python3
"""Exact Baseq3 be_interface.c lifecycle oracle and full API-surface audit."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    "Sys_MilliSeconds", "ValidClientNumber", "ValidEntityNumber", "BotLibSetup",
    "Export_BotLibSetup", "Export_BotLibShutdown", "Export_BotLibVarSet",
    "Export_BotLibVarGet", "Export_BotLibStartFrame", "Export_BotLibLoadMap",
    "Export_BotLibUpdateEntity", "BotExportTest", "Init_AAS_Export",
    "Init_EA_Export", "Init_AI_Export", "GetBotLibAPI",
]
ORACLE_FUNCTIONS = FUNCTIONS[:12]


def assignments(text: str, start: str, prefix: str):
    at = text.index(start)
    end = text.index("\n}", at)
    return re.findall(rf"{re.escape(prefix)}(?:->|\.)(\w+)\s*=\s*(\w+)\s*;", text[at:end])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    source = ROOT / "Quake-III-Arena-original-source/code/botlib/be_interface.c"
    native_source = ROOT / "src/mq3/botlib/be_interface.ml"
    original = source.read_text(encoding="utf-8", errors="replace")
    native = native_source.read_text(encoding="utf-8")
    missing = [name for name in FUNCTIONS if not re.search(rf"\b{name}\s*\(", original)]
    if missing:
        raise RuntimeError(f"missing original be_interface symbols: {missing}")
    tables = {
        "top": assignments(original, "botlib_export_t *GetBotLibAPI", "be_botlib_export"),
        "aas": assignments(original, "static void Init_AAS_Export", "aas"),
        "ea": assignments(original, "static void Init_EA_Export", "ea"),
        "ai": assignments(original, "static void Init_AI_Export", "ai"),
    }
    expected = {"top": 13, "aas": 22, "ea": 24, "ai": 75}
    for table, pairs in tables.items():
        if len(pairs) != expected[table]:
            raise RuntimeError(f"{table} export count changed: {len(pairs)}")
        absent = [pair for pair in pairs if f'["{pair[0]}","{pair[1]}"]' not in native]
        if absent:
            raise RuntimeError(f"native {table} export map misses {absent}")
    # The three Init_* routines are represented by exact nested export maps.
    nested_initializers = {"Init_AAS_Export": "aasExports", "Init_EA_Export": "eaExports", "Init_AI_Export": "aiExports"}
    missing_native = []
    for name in FUNCTIONS:
        native_name = nested_initializers.get(name, name)
        if f"function {native_name}(" not in native:
            missing_native.append(name)
    if missing_native:
        raise RuntimeError(f"native be_interface functions missing: {missing_native}")

    out = ROOT / "build/reference/be_interface_complete"
    out.mkdir(parents=True, exist_ok=True)
    (out / "be_interface_under_test.inc").write_text(extract(source, ORACLE_FUNCTIONS), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/be_interface_complete_oracle.c"
    oracle = out / "be_interface_complete_oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"],
        out,
        msvc_env("x86"),
        out / "oracle-build.log",
    )
    observed = run([oracle], out, log=out / "oracle.log")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/be_interface_complete_oracle.ml", "--output", "be_interface_complete_oracle.exe"], cwd=ROOT, check=True)
    actual = run([ROOT / "build/be_interface_complete_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if observed != actual:
        aa, bb = observed.splitlines(), actual.splitlines()
        for index in range(max(len(aa), len(bb))):
            left = aa[index] if index < len(aa) else "<missing>"
            right = bb[index] if index < len(bb) else "<missing>"
            if left != right:
                raise RuntimeError(f"be_interface mismatch at record {index + 1}\nnative: {left}\nmini:   {right}")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/be_interface_complete_contracts.ml", "--output", "be_interface_complete_contracts.exe"], cwd=ROOT, check=True)
    contracts = run([ROOT / "build/be_interface_complete_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 24 be_interface complete contracts":
        raise RuntimeError(contracts)

    retail = "not-run"
    if args.data_root:
        subprocess.run([sys.executable, ROOT / "scripts/test_botlib_retail_qagame.py", "--data-root", args.data_root], cwd=ROOT, check=True)
        retail = "12 retail qagame botlib lifecycle contracts"
    result = {
        "passed": True,
        "symbols": len(FUNCTIONS),
        "exports": sum(expected.values()),
        "oracle_records": len(observed.splitlines()),
        "contracts": 24,
        "retail": retail,
        "oracle": "Unchanged extracted Baseq3 botlib/be_interface.c function bodies with deterministic engine-subsystem stubs.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in [source, native_source, ROOT / "src/mq3/botlib/lifecycle_runtime.ml", ROOT / "src/mq3/engine/local_qvm_match.ml", harness, ROOT / "tests/be_interface_complete_oracle.ml", ROOT / "tests/be_interface_complete_contracts.ml"]},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f'PASS: {result["oracle_records"]} exact be_interface records + 24 native contracts + {result["exports"]}/134 exports; retail={retail}')


if __name__ == "__main__":
    main()
