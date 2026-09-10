import mq3.qcommon.huffman as huffman
import mq3.qcommon.message as message

function encodeHex(data,count)
  digits=bytes("0123456789abcdef"); text=""
  if count>0 then for index=0 to count-1 value=data[index]; text=text+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for end if
  return text
end function
function flag(value) if value then return 1 end if; return 0 end function
function adaptive()
  input=[65,66,65,65,67,0,255,66,67,67,67]; data=bytes(128,0); enc=huffman.init(); bit=0
  for each ch in input bit=huffman.transmitAdaptive(enc,ch,data,bit) end for
  dec=huffman.init(); inbit=0; values=""
  for index=0 to len(input)-1
    got=huffman.receiveAdaptive(dec,data,inbit); inbit=got[1]
    if index>0 then values=values+"," end if; values=values+str(got[0])
  end for
  print "A|"+str(bit)+"|"+encodeHex(data,(bit+7)>>3)+"|"+values+"|"+str(inbit)
end function
function packetCodec()
  prefix=bytes([160,161,162,163,164,165,166,167,168,169,170,171])
  payload=bytes([0,1,2,3,65,65,65,32,255,128,0,90,17,34,51,68,85,102,119,136,153])
  compressed=huffman.compressPacket(prefix+payload,len(prefix))
  print "C|"+str(len(compressed))+"|"+encodeHex(compressed,len(compressed))
  restored=huffman.decompressPacket(compressed,len(prefix),512)
  print "D|"+str(len(restored))+"|"+encodeHex(restored,len(restored))
end function
function main(args)
  adaptive();packetCodec();msg=message.init(512)
  message.writeBits(msg,1,1); message.writeBits(msg,5,3); message.writeBits(msg,0xa7,8)
  message.writeBits(msg,0xabc,12); message.writeBits(msg,0x1234,16); message.writeBits(msg,0x654321,24)
  message.writeBits(msg,0x89abcdef,32); message.writeBits(msg,-5,-8); message.writeBits(msg,-1234,-16)
  print "M|"+str(msg.cursize)+"|"+str(msg.bit)+"|"+str(flag(msg.overflowed))+"|"+encodeHex(msg.data,msg.cursize)
  message.beginReading(msg)
  a=message.readBits(msg,1);b=message.readBits(msg,3);c=message.readBits(msg,8);d=message.readBits(msg,12)
  e=message.readBits(msg,16);f=message.readBits(msg,24);g=message.readBits(msg,32);h=message.readBits(msg,-8);i=message.readBits(msg,-16)
  print "R|"+str(a)+"|"+str(b)+"|"+str(c)+"|"+str(d)+"|"+str(e)+"|"+str(f)+"|"+str(g)+"|"+str(h)+"|"+str(i)+"|"+str(msg.readcount)+"|"+str(msg.bit)
  msg=message.init(512)
  for width=1 to 32
    value=(width*1234567)^0x35aa55aa
    if width<32 then value=value & (0xffffffff>>(32-width)) end if
    message.writeBits(msg,value,width)
  end for
  values=""; writtenSize=msg.cursize; writtenBits=msg.bit; message.beginReading(msg)
  for width=1 to 32
    if width>1 then values=values+"," end if; values=values+str(message.readBits(msg,width))
  end for
  print "V|"+str(writtenSize)+"|"+str(writtenBits)+"|"+values+"|"+str(msg.readcount)+"|"+str(msg.bit)
  msg=message.init(512);for value=0 to 255 message.writeBits(msg,value,8) end for
  encoded=encodeHex(msg.data,msg.cursize);writtenSize=msg.cursize;writtenBits=msg.bit;message.beginReading(msg);errors=0
  for value=0 to 255 if message.readBits(msg,8)!=value then errors=errors+1 end if end for
  print "S|"+str(writtenSize)+"|"+str(writtenBits)+"|"+encoded+"|"+str(errors)+"|"+str(msg.readcount)+"|"+str(msg.bit)
  values=""
  for width=1 to 31
    msg=message.init(512);message.writeBits(msg,-1,0-width);message.beginReading(msg)
    if width>1 then values=values+"," end if;values=values+str(message.readBits(msg,0-width))
  end for
  print "N|"+values
  msg=message.init(8);message.writeBits(msg,7,3);message.writeBits(msg,255,8);message.writeBits(msg,3,2)
  print "K|"+str(msg.cursize)+"|"+str(msg.bit)+"|"+encodeHex(msg.data,msg.cursize)
  msg=message.init(4);message.writeBits(msg,1,1)
  print "O|"+str(msg.cursize)+"|"+str(msg.bit)+"|"+str(flag(msg.overflowed))
  return 0
end function
