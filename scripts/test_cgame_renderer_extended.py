#!/usr/bin/env python3
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
CG_PUBLIC = ROOT / "Quake-III-Arena-original-source/code/cgame/cg_public.h"
CL_CGAME = ROOT / "Quake-III-Arena-original-source/code/client/cl_cgame.c"
TR_WORLD = ROOT / "Quake-III-Arena-original-source/code/renderer/tr_world.c"
LOCAL_MATCH = ROOT / "src/mq3/engine/local_qvm_match.ml"

public = CG_PUBLIC.read_text(encoding="latin-1")
ordered = ["CG_R_REMAP_SHADER", "CG_S_ADDREALLOOPINGSOUND", "CG_S_STOPLOOPINGSOUND", "CG_CM_TEMPCAPSULEMODEL", "CG_CM_CAPSULETRACE", "CG_CM_TRANSFORMEDCAPSULETRACE", "CG_R_ADDADDITIVELIGHTTOSCENE", "CG_GET_ENTITY_TOKEN", "CG_R_ADDPOLYSTOSCENE", "CG_R_INPVS", "CG_FS_SEEK"]
positions = [public.index(name) for name in ordered]
if positions != sorted(positions):
    raise SystemExit("FAIL: cgame extended trap order diverges from cg_public.h")
client = CL_CGAME.read_text(encoding="latin-1")
for anchor in ("case CG_FS_SEEK:", "return FS_Seek( args[1], args[2], args[3] );", "case CG_R_REMAP_SHADER:", "re.RemapShader( VMA(1), VMA(2), VMA(3) );", "case CG_R_INPVS:", "return re.inPVS( VMA(1), VMA(2) );"):
    if anchor not in client:
        raise SystemExit("FAIL: missing cl_cgame.c ABI anchor: " + anchor)
renderer = TR_WORLD.read_text(encoding="latin-1")
for anchor in ("qboolean R_inPVS", "vis = CM_ClusterPVS( leaf->cluster )", "vis[leaf->cluster>>3]"):
    if anchor not in renderer:
        raise SystemExit("FAIL: missing tr_world.c renderer-PVS anchor: " + anchor)
local = LOCAL_MATCH.read_text(encoding="utf-8")
for anchor in ("if op==79 then", "return remapRendererShader(context,oldName,newName,timeOffset)", "if op==88 then if rendererPvs.inPVS", "if op==89 then return memoryFileSeek.seek"):
    if anchor not in local:
        raise SystemExit("FAIL: missing local cgame ABI dispatch: " + anchor)

subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/cgame_renderer_extended_contracts.ml", "--output", "cgame_renderer_extended_contracts.exe"], cwd=ROOT, check=True)
result = subprocess.run([ROOT / "build/cgame_renderer_extended_contracts.exe"], cwd=ROOT / "build", text=True, capture_output=True, check=True).stdout.strip()
if result != "PASS: 23 cgame extended-renderer contracts":
    raise SystemExit(result)
print(result + " + original ABI anchors")
