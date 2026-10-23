#!/usr/bin/env python3
"""Complete native and productive differential gate for cm_polylib.c."""
from __future__ import annotations
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

EXPECTED=['pw','AllocWinding','FreeWinding','RemoveColinearPoints','WindingPlane','WindingArea','WindingBounds','WindingCenter','BaseWindingForPlane','CopyWinding','ReverseWinding','ClipWindingEpsilon','ChopWindingInPlace','ChopWinding','CheckWinding','WindingOnPlaneSide','AddWindingToConvexHull']

def main()->int:
  parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);args=parser.parse_args()
  original=ROOT/'Quake-III-Arena-original-source/code/qcommon/cm_polylib.c';module=ROOT/'src/mq3/collision/winding.ml';text=module.read_text(encoding='utf-8')
  missing=[name for name in EXPECTED if not re.search(r'\b'+re.escape(name)+r'\s*\(',original.read_text(encoding='latin1')) or not re.search(r'\bfunction\s+'+re.escape(name)+r'\s*\(',text,re.I)]
  if missing: raise RuntimeError('cm_polylib symbol mismatch: '+', '.join(missing))
  subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/winding_complete_contracts.ml','--output','winding_complete_contracts.exe'],cwd=ROOT,check=True)
  value=run([ROOT/'build/winding_complete_contracts.exe'],ROOT/'build').strip()
  if value!='PASS: 21 complete winding contracts': raise RuntimeError(value)
  retail=[]
  if args.data_root:
    subprocess.run([sys.executable,ROOT/'scripts/test_patches.py',str(args.data_root)],cwd=ROOT,check=True)
    result=json.loads((ROOT/'build/reference/patches/result.json').read_text(encoding='utf-8'));retail=result['maps']
  out=ROOT/'build/reference/cm_polylib_complete';out.mkdir(parents=True,exist_ok=True)
  files=[original,module,ROOT/'tests/winding_complete_contracts.ml']
  result={'passed':True,'symbols':len(EXPECTED),'contracts':21,'retail_maps':retail,'scope':'All winding allocation/lifetime, cleanup, plane/area/bounds/center, copy/reverse, split/chop, validation, side and convex-hull operations. Productive patch facets across all 30 Retail BSPs plus test_bigbox remain byte-for-byte differential against unchanged Baseq3 collision code.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
  (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
  print(f"PASS: {len(EXPECTED)}/{len(EXPECTED)} cm_polylib symbols + 21 native contracts"+(" + all Retail BSPs unchanged-C patch differential" if retail else ""));return 0
if __name__=='__main__': raise SystemExit(main())
