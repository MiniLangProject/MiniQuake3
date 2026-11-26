// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Concrete input -> SV_Frame -> CL_Frame desktop composition.
package mq3.platform.engine_loop
import mq3.platform.input_events as inputEvents
import mq3.platform.desktop_frame_host as desktopHost
import mq3.server.frame as serverFrame
import mq3.client.frame as clientLoopFrame
import mq3.qcommon.config_persistence as configPersistence
import mq3.qcommon.cvar_commands as cvarCommands

/// Data record for `mq3.platform.engine_loop.Runtime`; groups `inputQueue`, `inputHandlers`, `inputBudget`, `serverState`, `serverServices`, `clientState`, and 7 further fields.
struct Runtime
  /// Queue from which the engine drains input events.
  inputQueue
  /// Callbacks that receive keyboard, text, mouse, and joystick events.
  inputHandlers
  /// Maximum number of queued input events handled in one frame.
  inputBudget
  /// Mutable state of the server frame pipeline.
  serverState
  /// Host operations supplied to the server frame pipeline.
  serverServices
  /// Mutable state of the client frame pipeline.
  clientState
  /// Host operations supplied to the client frame pipeline.
  clientServices
  /// Number of input events delivered by the engine loop.
  inputCount
  /// Result returned by the most recent server frame.
  lastServerResult
  /// Result returned by the most recent client frame.
  lastClientResult
  /// Sequence count of frames processed by this subsystem.
  frameCount
  /// Runtime state of the console-variable configuration subsystem.
  configState
  /// Runtime state of the command parser and command buffer.
  commandState
end struct

/// Builds `mq3.platform.engine_loop.Runtime` for `mq3.platform.engine_loop.create`.
/// @param inputQueue Initial value for `mq3.platform.engine_loop.Runtime.inputQueue`.
/// @param inputHandlers Initial value for `mq3.platform.engine_loop.Runtime.inputHandlers`.
/// @param inputBudget Initial value for `mq3.platform.engine_loop.Runtime.inputBudget`.
/// @param serverState Initial value for `mq3.platform.engine_loop.Runtime.serverState`.
/// @param serverServices Initial value for `mq3.platform.engine_loop.Runtime.serverServices`.
/// @param clientState Initial value for `mq3.platform.engine_loop.Runtime.clientState`.
/// @param clientServices Initial value for `mq3.platform.engine_loop.Runtime.clientServices`.
function create(inputQueue,inputHandlers,inputBudget,serverState,serverServices,clientState,clientServices)
  if inputQueue==void or inputHandlers==void or serverState==void or serverServices==void or clientState==void or clientServices==void then return error(7120,"engine loop: missing component") end if
  if typeof(inputBudget)!="int" or inputBudget<0 then return error(7120,"engine loop: invalid input budget") end if
  return Runtime(inputQueue,inputHandlers,inputBudget,serverState,serverServices,clientState,clientServices,0,"","",0,void,void)
end function

// Completes the common startup portion after cvars, commands, filesystem and
// client input have initialized.  Baseq3 registers writeconfig during Com_Init
// and only enables automatic writes at the very end of that routine.
/// @param runtime Mutable record or buffer; this call updates `runtime.configState`, `runtime.commandState`.
/// @param configState Mutable record or buffer; this call updates `configState.fullyInitialized`.
/// @param commandState Value assigned to `runtime.commandState`.
function initializeConfiguration(runtime,configState,commandState)
  if runtime==void or configState==void or commandState==void then return error(7120,"engine loop: missing configuration persistence") end if
  if runtime.configState!=void or runtime.commandState!=void then return error(7120,"engine loop: configuration persistence already initialized") end if
  installed=configPersistence.installCommand(configState,commandState);if installed is error then return installed end if
  installed=cvarCommands.install(configState.registry,commandState);if installed is error then return installed end if
  runtime.configState=configState;runtime.commandState=commandState;configState.fullyInitialized=true
  return true
end function

/// Returns `void` from `mq3.platform.engine_loop.commonTick`; earlier branches return `error(7120,"engine loop: missing runtime")`.
/// @param runtime Record providing `runtime.configState`.
/// @param time Unused compatibility argument retained by this entry point.
function commonTick(runtime,time)
  if runtime==void then return error(7120,"engine loop: missing runtime") end if
  if runtime.configState!=void then configPersistence.writeConfiguration(runtime.configState) end if
  return void
end function

// desktop_frame_host calls this after the network pump, preserving Quake's
// event-before-simulation rule.
/// @param runtime Mutable record or buffer; this call updates `runtime.inputCount`, `runtime.lastServerResult`.
/// @param time Value forwarded as `time` to `mq3.platform.engine_loop.commonTick`.
/// @param msec Argument 2 supplied to `mq3.server.frame.run`.
function serverTick(runtime,time,msec)
  if runtime==void then return error(7120,"engine loop: missing runtime") end if
  // Com_Frame persists archive cvars before polling events and simulation.
  commonTick(runtime,time)
  consumed=inputEvents.drain(runtime.inputQueue,runtime.inputHandlers,runtime.inputBudget)
  runtime.inputCount=runtime.inputCount+consumed
  runtime.lastServerResult=serverFrame.run(runtime.serverState,msec,runtime.serverServices)
  return runtime.lastServerResult
end function

/// Updates `runtime.lastClientResult`, `runtime.frameCount` in `mq3.platform.engine_loop.clientTick`; returns `runtime.lastClientResult`.
/// @param runtime Mutable record or buffer; this call updates `runtime.lastClientResult`, `runtime.frameCount`.
/// @param time Unused compatibility argument retained by this entry point.
/// @param msec Argument 2 supplied to `mq3.client.frame.run`.
function clientTick(runtime,time,msec)
  if runtime==void then return error(7120,"engine loop: missing runtime") end if
  runtime.lastClientResult=clientLoopFrame.run(runtime.clientState,msec,runtime.clientServices)
  runtime.frameCount=runtime.frameCount+1
  return runtime.lastClientResult
end function

/// Returns `desktopHost.liveServicesWithCommon(serverIngress,runtime,commonTick,serverTick,clientTick)` from `mq3.platform.engine_loop.liveServices`; earlier branches return `error(7120,"engine loop: missing live component")`.
/// @param runtime Argument 2 supplied to `mq3.platform.desktop_frame_host.liveServicesWithCommon`.
/// @param serverIngress Argument 1 supplied to `mq3.platform.desktop_frame_host.liveServicesWithCommon`.
function liveServices(runtime,serverIngress)
  if runtime==void or serverIngress==void then return error(7120,"engine loop: missing live component") end if
  return desktopHost.liveServicesWithCommon(serverIngress,runtime,commonTick,serverTick,clientTick)
end function
