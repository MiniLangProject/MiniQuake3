import mq3.compat.numeric as n
import mq3.qcommon.message as message
import mq3.qcommon.message_delta as delta

function require(condition,label)
  if not condition then print "FAIL: "+label; return error(6810,label) end if
  return void
end function
function cmd(t,a0,a1,a2,b,w,f,r,u) return delta.userCommand(t,a0,a1,a2,b,w,f,r,u) end function
function checkCmd(got,want,label)
  require(got.serverTime==want.serverTime,label+" time")
  require(got.angles[0]==want.angles[0],label+" angle0");require(got.angles[1]==want.angles[1],label+" angle1");require(got.angles[2]==want.angles[2],label+" angle2")
  require(got.buttons==want.buttons,label+" buttons");require(got.weapon==want.weapon,label+" weapon")
  require(got.forwardmove==want.forwardmove,label+" forward");require(got.rightmove==want.rightmove,label+" right");require(got.upmove==want.upmove,label+" up")
end function
function roundtrip(previous,current,key,keyed,label)
  msg=message.init(512)
  if keyed then delta.writeDeltaUsercmdKey(msg,key,previous,current) else delta.writeDeltaUsercmd(msg,previous,current) end if
  message.beginReading(msg);got=void
  if keyed then got=delta.readDeltaUsercmdKey(msg,key,previous) else got=delta.readDeltaUsercmd(msg,previous) end if
  checkCmd(got,current,label)
end function
function main(args)
  msg=message.init(128);delta.writeDelta(msg,7,7,8);message.beginReading(msg);require(delta.readDelta(msg,7,8)==7,"unchanged integer")
  msg=message.init(128);delta.writeDelta(msg,7,-5,-8);message.beginReading(msg);require(delta.readDelta(msg,7,-8)==-5,"changed signed integer")
  msg=message.init(128);delta.writeDeltaFloat(msg,0.0,n.bitsFloat(0x80000000));message.beginReading(msg);require(n.floatBits(delta.readDeltaFloat(msg,0.0))==0,"float signed zero compares equal")
  msg=message.init(128);delta.writeDeltaFloat(msg,1.25,-123.5);message.beginReading(msg);require(n.floatBits(delta.readDeltaFloat(msg,1.25))==n.floatBits(-123.5),"changed float bits")
  msg=message.init(128);delta.writeDeltaKey(msg,0x13579bdf,12,12,8);message.beginReading(msg);require(delta.readDeltaKey(msg,0x13579bdf,12,8)==12,"unchanged keyed integer")
  msg=message.init(128);delta.writeDeltaKey(msg,0x13579bdf,12,-128,8);message.beginReading(msg);require(n.i8(delta.readDeltaKey(msg,0x13579bdf,12,8))==-128,"changed keyed signed byte")
  msg=message.init(128);delta.writeDeltaKeyFloat(msg,0x2468ace0,3.0,-0.125);message.beginReading(msg);require(n.floatBits(delta.readDeltaKeyFloat(msg,0x2468ace0,3.0))==n.floatBits(-0.125),"changed keyed float bits")
  base=cmd(1000,1,32767,65535,0x1234,5,-1,0,127)
  roundtrip(base,cmd(1017,1,32767,65535,0x1234,5,-1,0,127),0,false,"plain unchanged payload")
  roundtrip(base,cmd(1255,65535,0,32768,0xffff,255,-128,127,-127),0,false,"plain 255 delta boundaries")
  roundtrip(base,cmd(1256,2,32767,65535,0x1234,5,-1,0,127),0,false,"plain 32-bit time")
  roundtrip(base,cmd(1042,1,32767,65535,0x1234,5,-1,0,127),0x13579bdf,true,"keyed unchanged payload")
  roundtrip(base,cmd(4096,0,65535,1,0x8000,0,0,-128,64),0x80000001,true,"keyed changed boundaries")
  print "PASS: 52 message delta contracts";return 0
end function
