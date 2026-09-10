"""Direct Baseq3 SV_PacketEvent transition gate."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/server_packet_event';out.mkdir(parents=True,exist_ok=True)
    src=ROOT/'Quake-III-Arena-original-source/code/server/sv_main.c'
    (out/'server_packet_event_under_test.inc').write_text(extract(src,['SV_PacketEvent']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/server_packet_event_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_packet_event_oracle.ml','--output','server_packet_event_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/server_packet_event_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:
        aa=native.splitlines();bb=mini.splitlines()
        for i in range(max(len(aa),len(bb))):
            a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
            if a!=b:raise RuntimeError(f'server packet-event mismatch record {i+1}\nC: {a}\nM: {b}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_packet_event_contracts.ml','--output','server_packet_event_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/server_packet_event_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 28 server-packet-event contracts':raise RuntimeError(contracts)
    files=[src,harness,ROOT/'src/mq3/server/packet_event.ml',ROOT/'tests/server_packet_event_oracle.ml',ROOT/'tests/server_packet_event_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':28,'scope':'SV_PacketEvent OOB-first routing, OOB qport reads including runt packets, base-address/qport client lookup, translated-port repair, server netchan processing, zombie policy, timeout refresh, client-message execution and unknown-source disconnect.','oracle':'Unchanged SV_PacketEvent with deterministic message, address, client table, netchan, execution and OOB host stubs.','remaining':'The socket receive poll loop and concrete SV_ExecuteClientMessage command/move parser remain separate integration boundaries.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f'PASS: {result["records"]} exact Baseq3 server packet-event records + 28 contracts')
if __name__=='__main__':main()
