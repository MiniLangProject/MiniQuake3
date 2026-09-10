"""Differential tests for unchanged Baseq3 paintbuffer transfer functions."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/audio_mixer_transfer';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/client/snd_mix.c'
    functions=['S_WriteLinearBlastStereo16','S_TransferStereo16','S_TransferPaintBuffer']
    (out/'audio_mixer_transfer_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/audio_mixer_transfer_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/DWIN32','/Did386=0','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_mixer_transfer_oracle.ml','--output','audio_mixer_transfer_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/audio_mixer_transfer_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Audio mixer-transfer mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_mixer_transfer_contracts.ml','--output','audio_mixer_transfer_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/audio_mixer_transfer_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 20 audio mixer-transfer contracts': raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/audio/mixer_transfer.ml',ROOT/'tests/audio_mixer_transfer_oracle.ml',ROOT/'tests/audio_mixer_transfer_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':20,'functions':functions,'scope':'Baseq3 24.8 paintbuffer transfer to wrapping mono/stereo signed-16 and unsigned-8 DMA sample formats, including exact saturation.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 audio mixer-transfer records + 20 contracts")
if __name__=='__main__': main()
