"""Differential Baseq3 adaptive Huffman and compressed MSG bitstream test."""
import json, re, subprocess, sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

HUFF_FUNCS=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Decompress','Huff_Compress','Huff_Init']
MSG_FUNCS=['MSG_Init','MSG_Bitstream','MSG_BeginReading','MSG_WriteBits','MSG_ReadBits','MSG_initHuffman']

def main():
    out=ROOT/'build/reference/huffman_message';out.mkdir(parents=True,exist_ok=True)
    hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c'
    msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c'
    (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF_FUNCS),encoding='utf-8',newline='\n')
    text=msrc.read_text(encoding='utf-8',errors='replace')
    table=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',text,re.S)
    if not table: raise RuntimeError('msg_hData not found')
    (out/'message_huffman_under_test.inc').write_text(table.group(0)+'\n'+extract(msrc,MSG_FUNCS),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/huffman_message_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/huffman_message_oracle.ml','--output','huffman_message_oracle.exe'],check=True)
    mini=run([ROOT/'build/huffman_message_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:
        aa=native.splitlines();bb=mini.splitlines()
        for i in range(max(len(aa),len(bb))):
            a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
            if a!=b: raise RuntimeError(f'Huffman mismatch at record {i+1}\nnative: {a}\nmini:   {b}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/huffman_message_contracts.ml','--output','huffman_message_contracts.exe'],check=True)
    contracts=run([ROOT/'build/huffman_message_contracts.exe'],ROOT/'build',log=out/'contracts.log')
    if 'PASS: 83 Huffman/message contracts' not in contracts: raise RuntimeError(contracts)
    result={'passed':True,'records':len(native.splitlines()),'contracts':83,
      'scope':'Adaptive Huffman tree updates, packet-level Huff_Compress/Huff_Decompress with a 12-byte OOB prefix, LSB-first bit primitives, protocol-68 pretrained message tree, compressed MSG_WriteBits/MSG_ReadBits for valid widths, signed byte/short reads, cursors and overflow reserve.',
      'oracle':'Unchanged extracted Baseq3 qcommon/huffman.c and qcommon/msg.c function bodies with host-only engine type/error stubs.',
      'remaining':'Delta entity/playerstate codecs, scalar/usercmd deltas and float/angle helpers are separate gates or pending blocks.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [hsrc,msrc,harness,ROOT/'src/mq3/qcommon/huffman.ml',ROOT/'src/mq3/qcommon/message.ml',ROOT/'tests/huffman_message_oracle.ml',ROOT/'tests/huffman_message_contracts.ml']}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: {len(native.splitlines())} exact Baseq3 Huffman/message records + 83 contracts')
if __name__=='__main__':main()
