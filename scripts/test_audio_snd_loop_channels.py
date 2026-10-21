"""Differential tests for Baseq3 looping-sound channel aggregation."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/audio_snd_loop_channels';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/client/snd_dma.c';functions=['S_SpatializeOrigin','S_AddLoopSounds']
    (out/'audio_snd_loop_channels_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/audio_snd_loop_channels_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/fp:strict','/arch:SSE2','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_loop_channels_oracle.ml','--output','audio_snd_loop_channels_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/audio_snd_loop_channels_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Audio loop-channel mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_loop_channels_contracts.ml','--output','audio_snd_loop_channels_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/audio_snd_loop_channels_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 17 snd loop-channel contracts': raise RuntimeError(contracts)
    playback=(ROOT/'src/mq3/audio/qvm_playback.ml').read_text(encoding='utf-8')
    if 'sndLoops.build(loopEntries,state.listener.origin,state.listener.axis)' not in playback: raise RuntimeError('QVM playback is not bound to loop aggregation')
    files=[original,harness,ROOT/'src/mq3/audio/snd_loop_channels.ml',ROOT/'src/mq3/audio/qvm_playback.ml',ROOT/'tests/audio_snd_loop_channels_oracle.ml',ROOT/'tests/audio_snd_loop_channels_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':17,'functions':functions,'scope':'Unchanged Baseq3 S_AddLoopSounds with exact S_SpatializeOrigin: identical-SFX merging, normal/real master volumes, Doppler exclusion, 255 channel cap, inaudible omission and 96-channel limit. QVM loop mixing uses merged gains and a common painted-time phase.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 loop-channel records + 17 contracts")
if __name__=='__main__': main()
