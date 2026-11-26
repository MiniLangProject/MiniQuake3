// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// SV_InitGameProgs/SV_InitGameVM/SV_RestartGameProgs/SV_ShutdownGameProgs.
package mq3.server.game_vm
import mq3.game.g_public as gpublic

const GAME_INIT=gpublic.GAME_INIT
const GAME_SHUTDOWN=gpublic.GAME_SHUTDOWN
const GAME_CLIENT_CONNECT=gpublic.GAME_CLIENT_CONNECT
const GAME_CLIENT_BEGIN=gpublic.GAME_CLIENT_BEGIN
const GAME_CLIENT_USERINFO_CHANGED=gpublic.GAME_CLIENT_USERINFO_CHANGED
const GAME_CLIENT_DISCONNECT=gpublic.GAME_CLIENT_DISCONNECT
const GAME_CLIENT_COMMAND=gpublic.GAME_CLIENT_COMMAND
const GAME_CLIENT_THINK=gpublic.GAME_CLIENT_THINK
const GAME_RUN_FRAME=gpublic.GAME_RUN_FRAME
const GAME_CONSOLE_COMMAND=gpublic.GAME_CONSOLE_COMMAND
const BOTAI_START_FRAME=gpublic.BOTAI_START_FRAME

/// Services record for server.game_vm, containing `machineRuntime`, `syscall`, `loadFn`, `callFn`, `restartFn`, `freeFn`, and 5 further fields.
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

/// State record for server.game_vm, containing `host`, `slot`, `active`, `entityParsePoint`, `botEnable`, `callCount`, and 2 further fields.
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

/// Create `mq3.server.game_vm.Services` with machineRuntime=machineRuntime; syscall=syscall; loadFn=loadFn; callFn=callFn; 7 further fields.
/// @param machineRuntime Initial `machineRuntime` field stored in the returned or constructed `mq3.server.game_vm.Services` record.
/// @param syscall Initial `syscall` field stored in the returned or constructed `mq3.server.game_vm.Services` record.
/// @param loadFn Initial `loadFn` field stored in the returned or constructed `mq3.server.game_vm.Services` record.
/// @param callFn Initial `callFn` field stored in the returned or constructed `mq3.server.game_vm.Services` record.
/// @param restartFn Initial `restartFn` field stored in the returned or constructed `mq3.server.game_vm.Services` record.
/// @param freeFn Initial `freeFn` field stored in the returned or constructed `mq3.server.game_vm.Services` record.
function services(machineRuntime,syscall,loadFn,callFn,restartFn,freeFn)
  return Services(machineRuntime,syscall,loadFn,callFn,restartFn,freeFn,void,void,void,void,void)
end function

/// Create game vm in server.game_vm; the normal completion returns `State(host, void, false, void, 0, 0, - 1, [])`.
///
/// Validation failures include `game VM: missing runtime service`.
/// @param host Record exposing `machineRuntime`, `syscall`, `loadFn`, `callFn`, `restartFn`, `freeFn`.
function create(host)
  if host==void or host.machineRuntime==void or host.syscall==void or host.loadFn==void or host.callFn==void or host.restartFn==void or host.freeFn==void then return error(3430,"game VM: missing runtime service") end if
  return State(host,void,false,void,0,0,-1,[])
end function

/// Compute require active in server.game_vm; the normal completion returns `state.slot`.
///
/// Validation failures include `game VM: module is not active`.
/// @param state Record exposing `active`, `slot`.
function requireActive(state)
  if state==void or not state.active or state.slot==void then return error(3431,"game VM: module is not active") end if
  return state.slot
end function

/// Update `state.callCount`, `state.lastExport`, `state.lastArgs` in server.game_vm; the normal completion returns `host.callFn(host.machineRuntime, slot, arguments)`.
///
/// Validation failures include `game VM: missing export`.
/// Direct state writes: `state.callCount`, `state.lastExport`, `state.lastArgs`.
/// @param state Record exposing `callCount`, `host`. Updated in place: `callCount`, `lastExport`, `lastArgs`.
/// @param arguments Arguments used in `arguments[0]` and `len(arguments)`.
function invoke(state,arguments)
  slot=requireActive(state)
  if typeof(arguments)!="array" or len(arguments)==0 then return error(3432,"game VM: missing export") end if
  state.callCount=state.callCount+1;state.lastExport=arguments[0];state.lastArgs=arguments
  host=state.host
  return host.callFn(host.machineRuntime,slot,arguments)
end function

/// Update `state.entityParsePoint` in server.game_vm; the normal completion returns `invoke(state, [GAME_INIT, levelTime, seed, flag])`.
///
/// Validation failures include `game VM: negative client count`.
/// Direct state writes: `state.entityParsePoint`.
/// @param state Record exposing `host`. Updated in place: `entityParsePoint`.
/// @param levelTime Level time used in `invoke(state, [GAME_INIT, levelTime, seed, flag])`.
/// @param maxClients Max clients used in `(maxClients < 0)` and `(maxClients - 1)`.
/// @param restart Restart operand used by `initializeVm`; its reads are shown in the implementation.
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

/// Update `state.botEnable`, `state.slot`, `state.active` in server.game_vm; the normal completion returns `state.slot`.
///
/// Validation failures include `game VM: invalid initialization`; `game VM: module load failed`.
/// Direct state writes: `state.botEnable`, `state.slot`, `state.active`.
/// @param state Record exposing `active`, `host`, `slot`. Updated in place: `botEnable`, `slot`, `active`.
/// @param levelTime Level time passed as `levelTime` to `mq3.server.game_vm.initializeVm`.
/// @param maxClients Max clients passed as `maxClients` to `mq3.server.game_vm.initializeVm`.
function initialize(state,levelTime,maxClients)
  if state==void or state.active then return error(3432,"game VM: invalid initialization") end if
  host=state.host
  state.botEnable=0;if host.botEnableFn!=void then state.botEnable=host.botEnableFn(host.context) end if
  state.slot=host.loadFn(host.machineRuntime,"qagame",host.syscall)
  if state.slot is error or state.slot==void then failed=state.slot;state.slot=void;if failed is error then return failed end if;return error(3432,"game VM: module load failed") end if
  state.active=true
  initialized=initializeVm(state,levelTime,maxClients,false)
  if initialized is error then host.freeFn(host.machineRuntime,state.slot);state.slot=void;state.active=false;return initialized end if
  return state.slot
end function

/// Update `state.slot`, `state.active`, `state.entityParsePoint` in server.game_vm; the normal completion returns `state.slot`.
///
/// Validation failures include `game VM: module restart failed`.
/// Direct state writes: `state.slot`, `state.active`, `state.entityParsePoint`.
/// @param state Record exposing `host`, `slot`. Updated in place: `slot`, `active`, `entityParsePoint`.
/// @param levelTime Level time passed as `levelTime` to `mq3.server.game_vm.initializeVm`.
/// @param maxClients Max clients passed as `maxClients` to `mq3.server.game_vm.initializeVm`.
function restart(state,levelTime,maxClients)
  slot=requireActive(state)
  stopped=invoke(state,[GAME_SHUTDOWN,1]);if stopped is error then return stopped end if
  restarted=state.host.restartFn(state.host.machineRuntime,slot)
  if restarted is error or restarted==void then
    failed=restarted;state.host.freeFn(state.host.machineRuntime,slot);state.slot=void;state.active=false;state.entityParsePoint=void
    if failed is error then return failed end if;return error(3432,"game VM: module restart failed")
  end if
  state.slot=restarted
  initialized=initializeVm(state,levelTime,maxClients,true)
  if initialized is error then state.host.freeFn(state.host.machineRuntime,state.slot);state.slot=void;state.active=false;state.entityParsePoint=void;return initialized end if
  return state.slot
end function

/// Update `state.slot`, `state.active`, `state.entityParsePoint` in server.game_vm.
///
/// Validation failures include `game VM: missing state`.
/// Direct state writes: `state.slot`, `state.active`, `state.entityParsePoint`.
/// @param state Record exposing `active`, `host`, `slot`. Updated in place: `slot`, `active`, `entityParsePoint`.
function shutdown(state)
  if state==void then return error(3432,"game VM: missing state") end if
  if not state.active then return void end if
  stopped=invoke(state,[GAME_SHUTDOWN,0]);released=state.host.freeFn(state.host.machineRuntime,state.slot)
  state.slot=void;state.active=false;state.entityParsePoint=void
  if stopped is error then return stopped end if;if released is error then return released end if
  return void
end function

/// Compute client connect in server.game_vm; the normal completion returns `invoke(state, [GAME_CLIENT_CONNECT, clientNum, first, bot])`.
/// @param state State passed as `state` to `mq3.server.game_vm.invoke`.
/// @param clientNum Client num used in `invoke(state, [GAME_CLIENT_CONNECT, clientNum, first, bot])`.
/// @param firstTime First time operand used by `clientConnect`; its reads are shown in the implementation.
/// @param isBot Is bot operand used by `clientConnect`; its reads are shown in the implementation.
function clientConnect(state,clientNum,firstTime,isBot)
  first=0;if firstTime then first=1 end if;bot=0;if isBot then bot=1 end if
  return invoke(state,[GAME_CLIENT_CONNECT,clientNum,first,bot])
end function
/// Return `mq3.server.game_vm.invoke(state, [GAME_CLIENT_BEGIN, clientNum])` from `server.game_vm.clientBegin`.
/// @param state State passed as `state` to `mq3.server.game_vm.invoke`.
/// @param clientNum Client num used in `invoke(state, [GAME_CLIENT_BEGIN, clientNum])`.
function clientBegin(state,clientNum) return invoke(state,[GAME_CLIENT_BEGIN,clientNum]) end function
/// Return `mq3.server.game_vm.invoke(state, [GAME_CLIENT_USERINFO_CHANGED, clientNum])` from `server.game_vm.clientUserinfoChanged`.
/// @param state State passed as `state` to `mq3.server.game_vm.invoke`.
/// @param clientNum Client num used in `invoke(state, [GAME_CLIENT_USERINFO_CHANGED, clientNum])`.
function clientUserinfoChanged(state,clientNum) return invoke(state,[GAME_CLIENT_USERINFO_CHANGED,clientNum]) end function
/// Return `mq3.server.game_vm.invoke(state, [GAME_CLIENT_DISCONNECT, clientNum])` from `server.game_vm.clientDisconnect`.
/// @param state State passed as `state` to `mq3.server.game_vm.invoke`.
/// @param clientNum Client num used in `invoke(state, [GAME_CLIENT_DISCONNECT, clientNum])`.
function clientDisconnect(state,clientNum) return invoke(state,[GAME_CLIENT_DISCONNECT,clientNum]) end function
/// Return `mq3.server.game_vm.invoke(state, [GAME_CLIENT_COMMAND, clientNum])` from `server.game_vm.clientCommand`.
/// @param state State passed as `state` to `mq3.server.game_vm.invoke`.
/// @param clientNum Client num used in `invoke(state, [GAME_CLIENT_COMMAND, clientNum])`.
function clientCommand(state,clientNum) return invoke(state,[GAME_CLIENT_COMMAND,clientNum]) end function
/// Return `mq3.server.game_vm.invoke(state, [GAME_CLIENT_THINK, clientNum])` from `server.game_vm.clientThink`.
/// @param state State passed as `state` to `mq3.server.game_vm.invoke`.
/// @param clientNum Client num used in `invoke(state, [GAME_CLIENT_THINK, clientNum])`.
function clientThink(state,clientNum) return invoke(state,[GAME_CLIENT_THINK,clientNum]) end function
/// Return `mq3.server.game_vm.invoke(state, [GAME_RUN_FRAME, levelTime])` from `server.game_vm.runFrame`.
/// @param state State passed as `state` to `mq3.server.game_vm.invoke`.
/// @param levelTime Level time used in `invoke(state, [GAME_RUN_FRAME, levelTime])`.
function runFrame(state,levelTime) return invoke(state,[GAME_RUN_FRAME,levelTime]) end function
/// Return `mq3.server.game_vm.invoke(state, [GAME_CONSOLE_COMMAND])` from `server.game_vm.consoleCommand`.
/// @param state State passed as `state` to `mq3.server.game_vm.invoke`.
function consoleCommand(state) return invoke(state,[GAME_CONSOLE_COMMAND]) end function
/// Return `mq3.server.game_vm.invoke(state, [BOTAI_START_FRAME, time])` from `server.game_vm.botStartFrame`.
/// @param state State passed as `state` to `mq3.server.game_vm.invoke`.
/// @param time Time used in `invoke(state, [BOTAI_START_FRAME, time])`.
function botStartFrame(state,time) return invoke(state,[BOTAI_START_FRAME,time]) end function
