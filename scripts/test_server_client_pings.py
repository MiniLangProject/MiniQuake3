"""Differential and contract coverage for SV_CalcPings."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/server_client_pings';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/server/sv_main.c'
    (out/'server_client_pings_under_test.inc').write_text(extract(source,['SV_CalcPings']),encoding='utf-8',newline='\n')
    oracle=out/'oracle.exe';harness=ROOT/'tests/reference/server_client_pings_oracle.c'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_client_pings_oracle.ml','--output','server_client_pings_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/server_client_pings_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('SV_CalcPings mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_client_pings_contracts.ml','--output','server_client_pings_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/server_client_pings_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 16 server client-ping contracts':raise RuntimeError(value)
    files=[source,harness,ROOT/'tests/server_client_pings_oracle.ml',ROOT/'src/mq3/server/client_pings.ml',ROOT/'tests/server_client_pings_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':16,'function':'SV_CalcPings',
      'scope':'Client ping calculation from the 32-frame snapshot acknowledgement ring, inactive/missing-entity/bot policy, integer averaging, 999 clamp and playerState mirroring.',
      'oracle':'Unchanged extracted SV_CalcPings body with deterministic server client, entity, frame and playerState storage.',
      'remaining':'SV_Frame scheduling and timeout/pause/client-message orchestration remain separate runtime work.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {report['records']} exact Baseq3 client-ping records + 16 contracts")
if __name__=='__main__':main()
