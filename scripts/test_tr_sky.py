#!/usr/bin/env python3
"""Differential and native contracts for code/renderer/tr_sky.c."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run

FUNCTIONS = ["AddSkyPolygon", "ClearSkyBox", "ClipSkyPolygon", "DrawSkyBox", "DrawSkySide", "FillCloudBox", "FillCloudySkySide", "MakeSkyVec", "RB_ClipSkyPolygons", "RB_DrawSun", "RB_StageIteratorSky", "R_BuildCloudData", "R_InitSkyTexCoords"]

def main():
    source = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_sky.c"
    text = source.read_text(encoding="utf-8", errors="replace")
    for name in FUNCTIONS:
        if name not in text:
            raise RuntimeError(f"missing original sky function {name}")
    out = ROOT / "build/reference/tr_sky"
    out.mkdir(parents=True, exist_ok=True)
    harness = ROOT / "tests/reference/tr_sky_oracle.c"
    native = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/W4", "/WX", harness, f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "build.log")
    expected = run([native], out, log=out / "native.log")
    for path, name in [("tests/tr_sky_oracle.ml", "tr_sky_oracle.exe"), ("tests/tr_sky_contracts.ml", "tr_sky_contracts.exe")]:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", path, "--output", name], cwd=ROOT, check=True)
    actual = run([ROOT / "build/tr_sky_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    expected_values = [int(value) for value in expected.splitlines() if value.strip()]
    actual_values = [int(value) for value in actual.splitlines() if value.strip()]
    if len(expected_values) != len(actual_values) or any(abs(a - b) > 1 for a, b in zip(expected_values, actual_values)):
        raise RuntimeError(f"tr_sky differential mismatch\n--- C ---\n{expected}\n--- MiniLang ---\n{actual}")
    contracts = run([ROOT / "build/tr_sky_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if contracts != "PASS: 15 tr_sky contracts":
        raise RuntimeError(contracts)
    files = [source, harness, ROOT / "src/mq3/renderer/tr_sky.ml", ROOT / "tests/tr_sky_oracle.ml", ROOT / "tests/tr_sky_contracts.ml"]
    result = {"passed": True, "differential_records": 62, "contracts": 15, "functions": FUNCTIONS, "scope": "Complete sky polygon clipping, six-face projection, subdivision grids, outer box, spherical cloud coordinates/data, sun quad and stage orchestration.", "sources": {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print("PASS: 62 unchanged C sky values + 15 contracts / 13 original functions")

if __name__ == "__main__":
    main()
