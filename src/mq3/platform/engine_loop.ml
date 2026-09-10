// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Concrete input -> SV_Frame -> CL_Frame desktop composition.
package mq3.platform.engine_loop
import mq3.platform.input_events as inputEvents
import mq3.platform.desktop_frame_host as desktopHost
import mq3.server.frame as serverFrame
import mq3.client.frame as clientFrame

struct Runtime inputQueue inputHandlers inputBudget serverState serverServices clientState clientServices inputCount lastServerResult lastClientResult frameCount end struct

function create(inputQueue,inputHandlers,inputBudget,serverState,serverServices,clientState,clientServices)
  if inputQueue==void or inputHandlers==void or serverState==void or serverServices==void or clientState==void or clientServices==void then return error(7120,"engine loop: missing component") end if
  if typeof(inputBudget)!="int" or inputBudget<0 then return error(7120,"engine loop: invalid input budget") end if
  return Runtime(inputQueue,inputHandlers,inputBudget,serverState,serverServices,clientState,clientServices,0,"","",0)
end function

// desktop_frame_host calls this after the network pump, preserving Quake's
// event-before-simulation rule.
function serverTick(runtime,time,msec)
  if runtime==void then return error(7120,"engine loop: missing runtime") end if
  consumed=inputEvents.drain(runtime.inputQueue,runtime.inputHandlers,runtime.inputBudget)
  runtime.inputCount=runtime.inputCount+consumed
  runtime.lastServerResult=serverFrame.run(runtime.serverState,msec,runtime.serverServices)
  return runtime.lastServerResult
end function

function clientTick(runtime,time,msec)
  if runtime==void then return error(7120,"engine loop: missing runtime") end if
  runtime.lastClientResult=clientFrame.run(runtime.clientState,msec,runtime.clientServices)
  runtime.frameCount=runtime.frameCount+1
  return runtime.lastClientResult
end function

function liveServices(runtime,serverIngress)
  if runtime==void or serverIngress==void then return error(7120,"engine loop: missing live component") end if
  return desktopHost.liveServices(serverIngress,runtime,serverTick,clientTick)
end function
