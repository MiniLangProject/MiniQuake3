// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive UDP -> SV_PacketEvent -> SV_Netchan -> SV_ExecuteClientMessage adapter.
package mq3.server.network_ingress
import mq3.qcommon.message as message
import mq3.qcommon.received_message as receivedMessage
import mq3.qcommon.network_pump as networkPump
import mq3.server.packet_event as packetEvent
import mq3.server.client_message as clientMessage

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

struct Runtime
  server bindings services packetState packetHost messageHost
  lastPacketResult lastClientResult packetCount
end struct

function binding(packetClient,messageClient)
  if packetClient==void or messageClient==void then return error(6996,"server ingress: invalid client binding") end if
  return Binding(packetClient,messageClient)
end function

function services()
  return Services(void,void,void,void,void,void,void,void,void,void,void)
end function

function findBinding(runtime,packetClient)
  for each current in runtime.bindings
    if current.packetClient==packetClient then return current end if
  end for
  return void
end function

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

function disconnect(packetHost,address,text)
  runtime=packetHost.context
  if runtime.services.disconnectFn==void then return error(6998,"server ingress: missing disconnect service") end if
  return runtime.services.disconnectFn(runtime.services,address,text)
end function

function packetDiagnostic(packetHost,packetClient,address)
  runtime=packetHost.context
  if runtime.services.packetDiagnosticFn!=void then return runtime.services.packetDiagnosticFn(runtime.services,packetClient,address) end if
  return void
end function

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

function setTime(runtime,time)
  if runtime==void then return error(6996,"server ingress: missing runtime") end if
  runtime.packetState.time=time;return void
end function

function serverPacket(runtime,address,data)
  if runtime==void or address==void or data==void then return error(6996,"server ingress: missing packet input") end if
  msg=receivedMessage.create(data);if msg is error then return msg end if
  result=packetEvent.packetEvent(runtime.packetState,runtime.packetHost,address,msg)
  runtime.lastPacketResult=result;runtime.packetCount=runtime.packetCount+1
  return result
end function

function receiveClient(runtime,address,data)
  if runtime.services.clientPacketFn!=void then return runtime.services.clientPacketFn(runtime.services,address,data) end if
  return void
end function

function receiveServer(runtime,address,data)
  return serverPacket(runtime,address,data)
end function

function createPump(runtime,clientSocket,serverSocket,capacity)
  if runtime==void then return error(6996,"server ingress: missing runtime") end if
  return networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)
end function
