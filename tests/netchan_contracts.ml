// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message

struct Context packets end struct
function require(value,label) if not value then return error(499,"Netchan contract: "+label) end if;return 1 end function
function sendPacket(runtime,sock,data,address) runtime.context.packets=runtime.context.packets+[data];return void end function
function fixture(port) runtime=net.init(port);runtime.context=Context([]);runtime.sendPacketFn=sendPacket;return runtime end function
function payload(count) result=bytes(count,0);for index=0 to count-1 result[index]=(index*37+11)&255 end for;return result end function
function packet(sequence,fragmented,qport,start,length,body,serverInput)
  header=4;if serverInput then header=header+2 end if;if fragmented then header=header+4 end if;result=bytes(header+len(body),0);value=sequence;if fragmented then value=value|net.FRAGMENT_BIT end if;net.writeLong(result,0,value);offset=4
  if serverInput then net.writeShort(result,offset,qport);offset=offset+2 end if
  if fragmented then net.writeShort(result,offset,start);net.writeShort(result,offset+2,length) end if
  if len(body)>0 then for index=0 to len(body)-1 result[header+index]=body[index] end for end if;return result
end function
function main(args)
  count=0;runtime=fixture(70000);count=count+require(runtime.qport==4464,"init masks qport")
  address=net.Address(2,[127,0,0,1],27960);channel=net.setup(net.NS_CLIENT,address,123);count=count+require(channel.outgoingSequence==1 and channel.incomingSequence==0 and channel.qport==123,"setup sequences")
  data=payload(3);emitted=net.transmit(runtime,channel,data);count=count+require(len(emitted)==9 and net.readShort(emitted,4)==4464 and channel.outgoingSequence==2,"client header")
  channel=net.setup(net.NS_SERVER,address,0);emitted=net.transmit(runtime,channel,bytes(0,0));count=count+require(len(emitted)==4 and channel.outgoingSequence==2,"zero datagram")
  channel=net.setup(net.NS_CLIENT,address,0);emitted=net.transmit(runtime,channel,payload(net.FRAGMENT_SIZE));count=count+require(len(emitted)==1310 and channel.unsentFragments and channel.unsentFragmentStart==1300 and channel.outgoingSequence==1,"exact first fragment")
  emitted=net.transmitNextFragment(runtime,channel);count=count+require(len(emitted)==10 and not channel.unsentFragments and channel.outgoingSequence==2,"zero final fragment")
  channel=net.setup(net.NS_SERVER,address,0);emitted=net.transmit(runtime,channel,payload(1301));emitted=net.transmitNextFragment(runtime,channel);count=count+require(len(emitted)==9 and emitted[8]==((1300*37+11)&255) and channel.outgoingSequence==2,"short final fragment")
  channel=net.setup(net.NS_CLIENT,address,0);r=net.process(channel,packet(1,false,0,0,0,payload(4),false),net.MAX_MSGLEN);count=count+require(r.accepted and channel.incomingSequence==1 and r.readcount==4,"plain receive")
  r=net.process(channel,packet(1,false,0,0,0,payload(1),false),net.MAX_MSGLEN);count=count+require(not r.accepted and channel.incomingSequence==1,"duplicate rejected")
  r=net.process(channel,packet(4,false,0,0,0,payload(1),false),net.MAX_MSGLEN);count=count+require(r.accepted and channel.dropped==2,"drop count")
  channel=net.setup(net.NS_SERVER,address,0);body=payload(1300);r=net.process(channel,packet(7,true,123,0,1300,body,true),net.MAX_MSGLEN);count=count+require(not r.accepted and channel.fragmentLength==1300 and channel.incomingSequence==0,"fragment buffered")
  tail=payload(2);r=net.process(channel,packet(7,true,123,1300,2,tail,true),net.MAX_MSGLEN);count=count+require(r.accepted and r.cursize==1306 and r.readcount==4 and channel.incomingSequence==7,"fragment assembled")
  channel=net.setup(net.NS_SERVER,address,0);r=net.process(channel,packet(2,true,0,3,1,payload(1),true),net.MAX_MSGLEN);count=count+require(not r.accepted and channel.fragmentLength==0,"fragment gap rejected")
  channel=net.setup(net.NS_SERVER,address,0);r=net.process(channel,packet(2,true,0,0,2,payload(1),true),net.MAX_MSGLEN);count=count+require(not r.accepted and channel.fragmentLength==0,"truncated fragment rejected")
  channel=net.setup(net.NS_CLIENT,address,0);r=net.process(channel,packet(2,true,0,0,2,payload(2),false),6);count=count+require(r.accepted and r.cursize==6,"assembled size exactly fits")
  channel=net.setup(net.NS_CLIENT,address,0);r=net.process(channel,packet(2,true,0,0,1,payload(1),false),6);count=count+require(r.accepted and r.cursize==5,"assembled size below capacity")
  channel=net.setup(net.NS_CLIENT,address,0);r=net.process(channel,packet(2,true,0,0,2,payload(2),false),5);count=count+require(not r.accepted and channel.fragmentLength==2,"assembled header overflow safely rejected")
  channel=net.setup(net.NS_CLIENT,address,0);r=net.process(channel,packet(4,true,0,0,net.FRAGMENT_SIZE,payload(net.FRAGMENT_SIZE),false),net.MAX_MSGLEN);r=net.process(channel,packet(4,true,0,net.FRAGMENT_SIZE,0,bytes(0,0),false),net.MAX_MSGLEN);count=count+require(r.accepted and r.cursize==net.FRAGMENT_SIZE+4,"zero terminator assembles exact fragment")
  channel=net.setup(net.NS_CLIENT,address,0);r=net.process(channel,packet(5,true,0,0,net.FRAGMENT_SIZE,payload(net.FRAGMENT_SIZE),false),net.MAX_MSGLEN);r=net.process(channel,packet(6,true,0,0,1,payload(1),false),net.MAX_MSGLEN);count=count+require(r.accepted and channel.incomingSequence==6 and r.cursize==5,"new sequence resets partial assembly")
  channel=net.setup(net.NS_CLIENT,address,0);r=net.process(channel,packet(7,true,0,0,net.FRAGMENT_SIZE,payload(net.FRAGMENT_SIZE),false),net.MAX_MSGLEN);r=net.process(channel,packet(7,true,0,1301,1,payload(1),false),net.MAX_MSGLEN);count=count+require(not r.accepted and channel.fragmentLength==net.FRAGMENT_SIZE,"gap preserves partial assembly");r=net.process(channel,packet(7,true,0,net.FRAGMENT_SIZE,1,payload(1),false),net.MAX_MSGLEN);count=count+require(r.accepted and r.cursize==net.FRAGMENT_SIZE+5,"gap retry completes")
  channel=net.setup(net.NS_CLIENT,address,0);r=net.process(channel,packet(2,false,0,0,0,payload(1),false),net.MAX_MSGLEN);r=net.process(channel,packet(3,true,0,0,net.FRAGMENT_SIZE,payload(net.FRAGMENT_SIZE),false),net.MAX_MSGLEN);r=net.process(channel,packet(2,false,0,0,0,payload(1),false),net.MAX_MSGLEN);count=count+require(not r.accepted and channel.fragmentLength==net.FRAGMENT_SIZE,"old packet preserves partial assembly");r=net.process(channel,packet(3,true,0,0,net.FRAGMENT_SIZE,payload(net.FRAGMENT_SIZE),false),net.MAX_MSGLEN);count=count+require(not r.accepted and channel.fragmentLength==net.FRAGMENT_SIZE,"duplicate fragment preserves partial assembly")
  channel=net.setup(net.NS_SERVER,address,0);r=net.process(channel,packet(3,false,4321,0,0,payload(1),true),net.MAX_MSGLEN);count=count+require(r.accepted and r.readcount==6,"server receive consumes qport header")
  channel=net.setup(net.NS_CLIENT,address,0);r=net.process(channel,packet(3,true,0,0,-1,bytes(0,0),false),net.MAX_MSGLEN);count=count+require(not r.accepted and channel.fragmentLength==0,"negative claimed length rejected")
  channel=net.setup(net.NS_CLIENT,address,0);r=net.process(channel,packet(3,true,0,0,3,payload(2),false),net.MAX_MSGLEN);count=count+require(not r.accepted and channel.fragmentLength==0,"overlong claimed length rejected")
  // Cross-module smoke: msg.c primitives produce and consume a netchan payload.
  runtime=fixture(99);sender=net.setup(net.NS_SERVER,address,0);writer=message.initOob(64);message.writeLong(writer,0x12345678);message.writeString(writer,"quake");wire=net.transmit(runtime,sender,slice(writer.data,0,writer.cursize));receiver=net.setup(net.NS_CLIENT,address,0);r=net.process(receiver,wire,64);reader=message.initStorage(r.data,64,true);reader.cursize=r.cursize;reader.readcount=r.readcount;reader.bit=r.bit;count=count+require(message.readI32(reader)==0x12345678 and message.readCString(reader)=="quake","message and netchan integration")
  runtime=net.init(1);channel=net.setup(net.NS_CLIENT,address,0);count=count+require(try(net.transmit(runtime,channel,payload(1))) is error,"send service required")
  count=count+require(try(net.transmit(fixture(1),channel,bytes(net.MAX_MSGLEN+1,0))) is error,"oversize rejected")
  print "PASS: "+str(count)+" netchan contracts";return 0
end function
