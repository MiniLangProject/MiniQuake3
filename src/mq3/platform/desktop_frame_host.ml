// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Desktop ownership boundary around UDP and the Quake client/server frame loop.
package mq3.platform.desktop_frame_host
import mq3.platform.udp as udp
import mq3.qcommon.network_pump as networkPump
import mq3.server.network_ingress as networkIngress

struct Config clientEndpoint serverEndpoint packetCapacity packetBudget maxFrameMsec end struct

// All effects are explicit so startup rollback and frame ordering can be
// checked without substituting the protocol or UDP implementations.
struct Services
  startupFn openFn bindFn closeFn cleanupFn
  createPumpFn setTimeFn drainFn serverFrameFn clientFrameFn
  context
end struct

struct LiveContext ingress frameContext commonFrameFn serverFrameFn clientFrameFn end struct
struct Runtime
  config services clientSocket serverSocket clientEndpoint serverEndpoint pump
  time frameNumber packetCount active udpStarted
end struct
struct FrameResult number time msec packets end struct

function config(clientEndpoint,serverEndpoint,packetCapacity,packetBudget,maxFrameMsec)
  return Config(clientEndpoint,serverEndpoint,packetCapacity,packetBudget,maxFrameMsec)
end function

function liveStartup(services) return udp.startup() end function
function liveOpen(services) return udp.open() end function
function liveBind(services,socket,endpoint) return udp.bind(socket,endpoint) end function
function liveClose(services,socket) return udp.close(socket) end function
function liveCleanup(services) return udp.cleanup() end function
function liveCreatePump(services,clientSocket,serverSocket,capacity)
  return networkIngress.createPump(services.context.ingress,clientSocket,serverSocket,capacity)
end function
function liveSetTime(services,time)
  // Com_Frame writes archived configuration before entering the platform
  // event/network loop.  Keep that hook ahead of packet draining.
  if services.context.commonFrameFn!=void then services.context.commonFrameFn(services.context.frameContext,time) end if
  return networkIngress.setTime(services.context.ingress,time)
end function
function liveDrain(services,pump,budget) return networkPump.drain(pump,budget) end function
function liveServerFrame(services,time,msec)
  if services.context.serverFrameFn!=void then return services.context.serverFrameFn(services.context.frameContext,time,msec) end if
  return void
end function
function liveClientFrame(services,time,msec)
  if services.context.clientFrameFn!=void then return services.context.clientFrameFn(services.context.frameContext,time,msec) end if
  return void
end function

function liveServices(ingress,frameContext,serverFrameFn,clientFrameFn)
  if ingress==void then return error(7000,"desktop frame host: missing ingress") end if
  context=LiveContext(ingress,frameContext,void,serverFrameFn,clientFrameFn)
  return Services(liveStartup,liveOpen,liveBind,liveClose,liveCleanup,
    liveCreatePump,liveSetTime,liveDrain,liveServerFrame,liveClientFrame,context)
end function

function liveServicesWithCommon(ingress,frameContext,commonFrameFn,serverFrameFn,clientFrameFn)
  if ingress==void or commonFrameFn==void then return error(7000,"desktop frame host: missing common frame") end if
  context=LiveContext(ingress,frameContext,commonFrameFn,serverFrameFn,clientFrameFn)
  return Services(liveStartup,liveOpen,liveBind,liveClose,liveCleanup,
    liveCreatePump,liveSetTime,liveDrain,liveServerFrame,liveClientFrame,context)
end function

function validConfig(value)
  if value==void or value.clientEndpoint==void or value.serverEndpoint==void then return false end if
  if value.packetCapacity<1 or value.packetCapacity>65535 then return false end if
  if value.packetBudget<0 or value.maxFrameMsec<1 then return false end if
  if value.clientEndpoint.port<0 or value.clientEndpoint.port>65535 then return false end if
  if value.serverEndpoint.port<0 or value.serverEndpoint.port>65535 then return false end if
  return true
end function

function validServices(value)
  return value!=void and value.startupFn!=void and value.openFn!=void and value.bindFn!=void and
    value.closeFn!=void and value.cleanupFn!=void and value.createPumpFn!=void and
    value.setTimeFn!=void and value.drainFn!=void
end function

// Release every resource that was acquired. Keep attempting later cleanup
// steps if an earlier close reports an error, and return the first failure.
function shutdown(runtime)
  if runtime==void then return error(7000,"desktop frame host: missing runtime") end if
  if not runtime.active and not runtime.udpStarted then return void end if
  runtime.active=false;failure=void
  if runtime.clientSocket!=void then
    socket=runtime.clientSocket;runtime.clientSocket=void;caught=try(runtime.services.closeFn(runtime.services,socket))
    if caught is error and failure==void then failure=caught end if
  end if
  if runtime.serverSocket!=void then
    socket=runtime.serverSocket;runtime.serverSocket=void;caught=try(runtime.services.closeFn(runtime.services,socket))
    if caught is error and failure==void then failure=caught end if
  end if
  if runtime.udpStarted then
    runtime.udpStarted=false;caught=try(runtime.services.cleanupFn(runtime.services))
    if caught is error and failure==void then failure=caught end if
  end if
  if failure!=void then return failure end if
  return void
end function

function start(configuration,services,initialTime)
  if not validConfig(configuration) or not validServices(services) then return error(7000,"desktop frame host: invalid configuration") end if
  if typeof(initialTime)!="int" or initialTime<0 then return error(7000,"desktop frame host: invalid initial time") end if
  runtime=Runtime(configuration,services,void,void,void,void,void,initialTime,0,0,false,false)
  caught=try(services.startupFn(services));if caught is error then return caught end if
  runtime.udpStarted=true
  caught=try(services.openFn(services));if caught is error then shutdown(runtime);return caught end if;runtime.clientSocket=caught
  caught=try(services.openFn(services));if caught is error then shutdown(runtime);return caught end if;runtime.serverSocket=caught
  caught=try(services.bindFn(services,runtime.clientSocket,configuration.clientEndpoint));if caught is error then shutdown(runtime);return caught end if;runtime.clientEndpoint=caught
  caught=try(services.bindFn(services,runtime.serverSocket,configuration.serverEndpoint));if caught is error then shutdown(runtime);return caught end if;runtime.serverEndpoint=caught
  caught=try(services.createPumpFn(services,runtime.clientSocket,runtime.serverSocket,configuration.packetCapacity));if caught is error then shutdown(runtime);return caught end if
  runtime.pump=caught;runtime.active=true;return runtime
end function

// Quake's event loop consumes input before advancing server and client state.
// Time never moves backwards and large desktop stalls are capped per frame.
function frame(runtime,now)
  if runtime==void or not runtime.active then return error(7001,"desktop frame host: inactive runtime") end if
  if typeof(now)!="int" or now<runtime.time then return error(7001,"desktop frame host: invalid frame time") end if
  msec=now-runtime.time;if msec>runtime.config.maxFrameMsec then msec=runtime.config.maxFrameMsec end if
  runtime.time=now
  runtime.services.setTimeFn(runtime.services,now)
  packets=runtime.services.drainFn(runtime.services,runtime.pump,runtime.config.packetBudget)
  if packets<0 or packets>runtime.config.packetBudget then return error(7001,"desktop frame host: invalid pump count") end if
  if runtime.services.serverFrameFn!=void then runtime.services.serverFrameFn(runtime.services,now,msec) end if
  if runtime.services.clientFrameFn!=void then runtime.services.clientFrameFn(runtime.services,now,msec) end if
  runtime.frameNumber=runtime.frameNumber+1;runtime.packetCount=runtime.packetCount+packets
  return FrameResult(runtime.frameNumber,now,msec,packets)
end function
