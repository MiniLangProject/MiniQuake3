#!/usr/bin/env python3
"""Complete ownership gate for the seven headless/null platform files."""
from __future__ import annotations
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

SOURCES=['code/null/mac_net.c','code/null/null_client.c','code/null/null_glimp.c','code/null/null_input.c','code/null/null_main.c','code/null/null_net.c','code/null/null_snddma.c']
EXPORTS=['macNetSymbols','nullClientSymbols','nullGlimpSymbols','nullInputSymbols','nullMainSymbols','nullNetSymbols','nullSoundSymbols']
PORT=ROOT/'src/mq3/platform/null_runtime.ml'
def exported(text,name):
    match=re.search(r'function\s+'+name+r'\(\)\s+return\s+\[(.*?)\]\s+end function',text,re.S)
    if not match: raise RuntimeError('missing '+name)
    return re.findall(r'"([^"]+)"',match.group(1))
def main():
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'))['files'];entries={e['source']:e for e in ledger};text=PORT.read_text(encoding='utf-8')
    for source,function in zip(SOURCES,EXPORTS):
        expected=entries[source]['symbol_candidates'];actual=exported(text,function)
        if actual!=expected: raise RuntimeError(f'{source}: expected {expected}, got {actual}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/null_runtime_contracts.ml','--output','null_runtime_contracts.exe'],cwd=ROOT,check=True)
    output=run([ROOT/'build/null_runtime_contracts.exe'],ROOT/'build',log=ROOT/'build/null_runtime_contracts.log').strip()
    if output!='PASS: 20 null platform contracts': raise RuntimeError(output)
    files=[ROOT/'Quake-III-Arena-original-source'/s for s in SOURCES]+[PORT,ROOT/'tests/null_runtime_contracts.ml']
    result={'passed':True,'files':7,'symbols':sum(len(entries[s]['symbol_candidates']) for s in SOURCES),'contracts':20,'scope':'Complete headless/null client, input, GL, sound, loopback network and bounded system-loop behavior for dedicated-server and platform-port builds.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    out=ROOT/'build/reference/null_platform';out.mkdir(parents=True,exist_ok=True);(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 7 null platform files + 64 symbols + 20 contracts')
if __name__=='__main__': main()
