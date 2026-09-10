"""Direct differential test for Baseq3 entity/player state delta packets."""
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

HUFF=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Init']
CORE=['MSG_Init','MSG_BeginReading','MSG_WriteBits','MSG_ReadBits','MSG_WriteByte','MSG_WriteShort','MSG_WriteLong','MSG_ReadByte','MSG_ReadShort','MSG_ReadLong','MSG_initHuffman']
DELTA=['MSG_WriteDeltaEntity','MSG_ReadDeltaEntity','MSG_WriteDeltaPlayerstate','MSG_ReadDeltaPlayerstate']
def main():
 out=ROOT/'build/reference/message_state_delta';out.mkdir(parents=True,exist_ok=True)
 hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c';msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c';text=msrc.read_text(encoding='utf-8',errors='replace')
 (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF),encoding='utf-8',newline='\n')
 table=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',text,re.S)
 (out/'message_core_under_test.inc').write_text(table.group(0)+'\n'+extract(msrc,CORE),encoding='utf-8',newline='\n')
 tables=[]
 for name in ('entityStateFields','playerStateFields'):
  match=re.search(r'netField_t\s+'+name+r'\[\]\s*=\s*\{.*?\};',text,re.S)
  if not match: raise RuntimeError(name+' table missing')
  tables.append(match.group(0))
 (out/'message_state_delta_under_test.inc').write_text('\n'.join(tables)+'\n'+extract(msrc,DELTA),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/message_state_delta_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/message_state_delta_oracle.ml','--output','message_state_delta_oracle.exe'],check=True)
 mini=run([ROOT/'build/message_state_delta_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b: raise RuntimeError(f'state delta mismatch record {i+1}\nnative: {a}\nmini:   {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/message_state_delta_contracts.ml','--output','message_state_delta_contracts.exe'],check=True)
 contracts=run([ROOT/'build/message_state_delta_contracts.exe'],ROOT/'build',log=out/'contracts.log')
 if 'PASS: 28 state-delta contracts' not in contracts: raise RuntimeError(contracts)
 sources=[hsrc,msrc,harness,ROOT/'src/mq3/qcommon/message_state_delta.ml',ROOT/'tests/message_state_delta_oracle.ml',ROOT/'tests/message_state_delta_contracts.ml']
 result={'passed':True,'records':len(native.splitlines()),'contracts':28,'scope':'Protocol-68 entityState_t and playerState_t delta netfields, lc markers, entity remove/no-delta/force, zero/integral/full float modes, signed player fields, stats/persistant/ammo/powerups masks, malformed field counts and truncated lc markers with exact compressed packet bytes and reconstructed states.','oracle':'Unchanged MSG_WriteDeltaEntity, MSG_ReadDeltaEntity, MSG_WriteDeltaPlayerstate and MSG_ReadDeltaPlayerstate bodies extracted from pinned Baseq3 qcommon/msg.c; exhaustive independent physical-offset fixtures exercise all 51 entity and 48 player netfields.','remaining':'Usercmd delta coding is covered separately; snapshot assembly and UDP connection flow remain open.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: {len(native.splitlines())} exact Baseq3 entity/player delta packets + 28 contracts')
if __name__=='__main__':main()
