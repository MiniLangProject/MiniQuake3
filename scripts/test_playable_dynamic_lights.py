#!/usr/bin/env python3
import subprocess,sys
from toolchain import ROOT,run

def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_dynamic_lights_contracts.ml','--output','playable_dynamic_lights_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_dynamic_lights_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 9 playable dynamic-light contracts': raise RuntimeError(value)
    print(value)
if __name__=='__main__': main()
