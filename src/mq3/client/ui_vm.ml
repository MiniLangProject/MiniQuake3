// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_InitUI, CL_ShutdownUI and uiExport_t calls.
package mq3.client.ui_vm

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
const UI_CD_API_VERSION=3
const UI_OLD_API_VERSION=4
const UI_API_VERSION=6
const KEYCATCH_UI=2
const CA_AUTHORIZING=2
const CA_ACTIVE=8
const VMI_COMPILED=2

struct Services machineRuntime syscall loadFn callFn freeFn end struct
struct State host slot active uiStarted keyCatchers apiVersion callCount lastExport lastArgs end struct

function services(machineRuntime,syscall,loadFn,callFn,freeFn)
  return Services(machineRuntime,syscall,loadFn,callFn,freeFn)
end function
function create(host)
  if host==void or host.machineRuntime==void or host.syscall==void or host.loadFn==void or host.callFn==void or host.freeFn==void then return error(3450,"UI VM: missing runtime service") end if
  return State(host,void,false,false,0,0,0,-1,[])
end function
function requireActive(state)
  if state==void or not state.active or state.slot==void then return error(3451,"UI VM: module is not active") end if
  return state.slot
end function
function invoke(state,arguments)
  slot=requireActive(state);if typeof(arguments)!="array" or len(arguments)==0 then return error(3452,"UI VM: missing export") end if
  state.callCount=state.callCount+1;state.lastExport=arguments[0];state.lastArgs=arguments
  return state.host.callFn(state.host.machineRuntime,slot,arguments)
end function
function initialize(state,connectionState,connectedToPureServer,vmUi)
  if state==void or state.active then return error(3452,"UI VM: invalid initialization") end if
  mode=vmUi;if connectedToPureServer!=0 then mode=VMI_COMPILED end if
  state.slot=state.host.loadFn(state.host.machineRuntime,"ui",state.host.syscall,mode);state.active=true
  version=invoke(state,[UI_GETAPIVERSION]);state.apiVersion=version
  if version!=UI_CD_API_VERSION and version!=UI_OLD_API_VERSION and version!=UI_API_VERSION then state.uiStarted=false;return error(3452,"UI VM: unsupported API version "+str(version)) end if
  connecting=0;if connectionState>=CA_AUTHORIZING and connectionState<CA_ACTIVE then connecting=1 end if
  invoke(state,[UI_INIT,connecting]);state.uiStarted=true;return state.slot
end function
function shutdown(state)
  if state==void then return error(3452,"UI VM: missing state") end if
  state.keyCatchers=state.keyCatchers & (~KEYCATCH_UI);state.uiStarted=false
  if not state.active then return void end if
  invoke(state,[UI_SHUTDOWN]);state.host.freeFn(state.host.machineRuntime,state.slot);state.slot=void;state.active=false;return void
end function
function keyEvent(state,key,down) flag=0;if down then flag=1 end if;return invoke(state,[UI_KEY_EVENT,key,flag]) end function
function mouseEvent(state,dx,dy) return invoke(state,[UI_MOUSE_EVENT,dx,dy]) end function
function refresh(state,time) return invoke(state,[UI_REFRESH,time]) end function
function isFullscreen(state) if invoke(state,[UI_IS_FULLSCREEN])!=0 then return true end if;return false end function
function setActiveMenu(state,menu) return invoke(state,[UI_SET_ACTIVE_MENU,menu]) end function
function consoleCommand(state,realtime) if state==void or not state.active then return 0 end if;return invoke(state,[UI_CONSOLE_COMMAND,realtime]) end function
function drawConnectScreen(state,overlay) flag=0;if overlay then flag=1 end if;return invoke(state,[UI_DRAW_CONNECT_SCREEN,flag]) end function
function usesUniqueCdKey(state) if state==void or not state.active then return false end if;if invoke(state,[UI_HASUNIQUECDKEY])==1 then return true end if;return false end function
