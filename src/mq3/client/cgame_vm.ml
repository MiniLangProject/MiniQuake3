// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_InitCGame, CL_ShutdownCGame and cgame export calls.
package mq3.client.cgame_vm
import mq3.shared.info as info
import mq3.client.cgame_public as cgame_api

const CG_INIT=cgame_api.CG_INIT
const CG_SHUTDOWN=cgame_api.CG_SHUTDOWN
const CG_CONSOLE_COMMAND=cgame_api.CG_CONSOLE_COMMAND
const CG_DRAW_ACTIVE_FRAME=cgame_api.CG_DRAW_ACTIVE_FRAME
const CG_CROSSHAIR_PLAYER=cgame_api.CG_CROSSHAIR_PLAYER
const CG_LAST_ATTACKER=cgame_api.CG_LAST_ATTACKER
const CG_KEY_EVENT=cgame_api.CG_KEY_EVENT
const CG_MOUSE_EVENT=cgame_api.CG_MOUSE_EVENT
const CG_EVENT_HANDLING=cgame_api.CG_EVENT_HANDLING
const CA_LOADING=6
const CA_PRIMED=7
const KEYCATCH_CGAME=8
const VMI_COMPILED=2

/// Stores client game vm host-service callbacks, including `machineRuntime`, `syscall`, `loadFn`, `callFn`, `freeFn`, `context` and additional values.
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

/// Stores client game vm state, including `host`, `slot`, `active`, `cgameStarted`, `connectionState`, `keyCatchers` and additional values.
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

/// Creates a `mq3.client.cgame_vm.Services` record. Assigns `machineRuntime` from `machineRuntime`, `syscall` from `syscall`, `loadFn` from `loadFn`, `callFn` from `callFn`.
/// @param machineRuntime Value used to initialize `Services.machineRuntime`.
/// @param syscall Value used to initialize `Services.syscall`.
/// @param loadFn Value used to initialize `Services.loadFn`.
/// @param callFn Value used to initialize `Services.callFn`.
/// @param freeFn Value used to initialize `Services.freeFn`.
function services(machineRuntime,syscall,loadFn,callFn,freeFn)
  return Services(machineRuntime,syscall,loadFn,callFn,freeFn,void,void,void,void,void,void,void,void)
end function

/// Calls `mq3.client.cgame_vm.State` from client game vm `create`. The final path returns `State(host,void,false,false,0,0,"",0,0,-1,[])`.
/// @param host Record read through `host.machineRuntime`, `host.syscall`, `host.loadFn`, `host.callFn` and additional values.
function create(host)
  if host==void or host.machineRuntime==void or host.syscall==void or host.loadFn==void or host.callFn==void or host.freeFn==void then return error(3440,"cgame VM: missing runtime service") end if
  return State(host,void,false,false,0,0,"",0,0,-1,[])
end function

/// Evaluates client game vm `requireActive` and returns `error(3441,"cgame VM: module is not active")`, `state.slot` according to its guard/selection conditions.
/// @param state Record read through `state.active`, `state.slot`.
function requireActive(state)
  if state==void or not state.active or state.slot==void then return error(3441,"cgame VM: module is not active") end if
  return state.slot
end function

/// Updates `state.callCount`, `state.lastExport`, `state.lastArgs` during client game vm `invoke`.
/// @param state Mutable client game vm record/storage; this routine assigns `state.callCount`, `state.lastExport`, `state.lastArgs`.
/// @param arguments Sequence read at `arguments[0]`.
function invoke(state,arguments)
  slot=requireActive(state)
  if typeof(arguments)!="array" or len(arguments)==0 then return error(3442,"cgame VM: missing export") end if
  state.callCount=state.callCount+1;state.lastExport=arguments[0];state.lastArgs=arguments
  return state.host.callFn(state.host.machineRuntime,slot,arguments)
end function

/// Updates `state.mapname`, `state.slot`, `state.active`, `state.cgameStarted` and additional values during client game vm `initialize`.
/// @param state Mutable client game vm record/storage; this routine assigns `state.mapname`, `state.slot`, `state.active`, `state.cgameStarted` and additional values.
/// @param serverMessageSequence Sequence number of the received server message.
/// @param lastExecutedServerCommand Value used by `invoke(state,[CG_INIT,serverMessageSequence,lastExecutedServerCommand,clientNum])`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param connectedToPureServer Value used by `if connectedToPureServer!=0 then interpret=VMI_COMPILED end if`.
/// @param vmCgame Value used by `interpret=vmCgame`.
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

/// Updates `state.keyCatchers`, `state.cgameStarted`, `state.slot`, `state.active` during client game vm `shutdown`.
/// @param state Mutable client game vm record/storage; this routine assigns `state.keyCatchers`, `state.cgameStarted`, `state.slot`, `state.active`.
function shutdown(state)
  if state==void then return error(3442,"cgame VM: missing state") end if
  state.keyCatchers=state.keyCatchers & (~KEYCATCH_CGAME);state.cgameStarted=false
  if not state.active then return void end if
  invoke(state,[CG_SHUTDOWN]);state.host.freeFn(state.host.machineRuntime,state.slot)
  state.slot=void;state.active=false;return void
end function

/// Calls `mq3.client.cgame_vm.invoke` from client game vm `consoleCommand`. The final path returns `invoke(state,[CG_CONSOLE_COMMAND])`.
/// @param state Record read through `state.active`.
function consoleCommand(state) if state==void or not state.active then return 0 end if;return invoke(state,[CG_CONSOLE_COMMAND]) end function
/// Calls `mq3.client.cgame_vm.invoke` from client game vm `drawActiveFrame`. The final path returns `invoke(state,[CG_DRAW_ACTIVE_FRAME,serverTime,stereo,demo])`.
/// @param state Shared client game vm state passed to the helper calls in `drawActiveFrame`.
/// @param serverTime Authoritative server timestamp in milliseconds.
/// @param stereo Value used by `return invoke(state,[CG_DRAW_ACTIVE_FRAME,serverTime,stereo,demo])`.
/// @param demoPlaying Value used by `if demoPlaying then demo=1 end if`.
function drawActiveFrame(state,serverTime,stereo,demoPlaying) demo=0;if demoPlaying then demo=1 end if;return invoke(state,[CG_DRAW_ACTIVE_FRAME,serverTime,stereo,demo]) end function
/// Adapts `mq3.client.cgame_vm.invoke` to client game vm `crosshairPlayer`, returning its result for `state, [CG_CROSSHAIR_PLAYER]`.
/// @param state Argument 1 of `mq3.client.cgame_vm.invoke`.
function crosshairPlayer(state) return invoke(state,[CG_CROSSHAIR_PLAYER]) end function
/// Adapts `mq3.client.cgame_vm.invoke` to client game vm `lastAttacker`, returning its result for `state, [CG_LAST_ATTACKER]`.
/// @param state Argument 1 of `mq3.client.cgame_vm.invoke`.
function lastAttacker(state) return invoke(state,[CG_LAST_ATTACKER]) end function
/// Calls `mq3.client.cgame_vm.invoke` from client game vm `keyEvent`. The final path returns `invoke(state,[CG_KEY_EVENT,key,flag])`.
/// @param state Shared client game vm state passed to the helper calls in `keyEvent`.
/// @param key Key or control identifier used to select the corresponding client game vm entry.
/// @param down Whether this event presses the key/button; false represents its release.
function keyEvent(state,key,down) flag=0;if down then flag=1 end if;return invoke(state,[CG_KEY_EVENT,key,flag]) end function
/// Adapts `mq3.client.cgame_vm.invoke` to client game vm `mouseEvent`, returning its result for `state, [CG_MOUSE_EVENT,dx,dy]`.
/// @param state Argument 1 of `mq3.client.cgame_vm.invoke`.
/// @param dx Argument 2 of `mq3.client.cgame_vm.invoke`; passed as `[CG_MOUSE_EVENT,dx,dy]`.
/// @param dy Argument 2 of `mq3.client.cgame_vm.invoke`; passed as `[CG_MOUSE_EVENT,dx,dy]`.
function mouseEvent(state,dx,dy) return invoke(state,[CG_MOUSE_EVENT,dx,dy]) end function
/// Adapts `mq3.client.cgame_vm.invoke` to client game vm `eventHandling`, returning its result for `state, [CG_EVENT_HANDLING,eventType]`.
/// @param state Argument 1 of `mq3.client.cgame_vm.invoke`.
/// @param eventType Argument 2 of `mq3.client.cgame_vm.invoke`; passed as `[CG_EVENT_HANDLING,eventType]`.
function eventHandling(state,eventType) return invoke(state,[CG_EVENT_HANDLING,eventType]) end function
