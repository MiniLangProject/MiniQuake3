// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_InitCGame, CL_ShutdownCGame and cgame export calls.
package mq3.client.cgame_vm
import mq3.shared.info as info
import mq3.client.cgame_public as cgame_api

/// CG VM entry-point ordinal used to initialize the CGame VM.
const CG_INIT=cgame_api.CG_INIT
/// CG VM entry-point ordinal used to shut down the CGame VM.
const CG_SHUTDOWN=cgame_api.CG_SHUTDOWN
/// CG VM entry-point ordinal used to handle a CGame console command.
const CG_CONSOLE_COMMAND=cgame_api.CG_CONSOLE_COMMAND
/// CG VM entry-point ordinal used to render a CGame frame.
const CG_DRAW_ACTIVE_FRAME=cgame_api.CG_DRAW_ACTIVE_FRAME
/// CG VM entry-point ordinal used to query the player currently under the crosshair.
const CG_CROSSHAIR_PLAYER=cgame_api.CG_CROSSHAIR_PLAYER
/// CG VM entry-point ordinal used to query the latest attacker.
const CG_LAST_ATTACKER=cgame_api.CG_LAST_ATTACKER
/// CG VM entry-point ordinal used to deliver a key event to CGame.
const CG_KEY_EVENT=cgame_api.CG_KEY_EVENT
/// CG VM entry-point ordinal used to deliver pointer motion to CGame.
const CG_MOUSE_EVENT=cgame_api.CG_MOUSE_EVENT
/// CG VM entry-point ordinal used to switch CGame event-handling mode.
const CG_EVENT_HANDLING=cgame_api.CG_EVENT_HANDLING
/// Client connection state while level media and game state are being loaded.
const CA_LOADING=6
/// Client connection state with game state loaded, awaiting a playable snapshot.
const CA_PRIMED=7
/// Input-capture bit that routes keyboard events to the cgame subsystem.
const KEYCATCH_CGAME=8
/// VM execution mode selecting the engine's compiled VM path.
const VMI_COMPILED=2

/// Stores client game vm host-service callbacks, including `machineRuntime`, `syscall`, `loadFn`, `callFn`, `freeFn`, `context` and additional values.
struct Services
  /// When constructing this record, `services` supplies `machineRuntime` for this member.
  machineRuntime
  /// When constructing this record, `services` supplies `syscall` for this member.
  syscall
  /// Host callback for the load operation; an unset callback leaves that host operation unavailable.
  loadFn
  /// Host callback for the call operation; an unset callback leaves that host operation unavailable.
  callFn
  /// Host callback for the free operation; an unset callback leaves that host operation unavailable.
  freeFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for CGame virtual-machine
  /// execution.
  context
  /// Host callback for the milliseconds operation; an unset callback leaves that host operation
  /// unavailable.
  millisecondsFn
  /// Host callback for the close console operation; an unset callback leaves that host operation
  /// unavailable.
  closeConsoleFn
  /// Host callback for the server info operation; an unset callback leaves that host operation
  /// unavailable.
  serverInfoFn
  /// Host callback for the end registration operation; an unset callback leaves that host operation
  /// unavailable.
  endRegistrationFn
  /// Host callback for the low memory operation; an unset callback leaves that host operation
  /// unavailable.
  lowMemoryFn
  /// Host callback for the touch memory operation; an unset callback leaves that host operation
  /// unavailable.
  touchMemoryFn
  /// Host callback for the clear notify operation; an unset callback leaves that host operation
  /// unavailable.
  clearNotifyFn
end struct

/// Stores client game vm state, including `host`, `slot`, `active`, `cgameStarted`, `connectionState`, `keyCatchers` and additional values.
struct State
  /// Host-adapter callbacks and context used to execute the module's engine operations.
  host
  /// VM slot index identifying the loaded CGame or UI module in the VM runtime.
  slot
  /// When constructing this record, `create` supplies `false` for this member. Used by `requireActive`
  /// and `initialize` during subsequent processing.
  active
  /// When constructing this record, `create` supplies `false` for this member. Used by `initialize` and
  /// `shutdown` during subsequent processing.
  cgameStarted
  /// Client connection-state identifier controlling handshake, loading, and active-play behavior.
  connectionState
  /// Bitmask selecting which subsystems currently intercept keyboard input.
  keyCatchers
  /// Map name parsed from server information or selected by the client UI.
  mapname
  /// When constructing this record, `create` supplies `0` for this member. Used by `initialize` during
  /// subsequent processing.
  loadMilliseconds
  /// When constructing this record, `create` supplies `0` for this member. Used by `invoke` during
  /// subsequent processing.
  callCount
  /// When constructing this record, `create` supplies `-1` for this member. Used by `invoke` during
  /// subsequent processing.
  lastExport
  /// When constructing this record, `create` supplies an empty list for this member. Used by `invoke`
  /// during subsequent processing.
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
