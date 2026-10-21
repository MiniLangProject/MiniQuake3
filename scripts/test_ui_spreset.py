#!/usr/bin/env python3
"""Unchanged q3_ui SP reset transitions and native MiniLang contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = ["Reset_Cache", "Reset_MenuDraw", "Reset_MenuEvent", "Reset_MenuKey", "UI_ResetMenu"]
ORACLE_FUNCTIONS = ["Reset_MenuEvent", "Reset_MenuKey"]


def build(source: str, output: str):
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def main() -> int:
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_spreset.c"
    port = ROOT / "src/mq3/client/ui_spreset.ml"
    original_text = source.read_text(encoding="utf-8", errors="replace")
    port_text = port.read_text(encoding="utf-8")
    for name in FUNCTIONS:
        if name not in original_text:
            raise RuntimeError(f"missing original SP reset function {name}")
        if f"function {name}(" not in port_text:
            raise RuntimeError(f"missing native SP reset function {name}")

    out = ROOT / "build/reference/ui_spreset"
    out.mkdir(parents=True, exist_ok=True)
    (out / "ui_spreset_under_test.inc").write_text(extract(source, ORACLE_FUNCTIONS), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/ui_spreset_oracle.c"
    native_exe = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/W3", "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", harness,
         f"/Fe:{native_exe}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native_exe], out, log=out / "native.log")
    actual = run([build("tests/ui_spreset_oracle.ml", "ui_spreset_oracle.exe")], ROOT / "build", log=out / "minilang.log")
    if expected != actual:
        raise RuntimeError(f"UI SP reset differential mismatch\n--- C ---\n{expected}\n--- MiniLang ---\n{actual}")
    contracts = run([build("tests/ui_spreset_contracts.ml", "ui_spreset_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 16 UI SP reset contracts":
        raise RuntimeError(contracts)
    files = [source, port, harness, ROOT / "tests/ui_spreset_oracle.ml", ROOT / "tests/ui_spreset_contracts.ml"]
    result = {
        "passed": True, "differential_records": 7, "contracts": 16, "functions": FUNCTIONS,
        "scope": "Complete reset confirmation menu layout, connected overlay mode, navigation shortcuts, progress clearing and level-menu restart.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print("PASS: 7 unchanged C SP reset records + 16 contracts / 5 original functions")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
