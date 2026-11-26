// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive UDP -> SV_PacketEvent -> SV_Netchan -> SV_ExecuteClientMessage adapter.
package mq3.server.network_ingress
import mq3.qcommon.message as message
import mq3.qcommon.network_pump as networkPump
import mq3.server.packet_event as packetEvent
import mq3.server.client_message as clientMessage

/// Binding record for server.network_ingress, containing `packetClient`, `messageClient`.
struct Binding packetClient messageClient end struct

// The game-facing command and movement callbacks remain explicit host
// services. This lets the ingress path run before the concrete game module is
// installed and avoids coupling the protocol parser to game state.
struct Services
  connectionlessRuntime connectionlessHost
  clientPacketFn clientCommandFn userMoveFn
  sendGamestateFn dropFn clientDiagnosticFn
  disconnectFn packetDiagnosticFn context
end struct

/// Runtime record for server.network_ingress, containing `server`, `bindings`, `services`, `packetState`, `packetHost`, `messageHost`, and 3 further fields.
struct Runtime
  server bindings services packetState packetHost messageHost
  lastPacketResult lastClientResult packetCount
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

/// Update `runtime.lastPacketResult`, `runtime.packetCount` in server.network_ingress; the normal completion returns `result`.
///
/// Validation failures include `server ingress: missing packet input`.
/// Direct state writes: `runtime.lastPacketResult`, `runtime.packetCount`.
/// @param runtime Record exposing `packetState`, `packetHost`, `packetCount`. Updated in place: `lastPacketResult`, `packetCount`.
/// @param address Source passed as `source` to `mq3.server.packet_event.packetEvent`.
/// @param data Data passed as `data` to `mq3.qcommon.message.initStorage`.
function serverPacket(runtime,address,data)
  if runtime==void or address==void or data==void then return error(6996,"server ingress: missing packet input") end if
  msg=message.initStorage(data,len(data),false);msg.cursize=len(data)
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
