// SPDX-License-Identifier: GPL-2.0-or-later
// Protocol-68 remote client: no synthetic in-process server or invented gamestate.
// The caller owns the socket, assets, game/render lifecycle and clock.
package mq3.client.remote_session
import mq3.client.connectionless as connectionless
import mq3.client.netchan as clientNet
import mq3.client.network_ingress as ingress
import mq3.client.protocol_runtime as protocol
import mq3.client.send_cmd as sendCmd
import mq3.client.gamestate as gamestate
import mq3.client.snapshot_command as snapshots
import mq3.qcommon.netchan as net
import mq3.qcommon.net_transport as transport
import mq3.qcommon.network_pump as pump
import mq3.shared.info as info

struct Session
  socket userinfo connection wire protocol ingress send sendServices pump
  gamestateGeneration preparedGeneration serverPrint lastRealtime
end struct
function sendOob(host,state,address,text) return transport.outOfBandPrint(host.context.socket,address,text) end function
function sendOobData(host,state,address,data) return transport.outOfBandData(host.context.socket,address,data) end function
function userinfo(host,state) return host.context.userinfo end function
function printed(host,state,text) host.context.serverPrint=text;return void end function
function disconnected(host,state,show,text) host.context.connection.connectionState=connectionless.CA_DISCONNECTED;host.context.serverPrint=text;return void end function
function gameStateReady(state)
  session=state.context;session.gamestateGeneration=session.gamestateGeneration+1
  session.preparedGeneration=0;session.connection.connectionState=connectionless.CA_LOADING
  session.send.serverId=toNumber(info.value(gamestate.configString(state,1),"sv_serverid"))
  session.send.checksumFeed=state.checksumFeed
  return void
end function
function create(socket,address,qport,initialUserinfo)
  if socket==void or address==void or qport<0 or qport>65535 then return error(7982,"remote session: invalid endpoint or qport") end if
  connection=connectionless.create(address);connection.qport=qport
  connection.connectionState=connectionless.CA_CONNECTING;connection.connectTime=-connectionless.RETRANSMIT_TIMEOUT
  wire=clientNet.create(transport.attach(net.init(qport),socket),clientNet.createConnection())
  parser=protocol.create(void);sending=sendCmd.create();sending.remoteAddressType=address.type
  temporaryChannel=net.setup(net.NS_CLIENT,address,qport)
  sender=sendCmd.liveServices(wire,temporaryChannel)
  oob=connectionless.services();oob.outOfBandFn=sendOob;oob.outOfBandDataFn=sendOobData
  oob.userinfoFn=userinfo;oob.printFn=printed;oob.disconnectFn=disconnected
  receiver=ingress.create(connection,wire,parser,ingress.services(oob))
  session=Session(socket,initialUserinfo,connection,wire,parser,receiver,sending,sender,void,0,0,"",0)
  oob.context=session;parser.gamestateState.context=session;parser.gamestateState.downloadsFn=gameStateReady
  session.pump=ingress.createPump(receiver,socket,void,net.MAX_MSGLEN)
  return session
end function
function synchronize(session)
  connection=session.connection;sending=session.send;dispatcher=session.protocol.dispatcher
  sending.connectionState=connection.connectionState;sending.realtime=session.lastRealtime
  if connection.channel!=void then
    session.wire.connection.challenge=connection.challenge
    session.sendServices.context.channel=connection.channel;sending.outgoingSequence=connection.channel.outgoingSequence
  end if
  sending.serverMessageSequence=session.ingress.packetState.serverMessageSequence
  sending.serverCommandSequence=dispatcher.serverCommandSequence;sending.serverCommands=dispatcher.serverCommands
  sending.reliableAcknowledge=dispatcher.reliableAcknowledge
  session.wire.connection.reliableCommands=sending.reliableCommands
  session.wire.connection.serverCommands=dispatcher.serverCommands
  dispatcher.reliableSequence=sending.reliableSequence
  snapshot=dispatcher.snapshotState.snap;sending.snapValid=snapshot.valid;sending.snapMessageNum=snapshot.messageNum
  if snapshot.valid and session.preparedGeneration==session.gamestateGeneration and session.preparedGeneration>0 then
    connection.connectionState=connectionless.CA_ACTIVE;sending.connectionState=connectionless.CA_ACTIVE
  end if
  return void
end function
function poll(session,realtime,maxPackets)
  if session==void or realtime<0 or maxPackets<0 then return error(7982,"remote session: invalid poll") end if
  session.lastRealtime=realtime;session.connection.realtime=realtime
  ingress.setRealtime(session.ingress,realtime)
  connectionless.checkForResend(session.connection,session.ingress.services.connectionlessHost)
  // Synchronize after every datagram: a connectResponse can precede the first
  // encrypted gamestate in the same receive budget.
  count=0
  while count<maxPackets
    step=pump.pumpOnce(session.pump);if step is error then return step end if
    if not step.processed then break end if
    count=count+1;synchronize(session)
  end while
  synchronize(session);return count
end function
// An application must load/validate its assets before accepting a gamestate.
// Pure-server checksums/download negotiation are deliberately not bypassed.
function acceptUnpureGamestate(session)
  if session==void or session.gamestateGeneration<1 then return error(7982,"remote session: no gamestate") end if
  system=gamestate.configString(session.protocol.gamestateState,1)
  if info.value(system,"sv_pure")!="0" then return error(7982,"remote session: pure server requires asset verification, not supported by this entry point") end if
  session.preparedGeneration=session.gamestateGeneration;session.connection.connectionState=connectionless.CA_PRIMED
  session.send.demoWaiting=false;synchronize(session);return void
end function
function queueCommand(session,text)
  if session==void or text==void or len(bytes(text))>=1024 then return error(7982,"remote session: invalid reliable command") end if
  sending=session.send
  if sending.reliableSequence-sending.reliableAcknowledge>=sendCmd.MAX_RELIABLE_COMMANDS then return error(7982,"remote session: reliable command overflow") end if
  sending.reliableSequence=sending.reliableSequence+1
  sending.reliableCommands[sending.reliableSequence&(sendCmd.MAX_RELIABLE_COMMANDS-1)]=text
  synchronize(session);return sending.reliableSequence
end function
function sendFrame(session,serverTime)
  if session==void then return error(7982,"remote session: missing session") end if
  synchronize(session);before=session.send.outgoingSequence
  result=sendCmd.send(session.send,serverTime,session.sendServices);if result is error then return result end if
  state=session.protocol.dispatcher.snapshotState;state.outgoingSequence=session.send.outgoingSequence
  if session.send.outgoingSequence!=before then
    source=session.send.outPackets[before&sendCmd.PACKET_MASK]
    state.outPackets[before&sendCmd.PACKET_MASK]=snapshots.OutPacket(source.serverTime,source.realtime)
  end if
  return result
end function
