"""Differential complete Baseq3 server snapshot message orchestration test."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
HUFF=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Init']
MSG=['MSG_Init','MSG_Clear','MSG_WriteBits','MSG_WriteByte','MSG_WriteShort','MSG_WriteLong','MSG_WriteData','MSG_WriteString','MSG_initHuffman']
DELTA=['MSG_WriteDeltaEntity','MSG_WriteDeltaPlayerstate']
SNAP=['SV_EmitPacketEntities','SV_WriteSnapshotToClient','SV_UpdateServerCommandsToClient']
def main():
 out=ROOT/'build/reference/snapshot_send';out.mkdir(parents=True,exist_ok=True)
 hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c';msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c';ssrc=ROOT/'Quake-III-Arena-original-source/code/server/sv_snapshot.c';text=msrc.read_text(encoding='utf-8',errors='replace')
 table=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',text,re.S);tables=[]
 for name in ('entityStateFields','playerStateFields'): tables.append(re.search(r'netField_t\s+'+name+r'\[\]\s*=\s*\{.*?\};',text,re.S).group(0))
 (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF),encoding='utf-8',newline='\n')
 (out/'message_under_test.inc').write_text(table.group(0)+'\n'+extract(msrc,MSG),encoding='utf-8',newline='\n')
 (out/'message_delta_under_test.inc').write_text('\n'.join(tables)+'\n'+extract(msrc,DELTA),encoding='utf-8',newline='\n')
 (out/'snapshot_under_test.inc').write_text(extract(ssrc,SNAP),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/snapshot_send_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_send_oracle.ml','--output','snapshot_send_oracle.exe'],check=True)
 mini=run([ROOT/'build/snapshot_send_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b: raise RuntimeError(f'snapshot-send mismatch record {i+1}\nnative: {a}\nmini:   {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_send_contracts.ml','--output','snapshot_send_contracts.exe'],check=True)
 contracts=run([ROOT/'build/snapshot_send_contracts.exe'],ROOT/'build',log=out/'contracts.log')
 if 'PASS: 25 snapshot-send contracts' not in contracts: raise RuntimeError(contracts)
 sources=[hsrc,msrc,ssrc,harness,ROOT/'src/mq3/server/snapshot_send.ml',ROOT/'tests/snapshot_send_oracle.ml',ROOT/'tests/snapshot_send_contracts.ml']
 result={'passed':True,'records':len(native.splitlines()),'contracts':25,'scope':'Complete server snapshot message from lastClientCommand acknowledgement through reliable commands, delta selection, snapshot flags/payload, packet padding, download callback and svc_EOF; frame send metadata, rate scheduling, inactive/local/LAN timing and explicit Netchan transmit boundary.','oracle':'Unchanged SV_UpdateServerCommandsToClient, SV_WriteSnapshotToClient and SV_EmitPacketEntities bodies from pinned Baseq3, using unchanged MSG/Huffman/state-delta bodies, compared as complete compressed messages through svc_EOF.','remaining':'SV_BuildClientSnapshot is covered separately; real download window contents, Netchan queue/encode and UDP delivery remain explicit services or later integration.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f'PASS: {len(native.splitlines())} exact full Baseq3 snapshot messages + 25 contracts')
if __name__=='__main__':main()
