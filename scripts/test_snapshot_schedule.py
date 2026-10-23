"""Differential and contract coverage for SV_SendClientMessages scheduling."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/snapshot_schedule';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/server/sv_snapshot.c'
    (out/'snapshot_schedule_under_test.inc').write_text(extract(source,['SV_RateMsec','SV_SendClientMessages']),encoding='utf-8',newline='\n')
    oracle=out/'oracle.exe';harness=ROOT/'tests/reference/snapshot_schedule_oracle.c'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_schedule_oracle.ml','--output','snapshot_schedule_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/snapshot_schedule_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('SV_SendClientMessages mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_schedule_contracts.ml','--output','snapshot_schedule_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/snapshot_schedule_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 25 snapshot-schedule contracts':raise RuntimeError(value)
    files=[source,harness,ROOT/'tests/snapshot_schedule_oracle.ml',ROOT/'src/mq3/server/snapshot_schedule.ml',ROOT/'src/mq3/server/frame.ml',ROOT/'tests/snapshot_schedule_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':25,'function':'SV_SendClientMessages',
      'scope':'Complete outer client-send scheduler: disconnected and not-yet-due filtering, exact-deadline dispatch, pending-fragment priority, remaining-fragment rate timing, max-rate policy, client iteration and snapshot callback boundary. Productive server.frame composition drives due snapshots and pending fragments through this scheduler.',
      'oracle':'Unchanged extracted SV_RateMsec and SV_SendClientMessages bodies from pinned Baseq3 with deterministic client/channel storage and send callbacks.',
      'remaining':'Snapshot construction and netchan transmission are owned by their separately verified snapshot_send and server.netchan modules.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 snapshot-schedule records + 25 contracts")
if __name__=='__main__':main()
