#!/usr/bin/env python3
"""Complete renderer header ABI/declaration, GL dispatch and Retail gate."""
from __future__ import annotations
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

def clean(text:str)->str:
 text=re.sub(r'/\*.*?\*/',' ',text,flags=re.S)
 return re.sub(r'//[^\n]*',' ',text)
def build(source:str,output:str)->Path:
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output
def invoke(script:str,*args:object)->str:
 result=subprocess.run([sys.executable,ROOT/'scripts'/script,*map(str,args)],cwd=ROOT,check=True,text=True,capture_output=True,timeout=600)
 return result.stdout.strip()
def quoted(path:Path)->set[str]: return set(re.findall(r'"([^"\\]*(?:\\.[^"\\]*)*)"',path.read_text(encoding='utf-8')))
def main()->int:
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,default=Path('D:/Quake3'));args=parser.parse_args()
 hroot=ROOT/'Quake-III-Arena-original-source/code/renderer'
 headers={name:hroot/name for name in ('tr_public.h','tr_local.h','qgl.h','qgl_linked.h')}
 ports={'tr_public.h':ROOT/'src/mq3/renderer/tr_public.ml','tr_local.h':ROOT/'src/mq3/renderer/tr_local.ml','qgl.h':ROOT/'src/mq3/renderer/qgl.ml','qgl_linked.h':ROOT/'src/mq3/renderer/qgl_linked.ml'}
 # Public import/export tables, excluding nested callback argument names.
 public=clean(headers['tr_public.h'].read_text(encoding='latin1'));pub_names=[]
 for body,_ in re.findall(r'typedef\s+struct\s*\{(.*?)\}\s*(ref(?:export|import)_t)\s*;',public,re.S):
  pub_names += [x for x in re.findall(r'\(\s*(?:QDECL\s*)?\*\s*(\w+)\s*\)',body) if x not in ('cmd','drawPoly')]
 missing=sorted(set(pub_names+['GetRefAPI'])-quoted(ports['tr_public.h']))
 # Type spellings are represented by RefExport/RefImport; check them explicitly.
 ptxt=ports['tr_public.h'].read_text(encoding='utf-8')
 if not all(x in ptxt for x in ('struct RefExport','struct RefImport','const REF_API_VERSION=8')): missing += ['refexport_t/refimport_t/REF_API_VERSION']
 if missing: raise RuntimeError(f'tr_public.h missing {missing}')
 # Every conditional qgl pointer/type and every linked alias is retained.
 qtext=clean(headers['qgl.h'].read_text(encoding='latin1'))
 qnames=set(re.findall(r'\*\s*(q(?:gl|wgl|fx|glX)\w+)\s*\)',qtext));qtypes=set(re.findall(r'typedef\s+[^;]*?\*\s*(PFN\w+)\s*\)',qtext,re.S));qport=quoted(ports['qgl.h'])
 if qnames-qport or qtypes-qport: raise RuntimeError(f'qgl.h missing entrypoints={sorted(qnames-qport)} types={sorted(qtypes-qport)}')
 aliases=re.findall(r'^\s*#\s*define\s+(qgl\w+)\s+(gl\w+)\s*$',headers['qgl_linked.h'].read_text(encoding='latin1'),re.M);lport=quoted(ports['qgl_linked.h'])
 missing_alias=[f'{a}={b}' for a,b in aliases if a not in lport or b not in lport]
 if missing_alias: raise RuntimeError(f'qgl_linked.h missing {missing_alias}')
 # Complete tr_local declaration inventory: macros, enum members, typedefs, functions and globals.
 local=clean(headers['tr_local.h'].read_text(encoding='latin1'));macros=set(re.findall(r'^\s*#\s*define\s+([A-Za-z_]\w*)',local,re.M));types=set(re.findall(r'}\s*([A-Za-z_]\w*)\s*;',local))
 types.update(m.group(2) for m in re.finditer(r'typedef\s+([^;{}]+?)\s+([A-Za-z_]\w*)\s*;',local))
 enums=set()
 for body in re.findall(r'typedef\s+enum\s*\{(.*?)\}\s*\w+\s*;',local,re.S):
  for part in body.split(','):
   match=re.search(r'\b([A-Za-z_]\w*)\b',part)
   if match: enums.add(match.group(1))
 funcs=[]
 for statement in local.split(';'):
  if '(' not in statement or ')' not in statement: continue
  match=re.search(r'\b([A-Za-z_]\w*)\s*\([^()]*\)\s*$',statement,re.S)
  if match and not statement.lstrip().startswith('typedef'): funcs.append(match.group(1))
 globals_=[]
 for statement in local.split(';'):
  if not re.search(r'\bextern\b',statement): continue
  pointer=re.search(r'\(\s*\*\s*([A-Za-z_]\w*)',statement)
  if pointer: globals_.append(pointer.group(1));continue
  if '(' in statement: continue
  match=re.search(r'([A-Za-z_]\w*)(?:\s*\[[^]]*\])?\s*$',statement.strip())
  if match: globals_.append(match.group(1))
 inventory=macros|types|enums|set(funcs)|set(globals_);ltext=ports['tr_local.h'].read_text(encoding='utf-8');lquoted=quoted(ports['tr_local.h']);missing_local=sorted(x for x in inventory if x not in lquoted and x not in ltext)
 if missing_local: raise RuntimeError(f'tr_local.h missing {missing_local}')
 # Verify productive consumers use all four facades.
 wiring={ROOT/'src/mq3/renderer/tr_init.ml':'mq3.renderer.tr_public',ROOT/'src/mq3/renderer/tr_backend_runtime.ml':'mq3.renderer.tr_local',ROOT/'src/mq3/platform/win_glimp_runtime.ml':'mq3.renderer.qgl'}
 for path,needle in wiring.items():
  if needle not in path.read_text(encoding='utf-8'): raise RuntimeError(f'missing productive wiring: {path} -> {needle}')
 out=ROOT/'build/reference/renderer_headers';out.mkdir(parents=True,exist_ok=True)
 oracle=out/'renderer_headers_oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX','/DWIN32',ROOT/'tests/reference/renderer_headers_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n');actual=run([build('tests/renderer_headers_oracle.ml','renderer_headers_oracle_ml.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual:
  (out/'expected.txt').write_text(expected,encoding='utf-8');(out/'actual.txt').write_text(actual,encoding='utf-8');raise RuntimeError('renderer header unchanged-C mismatch')
 contracts=run([build('tests/renderer_headers_contracts.ml','renderer_headers_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 24 renderer header contracts': raise RuntimeError(contracts)
 pak=args.data_root/'baseq3/pak0.pk3'
 if not pak.is_file(): raise RuntimeError(f'Retail pak0.pk3 not found: {pak}')
 qvm=invoke('test_qvm_renderer_traps.py','--pak',pak)
 world=invoke('test_tr_world_complete.py','--data-root',args.data_root)
 files=list(headers.values())+list(ports.values())+[ROOT/'src/mq3/renderer/tr_init.ml',ROOT/'src/mq3/renderer/tr_backend_runtime.ml',ROOT/'src/mq3/platform/win_glimp_runtime.ml',ROOT/'tests/reference/renderer_headers_oracle.c',ROOT/'tests/renderer_headers_oracle.ml',ROOT/'tests/renderer_headers_contracts.ml']
 result={'passed':True,'tr_public_members':len(pub_names),'qgl_entrypoints':len(qnames),'qgl_proc_types':len(qtypes),'linked_aliases':len(aliases),'tr_local_macros':len(macros),'tr_local_enums':len(enums),'tr_local_types':len(types),'tr_local_functions':len(set(funcs)),'tr_local_globals':len(set(globals_)),'exact_records':len(expected.splitlines()),'contracts':24,'retail_qvm':qvm,'retail_world':world.splitlines()[-1],'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: 4 renderer headers / {len(qnames)} GL entrypoints + {len(aliases)} linked aliases + {len(types)} local types + {len(set(funcs))} local functions + 24 contracts + Retail QVM/BSP')
 return 0
if __name__=='__main__': raise SystemExit(main())
