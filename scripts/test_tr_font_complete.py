#!/usr/bin/env python3
"""Complete native, unchanged-C and Retail gate for renderer/tr_font.c."""
from __future__ import annotations
import argparse,json,re,subprocess,sys,zipfile
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SOURCE=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_font.c'
PORT=ROOT/'src/mq3/renderer/tr_font_runtime.ml'
EXPECTED=['RE_ConstructGlyphInfo','RE_RegisterFont','R_DoneFreeType','R_GetGlyphInfo','R_InitFreeType','R_RenderGlyph','WriteTGA','readFloat','readInt']

def functions(text:str)->set[str]: return set(re.findall(r'\bfunction\s+([A-Za-z_]\w*)\s*\(',text))
def invoke(script:str,*args:object)->None: subprocess.run([sys.executable,ROOT/'scripts'/script,*map(str,args)],cwd=ROOT,check=True)
def synthetic_font_pak(path:Path)->None:
  with zipfile.ZipFile(path,'w',compression=zipfile.ZIP_STORED) as archive:
    archive.writestr('fonts/test.ttf',b'MiniQuake3 deterministic raster fixture')
    for point_size in (12,16,20,24,32,48,72):
      data=bytearray(20548);shader=f'fonts/fontImage_{point_size}_0.tga'.encode('ascii');data[48:48+len(shader)]=shader
      archive.writestr(f'fonts/fontImage_{point_size}.dat',data)

def main()->int:
  parser=argparse.ArgumentParser();parser.add_argument('--data-root',default='D:/Quake3');args=parser.parse_args()
  source_text=SOURCE.read_text(encoding='utf-8',errors='replace');port_names=functions(PORT.read_text(encoding='utf-8'))
  missing_source=sorted(name for name in EXPECTED if not re.search(r'\b'+re.escape(name)+r'\s*\(',source_text));missing_port=sorted(set(EXPECTED)-port_names)
  if missing_source or missing_port: raise RuntimeError(f'tr_font symbol mismatch source={missing_source} port={missing_port}')
  out=ROOT/'build/reference/tr_font_complete';out.mkdir(parents=True,exist_ok=True);pak=out/'fonts.pk3';synthetic_font_pak(pak)
  invoke('build.py','--source','tests/tr_font_complete_contracts.ml','--output','tr_font_complete_contracts.exe')
  contracts=run([ROOT/'build/tr_font_complete_contracts.exe',pak,out/'native.tga'],ROOT/'build').strip()
  if contracts!='PASS: 32 complete tr_font contracts': raise RuntimeError(contracts)
  (out/'tr_font_under_test.inc').write_text(extract(SOURCE,['R_GetGlyphInfo','WriteTGA','readInt','readFloat']),encoding='utf-8',newline='\n')
  harness=ROOT/'tests/reference/tr_font_oracle.c';oracle=out/'oracle.exe'
  run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4244','/fp:strict',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
  unchanged=run([oracle],out,log=out/'oracle.log')
  invoke('build.py','--source','tests/tr_font_oracle.ml','--output','tr_font_oracle.exe');native=run([ROOT/'build/tr_font_oracle.exe'],ROOT/'build',log=out/'minilang.log')
  if unchanged!=native: raise RuntimeError('tr_font unchanged-C mismatch\nC:\n'+unchanged+'MiniLang:\n'+native)
  invoke('test_font_abi.py')
  retail_pak=Path(args.data_root)/'baseq3/pak0.pk3'
  if not retail_pak.is_file(): raise RuntimeError(f'Retail pak0.pk3 not found: {retail_pak}')
  invoke('build.py','--source','tests/tr_font_retail_probe.ml','--output','tr_font_retail_probe.exe');retail=run([ROOT/'build/tr_font_retail_probe.exe',retail_pak],ROOT/'build').strip()
  if retail!='PASS: 7 Retail tr_font contracts': raise RuntimeError(retail)
  files=[SOURCE,PORT,harness,ROOT/'tests/tr_font_oracle.ml',ROOT/'tests/tr_font_complete_contracts.ml',ROOT/'tests/tr_font_retail_probe.ml']
  report={'passed':True,'symbols':9,'contracts':32,'unchanged_c_records':len(unchanged.splitlines()),'retail':retail,'retail_fact':'Baseq3 pak0 has gfx/2d/bigchars.tga and no pre-rendered fonts/fontImage_*.dat; the disabled-FreeType failure path is verified.','scope':'Complete native tr_font parsing, binary32/metrics, outline coverage raster contract, grayscale/mono atlas packing, TGA output, six-entry lifecycle, productive pre-rendered registration and backend-driven runtime font generation.','sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in files}}
  (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
  print('PASS: 9/9 tr_font symbols + 32 native contracts + 5 unchanged-C records + Retail pak0')
  return 0
if __name__=='__main__': raise SystemExit(main())
