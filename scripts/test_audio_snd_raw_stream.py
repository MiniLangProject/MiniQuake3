"""Differential Baseq3 S_RawSamples conversion and productive cinematic mixing."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/audio_snd_raw_stream';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/client/snd_dma.c'
    (out/'audio_snd_raw_stream_under_test.inc').write_text(extract(original,['S_RawSamples']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/audio_snd_raw_stream_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4244','/fp:strict',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_raw_stream_oracle.ml','--output','audio_snd_raw_stream_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/audio_snd_raw_stream_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('S_RawSamples mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_raw_stream_contracts.ml','--output','audio_snd_raw_stream_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/audio_snd_raw_stream_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 10 snd raw-stream contracts': raise RuntimeError(contracts)
    preview=ROOT/'src/mq3/client/qvm_preview_app.ml';text=preview.read_text(encoding='utf-8')
    if 'qvmPlayback.queueRaw(audio,chunk,1.0)' not in text or 'cinematicAudio' in text: raise RuntimeError('cinematic audio still bypasses the productive QVM mixer')
    files=[original,harness,ROOT/'src/mq3/audio/snd_raw_stream.ml',ROOT/'src/mq3/audio/qvm_playback.ml',preview,ROOT/'tests/audio_snd_raw_stream_oracle.ml',ROOT/'tests/audio_snd_raw_stream_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':10,'functions':['S_RawSamples'],'scope':'Exact Baseq3 streamed PCM rate/width/channel conversion and 16384-frame raw ring, productively mixing RoQ audio with QVM music, effects, and loops in the shared 24.8 paintbuffer.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 raw-stream records + 10 contracts")
if __name__=='__main__': main()
