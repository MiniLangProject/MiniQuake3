"""Differential Baseq3 common.c startup command-line processing."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
 out=ROOT/'build/reference/startup_commands';out.mkdir(parents=True,exist_ok=True)
 common=ROOT/'Quake-III-Arena-original-source/code/qcommon/common.c';cmd=ROOT/'Quake-III-Arena-original-source/code/qcommon/cmd.c'
 (out/'startup_under_test.inc').write_text(extract(common,['Com_ParseCommandLine','Com_SafeMode','Com_StartupVariable','Com_AddStartupCommands']),encoding='utf-8',newline='\n')
 (out/'startup_cmd_under_test.inc').write_text(extract(cmd,['Cbuf_Init','Cbuf_AddText','Cmd_Argc','Cmd_Argv','Cmd_TokenizeString']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/startup_commands_oracle.c';oracle=out/'startup_commands_oracle.exe'
 run(['cl','/nologo','/Od','/Gy','/fp:strict','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/OPT:REF','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([oracle],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/startup_commands_oracle.ml','--output','startup_commands_oracle.exe'],check=True)
 mini=run([ROOT/'build/startup_commands_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  a=native.splitlines();b=mini.splitlines()
  for i in range(max(len(a),len(b))):
   left=a[i] if i<len(a) else '<missing>';right=b[i] if i<len(b) else '<missing>'
   if left!=right:raise RuntimeError(f'startup command mismatch record {i+1}\nnative: {left[:1500]}\nmini:   {right[:1500]}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/startup_commands_contracts.ml','--output','startup_commands_contracts.exe'],check=True)
 contracts=run([ROOT/'build/startup_commands_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 16 startup command contracts':raise RuntimeError(contracts)
 records=native.count('\n');result={'passed':True,'records':records,'contracts':16,'scope':'Unchanged Baseq3 Com_ParseCommandLine, Com_SafeMode, Com_StartupVariable and Com_AddStartupCommands with deterministic Cvar and command-buffer services.',
 'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [common,cmd,harness,ROOT/'src/mq3/qcommon/startup_commands.ml',ROOT/'tests/startup_commands_oracle.ml',ROOT/'tests/startup_commands_contracts.ml']}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f'PASS: {records} exact Baseq3 startup-command differential records + 16 contracts')
if __name__=='__main__':main()
