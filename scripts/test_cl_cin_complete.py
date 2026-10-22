"""Complete client/cl_cin.c adapter and retail RoQ gate."""
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    original=ROOT/'Quake-III-Arena-original-source/code/client/cl_cin.c';target=ROOT/'src/mq3/client/cl_cin_runtime.ml'
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'));entry=next(x for x in ledger['files'] if x['source']=='code/client/cl_cin.c')
    text=target.read_text(encoding='utf-8');missing=[name for name in entry['symbol_candidates'] if re.search(r'\bfunction\s+'+re.escape(name)+r'\s*\(',text) is None]
    if missing: raise RuntimeError('cl_cin symbols missing: '+', '.join(missing))
    cmd=[sys.executable,ROOT/'scripts/test_roq_cinematics.py']
    if args.data_root: cmd += ['--data-root',str(args.data_root)]
    subprocess.run(cmd,cwd=ROOT,check=True)
    subprocess.run([sys.executable,ROOT/'scripts/test_qvm_video_materials.py',*(['--data-root',str(args.data_root)] if args.data_root else [])],cwd=ROOT,check=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cl_cin_runtime_contracts.ml','--output','cl_cin_runtime_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/cl_cin_runtime_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 10 cl_cin runtime contracts': raise RuntimeError(value)
    files=[original,target,ROOT/'src/mq3/client/cinematic_runtime.ml',ROOT/'src/mq3/format/roq.ml',ROOT/'src/mq3/video/roq_video.ml',ROOT/'tests/cl_cin_runtime_contracts.ml']
    result={'passed':True,'symbols':len(entry['symbol_candidates']),'contracts':10,'scope':'All cl_cin.c public and RoQ helper entry points over the bounded productive cinematic, VQ, PCM, screen-draw and shader-upload paths.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    out=ROOT/'build/reference/cl_cin_complete';out.mkdir(parents=True,exist_ok=True);(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['symbols']}/38 cl_cin symbols + {result['contracts']} adapter contracts + RoQ/QVM retail")
if __name__=='__main__': main()
