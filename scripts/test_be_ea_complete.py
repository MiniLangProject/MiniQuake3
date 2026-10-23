#!/usr/bin/env python3
"""Complete be_ea.c symbol, unchanged-C, native and Retail gate."""
import argparse,json,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['EA_Action','EA_Attack','EA_Command','EA_Crouch','EA_DelayedJump','EA_DropInv','EA_DropItem','EA_EndRegular','EA_Gesture','EA_GetInput','EA_Jump','EA_Move','EA_MoveBack','EA_MoveDown','EA_MoveForward','EA_MoveLeft','EA_MoveRight','EA_MoveUp','EA_ResetInput','EA_Respawn','EA_Say','EA_SayTeam','EA_SelectWeapon','EA_Setup','EA_Shutdown','EA_Talk','EA_Tell','EA_Use','EA_UseInv','EA_UseItem','EA_View','EA_Walk']

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output

def main():
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,default=Path('D:/Quake3'));args=parser.parse_args();py_compile.compile(__file__,doraise=True)
 out=ROOT/'build/reference/be_ea_complete';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/botlib/be_ea.c';module=ROOT/'src/mq3/botlib/elementary_actions.ml';text=module.read_text(encoding='utf-8')
 missing=[name for name in SYMBOLS if not re.search(r'function\s+'+re.escape(name)+r'\s*\(',text)]
 if missing:raise RuntimeError('missing be_ea symbols: '+', '.join(missing))
 (out/'be_ea_complete_under_test.inc').write_text(extract(original,SYMBOLS),encoding='utf-8',newline='\n');harness=ROOT/'tests/reference/be_ea_complete_oracle.c';oracle=out/'be_ea_complete_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([oracle],out,log=out/'oracle.log');mini=run([build('tests/be_ea_complete_oracle.ml','be_ea_complete_oracle.exe')],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('be_ea unchanged-C mismatch\nnative: '+repr(native)+'\nmini: '+repr(mini))
 contracts=run([build('tests/be_ea_complete_contracts.ml','be_ea_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 11 complete be_ea contracts':raise RuntimeError(contracts)
 subprocess.run([sys.executable,ROOT/'scripts/test_elementary_actions.py'],cwd=ROOT,check=True)
 subprocess.run([sys.executable,ROOT/'scripts/test_botlib_retail_qagame.py','--data-root',args.data_root],cwd=ROOT,check=True)
 files=[original,module,ROOT/'src/mq3/botlib/elementary_action_syscalls.ml',harness,ROOT/'tests/be_ea_complete_oracle.ml',ROOT/'tests/be_ea_complete_contracts.ml']
 result={'passed':True,'symbols':len(SYMBOLS),'unchanged_c_records':len(native.splitlines()),'contracts':11,'retail':'12 retail qagame botlib lifecycle contracts','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {len(SYMBOLS)}/32 be_ea symbols + {result['unchanged_c_records']} unchanged-C records + 11 contracts + Retail qagame")
if __name__=='__main__':main()
