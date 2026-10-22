#!/usr/bin/env python3
"""Unchanged ui_connect.c oracle, native contracts, and optional Retail screen probe."""
import argparse
import json
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


FUNCTIONS = ["UI_DisplayDownloadInfo", "UI_DrawConnectScreen", "UI_KeyConnect", "UI_PrintTime", "UI_ReadableSize"]


def retail_probe(data_root):
    if not data_root:
        return None
    pak = data_root / "baseq3/pak0.pk3"
    assert pak.is_file(), pak
    with zipfile.ZipFile(pak) as archive:
        names = {name.lower() for name in archive.namelist()}
        gfx_shader = archive.read("scripts/gfx.shader").decode("latin1").lower()
    assert "menuback" in gfx_shader
    background_texture = next((name for name in ("textures/sfx/logo512.tga", "textures/sfx/logo512.jpg") if name in names), None)
    assert background_texture
    return {"pak": str(pak), "background_shader": "menuback", "background_texture": background_texture}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/ui_connect"
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / "Quake-III-Arena-original-source/code/q3_ui/ui_connect.c"
    source_text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        assert name in source_text, name
    include = out / "ui_connect_under_test.inc"
    include.write_text(extract(source, FUNCTIONS), encoding="utf-8", newline="\n")
    host = ROOT / "tests/reference/ui_connect_oracle.c"
    native = out / "oracle.exe"
    run(["cl", "/nologo", "/O2", "/MT", "/W4", "/WX", "/wd4100", "/wd4244", "/wd4267", "/wd4996", f"/I{out}", host, f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")
    for mini_source, output in [("tests/ui_connect_oracle.ml", "ui_connect_oracle.exe"), ("tests/ui_connect_contracts.ml", "ui_connect_contracts.exe")]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", mini_source, "--output", output], cwd=ROOT, check=True)
    actual = run([ROOT / "build/ui_connect_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    assert expected == actual, (expected, actual)
    contracts = run([ROOT / "build/ui_connect_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    assert contracts == "PASS: 27 native ui_connect contracts (5 symbols)", contracts
    retail = retail_probe(args.data_root)
    files = [source, host, ROOT / "src/mq3/client/ui_connect.ml", ROOT / "tests/ui_connect_oracle.ml", ROOT / "tests/ui_connect_contracts.ml"]
    result = {"passed": True, "differential_records": 20, "contracts": 27, "source_functions": 5, "functions": FUNCTIONS, "retail": retail, "scope": "Complete connection screen: exact size/time formatting, progress/rate/ETA, overlay and background behavior, server/MOTD/error/status text, state regression and Escape disconnect lifecycle.", "integration": "sessionDrawConnectScreen(context, overlay) is a direct original_ui_session.Services.connectFn adapter for a shared context owning connectScreen State.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    suffix = " + Retail menuback probe" if retail else ""
    print("PASS: 20 unchanged C connect records + 27 contracts + 5 symbols" + suffix)


if __name__ == "__main__":
    main()
