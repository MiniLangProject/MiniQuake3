// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_main.c (the UI QVM export surface).
package mq3.client.ui_main

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
/// UI virtual-machine interface version expected by the engine.
const UI_API_VERSION=6
/// Configuration-variable attribute that persists the value in the user's saved configuration.
const CVAR_ARCHIVE=1
/// Configuration-variable attribute allowing initialization-time assignment but rejecting later
/// ordinary changes.
const CVAR_INIT=16
/// Configuration-variable attribute deferring a changed value until the relevant restart or
/// reinitialization.
const CVAR_LATCH=32
/// Configuration-variable attribute restricting writes to engine-controlled updates.
const CVAR_ROM=64

/// Stores UI main cvar spec record, including `name`, `defaultValue`, `flags`, `value`, `modificationCount`, `registered` and additional values.
struct CvarSpec
  /// Engine configuration-variable name used to read, update, or register this setting.
  name
  /// When constructing this record, `spec` supplies `defaultValue` for this member.
  defaultValue
  /// When constructing this record, `spec` supplies `flags` for this member.
  flags
  /// Current or default setting value held by this configuration variable or UI control.
  value
  /// When constructing this record, `spec` supplies `0` for this member.
  modificationCount
  /// True once the referenced media resources have been registered with the engine.
  registered
  /// When constructing this record, `spec` supplies `0` for this member.
  updateCount
end struct
/// Stores UI main host action record, including `boundary`, `kind`, `name`, `args`, `dispatched`.
struct HostAction
  /// Host service category recorded with a request emitted while dispatching base-game UI entry points
  /// to engine services.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while dispatching base-game
  /// UI entry points to engine services.
  kind
  /// Target resource, command, or setting name addressed by this queued host action.
  name
  /// When constructing this record, `hostAction` supplies `args` for this member.
  args
  /// True when this request is marked for native dispatch while dispatching base-game UI entry points
  /// to engine services; false when its native effect is suppressed.
  dispatched
end struct
/// Stores UI main dispatch result record, including `value`, `action`.
struct DispatchResult
  /// Return value of the dispatched base-game UI entry point, separate from the host action it records.
  value
  /// When constructing this record, `result` supplies `action` for this member.
  action
end struct
/// Stores UI main state, including `cvars`, `actions`, `initialized`, `shutdown`, `keyEvents`, `mouseEvents` and additional values.
struct State
  /// Configuration-variable values exposed to the native UI implementation.
  cvars
  /// Host requests queued while dispatching base-game UI entry points to engine services, retained in
  /// request order.
  actions
  /// True after the UI_INIT entry point and cleared by UI_SHUTDOWN in the base-game dispatcher.
  initialized
  /// When constructing this record, `create` supplies `false` for this member. Used by `vmMain` during
  /// subsequent processing.
  shutdown
  /// When constructing this record, `create` supplies an empty list for this member. Used by `vmMain`
  /// during subsequent processing.
  keyEvents
  /// When constructing this record, `create` supplies an empty list for this member. Used by `vmMain`
  /// during subsequent processing.
  mouseEvents
  /// When constructing this record, `create` supplies an empty list for this member. Used by `vmMain`
  /// during subsequent processing.
  refreshTimes
  /// When constructing this record, `create` supplies an empty list for this member. Used by `vmMain`
  /// during subsequent processing.
  activeMenus
  /// When constructing this record, `create` supplies an empty list for this member. Used by `vmMain`
  /// during subsequent processing.
  connectScreens
  /// When constructing this record, `create` supplies `0` for this member. Used by `vmMain` during
  /// subsequent processing.
  fullscreenResult
  /// When constructing this record, `create` supplies `0` for this member. Used by `vmMain` during
  /// subsequent processing.
  consoleResult
  /// When constructing this record, `create` supplies `retailQvmActive` for this member. Used by
  /// `hostAction` during subsequent processing.
  retailQvmActive
end struct

/// Creates a `mq3.client.ui_main.CvarSpec` record. Assigns `name` from `name`, `defaultValue` from `defaultValue`, `flags` from `flags`, `value` from `defaultValue`.
/// @param name Value used to initialize `CvarSpec.name`.
/// @param defaultValue Value used to initialize `CvarSpec.defaultValue`, `CvarSpec.value`.
/// @param flags Value used to initialize `CvarSpec.flags`.
function spec(name,defaultValue,flags) return CvarSpec(name,defaultValue,flags,defaultValue,0,false,0) end function
/// Calls `mq3.client.ui_main.spec` from UI main `cvarTable`. The final path returns `rows+[spec("ui_cdkeychecked","0",CVAR_ROM)]`.
function cvarTable()
  rows=[spec("ui_ffa_fraglimit","20",CVAR_ARCHIVE),spec("ui_ffa_timelimit","0",CVAR_ARCHIVE),spec("ui_tourney_fraglimit","0",CVAR_ARCHIVE),spec("ui_tourney_timelimit","15",CVAR_ARCHIVE),spec("ui_team_fraglimit","0",CVAR_ARCHIVE),spec("ui_team_timelimit","20",CVAR_ARCHIVE),spec("ui_team_friendly","1",CVAR_ARCHIVE),spec("ui_ctf_capturelimit","8",CVAR_ARCHIVE),spec("ui_ctf_timelimit","30",CVAR_ARCHIVE),spec("ui_ctf_friendly","0",CVAR_ARCHIVE)]
  rows=rows+[spec("g_arenasFile","",CVAR_INIT|CVAR_ROM),spec("g_botsFile","",CVAR_INIT|CVAR_ROM),spec("g_spScores1","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spScores2","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spScores3","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spScores4","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spScores5","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spAwards","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spVideos","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spSkill","2",CVAR_ARCHIVE|CVAR_LATCH),spec("ui_spSelection","",CVAR_ROM)]
  rows=rows+[spec("ui_browserMaster","0",CVAR_ARCHIVE),spec("ui_browserGameType","0",CVAR_ARCHIVE),spec("ui_browserSortKey","4",CVAR_ARCHIVE),spec("ui_browserShowFull","1",CVAR_ARCHIVE),spec("ui_browserShowEmpty","1",CVAR_ARCHIVE),spec("cg_brassTime","2500",CVAR_ARCHIVE),spec("cg_drawCrosshair","4",CVAR_ARCHIVE),spec("cg_drawCrosshairNames","1",CVAR_ARCHIVE),spec("cg_marks","1",CVAR_ARCHIVE)]
  for i=1 to 16 rows=rows+[spec("server"+str(i),"",CVAR_ARCHIVE)] end for
  return rows+[spec("ui_cdkeychecked","0",CVAR_ROM)]
end function
/// Creates a `mq3.client.ui_main.State` record. Assigns `retailQvmActive` from `retailQvmActive`.
/// @param retailQvmActive Value used to initialize `State.retailQvmActive`.
function create(retailQvmActive) return State(cvarTable(),[],false,false,[],[],[],[],[],0,0,retailQvmActive) end function
/// Updates `state.actions` during UI main `hostAction`.
/// @param state Mutable UI main record/storage; this routine assigns `state.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param name Name used to select or register the corresponding UI main resource.
/// @param args Value used by `value=HostAction(boundary,kind,name,args,not state.retailQvmActive)`.
function hostAction(state,boundary,kind,name,args) value=HostAction(boundary,kind,name,args,not state.retailQvmActive);state.actions=state.actions+[value];return value end function
/// Evaluates UI main `arg` and returns `0`, `args[index]` according to its guard/selection conditions.
/// @param args Sequence read at `args[index]`.
/// @param index Value tested by `index<0 or index>=len(args)` before the calculation continues.
function arg(args,index) if index<0 or index>=len(args) then return 0 end if;return args[index] end function
/// Creates a `mq3.client.ui_main.DispatchResult` record. Assigns `value` from `value`, `action` from `action`.
/// @param value Value used to initialize `DispatchResult.value`.
/// @param action Value used to initialize `DispatchResult.action`.
function result(value,action) return DispatchResult(value,action) end function

// UI_RegisterCvars
/// @param state Record read through `state.cvars`.
function UI_RegisterCvars(state)
  for each cv in state.cvars cv.registered=true;hostAction(state,"cvar","register",cv.name,[cv.defaultValue,cv.flags]) end for;return len(state.cvars)
end function

// UI_UpdateCvars
/// @param state Record read through `state.cvars`.
function UI_UpdateCvars(state)
  for each cv in state.cvars cv.updateCount=cv.updateCount+1;hostAction(state,"cvar","update",cv.name,[]) end for;return len(state.cvars)
end function

// vmMain
/// @param state Mutable UI main record/storage; this routine assigns `state.initialized`, `state.shutdown`, `state.keyEvents`, `state.mouseEvents` and additional values.
/// @param command Value used by `if command==UI_GETAPIVERSION then return result(UI_API_VERSION,void) end if`.
/// @param args Value used by `if typeof(args)!="array" then return error(7894,"ui vmMain arguments must be an array") end if`.
function vmMain(state,command,args)
  if state==void then return error(7894,"ui vmMain requires state") end if;if typeof(args)!="array" then return error(7894,"ui vmMain arguments must be an array") end if;call=void
  if command==UI_GETAPIVERSION then return result(UI_API_VERSION,void) end if
  if command==UI_INIT then state.initialized=true;state.shutdown=false;call=hostAction(state,"ui","init","UI_Init",[]);return result(0,call) end if
  if command==UI_SHUTDOWN then state.shutdown=true;state.initialized=false;call=hostAction(state,"ui","shutdown","UI_Shutdown",[]);return result(0,call) end if
  if command==UI_KEY_EVENT then values=[arg(args,0),arg(args,1)];state.keyEvents=state.keyEvents+[values];call=hostAction(state,"ui","key-event","UI_KeyEvent",values);return result(0,call) end if
  if command==UI_MOUSE_EVENT then values=[arg(args,0),arg(args,1)];state.mouseEvents=state.mouseEvents+[values];call=hostAction(state,"ui","mouse-event","UI_MouseEvent",values);return result(0,call) end if
  if command==UI_REFRESH then value=arg(args,0);state.refreshTimes=state.refreshTimes+[value];call=hostAction(state,"ui","refresh","UI_Refresh",[value]);return result(0,call) end if
  if command==UI_IS_FULLSCREEN then call=hostAction(state,"ui","query-fullscreen","UI_IsFullscreen",[]);return result(state.fullscreenResult,call) end if
  if command==UI_SET_ACTIVE_MENU then value=arg(args,0);state.activeMenus=state.activeMenus+[value];call=hostAction(state,"ui","set-active-menu","UI_SetActiveMenu",[value]);return result(0,call) end if
  if command==UI_CONSOLE_COMMAND then value=arg(args,0);call=hostAction(state,"ui","console-command","UI_ConsoleCommand",[value]);return result(state.consoleResult,call) end if
  if command==UI_DRAW_CONNECT_SCREEN then value=arg(args,0);state.connectScreens=state.connectScreens+[value];call=hostAction(state,"ui","draw-connect-screen","UI_DrawConnectScreen",[value]);return result(0,call) end if
  if command==UI_HASUNIQUECDKEY then return result(1,void) end if
  return result(-1,void)
end function
