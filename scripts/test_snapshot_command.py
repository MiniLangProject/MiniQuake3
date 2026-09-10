"""Direct differential test for Baseq3 CL_ParseSnapshot state transitions."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

HUFF=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Init']
CORE=['MSG_Init','MSG_BeginReading','MSG_WriteBits','MSG_ReadBits','MSG_WriteByte','MSG_WriteShort','MSG_WriteLong','MSG_ReadByte','MSG_ReadShort','MSG_ReadLong','MSG_WriteData','MSG_ReadData','MSG_initHuffman']
DELTA=['MSG_WriteDeltaEntity','MSG_ReadDeltaEntity','MSG_WriteDeltaPlayerstate','MSG_ReadDeltaPlayerstate']
CLIENT=['CL_DeltaEntity','CL_ParsePacketEntities','CL_ParseSnapshot']
def main():
 out=ROOT/'build/reference/snapshot_command';out.mkdir(parents=True,exist_ok=True)
 hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c';msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c';csrc=ROOT/'Quake-III-Arena-original-source/code/client/cl_parse.c';text=msrc.read_text(encoding='utf-8',errors='replace')
 (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF),encoding='utf-8',newline='\n')
 hdata=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',text,re.S)
 (out/'message_core_under_test.inc').write_text(hdata.group(0)+'\n'+extract(msrc,CORE),encoding='utf-8',newline='\n')
 tables=[]
 for name in ('entityStateFields','playerStateFields'):
  match=re.search(r'netField_t\s+'+name+r'\[\]\s*=\s*\{.*?\};',text,re.S)
  if not match:raise RuntimeError(name+' table missing')
  tables.append(match.group(0))
 (out/'message_state_delta_under_test.inc').write_text('\n'.join(tables)+'\n'+extract(msrc,DELTA),encoding='utf-8',newline='\n')
 (out/'snapshot_command_under_test.inc').write_text(extract(csrc,CLIENT),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/snapshot_command_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_command_oracle.ml','--output','snapshot_command_oracle.exe'],check=True)
 mini=run([ROOT/'build/snapshot_command_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b:raise RuntimeError(f'snapshot command mismatch record {i+1}\nnative: {a}\nmini:   {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/snapshot_command_contracts.ml','--output','snapshot_command_contracts.exe'],check=True)
 contracts=run([ROOT/'build/snapshot_command_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 10 client snapshot-command contracts':raise RuntimeError(contracts)
 sources=[hsrc,msrc,csrc,harness,ROOT/'src/mq3/client/snapshot_command.ml',ROOT/'tests/snapshot_command_oracle.ml',ROOT/'tests/snapshot_command_contracts.ml']
 result={'passed':True,'records':len(native.splitlines()),'contracts':10,'scope':'CL_ParseSnapshot header, full/delta validity, playerstate and packet-entity decode, circular storage with value-copied area masks, gap invalidation, invalid-frame consumption, parse-ring age, ping and demo-waiting transitions.','oracle':'Unchanged CL_DeltaEntity, CL_ParsePacketEntities and CL_ParseSnapshot bodies extracted from pinned Baseq3 client/cl_parse.c and executed with unchanged message/Huffman delta functions.','remaining':'Server-message dispatch, gamestate parsing and live network integration remain open.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: {len(native.splitlines())} exact Baseq3 client snapshot transitions + 10 contracts')
if __name__=='__main__':main()
