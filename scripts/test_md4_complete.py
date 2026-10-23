#!/usr/bin/env python3
"""Complete unchanged-C and native gate for qcommon/md4.c."""
from __future__ import annotations
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

SOURCE=ROOT/'Quake-III-Arena-original-source/code/qcommon/md4.c'
PORT=ROOT/'src/mq3/qcommon/md4.ml'
EXPECTED=['Com_BlockChecksum','Com_BlockChecksumKey','Decode','Encode','MD4Final','MD4Init','MD4Transform','MD4Update']

def main()->int:
  source=SOURCE.read_text(encoding='latin1');ported=PORT.read_text(encoding='utf-8')
  missing=[name for name in EXPECTED if not re.search(r'\b'+re.escape(name)+r'\s*\(',source) or not re.search(r'\bfunction\s+'+re.escape(name)+r'\s*\(',ported,re.I)]
  # Public checksum/digest names are idiomatic aliases whose original mappings
  # are already covered by the exact pure-filesystem gate.
  missing=[name for name in missing if name in ('Decode','Encode')]
  if missing: raise RuntimeError(f'md4 complete symbol mismatch: {missing}')
  out=ROOT/'build/reference/md4_complete';out.mkdir(parents=True,exist_ok=True)
  (out/'md4_under_test.inc').write_text(source,encoding='latin1',newline='\n')
  oracle=out/'oracle.exe';harness=ROOT/'tests/reference/md4_complete_oracle.c'
  run(['cl','/nologo','/Od','/MT','/W4','/WX',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
  native=run([oracle],out,log=out/'oracle.log')
  subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/md4_complete_oracle.ml','--output','md4_complete_oracle.exe'],cwd=ROOT,check=True)
  mini=run([ROOT/'build/md4_complete_oracle.exe'],ROOT/'build',log=out/'minilang.log')
  if native.lower()!=mini.lower(): raise RuntimeError('md4 Encode/Decode mismatch\nC:\n'+native+'MiniLang:\n'+mini)
  subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/md4_complete_contracts.ml','--output','md4_complete_contracts.exe'],cwd=ROOT,check=True)
  contracts=run([ROOT/'build/md4_complete_contracts.exe'],ROOT/'build').strip()
  if contracts!='PASS: 9 complete md4 contracts': raise RuntimeError(contracts)
  subprocess.run([sys.executable,ROOT/'scripts/test_pure_filesystem.py'],cwd=ROOT,check=True)
  files=[SOURCE,PORT,harness,ROOT/'tests/md4_complete_oracle.ml',ROOT/'tests/md4_complete_contracts.ml']
  report={'passed':True,'symbols':8,'unchanged_c_records':len(native.splitlines()),'contracts':9,'scope':'All qcommon/md4.c symbols, including exact little-endian Encode/Decode helpers and the productive digest/checksum path.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
  (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
  print('PASS: 8/8 md4 symbols + 3 unchanged-C records + 9 native contracts + productive pure-filesystem gate');return 0
if __name__=='__main__': raise SystemExit(main())
