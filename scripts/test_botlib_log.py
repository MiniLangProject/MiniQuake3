#!/usr/bin/env python3
"""Unchanged botlib l_log.c oracle and native MiniLang lifecycle contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


FUNCTIONS = ["Log_Close", "Log_FilePointer", "Log_Flush", "Log_Open", "Log_Shutdown", "Log_Write", "Log_WriteTimeStamped"]


def main():
    out = ROOT / "build/reference/botlib_log"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/botlib/l_log.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        assert name in text, name
    include = out / "l_log_under_test.inc"
    include.write_text(extract(source, FUNCTIONS), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/botlib_log_oracle.c"
    native = out / "oracle.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4100", "/wd4996", f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")
    for mini_source, output in [("tests/botlib_log_oracle.ml", "botlib_log_oracle.exe"), ("tests/botlib_log_contracts.ml", "botlib_log_contracts.exe")]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", output], cwd=ROOT, check=True)
    actual = run([ROOT / "build/botlib_log_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    assert expected == actual, (expected, actual)
    contracts = run([ROOT / "build/botlib_log_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    assert contracts == "PASS: 28 native botlib l_log contracts (7 symbols)", contracts
    files = [source, host, ROOT / "src/mq3/botlib/log.ml", ROOT / "tests/botlib_log_oracle.ml", ROOT / "tests/botlib_log_contracts.ml"]
    result = {"passed": True, "differential_records": 9, "contracts": 28, "source_functions": 7, "functions": FUNCTIONS, "scope": "Complete botlib logfile lifecycle: log libvar gate, binary open, duplicate/open/close errors, shutdown, file pointer, explicit and per-write flush, mixed printf formatting and original total-hour/minute/second timestamp semantics.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    print("PASS: 9 unchanged C botlib-log records + 28 contracts + 7 symbols")


if __name__ == "__main__":
    main()
