// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Reliable-command and snapshot dispatch from client/cl_parse.c.
package mq3.client.server_message
import mq3.qcommon.message as message
import mq3.client.snapshot_command as snapshotCommand

const MAX_RELIABLE_COMMANDS=64
const SVC_BAD=0
const SVC_NOP=1
const SVC_GAMESTATE=2
const SVC_SERVER_COMMAND=5
const SVC_DOWNLOAD=6
const SVC_SNAPSHOT=7
const SVC_EOF=8

/// Stores server message state, including `snapshotState`, `reliableAcknowledge`, `reliableSequence`, `serverCommandSequence`, `serverCommands`, `gamestateFn` and additional values.
struct State
  snapshotState
  reliableAcknowledge
  reliableSequence
  serverCommandSequence
  serverCommands
  gamestateFn
  downloadFn
  context
  shownetLevel
  shownetLines
  shownetFn
  shownetContext
end struct

/// Creates reliable-command dispatch state, allocating snapshot state when the caller does not provide it.
/// @param snapshotState Value used by `if snapshotState==void then snapshotState=snapshotCommand.create() end if`.
function create(snapshotState)
  if snapshotState==void then snapshotState=snapshotCommand.create() end if
  return State(snapshotState,0,0,0,array(MAX_RELIABLE_COMMANDS,""),void,void,void,0,[],void,void)
end function

/// Pads a diagnostic message offset to a minimum width of three characters.
/// @param value Value used by `text=str(value)`.
function pad3(value)
  text=str(value)
  while len(bytes(text))<3 text=" "+text end while
  return text
end function

/// Records and optionally emits a byte-offset diagnostic line when shownet verbosity is at least two.
/// @param state Mutable server message record/storage; this routine assigns `state.shownetLines`.
/// @param msg Record read through `msg.readcount`.
/// @param text Text consumed or emitted by `shownet` in the server message path.
function shownet(state,msg,text)
  if state.shownetLevel<2 then return false end if
  line=pad3(msg.readcount-1)+":"+text
  state.shownetLines=state.shownetLines+[line]
  if state.shownetFn!=void then state.shownetFn(state.shownetContext,line) end if
  return true
end function

/// Appends a diagnostic line and forwards it to the optional shownet callback.
/// @param state Mutable server message record/storage; this routine assigns `state.shownetLines`.
/// @param line Value used by `state.shownetLines=state.shownetLines+[line]`.
function emitShownet(state,line)
  state.shownetLines=state.shownetLines+[line]
  if state.shownetFn!=void then state.shownetFn(state.shownetContext,line) end if
  return void
end function

/// Maps service-command bytes to their diagnostic names, retaining unknown numeric codes in a BAD CMD message.
/// @param command Value used by `if command==SVC_BAD then return "svc_bad" end if`.
function serviceName(command)
  if command==SVC_BAD then return "svc_bad" end if
  if command==SVC_NOP then return "svc_nop" end if
  if command==SVC_GAMESTATE then return "svc_gamestate" end if
  if command==3 then return "svc_configstring" end if
  if command==4 then return "svc_baseline" end if
  if command==SVC_SERVER_COMMAND then return "svc_serverCommand" end if
  if command==SVC_DOWNLOAD then return "svc_download" end if
  if command==SVC_SNAPSHOT then return "svc_snapshot" end if
  return "BAD CMD "+str(command)
end function

/// Reads a reliable server command, rejects truncated payloads and ignores already received command sequences.
/// @param state Mutable server message record/storage; this routine assigns `state.serverCommandSequence`, `state.serverCommands[sequence&(MAX_RELIABLE_COMMANDS-1)]`.
/// @param msg Message reader positioned before the command sequence and NUL-terminated command string.
function parseCommandString(state,msg)
  sequence=message.readI32(msg);text=message.readCString(msg)
  if msg.readcount>msg.cursize then return error(6890,"server message: truncated command") end if
  if state.serverCommandSequence>=sequence then return false end if
  state.serverCommandSequence=sequence;state.serverCommands[sequence&(MAX_RELIABLE_COMMANDS-1)]=text
  return true
end function

/// Parses the reliable acknowledgement and dispatches server commands, snapshots, gamestates and downloads until EOF, returning command/snapshot counts.
/// @param state Mutable server message record/storage; this routine assigns `state.shownetLines`, `state.reliableAcknowledge`, `state.snapshotState.serverCommandSequence`, `state.snapshotState.shownetLevel` and additional values.
/// @param msg Mutable server-message reader; parsing switches to bitstream mode and advances its read cursor.
function parseServerMessage(state,msg)
  if state==void or msg==void then return error(6891,"server message: missing state") end if
  if state.shownetLevel==1 then
    line=str(msg.cursize);state.shownetLines=state.shownetLines+[line]
    if state.shownetFn!=void then state.shownetFn(state.shownetContext,line) end if
  else if state.shownetLevel>=2 then
    state.shownetLines=state.shownetLines+["------------------"]
    if state.shownetFn!=void then state.shownetFn(state.shownetContext,"------------------") end if
  end if
  message.bitstream(msg);state.reliableAcknowledge=message.readI32(msg)
  if state.reliableAcknowledge<state.reliableSequence-MAX_RELIABLE_COMMANDS then state.reliableAcknowledge=state.reliableSequence end if
  commands=0;snapshots=0
  while true
    if msg.readcount>msg.cursize then return error(6892,"server message: read past end") end if
    command=message.readU8(msg)
    if command==SVC_EOF then shownet(state,msg,"END OF MESSAGE");break end if
    if state.shownetLevel>=2 then shownet(state,msg,serviceName(command)) end if
    if command==SVC_NOP then
      commands=commands
    else if command==SVC_SERVER_COMMAND then
      parsed=try(parseCommandString(state,msg));if parsed is error then return parsed end if
      if parsed then commands=commands+1 end if
    else if command==SVC_SNAPSHOT then
      state.snapshotState.serverCommandSequence=state.serverCommandSequence
      state.snapshotState.shownetLevel=state.shownetLevel;state.snapshotState.shownetLines=[]
      parsed=try(snapshotCommand.parseSnapshot(state.snapshotState,msg))
      if parsed is error then return parsed end if
      snapshots=snapshots+1
      for each line in state.snapshotState.shownetLines emitShownet(state,line) end for
      if state.shownetLevel==3 and parsed.valid then emitShownet(state,"   snapshot:"+str(parsed.messageNum)+"  delta:"+str(parsed.deltaNum)+"  ping:"+str(parsed.ping)) end if
    else if command==SVC_GAMESTATE and state.gamestateFn!=void then
      parsed=try(state.gamestateFn(state,msg));if parsed is error then return parsed end if
    else if command==SVC_DOWNLOAD and state.downloadFn!=void then
      parsed=try(state.downloadFn(state,msg));if parsed is error then return parsed end if
    else
      return error(6893,"server message: illegible command")
    end if
  end while
  return [commands,snapshots]
end function
