"""Build ambient target_speaker contracts and optionally probe retail q3dm1."""
import argparse,subprocess,sys
from pathlib import Path
from toolchain import ROOT,run

def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
def main():
    p=argparse.ArgumentParser();p.add_argument('--pak',type=Path);a=p.parse_args()
    build('tests/playable_ambient_sounds_contracts.ml','playable_ambient_sounds_contracts.exe')
    value=run([ROOT/'build/playable_ambient_sounds_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 13 playable ambient-sound contracts': raise RuntimeError(value)
    print(value)
    if a.pak:
        build('tests/playable_ambient_sounds_retail_probe.ml','playable_ambient_sounds_retail_probe.exe')
        value=run([ROOT/'build/playable_ambient_sounds_retail_probe.exe',a.pak.resolve()],ROOT/'build').strip()
        if value!='PASS: q3dm1 ambience speakers=8 uniqueWavs=1 globalLoops=0': raise RuntimeError(value)
        print(value)
if __name__=='__main__': main()
