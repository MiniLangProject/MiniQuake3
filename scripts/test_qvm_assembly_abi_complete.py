#!/usr/bin/env python3
"""Exact ownership gate for the cgame and qagame q3asm import tables."""
from __future__ import annotations
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

PORT=ROOT/'src/mq3/vm/qvm_assembly_abi.ml'
ORIGINAL=ROOT/'Quake-III-Arena-original-source/code'

def pairs(path:Path):
    return [(name,int(value)) for name,value in re.findall(r'(?m)^equ\s+([A-Za-z_]\w*)\s+(-?\d+)\s*$',path.read_text(encoding='latin1'))]
def exported(text:str,function:str,strings:bool):
    match=re.search(r'function\s+'+re.escape(function)+r'\(\)\s+return\s+\[(.*?)\]\s+end function',text,re.S)
    if not match: raise RuntimeError('missing inventory '+function)
    return re.findall(r'"([^"]+)"',match.group(1)) if strings else [int(v) for v in re.findall(r'-?\d+',match.group(1))]
def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main():
    text=PORT.read_text(encoding='utf-8')
    inventories={}
    for key,rel in [('cgame','cgame/cg_syscalls.asm'),('game','game/g_syscalls.asm')]:
        expected=pairs(ORIGINAL/rel);inventories[key]=expected
        if exported(text,key+'Names',True)!=[n for n,v in expected]: raise RuntimeError(key+' assembly names differ')
        if exported(text,key+'Ordinals',False)!=[v for n,v in expected]: raise RuntimeError(key+' assembly ordinals differ')
    if [v for n,v in inventories['game']].count(-546)!=2: raise RuntimeError('historical duplicate -546 lost')
    functions=set()
    for path in (ROOT/'src/mq3').rglob('*.ml'):
        functions.update(re.findall(r'(?m)^function\s+([A-Za-z_]\w*)\s*\(',path.read_text(encoding='utf-8',errors='ignore')))
    assembly_only={'trap_CM_LoadModel','trap_BotLibLoadSource','trap_BotLibFreeSource','trap_BotLibReadToken','trap_BotLibSourceFileAndLine'}
    missing=sorted({n for values in inventories.values() for n,v in values if n.startswith('trap_') and n not in functions and n not in assembly_only})
    if missing: raise RuntimeError('unowned trap wrappers: '+', '.join(missing))
    output=run([build('tests/qvm_assembly_abi_contracts.ml','qvm_assembly_abi_contracts.exe')],ROOT/'build',log=ROOT/'build/qvm_assembly_abi_contracts.log').strip()
    if output!='PASS: 10 QVM assembly ABI contracts': raise RuntimeError(output)
    files=[ORIGINAL/'cgame/cg_syscalls.asm',ORIGINAL/'game/g_syscalls.asm',PORT,ROOT/'tests/qvm_assembly_abi_contracts.ml',
           ROOT/'src/mq3/client/cgame_syscalls.ml',ROOT/'src/mq3/game/syscalls.ml',ROOT/'src/mq3/vm/syscall_cgame.ml',ROOT/'src/mq3/vm/syscall_qagame.ml']
    result={'passed':True,'cgame_symbols':len(inventories['cgame']),'qagame_symbols':len(inventories['game']),'assembly_only_traps':sorted(assembly_only),'historical_duplicate_546':2,'contracts':10,'scope':'Exact q3asm symbol and negative-ordinal ownership for cgame and qagame, tied to productive native wrapper and VM dispatch modules.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    out=ROOT/'build/reference/qvm_assembly_abi';out.mkdir(parents=True,exist_ok=True);(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {len(inventories['cgame'])} cgame + {len(inventories['game'])} qagame assembly imports + 10 contracts")
if __name__=='__main__': main()
