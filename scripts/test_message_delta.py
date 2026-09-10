"""Differential Baseq3 scalar/key/usercmd message delta test."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

HUFF_FUNCS=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Init']
MSG_FUNCS=['MSG_Init','MSG_BeginReading','MSG_WriteBits','MSG_ReadBits','MSG_initHuffman','MSG_WriteDelta','MSG_ReadDelta','MSG_WriteDeltaFloat','MSG_ReadDeltaFloat','MSG_WriteDeltaKey','MSG_ReadDeltaKey','MSG_WriteDeltaKeyFloat','MSG_ReadDeltaKeyFloat','MSG_WriteDeltaUsercmd','MSG_ReadDeltaUsercmd','MSG_WriteDeltaUsercmdKey','MSG_ReadDeltaUsercmdKey']

def main():
 out=ROOT/'build/reference/message_delta';out.mkdir(parents=True,exist_ok=True)
 hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c';msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c'
 (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF_FUNCS),encoding='utf-8',newline='\n')
 text=msrc.read_text(encoding='utf-8',errors='replace');table=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',text,re.S);masks=re.search(r'int\s+kbitmask\[32\]\s*=\s*\{.*?\};',text,re.S)
 if not table or not masks:raise RuntimeError('msg_hData/kbitmask not found')
 (out/'message_delta_under_test.inc').write_text(table.group(0)+'\n'+masks.group(0)+'\n'+extract(msrc,MSG_FUNCS),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/message_delta_oracle.c';oracle=out/'oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([oracle],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/message_delta_oracle.ml','--output','message_delta_oracle.exe'],check=True)
 mini=run([ROOT/'build/message_delta_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b:raise RuntimeError(f'message delta mismatch at record {i+1}\nnative: {a}\nmini:   {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/message_delta_contracts.ml','--output','message_delta_contracts.exe'],check=True)
 contracts=run([ROOT/'build/message_delta_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 52 message delta contracts':raise RuntimeError(contracts)
 result={'passed':True,'records':len(native.splitlines()),'contracts':52,'functions':MSG_FUNCS[5:],'byte_comparison':'complete protocol-68 Huffman-compressed message bytes plus cursors and decoded fields','scope':'Scalar integer/float deltas, XOR-key variants, and plain/keyed usercmd deltas including 8/32-bit time, angles, signed moves, buttons, weapon and keyed unchanged-payload fast path.','remaining':'EntityState and PlayerState delta tables/codecs are separate pending blocks.','oracle':'Unchanged extracted Baseq3 qcommon/msg.c and qcommon/huffman.c function bodies with host-only engine types and error stubs.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [hsrc,msrc,harness,ROOT/'src/mq3/qcommon/message_delta.ml',ROOT/'tests/message_delta_oracle.ml',ROOT/'tests/message_delta_contracts.ml']}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: {len(native.splitlines())} exact Baseq3 message-delta records with full bytes + 52 contracts')
if __name__=='__main__':main()
