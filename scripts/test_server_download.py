"""Differential Baseq3 server download-window test."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
HUFF=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Init']
MSG=['MSG_Init','MSG_Clear','MSG_WriteBits','MSG_WriteByte','MSG_WriteShort','MSG_WriteLong','MSG_WriteData','MSG_WriteString','MSG_initHuffman']
def main():
 out=ROOT/'build/reference/server_download';out.mkdir(parents=True,exist_ok=True);hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c';msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c';src=ROOT/'Quake-III-Arena-original-source/code/server/sv_client.c';text=msrc.read_text(encoding='utf8',errors='replace');table=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',text,re.S)
 (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF),encoding='utf8',newline='\n');(out/'message_under_test.inc').write_text(table.group(0)+'\n'+extract(msrc,MSG),encoding='utf8',newline='\n');(out/'download_under_test.inc').write_text(extract(src,['SV_CloseDownload','SV_NextDownload_f','SV_WriteDownloadToClient']),encoding='utf8',newline='\n')
 harness=ROOT/'tests/reference/server_download_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_download_oracle.ml','--output','server_download_oracle.exe'],check=True);mini=run([ROOT/'build/server_download_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b: raise RuntimeError(f'download mismatch record {i+1}\nnative: {a}\nmini:   {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_download_contracts.ml','--output','server_download_contracts.exe'],check=True);contracts=run([ROOT/'build/server_download_contracts.exe'],ROOT/'build',log=out/'contracts.log')
 if 'PASS: 19 server-download contracts' not in contracts: raise RuntimeError(contracts)
 files=[hsrc,msrc,src,harness,ROOT/'src/mq3/server/download.ml',ROOT/'tests/server_download_oracle.ml',ROOT/'tests/server_download_contracts.ml'];result={'passed':True,'records':len(native.splitlines()),'contracts':19,'scope':'SV_WriteDownloadToClient eight-block/2048-byte window, rate and message packet budgets, EOF block, timeout resend and SV_NextDownload_f acknowledgement/close/drop semantics.','oracle':'Unchanged SV_WriteDownloadToClient, SV_NextDownload_f and SV_CloseDownload bodies with unchanged compressed MSG/Huffman bodies and filesystem-only host stubs.','remaining':'Filesystem policy is callback-backed; Netchan delivery is covered by snapshot_send, and client download parsing/storage remains separate.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf8',newline='\n');print(f'PASS: {len(native.splitlines())} exact Baseq3 server-download records + 19 contracts')
if __name__=='__main__':main()
