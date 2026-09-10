#!/usr/bin/env python3
"""Run MiniLang spatial-loop contracts and the optional q3dm1 retail probe."""
import argparse,json,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--pak',type=Path);args=parser.parse_args()
    out=ROOT/'build/reference/spatial_ambient';out.mkdir(parents=True,exist_ok=True)
    build('tests/spatial_mixer_contracts.ml','spatial_mixer_contracts.exe')
    value=run([ROOT/'build/spatial_mixer_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 42 spatial mixer contracts': raise RuntimeError(value)
    print(value);retail='not-run'
    if args.pak:
      build('tests/spatial_ambient_q3dm1_probe.ml','spatial_ambient_q3dm1_probe.exe')
      retail=run([ROOT/'build/spatial_ambient_q3dm1_probe.exe',args.pak.resolve()],ROOT/'build',log=out/'q3dm1.log').strip()
      if not retail.startswith('PASS: q3dm1 spatial fires=8 rate=22050 stereoFrames=1024 audible='): raise RuntimeError(retail)
      print(retail)
    files=[ROOT/'src/mq3/audio/spatial_mixer.ml',ROOT/'src/mq3/client/playable_spatial_ambient.ml',ROOT/'tests/spatial_mixer_contracts.ml',ROOT/'tests/spatial_ambient_q3dm1_probe.ml']
    result={'passed':True,'contracts':42,'retail':retail,'scope':'Baseq3 distance attenuation and stereo pan for loop sounds, shared-source mixing, 8/16-bit mono/stereo sampling, resampling, phase continuity and overload limiting.','sources':{p.relative_to(ROOT).as_posix():sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
if __name__=='__main__': main()
