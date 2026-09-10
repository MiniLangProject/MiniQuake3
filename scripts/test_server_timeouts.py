"""Direct Baseq3 SV_CheckTimeouts transition and contract gate."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/server_timeouts';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/server/sv_main.c'
    (out/'server_timeouts_under_test.inc').write_text(extract(source,['SV_CheckTimeouts']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/server_timeouts_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_timeouts_oracle.ml','--output','server_timeouts_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/server_timeouts_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('SV_CheckTimeouts mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_timeouts_contracts.ml','--output','server_timeouts_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/server_timeouts_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 24 server-timeout contracts':raise RuntimeError(value)
    files=[source,harness,ROOT/'tests/server_timeouts_oracle.ml',ROOT/'src/mq3/server/timeouts.ml',ROOT/'tests/server_timeouts_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':24,'function':'SV_CheckTimeouts',
      'scope':'Map-change future-time repair, timeout/zombie strict boundaries, consecutive timeout grace and reset, direct free/drop behavior, maxclients iteration and signed 32-bit time arithmetic.',
      'oracle':'Unchanged extracted SV_CheckTimeouts body with deterministic client table, cvars, diagnostics and drop service.',
      'remaining':'SV_Frame scheduling and cvar ownership remain separate integration boundaries.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {report['records']} exact Baseq3 server-timeout records + 24 contracts")
if __name__=='__main__':main()
