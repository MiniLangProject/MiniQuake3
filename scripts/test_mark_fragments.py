#!/usr/bin/env python3
"""Differential and Retail tests for Baseq3 BSP mark fragments."""
import json
import subprocess
import sys
import argparse
from pathlib import Path

from inventory import sha
from toolchain import ROOT, run, msvc_env
from transition_oracle import extract


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak", type=Path)
    args = parser.parse_args()
    out = ROOT / "build/reference/mark_fragments"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_marks.c"
    (out / "mark_fragments_under_test.inc").write_text(
        extract(original, ["R_ChopPolyBehindPlane", "R_AddMarkFragments"]),
        encoding="utf-8", newline="\n")
    harness = ROOT / "tests/reference/mark_fragments_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/fp:strict", "/arch:SSE2", "/MT", "/W4", "/WX", "/wd4100",
         f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/mark_fragments_oracle.ml",
         "--output", "mark_fragments_oracle.exe"], cwd=ROOT, check=True)
    mini = run([ROOT / "build/mark_fragments_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("mark-fragment mismatch\nC:\n" + native + "MiniLang:\n" + mini)
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/mark_fragments_contracts.ml",
         "--output", "mark_fragments_contracts.exe"], cwd=ROOT, check=True)
    value = run([ROOT / "build/mark_fragments_contracts.exe"], ROOT / "build").strip()
    expected = "PASS: 17 mark-fragment contracts"
    if value != expected:
        raise RuntimeError(value)
    print(f"PASS: {len(native.splitlines())} exact Baseq3 mark-fragment records + 17 contracts")
    if args.pak:
        subprocess.run(
            [sys.executable, ROOT / "scripts/build.py", "--source", "tests/mark_fragments_retail_probe.ml",
             "--output", "mark_fragments_retail_probe.exe"], cwd=ROOT, check=True)
        value = run([ROOT / "build/mark_fragments_retail_probe.exe", args.pak.resolve()], ROOT / "build").strip()
        if not value.startswith("PASS: retail q3dm1 mark fragments="):
            raise RuntimeError(value)
        print(value)
    files = [original, harness, ROOT / "src/mq3/renderer/mark_fragments.ml",
             ROOT / "tests/mark_fragments_oracle.ml", ROOT / "tests/mark_fragments_contracts.ml"]
    result = {"passed": True, "records": len(native.splitlines()), "contracts": 17,
              "functions": ["R_ChopPolyBehindPlane", "R_AddMarkFragments", "R_BoxSurfaces_r", "R_MarkFragments"],
              "scope": "Exact clipping/fragment packing plus productive BSP surface discovery, face/grid filtering, QVM ABI and retail q3dm1 projection.",
              "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")


if __name__ == "__main__":
    main()
