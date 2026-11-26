// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_SystemInfoChanged policy from client/cl_parse.c.
package mq3.client.system_info
import mq3.shared.info as info
import mq3.compat.textnumbers as textnumbers
import mq3.client.gamestate as gamestate
import std.string as strings

/// Stores system info state, including `serverId`, `demoPlaying`, `connectedPure`.
struct State serverId demoPlaying connectedPure end struct
/// Stores system info host-service callbacks, including `cheatResetFn`, `loadedPaksFn`, `referencedPaksFn`, `setCvarFn`, `getCvarFn`, `context`.
struct Services cheatResetFn loadedPaksFn referencedPaksFn setCvarFn getCvarFn context end struct
/// Stores system info binding record, including `state`, `services`.
struct Binding state services end struct

/// Creates a `mq3.client.system_info.State` record. Initializes the record with the defaults written in this constructor.
function create() return State(0,false,0) end function
/// Creates a `mq3.client.system_info.Services` record. Initializes the record with the defaults written in this constructor.
function services() return Services(void,void,void,void,void,void) end function

/// Calls `std.string.split` from system info `pairs`. The final path returns `result`.
/// @param systemInfo Value used by `fields=strings.split(systemInfo,"\\")`.
function pairs(systemInfo)
  fields=strings.split(systemInfo,"\\");index=0;if len(fields)>0 and fields[0]=="" then index=1 end if
  result=[]
  while index<len(fields)
    key=fields[index];value="";if index+1<len(fields) then value=fields[index+1] end if
    if key!="" then result=result+[[key,value]] end if
    index=index+2
  end while
  return result
end function

/// Updates `state.serverId`, `state.connectedPure` during system info `apply`.
/// @param state Mutable system info record/storage; this routine assigns `state.serverId`, `state.connectedPure`.
/// @param host Record read through `host.cheatResetFn`, `host.loadedPaksFn`, `host.referencedPaksFn`, `host.setCvarFn` and additional values.
/// @param systemInfo Value used by `state.serverId=textnumbers.atoi(info.value(systemInfo,"sv_serverid"))`.
function apply(state,host,systemInfo)
  if state==void or host==void then return error(6940,"systeminfo: missing state or services") end if
  state.serverId=textnumbers.atoi(info.value(systemInfo,"sv_serverid"))
  if state.demoPlaying then return 0 end if
  if textnumbers.atoi(info.value(systemInfo,"sv_cheats"))==0 and host.cheatResetFn!=void then host.cheatResetFn(host) end if
  if host.loadedPaksFn!=void then host.loadedPaksFn(host,info.value(systemInfo,"sv_paks"),info.value(systemInfo,"sv_pakNames")) end if
  if host.referencedPaksFn!=void then host.referencedPaksFn(host,info.value(systemInfo,"sv_referencedPaks"),info.value(systemInfo,"sv_referencedPakNames")) end if
  gameSet=false;values=pairs(systemInfo)
  for each item in values
    if strings.equalsIgnoreCaseAscii(item[0],"fs_game") then gameSet=true end if
    if host.setCvarFn!=void then host.setCvarFn(host,item[0],item[1]) end if
  end for
  if not gameSet and host.getCvarFn!=void and host.getCvarFn(host,"fs_game")!="" and host.setCvarFn!=void then host.setCvarFn(host,"fs_game","") end if
  pureText=info.value(systemInfo,"sv_pure")
  if host.getCvarFn!=void then pureText=host.getCvarFn(host,"sv_pure") end if
  state.connectedPure=textnumbers.truncDouble32(textnumbers.atof32(pureText))
  return len(values)
end function

/// Calls `mq3.client.system_info.apply`, `mq3.client.gamestate.configString` from system info `gamestateChanged`. The final path returns `apply(binding.state,binding.services,gamestate.configString(gameState,1))`.
/// @param gameState Record read through `gameState.context`.
function gamestateChanged(gameState)
  if gameState.context==void or not (gameState.context is Binding) then return error(6941,"systeminfo: missing gamestate binding") end if
  binding=gameState.context
  return apply(binding.state,binding.services,gamestate.configString(gameState,1))
end function

/// Updates `gameState.context`, `gameState.systemInfoFn` during system info `install`.
/// @param gameState Mutable system info record/storage; this routine assigns `gameState.context`, `gameState.systemInfoFn`.
/// @param state Shared system info state passed to the helper calls in `install`.
/// @param host host record passed to the system info helper calls.
function install(gameState,state,host)
  if gameState==void then return error(6942,"systeminfo: missing gamestate") end if
  gameState.context=Binding(state,host);gameState.systemInfoFn=gamestateChanged
  return void
end function
