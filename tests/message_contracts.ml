// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.message as message
import mq3.compat.numeric as n

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
  source=message.initOob(12);source.allowoverflow=true;message.writeData(source,bytes([9,8,7]));source.readcount=2
  copied=message.copy(source,16);require(copied.allowoverflow and copied.oob and copied.maxsize==12 and copied.cursize==3 and copied.readcount==2,"copy preserves msg state")
  require(copied.data[0]==9 and copied.data[2]==7,"copy preserves payload")
  source.data[0]=1;require(copied.data[0]==9,"copy owns destination payload")
  require((try(message.copy(source,2))) is error,"copy rejects small destination")
  m=message.initOob(32);message.writeFloat(m,-13.25);message.writeFloat(m,n.bitsFloat(0x80000000));message.writeFloat(m,n.bitsFloat(0x7fc12345));message.beginReadingOob(m)
  require(n.floatBits(message.readFloat(m))==n.floatBits(-13.25),"float payload")
  require(n.floatBits(message.readFloat(m))==0x80000000,"negative-zero float payload")
  require(n.floatBits(message.readFloat(m))==0x7fc12345,"NaN float payload")
  require(n.floatBits(message.readFloat(m))==n.floatBits(-1.0),"out-of-bounds float sentinel")
  m=message.initOob(16);message.writeAngle(m,359.9);message.writeAngle16(m,-90.0);require(m.data[0]==255 and m.data[1]==0 and m.data[2]==192,"angle wire encoding")
  message.beginReadingOob(m);message.readU8(m);require(n.floatBits(message.readAngle16(m))==n.floatBits(-90.0),"angle16 wire decoding")
  m=message.initOob(32);message.writeBigString(m,decode(bytes([65,200,37,66])));require(m.cursize==5 and m.data[0]==65 and m.data[1]==46 and m.data[2]==37,"big-string write sanitization")
  m=message.initOob(8);m.data[0]=65;m.data[1]=200;m.data[2]=37;m.data[3]=0;m.cursize=4;message.beginReadingOob(m);value=bytes(message.readBigCString(m));require(len(value)==3 and value[0]==65 and value[1]==200 and value[2]==46,"big-string read semantics")
  m=message.initOob(8200);message.writeBigString(m,decode(bytes(8192,120)));require(m.cursize==1 and m.data[0]==0,"big-string maximum")
  m=message.initOob(1); m.data[0]=127; m.cursize=1; require(message.readI16(m)==-1 and m.readcount==2 and m.bit==16,"one-byte physical short boundary")
  m=message.initOob(2); m.cursize=2; require(message.readI32(m)==-1 and m.readcount==4 and m.bit==32,"two-byte physical long boundary")
  m=message.initOob(0); require(message.readU8(m)==-1 and m.readcount==1 and m.bit==8,"empty physical byte boundary")
  m=message.initOob(8); message.writeString(m,decode(bytes([65,0,66]))); require(m.cursize==2 and m.data[0]==65 and m.data[1]==0,"embedded NUL strlen boundary")
  long=bytes(1025,120); long[1]=0; m=message.initOob(8); message.writeString(m,decode(long)); require(m.cursize==2 and m.data[0]==120 and m.data[1]==0,"embedded NUL precedes maximum-string check")
  print "PASS: 37 message-buffer contracts"
  return 0
end function
