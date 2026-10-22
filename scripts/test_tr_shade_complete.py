#!/usr/bin/env python3
"""Complete native, unchanged-C and Retail gate for renderer/tr_shade.c."""
from __future__ import annotations
import argparse, json, re, subprocess, sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

SOURCE=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_shade.c'
PORT=ROOT/'src/mq3/renderer/tr_shade_runtime.ml'
EXPECTED=['ComputeColors','ComputeTexCoords','DrawMultitextured','DrawNormals','DrawTris','ProjectDlightTexture','RB_BeginSurface','RB_EndSurface','RB_FogPass','RB_IterateStagesGeneric','RB_StageIteratorGeneric','RB_StageIteratorLightmappedMultitexture','RB_StageIteratorVertexLitTexture','R_ArrayElementDiscrete','R_BindAnimatedImage','R_DrawElements','R_DrawStripElements']
def functions(text:str)->set[str]: return set(re.findall(r'\b(?:function|void|int)\s+(?:APIENTRY\s+)?\**\s*([A-Za-z_]\w*)\s*\(',text))
def invoke(script:str,*args:object)->None: subprocess.run([sys.executable,ROOT/'scripts'/script,*map(str,args)],cwd=ROOT,check=True)
def main()->int:
  parser=argparse.ArgumentParser();parser.add_argument('--data-root',default='D:/Quake3');parser.add_argument('--full-regression',action='store_true');args=parser.parse_args()
  missing_source=sorted(set(EXPECTED)-functions(SOURCE.read_text(encoding='utf-8',errors='replace')));missing_port=sorted(set(EXPECTED)-functions(PORT.read_text(encoding='utf-8')))
  if missing_source or missing_port: raise RuntimeError(f'tr_shade symbol mismatch: source={missing_source} port={missing_port}')
  invoke('build.py','--source','tests/tr_shade_complete_contracts.ml','--output','tr_shade_complete_contracts.exe');contracts=run([ROOT/'build/tr_shade_complete_contracts.exe'],ROOT/'build').strip()
  if contracts!='PASS: 28 complete tr_shade contracts': raise RuntimeError(contracts)
  out=ROOT/'build/reference/tr_shade_complete';out.mkdir(parents=True,exist_ok=True)
  (out/'tr_shade_strip_under_test.inc').write_text(extract(SOURCE,['R_DrawStripElements']),encoding='utf-8',newline='\n')
  harness=ROOT/'tests/reference/tr_shade_strip_oracle.c';oracle=out/'oracle.exe'
  run(['cl','/nologo','/Od','/MT','/W4','/WX','/fp:strict',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
  native=run([oracle],out,log=out/'oracle.log');invoke('build.py','--source','tests/tr_shade_strip_oracle.ml','--output','tr_shade_strip_oracle.exe');mini=run([ROOT/'build/tr_shade_strip_oracle.exe'],ROOT/'build',log=out/'minilang.log')
  if native!=mini: raise RuntimeError('R_DrawStripElements mismatch\nC:\n'+native+'MiniLang:\n'+mini)
  # Existing gates compile other unchanged functions directly from tr_shade.c.
  invoke('test_shader_compute_colors.py');invoke('test_shader_entity_translate.py');invoke('test_playable_dynamic_lights.py');invoke('test_playable_world_batch.py')
  pak=Path(args.data_root)/'baseq3/pak0.pk3'
  if not pak.is_file(): raise RuntimeError(f'Retail pak0.pk3 not found: {pak}')
  maps=['maps/q3dm1.bsp','maps/q3dm2.bsp','maps/q3dm4.bsp','maps/q3dm16.bsp','maps/q3ctf1.bsp'] if args.full_regression else ['maps/q3dm1.bsp']
  for map_name in maps: invoke('test_playable_world_materials.py','--pak',pak,'--map',map_name)
  files=[SOURCE,PORT,harness,ROOT/'tests/tr_shade_strip_oracle.ml',ROOT/'tests/tr_shade_complete_contracts.ml']
  report={'passed':True,'symbols':len(EXPECTED),'contracts':28,'unchanged_c_records':len(native.splitlines()),'retail_maps':maps,'scope':'Complete tr_shade back end: element/strip drawing, animated images, surface lifecycle, color and texture generation, multitexture stages, projected dynamic lights, fog, optimized iterators, counters and productive retained-raster submission.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
  (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
  print(f"PASS: {len(EXPECTED)}/{len(EXPECTED)} tr_shade symbols + 28 native contracts + unchanged-C differentials + {len(maps)} Retail map(s)");return 0
if __name__=='__main__': raise SystemExit(main())
