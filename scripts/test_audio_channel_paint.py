"""Differential tests for Baseq3 16-bit channel painting and Doppler resampling."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/audio_channel_paint';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/client/snd_mix.c'
    functions=['S_PaintChannelFrom16']
    (out/'audio_channel_paint_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/audio_channel_paint_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/fp:strict','/DWIN32','/Did386=0','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_channel_paint_oracle.ml','--output','audio_channel_paint_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/audio_channel_paint_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Audio channel-paint mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_channel_paint_contracts.ml','--output','audio_channel_paint_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/audio_channel_paint_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 32 audio channel-paint contracts': raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/audio/channel_paint.ml',ROOT/'tests/audio_channel_paint_oracle.ml',ROOT/'tests/audio_channel_paint_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':32,'functions':functions,'scope':'Baseq3 S_PaintChannelFrom16 scalar CPU path across cyclic 1024-sample chunks, with stereo volume accumulation, old Doppler offset scaling, and Doppler interval resampling.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 audio channel-paint records + 32 contracts")
if __name__=='__main__': main()
