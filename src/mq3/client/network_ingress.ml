// SPDX-License-Identifier: GPL-2.0-or-later
// Productive UDP -> CL_PacketEvent -> CL_Netchan -> CL_ParseServerMessage adapter.
package mq3.client.network_ingress
import mq3.qcommon.message as message
import mq3.qcommon.netchan as ingressWireNetchan
import mq3.qcommon.network_pump as networkPump
import mq3.client.packet_event as clientPacketEvent
import mq3.client.netchan as clientNetchanRuntime
import mq3.client.protocol_runtime as protocolRuntime

/// Stores network ingress host-service callbacks, including `connectionlessHost`, `demoFn`, `serverPacketFn`, `context`.
struct Services
  /// When constructing this record, `services` supplies `connectionlessHost` for this member.
  connectionlessHost
  /// Host callback for the demo operation; an unset callback leaves that host operation unavailable.
  demoFn
  /// Host callback for the server packet operation; an unset callback leaves that host operation
  /// unavailable.
  serverPacketFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for client packet ingestion.
  context
end struct

/// Stores network ingress runtime wiring and state, including `connection`, `packetState`, `packetHost`, `netchanRuntime`, `protocol`, `services` and additional values.
struct Runtime
  /// When constructing this record, `create` supplies `connectionState` for this member. Used by
  /// `process` during subsequent processing.
  connection
  /// When constructing this record, `create` supplies `packetState` for this member. Used by
  /// `setRealtime` and `clientPacket` during subsequent processing.
  packetState
  /// When constructing this record, `create` supplies `packetHost` for this member. Used by
  /// `clientPacket` during subsequent processing.
  packetHost
  /// When constructing this record, `create` supplies `netchanRuntime` for this member. Used by
  /// `process` and `parse` during subsequent processing.
  netchanRuntime
  /// Network protocol version advertised or required by the client connection.
  protocol
  /// Service callbacks and context used to access the host engine from this client subsystem.
  services
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `clientPacket` during subsequent processing.
  lastPacketResult
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `parse` during subsequent processing.
  lastParseResult
  /// When constructing this record, `create` supplies `0` for this member. Used by `clientPacket`
  /// during subsequent processing.
  packetCount
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `clientPacket` during subsequent processing.
  codec
end struct

/// Creates a `mq3.client.network_ingress.Services` record. Assigns `connectionlessHost` from `connectionlessHost`.
/// @param connectionlessHost Value used to initialize `Services.connectionlessHost`.
function services(connectionlessHost)
  return Services(connectionlessHost,void,void,void)
end function

/// Passes a server packet to the client netchan after checking that the packet host has a configured netchan runtime.
/// @param packetHost Record read through `packetHost.context`.
/// @param state Record read through `state.connection.channel`.
/// @param msg Value used by `return clientNetchanRuntime.process(runtime.netchanRuntime,state.connection.channel,msg)`.
function process(packetHost,state,msg)
  runtime=packetHost.context
  if runtime==void or runtime.netchanRuntime==void then return error(6994,"client ingress: missing netchan runtime") end if
  return clientNetchanRuntime.process(runtime.netchanRuntime,state.connection.channel,msg)
end function

/// Parses a server message, synchronizes snapshot and reliable-command sequence state, and records the parse result.
/// @param packetHost Record read through `packetHost.context`.
/// @param state Record read through `state.serverMessageSequence`.
/// @param msg Value used by `result=protocolRuntime.parse(runtime.protocol,msg)`.
function parse(packetHost,state,msg)
  runtime=packetHost.context
  if runtime==void or runtime.protocol==void then return error(6994,"client ingress: missing protocol runtime") end if
  // CL_PacketEvent updates the physical server message sequence immediately
  // before CL_ParseServerMessage. Snapshot promotion and delta lookup consume
  // that same sequence through clc.serverMessageSequence.
  runtime.protocol.dispatcher.snapshotState.serverMessageSequence=state.serverMessageSequence
  result=protocolRuntime.parse(runtime.protocol,msg)
  // CL_ParseCommandString writes cls.serverCommands.  The client netchan
  // encoder consumes the same ring for the next packet's XOR key.
  runtime.netchanRuntime.connection.serverCommands=runtime.protocol.dispatcher.serverCommands
  runtime.lastParseResult=result
  return result
end function

/// Forwards a received message and its header length to the configured demo recorder.
/// @param packetHost Record read through `packetHost.context`.
/// @param state Shared network ingress state passed to the helper calls in `recordDemo`.
/// @param msg Value used by `return runtime.services.demoFn(runtime.services,state,msg,headerBytes)`.
/// @param headerBytes Number of transport/header bytes preceding the recorded message payload.
function recordDemo(packetHost,state,msg,headerBytes)
  runtime=packetHost.context
  if runtime==void or runtime.services.demoFn==void then return error(6994,"client ingress: missing demo service") end if
  return runtime.services.demoFn(runtime.services,state,msg,headerBytes)
end function

/// Connects client packet, netchan and protocol state to the incoming-packet callbacks after validating all required services.
/// @param connectionState Value used by `if connectionState==void or netchanRuntime==void or protocol==void or hostServices==void then return error(6994,"client ingress: missing confi...`.
/// @param netchanRuntime Value used by `if connectionState==void or netchanRuntime==void or protocol==void or hostServices==void then return error(6994,"client ingress: missing confi...`.
/// @param protocol Value used by `if connectionState==void or netchanRuntime==void or protocol==void or hostServices==void then return error(6994,"client ingress: missing confi...`.
/// @param hostServices Record read through `hostServices.connectionlessHost`.
function create(connectionState,netchanRuntime,protocol,hostServices)
  if connectionState==void or netchanRuntime==void or protocol==void or hostServices==void then return error(6994,"client ingress: missing configuration") end if
  if hostServices.connectionlessHost==void then return error(6994,"client ingress: missing connectionless services") end if
  packetState=clientPacketEvent.create(connectionState)
  packetHost=clientPacketEvent.services(hostServices.connectionlessHost)
  runtime=Runtime(connectionState,packetState,packetHost,netchanRuntime,protocol,hostServices,"",void,0,void)
  packetHost.context=runtime;packetHost.processFn=process;packetHost.parseFn=parse;packetHost.demoFn=recordDemo
  return runtime
end function

/// Updates both packet-event and snapshot-parser clocks to the supplied client real time.
/// @param runtime Mutable network ingress record/storage; this routine assigns `runtime.packetState.realtime`, `runtime.protocol.dispatcher.snapshotState.realtime`.
/// @param realtime Current client real-time clock in milliseconds.
function setRealtime(runtime,realtime)
  if runtime==void then return error(6994,"client ingress: missing runtime") end if
  runtime.packetState.realtime=realtime
  runtime.protocol.dispatcher.snapshotState.realtime=realtime
  return void
end function

/// Wraps a UDP datagram in message storage, runs client packet processing, and records its result and packet count.
/// @param runtime Mutable network ingress record/storage; this routine assigns `runtime.codec`, `runtime.lastPacketResult`, `runtime.packetCount`.
/// @param address Source network address checked by the client packet-event path.
/// @param data Received UDP datagram bytes, wrapped in message storage large enough for netchan reassembly.
function clientPacket(runtime,address,data)
  if runtime==void or address==void or data==void then return error(6994,"client ingress: missing packet input") end if
  // The datagram owns only the arriving bytes. Netchan may return a larger
  // assembled message, including its four-byte server sequence prefix.
  msg=message.initStorageWithCodec(data,ingressWireNetchan.MAX_MSGLEN+4,false,runtime.codec)
  runtime.codec=msg.codec;msg.cursize=len(data)
  result=clientPacketEvent.packetEvent(runtime.packetState,runtime.packetHost,address,msg)
  runtime.lastPacketResult=result;runtime.packetCount=runtime.packetCount+1
  return result
end function

/// Adapts `mq3.client.network_ingress.clientPacket` to network ingress `receiveClient`, returning its result for `runtime, address, data`.
/// @param runtime Argument 1 of `mq3.client.network_ingress.clientPacket`.
/// @param address Argument 2 of `mq3.client.network_ingress.clientPacket`.
/// @param data Argument 3 of `mq3.client.network_ingress.clientPacket`.
function receiveClient(runtime,address,data)
  return clientPacket(runtime,address,data)
end function

/// Forwards a server-side datagram to the optional server packet service, or returns void when no service is installed.
/// @param runtime Record read through `runtime.services.serverPacketFn`, `runtime.services`.
/// @param address Value used by `if runtime.services.serverPacketFn!=void then return runtime.services.serverPacketFn(runtime.services,address,data) end if`.
/// @param data Value used by `if runtime.services.serverPacketFn!=void then return runtime.services.serverPacketFn(runtime.services,address,data) end if`.
function receiveServer(runtime,address,data)
  if runtime.services.serverPacketFn!=void then return runtime.services.serverPacketFn(runtime.services,address,data) end if
  return void
end function

/// Calls `mq3.qcommon.network_pump.create` from network ingress `createPump`. The final path returns `networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)`.
/// @param runtime runtime record passed to the network ingress helper calls.
/// @param clientSocket Value used by `return networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)`.
/// @param serverSocket Value used by `return networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)`.
/// @param capacity Maximum number of entries or bytes accepted by this container.
function createPump(runtime,clientSocket,serverSocket,capacity)
  if runtime==void then return error(6994,"client ingress: missing runtime") end if
  return networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)
end function
