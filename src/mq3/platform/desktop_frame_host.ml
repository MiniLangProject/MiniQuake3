// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Desktop ownership boundary around UDP and the Quake client/server frame loop.
package mq3.platform.desktop_frame_host
import mq3.platform.udp as udp
import mq3.qcommon.network_pump as networkPump
import mq3.server.network_ingress as networkIngress

/// Data record for `mq3.platform.desktop_frame_host.Config`; groups `clientEndpoint`, `serverEndpoint`, `packetCapacity`, `packetBudget`, `maxFrameMsec`.
struct Config
  /// Local or remote endpoint used by the client transport.
  clientEndpoint
  /// Local or remote endpoint used by the server transport.
  serverEndpoint
  /// Maximum payload size accepted by the frame host's packet buffer.
  packetCapacity
  /// Maximum number of packets drained during one host frame.
  packetBudget
  /// Upper bound on the elapsed milliseconds passed to one frame step.
  maxFrameMsec
end struct

// All effects are explicit so startup rollback and frame ordering can be
// checked without substituting the protocol or UDP implementations.
struct Services
  /// Host callback used to perform startup operations for this subsystem.
  startupFn
  /// Host callback used to perform open operations for this subsystem.
  openFn
  /// Host callback used to perform bind operations for this subsystem.
  bindFn
  /// Host callback used to perform close operations for this subsystem.
  closeFn
  /// Host callback used to perform cleanup operations for this subsystem.
  cleanupFn
  /// Host callback used to perform create pump operations for this subsystem.
  createPumpFn
  /// Host callback used to perform set time operations for this subsystem.
  setTimeFn
  /// Host callback used to perform drain operations for this subsystem.
  drainFn
  /// Host callback used to perform server frame operations for this subsystem.
  serverFrameFn
  /// Host callback used to perform client frame operations for this subsystem.
  clientFrameFn
  /// State supplied to the UDP lifecycle, packet-pump, and engine-frame callbacks.
  context
end struct

/// Callback table for `mq3.platform.desktop_frame_host.LiveContext`; exposes `ingress`, `frameContext`, `commonFrameFn`, `serverFrameFn`, `clientFrameFn`.
struct LiveContext
  /// Ingress adapter that delivers received packets to the common frame loop.
  ingress
  /// Host state passed to common, server, and client frame callbacks.
  frameContext
  /// Host callback used to perform common frame operations for this subsystem.
  commonFrameFn
  /// Host callback used to perform server frame operations for this subsystem.
  serverFrameFn
  /// Host callback used to perform client frame operations for this subsystem.
  clientFrameFn
end struct
/// Data record for `mq3.platform.desktop_frame_host.Runtime`; groups `config`, `services`, `clientSocket`, `serverSocket`, `clientEndpoint`, `serverEndpoint`, and 6 further fields.
struct Runtime
  /// Configuration values used to initialize or drive this subsystem.
  config
  /// Injected host operations used by this subsystem.
  services
  /// Socket used for the client side of the local host.
  clientSocket
  /// Socket used for the server side of the local host.
  serverSocket
  /// Local or remote endpoint used by the client transport.
  clientEndpoint
  /// Local or remote endpoint used by the server transport.
  serverEndpoint
  /// Packet pump used to drain transport events into the engine.
  pump
  /// Current host clock in milliseconds, advanced before packet draining and engine frame callbacks.
  time
  /// Sequence number identifying the current host frame.
  frameNumber
  /// Number of packets processed by the frame host.
  packetCount
  /// Whether this object is currently active and accepts processing.
  active
  /// Whether the UDP transport has completed startup.
  udpStarted
end struct
/// Data record for `mq3.platform.desktop_frame_host.FrameResult`; groups `number`, `time`, `msec`, `packets`.
struct FrameResult
  /// Sequence number of the host frame represented by this result.
  number
  /// Host clock in milliseconds recorded for the completed desktop frame.
  time
  /// Elapsed duration of the operation or frame, in milliseconds.
  msec
  /// Network packets received or processed by this result.
  packets
end struct

/// Constructs `mq3.platform.desktop_frame_host.Config` from `clientEndpoint`, `serverEndpoint`, `packetCapacity`, `packetBudget`, `maxFrameMsec`.
/// @param clientEndpoint Initial value for `mq3.platform.desktop_frame_host.Config.clientEndpoint`.
/// @param serverEndpoint Initial value for `mq3.platform.desktop_frame_host.Config.serverEndpoint`.
/// @param packetCapacity Initial value for `mq3.platform.desktop_frame_host.Config.packetCapacity`.
/// @param packetBudget Initial value for `mq3.platform.desktop_frame_host.Config.packetBudget`.
/// @param maxFrameMsec Initial value for `mq3.platform.desktop_frame_host.Config.maxFrameMsec`.
function config(clientEndpoint,serverEndpoint,packetCapacity,packetBudget,maxFrameMsec)
  return Config(clientEndpoint,serverEndpoint,packetCapacity,packetBudget,maxFrameMsec)
end function

/// Calls `mq3.platform.udp.startup` with `()` and returns its result.
/// @param services Unused compatibility argument retained by this entry point.
function liveStartup(services) return udp.startup() end function
/// Calls `mq3.platform.udp.open` with `()` and returns its result.
/// @param services Unused compatibility argument retained by this entry point.
function liveOpen(services) return udp.open() end function
/// Calls `mq3.platform.udp.bind` with `(socket,endpoint)` and returns its result.
/// @param services Unused compatibility argument retained by this entry point.
/// @param socket Argument 1 supplied to `mq3.platform.udp.bind`.
/// @param endpoint Argument 2 supplied to `mq3.platform.udp.bind`.
function liveBind(services,socket,endpoint) return udp.bind(socket,endpoint) end function
/// Calls `mq3.platform.udp.close` with `(socket)` and returns its result.
/// @param services Unused compatibility argument retained by this entry point.
/// @param socket Argument 1 supplied to `mq3.platform.udp.close`.
function liveClose(services,socket) return udp.close(socket) end function
/// Calls `mq3.platform.udp.cleanup` with `()` and returns its result.
/// @param services Unused compatibility argument retained by this entry point.
function liveCleanup(services) return udp.cleanup() end function
/// Calls `mq3.server.network_ingress.createPump` with `(services.context.ingress,clientSocket,serverSocket,capacity)` and returns its result.
/// @param services Record providing `services.context`.
/// @param clientSocket Argument 2 supplied to `mq3.server.network_ingress.createPump`.
/// @param serverSocket Argument 3 supplied to `mq3.server.network_ingress.createPump`.
/// @param capacity Argument 4 supplied to `mq3.server.network_ingress.createPump`.
function liveCreatePump(services,clientSocket,serverSocket,capacity)
  return networkIngress.createPump(services.context.ingress,clientSocket,serverSocket,capacity)
end function
/// Returns `networkIngress.setTime(services.context.ingress,time)` from `mq3.platform.desktop_frame_host.liveSetTime`.
/// @param services Record providing `services.context`.
/// @param time Argument 2 supplied to `services.context.commonFrameFn`.
function liveSetTime(services,time)
  // Com_Frame writes archived configuration before entering the platform
  // event/network loop.  Keep that hook ahead of packet draining.
  if services.context.commonFrameFn!=void then services.context.commonFrameFn(services.context.frameContext,time) end if
  return networkIngress.setTime(services.context.ingress,time)
end function
/// Calls `mq3.qcommon.network_pump.drain` with `(pump,budget)` and returns its result.
/// @param services Unused compatibility argument retained by this entry point.
/// @param pump Argument 1 supplied to `mq3.qcommon.network_pump.drain`.
/// @param budget Argument 2 supplied to `mq3.qcommon.network_pump.drain`.
function liveDrain(services,pump,budget) return networkPump.drain(pump,budget) end function
/// Returns `void` from `mq3.platform.desktop_frame_host.liveServerFrame`; earlier branches return `services.context.serverFrameFn(services.context.frameContext,time,msec)`.
/// @param services Record providing `services.context`.
/// @param time Argument 2 supplied to `services.context.serverFrameFn`.
/// @param msec Argument 3 supplied to `services.context.serverFrameFn`.
function liveServerFrame(services,time,msec)
  if services.context.serverFrameFn!=void then return services.context.serverFrameFn(services.context.frameContext,time,msec) end if
  return void
end function
/// Returns `void` from `mq3.platform.desktop_frame_host.liveClientFrame`; earlier branches return `services.context.clientFrameFn(services.context.frameContext,time,msec)`.
/// @param services Record providing `services.context`.
/// @param time Argument 2 supplied to `services.context.clientFrameFn`.
/// @param msec Argument 3 supplied to `services.context.clientFrameFn`.
function liveClientFrame(services,time,msec)
  if services.context.clientFrameFn!=void then return services.context.clientFrameFn(services.context.frameContext,time,msec) end if
  return void
end function

/// Builds `mq3.platform.desktop_frame_host.Services` for `mq3.platform.desktop_frame_host.liveServices`.
/// @param ingress Value used for `mq3.platform.desktop_frame_host.LiveContext.ingress`.
/// @param frameContext Value used for `mq3.platform.desktop_frame_host.LiveContext.frameContext`.
/// @param serverFrameFn Value used for `mq3.platform.desktop_frame_host.LiveContext.serverFrameFn`.
/// @param clientFrameFn Value used for `mq3.platform.desktop_frame_host.LiveContext.clientFrameFn`.
function liveServices(ingress,frameContext,serverFrameFn,clientFrameFn)
  if ingress==void then return error(7000,"desktop frame host: missing ingress") end if
  context=LiveContext(ingress,frameContext,void,serverFrameFn,clientFrameFn)
  return Services(liveStartup,liveOpen,liveBind,liveClose,liveCleanup,
    liveCreatePump,liveSetTime,liveDrain,liveServerFrame,liveClientFrame,context)
end function

/// Builds `mq3.platform.desktop_frame_host.Services` for `mq3.platform.desktop_frame_host.liveServicesWithCommon`.
/// @param ingress Value used for `mq3.platform.desktop_frame_host.LiveContext.ingress`.
/// @param frameContext Value used for `mq3.platform.desktop_frame_host.LiveContext.frameContext`.
/// @param commonFrameFn Value used for `mq3.platform.desktop_frame_host.LiveContext.commonFrameFn`.
/// @param serverFrameFn Value used for `mq3.platform.desktop_frame_host.LiveContext.serverFrameFn`.
/// @param clientFrameFn Value used for `mq3.platform.desktop_frame_host.LiveContext.clientFrameFn`.
function liveServicesWithCommon(ingress,frameContext,commonFrameFn,serverFrameFn,clientFrameFn)
  if ingress==void or commonFrameFn==void then return error(7000,"desktop frame host: missing common frame") end if
  context=LiveContext(ingress,frameContext,commonFrameFn,serverFrameFn,clientFrameFn)
  return Services(liveStartup,liveOpen,liveBind,liveClose,liveCleanup,
    liveCreatePump,liveSetTime,liveDrain,liveServerFrame,liveClientFrame,context)
end function

/// Checks endpoint presence, UDP capacities/budgets, frame timing, and endpoint port ranges.
/// @param value Record providing `value.clientEndpoint`, `value.serverEndpoint`, `value.packetCapacity`, `value.packetBudget`, `value.maxFrameMsec`.
function validConfig(value)
  if value==void or value.clientEndpoint==void or value.serverEndpoint==void then return false end if
  if value.packetCapacity<1 or value.packetCapacity>65535 then return false end if
  if value.packetBudget<0 or value.maxFrameMsec<1 then return false end if
  if value.clientEndpoint.port<0 or value.clientEndpoint.port>65535 then return false end if
  if value.serverEndpoint.port<0 or value.serverEndpoint.port>65535 then return false end if
  return true
end function

/// Computes `validServices` from `value!=void and value.startupFn!=void and value.openFn!=void and value.bindFn!=void and`.
/// @param value Record providing `value.startupFn`, `value.openFn`, `value.bindFn`, `value.closeFn`, `value.cleanupFn`, `value.createPumpFn`.
function validServices(value)
  return value!=void and value.startupFn!=void and value.openFn!=void and value.bindFn!=void and
    value.closeFn!=void and value.cleanupFn!=void and value.createPumpFn!=void and
    value.setTimeFn!=void and value.drainFn!=void
end function

// Release every resource that was acquired. Keep attempting later cleanup
// steps if an earlier close reports an error, and return the first failure.
/// @param runtime Mutable record or buffer; this call updates `runtime.active`, `runtime.clientSocket`, `runtime.serverSocket`, `runtime.udpStarted`.
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

/// Builds `runtime.udpStarted`, `runtime.clientSocket`, `runtime.serverSocket`, `runtime.clientEndpoint`, `runtime.serverEndpoint` in `mq3.platform.desktop_frame_host.start`; returns `runtime`.
/// @param configuration Record providing `configuration.clientEndpoint`, `configuration.serverEndpoint`, `configuration.packetCapacity`.
/// @param services Record providing `services.startupFn`, `services.openFn`, `services.bindFn`, `services.createPumpFn`.
/// @param initialTime Value used for `mq3.platform.desktop_frame_host.Runtime.time`.
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
/// @param runtime Mutable record or buffer; this call updates `runtime.time`, `runtime.frameNumber`, `runtime.packetCount`.
/// @param now Initial value for `mq3.platform.desktop_frame_host.FrameResult.time`.
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
