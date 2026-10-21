"""Differential and productive contracts for Baseq3 cvar console commands."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
def main():
 out=ROOT/'build/reference/cvar_commands';out.mkdir(parents=True,exist_ok=True);source=ROOT/'Quake-III-Arena-original-source/code';h=ROOT/'tests/reference/cvar_commands_oracle.c';oracle=out/'cvar_commands_oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/DNDEBUG','/D_CRT_SECURE_NO_WARNINGS',f'/I{source / "game"}',f'/I{source / "qcommon"}',h,source/'qcommon/cvar.c',source/'game/q_shared.c',f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([oracle],out,log=out/'oracle.log');subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cvar_commands_oracle.ml','--output','cvar_commands_oracle.exe'],check=True);mini=run([ROOT/'build/cvar_commands_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini: raise RuntimeError('Cvar command mismatch\nnative:\n'+native+'\nMiniLang:\n'+mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cvar_commands_contracts.ml','--output','cvar_commands_contracts.exe'],check=True);contracts=run([ROOT/'build/cvar_commands_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 15 cvar console-command contracts':raise RuntimeError(contracts)
 files=[source/'qcommon/cvar.c',h,ROOT/'src/mq3/qcommon/cvar_commands.ml',ROOT/'src/mq3/qcommon/command_buffer.ml',ROOT/'tests/cvar_commands_oracle.ml',ROOT/'tests/cvar_commands_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'differential_records':11,'contracts':15,'scope':'Baseq3 set/seta/setu/sets/toggle/reset and direct cvar command behavior with productive command-buffer registration; cvarlist contracts cover flags, filtering and totals.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}},indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: 11 exact Baseq3 cvar command records + 15 contracts')
if __name__=='__main__':main()
