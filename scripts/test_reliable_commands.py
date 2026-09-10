"""Differential Baseq3 reliable server-command snapshot embedding test."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

HUFF=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Init']
MSG=['MSG_Init','MSG_WriteBits','MSG_WriteByte','MSG_WriteLong','MSG_WriteData','MSG_WriteString','MSG_initHuffman']
def main():
 out=ROOT/'build/reference/reliable_commands';out.mkdir(parents=True,exist_ok=True)
 hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c';msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c';ssrc=ROOT/'Quake-III-Arena-original-source/code/server/sv_snapshot.c'
 text=msrc.read_text(encoding='utf-8',errors='replace');table=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',text,re.S)
 (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF),encoding='utf-8',newline='\n')
 (out/'message_under_test.inc').write_text(table.group(0)+'\n'+extract(msrc,MSG),encoding='utf-8',newline='\n')
 (out/'reliable_under_test.inc').write_text(extract(ssrc,['SV_UpdateServerCommandsToClient']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/reliable_commands_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/reliable_commands_oracle.ml','--output','reliable_commands_oracle.exe'],check=True)
 mini=run([ROOT/'build/reliable_commands_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b: raise RuntimeError(f'reliable-command mismatch record {i+1}\nnative: {a}\nmini:   {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/reliable_commands_contracts.ml','--output','reliable_commands_contracts.exe'],check=True)
 contracts=run([ROOT/'build/reliable_commands_contracts.exe'],ROOT/'build',log=out/'contracts.log')
 if 'PASS: 19 reliable-command contracts' not in contracts: raise RuntimeError(contracts)
 sources=[hsrc,msrc,ssrc,harness,ROOT/'src/mq3/server/reliable_commands.ml',ROOT/'tests/reliable_commands_oracle.ml',ROOT/'tests/reliable_commands_contracts.ml']
 result={'passed':True,'records':len(native.splitlines()),'contracts':19,'scope':'SV_UpdateServerCommandsToClient reliable acknowledgement range, 64-slot masked ring lookup, resend behavior, absolute sequence encoding, reliableSent advancement, command string encoding and ring wrap.','oracle':'Unchanged SV_UpdateServerCommandsToClient from pinned Baseq3 sv_snapshot.c calling unchanged protocol-68 MSG and Huffman bodies.','remaining':'Full SV_WriteSnapshotToClient orchestration, visibility/frame construction, download embedding, packet padding and UDP scheduling remain open.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: {len(native.splitlines())} exact Baseq3 reliable-command streams + 19 contracts')
if __name__=='__main__':main()
