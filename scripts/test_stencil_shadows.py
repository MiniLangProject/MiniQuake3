#!/usr/bin/env python3
"""Differential test for unchanged Baseq3 stencil shadow volumes."""
import json
import argparse
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pak")
    args = parser.parse_args()
    out = ROOT / "build/reference/stencil_shadows"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_shadows.c"
    (out / "stencil_shadow_under_test.inc").write_text(
        extract(original, ["R_AddEdgeDef", "R_RenderShadowEdges", "RB_ShadowTessEnd", "RB_ShadowFinish"]),
        encoding="utf-8", newline="\n",
    )
    harness = ROOT / "tests/reference/stencil_shadow_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/fp:strict", "/arch:SSE2", "/MT", "/W4", "/WX", "/wd4244", "/wd4459", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/stencil_shadow_oracle.ml", "--output", "stencil_shadow_oracle.exe"], cwd=ROOT, check=True)
    mini = run([ROOT / "build/stencil_shadow_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("stencil-shadow mismatch\nC:\n" + native + "MiniLang:\n" + mini)
    files = [original, harness, ROOT / "src/mq3/renderer/qvm_scene_geometry.ml", ROOT / "tests/stencil_shadow_oracle.ml"]
    result = {"passed": True, "records": len(native.splitlines()), "functions": ["R_AddEdgeDef", "R_RenderShadowEdges", "RB_ShadowTessEnd", "RB_ShadowFinish"], "scope": "Unchanged Baseq3 facing, silhouette rejection, edge order, 512-unit extrusion and single 0.6 finish multiply.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {result['records']} exact Baseq3 stencil-shadow records")
    if args.pak:
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/stencil_shadow_retail_probe.ml", "--output", "stencil_shadow_retail_probe.exe"], cwd=ROOT, check=True)
        print(run([ROOT / "build/stencil_shadow_retail_probe.exe", args.pak], ROOT / "build", log=out / "retail.log"), end="")


if __name__ == "__main__":
    main()
