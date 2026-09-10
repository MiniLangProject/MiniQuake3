import mq3.qcommon.huffman as huffman
import mq3.qcommon.message as message
function require(value,name) if not value then return error(6811,name) end if; return void end function
function main(args)
  h=huffman.init(); require(h.tree==0 and h.nodes[0].code==huffman.NYT,"NYT init")
  huffman.addRef(h,65); require(h.loc[65]!=-1 and h.nodes[h.tree].weight==1,"first reference")
  huffman.addRef(h,65); require(h.nodes[h.loc[65]].weight==2 and h.nodes[h.tree].weight==2,"repeat reference")
  data=bytes(32,0); bit=0
  for each value in [65,66,65,67] bit=huffman.transmitAdaptive(h,value,data,bit) end for
  require(bit>0,"adaptive bits")
  codec=huffman.initMessageStatic(); require(codec.blocNode==513 and codec.loc[0]!=-1 and codec.loc[255]!=-1,"static trained tree")
  msg=message.init(64); require(not msg.oob,"compressed default")
  require(message.writeBits(msg,31,5),"five-bit write"); require(message.writeBits(msg,0xab,8),"byte write")
  require(message.writeBits(msg,0xabc,12),"mixed write"); require(msg.bit>25 and msg.cursize==(msg.bit>>3)+1,"write cursors")
  message.beginReading(msg); require(message.readBits(msg,5)==31,"five-bit read")
  require(message.readBits(msg,8)==0xab,"byte read"); require(message.readBits(msg,12)==0xabc,"mixed read")
  msg=message.init(64);message.writeBits(msg,-5,-8);message.writeBits(msg,-1234,-16);message.beginReading(msg)
  require(message.readBits(msg,-8)==-5,"signed byte");require(message.readBits(msg,-16)==-1234,"signed short")
  msg=message.init(3);require(not message.writeBits(msg,1,1) and msg.overflowed,"four-byte reserve")
  msg=message.init(64); message.writeBits(msg,0x7fffffff,31);message.beginReading(msg);require(message.readBits(msg,31)==0x7fffffff,"31-bit width")
  msg=message.init(64); message.writeBits(msg,-1,32);message.beginReading(msg);require(message.readBits(msg,32)==-1,"32-bit width")
  for width=1 to 32
    raw=(width*1234567)^0x35aa55aa
    if width<32 then raw=raw & (0xffffffff>>(32-width)) end if
    msg=message.init(64);message.writeBits(msg,raw,width);message.beginReading(msg)
    require(message.readBits(msg,width)==raw,"all valid widths "+str(width))
  end for
  for width=1 to 31
    msg=message.init(64);message.writeBits(msg,-1,0-width);message.beginReading(msg);got=message.readBits(msg,0-width)
    expected=-1
    if width<8 then expected=(1<<width)-1 end if
    require(got==expected,"all signed widths "+str(width))
  end for
  msg=message.init(1);msg.cursize=0;message.beginReading(msg)
  require(message.readI32(msg)==-1 and msg.readcount>msg.cursize,"truncated compressed read")
  msg=message.init(4);require(not message.writeBits(msg,0xf7f7f7f7,32) and msg.overflowed and msg.cursize==0 and msg.bit==0 and msg.data[0]==0 and msg.data[3]==0,"atomic compressed overflow")
  print "PASS: 83 Huffman/message contracts"; return 0
end function
