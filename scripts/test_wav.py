#!/usr/bin/env python3
"""Compile and run the checked MiniLang RIFF/WAVE contract suite."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/wav';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/wav_contracts.ml','--output','wav_contracts.exe'],cwd=ROOT,check=True)
    actual=run([ROOT/'build/wav_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if actual!='PASS: 35 WAV contracts': raise RuntimeError(actual)
    files=[ROOT/'src/mq3/audio/wav.ml',ROOT/'tests/wav_contracts.ml']
    result={'passed':True,'contracts':35,'scope':'Checked RIFF/WAVE chunk traversal, PCM mono/stereo 8/16-bit formats, owned sample data, padding and malformed-input rejection.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(actual)
if __name__=='__main__': main()
