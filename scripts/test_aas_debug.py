#!/usr/bin/env python3
"""Unchanged geometry oracle, native contracts, and Retail AAS evidence for be_aas_debug.c."""
from __future__ import annotations
import argparse
import json
import struct
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = ["AAS_DrawCross", "AAS_DrawArrow", "AAS_DrawPlaneCross", "AAS_DrawPermanentCross", "AAS_PermanentLine"]
STRIDES = (32, 12, 20, 8, 4, 24, 4, 48, 28, 44, 12, 20, 4, 16)

def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output

def retail_probe(data_root: Path) -> dict[str, int]:
    baseq3 = data_root / "baseq3" if (data_root / "baseq3").is_dir() else data_root
    maps = faces = areas = reaches = ground = ladders = viewportals = 0
    for archive in sorted(baseq3.glob("*.pk3")):
        with zipfile.ZipFile(archive) as pak:
            for name in pak.namelist():
                if not name.lower().endswith(".aas"):
                    continue
                data = pak.read(name)
                if len(data) < 124:
                    raise RuntimeError(f"truncated AAS {name}")
                ident, version = struct.unpack_from("<II", data)
                if ident != 0x53414145 or version not in (4, 5):
                    raise RuntimeError(f"unsupported AAS {name}")
                header = bytearray(data[:124])
                if version == 5:
                    for index in range(116): header[8 + index] ^= (index * 119) & 255
                lumps=[]
                for lump,stride in enumerate(STRIDES):
                    offset,length=struct.unpack_from("<II",header,12+lump*8)
                    if offset+length>len(data) or length%stride: raise RuntimeError(f"invalid AAS lump {name}:{lump}")
                    lumps.append((offset,length))
                face_offset,face_length=lumps[5];faces += face_length//24
                for at in range(face_offset,face_offset+face_length,24):
                    flags=struct.unpack_from("<i",data,at+4)[0];ground += bool(flags&4);ladders += bool(flags&2)
                settings_offset,settings_length=lumps[8];areas += settings_length//28
                for at in range(settings_offset,settings_offset+settings_length,28): viewportals += bool(struct.unpack_from("<i",data,at)[0]&512)
                reaches += lumps[9][1]//44;maps += 1
    if maps < 1 or faces < 1 or areas < 1 or reaches < 1 or ground < 1:
        raise RuntimeError("Retail AAS corpus lacks debug-visualization topology")
    return {"maps":maps,"faces":faces,"areas":areas,"reachabilities":reaches,"ground_faces":ground,"ladder_faces":ladders,"view_portals":viewportals}

def main() -> int:
    parser=argparse.ArgumentParser();parser.add_argument("--data-root",type=Path);args=parser.parse_args()
    out=ROOT/"build/reference/aas_debug";out.mkdir(parents=True,exist_ok=True)
    source=ROOT/"Quake-III-Arena-original-source/code/botlib/be_aas_debug.c"
    text=source.read_text(encoding="utf-8",errors="replace")
    symbols=["AAS_ClearShownDebugLines","AAS_ClearShownPolygons","AAS_DebugLine","AAS_DrawArrow","AAS_DrawCross","AAS_DrawPermanentCross","AAS_DrawPlaneCross","AAS_FloodAreas","AAS_FloodAreas_r","AAS_PermanentLine","AAS_PrintTravelType","AAS_ShowArea","AAS_ShowAreaPolygons","AAS_ShowBoundingBox","AAS_ShowFace","AAS_ShowFacePolygon","AAS_ShowPolygon","AAS_ShowReachability","AAS_ShowReachableAreas"]
    for symbol in symbols:
        if symbol not in text: raise RuntimeError(f"missing original symbol {symbol}")
    (out/"aas_debug_under_test.inc").write_text(extract(source,FUNCTIONS),encoding="utf-8",newline="\n")
    native=out/"aas_debug_oracle.exe"
    run(["cl","/nologo","/Od","/fp:strict","/MT","/W4","/WX",f"/I{out}",ROOT/"tests/reference/aas_debug_oracle.c",f"/Fe:{native}","/link","/Brepro"],out,msvc_env("x64"),out/"oracle-build.log")
    expected=run([native],out,log=out/"oracle.log")
    actual=run([build("tests/aas_debug_oracle.ml","aas_debug_oracle.exe")],ROOT/"build",log=out/"minilang.log")
    if expected!=actual: raise RuntimeError(f"AAS debug geometry mismatch\nC:\n{expected}\nMiniLang:\n{actual}")
    contracts=run([build("tests/aas_debug_contracts.ml","aas_debug_contracts.exe")],ROOT/"build",log=out/"contracts.log").strip()
    if contracts!="PASS: 21 AAS debug contracts / 19 symbols": raise RuntimeError(contracts)
    retail=retail_probe(args.data_root) if args.data_root else None
    result={"passed":True,"differential_records":15,"contracts":21,"source_symbols":19,"retail":retail,"scope":"Complete debug line/polygon pools, geometry, AAS face/area/reachability visualization and cluster flood.","original_sha256":sha(source)}
    (out/"result.json").write_text(json.dumps(result,indent=2)+"\n",encoding="utf-8")
    suffix="" if retail is None else f" + Retail AAS maps={retail['maps']} faces={retail['faces']} areas={retail['areas']} reaches={retail['reachabilities']}"
    print("PASS: 15 unchanged C AAS-debug records + 21 contracts / 19 symbols"+suffix)
    return 0

if __name__=="__main__": raise SystemExit(main())
