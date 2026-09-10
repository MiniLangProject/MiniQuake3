"""Differential SV_ExecuteClientCommand dispatch test."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/client_command_dispatch';out.mkdir(parents=True,exist_ok=True)
 source=ROOT/'Quake-III-Arena-original-source/code/server/sv_client.c'
 (out/'client_command_dispatch_under_test.inc').write_text(extract(source,['SV_ExecuteClientCommand']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/client_command_dispatch_oracle.c';oracle=out/'oracle.exe'
 run(['cl','/nologo','/Od','/MT',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([oracle],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_command_dispatch_oracle.ml','--output','client_command_dispatch_oracle.exe'],cwd=ROOT,check=True)
 mini=run([ROOT/'build/client_command_dispatch_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('SV_ExecuteClientCommand mismatch\nC:\n'+native+'MiniLang:\n'+mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_command_dispatch_contracts.ml','--output','client_command_dispatch_contracts.exe'],cwd=ROOT,check=True)
 contracts=run([ROOT/'build/client_command_dispatch_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 16 client-command dispatch contracts':raise RuntimeError(contracts)
 files=[source,harness,ROOT/'tests/client_command_dispatch_oracle.ml',ROOT/'src/mq3/server/client_command_dispatch.ml',ROOT/'tests/client_command_dispatch_contracts.ml']
 result={'passed':True,'records':len(native.splitlines()),'contracts':16,'function':'SV_ExecuteClientCommand','scope':'Exact case-sensitive built-in routing, flood clientOk policy, game-state VM fallback, ignored diagnostics and tokenization.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {result['records']} exact Baseq3 command-dispatch records + 16 contracts")
if __name__=='__main__':main()
