// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_InitGameProgs/SV_InitGameVM/SV_RestartGameProgs/SV_ShutdownGameProgs.
package mq3.server.game_vm

const GAME_INIT=0
const GAME_SHUTDOWN=1
const GAME_CLIENT_CONNECT=2
const GAME_CLIENT_BEGIN=3
const GAME_CLIENT_USERINFO_CHANGED=4
const GAME_CLIENT_DISCONNECT=5
const GAME_CLIENT_COMMAND=6
const GAME_CLIENT_THINK=7
const GAME_RUN_FRAME=8
const GAME_CONSOLE_COMMAND=9
const BOTAI_START_FRAME=10

struct Services
  machineRuntime
  syscall
  loadFn
  callFn
  restartFn
  freeFn
  context
  millisecondsFn
  entityStringFn
  clearClientEntityFn
  botEnableFn
end struct

struct State
  host
  slot
  active
  entityParsePoint
  botEnable
  callCount
  lastExport
  lastArgs
end struct

function services(machineRuntime,syscall,loadFn,callFn,restartFn,freeFn)
  return Services(machineRuntime,syscall,loadFn,callFn,restartFn,freeFn,void,void,void,void,void)
end function

function create(host)
  if host==void or host.machineRuntime==void or host.syscall==void or host.loadFn==void or host.callFn==void or host.restartFn==void or host.freeFn==void then return error(3430,"game VM: missing runtime service") end if
  return State(host,void,false,void,0,0,-1,[])
end function

function requireActive(state)
  if state==void or not state.active or state.slot==void then return error(3431,"game VM: module is not active") end if
  return state.slot
end function

function invoke(state,arguments)
  slot=requireActive(state)
  if typeof(arguments)!="array" or len(arguments)==0 then return error(3432,"game VM: missing export") end if
  state.callCount=state.callCount+1;state.lastExport=arguments[0];state.lastArgs=arguments
  host=state.host
  return host.callFn(host.machineRuntime,slot,arguments)
end function

function initializeVm(state,levelTime,maxClients,restart)
  host=state.host
  if maxClients<0 then return error(3432,"game VM: negative client count") end if
  if host.entityStringFn!=void then state.entityParsePoint=host.entityStringFn(host.context) else state.entityParsePoint=void end if
  if host.clearClientEntityFn!=void then
    for index=0 to maxClients-1 host.clearClientEntityFn(host.context,index) end for
  end if
  seed=0;if host.millisecondsFn!=void then seed=host.millisecondsFn(host.context) end if
  flag=0;if restart then flag=1 end if
  return invoke(state,[GAME_INIT,levelTime,seed,flag])
end function

function initialize(state,levelTime,maxClients)
  if state==void or state.active then return error(3432,"game VM: invalid initialization") end if
  host=state.host
  state.botEnable=0;if host.botEnableFn!=void then state.botEnable=host.botEnableFn(host.context) end if
  state.slot=host.loadFn(host.machineRuntime,"qagame",host.syscall);state.active=true
  initializeVm(state,levelTime,maxClients,false)
  return state.slot
end function

function restart(state,levelTime,maxClients)
  slot=requireActive(state)
  invoke(state,[GAME_SHUTDOWN,1])
  state.slot=state.host.restartFn(state.host.machineRuntime,slot)
  initializeVm(state,levelTime,maxClients,true)
  return state.slot
end function

function shutdown(state)
  if state==void then return error(3432,"game VM: missing state") end if
  if not state.active then return void end if
  invoke(state,[GAME_SHUTDOWN,0]);state.host.freeFn(state.host.machineRuntime,state.slot)
  state.slot=void;state.active=false;state.entityParsePoint=void
  return void
end function

function clientConnect(state,clientNum,firstTime,isBot)
  first=0;if firstTime then first=1 end if;bot=0;if isBot then bot=1 end if
  return invoke(state,[GAME_CLIENT_CONNECT,clientNum,first,bot])
end function
function clientBegin(state,clientNum) return invoke(state,[GAME_CLIENT_BEGIN,clientNum]) end function
function clientUserinfoChanged(state,clientNum) return invoke(state,[GAME_CLIENT_USERINFO_CHANGED,clientNum]) end function
function clientDisconnect(state,clientNum) return invoke(state,[GAME_CLIENT_DISCONNECT,clientNum]) end function
function clientCommand(state,clientNum) return invoke(state,[GAME_CLIENT_COMMAND,clientNum]) end function
function clientThink(state,clientNum) return invoke(state,[GAME_CLIENT_THINK,clientNum]) end function
function runFrame(state,levelTime) return invoke(state,[GAME_RUN_FRAME,levelTime]) end function
function consoleCommand(state) return invoke(state,[GAME_CONSOLE_COMMAND]) end function
function botStartFrame(state,time) return invoke(state,[BOTAI_START_FRAME,time]) end function
