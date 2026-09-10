"""Direct differential test for Baseq3 server packet-entity snapshot merge."""
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

HUFF=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Init']
CORE=['MSG_Init','MSG_BeginReading','MSG_WriteBits','MSG_ReadBits','MSG_WriteByte','MSG_WriteShort','MSG_WriteLong','MSG_ReadByte','MSG_ReadShort','MSG_ReadLong','MSG_initHuffman']
DELTA=['MSG_WriteDeltaEntity']
SNAPSHOT=['SV_EmitPacketEntities']
def main():
 out=ROOT/'build/reference/snapshot_delta';out.mkdir(parents=True,exist_ok=True)
 hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c';msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c';ssrc=ROOT/'Quake-III-Arena-original-source/code/server/sv_snapshot.c'
 text=msrc.read_text(encoding='utf-8',errors='replace')
 (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF),encoding='utf-8',newline='\n')
 table=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',text,re.S)
 (out/'message_core_under_test.inc').write_text(table.group(0)+'\n'+extract(msrc,CORE),encoding='utf-8',newline='\n')
 entity_table=re.search(r'netField_t\s+entityStateFields\[\]\s*=\s*\{.*?\};',text,re.S)
 (out/'message_entity_delta_under_test.inc').write_text(entity_table.group(0)+'\n'+extract(msrc,DELTA),encoding='utf-8',newline='\n')
 (out/'snapshot_emit_under_test.inc').write_text(extract(ssrc,SNAPSHOT),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/snapshot_delta_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_delta_oracle.ml','--output','snapshot_delta_oracle.exe'],check=True)
 mini=run([ROOT/'build/snapshot_delta_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b: raise RuntimeError(f'snapshot delta mismatch record {i+1}\nnative: {a}\nmini:   {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_delta_contracts.ml','--output','snapshot_delta_contracts.exe'],check=True)
 contracts=run([ROOT/'build/snapshot_delta_contracts.exe'],ROOT/'build',log=out/'contracts.log')
 if 'PASS: 26 snapshot-delta contracts' not in contracts: raise RuntimeError(contracts)
 sources=[hsrc,msrc,ssrc,harness,ROOT/'src/mq3/server/snapshot_delta.ml',ROOT/'tests/snapshot_delta_oracle.ml',ROOT/'tests/snapshot_delta_contracts.ml']
 result={'passed':True,'records':len(native.splitlines()),'contracts':26,'scope':'SV_EmitPacketEntities sorted two-way merge, baseline additions, removals, unchanged omission, changed deltas, protocol terminator and circular snapshot-ring addressing with exact compressed packet bytes; plus delta-frame validity and snapshot payload header, area bits, playerstate and entities.','oracle':'Unchanged SV_EmitPacketEntities body extracted from pinned Baseq3 server/sv_snapshot.c, calling unchanged MSG_WriteDeltaEntity and protocol-68 Huffman message code.','remaining':'Snapshot visibility construction, client frame lookup/storage, reliable commands and UDP send scheduling remain open.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: {len(native.splitlines())} exact Baseq3 snapshot entity packets + 26 contracts')
if __name__=='__main__':main()
