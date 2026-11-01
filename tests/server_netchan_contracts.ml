// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.netchan as serverNet
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
struct Context packets end struct
function req(value,label) if not value then return error(6970,"server netchan: "+label) end if;return 1 end function
function sendPacket(runtime,sock,data,address) runtime.context.packets=runtime.context.packets+[data];return void end function
function fixture()
 runtime=net.init(0);runtime.context=Context([]);runtime.sendPacketFn=sendPacket
 client=serverNet.client(0x66,net.setup(net.NS_SERVER,net.Address(2,[127,0,0,1],27960),0));return [runtime,client]
end function
function msgBytes(msg) data=bytes(msg.cursize,0);if msg.cursize>0 then for i=0 to msg.cursize-1 data[i]=msg.data[i] end for end if;return data end function
function makeMessage(serverId,ack,reliableAck,count)
 msg=message.init(net.MAX_MSGLEN);message.writeLong(msg,serverId);message.writeLong(msg,ack);message.writeLong(msg,reliableAck);if count>0 then for i=0 to count-1 message.writeByte(msg,(i*17+9)&255) end for end if;return msg
end function
function xorBody(data,challenge,serverId,ack,text)
 raw=bytes(text);index=0;key=(challenge^serverId^ack)&255
 if len(data)>serverNet.SV_DECODE_START then for offset=serverNet.SV_DECODE_START to len(data)-1 pair=serverNet.commandByte(raw,index);key=(key^(pair[0]<<(offset&1)))&255;index=pair[1];data[offset]=(data[offset]^key)&255 end for end if;return data
end function
function plainPacket(sequence,qport,body) result=bytes(6+len(body),0);net.writeLong(result,0,sequence);net.writeShort(result,4,qport);for i=0 to len(body)-1 result[i+6]=body[i] end for;return result end function
function fragmentPacket(sequence,qport,body) result=bytes(10+len(body),0);net.writeLong(result,0,sequence|net.FRAGMENT_BIT);net.writeShort(result,4,qport);net.writeShort(result,6,0);net.writeShort(result,8,len(body));for i=0 to len(body)-1 result[i+10]=body[i] end for;return result end function
function main(args)
 count=0;pair=fixture();runtime=pair[0];client=pair[1]
 short=message.init(net.MAX_MSGLEN);short.cursize=3;short.data[0]=1;short.data[1]=2;short.data[2]=3;short.readcount=2;short.bit=17;short.oob=true;serverNet.encode(client,short);count=count+req(msgBytes(short)==bytes([1,2,3]),"short encode unchanged")
 count=count+req(short.readcount==2 and short.bit==17 and short.oob,"encode preserves cursors")
 client.channel.outgoingSequence=7;client.challenge=0x45;client.lastClientCommandString="ab%c";encoded=message.init(net.MAX_MSGLEN);message.writeLong(encoded,5);for i=0 to 7 message.writeByte(encoded,i*29) end for;before=msgBytes(encoded);serverNet.encode(client,encoded);count=count+req(slice(msgBytes(encoded),0,4)==slice(before,0,4),"encode clear prefix")
 count=count+req(msgBytes(encoded)!=before,"encode payload xor")
 serverNet.encode(client,encoded);count=count+req(msgBytes(encoded)==before,"encode xor symmetric")
 client.lastClientCommandString="";serverNet.encode(client,encoded);count=count+req(msgBytes(encoded)!=before,"empty command still challenge key")
 client.lastClientCommandString="%";percent=serverNet.commandByte(bytes("%"),0);count=count+req(percent[0]==46,"percent normalized")
 high=serverNet.commandByte(bytes([255]),0);count=count+req(high[0]==46,"high byte normalized")
 pair=fixture();client=pair[1];client.reliableCommands[2]="cmd";decoded=makeMessage(300,11,2,7);plain=msgBytes(decoded);savedBit=decoded.bit;wireBody=bytes(len(plain),0);for i=0 to len(plain)-1 wireBody[i]=plain[i] end for;xorBody(wireBody,client.challenge,300,11,"cmd");for i=0 to len(wireBody)-1 decoded.data[i]=wireBody[i] end for;serverNet.decode(client,decoded);count=count+req(msgBytes(decoded)==plain,"direct decode")
 count=count+req(decoded.readcount==0 and decoded.bit==savedBit,"decode restores cursors")
 packet=plainPacket(4,1234,wireBody);processed=serverNet.process(client,packet,net.MAX_MSGLEN);count=count+req(processed.accepted and processed.readcount==6 and processed.bit==48,"six-byte process header")
 expected=plainPacket(4,1234,plain);count=count+req(processed.data==expected,"six-byte offset-zero decode bytes")
 duplicate=serverNet.process(client,packet,net.MAX_MSGLEN);count=count+req(not duplicate.accepted and client.channel.incomingSequence==4,"duplicate rejected before decode")
 pair=fixture();client=pair[1];client.reliableCommands[2]="cmd";frag=fragmentPacket(9,1234,wireBody);processed=serverNet.process(client,frag,net.MAX_MSGLEN);count=count+req(processed.accepted and processed.readcount==4 and processed.bit==32,"four-byte reconstructed header")
 expected=bytes(4+len(plain),0);net.writeLong(expected,0,9);for i=0 to len(plain)-1 expected[i+4]=plain[i] end for;count=count+req(processed.data==expected,"four-byte offset-zero decode bytes")
 pair=fixture();runtime=pair[0];client=pair[1];client.lastClientCommandString="q";outgoingMsg=message.init(net.MAX_MSGLEN);message.writeLong(outgoingMsg,3);oldSize=outgoingMsg.cursize;serverNet.transmit(runtime,client,outgoingMsg);count=count+req(outgoingMsg.cursize>=oldSize and len(runtime.context.packets)==1,"transmit adds eof and packet")
 count=count+req(client.channel.outgoingSequence==2 and len(runtime.context.packets[0])==4+outgoingMsg.cursize,"server packet has no qport")
 pair=fixture();runtime=pair[0];client=pair[1];client.channel.unsentFragments=true;client.channel.unsentLength=1301;client.channel.unsentFragmentStart=0;for i=0 to 1300 client.channel.unsentBuffer[i]=i&255 end for;queued=message.init(net.MAX_MSGLEN);message.writeLong(queued,2);rawSize=queued.cursize;serverNet.transmit(runtime,client,queued);count=count+req(client.queue.len()==1 and client.queue.peek().cursize>=rawSize,"message queued after eof")
 count=count+req(client.channel.unsentFragments and client.channel.unsentFragmentStart==1300,"queue transmit advances current fragment")
 packetsBefore=len(runtime.context.packets);sent=serverNet.transmitNextFragment(runtime,client);count=count+req(len(sent)==2 and len(runtime.context.packets)==packetsBefore+2,"drain sends tail and queued packet")
 count=count+req(client.queue.isEmpty() and not client.channel.unsentFragments and client.channel.outgoingSequence==3,"drain pops queue")
 pair=fixture();runtime=pair[0];client=pair[1];client.channel.unsentFragments=true;client.channel.unsentLength=2601;client.channel.unsentFragmentStart=0;large=message.init(net.MAX_MSGLEN);message.writeLong(large,1);for i=0 to 1499 message.writeByte(large,i&255) end for;serverNet.transmit(runtime,client,large);serverNet.transmitNextFragment(runtime,client);serverNet.transmitNextFragment(runtime,client);count=count+req(client.channel.unsentFragments and client.queue.isEmpty(),"queued fragmented message starts after drain")
 pair=fixture();client=pair[1];client.queueInitialized=false;client.channel.unsentFragments=true;client.channel.unsentLength=1;bad=message.init(64);message.writeLong(bad,1);count=count+req(try(serverNet.transmit(pair[0],client,bad)) is error,"uninitialized queue rejected")
 pair=fixture();pair[0].sendPacketFn=void;bad=message.init(64);message.writeLong(bad,1);count=count+req(try(serverNet.transmit(pair[0],pair[1],bad)) is error,"send service required")
 count=count+req(len(serverNet.client(1,void).reliableCommands)==64,"client construction initializes ring")
 count=count+req(try(serverNet.encode(serverNet.client(1,void),message.init(64))) is error,"missing channel rejected")
 print "PASS: "+str(count)+" server-netchan contracts";return 0
end function
