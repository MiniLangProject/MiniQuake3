"""Complete source-surface gate for client/snd_adpcm.c."""
import argparse,json,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

SYMBOLS=['S_AdpcmEncode','S_AdpcmEncodeSound','S_AdpcmGetSamples','S_AdpcmMemoryNeeded','S_AdpcmDecode','memory']
def build_ml(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);parser.add_argument('--full-regression',action='store_true');args=parser.parse_args();py_compile.compile(__file__,doraise=True)
    out=ROOT/'build/reference/snd_adpcm_complete';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/client/snd_adpcm.c';module=ROOT/'src/mq3/audio/snd_adpcm_runtime.ml';ot=original.read_text(encoding='utf-8',errors='replace');mt=module.read_text(encoding='utf-8')
    for name in SYMBOLS:
        if name!='memory' and not re.search(r'\b'+name+r'\s*\(',ot):raise RuntimeError('missing original '+name)
        if not re.search(r'function\s+'+name+r'\s*\(',mt):raise RuntimeError('missing MiniLang '+name)
    contracts=run([build_ml('tests/snd_adpcm_complete_contracts.ml','snd_adpcm_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 10 complete snd_adpcm contracts':raise RuntimeError(contracts)
    start=ot.index('static int indexTable[16]')
    end=ot.index('/* static */ void S_AdpcmDecode')
    (out/'snd_adpcm_complete_under_test.inc').write_text(ot[start:end],encoding='utf-8',newline='\n')
    oracle=out/'oracle.exe';harness=ROOT/'tests/reference/snd_adpcm_complete_oracle.c'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    mini=run([build_ml('tests/snd_adpcm_complete_oracle.ml','snd_adpcm_complete_oracle.exe')],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('ADPCM encoder mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    regressions=[]
    if args.full_regression:
        value=run([sys.executable,ROOT/'scripts/test_audio_snd_compressed_paint.py'],ROOT,log=out/'compressed-regression.log',timeout=1800).strip().splitlines()[-1]
        if 'PASS:' not in value:raise RuntimeError(value)
        regressions.append(value)
    sources=[original,module,ROOT/'src/mq3/audio/snd_compressed_paint.ml',ROOT/'tests/snd_adpcm_complete_contracts.ml',ROOT/'tests/snd_adpcm_complete_oracle.ml',harness]
    result={'passed':True,'symbols':len(SYMBOLS),'contracts':10,'exactCRecords':len(native.splitlines()),'regressions':regressions,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: complete snd_adpcm surface + 3 exact-C encoder records + 10 native contracts'+(f' + {len(regressions)} exact-C decoder regressions' if regressions else ''))
if __name__=='__main__':main()
