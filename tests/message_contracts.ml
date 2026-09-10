// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.message as message

function require(value,name)
  if not value then print "FAIL: "+name; return error(6801,name) end if
  return void
end function

function main(args)
  if len(args)==1 and args[0]=="bad-write-zero" then m=message.initOob(8); message.writeBits(m,0,0); return 0 end if
  if len(args)==1 and args[0]=="bad-write-width" then m=message.initOob(8); message.writeBits(m,0,7); return 0 end if
  if len(args)==1 and args[0]=="bad-read-width" then m=message.initOob(8); message.readBits(m,7); return 0 end if
  m=message.initOob(8); require(m.oob and m.maxsize==8 and m.cursize==0,"InitOOB state")
  require(message.writeByte(m,255) and m.data[0]==255,"unsigned byte write")
  require(message.writeShort(m,-32768) and m.data[1]==0 and m.data[2]==128,"signed short little endian")
  require(message.writeLong(m,-1) and m.data[3]==255 and m.data[6]==255,"signed long little endian")
  require(not message.writeByte(m,7) and m.overflowed,"four-byte write reserve overflow")
  message.beginReadingOob(m); require(message.readU8(m)==255,"unsigned byte read")
  require(message.readI16(m)==-32768,"signed short read")
  require(message.readI32(m)==-1,"signed long read")
  require(message.readU8(m)==-1,"out-of-bounds read sentinel")
  message.clear(m); require(m.cursize==0 and m.bit==0 and not m.overflowed,"clear state")
  message.beginReading(m); require(not m.oob and m.readcount==0,"bitstream read state")
  message.beginReadingOob(m); require(m.oob and m.readcount==0,"OOB read state")
  m=message.initOob(16); message.writeString(m,decode(bytes([97,37,128,0])))
  require(m.data[0]==97 and m.data[1]==37 and m.data[2]==46 and m.data[3]==0,"write-string sanitization")
  message.beginReadingOob(m); require(message.readCString(m)=="a..","read-string format sanitization")
  m=message.initOob(8); message.writeData(m,bytes([1,2,3])); message.beginReadingOob(m)
  d=message.readData(m,3); require(d[0]==1 and d[2]==3,"data round trip")
  m=message.initOob(1); m.data[0]=127; m.cursize=1; require(message.readI16(m)==-1 and m.readcount==2 and m.bit==16,"one-byte physical short boundary")
  m=message.initOob(2); m.cursize=2; require(message.readI32(m)==-1 and m.readcount==4 and m.bit==32,"two-byte physical long boundary")
  m=message.initOob(0); require(message.readU8(m)==-1 and m.readcount==1 and m.bit==8,"empty physical byte boundary")
  m=message.initOob(8); message.writeString(m,decode(bytes([65,0,66]))); require(m.cursize==2 and m.data[0]==65 and m.data[1]==0,"embedded NUL strlen boundary")
  long=bytes(1025,120); long[1]=0; m=message.initOob(8); message.writeString(m,decode(long)); require(m.cursize==2 and m.data[0]==120 and m.data[1]==0,"embedded NUL precedes maximum-string check")
  print "PASS: 24 message-buffer contracts"
  return 0
end function
