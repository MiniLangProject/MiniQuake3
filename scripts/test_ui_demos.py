#!/usr/bin/env python3
"""Unchanged ui_demo2.c oracle, native contracts, and optional Retail demo probe."""
import argparse
import json
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


FUNCTIONS = ["Demos_Cache", "Demos_MenuEvent", "Demos_MenuInit", "UI_DemosMenu", "UI_DemosMenu_Key"]
ASSETS = [
    "menu/art/back_0", "menu/art/back_1", "menu/art/play_0", "menu/art/play_1",
    "menu/art/frame2_l", "menu/art/frame1_r", "menu/art/arrows_horz_0",
    "menu/art/arrows_horz_left", "menu/art/arrows_horz_right",
]
DEMOS = ["demos/demo001.dm3", "demos/demo002.dm3"]


def retail_probe(data_root):
    if not data_root:
        return None
    pak = data_root / "baseq3/pak0.pk3"
    assert pak.is_file(), pak
    with zipfile.ZipFile(pak) as archive:
        names = {name.lower() for name in archive.namelist()}
    missing_assets = [asset for asset in ASSETS if not any(asset + ext in names for ext in ("", ".tga", ".jpg", ".jpeg"))]
    missing_demos = [demo for demo in DEMOS if demo not in names]
    assert not missing_assets, missing_assets
    assert not missing_demos, missing_demos
    return {"pak": str(pak), "menu_assets": len(ASSETS), "legacy_demos": len(DEMOS)}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/ui_demos"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_demo2.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        assert name in text, name
    include = out / "ui_demos_under_test.inc"
    include.write_text(extract(source, ["Demos_MenuEvent"]), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/ui_demos_oracle.c"
    native = out / "oracle.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4100", "/wd4996", f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")
    for mini_source, output in [("tests/ui_demos_oracle.ml", "ui_demos_oracle.exe"), ("tests/ui_demos_contracts.ml", "ui_demos_contracts.exe")]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", output], cwd=ROOT, check=True)
    actual = run([ROOT / "build/ui_demos_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    assert expected == actual, (expected, actual)
    contracts = run([ROOT / "build/ui_demos_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    assert contracts == "PASS: 20 native ui_demos contracts (5 symbols)", contracts
    retail = retail_probe(args.data_root)
    files = [source, host, ROOT / "src/mq3/client/ui_demos.ml", ROOT / "tests/ui_demos_oracle.ml", ROOT / "tests/ui_demos_contracts.ml"]
    result = {"passed": True, "differential_records": 6, "contracts": 20, "source_functions": 5, "functions": FUNCTIONS, "retail": retail, "scope": "Complete demos menu: protocol-specific listing, deterministic order, legacy display normalization, 128 cap, empty state, paging, exact launch command, key/cache/menu lifecycle.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    suffix = " + Retail demo/asset probe" if retail else ""
    print("PASS: 6 unchanged C demo records + 20 contracts + 5 symbols" + suffix)


if __name__ == "__main__":
    main()
