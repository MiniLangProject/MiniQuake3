"""Differential and contract coverage for the Windows input event boundary."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/input_event_queue';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/win32/win_main.c'
    (out/'input_event_queue_under_test.inc').write_text(extract(source,['Sys_QueEvent']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/input_event_queue_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/input_event_queue_oracle.ml','--output','input_event_queue_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/input_event_queue_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('Sys_QueEvent mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/input_event_queue_contracts.ml','--output','input_event_queue_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/input_event_queue_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 26 input event queue contracts':raise RuntimeError(value)
    files=[source,harness,ROOT/'tests/input_event_queue_oracle.ml',ROOT/'src/mq3/platform/input_events.ml',ROOT/'tests/input_event_queue_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':26,'function':'Sys_QueEvent and Com_EventLoop input dispatch boundary',
      'scope':'Baseq3 256-slot FIFO ring, zero-time clock substitution, deterministic oldest-event overflow, typed key/char/mouse/joystick producers, Windows wheel press/release synthesis, bounded draining and productive engine callbacks.',
      'oracle':'Unchanged extracted Baseq3 Sys_QueEvent body hosted with deterministic clock and queue storage.',
      'remaining':'A native window adapter must translate platform messages and call these producer functions; no GUI window is required by this module.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 input-queue records + {report['contracts']} contracts")
if __name__=='__main__':main()
