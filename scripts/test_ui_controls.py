#!/usr/bin/env python3
"""Unchanged ui_controls2.c differential, symbol inventory, and MiniLang contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


FUNCTIONS = [
    "Controls_ActionEvent",
    "Controls_Cache",
    "Controls_DrawKeyBinding",
    "Controls_DrawPlayer",
    "Controls_GetConfig",
    "Controls_GetCvarDefault",
    "Controls_GetCvarValue",
    "Controls_GetKeyAssignment",
    "Controls_InitCvars",
    "Controls_InitModel",
    "Controls_InitWeapons",
    "Controls_MenuEvent",
    "Controls_MenuInit",
    "Controls_MenuKey",
    "Controls_ResetDefaults_Action",
    "Controls_ResetDefaults_Draw",
    "Controls_SetConfig",
    "Controls_SetDefaults",
    "Controls_StatusBar",
    "Controls_Update",
    "Controls_UpdateModel",
    "UI_ControlsMenu",
]


def main():
    out = ROOT / "build/reference/ui_controls"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_controls2.c"
    source_text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        assert name in source_text, name

    include = out / "ui_controls_under_test.inc"
    include.write_text(
        extract(source, ["Controls_GetKeyAssignment"]),
        encoding="utf-8",
        newline="\n",
    )
    host = ROOT / "tests/reference/ui_controls_oracle.c"
    native = out / "oracle.exe"
    run(
        [
            "cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4090", "/wd4996",
            f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro",
        ],
        out,
        msvc_env("x64"),
        out / "build.log",
    )
    expected = run([native], out, log=out / "native.log")

    for mini_source, output in [
        ("tests/ui_controls_oracle.ml", "ui_controls_oracle.exe"),
        ("tests/ui_controls_contracts.ml", "ui_controls_contracts.exe"),
    ]:
        subprocess.run(
            [sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", output],
            cwd=ROOT,
            check=True,
        )
    actual = run(
        [ROOT / "build/ui_controls_oracle.exe"],
        ROOT / "build",
        log=out / "minilang.log",
    )
    assert expected == actual, (expected, actual)
    contracts = run(
        [ROOT / "build/ui_controls_contracts.exe"],
        ROOT / "build",
        log=out / "contracts.log",
    ).strip()
    assert contracts == "PASS: 43 native ui_controls contracts (22 symbols)", contracts

    files = [
        source,
        host,
        ROOT / "src/mq3/client/ui_controls.ml",
        ROOT / "tests/ui_controls_oracle.ml",
        ROOT / "tests/ui_controls_contracts.ml",
    ]
    result = {
        "passed": True,
        "differential_records": 6,
        "contracts": 43,
        "source_functions": 22,
        "functions": FUNCTIONS,
        "scope": (
            "Complete controls menu: 34 command bindings, two-key discovery and replacement, "
            "default/reset/save behavior, eight configurable cvars, section topology, player "
            "preview animations, weapon precache, navigation, drawing and typed host actions."
        ),
        "sources": {
            str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files
        },
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    print("PASS: 6 unchanged C binding records + 43 contracts + 22 symbols")


if __name__ == "__main__":
    main()
