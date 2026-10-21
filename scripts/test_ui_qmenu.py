#!/usr/bin/env python3
"""Unchanged Baseq3 QMenu differential and native MiniLang contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    "Action_Draw", "Action_Init", "BText_Draw", "BText_Init", "Bitmap_Draw", "Bitmap_Init",
    "Menu_ActivateItem", "Menu_AddItem", "Menu_AdjustCursor", "Menu_Cache", "Menu_CursorMoved",
    "Menu_DefaultKey", "Menu_Draw", "Menu_ItemAtCursor", "Menu_SetCursor", "Menu_SetCursorToItem",
    "PText_Draw", "PText_Init", "RadioButton_Draw", "RadioButton_Init", "RadioButton_Key",
    "ScrollList_Draw", "ScrollList_Init", "ScrollList_Key", "Slider_Draw", "Slider_Init", "Slider_Key",
    "SpinControl_Draw", "SpinControl_Init", "SpinControl_Key", "Text_Draw", "Text_Init",
]

ORACLE_FUNCTIONS = [
    "Text_Init", "BText_Init", "Bitmap_Init", "Action_Init", "RadioButton_Init", "RadioButton_Key",
    "Slider_Init", "Slider_Key", "SpinControl_Init", "SpinControl_Key", "ScrollList_Init",
    "Menu_AdjustCursor", "Menu_ItemAtCursor", "Menu_ActivateItem",
]


def main():
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_qmenu.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        if name not in text:
            raise RuntimeError(f"missing original QMenu function {name}")

    out = ROOT / "build/reference/ui_qmenu"
    out.mkdir(parents=True, exist_ok=True)
    include = out / "ui_qmenu_under_test.inc"
    include.write_text(extract(source, ORACLE_FUNCTIONS), encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/ui_qmenu_oracle.c"
    native = out / "oracle.exe"
    run([
        "cl", "/nologo", "/Od", "/W3", "/D_CRT_SECURE_NO_WARNINGS", f"/I{out}", harness,
        f"/Fe:{native}", "/link", "/Brepro",
    ], out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")

    for path, name in [
        ("tests/ui_qmenu_oracle.ml", "ui_qmenu_oracle.exe"),
        ("tests/ui_qmenu_contracts.ml", "ui_qmenu_contracts.exe"),
    ]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", path, "--output", name], cwd=ROOT, check=True)
    actual = run([ROOT / "build/ui_qmenu_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if expected != actual:
        raise RuntimeError(f"QMenu differential mismatch\n--- C ---\n{expected}\n--- MiniLang ---\n{actual}")
    contracts = run([ROOT / "build/ui_qmenu_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 50 UI QMenu contracts":
        raise RuntimeError(contracts)

    files = [source, harness, ROOT / "src/mq3/client/ui_qmenu.ml", ROOT / "tests/ui_qmenu_oracle.ml", ROOT / "tests/ui_qmenu_contracts.ml"]
    result = {
        "passed": True,
        "differential_records": 18,
        "contracts": 50,
        "functions": FUNCTIONS,
        "scope": "Complete Baseq3 q3_ui menu framework: item initialization and drawing, focus/cursor transitions, activation/default keys, bitmap/text widgets, radio buttons, sliders, spin controls, single/multi-column scroll lists, editable fields and retail cache assets.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print("PASS: 18 unchanged C QMenu records + 50 contracts / 32 original functions")


if __name__ == "__main__":
    main()
