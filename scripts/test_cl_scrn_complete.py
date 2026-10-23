#!/usr/bin/env python3
"""Complete native, unchanged-C, productive-renderer and Retail gate for cl_scrn.c."""
from __future__ import annotations
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SOURCE=ROOT/'Quake-III-Arena-original-source/code/client/cl_scrn.c'
PORT=ROOT/'src/mq3/client/cl_scrn_runtime.ml'
EXPECTED=['SCR_AdjustFrom640','SCR_DebugGraph','SCR_DrawBigString','SCR_DrawBigStringColor','SCR_DrawChar','SCR_DrawDebugGraph','SCR_DrawDemoRecording','SCR_DrawNamedPic','SCR_DrawPic','SCR_DrawScreenField','SCR_DrawSmallChar','SCR_DrawSmallStringExt','SCR_DrawStringExt','SCR_FillRect','SCR_GetBigStringWidth','SCR_Init','SCR_Strlen','SCR_UpdateScreen']

def functions(text:str)->set[str]: return set(re.findall(r'\bfunction\s+([A-Za-z_]\w*)\s*\(',text))
def invoke(script:str,*args:object)->None: subprocess.run([sys.executable,ROOT/'scripts'/script,*map(str,args)],cwd=ROOT,check=True)

def main()->int:
  parser=argparse.ArgumentParser();parser.add_argument('--data-root',default='D:/Quake3');parser.add_argument('--full-regression',action='store_true');args=parser.parse_args()
  source=SOURCE.read_text(encoding='utf-8',errors='replace');ported=functions(PORT.read_text(encoding='utf-8'))
  missing_source=sorted(name for name in EXPECTED if not re.search(r'\b'+re.escape(name)+r'\s*\(',source));missing_port=sorted(set(EXPECTED)-ported)
  if missing_source or missing_port: raise RuntimeError(f'cl_scrn symbol mismatch source={missing_source} port={missing_port}')
  out=ROOT/'build/reference/cl_scrn_complete';out.mkdir(parents=True,exist_ok=True)
  (out/'cl_scrn_under_test.inc').write_text(extract(SOURCE,['SCR_AdjustFrom640','SCR_Strlen','SCR_GetBigStringWidth']),encoding='utf-8',newline='\n')
  harness=ROOT/'tests/reference/cl_scrn_oracle.c';oracle=out/'oracle.exe';include=ROOT/'Quake-III-Arena-original-source/code/game'
  run(['cl','/nologo','/Od','/MT','/W4','/WX','/fp:strict','/DWIN32',f'/I{include}',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
  unchanged=run([oracle],out,log=out/'oracle.log')
  invoke('build.py','--source','tests/cl_scrn_oracle.ml','--output','cl_scrn_oracle.exe');native=run([ROOT/'build/cl_scrn_oracle.exe'],ROOT/'build',log=out/'minilang.log')
  if unchanged!=native: raise RuntimeError('cl_scrn unchanged-C mismatch\nC:\n'+unchanged+'MiniLang:\n'+native)
  invoke('build.py','--source','tests/cl_scrn_complete_contracts.ml','--output','cl_scrn_complete_contracts.exe');contracts=run([ROOT/'build/cl_scrn_complete_contracts.exe'],ROOT/'build').strip()
  if contracts!='PASS: 35 complete cl_scrn contracts': raise RuntimeError(contracts)
  base=Path(args.data_root).resolve();base=base/'baseq3' if (base/'baseq3').is_dir() else base;pak=base/'pak0.pk3'
  if not pak.is_file(): raise RuntimeError(f'Retail pak0.pk3 not found: {pak}')
  invoke('build.py','--source','tests/cl_scrn_retail_probe.ml','--output','cl_scrn_retail_probe.exe');retail=run([ROOT/'build/cl_scrn_retail_probe.exe',pak],ROOT/'build').strip()
  if not retail.startswith('PASS: 7 Retail cl_scrn contracts / '): raise RuntimeError(retail)
  # These gates are the concrete production dependencies used by the facade.
  invoke('test_renderer_commands.py');invoke('test_ui_host_lifecycle.py');invoke('test_qvm_2d_batch.py')
  qvm='not requested'
  if args.full_regression:
    completed=subprocess.run([sys.executable,ROOT/'scripts/test_retail_qvm_match.py','--data-root',str(Path(args.data_root))],cwd=ROOT,check=True,text=True,capture_output=True,timeout=900)
    qvm=completed.stdout.strip().splitlines()[-1]
  files=[SOURCE,PORT,harness,ROOT/'tests/cl_scrn_oracle.ml',ROOT/'tests/cl_scrn_complete_contracts.ml',ROOT/'tests/cl_scrn_retail_probe.ml',ROOT/'src/mq3/renderer/tr_cmds_runtime.ml',ROOT/'src/mq3/client/ui_host_lifecycle.ml']
  report={'passed':True,'symbols':18,'contracts':35,'unchanged_c_records':len(unchanged.splitlines()),'retail':retail,'retail_qvm_match':qvm,'scope':'All cl_scrn.c symbols in a native facade over the renderer command queue and original-ui lifecycle: independent 640 scaling, named pictures/fills, atlas characters and color strings, demo overlay, circular debug graph, full connection-state screen matrix, widescreen clear, console ordering, stereo BeginFrame/EndFrame and recursion guard. Retail artwork is decoded into native QVM 2D batches from the facade command stream. The Windows top-level frame still composes the same productive renderer and UI components directly rather than calling this facade as its dispatcher.','sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in files}}
  (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
  print('PASS: 18/18 cl_scrn symbols + 35 native contracts + 8 unchanged-C records + '+retail);return 0
if __name__=='__main__': raise SystemExit(main())
