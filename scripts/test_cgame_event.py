"""Unchanged-C cg_event decisions, native contracts and retail suppression integration."""
import argparse,json,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 p=argparse.ArgumentParser();p.add_argument('--data-root',type=Path);a=p.parse_args();out=ROOT/'build/reference/cgame_event';out.mkdir(parents=True,exist_ok=True);src=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_event.c'
 (out/'cgame_event_under_test.inc').write_text(extract(src,['CG_PlaceString','CG_CheckEvents']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/cgame_event_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/fp:strict','/MT','/wd4100',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 for source,name in [('tests/cgame_event_oracle.ml','cgame_event_oracle.exe'),('tests/cgame_event_contracts.ml','cgame_event_contracts.exe')]:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',name],cwd=ROOT,check=True)
 mini=run([ROOT/'build/cgame_event_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini);contracts=run([ROOT/'build/cgame_event_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts.startswith('PASS: '),contracts
 retail=None
 if a.data_root:
  retail=run([sys.executable,ROOT/'scripts/test_retail_qvm_match.py','--data-root',a.data_root.resolve()],ROOT,log=out/'retail.log',timeout=300).strip().splitlines()[-1];assert retail.startswith('PASS: retail QVM match'),retail
 files=[src,harness,ROOT/'src/mq3/client/cgame_event.ml',ROOT/'src/mq3/engine/local_qvm_match.ml',ROOT/'tests/cgame_event_oracle.ml',ROOT/'tests/cgame_event_contracts.ml'];result={'passed':True,'differential_records':16,'contracts':int(contracts.split()[1]),'retail':retail,'functions':['CG_PlaceString','CG_Obituary','CG_UseItem','CG_ItemPickup','CG_PainEvent','CG_EntityEvent','CG_CheckEvents'],'scope':'Complete native cg_event semantic observer at the productive snapshot and audio/render/HUD boundaries; retail cgame.qvm suppresses native dispatch to prevent duplicate effects.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
 print('PASS: 16 unchanged C cg_event records + '+contracts+((' + '+retail) if retail else ''))
if __name__=='__main__':main()
