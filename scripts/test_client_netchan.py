"""Direct differential test for the protocol-68 client netchan wrapper."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
HUFF=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Init']
CORE=['MSG_Init','MSG_InitOOB','MSG_Clear','MSG_BeginReading','MSG_BeginReadingOOB','MSG_Bitstream','MSG_WriteBits','MSG_ReadBits','MSG_WriteByte','MSG_WriteShort','MSG_WriteLong','MSG_WriteData','MSG_ReadShort','MSG_ReadLong','MSG_initHuffman']
NET=['Netchan_Init','Netchan_Setup','Netchan_TransmitNextFragment','Netchan_Transmit','Netchan_Process']
CLIENT=['CL_Netchan_Encode','CL_Netchan_Decode','CL_Netchan_TransmitNextFragment','CL_Netchan_Transmit','CL_Netchan_Process']
def main():
 subprocess.run([sys.executable,ROOT/'scripts/test_netchan.py'],check=True)
 out=ROOT/'build/reference/client_netchan';out.mkdir(parents=True,exist_ok=True)
 hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c';msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c';nsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/net_chan.c';csrc=ROOT/'Quake-III-Arena-original-source/code/client/cl_net_chan.c'
 (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF),encoding='utf-8',newline='\n')
 text=msrc.read_text(encoding='utf-8',errors='replace');table=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',text,re.S)
 (out/'message_core_under_test.inc').write_text(table.group(0)+'\n'+extract(msrc,CORE),encoding='utf-8',newline='\n')
 (out/'netchan_under_test.inc').write_text(extract(nsrc,NET),encoding='utf-8',newline='\n');(out/'client_netchan_under_test.inc').write_text(extract(csrc,CLIENT),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/client_netchan_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_netchan_oracle.ml','--output','client_netchan_oracle.exe'],check=True);mini=run([ROOT/'build/client_netchan_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b:raise RuntimeError(f'client netchan mismatch record {i+1}\nnative: {a}\nmini:   {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_netchan_contracts.ml','--output','client_netchan_contracts.exe'],check=True);contracts=run([ROOT/'build/client_netchan_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 18 client netchan contracts':raise RuntimeError(contracts)
 sources=[hsrc,msrc,nsrc,csrc,harness,ROOT/'src/mq3/client/netchan.ml',ROOT/'tests/client_netchan_oracle.ml',ROOT/'tests/client_netchan_contracts.ml']
 result={'passed':True,'records':len(native.splitlines()),'contracts':18,'functions':CLIENT,'scope':'Exact protocol-68 client encode/decode, EOF append, qcommon transmit and fragment forwarding, accepted process/decode and newsize accounting.','oracle':'Unchanged client/cl_net_chan.c bodies run over unchanged qcommon/net_chan.c and msg.c/Huffman bodies; complete packet/message bytes and channel state are compared.','transport_boundary':'NET_SendPacket remains an injected host service.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {result['records']} exact client-netchan records with full bytes + 18 contracts")
if __name__=='__main__':main()
