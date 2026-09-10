import mq3.compat.numeric as n
import mq3.qcommon.message as message
import mq3.qcommon.message_delta as delta

function encodeHex(data,count)
  digits=bytes("0123456789abcdef");text=""
  if count>0 then for index=0 to count-1 value=data[index];text=text+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for end if
  return text
end function
function wordHex(value)
  digits=bytes("0123456789abcdef")
  return decode(bytes([digits[(value>>28)&15],digits[(value>>24)&15],digits[(value>>20)&15],digits[(value>>16)&15],digits[(value>>12)&15],digits[(value>>8)&15],digits[(value>>4)&15],digits[value&15]]))
end function
function cmd(t,a0,a1,a2,b,w,f,r,u) return delta.userCommand(t,a0,a1,a2,b,w,f,r,u) end function
function show(tag,c) return tag+"|"+str(c.serverTime)+"|"+str(c.angles[0])+","+str(c.angles[1])+","+str(c.angles[2])+"|"+str(c.buttons)+"|"+str(c.weapon)+"|"+str(c.forwardmove)+","+str(c.rightmove)+","+str(c.upmove) end function
function plain(tag,previous,current)
  msg=message.init(512);delta.writeDeltaUsercmd(msg,previous,current);size=msg.cursize;bits=msg.bit;encoded=encodeHex(msg.data,size)
  message.beginReading(msg);got=delta.readDeltaUsercmd(msg,previous)
  print "P|"+tag+"|"+str(size)+"|"+str(bits)+"|"+encoded+"|"+show("D",got)+"|"+str(msg.readcount)+"|"+str(msg.bit)
end function
function keyed(tag,key,previous,current)
  msg=message.init(512);delta.writeDeltaUsercmdKey(msg,key,previous,current);size=msg.cursize;bits=msg.bit;encoded=encodeHex(msg.data,size)
  message.beginReading(msg);got=delta.readDeltaUsercmdKey(msg,key,previous)
  print "K|"+tag+"|"+str(size)+"|"+str(bits)+"|"+encoded+"|"+show("D",got)+"|"+str(msg.readcount)+"|"+str(msg.bit)
end function
function scalar()
  msg=message.init(512)
  delta.writeDelta(msg,7,7,8);delta.writeDelta(msg,7,-5,-8)
  delta.writeDeltaFloat(msg,0.0,n.bitsFloat(0x80000000));delta.writeDeltaFloat(msg,1.25,-123.5)
  delta.writeDeltaKey(msg,0x13579bdf,12,12,8);delta.writeDeltaKey(msg,0x13579bdf,12,-128,8)
  delta.writeDeltaKeyFloat(msg,0x2468ace0,3.0,3.0);delta.writeDeltaKeyFloat(msg,0x2468ace0,3.0,-0.125)
  size=msg.cursize;bits=msg.bit;encoded=encodeHex(msg.data,size);message.beginReading(msg)
  i0=delta.readDelta(msg,7,8);i1=delta.readDelta(msg,7,-8);f0=delta.readDeltaFloat(msg,0.0);f1=delta.readDeltaFloat(msg,1.25)
  k0=delta.readDeltaKey(msg,0x13579bdf,12,8);k1=delta.readDeltaKey(msg,0x13579bdf,12,8);kf0=delta.readDeltaKeyFloat(msg,0x2468ace0,3.0);kf1=delta.readDeltaKeyFloat(msg,0x2468ace0,3.0)
  print "S|"+str(size)+"|"+str(bits)+"|"+encoded+"|"+str(i0)+","+str(i1)+","+wordHex(n.floatBits(f0))+","+wordHex(n.floatBits(f1))+","+str(k0)+","+str(k1)+","+wordHex(n.floatBits(kf0))+","+wordHex(n.floatBits(kf1))+"|"+str(msg.readcount)+"|"+str(msg.bit)
end function
function main(args)
  base=cmd(1000,1,32767,65535,0x1234,5,-1,0,127);scalar()
  plain("same8",base,cmd(1017,1,32767,65535,0x1234,5,-1,0,127))
  plain("all8",base,cmd(1255,65535,0,32768,0xffff,255,-128,127,-127))
  plain("time32",base,cmd(1256,2,32767,65535,0x1234,5,-1,0,127))
  plain("backward",base,cmd(999,1,32767,65535,0x1234,5,-1,0,127))
  keyed("same8",0x13579bdf,base,cmd(1042,1,32767,65535,0x1234,5,-1,0,127))
  keyed("all8",0x13579bdf,base,cmd(1255,65535,0,32768,0xffff,255,-128,127,-127))
  keyed("time32",0x80000001,base,cmd(4096,0,65535,1,0x8000,0,0,-128,64));return 0
end function
