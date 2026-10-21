"""Differential test for Baseq3 looping-sound Doppler state and paint binding."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/audio_snd_loop_doppler';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/client/snd_dma.c'
    (out/'audio_snd_loop_doppler_under_test.inc').write_text(extract(original,['S_AddLoopingSound']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/audio_snd_loop_doppler_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/fp:strict','/arch:SSE2','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_loop_doppler_oracle.ml','--output','audio_snd_loop_doppler_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/audio_snd_loop_doppler_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Loop Doppler mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_loop_doppler_contracts.ml','--output','audio_snd_loop_doppler_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/audio_snd_loop_doppler_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 6 loop Doppler contracts':raise RuntimeError(contracts)
    playback=(ROOT/'src/mq3/audio/qvm_playback.ml').read_text(encoding='utf-8')
    if 'sndDoppler.update(' not in playback or 'paintSfxLoopDoppler(' not in playback:raise RuntimeError('QVM loop path lacks productive Doppler binding')
    files=[original,harness,ROOT/'src/mq3/audio/snd_loop_doppler.ml',ROOT/'src/mq3/audio/snd_loop_channels.ml',ROOT/'src/mq3/audio/snd_paint_pipeline.ml',ROOT/'src/mq3/audio/qvm_playback.ml',ROOT/'tests/audio_snd_loop_doppler_oracle.ml',ROOT/'tests/audio_snd_loop_doppler_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':6,'functions':['S_AddLoopingSound'],'scope':'Exact Baseq3 squared-distance loop Doppler state, previous-scale continuity, real-loop bypass, and productive PCM interval paint.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 loop-Doppler records + 6 contracts")
if __name__=='__main__':main()
