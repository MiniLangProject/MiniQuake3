// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Reliable server-command consumption from CL_GetServerCommand.
package mq3.client.server_command_stream

import mq3.qcommon.command_buffer as command

/// Capacity limit for the reliable commands collection or bounded storage used by this client module.
const MAX_RELIABLE_COMMANDS=64
/// Capacity limit for extended engine info strings.
const BIG_INFO_STRING=8192
/// Capacity limit for the configstrings collection or bounded storage used by this client module.
const MAX_CONFIGSTRINGS=1024
/// Server configuration-string index for systeminfo; shared by the client and game protocol.
const CS_SYSTEMINFO=1

/// Stores server command stream host-service callbacks, including `context`, `configstringFn`, `systemInfoFn`, `clearNotifyFn`, `clearUsercmdsFn`, `closeConsoleFn` and additional values.
struct Services
  /// Caller-supplied value forwarded unchanged to the service callbacks for reliable server-command
  /// delivery.
  context
  /// Host callback for the configstring operation; an unset callback leaves that host operation
  /// unavailable.
  configstringFn
  /// Host callback for the system info operation; an unset callback leaves that host operation
  /// unavailable.
  systemInfoFn
  /// Host callback for the clear notify operation; an unset callback leaves that host operation
  /// unavailable.
  clearNotifyFn
  /// Host callback for the clear usercmds operation; an unset callback leaves that host operation
  /// unavailable.
  clearUsercmdsFn
  /// Host callback for the close console operation; an unset callback leaves that host operation
  /// unavailable.
  closeConsoleFn
  /// Host callback for the queue console operation; an unset callback leaves that host operation
  /// unavailable.
  queueConsoleFn
  /// True when a local game server is running in the same engine instance.
  serverRunning
end struct

/// Stores server command stream state, including `commandState`, `configstrings`, `commandSequence`, `lastExecuted`, `commands`, `demoPlaying` and additional values.
struct State
  /// When constructing this record, `create` supplies `commandState` for this member. Used by
  /// `updateConfigstring` and `get` during subsequent processing.
  commandState
  /// Server configuration strings indexed by the native protocol's configuration-string identifiers.
  configstrings
  /// When constructing this record, `create` supplies `0` for this member. Used by `queue` and
  /// `setSequence` during subsequent processing.
  commandSequence
  /// When constructing this record, `create` supplies `0` for this member. Used by `get` during
  /// subsequent processing.
  lastExecuted
  /// When constructing this record, `create` supplies `array(MAX_RELIABLE_COMMANDS,"")` for this
  /// member. Used by `queue` and `setSequence` during subsequent processing.
  commands
  /// True while the client receives its game data from a recorded demo.
  demoPlaying
  /// When constructing this record, `create` supplies an empty string for this member. Used by `get`
  /// during subsequent processing.
  bigConfigString
end struct

/// Creates a `mq3.client.server_command_stream.Services` record. Initializes the record with the defaults written in this constructor.
function services() return Services(void,void,void,void,void,void,void,false) end function
/// Creates the reliable server-command consumer with a 64-command ring and validates the configstring table capacity.
/// @param commandState commandState record passed to the server command stream helper calls.
/// @param configstrings Sequence whose length/content is inspected by `create`.
function create(commandState,configstrings)
  if commandState==void then commandState=command.create() end if
  if configstrings==void then configstrings=array(MAX_CONFIGSTRINGS,"") end if
  if len(configstrings)<MAX_CONFIGSTRINGS then return error(6930,"server command stream: configstring table is too small") end if
  return State(commandState,configstrings,0,0,array(MAX_RELIABLE_COMMANDS,""),false,"")
end function

/// Appends a reliable server command to the sequence ring and returns its assigned sequence number.
/// @param state Mutable server command stream record/storage; this routine assigns `state.commandSequence`, `state.commands[state.commandSequence&(MAX_RELIABLE_COMMANDS-1)]`.
/// @param text Text consumed or emitted by `queue` in the server command stream path.
function queue(state,text)
  if state==void or text==void then return error(6930,"server command stream: invalid queued command") end if
  state.commandSequence=state.commandSequence+1
  state.commands[state.commandSequence&(MAX_RELIABLE_COMMANDS-1)]=text
  return state.commandSequence
end function

/// Copies a validated external reliable-command ring and its current sequence into the consumer state.
/// @param state Mutable server command stream record/storage; this routine assigns `state.commandSequence`, `state.commands[index]`.
/// @param sequence Value assigned to `state.commandSequence`.
/// @param commands Mutable sequence; this routine writes `commands[index]`.
function setSequence(state,sequence,commands)
  if state==void or sequence<0 or commands==void or len(commands)<MAX_RELIABLE_COMMANDS then return error(6930,"server command stream: invalid synchronized ring") end if
  state.commandSequence=sequence
  for index=0 to MAX_RELIABLE_COMMANDS-1 state.commands[index]=commands[index] end for
  return void
end function

/// Applies the tokenized configstring command and notifies configstring/system-info callbacks as required.
/// @param state Mutable server command stream record/storage; this routine assigns `state.configstrings[index]`.
/// @param host Record read through `host.configstringFn`, `host.context`, `host.systemInfoFn`.
function updateConfigstring(state,host)
  index=toNumber(command.argv(state.commandState,1))
  if index<0 or index>=MAX_CONFIGSTRINGS then return error(6930,"server command stream: bad configstring index") end if
  value=command.argv(state.commandState,2);state.configstrings[index]=value
  if host!=void and host.configstringFn!=void then host.configstringFn(host.context,index,value) end if
  if index==CS_SYSTEMINFO and host!=void and host.systemInfoFn!=void then host.systemInfoFn(host.context) end if
  return void
end function

/// Checks whether a configstring fragment plus reserved terminator space reaches the BIG_INFO_STRING byte limit.
/// @param prefix Value used by `return len(bytes(prefix))+len(bytes(value))+extra>=BIG_INFO_STRING`.
/// @param value Value used by `return len(bytes(prefix))+len(bytes(value))+extra>=BIG_INFO_STRING`.
/// @param extra Additional bytes reserved for quoting or termination when testing the 8,192-byte configstring limit.
function tooLong(prefix,value,extra)
  return len(bytes(prefix))+len(bytes(value))+extra>=BIG_INFO_STRING
end function

/// Consumes a numbered reliable command, assembles bcs fragments, updates configstrings and handles disconnect/map-restart/levelshot commands.
/// @param state Mutable server command stream record/storage; this routine assigns `state.lastExecuted`, `state.bigConfigString`.
/// @param host Optional callbacks for configstrings, system-info changes, map-restart cleanup and local levelshot commands.
/// @param number Reliable sequence to consume; commands beyond the received sequence are rejected, and expired ring entries fail outside demo playback.
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
