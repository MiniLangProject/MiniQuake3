// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Concrete composition of CL_ParseServerMessage, CL_ParseGamestate,
// CL_ParseDownload and CL_ParseSnapshot client protocol state.
package mq3.client.protocol_runtime
import mq3.client.server_message as serverMessage
import mq3.client.snapshot_command as snapshotCommand
import mq3.client.gamestate as gamestate
import mq3.client.download as download

struct Runtime
  dispatcher
  gamestateState
  downloadState
  downloadServices
end struct

function gamestateCommand(dispatcher,msg)
  runtime=dispatcher.context
  if runtime==void then return error(6920,"client protocol: missing runtime") end if
  old=dispatcher.snapshotState;fresh=snapshotCommand.create()
  fresh.serverMessageSequence=old.serverMessageSequence;fresh.outgoingSequence=old.outgoingSequence
  fresh.realtime=old.realtime;fresh.demoWaiting=old.demoWaiting
  dispatcher.snapshotState=fresh
  gamestate.parse(runtime.gamestateState,msg)
  dispatcher.serverCommandSequence=runtime.gamestateState.serverCommandSequence
  dispatcher.snapshotState.serverCommandSequence=dispatcher.serverCommandSequence
  dispatcher.snapshotState.entityState.entityBaselines=runtime.gamestateState.baselines
  return void
end function

function downloadCommand(dispatcher,msg)
  runtime=dispatcher.context
  if runtime==void or runtime.downloadServices==void then return error(6921,"client protocol: missing download services") end if
  return download.parseDownload(runtime.downloadState,runtime.downloadServices,msg)
end function

function create(downloadServices)
  if downloadServices==void then downloadServices=download.services() end if
  dispatcher=serverMessage.create(void);runtime=Runtime(dispatcher,gamestate.create(),download.create(),downloadServices)
  dispatcher.context=runtime;dispatcher.gamestateFn=gamestateCommand;dispatcher.downloadFn=downloadCommand
  return runtime
end function

function parse(runtime,msg)
  if runtime==void then return error(6922,"client protocol: missing runtime") end if
  return serverMessage.parseServerMessage(runtime.dispatcher,msg)
end function
