#!/usr/bin/env python3
"""Build and execute the bounded playable-material resolver contracts."""
from __future__ import annotations

import subprocess
import sys

from toolchain import ROOT, run


def main() -> int:
    shade = (ROOT / "Quake-III-Arena-original-source/code/renderer/tr_shade.c").read_text(
        encoding="utf-8", errors="replace"
    )
    calc = (ROOT / "Quake-III-Arena-original-source/code/renderer/tr_shade_calc.c").read_text(
        encoding="utf-8", errors="replace"
    )
    backend = (ROOT / "Quake-III-Arena-original-source/code/renderer/tr_backend.c").read_text(
        encoding="utf-8", errors="replace"
    )
    for token in ("R_BindAnimatedImage", "imageAnimationSpeed", "numImageAnimations"):
        if token not in shade:
            raise RuntimeError(f"missing original animation anchor {token}")
    for token in ("RB_CalcScrollTexCoords", "RB_CalcScaleTexCoords", "RB_CalcRotateTexCoords", "RB_CalcTurbulentTexCoords", "RB_CalcEnvironmentTexCoords", "tess.shaderTime"):
        if token not in calc:
            raise RuntimeError(f"missing original tcMod anchor {token}")
    for token in ("WAVEVALUE", "RB_CalcWaveColor", "FUNCTABLE_SIZE"):
        if token not in calc:
            raise RuntimeError(f"missing original rgbGen wave anchor {token}")
    for token in ("GLS_ATEST_GT_0", "GLS_ATEST_LT_80", "GLS_ATEST_GE_80", "qglAlphaFunc"):
        if token not in backend:
            raise RuntimeError(f"missing original alpha-test anchor {token}")
    subprocess.run([
        sys.executable, ROOT / "scripts/build.py", "--source",
        "tests/playable_materials_contracts.ml", "--output",
        "playable_materials_contracts.exe",
    ], cwd=ROOT, check=True)
    output = run([ROOT / "build/playable_materials_contracts.exe"], ROOT / "build").strip()
    expected = "PASS: 43 playable material contracts"
    if output != expected:
        raise RuntimeError(output)
    print(expected)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
