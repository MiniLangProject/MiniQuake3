#!/usr/bin/env python3
"""Complete source-surface, native differential and Retail gate for tr_shade_calc.c."""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, run

SOURCE = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_shade_calc.c"
PORT = ROOT / "src/mq3/renderer/tr_shade_calc_runtime.ml"
EXPECTED = [
    "Autosprite2Deform", "AutospriteDeform", "DeformText", "EvalWaveForm",
    "EvalWaveFormClamped", "GlobalVectorToLocal", "RB_CalcAlphaFromEntity",
    "RB_CalcAlphaFromOneMinusEntity", "RB_CalcBulgeVertexes",
    "RB_CalcColorFromEntity", "RB_CalcColorFromOneMinusEntity",
    "RB_CalcDeformNormals", "RB_CalcDeformVertexes", "RB_CalcDiffuseColor",
    "RB_CalcEnvironmentTexCoords", "RB_CalcFogTexCoords",
    "RB_CalcModulateAlphasByFog", "RB_CalcModulateColorsByFog",
    "RB_CalcModulateRGBAsByFog", "RB_CalcMoveVertexes",
    "RB_CalcRotateTexCoords", "RB_CalcScaleTexCoords", "RB_CalcScrollTexCoords",
    "RB_CalcSpecularAlpha", "RB_CalcStretchTexCoords",
    "RB_CalcTransformTexCoords", "RB_CalcTurbulentTexCoords",
    "RB_CalcWaveAlpha", "RB_CalcWaveColor", "RB_DeformTessGeometry",
    "TableForFunc", "myftol",
]


def functions(text: str) -> set[str]:
    return set(re.findall(r"\b(?:function|void|float|long)\s+\**\s*([A-Za-z_]\w*)\s*\(", text))


def invoke(script: str, *args: object) -> None:
    subprocess.run([sys.executable, ROOT / "scripts" / script, *map(str, args)], cwd=ROOT, check=True)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", default="D:/Quake3")
    parser.add_argument("--full-regression", action="store_true")
    args = parser.parse_args()
    source_text = SOURCE.read_text(encoding="utf-8", errors="replace")
    port_text = PORT.read_text(encoding="utf-8")
    source_names, port_names = functions(source_text), functions(port_text)
    missing_source = sorted(set(EXPECTED) - source_names)
    missing_port = sorted(set(EXPECTED) - port_names)
    if missing_source or missing_port:
        raise RuntimeError(f"tr_shade_calc symbol mismatch: source={missing_source} port={missing_port}")
    subprocess.run([
        sys.executable, ROOT / "scripts/build.py", "--source",
        "tests/tr_shade_calc_complete_contracts.ml", "--output",
        "tr_shade_calc_complete_contracts.exe",
    ], cwd=ROOT, check=True)
    output = run([ROOT / "build/tr_shade_calc_complete_contracts.exe"], ROOT / "build").strip()
    if output != "PASS: 27 complete tr_shade_calc contracts":
        raise RuntimeError(output)
    # These gates compile unchanged functions extracted from id's C file and
    # compare their records byte-for-byte with MiniLang's productive kernels.
    for script in ("test_shader_entity_color.py", "test_shader_fog_color.py", "test_shader_compute_colors.py"):
        invoke(script)
    if args.full_regression:
        invoke("test_shader_entity_translate.py")
        invoke("test_renderer_noise.py")
        invoke("test_playable_world_batch.py")
        pak = Path(args.data_root) / "baseq3/pak0.pk3"
        if not pak.is_file():
            raise RuntimeError(f"Retail pak0.pk3 not found: {pak}")
        for map_name in ("maps/q3dm1.bsp", "maps/q3dm2.bsp", "maps/q3dm4.bsp", "maps/q3dm16.bsp", "maps/q3ctf1.bsp"):
            invoke("test_playable_world_materials.py", "--pak", pak, "--map", map_name)
    print(f"PASS: {len(EXPECTED)}/{len(EXPECTED)} tr_shade_calc symbols + 27 native contracts + unchanged-C differentials")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
