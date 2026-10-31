#!/usr/bin/env python3
"""Verify complete semantic ownership of the three architecture QVM JIT files."""
from __future__ import annotations
import json,struct,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

SOURCES=['code/qcommon/vm_x86.c','code/qcommon/vm_ppc.c','code/qcommon/vm_ppc_new.c']
EXPORTS={'code/qcommon/vm_x86.c':'x86Symbols','code/qcommon/vm_ppc.c':'ppcSymbols','code/qcommon/vm_ppc_new.c':'ppcNewSymbols'}
PORT=ROOT/'src/mq3/vm/jit_compat.ml'

def fixture():
    code=bytes([3])+struct.pack('<I',64)+bytes([8])+struct.pack('<I',42)+bytes([4])+struct.pack('<I',64)
    return struct.pack('<8I',0x12721444,3,32,len(code),32+len(code),4,0,65532)+code+struct.pack('<I',7)
def exported(text,name):
    import re
    match=re.search(r'function\s+'+name+r'\(\)\s+return\s+\[(.*?)\]\s+end function',text,re.S)
    if not match: raise RuntimeError('missing '+name)
    return re.findall(r'"([^"]+)"',match.group(1))
def main():
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'))['files']
    entries={entry['source']:entry for entry in ledger}
    text=PORT.read_text(encoding='utf-8')
    for source in SOURCES:
        expected=entries[source]['symbol_candidates']
        actual=exported(text,EXPORTS[source])
        if actual!=expected: raise RuntimeError(f'{source}: expected {expected}, got {actual}')
    out=ROOT/'build/reference/vm_jit_compat';out.mkdir(parents=True,exist_ok=True)
    image=out/'constant.qvm';image.write_bytes(fixture())
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_jit_compat_contracts.ml','--output','vm_jit_compat_contracts.exe'],cwd=ROOT,check=True)
    output=run([ROOT/'build/vm_jit_compat_contracts.exe',image],ROOT/'build',log=ROOT/'build/vm_jit_compat_contracts.log').strip()
    if output!='PASS: 14 portable JIT compatibility contracts': raise RuntimeError(output)
    files=[ROOT/'Quake-III-Arena-original-source'/source for source in SOURCES]+[PORT,ROOT/'src/mq3/vm/runtime.ml',ROOT/'tests/vm_jit_compat_contracts.ml']
    result={'passed':True,'source_files':3,'symbols':sum(len(entries[s]['symbol_candidates']) for s in SOURCES),'contracts':14,'execution':'memory-safe predecoded QVM plan; no writable executable memory','architectures':['x86','ppc','ppc_new','portable'],'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 3 QVM JIT backends + 47 source symbols + 14 contracts')
if __name__=='__main__': main()
