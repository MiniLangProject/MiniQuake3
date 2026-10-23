"""Direct Baseq3 server netchan encode/decode, fragment and queue gate."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

HUFF=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Init']
MSG=['MSG_Init','MSG_InitOOB','MSG_Clear','MSG_Copy','MSG_WriteBits','MSG_WriteByte','MSG_WriteShort','MSG_WriteLong','MSG_WriteData','MSG_ReadBits','MSG_ReadLong','MSG_ReadShort','MSG_BeginReadingOOB','MSG_initHuffman']
NET=['Netchan_TransmitNextFragment','Netchan_Transmit','Netchan_Process']
SERVER=['SV_Netchan_Encode','SV_Netchan_Decode','SV_Netchan_TransmitNextFragment','SV_Netchan_Transmit','SV_Netchan_Process']

def extract_balanced(source,names):
    text=source.read_text(encoding='utf-8',errors='replace');out=[]
    for name in names:
        match=re.search(r'^[\w* \t]+\b'+re.escape(name)+r'\s*\([^;{}]*\)\s*\{',text,re.M)
        if not match:raise RuntimeError('Missing original function '+name)
        pos=match.end();depth=1;quote=None;line=False;block=False
        while depth and pos<len(text):
            ch=text[pos];nxt=text[pos+1] if pos+1<len(text) else ''
            if line:
                if ch=='\n':line=False
            elif block:
                if ch=='*' and nxt=='/':block=False;pos+=1
            elif quote:
                if ch=='\\':pos+=1
                elif ch==quote:quote=None
            elif ch=='/' and nxt=='/':line=True;pos+=1
            elif ch=='/' and nxt=='*':block=True;pos+=1
            elif ch in ('\"',"'"):quote=ch
            elif ch=='{':depth+=1
            elif ch=='}':depth-=1
            pos+=1
        if depth:raise RuntimeError('Unbalanced original function '+name)
        out.append(text[match.start():pos])
    return '\n\n'.join(out)+'\n'

def main():
    out=ROOT/'build/reference/server_netchan';out.mkdir(parents=True,exist_ok=True)
    hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c'
    msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c'
    nsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/net_chan.c'
    ssrc=ROOT/'Quake-III-Arena-original-source/code/server/sv_net_chan.c'
    table=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',msrc.read_text(encoding='utf-8',errors='replace'),re.S)
    (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF),encoding='utf-8',newline='\n')
    (out/'message_under_test.inc').write_text(table.group(0)+'\n'+extract(msrc,MSG),encoding='utf-8',newline='\n')
    (out/'netchan_under_test.inc').write_text(extract(nsrc,NET),encoding='utf-8',newline='\n')
    (out/'server_netchan_under_test.inc').write_text(extract_balanced(ssrc,SERVER),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/server_netchan_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_netchan_oracle.ml','--output','server_netchan_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/server_netchan_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:
        aa=native.splitlines();bb=mini.splitlines()
        for i in range(max(len(aa),len(bb))):
            a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
            if a!=b:raise RuntimeError(f'server-netchan mismatch record {i+1}\nC: {a}\nM: {b}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_netchan_contracts.ml','--output','server_netchan_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/server_netchan_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 26 server-netchan contracts':raise RuntimeError(contracts)
    # Verify both productive UDP boundaries use this same native module. Client
    # packets enter via ServerPacketEvent/ServerClientMessage; snapshots leave
    # through the live match loop and its server netchan adapter.
    productive = [
        ('tests/server_network_ingress_contracts.ml', 'server_network_ingress_contracts.exe',
         'PASS: 19 server network-ingress contracts'),
        ('tests/network_match_loop_contracts.ml', 'network_match_loop_contracts.exe',
         'PASS: 48 live network match-loop contracts'),
    ]
    for source, executable, expected in productive:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',executable],cwd=ROOT,check=True)
        value=run([ROOT/'build'/executable],ROOT/'build',log=out/(executable+'.log')).strip()
        if value!=expected:raise RuntimeError(value)
    sources=[hsrc,msrc,nsrc,ssrc,harness,ROOT/'src/mq3/server/netchan.ml',ROOT/'tests/server_netchan_oracle.ml',ROOT/'tests/server_netchan_contracts.ml',ROOT/'src/mq3/server/network_ingress.ml',ROOT/'src/mq3/client/network_match_loop.ml',ROOT/'tests/server_network_ingress_contracts.ml',ROOT/'tests/network_match_loop_contracts.ml']
    report={'passed':True,'unchanged_c_records':len(native.splitlines()),'native_contracts':26,'productive_contracts':67,'functions':SERVER,'scope':'All five sv_net_chan.c functions: exact server encode/decode bytes, netchan packet bytes, svc_EOF, fragment drain and deferred unencoded FIFO messages; productive localhost UDP ingress and outbound snapshot loops use the same native server netchan.','remaining':'NET_SendPacket intentionally remains the platform UDP host boundary.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: 5/5 sv_net_chan functions, {report["unchanged_c_records"]} unchanged-C records + 26 native + 67 productive contracts')
if __name__=='__main__':main()
