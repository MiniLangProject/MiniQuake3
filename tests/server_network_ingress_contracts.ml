// SPDX-License-Identifier: GPL-2.0-or-later
// Real localhost ingress through every production protocol adapter.
import mq3.platform.udp as udp
import mq3.qcommon.net_transport as transport
import mq3.qcommon.network_pump as networkPump
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
import mq3.client.netchan as clientNetchan
import mq3.server.netchan as serverNetchan
import mq3.server.packet_event as packetEvent
import mq3.server.client_message as clientMessage
import mq3.server.network_ingress as ingress

struct Capture events clientPackets clientBytes end struct

function req(value,label)
  if not value then return error(6999,"server ingress: "+label) end if
  return 1
end function

function add(services,text)
  if services.context.events!="" then services.context.events=services.context.events+"," end if
  services.context.events=services.context.events+text;return void
end function

function command(services,client,msg)
  sequence=message.readI32(msg);text=message.readCString(msg)
  client.lastClientCommandString=text;add(services,"cmd:"+str(sequence)+":"+text);return true
end function

function move(services,client,msg,delta)
  if delta then add(services,"move:delta") else add(services,"move:nodelta") end if
  return void
end function

function clientPacket(services,address,data)
  services.context.clientPackets=services.context.clientPackets+1
  services.context.clientBytes=data;return void
end function

function waitFor(runtime,ingressRuntime,wanted)
  for attempt=0 to 19999
    networkPump.drain(runtime,4)
    if ingressRuntime.packetCount>=wanted then return void end if
  end for
  return error(6999,"server ingress: localhost timeout")
end function

function sendClient(runtime,channel,serverId,messageAck,reliableAck,kind)
  msg=message.init(net.MAX_MSGLEN)
  message.writeLong(msg,serverId);message.writeLong(msg,messageAck);message.writeLong(msg,reliableAck)
  if kind==1 then
    message.writeByte(msg,clientMessage.CLC_CLIENT_COMMAND);message.writeLong(msg,17)
    message.writeString(msg,"say ingress");message.writeByte(msg,clientMessage.CLC_MOVE)
  else if kind==2 then
    message.writeByte(msg,clientMessage.CLC_MOVE_NO_DELTA)
  end if
  return clientNetchan.transmit(runtime,channel,msg)
end function

function main(args)
  count=0;challenge=0x3456;qport=23117
  udp.startup();clientSocket=udp.open();serverSocket=udp.open();loopback=udp.ipv4(127,0,0,1)
  clientEndpoint=udp.bind(clientSocket,udp.Endpoint(loopback,0));serverEndpoint=udp.bind(serverSocket,udp.Endpoint(loopback,0))
  clientAddress=transport.endpointToAddress(clientEndpoint);serverAddress=transport.endpointToAddress(serverEndpoint)

  clientTransport=transport.attach(net.init(qport),clientSocket)
  clientConnection=clientNetchan.createConnection();clientConnection.challenge=challenge
  clientRuntime=clientNetchan.create(clientTransport,clientConnection)
  clientChannel=net.setup(net.NS_CLIENT,serverAddress,qport)

  serverChannel=net.setup(net.NS_SERVER,clientAddress,qport)
  serverProtocol=serverNetchan.client(challenge,serverChannel)
  packetClient=packetEvent.client(2,serverProtocol);messageClient=clientMessage.createClient()
  capture=Capture("",0,bytes(0,0));host=ingress.services();host.context=capture
  host.clientPacketFn=clientPacket;host.clientCommandFn=command;host.userMoveFn=move
  runtime=ingress.create(clientMessage.createServer(100,90),[ingress.binding(packetClient,messageClient)],host)
  ingress.setTime(runtime,5000);pump=ingress.createPump(runtime,clientSocket,serverSocket,net.MAX_MSGLEN)
  count=count+req(runtime.packetState.clients[0]==packetClient and runtime.bindings[0].messageClient==messageClient,"client binding retained")

  wire=sendClient(clientRuntime,clientChannel,100,1,0,0);waitFor(pump,runtime,1)
  count=count+req(runtime.lastPacketResult=="accepted" and runtime.lastClientResult=="eof","sequenced EOF reaches parser")
  count=count+req(serverChannel.incomingSequence==1 and packetClient.lastPacketTime==5000,"netchan and timeout advance")
  count=count+req(messageClient.messageAcknowledge==1 and messageClient.reliableAcknowledge==0,"header acknowledgements parsed")
  count=count+req(runtime.packetCount==1 and len(wire)>6,"pump accounts first datagram")

  ingress.setTime(runtime,5016);sendClient(clientRuntime,clientChannel,100,2,0,1);waitFor(pump,runtime,2)
  count=count+req(runtime.lastClientResult=="move","command continues into delta move")
  count=count+req(capture.events=="cmd:17:say ingress,move:delta","injected command and move callbacks")
  count=count+req(messageClient.lastClientCommandString=="say ingress" and serverProtocol.lastClientCommandString=="say ingress","command string synchronized for XOR")
  count=count+req(serverChannel.incomingSequence==2 and packetClient.lastPacketTime==5016,"second packet advances state")

  ingress.setTime(runtime,5032);sendClient(clientRuntime,clientChannel,100,3,0,2);waitFor(pump,runtime,3)
  count=count+req(runtime.lastClientResult=="moveNoDelta","no-delta move reaches parser")
  count=count+req(capture.events=="cmd:17:say ingress,move:delta,move:nodelta","injected no-delta callback")
  count=count+req(serverChannel.incomingSequence==3 and messageClient.messageAcknowledge==3,"third sequence and ack")

  // The same pump also retains its client-side callback boundary.
  payload=bytes([9,8,7,6]);udp.sendTo(serverSocket,clientEndpoint,payload)
  for attempt=0 to 19999 networkPump.drain(pump,2);if capture.clientPackets==1 then break end if end for
  count=count+req(capture.clientPackets==1 and capture.clientBytes==payload,"client-side pump callback")
  count=count+req(runtime.packetCount==3,"client datagram excluded from server count")
  count=count+req(pump.nextSide==networkPump.SIDE_SERVER,"fairness preference follows client receive")

  count=count+req(try(ingress.binding(void,messageClient)) is error,"binding validates client")
  count=count+req(try(ingress.create(void,[],host)) is error,"runtime validates server")
  count=count+req(try(ingress.serverPacket(void,serverAddress,bytes(1,0))) is error,"packet validates runtime")
  count=count+req(try(ingress.createPump(void,clientSocket,serverSocket,1024)) is error,"pump validates runtime")

  udp.close(clientSocket);udp.close(serverSocket);udp.cleanup()
  print "PASS: "+str(count)+" server network-ingress contracts";return 0
end function
