// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_SystemInfoChanged policy from client/cl_parse.c.
package mq3.client.system_info
import mq3.shared.info as info
import mq3.compat.textnumbers as textnumbers
import mq3.client.gamestate as gamestate
import std.string as strings

struct State serverId demoPlaying connectedPure end struct
struct Services cheatResetFn loadedPaksFn referencedPaksFn setCvarFn getCvarFn context end struct
struct Binding state services end struct

function create() return State(0,false,0) end function
function services() return Services(void,void,void,void,void,void) end function

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

function gamestateChanged(gameState)
  if gameState.context==void or not (gameState.context is Binding) then return error(6941,"systeminfo: missing gamestate binding") end if
  binding=gameState.context
  return apply(binding.state,binding.services,gamestate.configString(gameState,1))
end function

function install(gameState,state,host)
  if gameState==void then return error(6942,"systeminfo: missing gamestate") end if
  gameState.context=Binding(state,host);gameState.systemInfoFn=gamestateChanged
  return void
end function
