// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/q3_ui/ui_main.c (the UI QVM export surface).
package mq3.client.ui_main

const UI_GETAPIVERSION=0
const UI_INIT=1
const UI_SHUTDOWN=2
const UI_KEY_EVENT=3
const UI_MOUSE_EVENT=4
const UI_REFRESH=5
const UI_IS_FULLSCREEN=6
const UI_SET_ACTIVE_MENU=7
const UI_CONSOLE_COMMAND=8
const UI_DRAW_CONNECT_SCREEN=9
const UI_HASUNIQUECDKEY=10
const UI_API_VERSION=6
const CVAR_ARCHIVE=1
const CVAR_INIT=16
const CVAR_LATCH=32
const CVAR_ROM=64

struct CvarSpec name defaultValue flags value modificationCount registered updateCount end struct
struct HostAction boundary kind name args dispatched end struct
struct DispatchResult value action end struct
struct State cvars actions initialized shutdown keyEvents mouseEvents refreshTimes activeMenus connectScreens fullscreenResult consoleResult retailQvmActive end struct

function spec(name,defaultValue,flags) return CvarSpec(name,defaultValue,flags,defaultValue,0,false,0) end function
function cvarTable()
  rows=[spec("ui_ffa_fraglimit","20",CVAR_ARCHIVE),spec("ui_ffa_timelimit","0",CVAR_ARCHIVE),spec("ui_tourney_fraglimit","0",CVAR_ARCHIVE),spec("ui_tourney_timelimit","15",CVAR_ARCHIVE),spec("ui_team_fraglimit","0",CVAR_ARCHIVE),spec("ui_team_timelimit","20",CVAR_ARCHIVE),spec("ui_team_friendly","1",CVAR_ARCHIVE),spec("ui_ctf_capturelimit","8",CVAR_ARCHIVE),spec("ui_ctf_timelimit","30",CVAR_ARCHIVE),spec("ui_ctf_friendly","0",CVAR_ARCHIVE)]
  rows=rows+[spec("g_arenasFile","",CVAR_INIT|CVAR_ROM),spec("g_botsFile","",CVAR_INIT|CVAR_ROM),spec("g_spScores1","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spScores2","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spScores3","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spScores4","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spScores5","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spAwards","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spVideos","",CVAR_ARCHIVE|CVAR_ROM),spec("g_spSkill","2",CVAR_ARCHIVE|CVAR_LATCH),spec("ui_spSelection","",CVAR_ROM)]
  rows=rows+[spec("ui_browserMaster","0",CVAR_ARCHIVE),spec("ui_browserGameType","0",CVAR_ARCHIVE),spec("ui_browserSortKey","4",CVAR_ARCHIVE),spec("ui_browserShowFull","1",CVAR_ARCHIVE),spec("ui_browserShowEmpty","1",CVAR_ARCHIVE),spec("cg_brassTime","2500",CVAR_ARCHIVE),spec("cg_drawCrosshair","4",CVAR_ARCHIVE),spec("cg_drawCrosshairNames","1",CVAR_ARCHIVE),spec("cg_marks","1",CVAR_ARCHIVE)]
  for i=1 to 16 rows=rows+[spec("server"+str(i),"",CVAR_ARCHIVE)] end for
  return rows+[spec("ui_cdkeychecked","0",CVAR_ROM)]
end function
function create(retailQvmActive) return State(cvarTable(),[],false,false,[],[],[],[],[],0,0,retailQvmActive) end function
function hostAction(state,boundary,kind,name,args) value=HostAction(boundary,kind,name,args,not state.retailQvmActive);state.actions=state.actions+[value];return value end function
function arg(args,index) if index<0 or index>=len(args) then return 0 end if;return args[index] end function
function result(value,action) return DispatchResult(value,action) end function

// UI_RegisterCvars
function UI_RegisterCvars(state)
  for each cv in state.cvars cv.registered=true;hostAction(state,"cvar","register",cv.name,[cv.defaultValue,cv.flags]) end for;return len(state.cvars)
end function

// UI_UpdateCvars
function UI_UpdateCvars(state)
  for each cv in state.cvars cv.updateCount=cv.updateCount+1;hostAction(state,"cvar","update",cv.name,[]) end for;return len(state.cvars)
end function

// vmMain
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
