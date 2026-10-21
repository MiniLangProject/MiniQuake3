// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive client-command -> server ingress -> snapshot -> client ingress loop.
package mq3.client.network_match_loop

import mq3.client.network_ingress as clientIngress
import mq3.client.send_cmd as clientSend
import mq3.client.snapshot_command as clientSnapshot
import mq3.qcommon.network_pump as packetPump
import mq3.server.network_ingress as serverIngress
import mq3.server.netchan as serverNetchan
import mq3.server.snapshot_send as snapshotSend

struct Runtime
  clientSendState clientSendServices clientConnection clientWire clientProtocol clientIngressRuntime
  serverIngressRuntime serverPacketClient serverMessageClient serverSnapshotClient serverSnapshotState
  serverWireRuntime serverWireClient serverTimeFn serverTimeContext clientFrameState serverTimeoutClient pump
end struct
struct SnapshotBridge runtimeState delegate end struct
struct Group runtimes nextRuntime end struct
struct GroupStep processed runtimeIndex step end struct

function receiveClient(runtimeState,address,data) return clientIngress.clientPacket(runtimeState.clientIngressRuntime,address,data) end function
function receiveServer(runtimeState,address,data) return serverIngress.serverPacket(runtimeState.serverIngressRuntime,address,data) end function

function create(clientSocket,serverSocket,capacity,sendState,sendServices,connection,clientWire,protocolState,clientIngressState,serverIngressState,packetClient,messageClient,snapshotClient,snapshotState,serverWireRuntime,serverWireClient)
  if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or protocolState==void or clientIngressState==void or serverIngressState==void or packetClient==void or messageClient==void or snapshotClient==void or snapshotState==void or serverWireRuntime==void or serverWireClient==void then return error(7712,"network match loop: missing component") end if
  runtimeState=Runtime(sendState,sendServices,connection,clientWire,protocolState,clientIngressState,serverIngressState,packetClient,messageClient,snapshotClient,snapshotState,serverWireRuntime,serverWireClient,void,void,void,void,void)
  runtimeState.pump=packetPump.create(clientSocket,serverSocket,capacity,runtimeState,receiveClient,receiveServer);synchronize(runtimeState);return runtimeState
end function

function synchronizeClient(runtimeState)
  send=runtimeState.clientSendState;connection=runtimeState.clientConnection;dispatcher=runtimeState.clientProtocol.dispatcher;snap=dispatcher.snapshotState
  send.connectionState=connection.connectionState;send.realtime=runtimeState.clientIngressRuntime.packetState.realtime
  send.serverMessageSequence=runtimeState.clientIngressRuntime.packetState.serverMessageSequence
  send.serverCommandSequence=dispatcher.serverCommandSequence;send.serverCommands=dispatcher.serverCommands
  send.reliableAcknowledge=dispatcher.reliableAcknowledge
  send.snapValid=snap.snap.valid;send.snapMessageNum=snap.snap.messageNum;send.demoWaiting=snap.demoWaiting
  if connection.channel!=void then send.outgoingSequence=connection.channel.outgoingSequence end if
  runtimeState.clientWire.connection.reliableCommands=send.reliableCommands;runtimeState.clientWire.connection.serverCommands=dispatcher.serverCommands
  dispatcher.reliableSequence=send.reliableSequence;snap.outgoingSequence=send.outgoingSequence;snap.realtime=send.realtime
  for index=0 to clientSend.PACKET_BACKUP-1
    source=send.outPackets[index];snap.outPackets[index]=clientSnapshot.OutPacket(source.serverTime,source.realtime)
  end for
  return void
end function

function synchronizeServer(runtimeState)
  messageClient=runtimeState.serverMessageClient;snapshotClient=runtimeState.serverSnapshotClient
  messageClient.reliableSequence=snapshotClient.reliableSequence;messageClient.reliableCommands=snapshotClient.reliableCommands
  snapshotClient.state=messageClient.state;snapshotClient.reliableAcknowledge=messageClient.reliableAcknowledge
  snapshotClient.lastClientCommand=messageClient.lastClientCommand;snapshotClient.deltaMessage=messageClient.deltaMessage
  runtimeState.serverWireClient.reliableCommands=snapshotClient.reliableCommands
  runtimeState.serverWireClient.lastClientCommandString=messageClient.lastClientCommandString
  snapshotClient.outgoingSequence=runtimeState.serverWireClient.channel.outgoingSequence
  return void
end function

// CL_Frame and SV_Frame keep timeout state in their outer client records while
// packet ingress owns the authoritative last-packet clocks. These explicit
// boundaries prevent a long-running network loop from timing out an active
// client merely because the frame model was a detached projection.
function prepareFrameStates(runtimeState)
  if runtimeState.clientFrameState!=void then
    runtimeState.clientFrameState.state=runtimeState.clientConnection.connectionState
    runtimeState.clientFrameState.realtime=runtimeState.clientIngressRuntime.packetState.realtime
    runtimeState.clientFrameState.lastPacketTime=runtimeState.clientConnection.lastPacketTime
  end if
  if runtimeState.serverTimeoutClient!=void then
    runtimeState.serverTimeoutClient.state=runtimeState.serverPacketClient.state
    runtimeState.serverTimeoutClient.lastPacketTime=runtimeState.serverPacketClient.lastPacketTime
  end if
  return void
end function

function commitFrameStates(runtimeState)
  if runtimeState==void then return error(7712,"network match loop: missing runtime") end if
  if runtimeState.clientFrameState!=void then
    runtimeState.clientConnection.connectionState=runtimeState.clientFrameState.state;runtimeState.clientSendState.connectionState=runtimeState.clientFrameState.state
  end if
  if runtimeState.serverTimeoutClient!=void then
    state=runtimeState.serverTimeoutClient.state;runtimeState.serverPacketClient.state=state;runtimeState.serverMessageClient.state=state;runtimeState.serverSnapshotClient.state=state
  end if
  return void
end function

function attachFrameStates(runtimeState,clientFrameState,serverTimeoutClient)
  if runtimeState==void or clientFrameState==void or serverTimeoutClient==void then return error(7712,"network match loop: missing frame state") end if
  runtimeState.clientFrameState=clientFrameState;runtimeState.serverTimeoutClient=serverTimeoutClient;prepareFrameStates(runtimeState);return runtimeState
end function

function synchronize(runtimeState) synchronizeClient(runtimeState);synchronizeServer(runtimeState);prepareFrameStates(runtimeState);return void end function

function attachServerClock(runtimeState,callback,context)
  if runtimeState==void or callback==void then return error(7712,"network match loop: missing server clock") end if
  runtimeState.serverTimeFn=callback;runtimeState.serverTimeContext=context;return runtimeState
end function

function setTime(runtimeState,time)
  if runtimeState==void then return error(7712,"network match loop: missing runtime") end if
  clientIngress.setRealtime(runtimeState.clientIngressRuntime,time);serverIngress.setTime(runtimeState.serverIngressRuntime,time);runtimeState.serverSnapshotState.time=time;runtimeState.clientSendState.realtime=time
  if runtimeState.serverTimeFn!=void then runtimeState.serverTimeFn(runtimeState.serverTimeContext,time) end if
  return void
end function

function sendClientFrame(runtimeState,frameTime)
  if runtimeState==void then return error(7712,"network match loop: missing runtime") end if
  synchronizeClient(runtimeState);result=clientSend.send(runtimeState.clientSendState,frameTime,runtimeState.clientSendServices);synchronizeClient(runtimeState);return result
end function

function pump(runtimeState,budget)
  if runtimeState==void or budget<0 then return error(7712,"network match loop: invalid pump") end if
  result=packetPump.drain(runtimeState.pump,budget);synchronize(runtimeState);return result
end function

// Process exactly one queued datagram and expose its side/payload metadata.
// Frame hosts use this form when they need a strict packet budget while still
// keeping the client/server mirrors coherent after every accepted or rejected
// netchan packet.
function pumpOnce(runtimeState)
  if runtimeState==void then return error(7712,"network match loop: missing runtime") end if
  result=packetPump.pumpOnce(runtimeState.pump);synchronize(runtimeState);return result
end function

// A local listen server owns one UDP socket while every client owns a separate
// socket and netchan. Group pumping round-robins the client runtimes, but any
// member may consume the shared server socket: server ingress selects the real
// client by base address/qport, then every mirror is synchronized.
function createGroup(runtimes)
  if runtimes==void or len(runtimes)<2 then return error(7712,"network match group: need at least two clients") end if
  first=runtimes[0];if first==void or first.pump==void then return error(7712,"network match group: invalid client") end if
  clientSockets=[];serverClients=[]
  for each current in runtimes
    if current==void or current.pump==void or current.serverIngressRuntime!=first.serverIngressRuntime or current.pump.serverSocket!=first.pump.serverSocket or current.serverSnapshotState!=first.serverSnapshotState or current.serverWireRuntime!=first.serverWireRuntime then return error(7712,"network match group: clients do not share server") end if
    for each socket in clientSockets if current.pump.clientSocket==socket then return error(7712,"network match group: duplicate client socket") end if end for
    for each prior in serverClients
      left=current.serverWireClient.channel;right=prior.channel
      if left.remoteAddress.type==right.remoteAddress.type and left.remoteAddress.ip==right.remoteAddress.ip and left.qport==right.qport then return error(7712,"network match group: ambiguous client qport") end if
    end for
    clientSockets=clientSockets+[current.pump.clientSocket];serverClients=serverClients+[current.serverWireClient]
  end for
  return Group(runtimes,0)
end function

function synchronizeGroup(groupState)
  if groupState==void then return error(7712,"network match group: missing runtime") end if
  for each current in groupState.runtimes synchronize(current) end for;return void
end function

function commitGroupFrameStates(groupState)
  if groupState==void then return error(7712,"network match group: missing runtime") end if
  for each current in groupState.runtimes result=commitFrameStates(current);if result is error then return result end if end for;return void
end function

function pumpGroupOnce(groupState)
  if groupState==void or groupState.runtimes==void or len(groupState.runtimes)<1 then return error(7712,"network match group: missing runtime") end if
  total=len(groupState.runtimes);start=groupState.nextRuntime
  for offset=0 to total-1
    index=(start+offset)%total;current=groupState.runtimes[index];step=packetPump.pumpOnce(current.pump)
    if step is error then return step end if
    if step.processed then groupState.nextRuntime=(index+1)%total;synchronizeGroup(groupState);return GroupStep(true,index,step) end if
  end for
  synchronizeGroup(groupState);return GroupStep(false,start,void)
end function

function pumpGroup(groupState,budget)
  if groupState==void or budget<0 then return error(7712,"network match group: invalid pump") end if
  count=0
  while count<budget step=pumpGroupOnce(groupState);if step is error then return step end if;if not step.processed then return count end if;count=count+1 end while
  return count
end function

function setGroupTime(groupState,time)
  if groupState==void or groupState.runtimes==void or len(groupState.runtimes)<1 then return error(7712,"network match group: missing runtime") end if
  first=groupState.runtimes[0];setTime(first,time)
  if len(groupState.runtimes)>1 then
    for index=1 to len(groupState.runtimes)-1
      current=groupState.runtimes[index];clientIngress.setRealtime(current.clientIngressRuntime,time);current.clientSendState.realtime=time
    end for
  end if
  synchronizeGroup(groupState);return void
end function

function bridgeBuild(host,clientState,serverState)
  delegate=host.context.delegate;if delegate!=void and delegate.buildSnapshotFn!=void then return delegate.buildSnapshotFn(delegate,clientState,serverState) end if;return void
end function
function bridgeDownload(host,clientState,msg)
  delegate=host.context.delegate;if delegate!=void and delegate.writeDownloadFn!=void then return delegate.writeDownloadFn(delegate,clientState,msg) end if;return void
end function
function bridgeLocal(host,clientState)
  delegate=host.context.delegate;if delegate!=void and delegate.localAddressFn!=void then return delegate.localAddressFn(delegate,clientState) end if;return false
end function
function bridgeLan(host,clientState)
  delegate=host.context.delegate;if delegate!=void and delegate.lanAddressFn!=void then return delegate.lanAddressFn(delegate,clientState) end if;return false
end function
function bridgeTransmit(host,clientState,payload)
  runtimeState=host.context.runtimeState;result=serverNetchan.transmitPayload(runtimeState.serverWireRuntime,runtimeState.serverWireClient,payload)
  if result is error then return result end if;clientState.outgoingSequence=runtimeState.serverWireClient.channel.outgoingSequence;return result
end function
function snapshotServices(runtimeState,delegate)
  return snapshotSend.services(bridgeBuild,bridgeDownload,bridgeTransmit,bridgeLocal,bridgeLan,SnapshotBridge(runtimeState,delegate))
end function

function sendServerSnapshot(runtimeState,delegate)
  if runtimeState==void then return error(7712,"network match loop: missing runtime") end if
  synchronizeServer(runtimeState);result=snapshotSend.sendClientSnapshot(runtimeState.serverSnapshotClient,runtimeState.serverSnapshotState,snapshotServices(runtimeState,delegate));synchronizeServer(runtimeState);return result
end function
