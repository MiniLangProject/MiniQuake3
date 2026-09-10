"""Differential and contract coverage for SV_ExecuteClientMessage."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/server_client_message';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/server/sv_client.c'
    (out/'server_client_message_under_test.inc').write_text(extract(source,['SV_ExecuteClientMessage']),encoding='utf-8',newline='\n')
    oracle=out/'oracle.exe';harness=ROOT/'tests/reference/server_client_message_oracle.c'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_client_message_oracle.ml','--output','server_client_message_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/server_client_message_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('SV_ExecuteClientMessage mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_client_message_contracts.ml','--output','server_client_message_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/server_client_message_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 15 server client-message contracts':raise RuntimeError(value)
    files=[source,harness,ROOT/'tests/server_client_message_oracle.ml',ROOT/'src/mq3/server/client_message.ml',ROOT/'tests/server_client_message_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':15,'function':'SV_ExecuteClientMessage',
      'scope':'Header acknowledgements, stale repair, server-id/download/nextdl policy, repeated client commands, zombie/flood exits, move/no-delta dispatch, EOF and bad opcode.',
      'oracle':'Unchanged extracted SV_ExecuteClientMessage body with deterministic msg and host-service stubs.',
      'remaining':'SV_ClientCommand and SV_UserMove payload bodies remain separate callbacks.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {report['records']} exact Baseq3 client-message records + 15 contracts")
if __name__=='__main__':main()
