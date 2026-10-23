"""Complete Baseq3 qcommon/net_chan.c address, loopback and scramble gate."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

FUNCTIONS=['NET_CompareBaseAdr','NET_AdrToString','NET_CompareAdr','NET_IsLocalAddress','NET_GetLoopPacket','NET_SendLoopPacket','NET_SendPacket','NET_OutOfBandPrint','NET_StringToAdr','Netchan_ScramblePacket','Netchan_UnScramblePacket']

def main():
    out=ROOT/'build/reference/netchan_complete';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/qcommon/net_chan.c'
    body=extract(original,FUNCTIONS)
    (out/'netchan_complete_under_test.inc').write_text(body,encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/netchan_complete_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/O2','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/netchan_complete_oracle.ml','--output','netchan_complete_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/netchan_complete_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:
        lines_a=native.splitlines();lines_b=mini.splitlines()
        for i,(a,b) in enumerate(zip(lines_a,lines_b),1):
            if a!=b:raise RuntimeError(f'netchan complete mismatch record {i}\nC: {a}\nM: {b}')
        raise RuntimeError(f'netchan complete record count mismatch C={len(lines_a)} MiniLang={len(lines_b)}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/netchan_complete_contracts.ml','--output','netchan_complete_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/netchan_complete_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 16 complete net_chan contracts':raise RuntimeError(contracts)
    sources=[original,harness,ROOT/'src/mq3/qcommon/netchan.ml',ROOT/'src/mq3/qcommon/net_transport.ml',ROOT/'tests/netchan_complete_oracle.ml',ROOT/'tests/netchan_complete_contracts.ml']
    result={'passed':True,'unchanged_c_records':len(native.splitlines()),'contracts':16,'functions':FUNCTIONS,'scope':'Exact IPv4/IPX address comparison and formatting, localhost/default/explicit-port parsing, 16-slot bidirectional loopback rings, NET_SendPacket routing, OOB print framing, and the reversible inactive packet scrambler. Productive Netchan transmit/process traverses the same loopback ring for plain and fragmented 1301-byte messages, including duplicate rejection.','remaining':'Sys_SendPacket and DNS are platform callbacks; adaptive OOB data remains covered by the Huffman and live UDP transport gates.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['unchanged_c_records']} exact Baseq3 net_chan records + 16 productive contracts")
if __name__=='__main__':main()
