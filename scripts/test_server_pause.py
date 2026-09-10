"""Differential and contract coverage for SV_CheckPaused."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/server_pause';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/server/sv_main.c'
    (out/'server_pause_under_test.inc').write_text(extract(source,['SV_CheckPaused']),encoding='utf-8',newline='\n')
    oracle=out/'oracle.exe';harness=ROOT/'tests/reference/server_pause_oracle.c'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_pause_oracle.ml','--output','server_pause_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/server_pause_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('SV_CheckPaused mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_pause_contracts.ml','--output','server_pause_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/server_pause_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 22 server pause contracts':raise RuntimeError(value)
    files=[source,harness,ROOT/'tests/server_pause_oracle.ml',ROOT/'src/mq3/server/pause.ml',ROOT/'tests/server_pause_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':22,'function':'SV_CheckPaused',
      'scope':'Client pause cvar gate, all client states, bot exclusion, connected-human cardinality, exact sv_paused transition/Cvar_Set behavior, truthy integer cvars and LAN/dedicated invariance.',
      'oracle':'Unchanged extracted SV_CheckPaused body with deterministic client/netchan and cvar storage.',
      'remaining':'SV_Frame scheduling and timeout/client-message orchestration remain separate runtime work.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {report['records']} exact Baseq3 server-pause records + 22 contracts")
if __name__=='__main__':main()
