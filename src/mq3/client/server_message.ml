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

struct State
  snapshotState
  reliableAcknowledge
  reliableSequence
  serverCommandSequence
  serverCommands
  gamestateFn
  downloadFn
  context
end struct

function create(snapshotState)
  if snapshotState==void then snapshotState=snapshotCommand.create() end if
  return State(snapshotState,0,0,0,array(MAX_RELIABLE_COMMANDS,""),void,void,void)
end function

function parseCommandString(state,msg)
  sequence=message.readI32(msg);text=message.readCString(msg)
  if msg.readcount>msg.cursize then return error(6890,"server message: truncated command") end if
  if state.serverCommandSequence>=sequence then return false end if
  state.serverCommandSequence=sequence;state.serverCommands[sequence&(MAX_RELIABLE_COMMANDS-1)]=text
  return true
end function

function parseServerMessage(state,msg)
  if state==void or msg==void then return error(6891,"server message: missing state") end if
  message.bitstream(msg);state.reliableAcknowledge=message.readI32(msg)
  if state.reliableAcknowledge<state.reliableSequence-MAX_RELIABLE_COMMANDS then state.reliableAcknowledge=state.reliableSequence end if
  commands=0;snapshots=0
  while true
    if msg.readcount>msg.cursize then return error(6892,"server message: read past end") end if
    command=message.readU8(msg)
    if command==SVC_EOF then break end if
    if command==SVC_NOP then
      commands=commands
    else if command==SVC_SERVER_COMMAND then
      if parseCommandString(state,msg) then commands=commands+1 end if
    else if command==SVC_SNAPSHOT then
      state.snapshotState.serverCommandSequence=state.serverCommandSequence
      snapshotCommand.parseSnapshot(state.snapshotState,msg);snapshots=snapshots+1
    else if command==SVC_GAMESTATE and state.gamestateFn!=void then
      state.gamestateFn(state,msg)
    else if command==SVC_DOWNLOAD and state.downloadFn!=void then
      state.downloadFn(state,msg)
    else
      return error(6893,"server message: illegible command")
    end if
  end while
  return [commands,snapshots]
end function
