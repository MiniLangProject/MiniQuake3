// SPDX-License-Identifier: GPL-2.0-or-later
// Real localhost ingress through the productive client protocol adapters.
import mq3.platform.udp as udp
import mq3.qcommon.net_transport as transport
import mq3.qcommon.network_pump as networkPump
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
import mq3.client.connectionless as connectionless
import mq3.client.server_message as serverMessage
import mq3.client.netchan as clientNetchan
import mq3.client.protocol_runtime as protocol
import mq3.client.network_ingress as ingress
import mq3.server.netchan as serverNetchan

struct Capture oobPrint demoCount demoHeader serverPackets serverBytes end struct

function req(value,label)
  if not value then return error(6995,"client ingress: "+label) end if
  return 1
end function

function printLine(host,state,text) host.context.oobPrint=text;return void end function
function demo(host,state,msg,header) host.context.demoCount=host.context.demoCount+1;host.context.demoHeader=header;return void end function
function serverPacket(host,address,data) host.context.serverPackets=host.context.serverPackets+1;host.context.serverBytes=data;return void end function

function waitFor(pump,runtime,wanted)
  for attempt=0 to 19999
    networkPump.drain(pump,4)
    if runtime.packetCount>=wanted then return void end if
  end for
  return error(6995,"client ingress: localhost timeout")
end function

function sendServer(runtime,clientState,sequence,text)
  msg=message.init(net.MAX_MSGLEN);message.writeLong(msg,0)
  message.writeByte(msg,serverMessage.SVC_SERVER_COMMAND);message.writeLong(msg,sequence);message.writeString(msg,text)
  message.writeByte(msg,serverMessage.SVC_NOP)
  return serverNetchan.transmit(runtime,clientState,msg)
end function

function main(args)
  count=0;challenge=0x4567
  udp.startup();clientSocket=udp.open();serverSocket=udp.open();loopback=udp.ipv4(127,0,0,1)
  clientEndpoint=udp.bind(clientSocket,udp.Endpoint(loopback,0));serverEndpoint=udp.bind(serverSocket,udp.Endpoint(loopback,0))
  clientAddress=transport.endpointToAddress(clientEndpoint);serverAddress=transport.endpointToAddress(serverEndpoint)

  connection=connectionless.create(serverAddress);connection.connectionState=connectionless.CA_CONNECTED
  connection.channel=net.setup(net.NS_CLIENT,serverAddress,0);connection.challenge=challenge
  clientWire=clientNetchan.createConnection();clientWire.challenge=challenge
  clientRuntime=clientNetchan.create(transport.attach(net.init(0),clientSocket),clientWire)
  protocolState=protocol.create(void)
  capture=Capture("",0,-1,0,bytes(0,0));oob=connectionless.services();oob.context=capture;oob.printFn=printLine
  host=ingress.services(oob);host.context=capture;host.demoFn=demo;host.serverPacketFn=serverPacket
  runtime=ingress.create(connection,clientRuntime,protocolState,host);ingress.setRealtime(runtime,6000)
  pump=ingress.createPump(runtime,clientSocket,serverSocket,net.MAX_MSGLEN)

  count=count+req(runtime.packetState.connection==connection and runtime.protocol==protocolState,"composition retains protocol state")
  count=count+req(protocolState.dispatcher.snapshotState.realtime==6000,"realtime reaches snapshot parser")

  serverChannel=net.setup(net.NS_SERVER,clientAddress,0)
  serverClient=serverNetchan.client(challenge,serverChannel)
  serverRuntime=transport.attach(net.init(0),serverSocket)
  wire=sendServer(serverRuntime,serverClient,1,"print ingress-one");waitFor(pump,runtime,1)
  count=count+req(runtime.lastPacketResult=="sequenced" and runtime.lastParseResult==[1,0],"sequenced datagram reaches server-message parser")
  count=count+req(connection.channel.incomingSequence==1 and runtime.packetState.serverMessageSequence==1,"netchan and packet sequence advance")
  count=count+req(connection.lastPacketTime==6000 and runtime.packetState.connection.lastPacketTime==6000,"timeout timestamp advances")
  count=count+req(protocolState.dispatcher.serverCommandSequence==1,"reliable command sequence parsed")
  count=count+req(protocolState.dispatcher.serverCommands[1]=="print ingress-one","reliable command payload parsed")
  count=count+req(clientWire.serverCommands[1]=="print ingress-one","XOR command ring synchronized")
  count=count+req(runtime.packetCount==1 and len(wire)>8,"pump accounts binary packet")

  runtime.packetState.demoRecording=true;runtime.packetState.demoWaiting=false;ingress.setRealtime(runtime,6016)
  sendServer(serverRuntime,serverClient,2,"print ingress-two");waitFor(pump,runtime,2)
  count=count+req(runtime.lastParseResult==[1,0] and protocolState.dispatcher.serverCommandSequence==2,"second reliable command parsed")
  count=count+req(capture.demoCount==1 and capture.demoHeader==4,"demo boundary receives physical header size")
  count=count+req(connection.channel.incomingSequence==2 and connection.lastPacketTime==6016,"second packet advances timing")

  transport.outOfBandPrint(serverSocket,clientAddress,"print\nlocalhost-oob")
  waitFor(pump,runtime,3)
  count=count+req(runtime.lastPacketResult=="oob" and capture.oobPrint=="localhost-oob","OOB response reaches connectionless dispatcher")
  count=count+req(connection.channel.incomingSequence==2,"OOB leaves sequenced channel unchanged")

  // The opposite socket remains available to a combined client/server frame.
  payload=bytes([6,7,8,9]);udp.sendTo(clientSocket,serverEndpoint,payload)
  for attempt=0 to 19999 networkPump.drain(pump,2);if capture.serverPackets==1 then break end if end for
  count=count+req(capture.serverPackets==1 and capture.serverBytes==payload,"server-side pump callback")
  count=count+req(runtime.packetCount==3,"server datagram excluded from client count")

  count=count+req(try(ingress.create(void,clientRuntime,protocolState,host)) is error,"runtime validates connection")
  count=count+req(try(ingress.create(connection,void,protocolState,host)) is error,"runtime validates netchan")
  count=count+req(try(ingress.create(connection,clientRuntime,void,host)) is error,"runtime validates protocol")
  count=count+req(try(ingress.clientPacket(void,serverAddress,bytes(1,0))) is error,"packet validates runtime")
  count=count+req(try(ingress.createPump(void,clientSocket,serverSocket,1024)) is error,"pump validates runtime")

  udp.close(clientSocket);udp.close(serverSocket);udp.cleanup()
  print "PASS: "+str(count)+" client network-ingress contracts";return 0
end function
