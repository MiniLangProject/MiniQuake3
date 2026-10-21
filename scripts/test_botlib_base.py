#!/usr/bin/env python3
"""Differential tests for the native MiniLang l_crc.c/l_libvar.c ports."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

CRC_FUNCTIONS=['CRC_Init','CRC_ProcessByte','CRC_Value','CRC_ProcessString','CRC_ContinueProcessString']
LIBVAR_FUNCTIONS=['LibVarStringValue','LibVarAlloc','LibVarDeAlloc','LibVarDeAllocAll','LibVarGet','LibVarGetString','LibVarGetValue','LibVar','LibVarString','LibVarValue','LibVarSet','LibVarChanged','LibVarSetNotModified']

def main():
    out=ROOT/'build/reference/botlib_base';out.mkdir(parents=True,exist_ok=True)
    crc_source=ROOT/'Quake-III-Arena-original-source/code/botlib/l_crc.c';libvar_source=ROOT/'Quake-III-Arena-original-source/code/botlib/l_libvar.c'
    (out/'l_crc_under_test.inc').write_text(extract(crc_source,CRC_FUNCTIONS),encoding='utf-8',newline='\n')
    (out/'l_libvar_under_test.inc').write_text(extract(libvar_source,LIBVAR_FUNCTIONS),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/botlib_base_oracle.c';native=out/'botlib_base_oracle.exe'
    run(['cl','/nologo','/O2','/fp:strict','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    observed=run([native],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/botlib_base_oracle.ml','--output','botlib_base_oracle.exe'],cwd=ROOT,check=True)
    actual=run([ROOT/'build/botlib_base_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if observed!=actual:
        aa=observed.splitlines();bb=actual.splitlines()
        for index in range(max(len(aa),len(bb))):
            a=aa[index] if index<len(aa) else '<missing>';b=bb[index] if index<len(bb) else '<missing>'
            if a!=b: raise RuntimeError(f'botlib base mismatch at record {index+1}\nnative: {a}\nmini:   {b}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/botlib_base_contracts.ml','--output','botlib_base_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/botlib_base_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 18 botlib base contracts': raise RuntimeError(contracts)
    result={'passed':True,'records':len(observed.splitlines()),'contracts':18,
      'oracle':'Unchanged extracted Baseq3 botlib/l_crc.c and l_libvar.c function bodies with allocation/import stubs.',
      'sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in [crc_source,libvar_source,harness,ROOT/'src/mq3/botlib/crc16.ml',ROOT/'src/mq3/botlib/lib_variables.ml',ROOT/'src/mq3/botlib/lifecycle_runtime.ml']}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: {result["records"]} exact Baseq3 botlib-base records + 18 contracts')
if __name__=='__main__': main()
