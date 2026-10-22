#!/usr/bin/env python3
"""Complete qcommon/common.c symbol, unchanged-C and native contract gate."""
from __future__ import annotations
import json,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

ORACLE=['Com_StringContains','Com_Filter','Com_FilterPath','Com_HashKey','Q_acos','Field_Clear']
def build(source:str,output:str)->Path:
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def symbols()->list[str]:
 ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'));entry=next(value for value in ledger['files'] if value.get('source')=='code/qcommon/common.c');return entry['symbol_candidates']
def main()->int:
 py_compile.compile(__file__,doraise=True);out=ROOT/'build/reference/common_complete';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/qcommon/common.c';module=ROOT/'src/mq3/qcommon/common.ml';names=symbols();text=module.read_text(encoding='utf-8');missing=[name for name in names if not re.search(r'function\s+'+re.escape(name)+r'\s*\(',text)]
 if missing:raise RuntimeError('missing common symbols: '+', '.join(missing))
 inc=out/'common_complete_under_test.inc';inc.write_text(extract(original,ORACLE),encoding='utf-8',newline='\n');harness=ROOT/'tests/reference/common_complete_oracle.c';nativeExe=out/'common_complete_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{nativeExe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([nativeExe],out,log=out/'oracle.log');mini=run([build('tests/common_complete_oracle.ml','common_complete_oracle.exe')],ROOT/'build',log=out/'minilang.log')
 # Both use the same float32 acos result; the C harness deliberately prints
 # nine significant digits while MiniLang's str() prints a wider decimal.
 nativeLines=native.splitlines();miniLines=mini.splitlines();nativeAcos=next(line for line in nativeLines if line.startswith('acos='));miniAcos=next(line for line in miniLines if line.startswith('acos='));nativeValues=[float(value) for value in nativeAcos[5:].split(',')];miniValues=[float(value) for value in miniAcos[5:].split(',')]
 if len(nativeLines)!=len(miniLines) or [line for line in nativeLines if not line.startswith('acos=')]!=[line for line in miniLines if not line.startswith('acos=')] or any(abs(a-b)>1e-7 for a,b in zip(nativeValues,miniValues)):raise RuntimeError('common unchanged-C mismatch\nnative: '+repr(native)+'\nmini: '+repr(mini))
 contracts=run([build('tests/common_complete_contracts.ml','common_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 40 complete common runtime contracts':raise RuntimeError(contracts)
 sources=[original,module,harness,ROOT/'tests/common_complete_oracle.ml',ROOT/'tests/common_complete_contracts.ml']
 result={'passed':True,'symbols':len(names),'differentialRecords':native.count('\n'),'oracleFunctions':ORACLE,'contracts':40,'scope':'Full common.c native adapter: redirect/print/error, startup, filters/hash/time, zone+hunk lifecycle, journal/push events, CD key, init/frame/config/shutdown, byte primitives and completion.','hostBoundaries':'OS clock/calendar/events/files/process termination and platform subsystem init/shutdown remain typed services. Native C pointer allocator layout is represented by checked managed allocations.','sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in sources}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {len(names)} common.c symbols + {result['differentialRecords']} unchanged-C records + 40 contracts");return 0
if __name__=='__main__':raise SystemExit(main())
