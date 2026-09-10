"""Direct Baseq3 CL_PacketEvent transition gate."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/packet_event';out.mkdir(parents=True,exist_ok=True)
    src=ROOT/'Quake-III-Arena-original-source/code/client/cl_main.c'
    (out/'packet_event_under_test.inc').write_text(extract(src,['CL_PacketEvent']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/packet_event_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/packet_event_oracle.ml','--output','packet_event_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/packet_event_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:
        aa=native.splitlines();bb=mini.splitlines()
        for i in range(max(len(aa),len(bb))):
            a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
            if a!=b:raise RuntimeError(f'packet-event mismatch record {i+1}\nC: {a}\nM: {b}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/packet_event_contracts.ml','--output','packet_event_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/packet_event_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 23 packet-event contracts':raise RuntimeError(contracts)
    files=[src,harness,ROOT/'src/mq3/client/packet_event.ml',ROOT/'tests/packet_event_oracle.ml',ROOT/'tests/packet_event_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':23,'scope':'CL_PacketEvent early timestamp, OOB dispatch, connection/address/runt gates, netchan Process, raw little-endian sequence, server-message callback and post-parse demo recording.','oracle':'Unchanged CL_PacketEvent with deterministic host callbacks and complete input bytes plus resulting state/callback order.','remaining':'Socket receive remains a host boundary; concrete callbacks bind existing client.connectionless, client.netchan, protocol_runtime and demo modules.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f'PASS: {result["records"]} exact Baseq3 packet-event records + 23 contracts')
if __name__=='__main__':main()
