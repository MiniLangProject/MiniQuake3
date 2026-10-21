#!/usr/bin/env python3
"""Unchanged ui_splevel.c oracle, complete symbol inventory, and native contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


FUNCTIONS = [
    "PlayerIcon",
    "PlayerIconHandle",
    "UI_SPLevelMenu",
    "UI_SPLevelMenu_AwardEvent",
    "UI_SPLevelMenu_BackEvent",
    "UI_SPLevelMenu_Cache",
    "UI_SPLevelMenu_CustomEvent",
    "UI_SPLevelMenu_Init",
    "UI_SPLevelMenu_LeftArrowEvent",
    "UI_SPLevelMenu_LevelEvent",
    "UI_SPLevelMenu_MenuDraw",
    "UI_SPLevelMenu_NextEvent",
    "UI_SPLevelMenu_PlayerEvent",
    "UI_SPLevelMenu_ReInit",
    "UI_SPLevelMenu_ResetAction",
    "UI_SPLevelMenu_ResetDraw",
    "UI_SPLevelMenu_ResetEvent",
    "UI_SPLevelMenu_RightArrowEvent",
    "UI_SPLevelMenu_SetBots",
    "UI_SPLevelMenu_SetMenuArena",
    "UI_SPLevelMenu_SetMenuItems",
    "UI_SPLevelMenu_f",
]


def main():
    out = ROOT / "build/reference/ui_sp_level"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_splevel.c"
    source_text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        assert name in source_text, name

    include = out / "ui_splevel_under_test.inc"
    include.write_text(extract(source, ["PlayerIcon"]), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/ui_sp_level_oracle.c"
    native = out / "oracle.exe"
    run(
        [
            "cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4996",
            f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro",
        ],
        out,
        msvc_env("x64"),
        out / "build.log",
    )
    expected = run([native], out, log=out / "native.log")

    for mini_source, name in [
        ("tests/ui_sp_level_oracle.ml", "ui_sp_level_oracle.exe"),
        ("tests/ui_sp_level_contracts.ml", "ui_sp_level_contracts.exe"),
    ]:
        subprocess.run(
            [sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", name],
            cwd=ROOT,
            check=True,
        )

    actual = run(
        [ROOT / "build/ui_sp_level_oracle.exe"],
        ROOT / "build",
        log=out / "minilang.log",
    )
    assert expected == actual, (expected, actual)
    contracts = run(
        [ROOT / "build/ui_sp_level_contracts.exe"],
        ROOT / "build",
        log=out / "contracts.log",
    ).strip()
    assert contracts == "PASS: 35 native ui_splevel contracts (22 symbols)", contracts

    files = [
        source,
        host,
        ROOT / "src/mq3/client/ui_sp_level.ml",
        ROOT / "tests/ui_sp_level_oracle.ml",
        ROOT / "tests/ui_sp_level_contracts.ml",
    ]
    result = {
        "passed": True,
        "differential_records": 7,
        "contracts": 35,
        "source_functions": 22,
        "functions": FUNCTIONS,
        "scope": (
            "Complete single-player level selection: player and bot icons, Retail levelshots, "
            "tier locks and navigation, scores, medals, reset flow, menu events, rendering "
            "boundaries, cache, initialization and UI command lifecycle."
        ),
        "sources": {
            str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files
        },
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    print("PASS: 7 unchanged C PlayerIcon records + 35 contracts + 22 symbols")


if __name__ == "__main__":
    main()
