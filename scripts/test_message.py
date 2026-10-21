"""Differential byte-aligned Baseq3 qcommon/msg.c primitive-message test."""
import json
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'MSG_Init','MSG_InitOOB','MSG_Clear','MSG_Bitstream','MSG_BeginReading',
    'MSG_BeginReadingOOB','MSG_Copy','MSG_WriteBits','MSG_WriteChar','MSG_WriteByte',
    'MSG_WriteData','MSG_WriteShort','MSG_WriteLong','MSG_WriteFloat','MSG_WriteString',
    'MSG_WriteBigString','MSG_WriteAngle','MSG_WriteAngle16',
    'MSG_ReadBits','MSG_ReadChar','MSG_ReadByte','MSG_ReadShort','MSG_ReadLong',
    'MSG_ReadFloat','MSG_ReadString','MSG_ReadBigString','MSG_ReadStringLine',
    'MSG_ReadAngle16','MSG_ReadData'
]

def main():
    out=ROOT/'build/reference/message'; out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c'
    include=out/'msg_under_test.inc'
    include.write_text(extract(original,FUNCTIONS),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/message_oracle.c'; oracle=out/'message_oracle.exe'
    run(['cl','/nologo','/Od','/Gy','/fp:strict','/MT','/D_CRT_SECURE_NO_WARNINGS',
         f'/I{out}',harness,f'/Fe:{oracle}','/link','/OPT:REF','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/message_oracle.ml','--output','message_oracle.exe'],check=True)
    mini=run([ROOT/'build/message_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native != mini:
        aa=native.splitlines(); bb=mini.splitlines()
        for i in range(max(len(aa),len(bb))):
            a=aa[i] if i<len(aa) else '<missing>'; b=bb[i] if i<len(bb) else '<missing>'
            if a!=b: raise RuntimeError(f'msg.c mismatch at record {i+1}\nnative: {a[:500]}\nmini:   {b[:500]}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/message_contracts.ml','--output','message_contracts.exe'],check=True)
    contracts=run([ROOT/'build/message_contracts.exe'],ROOT/'build',log=out/'contracts.log')
    if 'PASS: 37 message-buffer contracts' not in contracts: raise RuntimeError(contracts)
    for mode in ('bad-write-zero','bad-write-width','bad-read-width'):
        rejected=subprocess.run([ROOT/'build/message_contracts.exe',mode],cwd=ROOT/'build',capture_output=True,text=True)
        if rejected.returncode == 0: raise RuntimeError(f'message rejection case unexpectedly succeeded: {mode}')
    records=len(native.splitlines())
    result={'passed':True,'records':records,'contracts':37,
      'scope':'Byte-aligned OOB msg_t initialization/state/copy, byte/char/short/long/float/angle/data/normal-string/big-string reads and writes, little-endian and signed behavior, four-byte write reserve overflow, safe read boundaries, C-string limits and sanitization. Compressed bitstreams have a separate Huffman gate; delta codecs and netchan are outside this block.',
      'oracle':'Unchanged extracted Baseq3 qcommon/msg.c function bodies; host stubs only unreachable Huffman services and engine memory/error callbacks.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [original,harness,ROOT/'src/mq3/qcommon/message.ml',ROOT/'tests/message_oracle.ml',ROOT/'tests/message_contracts.ml']}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: {records} exact Baseq3 msg.c OOB records + 37 contracts')

if __name__=='__main__': main()
