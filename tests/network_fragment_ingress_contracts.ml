// SPDX-License-Identifier: GPL-2.0-or-later
// Exercise actual client/server ingress, not only Netchan_Process in isolation.
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
import mq3.client.connectionless as connectionless
import mq3.client.netchan as clientNet
import mq3.client.network_ingress as clientIngress
import mq3.client.protocol_runtime as protocol
import mq3.server.netchan as serverNet
import mq3.server.network_ingress as serverIngress
import mq3.server.packet_event as serverPacket
import mq3.server.client_message as clientMessage
import std.ds.list as lists

struct Capture packets commands end struct
function require(value,label)
  if not value then return error(7980,"fragment ingress: "+label) end if
  return 1
end function
function capture(runtime,side,packet,address) runtime.context.packets.add(bytes(packet));return void end function
function receiveCommand(host,client,msg)
  sequence=message.readI32(msg);text=message.readCString(msg)
  host.context.commands=host.context.commands+1
  client.lastClientCommand=sequence;client.lastClientCommandString=text
  return true
end function
function textFor(seed)
  data=bytes(700,0)
  for index=0 to len(data)-1 data[index]=33+((index*37+seed*17)%90);if data[index]==37 then data[index]=46 end if end for
  return decode(data)
end function
function main(args)
  count=0;challenge=0x1234567;qport=24019
  serverAddress=net.Address(4,[127,0,0,1],27960);clientAddress=net.Address(4,[127,0,0,1],28000)
  received=Capture(lists.List.new(),0);sent=Capture(lists.List.new(),0)
  connection=connectionless.create(serverAddress);connection.connectionState=connectionless.CA_CONNECTED
  connection.channel=net.setup(net.NS_CLIENT,serverAddress,qport)
  wire=clientNet.createConnection();wire.challenge=challenge;clientWire=clientNet.create(void,wire)
  parsed=protocol.create(void);client=clientIngress.create(connection,clientWire,parsed,clientIngress.services(connectionless.services()))
  serverWire=serverNet.client(challenge,net.setup(net.NS_SERVER,clientAddress,qport))
  sender=net.init(0);sender.context=sent;sender.sendPacketFn=capture
  msg=message.init(net.MAX_MSGLEN);message.writeLong(msg,0)
  for sequence=1 to 8 message.writeByte(msg,5);message.writeLong(msg,sequence);message.writeString(msg,textFor(sequence)) end for
  serverNet.transmit(sender,serverWire,msg)
  while serverWire.channel.unsentFragments serverNet.transmitNextFragment(sender,serverWire) end while
  packets=sent.packets.toArray();count=count+require(len(packets)>2,"server fixture is fragmented")
  for index=0 to len(packets)-1
    value=clientIngress.clientPacket(client,serverAddress,packets[index])
    if index<len(packets)-1 then count=count+require(value=="rejected" and parsed.dispatcher.serverCommandSequence==0,"no partial server message is parsed") end if
  end for
  count=count+require(client.lastPacketResult=="sequenced","fragmented server message reaches parser")
  count=count+require(parsed.dispatcher.serverCommandSequence==8 and client.lastParseResult==[8,0],"all reliable server commands parsed")
  for sequence=1 to 8 count=count+require(parsed.dispatcher.serverCommands[sequence]==textFor(sequence),"server command bytes") end for
  for each packet in packets clientIngress.clientPacket(client,serverAddress,packet) end for
  count=count+require(connection.channel.incomingSequence==1 and parsed.dispatcher.serverCommandSequence==8,"server fragment duplicates rejected")

  sender=net.init(qport);sender.context=received;sender.sendPacketFn=capture
  clientConnection=clientNet.createConnection();clientConnection.challenge=challenge
  clientWire=clientNet.create(sender,clientConnection);clientChannel=net.setup(net.NS_CLIENT,serverAddress,qport)
  serverWire=serverNet.client(challenge,net.setup(net.NS_SERVER,clientAddress,qport))
  packetClient=serverPacket.client(2,serverWire);messageClient=clientMessage.createClient()
  host=serverIngress.services();host.context=received;host.clientCommandFn=receiveCommand
  server=serverIngress.create(clientMessage.createServer(100,90),[serverIngress.binding(packetClient,messageClient)],host)
  msg=message.init(net.MAX_MSGLEN);message.writeLong(msg,100);message.writeLong(msg,1);message.writeLong(msg,0)
  for sequence=1 to 8 message.writeByte(msg,4);message.writeLong(msg,sequence);message.writeString(msg,textFor(sequence)) end for
  clientNet.transmit(clientWire,clientChannel,msg)
  while clientChannel.unsentFragments clientNet.transmitNextFragment(clientWire,clientChannel) end while
  packets=received.packets.toArray();count=count+require(len(packets)>2,"client fixture is fragmented")
  for index=0 to len(packets)-1
    value=serverIngress.serverPacket(server,clientAddress,packets[index])
    if index<len(packets)-1 then count=count+require(value=="rejected" and received.commands==0,"no partial client command executes") end if
  end for
  count=count+require(server.lastPacketResult=="accepted" and server.lastClientResult=="eof","fragmented client message reaches parser")
  count=count+require(received.commands==8 and messageClient.lastClientCommand==8,"all reliable client commands execute")
  count=count+require(messageClient.lastClientCommandString==textFor(8),"client command bytes")
  for each packet in packets serverIngress.serverPacket(server,clientAddress,packet) end for
  count=count+require(received.commands==8,"client fragment duplicates rejected")
  print "PASS: "+str(count)+" bidirectional fragmented ingress contracts"
  return 0
end function
