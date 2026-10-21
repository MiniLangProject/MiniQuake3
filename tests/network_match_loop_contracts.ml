// SPDX-License-Identifier: GPL-2.0-or-later
// Real localhost client command -> server move -> snapshot -> client loop.
import mq3.client.connectionless as clientConnectionless
import mq3.client.netchan as clientNetchan
import mq3.client.network_ingress as clientIngress
import mq3.client.network_match_loop as matchLoop
import mq3.client.protocol_runtime as clientProtocol
import mq3.client.send_cmd as clientSend
import mq3.game.entitystate as entityState
import mq3.game.playerstate as playerState
import mq3.platform.udp as udp
import mq3.qcommon.message_delta as usercmdDelta
import mq3.qcommon.net_transport as transport
import mq3.qcommon.netchan as netchan
import mq3.server.client_command as serverCommand
import mq3.server.client_command_dispatch as commandDispatch
import mq3.server.client_input as clientInput
import mq3.server.client_message as clientMessage
import mq3.server.network_ingress as serverIngress
import mq3.server.netchan as serverNetchan
import mq3.server.packet_event as serverPacket
import mq3.server.reliable_commands as reliable
import mq3.server.snapshot_send as snapshotSend
import mq3.server.user_move as userMove

struct Capture moves lastCommand builds end struct
function req(value,label) if not value then return error(7713,"network match loop: "+label) end if;return 1 end function
function createCommand(host,state,msec,time) return usercmdDelta.userCommand(time,100+state.cmdNumber,200,300,0x11,state.cmdNumber,64,-32,8) end function
function think(host,client,command) host.context.moves=host.context.moves+1;host.context.lastCommand=command;return void end function
function builtin(host,client,name,parser) return void end function
function game(host,client,parser) return void end function
function disconnected(host,address,text) return void end function
function buildSnapshot(host,client,server)
  capture=host.context;ps=playerState.create();if capture.lastCommand!=void then ps.commandTime=capture.lastCommand.serverTime;ps.weapon=capture.lastCommand.weapon end if
  ps.origin=[capture.builds*1.0,2.0,3.0];slot=client.outgoingSequence&snapshotSend.PACKET_MASK
  client.frames[slot]=snapshotSend.frame(server.nextSnapshotEntities,0,bytes([0]),ps);capture.builds=capture.builds+1;return void
end function
function localAddress(host,client) return true end function
function inputClock(runtime,time) return clientInput.setTime(runtime,time) end function
function waitServer(runtimeState,wanted)
  for attempt=0 to 19999 matchLoop.pump(runtimeState,8);if runtimeState.serverIngressRuntime.packetCount>=wanted then return true end if end for;return false
end function
function waitClient(runtimeState,wanted)
  for attempt=0 to 19999 matchLoop.pump(runtimeState,8);if runtimeState.clientIngressRuntime.packetCount>=wanted then return true end if end for;return false
end function
function waitDatagram(socket)
  for attempt=0 to 19999 packet=transport.receive(socket,netchan.MAX_MSGLEN);if packet.received then return packet end if end for
  return error(7713,"network match loop: datagram timeout")
end function

function main(args)
  count=0;challenge=0x4567;qport=23117;capture=Capture(0,void,0)
  udp.startup();clientSocket=udp.open();serverSocket=udp.open();loopback=udp.ipv4(127,0,0,1)
  clientEndpoint=udp.bind(clientSocket,udp.Endpoint(loopback,0));serverEndpoint=udp.bind(serverSocket,udp.Endpoint(loopback,0))
  clientAddress=transport.endpointToAddress(clientEndpoint);serverAddress=transport.endpointToAddress(serverEndpoint)

  clientChannel=netchan.setup(netchan.NS_CLIENT,serverAddress,qport);clientConnection=clientConnectionless.create(serverAddress)
  clientConnection.connectionState=clientConnectionless.CA_ACTIVE;clientConnection.channel=clientChannel;clientConnection.challenge=challenge
  clientWireConnection=clientNetchan.createConnection();clientWireConnection.challenge=challenge
  clientWire=clientNetchan.create(transport.attach(netchan.init(qport),clientSocket),clientWireConnection)
  protocol=clientProtocol.create(void);oob=clientConnectionless.services();clientHost=clientIngress.services(oob)
  clientRuntime=clientIngress.create(clientConnection,clientWire,protocol,clientHost)

  serverChannel=netchan.setup(netchan.NS_SERVER,clientAddress,qport);serverWireClient=serverNetchan.client(challenge,serverChannel)
  packetClient=serverPacket.client(serverPacket.CS_ZOMBIE+3,serverWireClient);messageClient=clientInput.createClient();messageClient.state=clientInput.createClient().state+4
  commandHost=serverCommand.runtime();dispatchHost=commandDispatch.services();dispatchHost.builtinFn=builtin;dispatchHost.gameFn=game
  moveServer=userMove.createServer(0x13572468,0,0);moveHost=userMove.services();moveHost.context=capture;moveHost.thinkFn=think
  inputRuntime=clientInput.create(commandHost,dispatchHost,moveServer,moveHost,commandDispatch.SS_GAME)
  serverHost=serverIngress.services();serverHost.context=inputRuntime;serverHost.clientCommandFn=clientInput.clientCommandFn;serverHost.userMoveFn=clientInput.userMoveFn;serverHost.disconnectFn=disconnected
  serverRuntime=serverIngress.create(clientMessage.createServer(100,90),[serverIngress.binding(packetClient,messageClient)],serverHost)

  sendState=clientSend.create();sendState.connectionState=clientSend.CA_ACTIVE;sendState.remoteAddressType=4;sendState.lanAddress=true
  sendState.serverId=100;sendState.checksumFeed=0x13572468;sendState.packetDup=0
  sendServices=clientSend.liveServices(clientWire,clientChannel);sendServices.createCommandFn=createCommand
  snapshotClient=snapshotSend.client();snapshotClient.state=snapshotSend.CS_ACTIVE
  dummy=entityState.create();snapshotServer=snapshotSend.server(0,[dummy],1,[dummy]);serverWireRuntime=transport.attach(netchan.init(0),serverSocket)
  runtimeState=matchLoop.create(clientSocket,serverSocket,netchan.MAX_MSGLEN,sendState,sendServices,clientConnection,clientWire,protocol,clientRuntime,serverRuntime,packetClient,messageClient,snapshotClient,snapshotServer,serverWireRuntime,serverWireClient)
  matchLoop.attachServerClock(runtimeState,inputClock,inputRuntime)
  snapshotDelegate=snapshotSend.services(buildSnapshot,void,void,localAddress,void,capture)
  count=count+req(runtimeState.pump!=void and runtimeState.clientSendState==sendState,"composition retained")
  count=count+req(runtimeState.serverTimeContext==inputRuntime,"server clock bound")
  count=count+req(try(matchLoop.create(void,serverSocket,64,sendState,sendServices,clientConnection,clientWire,protocol,clientRuntime,serverRuntime,packetClient,messageClient,snapshotClient,snapshotServer,serverWireRuntime,serverWireClient)) is error,"component validation")

  matchLoop.setTime(runtimeState,1000);sent=matchLoop.sendClientFrame(runtimeState,1000)
  count=count+req(not (sent is error) and sent.commandCount==1 and sent.moveType==clientSend.CLC_MOVE_NO_DELTA,"first client no-delta packet")
  count=count+req(waitServer(runtimeState,1) and serverRuntime.lastClientResult=="moveNoDelta","first packet reaches server parser")
  count=count+req(capture.moves==1 and capture.lastCommand.serverTime==1000 and capture.lastCommand.forwardmove==64,"server decodes first usercmd")
  count=count+req(messageClient.messageAcknowledge==0 and messageClient.deltaMessage== -1,"first server acknowledgement state")

  count=count+req(reliable.add(snapshotClient,"print roundtrip"),"server reliable queued")
  firstSnapshot=matchLoop.sendServerSnapshot(runtimeState,snapshotDelegate);count=count+req(not (firstSnapshot is error) and capture.builds==1,"first snapshot constructed")
  count=count+req(waitClient(runtimeState,1) and clientRuntime.lastParseResult==[1,1],"first snapshot reaches client parser")
  snap=protocol.dispatcher.snapshotState.snap
  count=count+req(snap.valid and snap.messageNum==1 and snap.playerState.commandTime==1000,"first snapshot promoted")
  count=count+req(protocol.dispatcher.serverCommandSequence==1 and protocol.dispatcher.serverCommands[1]=="print roundtrip","server reliable parsed")
  count=count+req(sendState.reliableAcknowledge==0 and sendState.serverMessageSequence==1 and sendState.serverCommandSequence==1,"client send state synchronized")

  matchLoop.setTime(runtimeState,1050);sent=matchLoop.sendClientFrame(runtimeState,1050)
  count=count+req(sent.commandCount==1 and sent.moveType==clientSend.CLC_MOVE,"second client delta packet")
  count=count+req(waitServer(runtimeState,2) and serverRuntime.lastClientResult=="move","second packet reaches server parser")
  count=count+req(capture.moves==2 and capture.lastCommand.serverTime==1050 and capture.lastCommand.weapon==2,"server decodes second usercmd")
  count=count+req(messageClient.reliableAcknowledge==1 and messageClient.deltaMessage==1,"snapshot and reliable acknowledgements returned")

  secondSnapshot=matchLoop.sendServerSnapshot(runtimeState,snapshotDelegate);count=count+req(not (secondSnapshot is error) and capture.builds==2,"delta snapshot constructed")
  count=count+req(waitClient(runtimeState,2) and clientRuntime.lastParseResult==[0,1],"delta snapshot reaches client parser")
  snap=protocol.dispatcher.snapshotState.snap
  count=count+req(snap.valid and snap.messageNum==2 and snap.deltaNum==1 and snap.playerState.commandTime==1050,"delta snapshot promoted")
  count=count+req(snapshotClient.reliableAcknowledge==1 and snapshotClient.outgoingSequence==3,"server client state synchronized")
  count=count+req(clientChannel.outgoingSequence==3 and serverChannel.incomingSequence==2 and serverChannel.outgoingSequence==3 and clientChannel.incomingSequence==2,"both netchan directions advanced")
  count=count+req(protocol.dispatcher.snapshotState.outPackets[2].serverTime==1050,"client outpacket ring shared with ping parser")
  idle=matchLoop.pumpOnce(runtimeState);count=count+req(not idle.processed,"single-packet pump reports idle")

  // Drop client packet 3 at the real UDP boundary. packetdup=1 makes packet 4
  // replay commands 3 and 4, while SV_UserMove suppresses the repeated command
  // 2 and advances the game exactly twice.
  sendState.packetDup=1;matchLoop.setTime(runtimeState,1100);lostClient=matchLoop.sendClientFrame(runtimeState,1100)
  count=count+req(lostClient.commandCount==2 and lostClient.moveType==clientSend.CLC_MOVE,"packetdup includes prior client command")
  droppedClientDatagram=waitDatagram(serverSocket);count=count+req(not (droppedClientDatagram is error) and serverRuntime.packetCount==2,"client datagram deliberately lost")
  matchLoop.setTime(runtimeState,1150);recoveryClient=matchLoop.sendClientFrame(runtimeState,1150)
  count=count+req(recoveryClient.commandCount==2,"loss recovery packet contains two commands")
  recoveredDatagram=waitDatagram(serverSocket);count=count+req(not (recoveredDatagram is error),"recovery datagram received from Winsock")
  recoveredResult=matchLoop.receiveServer(runtimeState,recoveredDatagram.address,recoveredDatagram.data);matchLoop.synchronize(runtimeState)
  count=count+req(recoveredResult=="accepted" and capture.moves==4 and capture.lastCommand.serverTime==1150,"server replays only missing commands")
  udp.sendTo(clientSocket,transport.addressToEndpoint(serverAddress),recoveredDatagram.data)
  count=count+req(waitServer(runtimeState,4) and serverRuntime.lastPacketResult=="rejected","duplicate client datagram rejected")
  count=count+req(capture.moves==4 and serverChannel.incomingSequence==4 and serverChannel.dropped==1,"duplicate does not execute game input")

  recoveredSnapshot=matchLoop.sendServerSnapshot(runtimeState,snapshotDelegate)
  count=count+req(not (recoveredSnapshot is error) and waitClient(runtimeState,3),"snapshot after client loss delivered")
  snap=protocol.dispatcher.snapshotState.snap
  count=count+req(snap.valid and snap.messageNum==3 and snap.deltaNum==2 and snap.playerState.commandTime==1150,"delta snapshot after command recovery promoted")

  // Deliver command 5, then lose server snapshot 4. The next client packet
  // still acknowledges snapshot 3, so server packet 5 can delta from the
  // retained frame even though the netchan sequence has a one-packet hole.
  matchLoop.setTime(runtimeState,1200);fifthClient=matchLoop.sendClientFrame(runtimeState,1200)
  count=count+req(fifthClient.commandCount==2 and waitServer(runtimeState,5) and capture.moves==5,"fifth command delivered with packetdup")
  lostSnapshot=matchLoop.sendServerSnapshot(runtimeState,snapshotDelegate);droppedServerDatagram=waitDatagram(clientSocket)
  count=count+req(not (lostSnapshot is error) and not (droppedServerDatagram is error) and clientRuntime.packetCount==3,"server snapshot deliberately lost")
  matchLoop.setTime(runtimeState,1250);sixthClient=matchLoop.sendClientFrame(runtimeState,1250)
  count=count+req(sixthClient.commandCount==2 and waitServer(runtimeState,6) and capture.moves==6,"client continues after snapshot loss")
  count=count+req(messageClient.messageAcknowledge==3 and messageClient.deltaMessage==3,"client requests retained delta base")

  recoverySnapshot=matchLoop.sendServerSnapshot(runtimeState,snapshotDelegate);recoveryServerDatagram=waitDatagram(clientSocket)
  count=count+req(not (recoverySnapshot is error) and not (recoveryServerDatagram is error),"server recovery snapshot received from Winsock")
  firstRecovery=matchLoop.receiveClient(runtimeState,recoveryServerDatagram.address,recoveryServerDatagram.data);matchLoop.synchronize(runtimeState)
  count=count+req(firstRecovery=="sequenced","recovery snapshot accepted")
  snap=protocol.dispatcher.snapshotState.snap
  count=count+req(snap.valid and snap.messageNum==5 and snap.deltaNum==3 and snap.playerState.commandTime==1250,"snapshot gap recovered from retained delta")
  udp.sendTo(serverSocket,transport.addressToEndpoint(clientAddress),recoveryServerDatagram.data)
  count=count+req(waitClient(runtimeState,5) and clientRuntime.lastPacketResult=="rejected","duplicate server snapshot rejected")
  count=count+req(clientChannel.incomingSequence==5 and clientChannel.dropped==1 and protocol.dispatcher.snapshotState.snap.messageNum==5,"duplicate preserves promoted snapshot")

  // cl_nodelta is Baseq3's explicit full-snapshot recovery request.
  sendState.noDelta=true;matchLoop.setTime(runtimeState,1300);fullRequest=matchLoop.sendClientFrame(runtimeState,1300)
  count=count+req(fullRequest.moveType==clientSend.CLC_MOVE_NO_DELTA and waitServer(runtimeState,7),"explicit no-delta request reaches server")
  count=count+req(messageClient.deltaMessage== -1 and capture.moves==7,"server selects full snapshot fallback")
  fullRecovery=matchLoop.sendServerSnapshot(runtimeState,snapshotDelegate)
  count=count+req(not (fullRecovery is error) and waitClient(runtimeState,6),"full recovery snapshot delivered")
  snap=protocol.dispatcher.snapshotState.snap
  count=count+req(snap.valid and snap.messageNum==6 and snap.deltaNum== -1 and snap.playerState.commandTime==1300,"full fallback snapshot promoted")
  count=count+req(snapshotClient.outgoingSequence==7 and clientChannel.outgoingSequence==8 and serverChannel.incomingSequence==7,"multi-frame sequences remain coherent")
  count=count+req(try(matchLoop.pump(runtimeState,-1)) is error and try(matchLoop.setTime(void,0)) is error,"runtime validation")

  udp.close(clientSocket);udp.close(serverSocket);udp.cleanup()
  print("PASS: "+str(count)+" live network match-loop contracts");return 0
end function
