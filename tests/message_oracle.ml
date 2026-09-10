// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.message as message

function encodeHex(data,count)
  digits = bytes("0123456789abcdef"); result = ""
  if count > 0 then
    for index = 0 to count-1
      value = data[index]; result = result+decode(bytes([digits[(value>>4)&15],digits[value&15]]))
    end for
  end if
  return result
end function

function flag(value)
  if value then return 1 end if
  return 0
end function

function state(name,msg)
  print "S|"+name+"|"+str(flag(msg.allowoverflow))+"|"+str(flag(msg.overflowed))+"|"+str(flag(msg.oob))+"|"+str(msg.cursize)+"|"+str(msg.readcount)+"|"+str(msg.bit)+"|"+str(msg.maxsize)
  return void
end function

function main(args)
  msg = message.init(16); state("init",msg)
  msg.allowoverflow=true; msg.overflowed=true; msg.cursize=9; msg.readcount=7; msg.bit=71; message.clear(msg); state("clear",msg)
  message.beginReadingOob(msg); state("begin_oob",msg); message.bitstream(msg); state("bitstream",msg)

  msg = message.initOob(32)
  message.writeChar(msg,-1); message.writeByte(msg,128); message.writeShort(msg,-2); message.writeLong(msg,0x12345678)
  print "W|primitives|"+encodeHex(msg.data,msg.cursize)+"|"+str(msg.cursize)+"|"+str(msg.bit)+"|"+str(flag(msg.overflowed))
  message.beginReadingOob(msg)
  print "R|primitives|"+str(message.readI8(msg))+"|"+str(message.readU8(msg))+"|"+str(message.readI16(msg))+"|"+str(message.readI32(msg))+"|"+str(msg.readcount)+"|"+str(msg.bit)

  msg = message.initOob(6)
  message.writeByte(msg,1); message.writeByte(msg,2); message.writeByte(msg,3); message.writeByte(msg,4)
  print "W|overflow|"+encodeHex(msg.data,msg.cursize)+"|"+str(msg.cursize)+"|"+str(msg.bit)+"|"+str(flag(msg.overflowed))

  msg = message.initOob(16); message.writeData(msg,bytes([0,1,127,128,255]))
  print "W|data|"+encodeHex(msg.data,msg.cursize)+"|"+str(msg.cursize)+"|"+str(msg.bit)
  message.beginReadingOob(msg); print "R|data|"+encodeHex(message.readData(msg,7),7)+"|"+str(msg.readcount)

  msg = message.initOob(32); message.writeString(msg,decode(bytes([65,37,128,255,90])))
  print "W|string|"+encodeHex(msg.data,msg.cursize)+"|"+str(msg.cursize)
  message.beginReadingOob(msg); print "R|string|"+encodeHex(bytes(message.readCString(msg)),4)+"|"+str(msg.readcount)

  msg = message.initOob(8); message.writeString(msg,void)
  print "W|null|"+encodeHex(msg.data,msg.cursize)+"|"+str(msg.cursize)
  msg = message.initOob(8); message.writeString(msg,decode(bytes([65,0,66])))
  print "W|embedded_null|"+encodeHex(msg.data,msg.cursize)+"|"+str(msg.cursize)
  msg = message.initOob(1032); message.writeString(msg,decode(bytes(1024,120)))
  print "W|string_limit|"+encodeHex(msg.data,msg.cursize)+"|"+str(msg.cursize)

  msg = message.initOob(16); message.writeData(msg,bytes("ab%cd\nef")); message.writeByte(msg,0); message.beginReadingOob(msg)
  value = message.readCStringLine(msg); print "R|line|"+encodeHex(bytes(value),len(bytes(value)))+"|"+str(msg.readcount)

  msg = message.initOob(8); msg.data[0]=7; msg.cursize=1; message.beginReadingOob(msg)
  print "R|oob|"+str(message.readU8(msg))+"|"+str(message.readU8(msg))+"|"+str(msg.readcount)+"|"+str(msg.bit)

  msg = message.initOob(1032); for index=0 to 1029 msg.data[index]=120 end for; msg.cursize=1030; message.beginReadingOob(msg)
  value=message.readCString(msg); print "R|string_limit|"+str(len(bytes(value)))+"|"+str(msg.readcount)
  return 0
end function
