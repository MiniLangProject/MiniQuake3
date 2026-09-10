"""Direct differential test for Baseq3 CL_ParseGamestate."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
HUFF=['Huff_putBit','Huff_getBit','add_bit','get_bit','get_ppnode','free_ppnode','swap','swaplist','increment','Huff_addRef','Huff_Receive','Huff_offsetReceive','send','Huff_transmit','Huff_offsetTransmit','Huff_Init']
CORE=['MSG_Init','MSG_BeginReading','MSG_WriteBits','MSG_ReadBits','MSG_WriteByte','MSG_WriteShort','MSG_WriteLong','MSG_WriteData','MSG_WriteBigString','MSG_ReadByte','MSG_ReadShort','MSG_ReadLong','MSG_ReadBigString','MSG_initHuffman']
DELTA=['MSG_WriteDeltaEntity','MSG_ReadDeltaEntity'];CLIENT=['CL_ParseGamestate']
def main():
 out=ROOT/'build/reference/gamestate';out.mkdir(parents=True,exist_ok=True);hsrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/huffman.c';msrc=ROOT/'Quake-III-Arena-original-source/code/qcommon/msg.c';csrc=ROOT/'Quake-III-Arena-original-source/code/client/cl_parse.c';text=msrc.read_text(encoding='utf-8',errors='replace')
 (out/'huffman_under_test.inc').write_text(extract(hsrc,HUFF),encoding='utf-8',newline='\n');table=re.search(r'int\s+msg_hData\[256\]\s*=\s*\{.*?\};',text,re.S);(out/'message_core_under_test.inc').write_text(table.group(0)+'\n'+extract(msrc,CORE),encoding='utf-8',newline='\n')
 et=re.search(r'netField_t\s+entityStateFields\[\]\s*=\s*\{.*?\};',text,re.S);(out/'message_state_delta_under_test.inc').write_text(et.group(0)+'\n'+extract(msrc,DELTA),encoding='utf-8',newline='\n');(out/'gamestate_under_test.inc').write_text(extract(csrc,CLIENT),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/gamestate_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/gamestate_oracle.ml','--output','gamestate_oracle.exe'],check=True);mini=run([ROOT/'build/gamestate_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('gamestate mismatch\nnative: '+native+'\nmini:   '+mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/gamestate_contracts.ml','--output','gamestate_contracts.exe'],check=True);contracts=run([ROOT/'build/gamestate_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 12 gamestate contracts':raise RuntimeError(contracts)
 sources=[hsrc,msrc,csrc,harness,ROOT/'src/mq3/qcommon/message.ml',ROOT/'src/mq3/client/gamestate.ml',ROOT/'tests/gamestate_oracle.ml',ROOT/'tests/gamestate_contracts.ml'];result={'passed':True,'records':1,'contracts':12,'scope':'CL_ParseGamestate configstring storage/offsets including BigString, entity baselines, server command sequence, clientNum, checksumFeed, reset and completion callbacks.','oracle':'Unchanged CL_ParseGamestate from pinned Baseq3 client/cl_parse.c with unchanged message/Huffman/entity-delta bodies.','remaining':'CL_SystemInfoChanged policy and filesystem/download implementations remain host callbacks.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: 1 exact Baseq3 gamestate transition + 12 contracts')
if __name__=='__main__':main()
