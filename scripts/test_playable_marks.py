#!/usr/bin/env python3
import subprocess,sys
from toolchain import ROOT,run

def main():
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/playable_marks_contracts.ml','--output','playable_marks_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/playable_marks_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 13 playable mark contracts': raise RuntimeError(value)
    print(value)
if __name__=='__main__': main()
