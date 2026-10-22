#!/usr/bin/env python3
"""Unchanged ui_cinematics.c oracle, native contracts, and optional Retail RoQ probe."""
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
    "UI_CinematicsMenu", "UI_CinematicsMenu_BackEvent", "UI_CinematicsMenu_Cache",
    "UI_CinematicsMenu_Event", "UI_CinematicsMenu_Init", "UI_CinematicsMenu_f",
]
ASSETS = ["menu/art/back_0", "menu/art/back_1", "menu/art/frame2_l", "menu/art/frame1_r"]
VIDEOS = ["video/idlogo.roq", "video/intro.roq"] + [f"video/tier{i}.roq" for i in range(1, 8)] + ["video/end.roq", "video/demoend.roq"]


def retail_probe(data_root):
    if not data_root:
        return None
    pak = data_root / "baseq3/pak0.pk3"
    assert pak.is_file(), pak
    with zipfile.ZipFile(pak) as archive:
        names = {name.lower() for name in archive.namelist()}
    missing_assets = [asset for asset in ASSETS if not any(asset + ext in names for ext in ("", ".tga", ".jpg", ".jpeg"))]
    missing_videos = [video for video in VIDEOS if video not in names]
    assert not missing_assets, missing_assets
    assert not missing_videos, missing_videos
    return {"pak": str(pak), "menu_assets": len(ASSETS), "roq_videos": len(VIDEOS)}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/ui_cinematics"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_cinematics.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        assert name in text, name
    include = out / "ui_cinematics_under_test.inc"
    include.write_text(extract(source, ["UI_CinematicsMenu_Event"]), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/ui_cinematics_oracle.c"
    native = out / "oracle.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4100", "/wd4996", f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")
    for mini_source, output in [("tests/ui_cinematics_oracle.ml", "ui_cinematics_oracle.exe"), ("tests/ui_cinematics_contracts.ml", "ui_cinematics_contracts.exe")]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", output], cwd=ROOT, check=True)
    actual = run([ROOT / "build/ui_cinematics_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    assert expected == actual, (expected, actual)
    contracts = run([ROOT / "build/ui_cinematics_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    assert contracts == "PASS: 18 native ui_cinematics contracts (6 symbols)", contracts
    retail = retail_probe(args.data_root)
    files = [source, host, ROOT / "src/mq3/client/ui_cinematics.ml", ROOT / "tests/ui_cinematics_oracle.ml", ROOT / "tests/ui_cinematics_contracts.ml"]
    result = {"passed": True, "differential_records": 5, "contracts": 18, "source_functions": 6, "functions": FUNCTIONS, "retail": retail, "scope": "Complete cinematics menu: campaign unlock flags, demo restrictions, exact nextmap and RoQ commands, back/cache/menu lifecycle and console selection.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    suffix = " + Retail 11-RoQ probe" if retail else ""
    print("PASS: 5 unchanged C cinematic records + 18 contracts + 6 symbols" + suffix)


if __name__ == "__main__":
    main()
