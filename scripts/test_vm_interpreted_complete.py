#!/usr/bin/env python3
"""Complete vm_interpreted.c gate, including its debug helpers."""
from __future__ import annotations
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SOURCE=ROOT/'Quake-III-Arena-original-source/code/qcommon/vm_interpreted.c'
PORT=ROOT/'src/mq3/vm/interpreter.ml'
SYMBOLS=['VM_CallInterpreted','VM_Indent','VM_PrepareInterpreter','VM_StackTrace']

def build(source: str, output: str) -> None:
  subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)

def main()->int:
  original=SOURCE.read_text(encoding='utf-8');ported=PORT.read_text(encoding='utf-8')
  missing=[name for name in SYMBOLS if not re.search(r'\b'+name+r'\s*\(',original)]
  missing += [name for name in ('VM_Indent','VM_StackTrace') if not re.search(r'\bfunction\s+'+name+r'\s*\(',ported,re.I)]
  if missing:raise RuntimeError('vm_interpreted symbol mismatch: '+', '.join(missing))
  out=ROOT/'build/reference/vm_interpreted_complete';out.mkdir(parents=True,exist_ok=True)
  (out/'vm_interpreted_debug_under_test.inc').write_text(extract(SOURCE,['VM_Indent','VM_StackTrace']),encoding='utf-8',newline='\n')
  harness=ROOT/'tests/reference/vm_interpreted_debug_oracle.c';oracle=out/'oracle.exe'
  run(['cl','/nologo','/Od','/MT','/W4','/WX',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
  native=run([oracle],out,log=out/'oracle.log')
  build('tests/vm_interpreted_debug_oracle.ml','vm_interpreted_debug_oracle.exe')
  mini=run([ROOT/'build/vm_interpreted_debug_oracle.exe'],ROOT/'build',log=out/'minilang.log')
  if native!=mini:raise RuntimeError('vm debug differential mismatch\nC:\n'+native+'MiniLang:\n'+mini)
  build('tests/vm_interpreted_debug_contracts.ml','vm_interpreted_debug_contracts.exe')
  contracts=run([ROOT/'build/vm_interpreted_debug_contracts.exe'],ROOT/'build').strip()
  if contracts!='PASS: 8 VM interpreted debug contracts':raise RuntimeError(contracts)
  subprocess.run([sys.executable,ROOT/'scripts/test_vm.py'],cwd=ROOT,check=True)
  files=[SOURCE,PORT,harness,ROOT/'tests/vm_interpreted_debug_oracle.ml',ROOT/'tests/vm_interpreted_debug_contracts.ml']
  result={'passed':True,'symbols':4,'unchanged_c_records':len(native.splitlines()),'contracts':8,'scope':'All vm_interpreted.c symbols: loader/call interpreter plus exact indent and bounded stack-frame diagnostics.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
  (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
  print('PASS: 4/4 vm_interpreted symbols + 7 unchanged-C records + 8 native contracts + productive VM gate')
  return 0
if __name__=='__main__':raise SystemExit(main())
