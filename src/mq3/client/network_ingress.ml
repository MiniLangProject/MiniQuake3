// SPDX-License-Identifier: GPL-2.0-or-later
// Productive UDP -> CL_PacketEvent -> CL_Netchan -> CL_ParseServerMessage adapter.
package mq3.client.network_ingress
import mq3.qcommon.message as message
import mq3.qcommon.received_message as receivedMessage
import mq3.qcommon.network_pump as networkPump
import mq3.client.packet_event as clientPacketEvent
import mq3.client.netchan as clientNetchanRuntime
import mq3.client.protocol_runtime as protocolRuntime

struct Services connectionlessHost demoFn serverPacketFn context end struct

struct Runtime
  connection packetState packetHost netchanRuntime protocol services
  lastPacketResult lastParseResult packetCount
end struct

function services(connectionlessHost)
  return Services(connectionlessHost,void,void,void)
end function

function process(packetHost,state,msg)
  runtime=packetHost.context
  if runtime==void or runtime.netchanRuntime==void then return error(6994,"client ingress: missing netchan runtime") end if
  return clientNetchanRuntime.process(runtime.netchanRuntime,state.connection.channel,msg)
end function

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

function recordDemo(packetHost,state,msg,headerBytes)
  runtime=packetHost.context
  if runtime==void or runtime.services.demoFn==void then return error(6994,"client ingress: missing demo service") end if
  return runtime.services.demoFn(runtime.services,state,msg,headerBytes)
end function

function create(connectionState,netchanRuntime,protocol,hostServices)
  if connectionState==void or netchanRuntime==void or protocol==void or hostServices==void then return error(6994,"client ingress: missing configuration") end if
  if hostServices.connectionlessHost==void then return error(6994,"client ingress: missing connectionless services") end if
  packetState=clientPacketEvent.create(connectionState)
  packetHost=clientPacketEvent.services(hostServices.connectionlessHost)
  runtime=Runtime(connectionState,packetState,packetHost,netchanRuntime,protocol,hostServices,"",void,0)
  packetHost.context=runtime;packetHost.processFn=process;packetHost.parseFn=parse;packetHost.demoFn=recordDemo
  return runtime
end function

function setRealtime(runtime,realtime)
  if runtime==void then return error(6994,"client ingress: missing runtime") end if
  runtime.packetState.realtime=realtime
  runtime.protocol.dispatcher.snapshotState.realtime=realtime
  return void
end function

function clientPacket(runtime,address,data)
  if runtime==void or address==void or data==void then return error(6994,"client ingress: missing packet input") end if
  msg=receivedMessage.create(data);if msg is error then return msg end if
  result=clientPacketEvent.packetEvent(runtime.packetState,runtime.packetHost,address,msg)
  runtime.lastPacketResult=result;runtime.packetCount=runtime.packetCount+1
  return result
end function

function receiveClient(runtime,address,data)
  return clientPacket(runtime,address,data)
end function

function receiveServer(runtime,address,data)
  if runtime.services.serverPacketFn!=void then return runtime.services.serverPacketFn(runtime.services,address,data) end if
  return void
end function

function createPump(runtime,clientSocket,serverSocket,capacity)
  if runtime==void then return error(6994,"client ingress: missing runtime") end if
  return networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)
end function
