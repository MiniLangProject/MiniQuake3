"""Complete source-surface and differential gate for client/snd_mix.c."""
import argparse,json,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

SYMBOLS=['S_PaintChannelFrom16','S_PaintChannelFromADPCM','S_PaintChannelFromMuLaw','S_PaintChannelFromWavelet','S_PaintChannels','S_TransferPaintBuffer','S_TransferStereo16','S_WriteLinearBlastStereo16']

def build_ml(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);parser.add_argument('--full-regression',action='store_true');args=parser.parse_args()
    py_compile.compile(__file__,doraise=True)
    out=ROOT/'build/reference/snd_mix_complete';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/client/snd_mix.c';module=ROOT/'src/mq3/audio/snd_mix_runtime.ml'
    original_text=original.read_text(encoding='utf-8',errors='replace');module_text=module.read_text(encoding='utf-8')
    for name in SYMBOLS:
        if not re.search(r'\b'+name+r'\s*\(',original_text):raise RuntimeError('missing original '+name)
        if not re.search(r'function\s+'+name+r'\s*\(',module_text):raise RuntimeError('missing MiniLang '+name)
    contracts=run([build_ml('tests/snd_mix_complete_contracts.ml','snd_mix_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 10 complete snd_mix contracts':raise RuntimeError(contracts)
    regressions=[]
    if args.full_regression:
        for index,name in enumerate(['test_audio_mixer_transfer.py','test_audio_channel_paint.py','test_audio_snd_compressed_paint.py','test_audio_snd_paint_pipeline.py']):
            value=run([sys.executable,ROOT/'scripts'/name],ROOT,log=out/f'regression-{index}.log',timeout=1800).strip().splitlines()[-1]
            if 'PASS:' not in value:raise RuntimeError(value)
            regressions.append(value)
    sources=[original,module,ROOT/'src/mq3/audio/mixer_transfer.ml',ROOT/'src/mq3/audio/channel_paint.ml',ROOT/'src/mq3/audio/snd_compressed_paint.ml',ROOT/'src/mq3/audio/snd_paint_pipeline.ml',ROOT/'tests/snd_mix_complete_contracts.ml']
    result={'passed':True,'symbols':len(SYMBOLS),'contracts':10,'regressions':regressions,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 8/8 snd_mix symbols + 10 native contracts'+(f' + {len(regressions)} exact-C regressions' if regressions else ''))

if __name__=='__main__':main()
