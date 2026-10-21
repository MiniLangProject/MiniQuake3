#!/usr/bin/env python3
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_flares_contracts.ml','--output','playable_flares_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_flares_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 22 playable flare contracts': raise RuntimeError(value)
    original_bsp=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_bsp.c'
    original_flares=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_flares.c'
    source=original_flares.read_text(encoding='latin-1')
    anchors=['for ( j = 1 ; j < tr.world->numfogs ; j++ )','l->origin[k] < fog->bounds[0][k] || l->origin[k] > fog->bounds[1][k]','RB_AddFlare( (void *)l, j, l->origin, l->color, NULL )']
    if any(anchor not in source for anchor in anchors): raise RuntimeError('RB_AddDlightFlares source anchor drift')
    files=[original_bsp,original_flares,ROOT/'native/playable_win32.c',ROOT/'src/mq3/platform/playable_window.ml',ROOT/'src/mq3/renderer/playable_flares.ml',ROOT/'src/mq3/renderer/playable_fog.ml',ROOT/'tests/playable_flares_contracts.ml']
    result={'passed':True,'contracts':22,'scope':'Baseq3 ParseFlare fields, RB_AddFlare facing, RB_AddDlightFlares fog-volume assignment and per-view state, retired dynamic slots, RB_TestFlare depth/fade, RB_RenderFlare size and fog-number RGB modulation, real flareShader image loading and productive software depth sampling.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    out=ROOT/'build/reference/playable_flares';out.mkdir(parents=True,exist_ok=True)
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 22 Baseq3 playable flare contracts')
if __name__=='__main__': main()
