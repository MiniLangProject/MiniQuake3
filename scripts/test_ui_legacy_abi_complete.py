#!/usr/bin/env python3
"""Complete ownership gate for the six remaining code/ui ABI/build files."""
from __future__ import annotations
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

SOURCE=ROOT/'Quake-III-Arena-original-source/code/ui'
PORT=ROOT/'src/mq3/client/ui_legacy_abi.ml'

def unique(values): return list(dict.fromkeys(values))
def exported(text,function):
    match=re.search(r'function\s+'+re.escape(function)+r'\(\)\s+return\s+\[(.*?)\]\s+end function',text,re.S)
    if not match: raise RuntimeError('missing inventory '+function)
    return re.findall(r'"([^"]+)"',match.group(1))
def header_inventory(text):
    defines=unique(re.findall(r'^#define\s+([A-Za-z_][A-Za-z0-9_]*)',text,re.M))
    types=unique(re.findall(r'}\s*([A-Za-z_][A-Za-z0-9_]*)\s*;',text)+re.findall(r'typedef\s+(?:[^;{}]|\([^;]*\))+?\s+([A-Za-z_][A-Za-z0-9_]*)\s*;',text))
    funcs=unique(re.findall(r'(?m)^(?:extern\s+)?[A-Za-z_][\w\s*]*?\b([A-Za-z_][A-Za-z0-9_]*)\s*\([^;{}]*\)\s*;',text))
    globals_=unique(re.findall(r'(?m)^extern\s+[^;(\n]+?\b([A-Za-z_][A-Za-z0-9_]*)\s*(?:\[[^;]*\])?\s*;',text))
    return defines,types,funcs,globals_
def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main():
    port=PORT.read_text(encoding='utf-8')
    key=(SOURCE/'keycodes.h').read_text(encoding='latin1')
    public=(SOURCE/'ui_public.h').read_text(encoding='latin1')
    local=(SOURCE/'ui_local.h').read_text(encoding='latin1')
    shared=(SOURCE/'ui_shared.h').read_text(encoding='latin1')
    asm=(SOURCE/'ui_syscalls.asm').read_text(encoding='latin1')
    expected_key=unique(re.findall(r'\b(K_[A-Z0-9_]+)\b',key))
    imports=unique(re.findall(r'\b(UI_[A-Z][A-Z0-9_]+)\b',public[public.index('typedef enum {'):public.index('} uiImport_t')]))
    rest=public[public.index('} uiImport_t'):]; menus=unique(re.findall(r'\b(UIMENU_[A-Z0-9_]+)\b',rest)); exports=unique(re.findall(r'\b(UI_[A-Z][A-Z0-9_]+)\b',rest[rest.index('typedef enum {'):rest.index('} uiExport_t')]))
    sorts=unique(re.findall(r'^#define\s+(SORT_[A-Z0-9_]+)',public,re.M))
    checks={'keyNames':expected_key,'publicImportNames':imports,'publicMenuNames':menus,'publicExportNames':exports,'publicSortNames':sorts}
    for prefix,text in [('local',local),('shared',shared)]:
        values=header_inventory(text)
        for suffix,value in zip(('DefineNames','TypeNames','FunctionNames','GlobalNames'),values): checks[prefix+suffix]=value
    for function,expected in checks.items():
        actual=exported(port,function)
        if actual!=expected: raise RuntimeError(f'{function} inventory mismatch expected={len(expected)} actual={len(actual)}')
    pairs=[(name,int(value)) for name,value in re.findall(r'(?m)^equ\s+([A-Za-z_][A-Za-z0-9_]*)\s+(-?\d+)\s*$',asm)]
    if exported(port,'assemblyNames')!=[p[0] for p in pairs]: raise RuntimeError('assembly symbol inventory mismatch')
    ordinal_match=re.search(r'function assemblyOrdinals\(\) return \[(.*?)\] end function',port,re.S)
    ordinals=[int(v) for v in re.findall(r'-?\d+',ordinal_match.group(1))] if ordinal_match else []
    if ordinals!=[p[1] for p in pairs]: raise RuntimeError('assembly ordinal inventory mismatch')
    util=(SOURCE/'ui_util.c').read_text(encoding='latin1')
    if re.search(r'(?m)^\w[^;\n{}]*?\b[A-Za-z_]\w*\s*\([^;{}]*?\)\s*\{',util): raise RuntimeError('ui_util.c unexpectedly gained runtime code')
    syscall=(ROOT/'src/mq3/client/ui_syscalls_missionpack.ml').read_text(encoding='utf-8')
    for name,value in [('UI_CM_LOADMODEL',30),('UI_FS_SEEK',86),('UI_SET_PBCLSTATUS',87)]:
        if not re.search(rf'const\s+{name}\s*=\s*{value}\b',syscall): raise RuntimeError('missing public import '+name)
    output=run([build('tests/ui_legacy_abi_contracts.ml','ui_legacy_abi_contracts.exe')],ROOT/'build',log=ROOT/'build/ui_legacy_abi_contracts.log').strip()
    if output!='PASS: 12 legacy UI ABI contracts': raise RuntimeError(output)
    files=[SOURCE/name for name in ('keycodes.h','ui_local.h','ui_public.h','ui_shared.h','ui_syscalls.asm','ui_util.c')]+[PORT,ROOT/'src/mq3/client/ui_syscalls_missionpack.ml',ROOT/'tests/ui_legacy_abi_contracts.ml']
    result={'passed':True,'files':6,'keycodes':len(expected_key),'public_imports':len(imports),'assembly_symbols':len(pairs),'local_header_symbols':sum(len(v) for v in header_inventory(local)),'shared_header_symbols':sum(len(v) for v in header_inventory(shared)),'contracts':12,'scope':'Complete static and executable ABI ownership for the remaining legacy Missionpack code/ui headers, QVM assembly imports and intentionally empty ui_util translation unit. Existing ui_shared, missionpack UI and syscall runtimes own behavior.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    out=ROOT/'build/reference/ui_legacy_abi';out.mkdir(parents=True,exist_ok=True);(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: 6 legacy UI files + {len(expected_key)} keys + {len(imports)} imports + {len(pairs)} assembly symbols + 12 contracts")
if __name__=='__main__': main()
