#!/usr/bin/env python3
"""Differential test for the unchanged Baseq3 4D renderer noise."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def main():
    out = ROOT / "build/reference/renderer_noise"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_noise.c"
    (out / "renderer_noise_under_test.inc").write_text(
        extract(original, ["GetNoiseValue", "R_NoiseInit", "R_NoiseGet4f"]),
        encoding="utf-8",
        newline="\n",
    )
    harness = ROOT / "tests/reference/renderer_noise_oracle.c"
    oracle = out / "oracle.exe"
    run(
        ["cl", "/nologo", "/Od", "/fp:strict", "/arch:SSE2", "/MT", "/W4", "/WX", harness, f"/I{out}", f"/Fe:{oracle}", "/link", "/Brepro"],
        out,
        msvc_env("x86"),
        out / "oracle-build.log",
    )
    native = run([oracle], out, log=out / "oracle.log")
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/renderer_noise_oracle.ml", "--output", "renderer_noise_oracle.exe"],
        cwd=ROOT,
        check=True,
    )
    mini = run([ROOT / "build/renderer_noise_oracle.exe"], ROOT / "build", log=out / "minilang.log")
    if native != mini:
        raise RuntimeError("renderer-noise mismatch\nC:\n" + native + "MiniLang:\n" + mini)
    files = [original, harness, ROOT / "src/mq3/renderer/noise.ml", ROOT / "tests/renderer_noise_oracle.ml"]
    result = {
        "passed": True,
        "records": len(native.splitlines()),
        "functions": ["GetNoiseValue", "R_NoiseInit", "R_NoiseGet4f"],
        "scope": "MSVC rand sequence, permutation masking, negative coordinates and four-dimensional interpolation.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {result['records']} exact Baseq3 renderer-noise records")


if __name__ == "__main__":
    main()
