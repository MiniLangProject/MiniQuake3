// SPDX-License-Identifier: GPL-2.0-or-later
// Two real localhost clients sharing one server ingress and snapshot world.
import mq3.client.connectionless as clientConnectionless
import mq3.client.frame as clientFrame
import mq3.client.netchan as clientNetchan
import mq3.client.network_ingress as clientIngress
import mq3.client.network_handshake as handshake
import mq3.client.network_match_loop as matchLoop
import mq3.client.protocol_runtime as clientProtocol
import mq3.client.send_cmd as clientSend
import mq3.client.snapshot_parse as snapshotParse
import mq3.game.entitystate as entityState
import mq3.game.playerstate as playerState
import mq3.platform.udp as udp
import mq3.qcommon.message_delta as usercmdDelta
import mq3.qcommon.huffman as huffman
import mq3.qcommon.net_transport as transport
import mq3.qcommon.netchan as netchan
import mq3.server.client_command as serverCommand
import mq3.server.client_command_dispatch as commandDispatch
import mq3.server.client_input as clientInput
import mq3.server.client_message as clientMessage
import mq3.server.connectionless as serverConnectionless
import mq3.server.network_ingress as serverIngress
import mq3.server.netchan as serverNetchan
import mq3.server.packet_event as serverPacket
import mq3.server.reliable_commands as reliable
import mq3.server.snapshot_send as snapshotSend
import mq3.server.timeouts as serverTimeouts
import mq3.server.user_move as userMove

struct World clientA clientB movesA movesB lastA lastB buildsA buildsB commandsA commandsB end struct
struct View world clientId end struct
struct ClientOob socket name end struct
struct ServerOob socket random end struct

function req(value,label) if not value then return error(7714,"network match multi: "+label) end if;return 1 end function
function commandA(host,state,msec,time) return usercmdDelta.userCommand(time,10+state.cmdNumber,20,30,0x11,1,11,0,0) end function
function commandB(host,state,msec,time) return usercmdDelta.userCommand(time,40+state.cmdNumber,50,60,0x22,2,-22,0,0) end function
function think(host,client,command)
  world=host.context
  if client==world.clientA then world.movesA=world.movesA+1;world.lastA=command else if client==world.clientB then world.movesB=world.movesB+1;world.lastB=command end if
  return void
end function
function builtin(host,client,name,parser) return void end function
function game(host,client,parser)
  world=host.context;if client==world.clientA then world.commandsA=world.commandsA+1 else if client==world.clientB then world.commandsB=world.commandsB+1 end if;return void
end function
function disconnected(host,address,text) return void end function
function localAddress(host,client) return true end function
function inputClock(runtime,time) return clientInput.setTime(runtime,time) end function
function clientLan(host,state,address) return true end function
function clientUserinfo(host,state) return "\\name\\"+host.context.name end function
function clientOob(host,state,address,text) return transport.outOfBandPrint(host.context.socket,address,text) end function
function clientOobData(host,state,address,data) return transport.outOfBandData(host.context.socket,address,data) end function
function clientOobServices(socket,name)
  host=clientConnectionless.services();host.context=ClientOob(socket,name);host.lanFn=clientLan;host.userinfoFn=clientUserinfo;host.outOfBandFn=clientOob;host.outOfBandDataFn=clientOobData;return host
end function
function serverRandom(runtime) value=runtime.context.random;runtime.context.random=value+1;return value end function
function serverLan(runtime,address) return true end function
function serverLocal(runtime,address) return false end function
function serverGameConnect(runtime,slot,userinfo) return void end function
function serverOobSend(runtime,address,text) return transport.outOfBandPrint(runtime.context.socket,address,text) end function
function serverDecompress(host,msg,offset)
  restored=huffman.decompressPacket(slice(msg.data,0,msg.cursize),offset,netchan.MAX_MSGLEN);msg.data=restored;msg.maxsize=len(restored);msg.cursize=len(restored);return void
end function

function buildSnapshot(host,client,server)
  view=host.context;world=view.world;own=world.lastA;other=world.lastB;builds=world.buildsA
  if view.clientId==1 then own=world.lastB;other=world.lastA;builds=world.buildsB end if
  ps=playerState.create();ps.clientNum=view.clientId;if own!=void then ps.commandTime=own.serverTime;ps.weapon=own.weapon end if
  otherId=1-view.clientId;visible=entityState.create();visible.number=otherId;visible.clientNum=otherId;visible.eType=1
  if other!=void then visible.pos.trBase=[other.serverTime*1.0,other.forwardmove*1.0,other.weapon*1.0];visible.weapon=other.weapon end if
  first=server.nextSnapshotEntities;server.snapshotEntities[first%server.snapshotCapacity]=visible;server.nextSnapshotEntities=first+1
  slot=client.outgoingSequence&snapshotSend.PACKET_MASK;client.frames[slot]=snapshotSend.frame(first,1,bytes([0]),ps)
  if view.clientId==0 then world.buildsA=builds+1 else world.buildsB=builds+1 end if;return void
end function

function visibleEntity(protocol)
  snap=protocol.dispatcher.snapshotState.snap;state=protocol.dispatcher.snapshotState.entityState
  return snapshotParse.parsedEntity(state,snap.parseEntitiesNum)
end function

function waitServer(groupState,serverRuntime,wanted)
  for attempt=0 to 19999 matchLoop.pumpGroup(groupState,16);if serverRuntime.packetCount>=wanted then return true end if end for;return false
end function
function waitClients(groupState,clientA,numberA,clientB,numberB)
  for attempt=0 to 19999 matchLoop.pumpGroup(groupState,16);if clientA.packetCount>=numberA and clientB.packetCount>=numberB then return true end if end for;return false
end function
function waitDatagram(socket)
  for attempt=0 to 19999 packet=transport.receive(socket,netchan.MAX_MSGLEN);if packet.received then return packet end if end for;return error(7714,"network match multi: datagram timeout")
end function
function waitChallenging(handshakeState,connectionA,connectionB)
  for attempt=0 to 19999 handshake.pump(handshakeState,16);if connectionA.connectionState==clientConnectionless.CA_CHALLENGING and connectionB.connectionState==clientConnectionless.CA_CHALLENGING then return true end if end for;return false
end function
function waitHandshake(handshakeState)
  for attempt=0 to 19999 handshake.pump(handshakeState,16);if handshake.allReady(handshakeState) then return true end if end for;return false
end function

function main(args)
  count=0;serverId=200;checksum=0x24681357;world=World(void,void,0,0,void,void,0,0,0,0)
  udp.startup();socketA=udp.open();socketB=udp.open();serverSocket=udp.open();loopback=udp.ipv4(127,0,0,1)
  endpointA=udp.bind(socketA,udp.Endpoint(loopback,0));endpointB=udp.bind(socketB,udp.Endpoint(loopback,0));serverEndpoint=udp.bind(serverSocket,udp.Endpoint(loopback,0))
  addressA=transport.endpointToAddress(endpointA);addressB=transport.endpointToAddress(endpointB);serverAddress=transport.endpointToAddress(serverEndpoint)

  channelA=netchan.setup(netchan.NS_CLIENT,serverAddress,24001);connectionA=clientConnectionless.create(serverAddress);connectionA.connectionState=clientConnectionless.CA_CONNECTING;connectionA.channel=channelA;connectionA.qport=24001
  wireConnectionA=clientNetchan.createConnection();wireA=clientNetchan.create(transport.attach(netchan.init(24001),socketA),wireConnectionA)
  protocolA=clientProtocol.create(void);ingressA=clientIngress.create(connectionA,wireA,protocolA,clientIngress.services(clientOobServices(socketA,"Alpha")))
  sendA=clientSend.create();sendA.connectionState=clientConnectionless.CA_CONNECTING;sendA.remoteAddressType=4;sendA.lanAddress=true;sendA.serverId=serverId;sendA.checksumFeed=checksum
  sendServicesA=clientSend.liveServices(wireA,channelA);sendServicesA.createCommandFn=commandA

  channelB=netchan.setup(netchan.NS_CLIENT,serverAddress,24002);connectionB=clientConnectionless.create(serverAddress);connectionB.connectionState=clientConnectionless.CA_CONNECTING;connectionB.channel=channelB;connectionB.qport=24002
  wireConnectionB=clientNetchan.createConnection();wireB=clientNetchan.create(transport.attach(netchan.init(24002),socketB),wireConnectionB)
  protocolB=clientProtocol.create(void);ingressB=clientIngress.create(connectionB,wireB,protocolB,clientIngress.services(clientOobServices(socketB,"Bravo")))
  sendB=clientSend.create();sendB.connectionState=clientConnectionless.CA_CONNECTING;sendB.remoteAddressType=4;sendB.lanAddress=true;sendB.serverId=serverId;sendB.checksumFeed=checksum
  sendServicesB=clientSend.liveServices(wireB,channelB);sendServicesB.createCommandFn=commandB

  serverChannelA=netchan.setup(netchan.NS_SERVER,addressA,24001);serverWireClientA=serverNetchan.client(0,serverChannelA);packetClientA=serverPacket.client(serverPacket.CS_ZOMBIE+3,serverWireClientA);messageClientA=clientInput.createClient();messageClientA.state=clientInput.createClient().state+4
  serverChannelB=netchan.setup(netchan.NS_SERVER,addressB,24002);serverWireClientB=serverNetchan.client(0,serverChannelB);packetClientB=serverPacket.client(serverPacket.CS_ZOMBIE+3,serverWireClientB);messageClientB=clientInput.createClient();messageClientB.state=clientInput.createClient().state+4
  world.clientA=messageClientA;world.clientB=messageClientB

  commandHost=serverCommand.runtime();commandHost.clientRunning=true;dispatchHost=commandDispatch.services();dispatchHost.context=world;dispatchHost.builtinFn=builtin;dispatchHost.gameFn=game
  moveServer=userMove.createServer(checksum,0,0);moveHost=userMove.services();moveHost.context=world;moveHost.thinkFn=think
  inputRuntime=clientInput.create(commandHost,dispatchHost,moveServer,moveHost,commandDispatch.SS_GAME)
  connectRuntime=serverConnect.create(2,serverConnect.config());connectRuntime.randFn=serverRandom;connectRuntime.lanFn=serverLan;connectRuntime.localFn=serverLocal;connectRuntime.sendFn=serverOobSend;connectRuntime.gameConnectFn=serverGameConnect;connectRuntime.context=ServerOob(serverSocket,17)
  connectionlessHost=serverConnectionless.services();connectionlessHost.decompressFn=serverDecompress
  serverHost=serverIngress.services();serverHost.context=inputRuntime;serverHost.connectionlessRuntime=connectRuntime;serverHost.connectionlessHost=connectionlessHost;serverHost.clientCommandFn=clientInput.clientCommandFn;serverHost.userMoveFn=clientInput.userMoveFn;serverHost.disconnectFn=disconnected
  serverRuntime=serverIngress.create(clientMessage.createServer(serverId,serverId-10),[serverIngress.binding(packetClientA,messageClientA),serverIngress.binding(packetClientB,messageClientB)],serverHost)

  snapshotClientA=snapshotSend.client();snapshotClientA.state=snapshotSend.CS_ACTIVE;snapshotClientB=snapshotSend.client();snapshotClientB.state=snapshotSend.CS_ACTIVE
  baseA=entityState.create();baseA.number=0;baseB=entityState.create();baseB.number=1
  entities=array(64,baseA);snapshotServer=snapshotSend.server(0,entities,64,[baseA,baseB]);serverWireRuntime=transport.attach(netchan.init(0),serverSocket)
  runtimeA=matchLoop.create(socketA,serverSocket,netchan.MAX_MSGLEN,sendA,sendServicesA,connectionA,wireA,protocolA,ingressA,serverRuntime,packetClientA,messageClientA,snapshotClientA,snapshotServer,serverWireRuntime,serverWireClientA)
  runtimeB=matchLoop.create(socketB,serverSocket,netchan.MAX_MSGLEN,sendB,sendServicesB,connectionB,wireB,protocolB,ingressB,serverRuntime,packetClientB,messageClientB,snapshotClientB,snapshotServer,serverWireRuntime,serverWireClientB)
  matchLoop.attachServerClock(runtimeA,inputClock,inputRuntime);matchLoop.attachServerClock(runtimeB,inputClock,inputRuntime)
  groupState=matchLoop.createGroup([runtimeA,runtimeB]);delegateA=snapshotSend.services(buildSnapshot,void,void,localAddress,void,View(world,0));delegateB=snapshotSend.services(buildSnapshot,void,void,localAddress,void,View(world,1))
  count=count+req(not (groupState is error) and len(groupState.runtimes)==2,"shared match group created")
  count=count+req(try(matchLoop.createGroup([runtimeA])) is error and try(matchLoop.createGroup([runtimeA,runtimeA])) is error,"group topology validation")
  savedQport=serverChannelB.qport;serverChannelB.qport=serverChannelA.qport;count=count+req(try(matchLoop.createGroup([runtimeA,runtimeB])) is error,"ambiguous localhost qport rejected");serverChannelB.qport=savedQport
  count=count+req(try(matchLoop.pumpGroup(groupState,-1)) is error,"group budget validation")

  savedClientQport=connectionB.qport;connectionB.qport=0;count=count+req(try(handshake.create(groupState,connectRuntime)) is error,"invalid client qport rejected");connectionB.qport=savedClientQport
  handshakeState=handshake.create(groupState,connectRuntime);count=count+req(not (handshakeState is error),"productive handshake composed")
  handshake.setTime(handshakeState,4000);count=count+req(handshake.resend(handshakeState)==2,"both clients emit getchallenge")
  count=count+req(waitChallenging(handshakeState,connectionA,connectionB),"both challenge responses dispatched")
  count=count+req(connectionA.challenge!=0 and connectionB.challenge!=0 and connectionA.challenge!=connectionB.challenge,"per-client challenges isolated")
  count=count+req(connectRuntime.challenges[0].address.port!=connectRuntime.challenges[1].address.port,"server challenge addresses isolated")
  count=count+req(handshake.resend(handshakeState)==2,"both clients emit compressed connect")
  count=count+req(waitHandshake(handshakeState),"both connect responses handed to netchans")
  count=count+req(connectionA.connectionState==clientConnectionless.CA_CONNECTED and connectionB.connectionState==clientConnectionless.CA_CONNECTED,"client connection states connected")
  count=count+req(handshakeState.slots[0].serverSlot!=handshakeState.slots[1].serverSlot,"server slots independently assigned")
  count=count+req(serverWireClientA.challenge==connectionA.challenge and serverWireClientB.challenge==connectionB.challenge,"challenge keys handed to server netchans")
  count=count+req(serverWireClientA.channel.qport==24001 and serverWireClientB.channel.qport==24002,"qports handed to server netchans")
  count=count+req(wireConnectionA.challenge==connectionA.challenge and wireConnectionB.challenge==connectionB.challenge,"challenge keys handed to client netchans")
  acceptedA=connectRuntime.clients[handshakeState.slots[0].serverSlot]
  savedChallenge=acceptedA.challenge;acceptedA.challenge=savedChallenge+1;count=count+req(try(handshake.reconcile(handshakeState)) is error,"challenge mismatch rejected");acceptedA.challenge=savedChallenge;handshake.reconcile(handshakeState)
  savedAcceptedQport=acceptedA.qport;acceptedA.qport=25000;count=count+req(try(handshake.reconcile(handshakeState)) is error,"accepted qport mismatch rejected");acceptedA.qport=savedAcceptedQport;handshake.reconcile(handshakeState)
  savedAcceptedAddress=acceptedA.address;acceptedA.address=netchan.Address(savedAcceptedAddress.type,savedAcceptedAddress.ip,savedAcceptedAddress.port+10);count=count+req(try(handshake.reconcile(handshakeState)) is error,"accepted address mismatch rejected");acceptedA.address=savedAcceptedAddress;handshake.reconcile(handshakeState)
  count=count+req(try(handshake.activate(handshakeState,2)) is error,"activation index validation")
  handshake.activate(handshakeState,0);handshake.activate(handshakeState,1)
  count=count+req(connectionA.connectionState==clientConnectionless.CA_ACTIVE and connectionB.connectionState==clientConnectionless.CA_ACTIVE,"connected clients activated")
  clientFrameA=clientFrame.runtime();clientFrameB=clientFrame.runtime();timeoutClientA=serverTimeouts.client(serverTimeouts.CS_ACTIVE,0,0);timeoutClientB=serverTimeouts.client(serverTimeouts.CS_ACTIVE,0,0)
  matchLoop.attachFrameStates(runtimeA,clientFrameA,timeoutClientA);matchLoop.attachFrameStates(runtimeB,clientFrameB,timeoutClientB)
  count=count+req(clientFrameA.state==clientConnectionless.CA_ACTIVE and timeoutClientA.state==serverTimeouts.CS_ACTIVE and try(matchLoop.attachFrameStates(runtimeA,void,timeoutClientA)) is error,"frame timeout projections attached")

  sendA.reliableSequence=1;sendA.reliableCommands[1]="say alpha";sendB.reliableSequence=1;sendB.reliableCommands[1]="say bravo"
  matchLoop.setGroupTime(groupState,1000);packetA1=matchLoop.sendClientFrame(runtimeA,1000)
  matchLoop.setGroupTime(groupState,1010);packetB1=matchLoop.sendClientFrame(runtimeB,1010)
  count=count+req(packetA1.moveType==clientSend.CLC_MOVE_NO_DELTA and packetB1.moveType==clientSend.CLC_MOVE_NO_DELTA,"both clients send initial moves")
  count=count+req(waitServer(groupState,serverRuntime,2),"shared server receives both clients")
  count=count+req(world.movesA==1 and world.lastA.serverTime==1000 and world.lastA.forwardmove==11,"client A usercmd isolated")
  count=count+req(world.movesB==1 and world.lastB.serverTime==1010 and world.lastB.forwardmove== -22,"client B usercmd isolated")
  count=count+req(messageClientA.lastClientCommandString=="say alpha" and messageClientB.lastClientCommandString=="say bravo","client reliable rings isolated")
  count=count+req(world.commandsA==1 and world.commandsB==1,"reliable commands dispatched per client")
  count=count+req(serverWireClientA.channel.incomingSequence==1 and serverWireClientB.channel.incomingSequence==1,"server netchan sequences independent")
  boundChannelA=serverWireClientA.channel;handshake.reconcile(handshakeState);count=count+req(serverWireClientA.channel==boundChannelA and serverWireClientA.channel.incomingSequence==1,"reconcile preserves live server channel")

  reliable.add(snapshotClientA,"cp server-alpha");reliable.add(snapshotClientB,"cp server-bravo")
  snapshotA1=matchLoop.sendServerSnapshot(runtimeA,delegateA);snapshotB1=matchLoop.sendServerSnapshot(runtimeB,delegateB)
  count=count+req(not (snapshotA1 is error) and not (snapshotB1 is error) and world.buildsA==1 and world.buildsB==1,"per-client snapshots built")
  count=count+req(waitClients(groupState,ingressA,1,ingressB,1),"both snapshots traverse separate client sockets")
  snapA=protocolA.dispatcher.snapshotState.snap;snapB=protocolB.dispatcher.snapshotState.snap;visibleA=visibleEntity(protocolA);visibleB=visibleEntity(protocolB)
  count=count+req(snapA.valid and snapA.messageNum==1 and snapA.playerState.commandTime==1000 and snapA.playerState.clientNum==0,"client A snapshot state isolated")
  count=count+req(snapB.valid and snapB.messageNum==1 and snapB.playerState.commandTime==1010 and snapB.playerState.clientNum==1,"client B snapshot state isolated")
  count=count+req(visibleA.number==1 and visibleA.clientNum==1 and visibleA.pos.trBase==[1010.0,-22.0,2.0],"client A sees client B entity")
  count=count+req(visibleB.number==0 and visibleB.clientNum==0 and visibleB.pos.trBase==[1000.0,11.0,1.0],"client B sees client A entity")
  count=count+req(protocolA.dispatcher.serverCommands[1]=="cp server-alpha" and protocolB.dispatcher.serverCommands[1]=="cp server-bravo","server reliable rings isolated")
  count=count+req(connectionA.channel.incomingSequence==1 and connectionB.channel.incomingSequence==1 and serverWireClientA.channel.outgoingSequence==2 and serverWireClientB.channel.outgoingSequence==2,"snapshot netchan sequences independent")

  // Advance A alone: B's command and snapshot acknowledgement must not move.
  matchLoop.setGroupTime(groupState,1100);packetA2=matchLoop.sendClientFrame(runtimeA,1100)
  count=count+req(packetA2.moveType==clientSend.CLC_MOVE and waitServer(groupState,serverRuntime,3),"client A delta move delivered")
  count=count+req(world.movesA==2 and world.movesB==1 and messageClientA.messageAcknowledge==1 and messageClientA.reliableAcknowledge==1,"client A acknowledgements advanced")
  count=count+req(messageClientB.messageAcknowledge==0 and messageClientB.reliableAcknowledge==0 and serverWireClientB.channel.incomingSequence==1,"idle client B remains unchanged")
  snapshotA2=matchLoop.sendServerSnapshot(runtimeA,delegateA);count=count+req(not (snapshotA2 is error) and waitClients(groupState,ingressA,2,ingressB,1),"client A delta snapshot delivered alone")
  snapA=protocolA.dispatcher.snapshotState.snap;count=count+req(snapA.messageNum==2 and snapA.deltaNum==1 and snapA.playerState.commandTime==1100,"client A delta promotes independently")
  count=count+req(protocolB.dispatcher.snapshotState.snap.messageNum==1 and connectionB.channel.incomingSequence==1,"client B snapshot remains unchanged")

  // Advance B and let A observe B's new entity state in a later delta.
  matchLoop.setGroupTime(groupState,1120);packetB2=matchLoop.sendClientFrame(runtimeB,1120)
  count=count+req(packetB2.moveType==clientSend.CLC_MOVE and waitServer(groupState,serverRuntime,4),"client B delta move delivered")
  count=count+req(world.movesB==2 and messageClientB.messageAcknowledge==1 and messageClientB.reliableAcknowledge==1,"client B acknowledgements catch up")
  snapshotB2=matchLoop.sendServerSnapshot(runtimeB,delegateB);snapshotA3=matchLoop.sendServerSnapshot(runtimeA,delegateA)
  count=count+req(not (snapshotB2 is error) and not (snapshotA3 is error) and waitClients(groupState,ingressA,3,ingressB,2),"both later snapshots delivered fairly")
  snapB=protocolB.dispatcher.snapshotState.snap;visibleA=visibleEntity(protocolA);visibleB=visibleEntity(protocolB)
  count=count+req(snapB.messageNum==2 and snapB.deltaNum==1 and snapB.playerState.commandTime==1120,"client B delta promotes independently")
  count=count+req(visibleA.pos.trBase==[1120.0,-22.0,2.0] and visibleB.pos.trBase==[1100.0,11.0,1.0],"mutual entity visibility updates")
  count=count+req(connectionA.channel.outgoingSequence==3 and connectionB.channel.outgoingSequence==3 and connectionA.channel.incomingSequence==3 and connectionB.channel.incomingSequence==2,"final client sequences remain independent")
  count=count+req(serverWireClientA.channel.incomingSequence==2 and serverWireClientB.channel.incomingSequence==2 and serverWireClientA.channel.outgoingSequence==4 and serverWireClientB.channel.outgoingSequence==3,"final server sequences remain independent")

  // Long-running ring/timeout acceptance. Every client frame and snapshot uses
  // real Winsock datagrams. Selected packets are consumed without dispatch to
  // model loss; selected packets are sent a second time to exercise duplicate
  // rejection. packetdup=1 recovers every lost client command on the next frame.
  sendA.packetDup=1;sendB.packetDup=1;serverPackets=serverRuntime.packetCount;clientPacketsA=ingressA.packetCount;clientPacketsB=ingressB.packetCount
  lostClientPackets=0;duplicateClientPackets=0;lostSnapshots=0;duplicateSnapshots=0;deltaSnapshots=0
  for frameIndex=1 to 384
    frameTime=1200+frameIndex*25;matchLoop.setGroupTime(groupState,frameTime)
    if frameIndex%5==0 then
      sendA.reliableSequence=sendA.reliableSequence+1;sendA.reliableCommands[sendA.reliableSequence&63]="say alpha-"+str(frameIndex)
      sendB.reliableSequence=sendB.reliableSequence+1;sendB.reliableCommands[sendB.reliableSequence&63]="say bravo-"+str(frameIndex)
    end if
    if frameIndex%6==0 then
      if not reliable.add(snapshotClientA,"cp alpha-"+str(frameIndex)) then return error(7714,"network match multi: alpha reliable overflow") end if
      if not reliable.add(snapshotClientB,"cp bravo-"+str(frameIndex)) then return error(7714,"network match multi: bravo reliable overflow") end if
    end if

    sentA=matchLoop.sendClientFrame(runtimeA,frameTime)
    if sentA is error then return sentA end if
    if frameIndex%17==0 then
      lost=waitDatagram(serverSocket);if lost is error then return lost end if;lostClientPackets=lostClientPackets+1
    else
      serverPackets=serverPackets+1;if not waitServer(groupState,serverRuntime,serverPackets) then return error(7714,"network match multi: alpha command timeout") end if
    end if

    sentB=matchLoop.sendClientFrame(runtimeB,frameTime+1)
    if sentB is error then return sentB end if
    if frameIndex%23==0 then
      duplicate=waitDatagram(serverSocket);if duplicate is error then return duplicate end if
      matchLoop.receiveServer(runtimeA,duplicate.address,duplicate.data);matchLoop.synchronizeGroup(groupState);serverPackets=serverPackets+1
      udp.sendTo(socketB,transport.addressToEndpoint(serverAddress),duplicate.data);serverPackets=serverPackets+1
      if not waitServer(groupState,serverRuntime,serverPackets) then return error(7714,"network match multi: bravo duplicate timeout") end if;duplicateClientPackets=duplicateClientPackets+1
    else
      serverPackets=serverPackets+1;if not waitServer(groupState,serverRuntime,serverPackets) then return error(7714,"network match multi: bravo command timeout") end if
    end if

    snapshotA=matchLoop.sendServerSnapshot(runtimeA,delegateA);if snapshotA is error then return snapshotA end if
    if frameIndex%19==0 then
      lost=waitDatagram(socketA);if lost is error then return lost end if;lostSnapshots=lostSnapshots+1
    else
      clientPacketsA=clientPacketsA+1;if not waitClients(groupState,ingressA,clientPacketsA,ingressB,clientPacketsB) then return error(7714,"network match multi: alpha snapshot timeout") end if
      if not protocolA.dispatcher.snapshotState.snap.valid then return error(7714,"network match multi: invalid alpha delta") end if;deltaSnapshots=deltaSnapshots+1
    end if

    snapshotB=matchLoop.sendServerSnapshot(runtimeB,delegateB);if snapshotB is error then return snapshotB end if
    if frameIndex%29==0 then
      duplicate=waitDatagram(socketB);if duplicate is error then return duplicate end if
      matchLoop.receiveClient(runtimeB,duplicate.address,duplicate.data);matchLoop.synchronizeGroup(groupState);clientPacketsB=clientPacketsB+1
      udp.sendTo(serverSocket,transport.addressToEndpoint(addressB),duplicate.data);clientPacketsB=clientPacketsB+1
      if not waitClients(groupState,ingressA,clientPacketsA,ingressB,clientPacketsB) then return error(7714,"network match multi: bravo snapshot duplicate timeout") end if;duplicateSnapshots=duplicateSnapshots+1
    else
      clientPacketsB=clientPacketsB+1;if not waitClients(groupState,ingressA,clientPacketsA,ingressB,clientPacketsB) then return error(7714,"network match multi: bravo snapshot timeout") end if
    end if
    if not protocolB.dispatcher.snapshotState.snap.valid then return error(7714,"network match multi: invalid bravo delta") end if;deltaSnapshots=deltaSnapshots+1
  end for
  count=count+req(lostClientPackets==22 and duplicateClientPackets==16 and lostSnapshots==20 and duplicateSnapshots==13,"deterministic loss and duplicate schedule completed")
  count=count+req(world.movesA==386 and world.movesB==386,"all 768 long-run usercmds executed exactly once")
  count=count+req(messageClientA.lastClientCommand==77 and messageClientB.lastClientCommand==77 and world.commandsA==77 and world.commandsB==77,"reliable client rings wrapped and acknowledged")
  count=count+req(protocolA.dispatcher.serverCommandSequence==65 and protocolB.dispatcher.serverCommandSequence==65,"reliable server rings wrapped independently")
  count=count+req(protocolA.dispatcher.snapshotState.snap.messageNum==387 and protocolB.dispatcher.snapshotState.snap.messageNum==386,"snapshot packet rings wrapped repeatedly")
  count=count+req(protocolA.dispatcher.snapshotState.entityState.parseEntitiesNum>350 and protocolB.dispatcher.snapshotState.entityState.parseEntitiesNum>350,"parse-entity rings advanced through long run")
  count=count+req(deltaSnapshots==748 and protocolA.dispatcher.snapshotState.snap.deltaNum>0 and protocolB.dispatcher.snapshotState.snap.deltaNum>0,"hundreds of delta snapshots remained valid")
  count=count+req(serverWireClientA.channel.incomingSequence==386 and serverWireClientB.channel.incomingSequence==386,"server netchan sequences survived loss and duplicates")
  count=count+req(connectionA.channel.incomingSequence==387 and connectionB.channel.incomingSequence==386,"client netchan sequences survived snapshot loss and duplicates")
  count=count+req(packetClientA.lastPacketTime==10800 and packetClientB.lastPacketTime==10800 and connectionA.lastPacketTime==10800 and connectionB.lastPacketTime==10800,"client and server timeout clocks refreshed")
  count=count+req(clientFrameA.realtime==10800 and clientFrameB.realtime==10800 and clientFrameA.lastPacketTime==10800 and timeoutClientA.lastPacketTime==10800 and timeoutClientB.lastPacketTime==10800,"CL_Frame and SV_Frame timeout projections synchronized")
  count=count+req(sendA.reliableSequence-sendA.reliableAcknowledge<=1 and sendB.reliableSequence-sendB.reliableAcknowledge<=1,"client reliable acknowledgement window bounded")
  count=count+req(snapshotClientA.reliableSequence-snapshotClientA.reliableAcknowledge<=1 and snapshotClientB.reliableSequence-snapshotClientB.reliableAcknowledge<=1,"server reliable acknowledgement window bounded")
  clientFrameA.state=clientConnectionless.CA_DISCONNECTED;timeoutClientA.state=serverTimeouts.CS_FREE;matchLoop.commitGroupFrameStates(groupState)
  count=count+req(connectionA.connectionState==clientConnectionless.CA_DISCONNECTED and sendA.connectionState==clientConnectionless.CA_DISCONNECTED and packetClientA.state==serverTimeouts.CS_FREE and messageClientA.state==serverTimeouts.CS_FREE and snapshotClientA.state==serverTimeouts.CS_FREE,"frame timeout transitions committed to network state")
  idle=matchLoop.pumpGroupOnce(groupState);count=count+req(not idle.processed,"group reports idle after both queues drain")

  udp.close(socketA);udp.close(socketB);udp.close(serverSocket);udp.cleanup()
  print("PASS: "+str(count)+" live two-client match contracts");return 0
end function
