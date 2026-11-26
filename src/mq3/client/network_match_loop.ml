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

/// Stores network match loop runtime wiring and state, including `clientSendState`, `clientSendServices`, `clientConnection`, `clientWire`, `clientProtocol`, `clientIngressRuntime` and additional values.
struct Runtime
  /// When constructing this record, `create` supplies `sendState` for this member.
  clientSendState
  /// When constructing this record, `create` supplies `sendServices` for this member.
  clientSendServices
  /// When constructing this record, `create` supplies `connection` for this member.
  clientConnection
  /// When constructing this record, `create` supplies `clientWire` for this member.
  clientWire
  /// When constructing this record, `create` supplies `protocolState` for this member.
  clientProtocol
  /// When constructing this record, `create` supplies `clientIngressState` for this member.
  clientIngressRuntime
  /// When constructing this record, `create` supplies `serverIngressState` for this member.
  serverIngressRuntime
  /// When constructing this record, `create` supplies `packetClient` for this member.
  serverPacketClient
  /// When constructing this record, `create` supplies `messageClient` for this member.
  serverMessageClient
  /// When constructing this record, `create` supplies `snapshotClient` for this member.
  serverSnapshotClient
  /// When constructing this record, `create` supplies `snapshotState` for this member.
  serverSnapshotState
  /// When constructing this record, `create` supplies `serverWireRuntime` for this member.
  serverWireRuntime
  /// When constructing this record, `create` supplies `serverWireClient` for this member.
  serverWireClient
  /// Host callback for the server time operation; an unset callback leaves that host operation
  /// unavailable.
  serverTimeFn
  /// Caller-supplied value passed unchanged to the callback that publishes updated server time.
  serverTimeContext
  /// Optional client-frame state synchronized with the current connection state before frame
  /// processing.
  clientFrameState
  /// Optional server timeout record synchronized with the server-side packet client's connection state.
  serverTimeoutClient
  /// Packet-pump instance bound to the client and server sockets and drained by the combined network
  /// loop.
  pump
end struct
/// Stores network match loop snapshot bridge record, including `runtimeState`, `delegate`.
struct SnapshotBridge
  /// When constructing this record, `snapshotServices` supplies `runtimeState` for this member.
  runtimeState
  /// When constructing this record, `snapshotServices` supplies `delegate` for this member.
  delegate
end struct
/// Stores network match loop group record, including `runtimes`, `nextRuntime`.
struct Group
  /// When constructing this record, `createGroup` supplies `runtimes` for this member.
  runtimes
  /// When constructing this record, `createGroup` supplies `0` for this member.
  nextRuntime
end struct
/// Stores network match loop group step record, including `processed`, `runtimeIndex`, `step`.
struct GroupStep
  /// When constructing this record, `pumpGroupOnce` supplies `true` for this member.
  processed
  /// When constructing this record, `pumpGroupOnce` supplies `index` for this member.
  runtimeIndex
  /// When constructing this record, `pumpGroupOnce` supplies `step` for this member.
  step
end struct

/// Adapts `mq3.client.network_ingress.clientPacket` to network match loop `receiveClient`, returning its result for `runtimeState.clientIngressRuntime, address, data`.
/// @param runtimeState Record read through `runtimeState.clientIngressRuntime`.
/// @param address Argument 2 of `mq3.client.network_ingress.clientPacket`.
/// @param data Argument 3 of `mq3.client.network_ingress.clientPacket`.
function receiveClient(runtimeState,address,data) return clientIngress.clientPacket(runtimeState.clientIngressRuntime,address,data) end function
/// Adapts `mq3.server.network_ingress.serverPacket` to network match loop `receiveServer`, returning its result for `runtimeState.serverIngressRuntime, address, data`.
/// @param runtimeState Record read through `runtimeState.serverIngressRuntime`.
/// @param address Argument 2 of `mq3.server.network_ingress.serverPacket`.
/// @param data Argument 3 of `mq3.server.network_ingress.serverPacket`.
function receiveServer(runtimeState,address,data) return serverIngress.serverPacket(runtimeState.serverIngressRuntime,address,data) end function

/// Calls `mq3.client.network_match_loop.Runtime`, `mq3.qcommon.network_pump.create`, `mq3.client.network_match_loop.synchronize` from network match loop `create`. The final path returns `runtimeState`.
/// @param clientSocket Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param serverSocket Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param capacity Maximum number of entries or bytes accepted by this container.
/// @param sendState Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param sendServices Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param connection Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param clientWire Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param protocolState Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param clientIngressState Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param serverIngressState Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param packetClient Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param messageClient Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param snapshotClient Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param snapshotState Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param serverWireRuntime Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
/// @param serverWireClient Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`.
function create(clientSocket,serverSocket,capacity,sendState,sendServices,connection,clientWire,protocolState,clientIngressState,serverIngressState,packetClient,messageClient,snapshotClient,snapshotState,serverWireRuntime,serverWireClient)
  if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or protocolState==void or clientIngressState==void or serverIngressState==void or packetClient==void or messageClient==void or snapshotClient==void or snapshotState==void or serverWireRuntime==void or serverWireClient==void then return error(7712,"network match loop: missing component") end if
  runtimeState=Runtime(sendState,sendServices,connection,clientWire,protocolState,clientIngressState,serverIngressState,packetClient,messageClient,snapshotClient,snapshotState,serverWireRuntime,serverWireClient,void,void,void,void,void)
  runtimeState.pump=packetPump.create(clientSocket,serverSocket,capacity,runtimeState,receiveClient,receiveServer);synchronize(runtimeState);return runtimeState
end function

/// Updates `runtimeState.clientWire.connection.reliableCommands`, `runtimeState.clientWire.connection.serverCommands` during network match loop `synchronizeClient`.
/// @param runtimeState Mutable network match loop record/storage; this routine assigns `runtimeState.clientWire.connection.reliableCommands`, `runtimeState.clientWire.connection.serverCommands`.
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

/// Updates `runtimeState.serverWireClient.reliableCommands`, `runtimeState.serverWireClient.lastClientCommandString` during network match loop `synchronizeServer`.
/// @param runtimeState Mutable network match loop record/storage; this routine assigns `runtimeState.serverWireClient.reliableCommands`, `runtimeState.serverWireClient.lastClientCommandString`.
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
/// @param runtimeState Mutable network match loop record/storage; this routine assigns `runtimeState.clientFrameState.state`, `runtimeState.clientFrameState.realtime`, `runtimeState.clientFrameState.lastPacketTime`, `runtimeState.serverTimeoutClient.state` and additional values.
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

/// Updates `runtimeState.clientConnection.connectionState`, `runtimeState.clientSendState.connectionState`, `runtimeState.serverPacketClient.state`, `runtimeState.serverMessageClient.state` and additional values during network match loop `commitFrameStates`.
/// @param runtimeState Mutable network match loop record/storage; this routine assigns `runtimeState.clientConnection.connectionState`, `runtimeState.clientSendState.connectionState`, `runtimeState.serverPacketClient.state`, `runtimeState.serverMessageClient.state` and additional values.
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

/// Updates `runtimeState.clientFrameState`, `runtimeState.serverTimeoutClient` during network match loop `attachFrameStates`.
/// @param runtimeState Mutable network match loop record/storage; this routine assigns `runtimeState.clientFrameState`, `runtimeState.serverTimeoutClient`.
/// @param clientFrameState Value assigned to `runtimeState.clientFrameState`.
/// @param serverTimeoutClient Value assigned to `runtimeState.serverTimeoutClient`.
function attachFrameStates(runtimeState,clientFrameState,serverTimeoutClient)
  if runtimeState==void or clientFrameState==void or serverTimeoutClient==void then return error(7712,"network match loop: missing frame state") end if
  runtimeState.clientFrameState=clientFrameState;runtimeState.serverTimeoutClient=serverTimeoutClient;prepareFrameStates(runtimeState);return runtimeState
end function

/// Calls `mq3.client.network_match_loop.synchronizeClient`, `mq3.client.network_match_loop.synchronizeServer`, `mq3.client.network_match_loop.prepareFrameStates` from network match loop `synchronize`.
/// @param runtimeState Value used by `synchronizeClient(runtimeState)`.
function synchronize(runtimeState) synchronizeClient(runtimeState);synchronizeServer(runtimeState);prepareFrameStates(runtimeState);return void end function

/// Updates `runtimeState.serverTimeFn`, `runtimeState.serverTimeContext` during network match loop `attachServerClock`.
/// @param runtimeState Mutable network match loop record/storage; this routine assigns `runtimeState.serverTimeFn`, `runtimeState.serverTimeContext`.
/// @param callback Value assigned to `runtimeState.serverTimeFn`.
/// @param context Value assigned to `runtimeState.serverTimeContext`.
function attachServerClock(runtimeState,callback,context)
  if runtimeState==void or callback==void then return error(7712,"network match loop: missing server clock") end if
  runtimeState.serverTimeFn=callback;runtimeState.serverTimeContext=context;return runtimeState
end function

/// Updates `runtimeState.serverSnapshotState.time`, `runtimeState.clientSendState.realtime` during network match loop `setTime`.
/// @param runtimeState Mutable network match loop record/storage; this routine assigns `runtimeState.serverSnapshotState.time`, `runtimeState.clientSendState.realtime`.
/// @param time Value assigned to `runtimeState.serverSnapshotState.time`, `runtimeState.clientSendState.realtime`.
function setTime(runtimeState,time)
  if runtimeState==void then return error(7712,"network match loop: missing runtime") end if
  clientIngress.setRealtime(runtimeState.clientIngressRuntime,time);serverIngress.setTime(runtimeState.serverIngressRuntime,time);runtimeState.serverSnapshotState.time=time;runtimeState.clientSendState.realtime=time
  if runtimeState.serverTimeFn!=void then runtimeState.serverTimeFn(runtimeState.serverTimeContext,time) end if
  return void
end function

/// Calls `mq3.client.network_match_loop.synchronizeClient`, `mq3.client.send_cmd.send` from network match loop `sendClientFrame`. The final path returns `result`.
/// @param runtimeState Record read through `runtimeState.clientSendState`, `runtimeState.clientSendServices`.
/// @param frameTime Value used by `result=clientSend.send(runtimeState.clientSendState,frameTime,runtimeState.clientSendServices)`.
function sendClientFrame(runtimeState,frameTime)
  if runtimeState==void then return error(7712,"network match loop: missing runtime") end if
  synchronizeClient(runtimeState);result=clientSend.send(runtimeState.clientSendState,frameTime,runtimeState.clientSendServices);synchronizeClient(runtimeState);return result
end function

/// Calls `mq3.qcommon.network_pump.drain`, `mq3.client.network_match_loop.synchronize` from network match loop `pump`. The final path returns `result`.
/// @param runtimeState Record read through `runtimeState.pump`.
/// @param budget Value used by `if runtimeState==void or budget<0 then return error(7712,"network match loop: invalid pump") end if`.
function pump(runtimeState,budget)
  if runtimeState==void or budget<0 then return error(7712,"network match loop: invalid pump") end if
  result=packetPump.drain(runtimeState.pump,budget);synchronize(runtimeState);return result
end function

// Process exactly one queued datagram and expose its side/payload metadata.
// Frame hosts use this form when they need a strict packet budget while still
// keeping the client/server mirrors coherent after every accepted or rejected
// netchan packet.
/// @param runtimeState Record read through `runtimeState.pump`.
function pumpOnce(runtimeState)
  if runtimeState==void then return error(7712,"network match loop: missing runtime") end if
  result=packetPump.pumpOnce(runtimeState.pump);synchronize(runtimeState);return result
end function

// A local listen server owns one UDP socket while every client owns a separate
// socket and netchan. Group pumping round-robins the client runtimes, but any
// member may consume the shared server socket: server ingress selects the real
// client by base address/qport, then every mirror is synchronized.
/// @param runtimes Sequence read at `runtimes[0]`.
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

/// Calls `mq3.client.network_match_loop.synchronize` from network match loop `synchronizeGroup`.
/// @param groupState Record read through `groupState.runtimes`.
function synchronizeGroup(groupState)
  if groupState==void then return error(7712,"network match group: missing runtime") end if
  for each current in groupState.runtimes synchronize(current) end for;return void
end function

/// Calls `mq3.client.network_match_loop.commitFrameStates` from network match loop `commitGroupFrameStates`.
/// @param groupState Record read through `groupState.runtimes`.
function commitGroupFrameStates(groupState)
  if groupState==void then return error(7712,"network match group: missing runtime") end if
  for each current in groupState.runtimes result=commitFrameStates(current);if result is error then return result end if end for;return void
end function

/// Updates `groupState.nextRuntime` during network match loop `pumpGroupOnce`.
/// @param groupState Mutable network match loop record/storage; this routine assigns `groupState.nextRuntime`.
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

/// Calls `mq3.client.network_match_loop.pumpGroupOnce` from network match loop `pumpGroup`. The final path returns `count`.
/// @param groupState Value used by `if groupState==void or budget<0 then return error(7712,"network match group: invalid pump") end if`.
/// @param budget Value used by `if groupState==void or budget<0 then return error(7712,"network match group: invalid pump") end if`.
function pumpGroup(groupState,budget)
  if groupState==void or budget<0 then return error(7712,"network match group: invalid pump") end if
  count=0
  while count<budget step=pumpGroupOnce(groupState);if step is error then return step end if;if not step.processed then return count end if;count=count+1 end while
  return count
end function

/// Calls `mq3.client.network_match_loop.setTime`, `mq3.client.network_ingress.setRealtime`, `mq3.client.network_match_loop.synchronizeGroup` from network match loop `setGroupTime`.
/// @param groupState Record read through `groupState.runtimes`.
/// @param time Value assigned to `current.clientSendState.realtime`.
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

/// Calls `delegate.buildSnapshotFn` from network match loop `bridgeBuild`.
/// @param host Record read through `host.context.delegate`.
/// @param clientState Value used by `if delegate!=void and delegate.buildSnapshotFn!=void then return delegate.buildSnapshotFn(delegate,clientState,serverState) end if`.
/// @param serverState Value used by `if delegate!=void and delegate.buildSnapshotFn!=void then return delegate.buildSnapshotFn(delegate,clientState,serverState) end if`.
function bridgeBuild(host,clientState,serverState)
  delegate=host.context.delegate;if delegate!=void and delegate.buildSnapshotFn!=void then return delegate.buildSnapshotFn(delegate,clientState,serverState) end if;return void
end function
/// Calls `delegate.writeDownloadFn` from network match loop `bridgeDownload`.
/// @param host Record read through `host.context.delegate`.
/// @param clientState Value used by `if delegate!=void and delegate.writeDownloadFn!=void then return delegate.writeDownloadFn(delegate,clientState,msg) end if`.
/// @param msg Value used by `if delegate!=void and delegate.writeDownloadFn!=void then return delegate.writeDownloadFn(delegate,clientState,msg) end if`.
function bridgeDownload(host,clientState,msg)
  delegate=host.context.delegate;if delegate!=void and delegate.writeDownloadFn!=void then return delegate.writeDownloadFn(delegate,clientState,msg) end if;return void
end function
/// Calls `delegate.localAddressFn` from network match loop `bridgeLocal`.
/// @param host Record read through `host.context.delegate`.
/// @param clientState Value used by `if delegate!=void and delegate.localAddressFn!=void then return delegate.localAddressFn(delegate,clientState) end if`.
function bridgeLocal(host,clientState)
  delegate=host.context.delegate;if delegate!=void and delegate.localAddressFn!=void then return delegate.localAddressFn(delegate,clientState) end if;return false
end function
/// Calls `delegate.lanAddressFn` from network match loop `bridgeLan`.
/// @param host Record read through `host.context.delegate`.
/// @param clientState Value used by `if delegate!=void and delegate.lanAddressFn!=void then return delegate.lanAddressFn(delegate,clientState) end if`.
function bridgeLan(host,clientState)
  delegate=host.context.delegate;if delegate!=void and delegate.lanAddressFn!=void then return delegate.lanAddressFn(delegate,clientState) end if;return false
end function
/// Updates `clientState.outgoingSequence` during network match loop `bridgeTransmit`.
/// @param host Record read through `host.context.runtimeState`.
/// @param clientState Mutable network match loop record/storage; this routine assigns `clientState.outgoingSequence`.
/// @param payload Value used by `result=serverNetchan.transmitPayload(runtimeState.serverWireRuntime,runtimeState.serverWireClient,payload)`.
function bridgeTransmit(host,clientState,payload)
  runtimeState=host.context.runtimeState;result=serverNetchan.transmitPayload(runtimeState.serverWireRuntime,runtimeState.serverWireClient,payload)
  if result is error then return result end if;clientState.outgoingSequence=runtimeState.serverWireClient.channel.outgoingSequence;return result
end function
/// Adapts `mq3.server.snapshot_send.services` to network match loop `snapshotServices`, returning its result for `bridgeBuild, bridgeDownload, bridgeTransmit, bridgeLocal, bridgeLan, SnapshotBridge(runtimeState,delegate)`.
/// @param runtimeState Argument 6 of `mq3.server.snapshot_send.services`; passed as `SnapshotBridge(runtimeState,delegate)`.
/// @param delegate Argument 6 of `mq3.server.snapshot_send.services`; passed as `SnapshotBridge(runtimeState,delegate)`.
function snapshotServices(runtimeState,delegate)
  return snapshotSend.services(bridgeBuild,bridgeDownload,bridgeTransmit,bridgeLocal,bridgeLan,SnapshotBridge(runtimeState,delegate))
end function

/// Calls `mq3.client.network_match_loop.synchronizeServer`, `mq3.server.snapshot_send.sendClientSnapshot`, `mq3.client.network_match_loop.snapshotServices` from network match loop `sendServerSnapshot`. The final path returns `result`.
/// @param runtimeState Record read through `runtimeState.serverSnapshotClient`, `runtimeState.serverSnapshotState`.
/// @param delegate Value used by `result=snapshotSend.sendClientSnapshot(runtimeState.serverSnapshotClient,runtimeState.serverSnapshotState,snapshotServices(runtimeState,delega...`.
function sendServerSnapshot(runtimeState,delegate)
  if runtimeState==void then return error(7712,"network match loop: missing runtime") end if
  synchronizeServer(runtimeState);result=snapshotSend.sendClientSnapshot(runtimeState.serverSnapshotClient,runtimeState.serverSnapshotState,snapshotServices(runtimeState,delegate));synchronizeServer(runtimeState);return result
end function
