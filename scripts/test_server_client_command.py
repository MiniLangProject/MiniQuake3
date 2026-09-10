"""Differential and contract coverage for SV_ClientCommand."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/server_client_command';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/server/sv_client.c'
    (out/'server_client_command_under_test.inc').write_text(extract(source,['SV_ClientCommand']),encoding='utf-8',newline='\n')
    oracle=out/'oracle.exe';harness=ROOT/'tests/reference/server_client_command_oracle.c'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_client_command_oracle.ml','--output','server_client_command_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/server_client_command_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('SV_ClientCommand mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_client_command_contracts.ml','--output','server_client_command_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/server_client_command_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 20 server client-command contracts':raise RuntimeError(value)
    files=[source,harness,ROOT/'tests/server_client_command_oracle.ml',ROOT/'src/mq3/server/client_command.ml',ROOT/'tests/server_client_command_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':20,'function':'SV_ClientCommand',
      'scope':'Reliable sequence duplicate/gap policy, flood protection, nextReliableTime, clientOk and lastClientCommand/string updates, including state boundaries.',
      'oracle':'Unchanged extracted SV_ClientCommand body with deterministic MSG, cvar, clock, drop and execute stubs.',
      'remaining':'SV_ExecuteClientCommand command routing and game VM behavior remain injected host services.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {report['records']} exact Baseq3 client-command records + 20 contracts")
if __name__=='__main__':main()
