#!/usr/bin/env python3
"""Complete be_aas_bspq3.c symbol, unchanged-C and Retail gate."""
from __future__ import annotations
import argparse,json,os,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['AAS_BSPEntityInRange','AAS_BSPLinkEntity','AAS_BSPModelMinsMaxsOrigin','AAS_BSPTraceLight','AAS_BoxEntities','AAS_DumpBSPData','AAS_EntityCollision','AAS_FloatForBSPEpairKey','AAS_FreeBSPEntities','AAS_IntForBSPEpairKey','AAS_LoadBSPFile','AAS_NextBSPEntity','AAS_ParseBSPEntities','AAS_PointContents','AAS_Trace','AAS_UnlinkFromBSPLeaves','AAS_ValueForBSPEpairKey','AAS_VectorForBSPEpairKey','AAS_inPHS','AAS_inPVS','PrintContents']
ORACLE=['AAS_Trace','AAS_PointContents','AAS_EntityCollision','AAS_inPVS','AAS_inPHS','AAS_BSPModelMinsMaxsOrigin','AAS_UnlinkFromBSPLeaves','AAS_BSPLinkEntity','AAS_BoxEntities','AAS_NextBSPEntity','AAS_BSPEntityInRange','AAS_ValueForBSPEpairKey','AAS_VectorForBSPEpairKey','AAS_FloatForBSPEpairKey','AAS_IntForBSPEpairKey','AAS_BSPTraceLight']
def build(source:str,output:str)->Path:
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def normalize(value:str)->str:
 value=value.strip().replace('-0.','0.').replace('-0\n','0\n')
 return re.sub(r'(?<=\d)\.0?(?=,|\n|$)','',value)
def main()->int:
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,default=Path(os.environ.get('MQ3_DATA_ROOT','D:/Quake3')));args=parser.parse_args();data_root=args.data_root.resolve()
 py_compile.compile(__file__,doraise=True);out=ROOT/'build/reference/be_aas_bspq3_complete';out.mkdir(parents=True,exist_ok=True)
 original=ROOT/'Quake-III-Arena-original-source/code/botlib/be_aas_bspq3.c';module=ROOT/'src/mq3/botlib/aas_bspq3.ml';text=module.read_text(encoding='utf-8')
 missing=[name for name in SYMBOLS if not re.search(r'function\s+'+re.escape(name)+r'\s*\(',text)]
 if missing:raise RuntimeError('missing be_aas_bspq3 symbols: '+', '.join(missing))
 inc=out/'be_aas_bspq3_complete_under_test.inc';inc.write_text(extract(original,ORACLE),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/be_aas_bspq3_complete_oracle.c';nativeExe=out/'be_aas_bspq3_complete_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4','/WX','/wd4100','/wd4244','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{nativeExe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
 native=run([nativeExe],out,log=out/'oracle.log');mini=run([build('tests/be_aas_bspq3_complete_oracle.ml','be_aas_bspq3_complete_oracle.exe')],ROOT/'build',log=out/'minilang.log')
 if normalize(native)!=normalize(mini):raise RuntimeError('be_aas_bspq3 unchanged-C mismatch\nnative: '+repr(native)+'\nmini: '+repr(mini))
 contracts=run([build('tests/be_aas_bspq3_complete_contracts.ml','be_aas_bspq3_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 17 complete be_aas_bspq3 contracts':raise RuntimeError(contracts)
 retail=run([build('tests/be_aas_bspq3_complete_retail_probe.ml','be_aas_bspq3_complete_retail_probe.exe'),data_root/'baseq3/pak0.pk3'],ROOT/'build',log=out/'retail.log').strip()
 if not retail.startswith('PASS: 3 retail be_aas_bspq3 checks'):raise RuntimeError(retail)
 paths=[original,module,ROOT/'src/mq3/botlib/aas_syscalls.ml',ROOT/'src/mq3/engine/local_qvm_match.ml',harness,ROOT/'tests/be_aas_bspq3_complete_oracle.ml',ROOT/'tests/be_aas_bspq3_complete_contracts.ml',ROOT/'tests/be_aas_bspq3_complete_retail_probe.ml']
 result={'passed':True,'symbols':len(SYMBOLS),'oracleFunctions':ORACLE,'differentialRecords':native.count('\n'),'contracts':17,'retail':retail,'data_root':str(data_root),'sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in paths}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {len(SYMBOLS)} be_aas_bspq3 symbols + {result['differentialRecords']} unchanged-C records + 17 contracts + retail");return 0
if __name__=='__main__':raise SystemExit(main())
