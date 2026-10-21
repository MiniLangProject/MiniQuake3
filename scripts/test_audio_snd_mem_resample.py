"""Differential tests for Baseq3 S_LoadSound PCM resampling."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/audio_snd_mem_resample';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/client/snd_mem.c'
    functions=['ResampleSfxRaw']
    (out/'audio_snd_mem_resample_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/audio_snd_mem_resample_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/fp:strict','/arch:SSE2','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_mem_resample_oracle.ml','--output','audio_snd_mem_resample_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/audio_snd_mem_resample_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Audio snd_mem resample mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_mem_resample_contracts.ml','--output','audio_snd_mem_resample_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/audio_snd_mem_resample_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 19 snd_mem resample contracts': raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/audio/snd_mem_resample.ml',ROOT/'src/mq3/audio/qvm_sound_assets.ml',ROOT/'tests/audio_snd_mem_resample_oracle.ml',ROOT/'tests/audio_snd_mem_resample_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':19,'functions':functions,'scope':'Unchanged Baseq3 ResampleSfxRaw fixed-point nearest-sample conversion for mono 8/16-bit registered effects, integrated into the QVM sound catalog at the original 22050 Hz cache rate. Streaming stereo background tracks remain on their separate decoded path.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 snd_mem resample records + 19 contracts")
if __name__=='__main__': main()
