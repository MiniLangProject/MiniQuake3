#!/usr/bin/env python3
"""Complete source-surface, exact-C and native contract gate for tr_main.c."""
import argparse
import json
import subprocess
import sys
import zipfile

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

SYMBOLS = [
    "IsMirror", "R_AddDrawSurf", "R_AddEntitySurfaces", "R_CullLocalBox",
    "R_CullLocalPointAndRadius", "R_CullPointAndRadius", "R_DebugGraphics",
    "R_DebugPolygon", "R_DecomposeSort", "R_GenerateDrawSurfs",
    "R_GetPortalOrientations", "R_LocalNormalToWorld", "R_LocalPointToWorld",
    "R_MirrorPoint", "R_MirrorVector", "R_MirrorViewBySurface",
    "R_PlaneForSurface", "R_RenderView", "R_RotateForEntity",
    "R_RotateForViewer", "R_SetupFrustum", "R_SetupProjection",
    "R_SortDrawSurfs", "R_SpriteFogNum", "R_TransformClipToWindow",
    "R_TransformModelToClip", "R_WorldToLocal", "SetFarClip",
    "SurfIsOffscreen", "myGlMultMatrix", "qsortFast", "shortsort",
]

def invoke(script, *args):
    subprocess.run([sys.executable, ROOT / "scripts" / script, *map(str,args)], cwd=ROOT, check=True)

def main():
    parser=argparse.ArgumentParser();parser.add_argument("--data-root");parser.add_argument("--full-regression",action="store_true");args=parser.parse_args()
    source=ROOT/"src/mq3/renderer/tr_main_runtime.ml";text=source.read_text(encoding="utf-8")
    missing=[name for name in SYMBOLS if f"function {name}(" not in text]
    if missing: raise RuntimeError("missing tr_main facade symbols: "+", ".join(missing))
    out=ROOT/"build/reference/tr_main_complete";out.mkdir(parents=True,exist_ok=True)
    original=ROOT/"Quake-III-Arena-original-source/code/renderer/tr_main.c"
    (out/"tr_main_complete_under_test.inc").write_text(extract(original,["myGlMultMatrix"]),encoding="utf-8",newline="\n")
    harness=ROOT/"tests/reference/tr_main_complete_oracle.c";oracle=out/"oracle.exe"
    run(["cl","/nologo","/Od","/fp:strict","/arch:SSE2","/MT","/W4",f"/I{out}",harness,f"/Fe:{oracle}","/link","/Brepro"],out,msvc_env("x86"),out/"oracle-build.log")
    native=run([oracle],out,log=out/"oracle.log")
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/tr_main_complete_oracle.ml","--output","tr_main_complete_oracle.exe"],cwd=ROOT,check=True)
    mini=run([ROOT/"build/tr_main_complete_oracle.exe"],ROOT/"build",log=out/"minilang.log")
    if native!=mini: raise RuntimeError("tr_main matrix mismatch\nC:\n"+native+"MiniLang:\n"+mini)
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/tr_main_complete_contracts.ml","--output","tr_main_complete_contracts.exe"],cwd=ROOT,check=True)
    contracts=run([ROOT/"build/tr_main_complete_contracts.exe"],ROOT/"build",log=out/"contracts.log").strip()
    if contracts!="PASS: 24 complete tr_main contracts": raise RuntimeError(contracts)
    retail=None
    if args.data_root:
        pak=__import__("pathlib").Path(args.data_root)/"baseq3/pak0.pk3"
        if not pak.is_file(): raise RuntimeError(f"retail pak0.pk3 missing: {pak}")
        with zipfile.ZipFile(pak) as archive:
            maps=[name for name in archive.namelist() if name.lower().endswith(".bsp")]
        if not maps: raise RuntimeError("retail pak contains no BSP maps")
        retail={"pak":str(pak),"bspMaps":len(maps)}
    if args.full_regression:
        invoke("test_renderer_view_math.py");invoke("test_draw_surfs.py");invoke("test_portal_view.py")
        invoke("test_world_surface_selection.py");invoke("test_qvm_scene_geometry.py");invoke("test_portal_render_pass.py")
    files=[original,source,harness,ROOT/"tests/tr_main_complete_oracle.ml",ROOT/"tests/tr_main_complete_contracts.ml"]
    report={"passed":True,"symbols":len(SYMBOLS),"contracts":24,"exactRecords":len(native.splitlines()),"retail":retail,"sources":{str(p.relative_to(ROOT)).replace("\\","/"):sha(p) for p in files}}
    (out/"result.json").write_text(json.dumps(report,indent=2)+"\n",encoding="utf-8",newline="\n")
    print(f"PASS: {len(SYMBOLS)}/{len(SYMBOLS)} tr_main symbols + {len(native.splitlines())} exact C records + 24 native contracts"+(f" + {retail['bspMaps']} retail BSP maps" if retail else ""))

if __name__=="__main__": main()
