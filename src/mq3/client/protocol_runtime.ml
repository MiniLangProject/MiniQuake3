// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Concrete composition of CL_ParseServerMessage, CL_ParseGamestate,
// CL_ParseDownload and CL_ParseSnapshot client protocol state.
package mq3.client.protocol_runtime
import mq3.client.server_message as serverMessage
import mq3.client.snapshot_command as snapshotCommand
import mq3.client.gamestate as gamestate
import mq3.client.download as download

/// Stores protocol runtime runtime wiring and state, including `dispatcher`, `gamestateState`, `downloadState`, `downloadServices`.
struct Runtime
  dispatcher
  gamestateState
  downloadState
  downloadServices
end struct

/// Updates `dispatcher.snapshotState`, `dispatcher.serverCommandSequence`, `dispatcher.snapshotState.serverCommandSequence`, `dispatcher.snapshotState.entityState.entityBaselines` during protocol runtime `gamestateCommand`.
/// @param dispatcher Mutable protocol runtime record/storage; this routine assigns `dispatcher.snapshotState`, `dispatcher.serverCommandSequence`, `dispatcher.snapshotState.serverCommandSequence`, `dispatcher.snapshotState.entityState.entityBaselines`.
/// @param msg Value used by `parsed=try(gamestate.parse(runtime.gamestateState,msg))`.
function gamestateCommand(dispatcher,msg)
  runtime=dispatcher.context
  if runtime==void then return error(6920,"client protocol: missing runtime") end if
  old=dispatcher.snapshotState;fresh=snapshotCommand.create()
  fresh.serverMessageSequence=old.serverMessageSequence;fresh.outgoingSequence=old.outgoingSequence
  fresh.realtime=old.realtime;fresh.demoWaiting=old.demoWaiting
  parsed=try(gamestate.parse(runtime.gamestateState,msg));if parsed is error then return parsed end if
  dispatcher.snapshotState=fresh
  dispatcher.serverCommandSequence=runtime.gamestateState.serverCommandSequence
  dispatcher.snapshotState.serverCommandSequence=dispatcher.serverCommandSequence
  dispatcher.snapshotState.entityState.entityBaselines=runtime.gamestateState.baselines
  return void
end function

/// Calls `mq3.client.download.parseDownload` from protocol runtime `downloadCommand`. The final path returns `download.parseDownload(runtime.downloadState,runtime.downloadServices,msg)`.
/// @param dispatcher Record read through `dispatcher.context`.
/// @param msg Value used by `return download.parseDownload(runtime.downloadState,runtime.downloadServices,msg)`.
function downloadCommand(dispatcher,msg)
  runtime=dispatcher.context
  if runtime==void or runtime.downloadServices==void then return error(6921,"client protocol: missing download services") end if
  return download.parseDownload(runtime.downloadState,runtime.downloadServices,msg)
end function

/// Calls `mq3.client.download.services`, `mq3.client.server_message.create`, `mq3.client.protocol_runtime.Runtime` and additional helpers from protocol runtime `create`. The final path returns `runtime`.
/// @param downloadServices Value used by `if downloadServices==void then downloadServices=download.services() end if`.
function create(downloadServices)
  if downloadServices==void then downloadServices=download.services() end if
  dispatcher=serverMessage.create(void);runtime=Runtime(dispatcher,gamestate.create(),download.create(),downloadServices)
  dispatcher.context=runtime;dispatcher.gamestateFn=gamestateCommand;dispatcher.downloadFn=downloadCommand
  return runtime
end function

/// Calls `mq3.client.server_message.parseServerMessage` from protocol runtime `parse`. The final path returns `serverMessage.parseServerMessage(runtime.dispatcher,msg)`.
/// @param runtime Record read through `runtime.dispatcher`.
/// @param msg Value used by `return serverMessage.parseServerMessage(runtime.dispatcher,msg)`.
function parse(runtime,msg)
  if runtime==void then return error(6922,"client protocol: missing runtime") end if
  return serverMessage.parseServerMessage(runtime.dispatcher,msg)
end function
