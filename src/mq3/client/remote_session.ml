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
import mq3.client.server_command_stream as serverCommands
import mq3.qcommon.netchan as net
import mq3.qcommon.net_transport as transport
import mq3.qcommon.network_pump as pump
import mq3.shared.info as info

struct Session
  socket userinfo connection wire protocol ingress send sendServices pump
  gamestateGeneration preparedGeneration serverPrint lastRealtime
  commands commandServices serverCommandFn restartCount
end struct
function sendOob(host,state,address,text) return transport.outOfBandPrint(host.context.socket,address,text) end function
function sendOobData(host,state,address,data) return transport.outOfBandData(host.context.socket,address,data) end function
function userinfo(host,state) return host.context.userinfo end function
function printed(host,state,text) host.context.serverPrint=text;return void end function
// A terminal session cannot be promoted by a previously valid snapshot.
function stop(session,text)
  session.connection.connectionState=connectionless.CA_DISCONNECTED
  session.send.connectionState=connectionless.CA_DISCONNECTED
  session.preparedGeneration=0;session.serverPrint=text;return void
end function
function disconnected(host,state,show,text) return stop(host.context,text) end function
function clearUsercmds(session)
  for index=0 to sendCmd.CMD_BACKUP-1 session.send.commands[index]=sendCmd.zeroCommand() end for
  return void
end function
function restarted(session)
  clearUsercmds(session);session.restartCount=session.restartCount+1;return void
end function
function configstringChanged(session,index,value)
  return gamestate.updateConfigString(session.protocol.gamestateState,index,value)
end function
function systemInfoChanged(session)
  system=gamestate.configString(session.protocol.gamestateState,1)
  if session.preparedGeneration>0 and info.value(system,"sv_pure")!="0" then
    stop(session,"Server now requires pure asset verification")
    return error(7982,"remote session: pure server requires asset verification")
  end if
  session.send.serverId=toNumber(info.value(system,"sv_serverid"));return void
end function
function gameStateReady(state)
  session=state.context;session.gamestateGeneration=session.gamestateGeneration+1
  session.preparedGeneration=0;session.connection.connectionState=connectionless.CA_LOADING
  session.send.serverId=toNumber(info.value(gamestate.configString(state,1),"sv_serverid"))
  session.send.checksumFeed=state.checksumFeed
  clearUsercmds(session);session.send.cmdNumber=0;session.send.oldFrameTime=0
  for index=0 to sendCmd.PACKET_BACKUP-1 session.send.outPackets[index]=sendCmd.OutPacket(0,0,0) end for
  table=array(gamestate.MAX_CONFIGSTRINGS,"")
  for index=0 to gamestate.MAX_CONFIGSTRINGS-1 table[index]=gamestate.configString(state,index) end for
  session.commands=serverCommands.create(void,table)
  session.commands.commandSequence=state.serverCommandSequence
  session.commands.lastExecuted=state.serverCommandSequence
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
  session=Session(socket,initialUserinfo,connection,wire,parser,receiver,sending,sender,void,0,0,"",0,void,serverCommands.services(),void,0)
  session.commandServices.context=session;session.commandServices.configstringFn=configstringChanged
  session.commandServices.systemInfoFn=systemInfoChanged;session.commandServices.clearUsercmdsFn=restarted
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
  if connection.connectionState>=connectionless.CA_PRIMED and connection.connectionState<=connectionless.CA_ACTIVE and snapshot.valid and session.preparedGeneration==session.gamestateGeneration and session.preparedGeneration>0 then
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
  if session.connection.connectionState!=connectionless.CA_LOADING then return error(7982,"remote session: gamestate is not awaiting acceptance") end if
  system=gamestate.configString(session.protocol.gamestateState,1)
  if info.value(system,"sv_pure")!="0" then return error(7982,"remote session: pure server requires asset verification, not supported by this entry point") end if
  session.preparedGeneration=session.gamestateGeneration;session.connection.connectionState=connectionless.CA_PRIMED
  session.send.demoWaiting=false;synchronize(session);return void
end function
// Consume at an application-selected boundary (normally the adopted snapshot's
// serverCommandNum). Never run newer commands merely because packets arrived.
// The borrowed reliable ring avoids 64 string copies on each synchronization.
// serverCommandFn(session, sequence, commandState) receives transient tokenized
// arguments; applications retaining them must copy the values during the call.
function runServerCommands(session,throughSequence)
  if session==void or session.commands==void then return error(7982,"remote session: no command stream") end if
  if session.connection.connectionState<connectionless.CA_PRIMED then return error(7982,"remote session: command stream is not active") end if
  state=session.commands;dispatcher=session.protocol.dispatcher
  if throughSequence<0 or throughSequence>dispatcher.serverCommandSequence then return error(7982,"remote session: command not received") end if
  if throughSequence<=state.lastExecuted then return 0 end if
  state.commandSequence=dispatcher.serverCommandSequence;state.commands=dispatcher.serverCommands
  count=0
  while state.lastExecuted<throughSequence
    sequence=state.lastExecuted+1
    delivered=try(serverCommands.get(state,session.commandServices,sequence))
    if delivered is error then stop(session,str(delivered));return delivered end if
    if delivered and session.serverCommandFn!=void then
      result=try(session.serverCommandFn(session,sequence,state.commandState))
      if result is error then stop(session,str(result));return result end if
    end if
    count=count+1
  end while
  synchronize(session);return count
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
