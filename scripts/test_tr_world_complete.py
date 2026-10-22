#!/usr/bin/env python3
"""Complete native, unchanged-C and Retail gate for renderer/tr_world.c."""
from __future__ import annotations
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SOURCE=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_world.c';PORT=ROOT/'src/mq3/renderer/tr_world_runtime.ml'
EXPECTED=['R_AddBrushModelSurfaces','R_AddWorldSurface','R_AddWorldSurfaces','R_ClusterPVS','R_CullGrid','R_CullSurface','R_CullTriSurf','R_DlightFace','R_DlightGrid','R_DlightSurface','R_DlightTrisurf','R_MarkLeaves','R_PointInLeaf','R_RecursiveWorldNode','R_inPVS']
def functions(text:str)->set[str]: return set(re.findall(r'\bfunction\s+([A-Za-z_]\w*)\s*\(',text))
def invoke(script:str,*args:object)->None: subprocess.run([sys.executable,ROOT/'scripts'/script,*map(str,args)],cwd=ROOT,check=True)
def main()->int:
  parser=argparse.ArgumentParser();parser.add_argument('--data-root',default='D:/Quake3');parser.add_argument('--full-regression',action='store_true');args=parser.parse_args()
  source_text=SOURCE.read_text(encoding='utf-8',errors='replace');port_names=functions(PORT.read_text(encoding='utf-8'));missing_source=sorted(name for name in EXPECTED if not re.search(r'\b'+re.escape(name)+r'\s*\(',source_text));missing_port=sorted(set(EXPECTED)-port_names)
  if missing_source or missing_port: raise RuntimeError(f'tr_world symbol mismatch source={missing_source} port={missing_port}')
  invoke('build.py','--source','tests/tr_world_complete_contracts.ml','--output','tr_world_complete_contracts.exe');contracts=run([ROOT/'build/tr_world_complete_contracts.exe'],ROOT/'build').strip()
  if contracts!='PASS: 29 complete tr_world contracts': raise RuntimeError(contracts)
  out=ROOT/'build/reference/tr_world_complete';out.mkdir(parents=True,exist_ok=True);(out/'tr_world_dlight_under_test.inc').write_text(extract(SOURCE,['R_DlightFace','R_DlightGrid','R_DlightTrisurf']),encoding='utf-8',newline='\n')
  harness=ROOT/'tests/reference/tr_world_dlight_oracle.c';oracle=out/'oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX','/fp:strict',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([oracle],out,log=out/'oracle.log')
  invoke('build.py','--source','tests/tr_world_dlight_oracle.ml','--output','tr_world_dlight_oracle.exe');mini=run([ROOT/'build/tr_world_dlight_oracle.exe'],ROOT/'build',log=out/'minilang.log');
  if native!=mini: raise RuntimeError('tr_world dlight mismatch\nC:\n'+native+'MiniLang:\n'+mini)
  invoke('test_world_surface_selection.py');invoke('test_qvm_scene_geometry.py');invoke('test_playable_dynamic_lights.py')
  pak=Path(args.data_root)/'baseq3/pak0.pk3';
  if not pak.is_file(): raise RuntimeError(f'Retail pak0.pk3 not found: {pak}')
  invoke('build.py','--source','tests/tr_world_retail_probe.ml','--output','tr_world_retail_probe.exe');maps=['maps/q3dm1.bsp','maps/q3dm2.bsp','maps/q3dm4.bsp','maps/q3dm16.bsp','maps/q3ctf1.bsp'] if args.full_regression else ['maps/q3dm1.bsp'];retail=[]
  for map_name in maps:
    value=run([ROOT/'build/tr_world_retail_probe.exe',pak,map_name],ROOT/'build').strip();
    if not value.startswith('PASS: '): raise RuntimeError(value)
    retail.append(value)
  files=[SOURCE,PORT,harness,ROOT/'tests/tr_world_dlight_oracle.ml',ROOT/'tests/tr_world_complete_contracts.ml',ROOT/'tests/tr_world_retail_probe.ml'];report={'passed':True,'symbols':15,'contracts':29,'unchanged_c_records':len(native.splitlines()),'retail':retail,'scope':'Complete tr_world surface/frustum/backface culling, dynamic-light masks, duplicate suppression, brush models, BSP recursion, visible bounds, point/cluster/PVS and area-mask marking, plus productive retained world selection.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}};(out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f'PASS: 15/15 tr_world symbols + 29 native contracts + {len(native.splitlines())} unchanged-C records + {len(maps)} Retail map(s)');return 0
if __name__=='__main__': raise SystemExit(main())
