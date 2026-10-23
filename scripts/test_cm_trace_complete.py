"""Unchanged-C differential and productive contracts for qcommon/cm_trace.c."""
import json
import random
import struct
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

NAMES=("RotatePoint","TransposeMatrix","CreateRotationMatrix","CM_ProjectPointOntoVector",
       "CM_DistanceFromLineSquared","CM_VectorDistanceSquared","SquareRootFloat")
ALL=("CM_BoxTrace","CM_DistanceFromLineSquared","CM_PositionTest","CM_ProjectPointOntoVector",
     "CM_TestBoundingBoxInCapsule","CM_TestBoxInBrush","CM_TestCapsuleInCapsule","CM_TestInLeaf",
     "CM_Trace","CM_TraceBoundingBoxThroughCapsule","CM_TraceThroughBrush","CM_TraceThroughLeaf",
     "CM_TraceThroughPatch","CM_TraceThroughSphere","CM_TraceThroughTree","CM_TraceThroughVerticalCylinder",
     "CM_TransformedBoxTrace","CM_VectorDistanceSquared","CreateRotationMatrix","RotatePoint",
     "SquareRootFloat","TransposeMatrix")

def function(text,name):
    marker=name+"("
    position=text.index(marker)
    start=text.rfind("\n",0,position)+1
    brace=text.index("{",position);depth=1;end=brace+1
    while depth:
        if text[end]=="{":depth+=1
        elif text[end]=="}":depth-=1
        end+=1
    return text[start:end]

def main():
    output=ROOT/"build/reference/cm_trace_complete";output.mkdir(parents=True,exist_ok=True)
    source=ROOT/"Quake-III-Arena-original-source/code";original=source/"qcommon/cm_trace.c"
    text=original.read_text(encoding="latin1")
    missing=[name for name in ALL if name+"(" not in text]
    if missing:raise RuntimeError("original symbol inventory changed: "+str(missing))
    port=(ROOT/"src/mq3/collision/brush.ml").read_text()+(ROOT/"src/mq3/collision/world.ml").read_text()
    missing_port=[name for name in ALL if "function "+name+"(" not in port]
    if missing_port:raise RuntimeError("MiniLang cm_trace surface incomplete: "+str(missing_port))
    isolated=output/"original_cm_trace_math.c"
    isolated.write_text('#include "cm_local.h"\n\n'+'\n\n'.join(function(text,n) for n in NAMES)+'\n',encoding="latin1")
    run(["cl","/nologo","/Od","/Gy","/fp:strict","/arch:SSE2","/MT","/DWIN32","/DNDEBUG",
         "/D_CRT_SECURE_NO_WARNINGS",f"/I{source/'qcommon'}",f"/I{source/'game'}",
         ROOT/"tests/reference/cm_trace_complete_oracle.c",isolated,source/"game/q_math.c",
         f"/Fe:{output/'cm_trace_complete_oracle.exe'}","/link","/OPT:REF","/Brepro"],
        output,msvc_env("x86"),output/"build.log")
    rng=random.Random(0xC37ACE);rows=[]
    for i in range(4096):
        op=i%7
        a=[rng.uniform(-720,720) for _ in range(3)]
        b=[rng.uniform(-512,512) for _ in range(3)]
        c=[rng.uniform(-2,2) for _ in range(3)]
        scalar=10**rng.uniform(-5,7)
        rows.append(struct.pack("<i10f",op,*a,*b,*c,scalar))
    inputs=output/"inputs.bin";expected=output/"expected.bin"
    inputs.write_bytes(b"".join(rows));run([output/"cm_trace_complete_oracle.exe",inputs,expected],output)
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/cm_trace_complete_oracle.ml","--output","cm_trace_complete_oracle_test.exe"],check=True)
    print(run([ROOT/"build/cm_trace_complete_oracle_test.exe",inputs,expected],ROOT/"build",log=output/"oracle-test.log"))
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/cm_trace_complete_contracts.ml","--output","cm_trace_complete_contracts.exe"],check=True)
    data=Path(sys.argv[1] if len(sys.argv)>1 else "D:/Quake3")
    import zipfile
    with zipfile.ZipFile(data/"baseq3/pak0.pk3") as archive:bsp=archive.read("maps/q3dm1.bsp")
    mapfile=output/"q3dm1.bsp";mapfile.write_bytes(bsp)
    print(run([ROOT/"build/cm_trace_complete_contracts.exe",mapfile],ROOT/"build",log=output/"contracts.log"))
    result={"passed":True,"unchanged_functions":list(NAMES),"original_candidates":len(ALL)+1,
            "mapped_function_candidates":list(ALL),"non_symbol_candidates":["collision (comment-only inventory token)"],
            "differential_cases":len(rows),"exact_fields":len(rows)*10,
            "original_sha256":sha(original),"isolated_sha256":sha(isolated),
            "inputs_sha256":sha(inputs),"expected_sha256":sha(expected)}
    (output/"result.json").write_text(json.dumps(result,indent=2)+"\n")
if __name__=="__main__":main()
