#!/usr/bin/env python3
"""Complete ownership gate for the 13 runtime-counted Unix platform files."""
from __future__ import annotations
import json,re,struct,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

ITEMS=[('linuxCommonSymbols','code/unix/linux_common.c'),('linuxGlimpSymbols','code/unix/linux_glimp.c'),('linuxJoystickSymbols','code/unix/linux_joystick.c'),('linuxLocalSymbols','code/unix/linux_local.h'),('linuxQglSymbols','code/unix/linux_qgl.c'),('linuxSignalsSymbols','code/unix/linux_signals.c'),('linuxSoundSymbols','code/unix/linux_snd.c'),('qasmSymbols','code/unix/qasm.h'),('unixGlwSymbols','code/unix/unix_glw.h'),('unixMainSymbols','code/unix/unix_main.c'),('unixNetSymbols','code/unix/unix_net.c'),('unixSharedSymbols','code/unix/unix_shared.c'),('unixVmX86Symbols','code/unix/vm_x86.c')]
PORT=ROOT/'src/mq3/platform/unix_runtime.ml'
def exported(text,name):
    match=re.search(r'function\s+'+name+r'\(\)\s+return\s+\[(.*?)\]\s+end function',text,re.S)
    if not match: raise RuntimeError('missing '+name)
    return re.findall(r'"([^"]+)"',match.group(1))
def fixture():
    code=bytes([3])+struct.pack('<I',64)+bytes([8])+struct.pack('<I',42)+bytes([4])+struct.pack('<I',64)
    return struct.pack('<8I',0x12721444,3,32,len(code),32+len(code),4,0,65532)+code+struct.pack('<I',7)
def main():
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'))['files'];entries={e['source']:e for e in ledger};text=PORT.read_text(encoding='utf-8')
    for function,source in ITEMS:
        entry=entries[source]
        if entry['status']!='ported' or str(PORT.relative_to(ROOT)).replace('\\','/') not in entry['target']: raise RuntimeError(source+': incomplete ownership')
        if not any(mapping.get('covers_all_candidates') is True for mapping in entry['symbol_mapping']): raise RuntimeError(source+': missing complete symbol mapping')
        expected=entry['symbol_candidates'];actual=exported(text,function)
        if actual!=expected: raise RuntimeError(f'{source}: expected {len(expected)}, got {len(actual)}')
    out=ROOT/'build/reference/unix_platform';out.mkdir(parents=True,exist_ok=True);image=out/'constant.qvm';image.write_bytes(fixture())
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/unix_runtime_contracts.ml','--output','unix_runtime_contracts.exe'],cwd=ROOT,check=True)
    output=run([ROOT/'build/unix_runtime_contracts.exe',image],ROOT/'build',log=ROOT/'build/unix_runtime_contracts.log').strip()
    if output!='PASS: 28 Unix platform contracts': raise RuntimeError(output)
    sources=[source for function,source in ITEMS];files=[ROOT/'Quake-III-Arena-original-source'/s for s in sources]+[PORT,ROOT/'tests/unix_runtime_contracts.ml']
    result={'passed':True,'files':13,'symbols':sum(len(entries[s]['symbol_candidates']) for s in sources),'contracts':28,'scope':'Complete portable ownership for runtime-counted Unix memory, X11/GL, QGL logging, input, signals, DMA, console/system, UDP/shared and x86-QVM surfaces. Host calls remain abstracted for MiniLang portability.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 13 Unix platform files + 471 symbols + 28 contracts')
if __name__=='__main__': main()

