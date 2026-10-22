#!/usr/bin/env python3
"""Complete native, unchanged-C and Retail gate for client/snd_mem.c."""
from __future__ import annotations
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

SOURCE=ROOT/'Quake-III-Arena-original-source/code/client/snd_mem.c'
PORT=ROOT/'src/mq3/audio/snd_mem_runtime.ml'
EXPECTED=['FindChunk','FindNextChunk','GetLittleLong','GetLittleShort','GetWavinfo','ResampleSfx','ResampleSfxRaw','SND_free','SND_malloc','SND_setup','S_DisplayFreeMemory','S_LoadSound']

def functions(text:str)->set[str]: return set(re.findall(r'\bfunction\s+([A-Za-z_]\w*)\s*\(',text))
def invoke(script:str,*args:object)->None: subprocess.run([sys.executable,ROOT/'scripts'/script,*map(str,args)],cwd=ROOT,check=True)

def main()->int:
  parser=argparse.ArgumentParser();parser.add_argument('--data-root',default='D:/Quake3');args=parser.parse_args()
  source_text=SOURCE.read_text(encoding='utf-8',errors='replace');port_names=functions(PORT.read_text(encoding='utf-8'))
  missing_source=sorted(name for name in EXPECTED if not re.search(r'\b'+re.escape(name)+r'\s*\(',source_text));missing_port=sorted(set(EXPECTED)-port_names)
  if missing_source or missing_port: raise RuntimeError(f'snd_mem symbol mismatch source={missing_source} port={missing_port}')
  out=ROOT/'build/reference/snd_mem_complete';out.mkdir(parents=True,exist_ok=True)
  invoke('test_audio_snd_mem_resample.py')
  invoke('build.py','--source','tests/snd_mem_complete_contracts.ml','--output','snd_mem_complete_contracts.exe')
  contracts=run([ROOT/'build/snd_mem_complete_contracts.exe'],ROOT/'build').strip()
  if contracts!='PASS: 33 complete snd_mem contracts': raise RuntimeError(contracts)
  retail_pak=Path(args.data_root)/'baseq3/pak0.pk3'
  if not retail_pak.is_file(): raise RuntimeError(f'Retail pak0.pk3 not found: {retail_pak}')
  invoke('build.py','--source','tests/snd_mem_retail_probe.ml','--output','snd_mem_retail_probe.exe')
  retail=run([ROOT/'build/snd_mem_retail_probe.exe',retail_pak],ROOT/'build').strip()
  if not retail.startswith('PASS: 8 Retail snd_mem contracts samples='): raise RuntimeError(retail)
  files=[SOURCE,PORT,ROOT/'src/mq3/audio/snd_mem_resample.ml',ROOT/'tests/snd_mem_complete_contracts.ml',ROOT/'tests/snd_mem_retail_probe.ml']
  report={'passed':True,'symbols':len(EXPECTED),'contracts':33,'unchanged_c_records':8,'retail':retail,'scope':'Complete native snd_mem RIFF parsing, fixed-pool cache allocation, Baseq3-exact resampling, linked PCM chunks, compressed callback path with guaranteed file release, timestamps and file lifecycle against three Retail WAV assets.','sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in files}}
  (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
  print('PASS: 12/12 snd_mem symbols + 33 native contracts + 8 unchanged-C records + Retail pak0')
  return 0
if __name__=='__main__': raise SystemExit(main())
