#!/usr/bin/env python3
"""Complete portable ownership gate for the eight runtime-counted macOS headers."""
from __future__ import annotations
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

ITEMS=[('mouseDeltaSymbols','code/macosx/CGMouseDeltaFix.h'),('privateApiSymbols','code/macosx/CGPrivateAPI.h'),('controllerSymbols','code/macosx/Q3Controller.h'),('displaySymbols','code/macosx/macosx_display.h'),('glimpHeaderSymbols','code/macosx/macosx_glimp.h'),('localSymbols','code/macosx/macosx_local.h'),('qglSymbols','code/macosx/macosx_qgl.h'),('timerSymbols','code/macosx/macosx_timers.h')]
PORT=ROOT/'src/mq3/platform/macosx_headers.ml'
def literal_export(text,name):
    match=re.search(r'function\s+'+name+r'\(\)\s+return\s+\[(.*?)\]\s+end function',text,re.S)
    return None if not match else re.findall(r'"([^"]+)"',match.group(1))
def main():
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'))['files'];entries={e['source']:e for e in ledger};text=PORT.read_text(encoding='utf-8')
    aliases=re.findall(r'\["(qgl[^"]+)","gl[^"]+"\]',(ROOT/'src/mq3/renderer/qgl_linked.ml').read_text(encoding='utf-8'))
    expected_qgl=['_glGetError']
    for name in aliases:
        expected_qgl.append(name)
        if name=='qglGetString': expected_qgl.extend(['qglGetTexEnvfv','qglGetTexEnviv'])
    for function,source in ITEMS:
        entry=entries[source]
        if entry['status']!='ported' or str(PORT.relative_to(ROOT)).replace('\\','/') not in entry['target']: raise RuntimeError(source+': incomplete ownership')
        if not any(mapping.get('covers_all_candidates') is True for mapping in entry['symbol_mapping']): raise RuntimeError(source+': missing complete symbol mapping')
        actual=expected_qgl if function=='qglSymbols' else literal_export(text,function)
        if actual is None: raise RuntimeError(source+': missing header surface')
        if entry['symbol_candidates'] and actual!=entry['symbol_candidates']: raise RuntimeError(f'{source}: expected {len(entry["symbol_candidates"])}, got {len(actual)}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/macosx_headers_contracts.ml','--output','macosx_headers_contracts.exe'],cwd=ROOT,check=True)
    output=run([ROOT/'build/macosx_headers_contracts.exe'],ROOT/'build',log=ROOT/'build/macosx_headers_contracts.log').strip()
    if output!='PASS: 24 macOS header contracts': raise RuntimeError(output)
    sources=[source for function,source in ITEMS];files=[ROOT/'Quake-III-Arena-original-source'/s for s in sources]+[PORT,ROOT/'tests/macosx_headers_contracts.ml']
    out=ROOT/'build/reference/macosx_headers';out.mkdir(parents=True,exist_ok=True)
    result={'passed':True,'files':8,'symbols':sum(len(entries[s]['symbol_candidates']) for s in sources),'contracts':24,'scope':'Complete portable ownership for the runtime-counted macOS mouse, private event ABI, controller, display/gamma, GL context, QGL wrapper and timer headers. Cocoa/CoreGraphics host calls remain abstracted on Windows.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: 8 macOS header files + {result["symbols"]} symbols + 24 contracts')
if __name__=='__main__': main()
