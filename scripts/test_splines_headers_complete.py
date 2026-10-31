#!/usr/bin/env python3
"""Complete ownership gate for the eight runtime-counted spline headers."""
from __future__ import annotations
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

SOURCES=['code/splines/math_angles.h','code/splines/math_matrix.h','code/splines/math_quaternion.h','code/splines/math_vector.h','code/splines/q_shared.h','code/splines/splines.h','code/splines/util_list.h','code/splines/util_str.h']
EXPORTS=['mathAnglesSymbols','mathMatrixSymbols','mathQuaternionSymbols','mathVectorSymbols','qSharedSymbols','splinesSymbols','utilListSymbols','utilStrSymbols']
PORT=ROOT/'src/mq3/splines/headers.ml'
def exported(text,name):
    match=re.search(r'function\s+'+name+r'\(\)\s+return\s+\[(.*?)\]\s+end function',text,re.S)
    if not match: raise RuntimeError('missing '+name)
    return re.findall(r'"([^"]+)"',match.group(1))
def main():
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'))['files'];entries={e['source']:e for e in ledger};text=PORT.read_text(encoding='utf-8')
    for source,function in zip(SOURCES,EXPORTS):
        expected=entries[source]['symbol_candidates'];actual=exported(text,function)
        if actual!=expected: raise RuntimeError(f'{source}: expected {expected}, got {actual}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/splines_headers_contracts.ml','--output','splines_headers_contracts.exe'],cwd=ROOT,check=True)
    output=run([ROOT/'build/splines_headers_contracts.exe'],ROOT/'build',log=ROOT/'build/splines_headers_contracts.log').strip()
    if output!='PASS: 20 spline header contracts': raise RuntimeError(output)
    files=[ROOT/'Quake-III-Arena-original-source'/s for s in SOURCES]+[PORT,ROOT/'tests/splines_headers_contracts.ml']
    result={'passed':True,'headers':8,'symbols':sum(len(entries[s]['symbol_candidates']) for s in SOURCES),'contracts':20,'scope':'Complete public spline header ownership: vectors, angles, quaternions, matrices, bounds, generic lists and strings. The standalone editor/rendering tool remains outside the playable Windows runtime.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    out=ROOT/'build/reference/splines_headers';out.mkdir(parents=True,exist_ok=True);(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 8 spline headers + 50 symbols + 20 contracts')
if __name__=='__main__': main()
