#!/usr/bin/env python3
"""Complete be_aas_main.c symbol, unchanged-C, contract and Retail gate."""
from __future__ import annotations
import argparse,json,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['AAS_ContinueInit','AAS_Error','AAS_IndexFromModel','AAS_IndexFromString','AAS_Initialized','AAS_LoadFiles','AAS_LoadMap','AAS_Loaded','AAS_ModelFromIndex','AAS_ProjectPointOntoVector','AAS_SetInitialized','AAS_Setup','AAS_Shutdown','AAS_StartFrame','AAS_StringFromIndex','AAS_Time','AAS_UpdateStringIndexes']
ORACLE=['AAS_StringFromIndex','AAS_IndexFromString','AAS_ModelFromIndex','AAS_IndexFromModel','AAS_UpdateStringIndexes','AAS_Loaded','AAS_Initialized','AAS_SetInitialized','AAS_Time','AAS_ProjectPointOntoVector']
def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,default=Path('D:/Quake3'));args=parser.parse_args();py_compile.compile(__file__,doraise=True)
 out=ROOT/'build/reference/be_aas_main_complete';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/botlib/be_aas_main.c';module=ROOT/'src/mq3/botlib/aas_main.ml';text=module.read_text(encoding='utf-8')
 missing=[name for name in SYMBOLS if not re.search(r'function\s+'+re.escape(name)+r'\s*\(',text)]
 if missing:raise RuntimeError('missing be_aas_main symbols: '+', '.join(missing))
 (out/'be_aas_main_complete_under_test.inc').write_text(extract(original,ORACLE),encoding='utf-8',newline='\n');harness=ROOT/'tests/reference/be_aas_main_complete_oracle.c';oracle=out/'be_aas_main_complete_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([oracle],out,log=out/'oracle.log');mini=run([build('tests/be_aas_main_complete_oracle.ml','be_aas_main_complete_oracle.exe')],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('be_aas_main unchanged-C mismatch\nnative: '+repr(native)+'\nmini: '+repr(mini))
 contracts=run([build('tests/be_aas_main_complete_contracts.ml','be_aas_main_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 10 complete be_aas_main contracts':raise RuntimeError(contracts)
 retail=run([build('tests/be_aas_entity_main_retail_probe.ml','be_aas_entity_main_retail_probe.exe'),args.data_root/'baseq3/pak0.pk3'],ROOT/'build',log=out/'retail.log').strip()
 if not retail.startswith('PASS: 8 Retail be_aas entity/main checks;'):raise RuntimeError(retail)
 subprocess.run([sys.executable,ROOT/'scripts/test_botlib_retail_qagame.py','--data-root',args.data_root],cwd=ROOT,check=True)
 files=[original,module,harness,ROOT/'tests/be_aas_main_complete_oracle.ml',ROOT/'tests/be_aas_main_complete_contracts.ml',ROOT/'tests/be_aas_entity_main_retail_probe.ml']
 result={'passed':True,'symbols':len(SYMBOLS),'unchanged_c_records':len(native.splitlines()),'contracts':10,'retail':retail,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {len(SYMBOLS)}/17 be_aas_main symbols + {result['unchanged_c_records']} unchanged-C records + 10 contracts + Retail AAS/qagame")
if __name__=='__main__':main()
