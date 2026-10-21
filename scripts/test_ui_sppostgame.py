#!/usr/bin/env python3
"""Unchanged q3_ui SP postgame transitions and native MiniLang contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    "Prepname", "UI_SPPostgameMenu_AgainEvent", "UI_SPPostgameMenu_Cache",
    "UI_SPPostgameMenu_DrawAwardsMedals", "UI_SPPostgameMenu_DrawAwardsPresentation",
    "UI_SPPostgameMenu_Init", "UI_SPPostgameMenu_MenuDraw",
    "UI_SPPostgameMenu_MenuDrawScoreLine", "UI_SPPostgameMenu_MenuEvent",
    "UI_SPPostgameMenu_MenuKey", "UI_SPPostgameMenu_NextEvent", "UI_SPPostgameMenu_f",
]
ORACLE_FUNCTIONS = ["UI_SPPostgameMenu_AgainEvent", "UI_SPPostgameMenu_MenuEvent", "UI_SPPostgameMenu_MenuKey"]


def build(source: str, output: str):
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def main() -> int:
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_sppostgame.c"
    port = ROOT / "src/mq3/client/ui_sppostgame.ml"
    original_text = source.read_text(encoding="utf-8", errors="replace")
    port_text = port.read_text(encoding="utf-8")
    for name in FUNCTIONS:
        if name not in original_text:
            raise RuntimeError(f"missing original SP postgame function {name}")
        if f"function {name}(" not in port_text:
            raise RuntimeError(f"missing native SP postgame function {name}")

    out = ROOT / "build/reference/ui_sppostgame"
    out.mkdir(parents=True, exist_ok=True)
    (out / "ui_sppostgame_under_test.inc").write_text(extract(source, ORACLE_FUNCTIONS), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/ui_sppostgame_oracle.c"
    native_exe = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/W3", "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", harness,
         f"/Fe:{native_exe}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native_exe], out, log=out / "native.log")
    actual = run([build("tests/ui_sppostgame_oracle.ml", "ui_sppostgame_oracle.exe")], ROOT / "build", log=out / "minilang.log")
    if expected != actual:
        raise RuntimeError(f"UI SP postgame differential mismatch\n--- C ---\n{expected}\n--- MiniLang ---\n{actual}")
    contracts = run([build("tests/ui_sppostgame_contracts.ml", "ui_sppostgame_contracts.exe")], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 40 UI SP postgame contracts":
        raise RuntimeError(contracts)
    files = [source, port, harness, ROOT / "tests/ui_sppostgame_oracle.ml", ROOT / "tests/ui_sppostgame_contracts.ml"]
    result = {
        "passed": True, "differential_records": 9, "contracts": 40, "functions": FUNCTIONS,
        "scope": "Complete SP postgame command decoding, persistence, awards, podium phases, scoreboard, cinematics, navigation, input suppression, assets and menu state.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print("PASS: 9 unchanged C SP postgame records + 40 contracts / 12 original functions")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
