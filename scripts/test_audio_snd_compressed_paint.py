"""Differential tests for Baseq3 ADPCM, wavelet, and MuLaw paint paths."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def main():
    out=ROOT/'build/reference/audio_snd_compressed_paint';out.mkdir(parents=True,exist_ok=True)
    mix=ROOT/'Quake-III-Arena-original-source/code/client/snd_mix.c'
    adpcm=ROOT/'Quake-III-Arena-original-source/code/client/snd_adpcm.c'
    wavelet=ROOT/'Quake-III-Arena-original-source/code/client/snd_wavelet.c'
    paint_functions=['S_PaintChannelFromADPCM','S_PaintChannelFromMuLaw','S_PaintChannelFromWavelet']
    (out/'audio_snd_compressed_paint_under_test.inc').write_text(extract(mix,paint_functions),encoding='utf-8',newline='\n')
    normalized=out/'snd_adpcm_extract.c'
    normalized.write_text(adpcm.read_text(encoding='utf-8').replace('/* static */ void S_AdpcmDecode','void S_AdpcmDecode'),encoding='utf-8',newline='\n')
    codecs=extract(normalized,['S_AdpcmDecode'])+'\n'+extract(wavelet,['daub4','wt1','MuLawDecode','decodeWavelet'])
    (out/'audio_snd_compressed_codecs_under_test.inc').write_text(codecs,encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/audio_snd_compressed_paint_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/fp:strict','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_compressed_paint_oracle.ml','--output','audio_snd_compressed_paint_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/audio_snd_compressed_paint_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Compressed paint mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/audio_snd_compressed_paint_contracts.ml','--output','audio_snd_compressed_paint_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/audio_snd_compressed_paint_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 14 compressed paint contracts': raise RuntimeError(contracts)
    pipeline=(ROOT/'src/mq3/audio/snd_paint_pipeline.ml').read_text(encoding='utf-8')
    if 'compressedPaint.paint(' not in pipeline: raise RuntimeError('shared paintbuffer lacks compressed sfx dispatch')
    files=[mix,adpcm,wavelet,harness,ROOT/'src/mq3/audio/snd_compressed_paint.ml',ROOT/'src/mq3/audio/snd_paint_pipeline.ml',ROOT/'tests/audio_snd_compressed_paint_oracle.ml',ROOT/'tests/audio_snd_compressed_paint_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':14,'functions':paint_functions+['S_AdpcmDecode','daub4','wt1','MuLawDecode','decodeWavelet'],'scope':'Unchanged Baseq3 compressed sound decoders and ADPCM/Wavelet/MuLaw paint paths, selected by the sfx compression tag into the common integer paintbuffer.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 compressed-paint records + 14 contracts")


if __name__=='__main__': main()
