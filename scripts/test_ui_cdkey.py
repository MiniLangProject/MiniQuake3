#!/usr/bin/env python3
"""Unchanged ui_cdkey.c oracle, native contracts, and optional Retail asset probe."""
import argparse
import json
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


FUNCTIONS = [
    "UI_CDKeyMenu", "UI_CDKeyMenu_Cache", "UI_CDKeyMenu_DrawKey",
    "UI_CDKeyMenu_Event", "UI_CDKeyMenu_Init", "UI_CDKeyMenu_PreValidateKey",
    "UI_CDKeyMenu_f",
]
ASSETS = [
    "menu/art/cut_frame", "menu/art/accept_0", "menu/art/accept_1",
    "menu/art/back_0", "menu/art/back_1",
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
    return {"pak": str(pak), "menu_assets": len(ASSETS)}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/ui_cdkey"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_cdkey.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        assert name in text, name
    include = out / "ui_cdkey_under_test.inc"
    include.write_text(extract(source, ["UI_CDKeyMenu_PreValidateKey"]), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/ui_cdkey_oracle.c"
    native = out / "oracle.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4996", f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")
    for mini_source, output in [("tests/ui_cdkey_oracle.ml", "ui_cdkey_oracle.exe"), ("tests/ui_cdkey_contracts.ml", "ui_cdkey_contracts.exe")]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", output], cwd=ROOT, check=True)
    actual = run([ROOT / "build/ui_cdkey_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    assert expected == actual, (expected, actual)
    contracts = run([ROOT / "build/ui_cdkey_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    assert contracts == "PASS: 18 native ui_cdkey contracts (7 symbols)", contracts
    retail = retail_probe(args.data_root)
    files = [source, host, ROOT / "src/mq3/client/ui_cdkey.ml", ROOT / "tests/ui_cdkey_oracle.ml", ROOT / "tests/ui_cdkey_contracts.ml"]
    result = {"passed": True, "differential_records": 5, "contracts": 18, "source_functions": 7, "functions": FUNCTIONS, "retail": retail, "scope": "Complete CD-key menu: exact alphabet prevalidation, field rendering state, engine verification, conditional back item, key write, cache and lifecycle.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    suffix = " + Retail menu-asset probe" if retail else ""
    print("PASS: 5 unchanged C CD-key records + 18 contracts + 7 symbols" + suffix)


if __name__ == "__main__":
    main()
