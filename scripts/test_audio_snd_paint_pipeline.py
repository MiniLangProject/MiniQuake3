"""Differential tests for Baseq3 complete PCM paint-channel composition."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/audio_snd_paint_pipeline';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/client/snd_mix.c';functions=['S_PaintChannelFrom16','S_PaintChannels']
    (out/'audio_snd_paint_pipeline_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/audio_snd_paint_pipeline_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/fp:strict','/DWIN32','/Didppc_altivec=0','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_paint_pipeline_oracle.ml','--output','audio_snd_paint_pipeline_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/audio_snd_paint_pipeline_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Audio paint pipeline mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_paint_pipeline_contracts.ml','--output','audio_snd_paint_pipeline_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/audio_snd_paint_pipeline_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 18 snd paint-pipeline contracts': raise RuntimeError(contracts)
    playback=ROOT/'src/mq3/audio/qvm_playback.ml';text=playback.read_text(encoding='utf-8')
    if 'sndPaint.paintSfxOneShot(' not in text or 'sndPaint.paintSfxLoopDoppler(' not in text or 'sndPaint.transfer16(' not in text: raise RuntimeError('QVM playback is not bound to integer paint pipeline')
    files=[original,harness,ROOT/'src/mq3/audio/snd_paint_pipeline.ml',playback,ROOT/'tests/audio_snd_paint_pipeline_oracle.ml',ROOT/'tests/audio_snd_paint_pipeline_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':18,'functions':functions,'scope':'Unchanged Baseq3 S_PaintChannels and S_PaintChannelFrom16 PCM composition for simultaneous one-shots and wrapping loop channels at nonzero painted time, plus checked mono/stereo/raw conversion and signed-16 transfer. Productively replaces QVM float effect mixing.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 paint-pipeline records + 18 contracts")
if __name__=='__main__': main()
