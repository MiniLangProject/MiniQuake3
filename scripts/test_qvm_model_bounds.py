#!/usr/bin/env python3
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "tests" / "qvm_model_bounds_contracts.ml"
OUT = ROOT / "build" / "qvm_model_bounds_contracts.exe"
ORIGINAL = ROOT / "Quake-III-Arena-original-source" / "code" / "renderer" / "tr_model.c"

text = ORIGINAL.read_text(encoding="latin-1")
for anchor in ("void R_ModelBounds", "frame = (md3Frame_t *)( (byte *)header + header->ofsFrames )", "VectorCopy( frame->bounds[0], mins )", "VectorCopy( frame->bounds[1], maxs )"):
    if anchor not in text:
        raise SystemExit("FAIL: missing original R_ModelBounds anchor: " + anchor)

OUT.parent.mkdir(parents=True, exist_ok=True)
subprocess.run([sys.executable, str(ROOT / "scripts" / "build.py"), "--source", str(SOURCE.relative_to(ROOT)), "--output", OUT.name], cwd=ROOT, check=True)
result = subprocess.run([str(OUT)], cwd=ROOT, text=True, capture_output=True)
print(result.stdout, end="")
if result.returncode != 0:
    print(result.stderr, end="")
    raise SystemExit(result.returncode)
