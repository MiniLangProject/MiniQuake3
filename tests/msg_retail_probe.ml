import mq3.qcommon.msg as msg
import mq3.qcommon.message_delta as delta
import mq3.format.pk3 as pk3

function main(args)
  if len(args)<1 then return error(6819,"retail root required") end if
  archive=pk3.open(args[0]+"/baseq3/pak0.pk3");if archive is error then return archive end if
  qvm=pk3.read(archive,"vm/cgame.qvm");if qvm is error or len(qvm)<1000 then return error(6819,"retail cgame.qvm missing") end if
  m=msg.MSG_Init(bytes(4096,0),4096);msg.MSG_WriteData(m,qvm,128);msg.MSG_WriteString(m,"vm/cgame.qvm");base=delta.userCommand(100,0,0,0,0,0,0,0,0);next=delta.userCommand(116,100,-200,300,1,4,127,-128,0);msg.MSG_WriteDeltaUsercmdKey(m,0x12345678,base,next)
  msg.MSG_BeginReading(m);head=msg.MSG_ReadData(m,128);name=msg.MSG_ReadString(m);decoded=msg.MSG_ReadDeltaUsercmdKey(m,0x12345678,base)
  if head!=slice(qvm,0,128) or name!="vm/cgame.qvm" or decoded.serverTime!=116 or decoded.forwardmove!=127 or decoded.rightmove!=-128 then return error(6819,"retail msg roundtrip mismatch") end if
  print "PASS: retail cgame.qvm "+str(len(qvm))+" bytes through msg.c facade";return 0
end function
