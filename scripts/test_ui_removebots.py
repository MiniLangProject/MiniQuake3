#!/usr/bin/env python3
"""Unchanged remove-bots oracle, complete contracts, and optional Retail asset probe."""
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
    "UI_RemoveBotsMenu",
    "UI_RemoveBotsMenu_BackEvent",
    "UI_RemoveBotsMenu_BotEvent",
    "UI_RemoveBotsMenu_DeleteEvent",
    "UI_RemoveBotsMenu_DownEvent",
    "UI_RemoveBotsMenu_GetBots",
    "UI_RemoveBotsMenu_Init",
    "UI_RemoveBotsMenu_SetBotNames",
    "UI_RemoveBotsMenu_UpEvent",
    "UI_RemoveBots_Cache",
]
ASSETS = [
    "menu/art/addbotframe", "menu/art/back_0", "menu/art/back_1", "menu/art/delete_0",
    "menu/art/delete_1", "menu/art/arrows_vert_0", "menu/art/arrows_vert_top",
    "menu/art/arrows_vert_bot",
]


def retail_probe(data_root):
    if not data_root:
        return None
    pak = data_root / "baseq3/pak0.pk3"
    assert pak.is_file(), pak
    with zipfile.ZipFile(pak) as archive:
        names = {name.lower() for name in archive.namelist()}
    missing = [asset for asset in ASSETS if not any(asset + ext in names for ext in ("", ".tga", ".jpg", ".jpeg"))]
    assert not missing, missing
    return {"pak": str(pak), "assets": len(ASSETS)}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/ui_removebots"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_removebots.c"
    source_text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        assert name in source_text, name
    include = out / "ui_removebots_under_test.inc"
    include.write_text(extract(source, ["UI_RemoveBotsMenu_DeleteEvent"]), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/ui_removebots_oracle.c"
    native = out / "oracle.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4100", "/wd4996", f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")
    for mini_source, output in [("tests/ui_removebots_oracle.ml", "ui_removebots_oracle.exe"), ("tests/ui_removebots_contracts.ml", "ui_removebots_contracts.exe")]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", output], cwd=ROOT, check=True)
    actual = run([ROOT / "build/ui_removebots_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    assert expected == actual, (expected, actual)
    contracts = run([ROOT / "build/ui_removebots_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    assert contracts == "PASS: 15 native ui_removebots contracts (10 symbols)", contracts
    retail = retail_probe(args.data_root)
    files = [source, host, ROOT / "src/mq3/client/ui_remove_bots.ml", ROOT / "tests/ui_removebots_oracle.ml", ROOT / "tests/ui_removebots_contracts.ml"]
    result = {"passed": True, "differential_records": 4, "contracts": 15, "source_functions": 10, "functions": FUNCTIONS, "retail": retail, "scope": "Complete remove-bots menu: server client scan by skill marker, clean names, seven-row paging and selection, exact clientkick command, cache and menu lifecycle.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    suffix = " + Retail 8-asset probe" if retail else ""
    print("PASS: 4 unchanged C clientkick records + 15 contracts + 10 symbols" + suffix)


if __name__ == "__main__":
    main()
