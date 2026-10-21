"""Differential tests for Baseq3 dynamic sound-channel ownership."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/audio_snd_channels';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/client/snd_dma.c'
    functions=['S_ChannelFree','S_ChannelMalloc','S_ChannelSetup','S_StartSound']
    (out/'audio_snd_channels_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/audio_snd_channels_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_channels_oracle.ml','--output','audio_snd_channels_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/audio_snd_channels_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Audio channel ownership mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_channels_contracts.ml','--output','audio_snd_channels_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/audio_snd_channels_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 18 snd channel contracts': raise RuntimeError(contracts)
    playback=(ROOT/'src/mq3/audio/qvm_playback.ml').read_text(encoding='utf-8')
    if 'sndChannels.start(state.channels,entity,command.handle,command.channel)' not in playback or 'sndChannels.release(state.channels,voice.slot)' not in playback: raise RuntimeError('QVM playback is not bound to channel ownership')
    files=[original,harness,ROOT/'src/mq3/audio/snd_channels.ml',ROOT/'src/mq3/audio/qvm_playback.ml',ROOT/'tests/audio_snd_channels_oracle.ml',ROOT/'tests/audio_snd_channels_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':18,'functions':functions,'scope':'Unchanged Baseq3 S_ChannelFree, S_ChannelMalloc, S_ChannelSetup and deterministic S_StartSound paths, including its actual sparse ch[i] duplicate scan, free-list order, same-entity/global oldest replacement and announcer/listener protection. Productively owns QVM one-shot slots through playback completion.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 sound-channel records + 18 contracts")
if __name__=='__main__': main()
