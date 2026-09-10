"""Differential and composition coverage for outer CL_Frame."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/client_main_frame';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/client/cl_main.c'
    (out/'client_frame_under_test.inc').write_text(
        extract(source,['CL_CheckTimeout','CL_CheckUserinfo','CL_Frame']),
        encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/client_frame_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_frame_oracle.ml','--output','client_frame_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/client_frame_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('CL_Frame mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_frame_contracts.ml','--output','client_frame_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/client_frame_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 28 client-frame contracts':raise RuntimeError(value)
    files=[source,harness,ROOT/'tests/client_frame_oracle.ml',ROOT/'src/mq3/client/frame.ml',ROOT/'tests/client_frame_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':28,'functions':['CL_CheckTimeout','CL_CheckUserinfo','CL_Frame'],
      'scope':'Outer client-frame lifecycle: running/menu/CD gates, AVI fixed time and screenshot, realtime/debug graph, reliable userinfo, timeout grace and disconnect, SendCmd/resend/CGame time, render/audio/cinematic/console order and frame count.',
      'oracle':'Unchanged extracted Baseq3 CL_CheckTimeout, CL_CheckUserinfo and CL_Frame bodies with deterministic engine, UI, cvar, network, renderer and audio service hosts.',
      'integration':'Services carry explicit network_ingress, protocol_runtime and demo runtime references; SendCmd, resend and CGame-time callbacks are their original ownership boundaries.',
      'remaining':'Concrete renderer/audio/cgame implementations and platform ownership of the service bindings remain wider runtime integration.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 client-frame records + {report['contracts']} contracts")
if __name__=='__main__':main()
