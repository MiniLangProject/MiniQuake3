// SPDX-License-Identifier: GPL-2.0-or-later
// Productive UDP -> CL_PacketEvent -> CL_Netchan -> CL_ParseServerMessage adapter.
package mq3.client.network_ingress
import mq3.qcommon.message as message
import mq3.qcommon.netchan as ingressWireNetchan
import mq3.qcommon.network_pump as networkPump
import mq3.client.packet_event as clientPacketEvent
import mq3.client.netchan as clientNetchanRuntime
import mq3.client.protocol_runtime as protocolRuntime

/// Host services for connectionless client packets, optional demo recording, and server-side datagrams.
struct Services
  /// Client connectionless service bundle used for handshake, disconnect, and other out-of-band packets.
  connectionlessHost
  /// Optional recorder callback `(services, packetState, msg, headerBytes)`; required when recording
  /// a sequenced packet. The first argument is this Services record, including its context.
  demoFn
  /// Optional server datagram callback `(services, address, data)`; its result is returned unchanged
  /// by `receiveServer`. With no callback, server datagrams are ignored.
  serverPacketFn
  /// Caller-owned data available as `services.context` to recorder and server-packet callbacks.
  context
end struct

/// Wiring between UDP datagrams, connection state, netchan reassembly, and the client protocol parser.
struct Runtime
  /// Shared client connection and remote-channel state retained by the packet-event handler.
  connection
  /// Packet-event state holding client time, received server sequence, and demo-recording flags.
  packetState
  /// Packet-event service bundle whose process, parse, and demo callbacks are bound to this runtime.
  packetHost
  /// Client netchan runtime for sequenced-packet validation, reassembly, and payload decoding.
  netchanRuntime
  /// Parser runtime shared with packet ingestion; owns the server-message dispatcher, gamestate, and downloads.
  protocol
  /// Service callbacks and context used to access the host engine from this client subsystem.
  services
  /// Most recent packet-event disposition, such as `oob`, `sequenced`, or a rejection reason; initially empty.
  lastPacketResult
  /// Most recent server-message parser result, or `void` before parsing any server payload.
  lastParseResult
  /// Number of calls that completed packet-event dispatch, including ignored or rejected packets.
  packetCount
  /// Reused message codec, allocated on the first incoming datagram and retained for later receives.
  codec
end struct

/// Create the ingress service bundle with demo and server-packet callbacks initially unset.
/// @param connectionlessHost Client connectionless service bundle required later by `create`.
function services(connectionlessHost)
  return Services(connectionlessHost,void,void,void)
end function

/// Pass a sequenced server packet through the client netchan decoder and return its acceptance result.
/// Missing ingress or netchan configuration produces error 6994.
/// @param packetHost Packet-event Services record whose context references this ingress runtime.
/// @param state Packet-event State whose connection owns the remote netchan channel.
/// @param msg Mutable received message whose payload and read cursor are processed by the netchan.
function process(packetHost,state,msg)
  runtime=packetHost.context
  if runtime==void or runtime.netchanRuntime==void then return error(6994,"client ingress: missing netchan runtime") end if
  return clientNetchanRuntime.process(runtime.netchanRuntime,state.connection.channel,msg)
end function

/// Parse a server payload and synchronize snapshot sequencing and reliable server-command history.
/// The packet-event server sequence is copied into the snapshot parser before decoding. Afterwards the
/// decoded server-command ring is shared with the outgoing netchan XOR encoder. Returns and retains
/// the parser result in `lastParseResult`.
/// @param packetHost Packet-event Services record whose context references this ingress runtime.
/// @param state Packet-event State containing the physical server-message sequence number.
/// @param msg Mutable message positioned at the server payload after netchan processing.
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

/// Forward a received server message to the installed demo recorder and return its result unchanged.
/// The callback is `demoFn(services, state, msg, headerBytes)`; a missing recorder produces error 6994.
/// @param packetHost Packet-event Services record whose context references this ingress runtime.
/// @param state Packet-event State associated with the recorded server message.
/// @param msg Received message after server-payload parsing; the recorder receives the same message object.
/// @param headerBytes Number of transport/header bytes preceding the payload to record.
function recordDemo(packetHost,state,msg,headerBytes)
  runtime=packetHost.context
  if runtime==void or runtime.services.demoFn==void then return error(6994,"client ingress: missing demo service") end if
  return runtime.services.demoFn(runtime.services,state,msg,headerBytes)
end function

/// Connect client packet handling, netchan decoding, and protocol parsing to one ingress runtime.
/// Creates packet-event state and binds its callbacks to this runtime. All four arguments must be present,
/// and the supplied Services must contain a connectionless service bundle; missing configuration returns error 6994.
/// @param connectionState Shared client connection state, including the active remote netchan channel.
/// @param netchanRuntime Client netchan decoder and its reliable-command connection state.
/// @param protocol Client protocol parser Runtime containing dispatcher, gamestate, and download state.
/// @param hostServices Ingress Services containing connectionless support and optional recording/server callbacks.
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

/// Adapt the pump's client datagram callback to ingress packet processing.
/// Returns the same packet-event result as `clientPacket` and updates its accounting and codec state.
/// @param runtime Ingress runtime passed by the network pump as its callback context.
/// @param address Sender's network address, checked against the connected server for sequenced traffic.
/// @param data Received UDP datagram bytes.
function receiveClient(runtime,address,data)
  return clientPacket(runtime,address,data)
end function

/// Pass a server-side datagram to `serverPacketFn(services, address, data)` when configured.
/// Returns the service result unchanged, or `void` when server-packet handling is disabled.
/// @param runtime Ingress runtime whose Services contains the optional server callback and context.
/// @param address Sender's network address.
/// @param data Received UDP datagram bytes for the server endpoint.
function receiveServer(runtime,address,data)
  if runtime.services.serverPacketFn!=void then return runtime.services.serverPacketFn(runtime.services,address,data) end if
  return void
end function

/// Create a UDP pump whose client and server callbacks are bound to this ingress runtime.
/// Returns the pump or a missing-runtime, missing-socket, or invalid-capacity error.
/// @param runtime Ingress runtime retained as the pump's callback context.
/// @param clientSocket Open client UDP socket, or `void` to omit client-side polling.
/// @param serverSocket Open server UDP socket, or `void` to omit server-side polling; at least one socket is required.
/// @param capacity Receive-buffer size in bytes per endpoint, from 1 through 65,535.
function createPump(runtime,clientSocket,serverSocket,capacity)
  if runtime==void then return error(6994,"client ingress: missing runtime") end if
  return networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)
end function
