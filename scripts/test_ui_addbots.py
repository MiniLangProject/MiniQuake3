#!/usr/bin/env python3
"""Unchanged add-bots oracle, complete contracts, and optional Retail probe."""
import argparse
import json
import re
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


FUNCTIONS = [
    "UI_AddBotsMenu",
    "UI_AddBotsMenu_BackEvent",
    "UI_AddBotsMenu_BotEvent",
    "UI_AddBotsMenu_DownEvent",
    "UI_AddBotsMenu_Draw",
    "UI_AddBotsMenu_FightEvent",
    "UI_AddBotsMenu_GetSortedBotNums",
    "UI_AddBotsMenu_Init",
    "UI_AddBotsMenu_SetBotNames",
    "UI_AddBotsMenu_SortCompare",
    "UI_AddBotsMenu_UpEvent",
    "UI_AddBots_Cache",
]
ASSETS = [
    "menu/art/back_0", "menu/art/back_1", "menu/art/accept_0", "menu/art/accept_1",
    "menu/art/addbotframe", "menu/art/arrows_vert_0", "menu/art/arrows_vert_top",
    "menu/art/arrows_vert_bot",
]


def retail_probe(data_root):
    if not data_root:
        return None
    pak = data_root / "baseq3/pak0.pk3"
    assert pak.is_file(), pak
    with zipfile.ZipFile(pak) as archive:
        names = {name.lower() for name in archive.namelist()}
        bots_text = archive.read("scripts/bots.txt").decode("latin1")
    bots = [
        value.strip().strip('"')
        for value in re.findall(r"(?im)^\s*name\s+([^\r\n]+)", bots_text)
    ]
    assert len(bots) == 32 and {"Xaero", "Sarge", "Crash"}.issubset(bots), bots
    missing = []
    for asset in ASSETS:
        if not any(asset + ext in names for ext in ("", ".tga", ".jpg", ".jpeg")):
            missing.append(asset)
    assert not missing, missing
    return {"pak": str(pak), "bot_count": len(bots), "first_sorted": sorted(bots, key=str.casefold)[0]}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/ui_addbots"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_addbots.c"
    source_text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        assert name in source_text, name
    include = out / "ui_addbots_under_test.inc"
    include.write_text(extract(source, ["UI_AddBotsMenu_FightEvent"]), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/ui_addbots_oracle.c"
    native = out / "oracle.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4100", "/wd4996", f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")
    for mini_source, output in [("tests/ui_addbots_oracle.ml", "ui_addbots_oracle.exe"), ("tests/ui_addbots_contracts.ml", "ui_addbots_contracts.exe")]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", output], cwd=ROOT, check=True)
    actual = run([ROOT / "build/ui_addbots_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    assert expected == actual, (expected, actual)
    contracts = run([ROOT / "build/ui_addbots_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    assert contracts == "PASS: 19 native ui_addbots contracts (12 symbols)", contracts
    retail = retail_probe(args.data_root)
    files = [source, host, ROOT / "src/mq3/client/ui_add_bots.ml", ROOT / "tests/ui_addbots_oracle.ml", ROOT / "tests/ui_addbots_contracts.ml"]
    result = {"passed": True, "differential_records": 4, "contracts": 19, "source_functions": 12, "functions": FUNCTIONS, "retail": retail, "scope": "Complete add-bots menu: Retail bot inventory, case-insensitive sort, seven-row paging, selection, skill/team controls, staggered addbot commands, drawing, cache and lifecycle.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    suffix = " + Retail 32-bot probe" if retail else ""
    print("PASS: 4 unchanged C addbot records + 19 contracts + 12 symbols" + suffix)


if __name__ == "__main__":
    main()
