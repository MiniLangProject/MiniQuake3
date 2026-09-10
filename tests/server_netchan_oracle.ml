// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.netchan as serverNet
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
struct Context packets end struct
function sendPacket(runtime,sock,data,address) runtime.context.packets=runtime.context.packets+[data];return void end function
function fixture()
  runtime=net.init(0);runtime.context=Context([]);runtime.sendPacketFn=sendPacket
  address=net.Address(2,[127,0,0,1],27960);client=serverNet.client(0x12345678,net.setup(net.NS_SERVER,address,0));return [runtime,client]
end function
function flag(value) if value then return 1 end if;return 0 end function
function hex(data) digits=bytes("0123456789abcdef");result="";if len(data)>0 then for each value in data result=result+decode(bytes([digits[(value>>4)&15],digits[value&15]])) end for end if;return result end function
function dumpMessage(label,msg) print "M|"+label+"|"+str(msg.cursize)+"|"+str(msg.readcount)+"|"+str(msg.bit)+"|"+str(flag(msg.oob))+"|"+hex(slice(msg.data,0,msg.cursize));return void end function
function dumpPackets(label,runtime,startPacket,client)
  text="T|"+label+"|"+str(len(runtime.context.packets)-startPacket)+"|"+str(client.channel.outgoingSequence)+"|"+str(flag(client.channel.unsentFragments))+"|"+str(client.channel.unsentFragmentStart)+"|"+str(len(client.queue))
  if startPacket<len(runtime.context.packets) then for index=startPacket to len(runtime.context.packets)-1 packet=runtime.context.packets[index];text=text+"|"+str(len(packet))+":"+hex(packet) end for end if
  print text;return void
end function
function xorClientBody(data,challenge,serverId,ack,text)
  raw=bytes(text);index=0;key=(challenge^serverId^ack)&255
  if serverNet.SV_DECODE_START<len(data) then for offset=serverNet.SV_DECODE_START to len(data)-1
    pair=serverNet.commandByte(raw,index);key=(key^(pair[0]<<(offset&1)))&255;index=pair[1];data[offset]=(data[offset]^key)&255
  end for end if;return data
end function
function messageBytes(msg) result=bytes(msg.cursize,0);if msg.cursize>0 then for i=0 to msg.cursize-1 result[i]=msg.data[i] end for end if;return result end function
function packet(sequence,qport,body) result=bytes(6+len(body),0);net.writeLong(result,0,sequence);net.writeShort(result,4,qport);if len(body)>0 then for i=0 to len(body)-1 result[i+6]=body[i] end for end if;return result end function
function main(args)
 pair=fixture();runtime=pair[0];client=pair[1];client.challenge=0x45;client.channel.outgoingSequence=7;client.lastClientCommandString="ab%c";msg=message.init(net.MAX_MSGLEN);message.writeLong(msg,9);message.writeByte(msg,0x11);message.writeByte(msg,0x22);serverNet.encode(client,msg);dumpMessage("encode",msg)
 pair=fixture();client=pair[1];msg=message.init(net.MAX_MSGLEN);msg.cursize=3;msg.data[0]=1;msg.data[1]=2;msg.data[2]=3;msg.readcount=2;msg.bit=17;msg.oob=true;serverNet.encode(client,msg);dumpMessage("short",msg)
 pair=fixture();client=pair[1];client.challenge=7;client.channel.outgoingSequence=3;client.lastClientCommandString=decode(bytes([255,37]));msg=message.init(net.MAX_MSGLEN);message.writeLong(msg,5);for i=0 to 7 message.writeByte(msg,i*29) end for;serverNet.encode(client,msg);dumpMessage("special",msg)
 pair=fixture();client=pair[1];client.challenge=0x55;client.reliableCommands[5]="xy%z";msg=message.init(net.MAX_MSGLEN);message.writeLong(msg,100);message.writeLong(msg,7);message.writeLong(msg,5);for i=0 to 9 message.writeByte(msg,200+i) end for;raw=messageBytes(msg);xorClientBody(raw,client.challenge,100,7,client.reliableCommands[5]);for i=0 to len(raw)-1 msg.data[i]=raw[i] end for;msg.readcount=0;msg.bit=0;msg.oob=true;serverNet.decode(client,msg);dumpMessage("decode",msg)
 pair=fixture();client=pair[1];client.challenge=0x66;client.reliableCommands[2]="cmd";msg=message.init(net.MAX_MSGLEN);message.writeLong(msg,300);message.writeLong(msg,11);message.writeLong(msg,2);for i=0 to 6 message.writeByte(msg,40+i) end for;body=messageBytes(msg);xorClientBody(body,client.challenge,300,11,client.reliableCommands[2]);wire=packet(4,1234,body);print "P|wire|"+hex(wire);result=serverNet.process(client,wire,net.MAX_MSGLEN);print "P|accept|"+str(flag(result.accepted))+"|"+str(result.readcount)+"|"+str(result.bit)+"|"+str(client.channel.incomingSequence)+"|"+hex(result.data);result=serverNet.process(client,result.data,net.MAX_MSGLEN);print "P|duplicate|"+str(flag(result.accepted))+"|"+str(result.readcount)+"|"+str(client.channel.incomingSequence)
 pair=fixture();runtime=pair[0];client=pair[1];client.challenge=9;client.lastClientCommandString="queue";msg=message.init(net.MAX_MSGLEN);message.writeLong(msg,1);for i=0 to 4199 message.writeByte(msg,(i*37+11)&255) end for;startPacket=len(runtime.context.packets);serverNet.transmit(runtime,client,msg);dumpPackets("large",runtime,startPacket,client)
 queued=message.init(net.MAX_MSGLEN);message.writeLong(queued,2);message.writeByte(queued,77);startPacket=len(runtime.context.packets);serverNet.transmit(runtime,client,queued);dumpMessage("queued-raw",queued);dumpPackets("queued",runtime,startPacket,client)
 while client.channel.unsentFragments startPacket=len(runtime.context.packets);serverNet.transmitNextFragment(runtime,client);dumpPackets("drain",runtime,startPacket,client) end while
 return 0
end function
