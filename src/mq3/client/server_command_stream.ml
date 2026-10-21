// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Reliable server-command consumption from CL_GetServerCommand.
package mq3.client.server_command_stream

import mq3.qcommon.command_buffer as command

const MAX_RELIABLE_COMMANDS=64
const BIG_INFO_STRING=8192
const MAX_CONFIGSTRINGS=1024
const CS_SYSTEMINFO=1

struct Services
  context
  configstringFn
  systemInfoFn
  clearNotifyFn
  clearUsercmdsFn
  closeConsoleFn
  queueConsoleFn
  serverRunning
end struct

struct State
  commandState
  configstrings
  commandSequence
  lastExecuted
  commands
  demoPlaying
  bigConfigString
end struct

function services() return Services(void,void,void,void,void,void,void,false) end function
function create(commandState,configstrings)
  if commandState==void then commandState=command.create() end if
  if configstrings==void then configstrings=array(MAX_CONFIGSTRINGS,"") end if
  if len(configstrings)<MAX_CONFIGSTRINGS then return error(6930,"server command stream: configstring table is too small") end if
  return State(commandState,configstrings,0,0,array(MAX_RELIABLE_COMMANDS,""),false,"")
end function

function queue(state,text)
  if state==void or text==void then return error(6930,"server command stream: invalid queued command") end if
  state.commandSequence=state.commandSequence+1
  state.commands[state.commandSequence&(MAX_RELIABLE_COMMANDS-1)]=text
  return state.commandSequence
end function

function setSequence(state,sequence,commands)
  if state==void or sequence<0 or commands==void or len(commands)<MAX_RELIABLE_COMMANDS then return error(6930,"server command stream: invalid synchronized ring") end if
  state.commandSequence=sequence
  for index=0 to MAX_RELIABLE_COMMANDS-1 state.commands[index]=commands[index] end for
  return void
end function

function updateConfigstring(state,host)
  index=toNumber(command.argv(state.commandState,1))
  if index<0 or index>=MAX_CONFIGSTRINGS then return error(6930,"server command stream: bad configstring index") end if
  value=command.argv(state.commandState,2);state.configstrings[index]=value
  if host!=void and host.configstringFn!=void then host.configstringFn(host.context,index,value) end if
  if index==CS_SYSTEMINFO and host!=void and host.systemInfoFn!=void then host.systemInfoFn(host.context) end if
  return void
end function

function tooLong(prefix,value,extra)
  return len(bytes(prefix))+len(bytes(value))+extra>=BIG_INFO_STRING
end function

function get(state,host,number)
  if state==void then return error(6930,"server command stream: missing state") end if
  if number<=state.commandSequence-MAX_RELIABLE_COMMANDS then
    if state.demoPlaying then return false end if
    return error(6930,"server command stream: reliable command cycled out")
  end if
  if number>state.commandSequence then return error(6930,"server command stream: command not received") end if
  text=state.commands[number&(MAX_RELIABLE_COMMANDS-1)];state.lastExecuted=number
  while true
    command.tokenizeString(state.commandState,text);name=command.argv(state.commandState,0);count=command.argc(state.commandState)
    if name=="disconnect" then
      if count>=2 then return error(6931,"Server Disconnected - "+command.argv(state.commandState,1)) end if
      return error(6931,"Server disconnected\n")
    end if
    if name=="bcs0" then
      state.bigConfigString="cs "+command.argv(state.commandState,1)+" \""+command.argv(state.commandState,2);return false
    end if
    if name=="bcs1" then
      part=command.argv(state.commandState,2);if tooLong(state.bigConfigString,part,0) then return error(6930,"server command stream: bcs exceeded BIG_INFO_STRING") end if
      state.bigConfigString=state.bigConfigString+part;return false
    end if
    if name=="bcs2" then
      part=command.argv(state.commandState,2);if tooLong(state.bigConfigString,part,1) then return error(6930,"server command stream: bcs exceeded BIG_INFO_STRING") end if
      state.bigConfigString=state.bigConfigString+part+"\"";text=state.bigConfigString
    else
      break
    end if
  end while
  name=command.argv(state.commandState,0)
  if name=="cs" then
    updateConfigstring(state,host);command.tokenizeString(state.commandState,text);return true
  end if
  if name=="map_restart" then
    if host!=void and host.clearNotifyFn!=void then host.clearNotifyFn(host.context) end if
    if host!=void and host.clearUsercmdsFn!=void then host.clearUsercmdsFn(host.context) end if
    return true
  end if
  if name=="clientLevelShot" then
    if host==void or not host.serverRunning then return false end if
    if host.clearNotifyFn!=void then host.clearNotifyFn(host.context) end if
    if host.closeConsoleFn!=void then host.closeConsoleFn(host.context) end if
    if host.queueConsoleFn!=void then host.queueConsoleFn(host.context,"wait ; wait ; wait ; wait ; screenshot levelshot\n") end if
    return true
  end if
  return true
end function
