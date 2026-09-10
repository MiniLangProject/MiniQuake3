"""Differential Baseq3 cmd.c command registry, dispatch, and built-ins."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

CMD_FUNCTIONS=['Cmd_Wait_f','Cbuf_Init','Cbuf_AddText','Cbuf_InsertText','Cbuf_ExecuteText','Cbuf_Execute',
 'Cmd_Exec_f','Cmd_Vstr_f','Cmd_Echo_f','Cmd_Argc','Cmd_Argv','Cmd_ArgvBuffer','Cmd_Args','Cmd_ArgsFrom',
 'Cmd_ArgsBuffer','Cmd_Cmd','Cmd_TokenizeString','Cmd_AddCommand','Cmd_RemoveCommand','Cmd_CommandCompletion',
 'Cmd_ExecuteString','Cmd_List_f','Cmd_Init']
def main():
 out=ROOT/'build/reference/command_registry';out.mkdir(parents=True,exist_ok=True)
 cmd=ROOT/'Quake-III-Arena-original-source/code/qcommon/cmd.c';common=ROOT/'Quake-III-Arena-original-source/code/qcommon/common.c';shared=ROOT/'Quake-III-Arena-original-source/code/game/q_shared.c'
 (out/'cmd_registry_under_test.inc').write_text(extract(cmd,CMD_FUNCTIONS),encoding='utf-8',newline='\n')
 (out/'cmd_filter_under_test.inc').write_text(extract(common,['Com_StringContains','Com_Filter'])+extract(shared,['COM_DefaultExtension']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/cmd_registry_oracle.c';oracle=out/'cmd_registry_oracle.exe'
 run(['cl','/nologo','/Od','/Gy','/fp:strict','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/OPT:REF','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([oracle],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/command_registry_oracle.ml','--output','command_registry_oracle.exe'],check=True)
 mini=run([ROOT/'build/command_registry_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  a=native.splitlines();b=mini.splitlines()
  for i in range(max(len(a),len(b))):
   left=a[i] if i<len(a) else '<missing>';right=b[i] if i<len(b) else '<missing>'
   if left!=right:raise RuntimeError(f'cmd registry mismatch record {i+1}\nnative: {left[:1200]}\nmini:   {right[:1200]}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/command_registry_contracts.ml','--output','command_registry_contracts.exe'],check=True)
 contracts=run([ROOT/'build/command_registry_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 16 command registry contracts':raise RuntimeError(contracts)
 records=native.count('\n')
 result={'passed':True,'records':records,'contracts':16,'scope':'Unchanged Baseq3 command registration, removal, completion, dispatch ordering and cmdlist/exec/vstr/echo/wait built-ins through deterministic engine service boundaries.',
  'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [cmd,common,shared,harness,ROOT/'src/mq3/qcommon/command_buffer.ml',ROOT/'tests/command_registry_oracle.ml',ROOT/'tests/command_registry_contracts.ml']}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: {records} exact Baseq3 command-registry differential records + 16 contracts')
if __name__=='__main__':main()
