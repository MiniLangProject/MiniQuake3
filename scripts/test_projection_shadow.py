#!/usr/bin/env python3
"""Differential test for unchanged Baseq3 projected-shadow deformation."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def main():
    out = ROOT / "build/reference/projection_shadow"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_shadows.c"
    (out / "projection_shadow_under_test.inc").write_text(
        extract(original, ["RB_ProjectionShadowDeform"]), encoding="utf-8", newline="\n"
    )
    harness = ROOT / "tests/reference/projection_shadow_oracle.c"
    oracle = out / "oracle.exe"
    run(["cl", "/nologo", "/Od", "/fp:strict", "/arch:SSE2", "/MT", "/W4", "/WX", "/wd4244", f"/I{out}", harness, f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x86"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/projection_shadow_oracle.ml", "--output", "projection_shadow_oracle.exe"], cwd=ROOT, check=True)
    mini = run([ROOT / "build/projection_shadow_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("projection-shadow mismatch\nC:\n" + native + "MiniLang:\n" + mini)
    files = [original, harness, ROOT / "src/mq3/renderer/qvm_scene_geometry.ml", ROOT / "tests/projection_shadow_oracle.ml"]
    result = {
        "passed": True,
        "records": len(native.splitlines()),
        "function": "RB_ProjectionShadowDeform",
        "scope": "Unchanged Baseq3 entity-local projection, shallow-light clamp, rotated axes and non-normalized entity axes; compared after the renderer's world transform.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {result['records']} exact Baseq3 projection-shadow records")


if __name__ == "__main__":
    main()
