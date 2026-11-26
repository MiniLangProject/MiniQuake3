// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive UDP -> SV_PacketEvent -> SV_Netchan -> SV_ExecuteClientMessage adapter.
package mq3.server.network_ingress
import mq3.qcommon.message as message
import mq3.qcommon.received_message as receivedMessage
import mq3.qcommon.network_pump as networkPump
import mq3.server.packet_event as packetEvent
import mq3.server.client_message as clientMessage

/// Binding record for server.network_ingress, containing `packetClient`, `messageClient`.
struct Binding
  /// Client record used by the packet sequence handler.
  packetClient
  /// Client record used while decoding the accepted message payload.
  messageClient
end struct

// The game-facing command and movement callbacks remain explicit host
// services. This lets the ingress path run before the concrete game module is
// installed and avoids coupling the protocol parser to game state.
struct Services
  /// Runtime used to dispatch out-of-band packets.
  connectionlessRuntime
  /// Host services used by the connectionless packet dispatcher.
  connectionlessHost
  /// Host callback that delivers an incoming packet to the client network handler.
  clientPacketFn
  /// Host callback that delivers a command to the game client interface.
  clientCommandFn
  /// Host callback that decodes and processes client movement commands.
  userMoveFn
  /// Host callback that transmits the current gamestate to a client.
  sendGamestateFn
  /// Host callback that disconnects a client and reports the supplied reason.
  dropFn
  /// Host callback that reports diagnostics associated with one client.
  clientDiagnosticFn
  /// Host callback that processes a client disconnection through the host network lifecycle.
  disconnectFn
  /// Host callback that reports packet-validation diagnostics.
  packetDiagnosticFn
  /// Caller-supplied data associated with routing received server packets into connection and message
  /// handlers.
  context
end struct

/// Runtime record for server.network_ingress, containing `server`, `bindings`, `services`, `packetState`, `packetHost`, `messageHost`, and 3 further fields.
struct Runtime
  /// Server runtime receiving the incoming datagrams.
  server
  /// Associations between packet-channel clients and message-decoder clients.
  bindings
  /// Host entry points used to route packets into connectionless and sequenced client handling.
  services
  /// State used to validate packet sequence and fragment headers.
  packetState
  /// Host callbacks used by the packet event handler.
  packetHost
  /// Host callbacks used by the client-message decoder.
  messageHost
  /// Most recent packet-validation and dispatch result.
  lastPacketResult
  /// Most recent client-message decoding result.
  lastClientResult
  /// Number of packet recorded by this state.
  packetCount
end struct

/// Compute binding in server.network_ingress; the normal completion returns `Binding(packetClient, messageClient)`.
///
/// Validation failures include `server ingress: invalid client binding`.
/// @param packetClient Initial `packetClient` field stored in the returned or constructed `mq3.server.network_ingress.Binding` record.
/// @param messageClient Initial `messageClient` field stored in the returned or constructed `mq3.server.network_ingress.Binding` record.
function binding(packetClient,messageClient)
  if packetClient==void or messageClient==void then return error(6996,"server ingress: invalid client binding") end if
  return Binding(packetClient,messageClient)
end function

/// Create `mq3.server.network_ingress.Services` with connectionlessRuntime=void; connectionlessHost=void; clientPacketFn=void; clientCommandFn=void; 7 further fields.
function services()
  return Services(void,void,void,void,void,void,void,void,void,void,void)
end function

/// Find binding in server.network_ingress.
/// @param runtime Record exposing `bindings`.
/// @param packetClient Packet client used in `(current.packetClient == packetClient)`.
function findBinding(runtime,packetClient)
  for each current in runtime.bindings
    if current.packetClient==packetClient then return current end if
  end for
  return void
end function

/// Execute client in server.network_ingress; the normal completion returns `result`.
///
/// Validation failures include `server ingress: missing client-message binding`.
/// Direct state writes: `packetClient.state`.
/// @param packetHost Record exposing `context`.
/// @param packetClient Record exposing `state`, `netchan`. Updated in place: `state`.
/// @param msg Msg passed as `msg` to `mq3.server.client_message.execute`.
function executeClient(packetHost,packetClient,msg)
  runtime=packetHost.context;current=findBinding(runtime,packetClient)
  if current==void then return error(6997,"server ingress: missing client-message binding") end if
  // packet_event and client_message model two slices of client_t. Keep the
  // fields shared by both C paths coherent at their call boundary.
  current.messageClient.state=packetClient.state
  result=clientMessage.execute(runtime.server,current.messageClient,runtime.messageHost,msg)
  packetClient.state=current.messageClient.state
  packetClient.netchan.lastClientCommandString=current.messageClient.lastClientCommandString
  runtime.lastClientResult=result
  return result
end function

/// Compute disconnect in server.network_ingress; the normal completion returns `runtime.services.disconnectFn(runtime.services, address, text)`.
///
/// Validation failures include `server ingress: missing disconnect service`.
/// @param packetHost Record exposing `context`.
/// @param address Address used in `runtime.services.disconnectFn(runtime.services, address, text)`.
/// @param text Text used in `runtime.services.disconnectFn(runtime.services, address, text)`.
function disconnect(packetHost,address,text)
  runtime=packetHost.context
  if runtime.services.disconnectFn==void then return error(6998,"server ingress: missing disconnect service") end if
  return runtime.services.disconnectFn(runtime.services,address,text)
end function

/// Compute packet diagnostic in server.network_ingress.
/// @param packetHost Record exposing `context`.
/// @param packetClient Packet client used in `runtime.services.packetDiagnosticFn(runtime.services, packetClient, address)`.
/// @param address Address used in `runtime.services.packetDiagnosticFn(runtime.services, packetClient, address)`.
function packetDiagnostic(packetHost,packetClient,address)
  runtime=packetHost.context
  if runtime.services.packetDiagnosticFn!=void then return runtime.services.packetDiagnosticFn(runtime.services,packetClient,address) end if
  return void
end function

/// Create network ingress in server.network_ingress; the normal completion returns `runtime`.
///
/// Validation failures include `server ingress: missing configuration`; `server ingress: invalid binding`.
/// @param serverState Initial `server` field stored in the returned or constructed `mq3.server.network_ingress.Runtime` record.
/// @param bindings Initial `bindings` field stored in the returned or constructed `mq3.server.network_ingress.Runtime` record.
/// @param hostServices Record exposing `connectionlessRuntime`, `connectionlessHost`, `context`, `clientCommandFn`, `userMoveFn`, `sendGamestateFn`, `dropFn` and further fields.
function create(serverState,bindings,hostServices)
  if serverState==void or bindings==void or hostServices==void then return error(6996,"server ingress: missing configuration") end if
  packetClients=[]
  for each current in bindings
    if current==void or current.packetClient==void or current.messageClient==void then return error(6996,"server ingress: invalid binding") end if
    packetClients=packetClients+[current.packetClient]
  end for
  packetState=packetEvent.runtime(packetClients)
  packetHost=packetEvent.services(hostServices.connectionlessRuntime,hostServices.connectionlessHost)
  messageHost=clientMessage.services();messageHost.context=hostServices.context
  messageHost.clientCommandFn=hostServices.clientCommandFn;messageHost.userMoveFn=hostServices.userMoveFn
  messageHost.sendGamestateFn=hostServices.sendGamestateFn;messageHost.dropFn=hostServices.dropFn
  messageHost.diagnosticFn=hostServices.clientDiagnosticFn
  runtime=Runtime(serverState,bindings,hostServices,packetState,packetHost,messageHost,"","",0)
  packetHost.context=runtime;packetHost.executeFn=executeClient
  packetHost.disconnectFn=disconnect;packetHost.diagnosticFn=packetDiagnostic
  return runtime
end function

/// Set time in server.network_ingress.
///
/// Validation failures include `server ingress: missing runtime`.
/// @param runtime Record exposing `packetState`.
/// @param time Time operand used by `setTime`; its reads are shown in the implementation.
function setTime(runtime,time)
  if runtime==void then return error(6996,"server ingress: missing runtime") end if
  runtime.packetState.time=time;return void
end function

/// Wraps a client datagram, dispatches server packet processing, and returns and retains the packet-event result.
/// Fragmented datagrams receive full message capacity through `received_message.create`; ordinary
/// datagrams retain their supplied storage. Oversized datagrams return error 7981 before packet accounting.
/// Missing input produces error 6996; successful dispatch increments the runtime packet count.
/// @param runtime Ingress runtime owning the packet-event state, services, last result and packet count.
/// @param address Sender network address used by server connectionless or connected packet handling.
/// @param data Received UDP datagram bytes passed to the receive-storage constructor and packet-event path.
function serverPacket(runtime,address,data)
  if runtime==void or address==void or data==void then return error(6996,"server ingress: missing packet input") end if
  msg=receivedMessage.create(data);if msg is error then return msg end if
  result=packetEvent.packetEvent(runtime.packetState,runtime.packetHost,address,msg)
  runtime.lastPacketResult=result;runtime.packetCount=runtime.packetCount+1
  return result
end function

/// Receive client in server.network_ingress.
/// @param runtime Record exposing `services`.
/// @param address Address used in `runtime.services.clientPacketFn(runtime.services, address, data)`.
/// @param data Data used in `runtime.services.clientPacketFn(runtime.services, address, data)`.
function receiveClient(runtime,address,data)
  if runtime.services.clientPacketFn!=void then return runtime.services.clientPacketFn(runtime.services,address,data) end if
  return void
end function

/// Return `mq3.server.network_ingress.serverPacket(runtime, address, data)` from `server.network_ingress.receiveServer`.
/// @param runtime Runtime passed as `runtime` to `mq3.server.network_ingress.serverPacket`.
/// @param address Address passed as `address` to `mq3.server.network_ingress.serverPacket`.
/// @param data Data passed as `data` to `mq3.server.network_ingress.serverPacket`.
function receiveServer(runtime,address,data)
  return serverPacket(runtime,address,data)
end function

/// Create pump in server.network_ingress; the normal completion returns `networkPump.create(clientSocket, serverSocket, capacity, runtime, receiveClient, receiveServer)`.
///
/// Validation failures include `server ingress: missing runtime`.
/// @param runtime Context passed as `context` to `mq3.qcommon.network_pump.create`.
/// @param clientSocket Client socket passed as `clientSocket` to `mq3.qcommon.network_pump.create`.
/// @param serverSocket Server socket passed as `serverSocket` to `mq3.qcommon.network_pump.create`.
/// @param capacity Capacity passed as `capacity` to `mq3.qcommon.network_pump.create`.
function createPump(runtime,clientSocket,serverSocket,capacity)
  if runtime==void then return error(6996,"server ingress: missing runtime") end if
  return networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)
end function
