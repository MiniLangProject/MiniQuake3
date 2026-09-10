#!/usr/bin/env python3
"""Build muzzle-flash contracts and audit Baseq3 source anchors and retail MD3s."""
from __future__ import annotations
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

def build(source: str, output: str) -> None:
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)

def main() -> int:
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args()
    source_path=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_weapons.c'
    header_path=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_local.h'
    source=source_path.read_text(encoding='latin-1');header=header_path.read_text(encoding='latin-1')
    if not re.search(r'#define\s+MUZZLE_FLASH_TIME\s+20',header): raise RuntimeError('MUZZLE_FLASH_TIME source anchor drift')
    if 'COM_StripExtension( path, path );\n\tstrcat( path, "_flash.md3" );' not in source: raise RuntimeError('flash MD3 registration source anchor drift')
    if 'weaponNum == WP_LIGHTNING || weaponNum == WP_GAUNTLET' not in source: raise RuntimeError('continuous flash source anchor drift')
    output=ROOT/'build/reference/playable_muzzle_flash';output.mkdir(parents=True,exist_ok=True)
    build('tests/playable_muzzle_flash_contracts.ml','playable_muzzle_flash_contracts.exe')
    contracts=run([ROOT/'build/playable_muzzle_flash_contracts.exe'],ROOT/'build',log=output/'contracts.log').strip()
    if contracts!='PASS: 27 playable muzzle-flash contracts': raise RuntimeError(contracts)
    retail=None
    if args.pak:
      build('tests/playable_muzzle_flash_retail_probe.ml','playable_muzzle_flash_retail_probe.exe')
      retail=run([ROOT/'build/playable_muzzle_flash_retail_probe.exe',args.pak.resolve()],ROOT/'build',log=output/'retailRetail.log',timeout=240).strip()
      if not retail.startswith('PASS: retail muzzle flashes 9 weapons / '): raise RuntimeError(retail)
    files=[ROOT/'src/mq3/client/playable_muzzle_flash.ml',ROOT/'src/mq3/client/playable_item_models.ml',ROOT/'tests/playable_muzzle_flash_contracts.ml',ROOT/'tests/playable_muzzle_flash_retail_probe.ml',source_path,header_path]
    report={'passed':True,'contracts':27,'retail':retail,'scope':'Retail flash MD3 catalog, tag_flash placement, Baseq3 20 ms impulse timing, Gauntlet/Lightning continuous timing and weapon flash colors.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (output/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(contracts)
    if retail: print(retail)
    return 0
if __name__=='__main__': raise SystemExit(main())
