#!/usr/bin/env python3
"""Frozen independent MD3 parser versus packed-only production registration."""
from __future__ import annotations
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess
import sys
import zipfile
from inventory import sha
from toolchain import ROOT, run

BASELINE = "98a4d50"


def frozen_modules(out):
    commit = subprocess.check_output(["git", "rev-parse", BASELINE], cwd=ROOT, text=True).strip()
    files = {}
    for source, package in [("src/mq3/format/md3.ml", "frozen_md3"),
                            ("src/mq3/renderer/surface_md3.ml", "frozen_surface_md3")]:
        original = subprocess.check_output(["git", "show", commit + ":" + source], cwd=ROOT).decode("utf-8")
        files[source] = hashlib.sha256(original.encode("utf-8")).hexdigest()
        text = re.sub(r"^package [^\n]+", "package mq3.tests." + package, original, count=1, flags=re.MULTILINE)
        if package == "frozen_md3":
            text = text.replace("mq3.renderer.surface_md3 as md3Mesh", "mq3.tests.frozen_surface_md3 as frozenPackedMesh").replace("md3Mesh.", "frozenPackedMesh.")
        target = out / "modules/mq3/tests" / (package + ".ml")
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding="utf-8", newline="\n")
    return commit, files


def fixture():
    data = bytearray(512)
    i = lambda at, value: struct.pack_into("<i", data, at, value)
    f = lambda at, value: struct.pack_into("<f", data, at, value)
    def text(at, value):
        raw = value.encode("ascii");data[at:at + len(raw)] = raw
    for at, value in [(0, 0x33504449),(4,15),(72,7),(76,1),(80,1),(84,1),(88,0),(92,108),(96,164),(100,276),(104,512)]: i(at,value)
    text(8,"unit.md3")
    for at, value in [(108,-2),(112,-3),(116,-4),(120,5),(124,6),(128,7),(132,1),(136,2),(140,3),(144,9)]: f(at,value)
    text(148,"idle0");text(164,"tag_weapon")
    for at,value in [(228,4),(232,5),(236,6)]: f(at,value)
    for row in range(3):
        for column in range(3): f(240+row*12+column*4, float(row==column))
    s=276;i(s,0x33504449);text(s+4,"gun")
    for at,value in [(68,0),(72,1),(76,1),(80,3),(84,1),(88,108),(92,120),(96,188),(100,212),(104,236),(108,0),(112,1),(116,2),(184,3)]: i(s+at,value)
    text(s+120,"models/weapons2/test")
    for at,value in [(188,0),(192,0),(196,1),(200,0),(204,0),(208,1)]: f(s+at,value)
    for index, values in enumerate([(64,0,0,0),(0,64,0,0x40),(0xffff,0x8000,64,0x4000)]): struct.pack_into("<4H",data,s+212+index*8,*values)
    return bytes(data)


def corpus(out, archive):
    entries=[];asset_hashes={}
    def put(kind, data, name):
        target=out/(str(len(entries))+"-"+name+".md3");target.write_bytes(data);entries.append((kind,target))
    with zipfile.ZipFile(archive) as pak:
        for name in sorted(n for n in pak.namelist() if n.lower().endswith(".md3")):
            raw=pak.read(name);asset_hashes[name]=hashlib.sha256(raw).hexdigest();put("ok",raw,"retail")
    retail_count=len(entries);base=fixture();put("ok",base,"fixture")
    for normal in [0,1,0x7fff,0x8000,0xffff]:
        raw=bytearray(base);struct.pack_into("<4H",raw,488,0xffff,0x8000,0x7fff,normal);put("ok",bytes(raw),"signed")
    for at,value in [(80,0),(352,0),(360,0)]:
        raw=bytearray(base);struct.pack_into("<i",raw,at,value);put("ok",bytes(raw),"empty-section")
    raw=bytearray(base[:276]);struct.pack_into("<3i",raw,84,0,0,108)
    struct.pack_into("<i",raw,100,276);struct.pack_into("<i",raw,104,276);put("ok",bytes(raw),"tag-only")
    put("ok",base+b"trailing","trailing-bytes")
    mutations=[(0,0),(4,14),(76,0),(76,1025),(80,-1),(80,257),(84,-1),(84,129),(88,-1),(88,257),
               (104,107),(104,513),(92,107),(92,512),(96,163),(100,275),(100,512),
               (276,0),(348,2),(352,-1),(352,257),(356,0),(356,4097),(360,-1),(360,8193),
               (380,107),(380,237),(364,0),(368,0),(372,0),(376,0),(376,213),(384,-1),(384,3)]
    for at,value in mutations:
        raw=bytearray(base);struct.pack_into("<i",raw,at,value);put("bad",bytes(raw),"invalid")
    for size in [0,1,4,107,511]: put("bad",base[:size],"truncated")
    raw=bytearray(base+b"padding!");struct.pack_into("<i",raw,104,520);put("bad",bytes(raw),"surface-chain")
    manifest=out/"manifest.txt";manifest.write_text("".join(kind+"|"+str(path)+"\n" for kind,path in entries),encoding="utf-8",newline="\n")
    return manifest,retail_count,asset_hashes,len([kind for kind,_ in entries if kind=="bad"])


def negative_eager_control(out, retail_count, compiler):
    """A silent fallback to eager load must fail the representation invariant."""
    source=(ROOT/"src/mq3/format/md3.ml").read_text()
    needle="function loadPacked(data) return loadMode(data,true) end function"
    if needle not in source: raise RuntimeError("Packed loader entry changed; update targeted negative control")
    source=source.replace(needle,"function loadPacked(data) return loadMode(data,false) end function",1).replace("package mq3.format.md3","package mq3.tests.eager_md3",1)
    (out/"modules/mq3/tests/eager_md3.ml").write_text(source,encoding="utf-8",newline="\n")
    negative=out/"negative";negative.mkdir(exist_ok=True)
    test=negative/"eager_probe.ml"
    test.write_text((ROOT/"tests/md3_packed_retail_probe.ml").read_text().replace("mq3.format.md3 as packedReader","mq3.tests.eager_md3 as packedReader"),encoding="utf-8",newline="\n")
    manifest=negative/"manifest.txt";manifest.write_text("ok|"+str(out/(str(retail_count)+"-fixture.md3"))+"\n",encoding="utf-8",newline="\n")
    executable=negative/"eager_probe.exe"
    run([compiler,test,executable,"-I",out/"modules","-I",ROOT/"src","-I",ROOT/"artifacts/toolchain"],ROOT/"build",log=negative/"build.log",timeout=900)
    result=subprocess.run([str(executable),str(manifest)],cwd=ROOT/"build",text=True,capture_output=True,timeout=60)
    output=result.stdout+result.stderr;(negative/"result.log").write_text(output,encoding="utf-8")
    if result.returncode==0 or "packed loader eagerly allocated decoded vertex frames" not in output:
        raise RuntimeError("Silent eager fallback was not rejected: "+output)
    return {"passed":True,"scope":"Ignored namespace copy changes only packed mode true to false; unchanged full comparison rejects an eager fallback before rendering. No productive source was mutated.","output":output.strip()}


def main():
    parser=argparse.ArgumentParser();parser.add_argument("--data-root",type=Path,required=True);args=parser.parse_args()
    archive=next((p.resolve() for p in [args.data_root/"baseq3/pak0.pk3",args.data_root/"pak0.pk3",args.data_root/"Quake3/baseq3/pak0.pk3"] if p.is_file()),None)
    if archive is None: raise RuntimeError("Retail pak0.pk3 missing")
    out=ROOT/"build/reference/md3-packed";out.mkdir(parents=True,exist_ok=True)
    commit,baseline_sources=frozen_modules(out);manifest,retail_count,assets,malformed=corpus(out,archive)
    compiler=ROOT/"artifacts/toolchain/build/mlc_win64.exe";executable=out/"probe.exe"
    source=ROOT/"tests/md3_packed_retail_probe.ml"
    run([compiler,source,executable,"-I",out/"modules","-I",ROOT/"src","-I",ROOT/"artifacts/toolchain","--heap-reserve","1g","--heap-commit","32m","--gc-limit","256m"],ROOT/"build",log=out/"build.log",timeout=900)
    output=run([executable,manifest],ROOT/"build",log=out/"probe.log",timeout=1200).strip()
    if not output.startswith("PASS: packed MD3 files=") or "eagerVertexFrames=0 inputIndependent=true temporaryReferenceFrames=true publicLoadPreserved=true" not in output: raise RuntimeError(output)
    negative=negative_eager_control(out,retail_count,compiler)
    registry=(ROOT/"src/mq3/engine/local_qvm_match.ml").read_text();body=registry.split("function registerModel(context,name)",1)[1].split("\nend function",1)[0]
    if body.count("md3.loadPacked(")!=2 or "md3.load(" in body: raise RuntimeError("Productive base/LOD model registration must use packed load")
    files=["src/mq3/format/md3.ml","src/mq3/renderer/surface_md3.ml","src/mq3/engine/local_qvm_match.ml","src/mq3/engine/local_qvm_ui.ml","src/mq3/client/qvm_menu_app.ml","tests/md3_packed_retail_probe.ml","scripts/test_md3_packed.py"]
    report={"schema":1,"passed":True,"negative_control":negative,"retail_files":retail_count,"malformed_cases":malformed,"output":output,"baseline_commit":commit,"baseline_sources":baseline_sources,"asset_sha256":assets,"compiler_sha256":sha(compiler),"test_binary_sha256":sha(executable),"scope":"Frozen independent parser/reference from98a4d50 versus unchanged public load and packed-only load: all Retail MD3 metadata, bounds, tags, indexes, shaders, UVs, signed eager words and every frame byte; native interpolation and transient reference comparisons. Malformed fixtures preserve rejection diagnostics; inputmutation and temporaryframe mutation cannot alter stored assets; reference access never populates the packed-only frames array.","productive_registration":"localMatch.registerModel base+LODs uses loadPacked; local_qvm_ui and qvm_menu_app delegate shared localMatch services/modelAssets.","sources":{p:sha(ROOT/p) for p in files}}
    (out/"result.json").write_text(json.dumps(report,indent=2)+"\n",encoding="utf-8");print(output)


if __name__=="__main__": main()
