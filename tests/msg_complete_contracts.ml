import mq3.qcommon.msg as msg
import mq3.qcommon.message_delta as delta
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.compat.numeric as n

struct Capture lines end struct
function req(value,label) if not value then return error(6809,"msg complete: "+label) end if;return 1 end function
function capture(c,text) c.lines=c.lines+[text];return void end function
function sameCmd(a,b) return a.serverTime==b.serverTime and a.angles==b.angles and a.buttons==b.buttons and a.weapon==b.weapon and a.forwardmove==b.forwardmove and a.rightmove==b.rightmove and a.upmove==b.upmove end function
function main(args)
  count=0;storage=bytes(128,0);m=msg.MSG_Init(storage,128);count=count+req(not m.oob and m.data==storage and m.maxsize==128,"MSG_Init")
  o=msg.MSG_InitOOB(bytes(64,0),64);count=count+req(o.oob,"MSG_InitOOB");msg.MSG_WriteChar(o,-5);msg.MSG_WriteByte(o,250);msg.MSG_WriteShort(o,-1234);msg.MSG_WriteLong(o,0x12345678);msg.MSG_WriteFloat(o,-13.25);msg.MSG_WriteAngle(o,180.0);msg.MSG_WriteAngle16(o,-90.0)
  msg.MSG_BeginReadingOOB(o);count=count+req(msg.MSG_ReadChar(o)==-5 and msg.MSG_ReadByte(o)==250 and msg.MSG_ReadShort(o)==-1234 and msg.MSG_ReadLong(o)==0x12345678,"integer primitives");count=count+req(n.floatBits(msg.MSG_ReadFloat(o))==n.floatBits(-13.25) and msg.MSG_ReadByte(o)==128 and msg.MSG_ReadAngle16(o)==-90.0,"float and angles")
  msg.MSG_Clear(o);count=count+req(o.cursize==0 and not o.overflowed,"MSG_Clear");msg.MSG_Bitstream(o);count=count+req(not o.oob,"MSG_Bitstream")
  m=msg.MSG_Init(bytes(256,0),256);msg.MSG_WriteBits(m,31,5);msg.MSG_WriteBits(m,-2,-8);msg.MSG_BeginReading(m);count=count+req(msg.MSG_ReadBits(m,5)==31 and msg.MSG_ReadBits(m,-8)==-2,"bitstream bits")
  o=msg.MSG_InitOOB(bytes(9000,0),9000);msg.MSG_WriteData(o,bytes([1,2,3,4]),3);msg.MSG_WriteString(o,"ab%cd");msg.MSG_WriteBigString(o,"large");msg.MSG_BeginReadingOOB(o);count=count+req(msg.MSG_ReadData(o,3)==bytes([1,2,3]) and msg.MSG_ReadString(o)=="ab.cd" and msg.MSG_ReadBigString(o)=="large","data and strings")
  o=msg.MSG_InitOOB(bytes(32,0),32);msg.MSG_WriteString(o,"line%one\nnext");msg.MSG_BeginReadingOOB(o);count=count+req(msg.MSG_ReadStringLine(o)=="line.one","string line")
  copied=msg.MSG_Copy(o,64);count=count+req(copied.cursize==o.cursize and copied.data!=o.data and copied.maxsize==o.maxsize,"MSG_Copy")

  m=msg.MSG_Init(bytes(256,0),256);msg.MSG_WriteDelta(m,5,-7,-8);msg.MSG_WriteDeltaFloat(m,1.0,-2.5);msg.MSG_WriteDeltaKey(m,0x123,4,222,12);msg.MSG_WriteDeltaKeyFloat(m,0x2468ace0,3.0,-0.125);msg.MSG_BeginReading(m)
  count=count+req(msg.MSG_ReadDelta(m,5,-8)==-7,"integer delta");count=count+req(msg.MSG_ReadDeltaFloat(m,1.0)==-2.5,"float delta");count=count+req(msg.MSG_ReadDeltaKey(m,0x123,4,12)==222,"key delta");count=count+req(msg.MSG_ReadDeltaKeyFloat(m,0x2468ace0,3.0)==-0.125,"key float delta")
  before=delta.userCommand(1000,1,2,3,4,5,-6,7,-8);after=delta.userCommand(1020,9,2,3,0x1234,6,-128,127,0)
  m=msg.MSG_Init(bytes(512,0),512);msg.MSG_WriteDeltaUsercmd(m,before,after);msg.MSG_BeginReading(m);count=count+req(sameCmd(msg.MSG_ReadDeltaUsercmd(m,before),after),"usercmd delta")
  m=msg.MSG_Init(bytes(512,0),512);msg.MSG_WriteDeltaUsercmdKey(m,0x11223344,before,after);msg.MSG_BeginReading(m);count=count+req(sameCmd(msg.MSG_ReadDeltaUsercmdKey(m,0x11223344,before),after),"keyed usercmd delta")

  fromEntity=es.create();fromEntity.number=19;toEntity=es.copy(fromEntity);toEntity.origin=[1.25,-2.5,4095.0];toEntity.event=17
  m=msg.MSG_Init(bytes(1024,0),1024);count=count+req(msg.MSG_WriteDeltaEntity(m,fromEntity,toEntity,false),"write entity delta");msg.MSG_BeginReading(m);number=msg.MSG_ReadBits(m,10);gotEntity=msg.MSG_ReadDeltaEntity(m,fromEntity,number);count=count+req(gotEntity.number==19 and gotEntity.origin==toEntity.origin and gotEntity.event==17,"read entity delta")
  fromPlayer=ps.create();toPlayer=ps.copy(fromPlayer);toPlayer.origin=[7.0,8.5,-9.0];toPlayer.stats[3]=123;toPlayer.powerups[5]=456789
  m=msg.MSG_Init(bytes(2048,0),2048);msg.MSG_WriteDeltaPlayerstate(m,fromPlayer,toPlayer);msg.MSG_BeginReading(m);gotPlayer=msg.MSG_ReadDeltaPlayerstate(m,fromPlayer);count=count+req(gotPlayer.origin==toPlayer.origin and gotPlayer.stats[3]==123 and gotPlayer.powerups[5]==456789,"playerstate delta")

  counts=array(256,0);counts[1]=2;counts[200]=9;c=Capture([]);rows=msg.MSG_ReportChangeVectors_f(msg.ChangeReport(counts,capture,c));count=count+req(len(rows)==2 and c.lines==rows and rows[0]=="1 used 2\n","change-vector report")
  codec=msg.MSG_initHuffman();count=count+req(codec!=void and codec.loc[0]>=0 and codec.loc[255]>=0,"static Huffman initialization")
  trained=msg.MSG_NUinitHuffman(bytes([1,2,2,255]));count=count+req(trained.frequencies[1]==1 and trained.frequencies[2]==2 and trained.frequencies[255]==1 and trained.compressor.loc[0]>=0,"sample Huffman initialization")
  count=count+req(try(msg.MSG_NUinitHuffman(void)) is error and try(msg.MSG_WriteData(o,bytes([1]),2)) is error,"facade validation")
  print "PASS: "+str(count)+" complete msg contracts";return 0
end function
