"""Differential and composition coverage for outer SV_Frame."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/server_frame';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/server/sv_main.c'
    (out/'server_frame_under_test.inc').write_text(extract(source,['SV_Frame']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/server_frame_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_frame_oracle.ml','--output','server_frame_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/server_frame_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('SV_Frame mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_frame_contracts.ml','--output','server_frame_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/server_frame_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 28 server-frame contracts':raise RuntimeError(value)
    files=[source,harness,ROOT/'tests/server_frame_oracle.ml',ROOT/'src/mq3/server/frame.ml',ROOT/'tests/server_frame_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':28,'function':'SV_Frame',
      'scope':'Outer server-frame composition: kill/not-running/pause exits, FPS clamp, residual/dedicated sleep, both wrap restarts, scheduled restart, server/system info flags, listen/dedicated bot timing, chunked game VM frames, speeds timing, pings, timeouts, client snapshot messages and heartbeat in exact order.',
      'oracle':'Unchanged extracted Baseq3 SV_Frame body with deterministic engine, VM, clock, cvar and network service hosts.',
      'remaining':'Concrete main-loop ownership of these services and full VM-backed gameplay remain wider runtime integration.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {report['records']} exact Baseq3 server-frame records + {report['contracts']} contracts")
if __name__=='__main__':main()
