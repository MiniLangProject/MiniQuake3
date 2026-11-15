#!/usr/bin/env python3
"""Retained BSP face-local vertices versus an independent frozen extractor."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import zipfile
from inventory import sha
from toolchain import ROOT, run

BASELINE="98a4d50"


def frozen_module(out):
    commit=subprocess.check_output(["git","rev-parse",BASELINE],cwd=ROOT,text=True).strip()
    raw=subprocess.check_output(["git","show",commit+":src/mq3/renderer/bsp_render_data.ml"],cwd=ROOT)
    text=raw.decode("utf-8").replace("package mq3.renderer.bsp_render_data","package mq3.tests.frozen_bsp_render_data",1)
    target=out/"modules/mq3/tests/frozen_bsp_render_data.ml";target.parent.mkdir(parents=True,exist_ok=True);target.write_text(text,encoding="utf-8",newline="\n")
    return commit,hashlib.sha256(raw).hexdigest()


def compile_probe(out,source,executable,log):
    run([ROOT/"artifacts/toolchain/build/mlc_win64.exe",source,executable,"-I",out/"modules","-I",ROOT/"src","-I",ROOT/"artifacts/toolchain","--heap-reserve","1g","--heap-commit","32m","--gc-limit","256m"],ROOT/"build",log=log,timeout=900)


def negative_controls(out):
    results=[];source=(ROOT/"src/mq3/renderer/bsp_render_data.ml").read_text()
    for name,old,new,expected in [
        ("no_sharing","extractMode(map,faceIndexes,maxTriangles,patchError,true)","extractMode(map,faceIndexes,maxTriangles,patchError,false)","private sharing is per face"),
        ("public_sharing","extractMode(map,faceIndexes,maxTriangles,patchError,false)","extractMode(map,faceIndexes,maxTriangles,patchError,true)","public current and frozen extraction preserve independent mutable corners")]:
        if old not in source:raise RuntimeError("Extractor entry changed; update targeted negative control")
        package="mq3.tests.bsp_"+name;code=source.replace("package mq3.renderer.bsp_render_data","package "+package,1).replace(old,new,1)
        module=out/"modules/mq3/tests"/("bsp_"+name+".ml");module.write_text(code,encoding="utf-8",newline="\n")
        folder=out/name;folder.mkdir(exist_ok=True)
        test=folder/"probe.ml";test.write_text((ROOT/"tests/bsp_retained_retail_probe.ml").read_text().replace("mq3.renderer.bsp_render_data as retainedRender",package+" as retainedRender"),encoding="utf-8",newline="\n")
        manifest=folder/"empty.txt";manifest.write_text("",encoding="utf-8")
        executable=folder/"probe.exe";compile_probe(out,test,executable,folder/"build.log")
        completed=subprocess.run([str(executable),str(manifest)],cwd=ROOT/"build",text=True,capture_output=True,timeout=60)
        text=completed.stdout+completed.stderr;(folder/"result.log").write_text(text,encoding="utf-8")
        if completed.returncode==0 or expected not in text:raise RuntimeError("Negative control did not detect "+name+": "+text)
        results.append({"name":name,"passed":True,"expected_failure":expected,"output":text.strip()})
    return results


def main():
    parser=argparse.ArgumentParser();parser.add_argument("--data-root",type=Path,required=True);args=parser.parse_args()
    archive=next((p.resolve() for p in [args.data_root/"baseq3/pak0.pk3",args.data_root/"pak0.pk3",args.data_root/"Quake3/baseq3/pak0.pk3"] if p.is_file()),None)
    if archive is None:raise RuntimeError("Retail pak0.pk3 missing")
    out=ROOT/"build/reference/bsp-retained";out.mkdir(parents=True,exist_ok=True)
    commit,baseline_sha=frozen_module(out);maps=[];assets={}
    with zipfile.ZipFile(archive) as pak:
        for name in sorted(n for n in pak.namelist() if n.lower().startswith("maps/") and n.lower().endswith(".bsp")):
            data=pak.read(name);target=out/Path(name).name;target.write_bytes(data);maps.append(target);assets[name]=hashlib.sha256(data).hexdigest()
    manifest=out/"maps.txt";manifest.write_text("".join(str(path)+"\n" for path in maps),encoding="utf-8",newline="\n")
    executable=out/"probe.exe";compile_probe(out,ROOT/"tests/bsp_retained_retail_probe.ml",executable,out/"build.log")
    output=run([executable,manifest],ROOT/"build",log=out/"probe.log",timeout=1800).strip()
    if "maps="+str(len(maps))+" " not in output or "publicAliasesPreserved=true privateFaceSharing=true" not in output or "Q3DM1 references=24225 uniqueObjects=12061 removedVertices=12164 removedAttributeArrays=85148" not in output:raise RuntimeError(output)
    source=(ROOT/"src/mq3/renderer/world_surface_selection.ml").read_text();body=source.split("function buildCache(map,patchError)",1)[1].split("\nend function",1)[0]
    if "render.extractRetainedWithPatchError(" not in body or "render.extractWithPatchError(" in body:raise RuntimeError("Productive world cache must use retained extraction")
    negatives=negative_controls(out)
    files=["src/mq3/renderer/bsp_render_data.ml","src/mq3/renderer/world_surface_selection.ml","tests/bsp_retained_retail_probe.ml","scripts/test_bsp_retained.py"]
    report={"schema":1,"passed":True,"maps":len(maps),"output":output,"negative_controls":negatives,"baseline_commit":commit,"baseline_source_sha256":baseline_sha,"asset_sha256":assets,"sources":{p:sha(ROOT/p) for p in files},"compiler_sha256":sha(ROOT/"artifacts/toolchain/build/mlc_win64.exe"),"test_binary_sha256":sha(executable),"scope":"Every ordered face stream of all Retail BSPs compared to frozen98a4d50 extraction at zero/one/full budgets, including every vertex field, triangle metadata, fog, sourceIndex and patch normals. Explicit multi-face duplicate/order cases, malformed tails beyond output limits and mutable public-corner isolation remain unchanged. Per-face sharing identity and productive q3dm1 cache object reduction are tested by restored test-only identity markers.","limits":"Allocation counts describe decoded planar/soup RenderVertex plus their seven attribute arrays; patches are unchanged. This is not a GC pause or FPS acceptance measurement."}
    (out/"result.json").write_text(json.dumps(report,indent=2)+"\n",encoding="utf-8");print(output)


if __name__=="__main__":main()
