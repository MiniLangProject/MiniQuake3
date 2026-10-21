"""Unchanged-C cg_ents transforms plus complete native entity contracts."""
import argparse,json,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    out=ROOT/'build/reference/cgame_ents';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_ents.c'
    functions=['CG_PositionEntityOnTag','CG_PositionRotatedEntityOnTag','CG_AdjustPositionForMover','CG_InterpolateEntityPosition']
    (out/'cgame_ents_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    host=ROOT/'tests/reference/cgame_ents_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT','/wd4100','/wd4047','/wd4024',f'/I{out}',host,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log')
    for source,name in [('tests/cgame_ents_oracle.ml','cgame_ents_oracle.exe'),('tests/cgame_ents_contracts.ml','cgame_ents_contracts.exe')]:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',name],cwd=ROOT,check=True)
    mini=run([ROOT/'build/cgame_ents_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini)
    contracts=run([ROOT/'build/cgame_ents_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts=='PASS: 28 cgame ents contracts',contracts
    retail=None
    if args.data_root:
        retail=run([sys.executable,ROOT/'scripts/test_retail_qvm_match.py','--data-root',args.data_root.resolve()],ROOT,log=out/'retail.log',timeout=300).strip().splitlines()[-1];assert retail.startswith('PASS: retail QVM match'),retail
    files=[original,host,ROOT/'src/mq3/client/cgame_ents.ml',ROOT/'tests/cgame_ents_oracle.ml',ROOT/'tests/cgame_ents_contracts.ml']
    result={'passed':True,'differential_records':9,'contracts':28,'retail':retail,'functions':['CG_PositionEntityOnTag','CG_PositionRotatedEntityOnTag','CG_SetEntitySoundPosition','CG_EntityEffects','CG_General','CG_Speaker','CG_Item','CG_Missile','CG_Grapple','CG_Mover','CG_Beam','CG_Portal','CG_AdjustPositionForMover','CG_InterpolateEntityPosition','CG_CalcEntityLerpPositions','CG_TeamBase','CG_AddCEntity','CG_AddPacketEntities'],'scope':'Complete renderer-neutral cg_ents semantic observer. It reproduces interpolation, mover translation, tag placement, every baseq3 entity dispatch and continuous audio/light decisions. Retail QVM mode records but suppresses native boundary dispatch, avoiding duplicate scene and audio effects.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('PASS: 9 unchanged C cg_ents records + '+contracts+((' + '+retail) if retail else ''))
if __name__=='__main__':main()
