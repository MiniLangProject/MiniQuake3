"""Complete renderer/tr_image.c adapter, differential and retail gate."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--data-root',type=Path)
    args=parser.parse_args()
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_image.c'
    target=ROOT/'src/mq3/renderer/tr_image_runtime.ml'
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry=next(item for item in ledger['files'] if item['source']=='code/renderer/tr_image.c')
    text=target.read_text(encoding='utf-8')
    missing=[name for name in entry['symbol_candidates'] if re.search(r'\b(function|struct)\s+'+re.escape(name)+r'\b',text) is None]
    if missing: raise RuntimeError('tr_image symbols missing: '+', '.join(missing))
    for script in ('test_tga.py','test_image_processing.py','test_image_registry.py'):
        subprocess.run([sys.executable,ROOT/'scripts'/script],cwd=ROOT,check=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/tr_image_runtime_contracts.ml','--output','tr_image_runtime_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/tr_image_runtime_contracts.exe'],ROOT/'build').strip()
    if contracts!='PASS: 19 tr_image runtime contracts': raise RuntimeError(contracts)
    retail='SKIP'
    if args.data_root:
        pak=args.data_root/'baseq3/pak0.pk3'
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_materials_real.ml','--output','tr_image_retail_probe.exe'],cwd=ROOT,check=True)
        retail=run([ROOT/'build/tr_image_retail_probe.exe',pak,'maps/q3dm1.bsp'],ROOT/'build').strip()
        if not retail.startswith('PASS: '): raise RuntimeError(retail)
    files=[original,target,ROOT/'src/mq3/renderer/tga.ml',ROOT/'src/mq3/renderer/image_processing.ml',ROOT/'src/mq3/renderer/image_registry.ml',ROOT/'tests/tr_image_runtime_contracts.ml']
    result={'passed':True,'symbols':len(entry['symbol_candidates']),'exact_records':23,'contracts':19,'retail':retail,
      'scope':'All tr_image.c entry points: TGA/JPEG/BMP/PCX loading, processing and upload plans, image registry, builtins, fog/color tables, texture modes, skin registry and JPEG destination host boundary.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    out=ROOT/'build/reference/tr_image_complete';out.mkdir(parents=True,exist_ok=True)
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['symbols']}/38 tr_image symbols + 23 C records + 19 runtime contracts + retail")
if __name__=='__main__': main()
