// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_InitUI, CL_ShutdownUI and uiExport_t calls.
package mq3.client.ui_vm

/// UI VM entry-point ordinal used to query the UI VM interface version.
const UI_GETAPIVERSION=0
/// UI VM entry-point ordinal used to initialize the UI VM.
const UI_INIT=1
/// UI VM entry-point ordinal used to shut down the UI VM.
const UI_SHUTDOWN=2
/// UI VM entry-point ordinal used to deliver a key event to the UI.
const UI_KEY_EVENT=3
/// UI VM entry-point ordinal used to deliver pointer motion to the UI.
const UI_MOUSE_EVENT=4
/// UI VM entry-point ordinal used to advance and render the UI.
const UI_REFRESH=5
/// UI VM entry-point ordinal used to query whether the UI covers the game view.
const UI_IS_FULLSCREEN=6
/// UI VM entry-point ordinal used to select the active UI menu.
const UI_SET_ACTIVE_MENU=7
/// UI VM entry-point ordinal used to handle a UI console command.
const UI_CONSOLE_COMMAND=8
/// UI VM entry-point ordinal used to render the connection-progress screen.
const UI_DRAW_CONNECT_SCREEN=9
/// UI VM entry-point ordinal used to query whether the UI requires a unique product key.
const UI_HASUNIQUECDKEY=10
/// UI interface version associated with the native product-key support contract.
const UI_CD_API_VERSION=3
/// Legacy UI interface version accepted by the engine adapter.
const UI_OLD_API_VERSION=4
/// UI virtual-machine interface version expected by the engine.
const UI_API_VERSION=6
/// UI keyboard-capture mask used when testing whether keyboard input belongs to the UI virtual machine.
const KEYCATCH_UI=2
/// Client connection state while waiting for authorization to contact the server.
const CA_AUTHORIZING=2
/// Connection-state value for normal gameplay after game-state loading, defined for dispatching UI
/// operations in the context of the client's game state.
const CA_ACTIVE=8
/// VM execution mode selecting the engine's compiled VM path.
const VMI_COMPILED=2

/// Stores UI vm host-service callbacks, including `machineRuntime`, `syscall`, `loadFn`, `callFn`, `freeFn`.
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
end struct
/// Stores UI vm state, including `host`, `slot`, `active`, `uiStarted`, `keyCatchers`, `apiVersion` and additional values.
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
  uiStarted
  /// Bitmask selecting which subsystems currently intercept keyboard input.
  keyCatchers
  /// When constructing this record, `create` supplies `0` for this member. Used by `initialize` during
  /// subsequent processing.
  apiVersion
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

/// Creates a `mq3.client.ui_vm.Services` record. Assigns `machineRuntime` from `machineRuntime`, `syscall` from `syscall`, `loadFn` from `loadFn`, `callFn` from `callFn`.
/// @param machineRuntime Value used to initialize `Services.machineRuntime`.
/// @param syscall Value used to initialize `Services.syscall`.
/// @param loadFn Value used to initialize `Services.loadFn`.
/// @param callFn Value used to initialize `Services.callFn`.
/// @param freeFn Value used to initialize `Services.freeFn`.
function services(machineRuntime,syscall,loadFn,callFn,freeFn)
  return Services(machineRuntime,syscall,loadFn,callFn,freeFn)
end function
/// Calls `mq3.client.ui_vm.State` from UI vm `create`. The final path returns `State(host,void,false,false,0,0,0,-1,[])`.
/// @param host Record read through `host.machineRuntime`, `host.syscall`, `host.loadFn`, `host.callFn` and additional values.
function create(host)
  if host==void or host.machineRuntime==void or host.syscall==void or host.loadFn==void or host.callFn==void or host.freeFn==void then return error(3450,"UI VM: missing runtime service") end if
  return State(host,void,false,false,0,0,0,-1,[])
end function
/// Evaluates UI vm `requireActive` and returns `error(3451,"UI VM: module is not active")`, `state.slot` according to its guard/selection conditions.
/// @param state Record read through `state.active`, `state.slot`.
function requireActive(state)
  if state==void or not state.active or state.slot==void then return error(3451,"UI VM: module is not active") end if
  return state.slot
end function
/// Updates `state.callCount`, `state.lastExport`, `state.lastArgs` during UI vm `invoke`.
/// @param state Mutable UI vm record/storage; this routine assigns `state.callCount`, `state.lastExport`, `state.lastArgs`.
/// @param arguments Sequence read at `arguments[0]`.
function invoke(state,arguments)
  slot=requireActive(state);if typeof(arguments)!="array" or len(arguments)==0 then return error(3452,"UI VM: missing export") end if
  state.callCount=state.callCount+1;state.lastExport=arguments[0];state.lastArgs=arguments
  return state.host.callFn(state.host.machineRuntime,slot,arguments)
end function
/// Updates `state.slot`, `state.active`, `state.apiVersion`, `state.uiStarted` during UI vm `initialize`.
/// @param state Mutable UI vm record/storage; this routine assigns `state.slot`, `state.active`, `state.apiVersion`, `state.uiStarted`.
/// @param connectionState Value used by `if connectionState>=CA_AUTHORIZING and connectionState<CA_ACTIVE then connecting=1 end if`.
/// @param connectedToPureServer Value used by `if connectedToPureServer!=0 then mode=VMI_COMPILED end if`.
/// @param vmUi Value used by `mode=vmUi`.
function initialize(state,connectionState,connectedToPureServer,vmUi)
  if state==void or state.active then return error(3452,"UI VM: invalid initialization") end if
  mode=vmUi;if connectedToPureServer!=0 then mode=VMI_COMPILED end if
  state.slot=state.host.loadFn(state.host.machineRuntime,"ui",state.host.syscall,mode)
  if state.slot is error or state.slot==void then failed=state.slot;state.slot=void;if failed is error then return failed end if;return error(3452,"UI VM: module load failed") end if
  state.active=true
  version=invoke(state,[UI_GETAPIVERSION]);state.apiVersion=version
  if version is error or (version!=UI_CD_API_VERSION and version!=UI_OLD_API_VERSION and version!=UI_API_VERSION) then
    state.host.freeFn(state.host.machineRuntime,state.slot);state.slot=void;state.active=false;state.uiStarted=false
    if version is error then return version end if;return error(3452,"UI VM: unsupported API version "+str(version))
  end if
  connecting=0;if connectionState>=CA_AUTHORIZING and connectionState<CA_ACTIVE then connecting=1 end if
  initialized=invoke(state,[UI_INIT,connecting]);if initialized is error then state.host.freeFn(state.host.machineRuntime,state.slot);state.slot=void;state.active=false;return initialized end if;state.uiStarted=true;return state.slot
end function
/// Updates `state.keyCatchers`, `state.uiStarted`, `state.slot`, `state.active` during UI vm `shutdown`.
/// @param state Mutable UI vm record/storage; this routine assigns `state.keyCatchers`, `state.uiStarted`, `state.slot`, `state.active`.
function shutdown(state)
  if state==void then return error(3452,"UI VM: missing state") end if
  state.keyCatchers=state.keyCatchers & (~KEYCATCH_UI);state.uiStarted=false
  if not state.active then return void end if
  stopped=invoke(state,[UI_SHUTDOWN]);released=state.host.freeFn(state.host.machineRuntime,state.slot);state.slot=void;state.active=false
  if stopped is error then return stopped end if;if released is error then return released end if;return void
end function
/// Calls `mq3.client.ui_vm.invoke` from UI vm `keyEvent`. The final path returns `invoke(state,[UI_KEY_EVENT,key,flag])`.
/// @param state Shared UI vm state passed to the helper calls in `keyEvent`.
/// @param key Key or control identifier used to select the corresponding UI vm entry.
/// @param down Whether this event presses the key/button; false represents its release.
function keyEvent(state,key,down) flag=0;if down then flag=1 end if;return invoke(state,[UI_KEY_EVENT,key,flag]) end function
/// Adapts `mq3.client.ui_vm.invoke` to UI vm `mouseEvent`, returning its result for `state, [UI_MOUSE_EVENT,dx,dy]`.
/// @param state Argument 1 of `mq3.client.ui_vm.invoke`.
/// @param dx Argument 2 of `mq3.client.ui_vm.invoke`; passed as `[UI_MOUSE_EVENT,dx,dy]`.
/// @param dy Argument 2 of `mq3.client.ui_vm.invoke`; passed as `[UI_MOUSE_EVENT,dx,dy]`.
function mouseEvent(state,dx,dy) return invoke(state,[UI_MOUSE_EVENT,dx,dy]) end function
/// Adapts `mq3.client.ui_vm.invoke` to UI vm `refresh`, returning its result for `state, [UI_REFRESH,time]`.
/// @param state Argument 1 of `mq3.client.ui_vm.invoke`.
/// @param time Argument 2 of `mq3.client.ui_vm.invoke`; passed as `[UI_REFRESH,time]`.
function refresh(state,time) return invoke(state,[UI_REFRESH,time]) end function
/// Calls `mq3.client.ui_vm.invoke` from UI vm `isFullscreen`.
/// @param state Shared UI vm state passed to the helper calls in `isFullscreen`.
function isFullscreen(state) if invoke(state,[UI_IS_FULLSCREEN])!=0 then return true end if;return false end function
/// Adapts `mq3.client.ui_vm.invoke` to UI vm `setActiveMenu`, returning its result for `state, [UI_SET_ACTIVE_MENU,menu]`.
/// @param state Argument 1 of `mq3.client.ui_vm.invoke`.
/// @param menu Argument 2 of `mq3.client.ui_vm.invoke`; passed as `[UI_SET_ACTIVE_MENU,menu]`.
function setActiveMenu(state,menu) return invoke(state,[UI_SET_ACTIVE_MENU,menu]) end function
/// Calls `mq3.client.ui_vm.invoke` from UI vm `consoleCommand`. The final path returns `invoke(state,[UI_CONSOLE_COMMAND,realtime])`.
/// @param state Record read through `state.active`.
/// @param realtime Current client real-time clock in milliseconds.
function consoleCommand(state,realtime) if state==void or not state.active then return 0 end if;return invoke(state,[UI_CONSOLE_COMMAND,realtime]) end function
/// Calls `mq3.client.ui_vm.invoke` from UI vm `drawConnectScreen`. The final path returns `invoke(state,[UI_DRAW_CONNECT_SCREEN,flag])`.
/// @param state Shared UI vm state passed to the helper calls in `drawConnectScreen`.
/// @param overlay Value used by `if overlay then flag=1 end if`.
function drawConnectScreen(state,overlay) flag=0;if overlay then flag=1 end if;return invoke(state,[UI_DRAW_CONNECT_SCREEN,flag]) end function
/// Calls `mq3.client.ui_vm.invoke` from UI vm `usesUniqueCdKey`.
/// @param state Record read through `state.active`.
function usesUniqueCdKey(state) if state==void or not state.active then return false end if;if invoke(state,[UI_HASUNIQUECDKEY])==1 then return true end if;return false end function
