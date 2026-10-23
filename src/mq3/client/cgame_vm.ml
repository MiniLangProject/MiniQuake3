// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_InitCGame, CL_ShutdownCGame and cgame export calls.
package mq3.client.cgame_vm
import mq3.shared.info as info
import mq3.client.cgame_public as public

const CG_INIT=public.CG_INIT
const CG_SHUTDOWN=public.CG_SHUTDOWN
const CG_CONSOLE_COMMAND=public.CG_CONSOLE_COMMAND
const CG_DRAW_ACTIVE_FRAME=public.CG_DRAW_ACTIVE_FRAME
const CG_CROSSHAIR_PLAYER=public.CG_CROSSHAIR_PLAYER
const CG_LAST_ATTACKER=public.CG_LAST_ATTACKER
const CG_KEY_EVENT=public.CG_KEY_EVENT
const CG_MOUSE_EVENT=public.CG_MOUSE_EVENT
const CG_EVENT_HANDLING=public.CG_EVENT_HANDLING
const CA_LOADING=6
const CA_PRIMED=7
const KEYCATCH_CGAME=8
const VMI_COMPILED=2

struct Services
  machineRuntime
  syscall
  loadFn
  callFn
  freeFn
  context
  millisecondsFn
  closeConsoleFn
  serverInfoFn
  endRegistrationFn
  lowMemoryFn
  touchMemoryFn
  clearNotifyFn
end struct

struct State
  host
  slot
  active
  cgameStarted
  connectionState
  keyCatchers
  mapname
  loadMilliseconds
  callCount
  lastExport
  lastArgs
end struct

function services(machineRuntime,syscall,loadFn,callFn,freeFn)
  return Services(machineRuntime,syscall,loadFn,callFn,freeFn,void,void,void,void,void,void,void,void)
end function

function create(host)
  if host==void or host.machineRuntime==void or host.syscall==void or host.loadFn==void or host.callFn==void or host.freeFn==void then return error(3440,"cgame VM: missing runtime service") end if
  return State(host,void,false,false,0,0,"",0,0,-1,[])
end function

function requireActive(state)
  if state==void or not state.active or state.slot==void then return error(3441,"cgame VM: module is not active") end if
  return state.slot
end function

function invoke(state,arguments)
  slot=requireActive(state)
  if typeof(arguments)!="array" or len(arguments)==0 then return error(3442,"cgame VM: missing export") end if
  state.callCount=state.callCount+1;state.lastExport=arguments[0];state.lastArgs=arguments
  return state.host.callFn(state.host.machineRuntime,slot,arguments)
end function

function initialize(state,serverMessageSequence,lastExecutedServerCommand,clientNum,connectedToPureServer,vmCgame)
  if state==void or state.active then return error(3442,"cgame VM: invalid initialization") end if
  host=state.host;t1=0;if host.millisecondsFn!=void then t1=host.millisecondsFn(host.context) end if
  if host.closeConsoleFn!=void then host.closeConsoleFn(host.context) end if
  serverInfo="";if host.serverInfoFn!=void then serverInfo=host.serverInfoFn(host.context) end if
  state.mapname="maps/"+info.value(serverInfo,"mapname")+".bsp"
  interpret=vmCgame;if connectedToPureServer!=0 then interpret=VMI_COMPILED end if
  state.slot=host.loadFn(host.machineRuntime,"cgame",host.syscall,interpret);state.active=true;state.cgameStarted=true
  state.connectionState=CA_LOADING
  invoke(state,[CG_INIT,serverMessageSequence,lastExecutedServerCommand,clientNum])
  state.connectionState=CA_PRIMED
  t2=t1;if host.millisecondsFn!=void then t2=host.millisecondsFn(host.context) end if;state.loadMilliseconds=t2-t1
  if host.endRegistrationFn!=void then host.endRegistrationFn(host.context) end if
  low=false;if host.lowMemoryFn!=void then low=host.lowMemoryFn(host.context) end if
  if not low and host.touchMemoryFn!=void then host.touchMemoryFn(host.context) end if
  if host.clearNotifyFn!=void then host.clearNotifyFn(host.context) end if
  return state.slot
end function

function shutdown(state)
  if state==void then return error(3442,"cgame VM: missing state") end if
  state.keyCatchers=state.keyCatchers & (~KEYCATCH_CGAME);state.cgameStarted=false
  if not state.active then return void end if
  invoke(state,[CG_SHUTDOWN]);state.host.freeFn(state.host.machineRuntime,state.slot)
  state.slot=void;state.active=false;return void
end function

function consoleCommand(state) if state==void or not state.active then return 0 end if;return invoke(state,[CG_CONSOLE_COMMAND]) end function
function drawActiveFrame(state,serverTime,stereo,demoPlaying) demo=0;if demoPlaying then demo=1 end if;return invoke(state,[CG_DRAW_ACTIVE_FRAME,serverTime,stereo,demo]) end function
function crosshairPlayer(state) return invoke(state,[CG_CROSSHAIR_PLAYER]) end function
function lastAttacker(state) return invoke(state,[CG_LAST_ATTACKER]) end function
function keyEvent(state,key,down) flag=0;if down then flag=1 end if;return invoke(state,[CG_KEY_EVENT,key,flag]) end function
function mouseEvent(state,dx,dy) return invoke(state,[CG_MOUSE_EVENT,dx,dy]) end function
function eventHandling(state,eventType) return invoke(state,[CG_EVENT_HANDLING,eventType]) end function
