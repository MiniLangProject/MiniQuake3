// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// C-named client/cl_parse.c facade over the productive Protocol 68 paths.
package mq3.client.cl_parse_runtime
import mq3.client.snapshot_parse as snapshotParse
import mq3.client.snapshot_command as snapshotCommand
import mq3.client.server_message as serverMessage
import mq3.client.protocol_runtime as protocolRuntime
import mq3.client.gamestate as gamestate
import mq3.client.download as download
import mq3.client.system_info as systemInfo

/// Stores engine client parse runtime runtime wiring and state, including `protocol`, `systemState`, `systemServices`.
struct Runtime
  /// Client protocol parser runtime, including server-message dispatch, gamestate, and download state.
  protocol
  /// When constructing this record, `create` supplies `systemState` for this member.
  systemState
  /// When constructing this record, `create` supplies `systemServices` for this member.
  systemServices
end struct

/// Calls `mq3.client.download.services`, `mq3.client.system_info.services`, `mq3.client.protocol_runtime.create` and additional helpers from engine client parse runtime `create`. The final path returns `Runtime(protocol,systemState,systemServices)`.
/// @param downloadServices Value used by `if downloadServices==void then downloadServices=download.services() end if`.
/// @param systemServices Value used by `if systemServices==void then systemServices=systemInfo.services() end if`.
function create(downloadServices,systemServices)
  if downloadServices==void then downloadServices=download.services() end if
  if systemServices==void then systemServices=systemInfo.services() end if
  protocol=protocolRuntime.create(downloadServices);systemState=systemInfo.create()
  systemInfo.install(protocol.gamestateState,systemState,systemServices)
  return Runtime(protocol,systemState,systemServices)
end function

/// Evaluates engine client parse runtime `configureShownet` and returns `error(6990,"cl_parse: missing runtime")`, `void` according to its guard/selection conditions.
/// @param runtime Record read through `runtime.protocol.dispatcher`.
/// @param level Value assigned to `state.shownetLevel`.
/// @param outputFn Value assigned to `state.shownetFn`.
/// @param context Value assigned to `state.shownetContext`.
function configureShownet(runtime,level,outputFn,context)
  if runtime==void then return error(6990,"cl_parse: missing runtime") end if
  state=runtime.protocol.dispatcher;state.shownetLevel=level;state.shownetFn=outputFn;state.shownetContext=context
  return void
end function

/// Calls `mq3.client.server_message.shownet` from engine client parse runtime `SHOWNET`. The final path returns `serverMessage.shownet(state,msg,text)`.
/// @param state Shared engine client parse runtime state passed to the helper calls in `SHOWNET`.
/// @param msg Value used by `if state==void or msg==void then return error(6991,"cl_parse: missing shownet state") end if`.
/// @param text Text consumed or emitted by `SHOWNET` in the engine client parse runtime path.
function SHOWNET(state,msg,text)
  if state==void or msg==void then return error(6991,"cl_parse: missing shownet state") end if
  return serverMessage.shownet(state,msg,text)
end function

/// Adapts `mq3.client.snapshot_parse.deltaEntity` to engine client parse runtime `CL_DeltaEntity`, returning its result for `state, msg, frame, newnum, old, unchanged`.
/// @param state Argument 1 of `mq3.client.snapshot_parse.deltaEntity`.
/// @param msg Argument 2 of `mq3.client.snapshot_parse.deltaEntity`.
/// @param frame Argument 3 of `mq3.client.snapshot_parse.deltaEntity`.
/// @param newnum Argument 4 of `mq3.client.snapshot_parse.deltaEntity`.
/// @param old Argument 5 of `mq3.client.snapshot_parse.deltaEntity`.
/// @param unchanged Argument 6 of `mq3.client.snapshot_parse.deltaEntity`.
function CL_DeltaEntity(state,msg,frame,newnum,old,unchanged)
  return snapshotParse.deltaEntity(state,msg,frame,newnum,old,unchanged)
end function

/// Adapts `mq3.client.snapshot_parse.parsePacketEntities` to engine client parse runtime `CL_ParsePacketEntities`, returning its result for `state, msg, oldframe, newframe`.
/// @param state Argument 1 of `mq3.client.snapshot_parse.parsePacketEntities`.
/// @param msg Argument 2 of `mq3.client.snapshot_parse.parsePacketEntities`.
/// @param oldframe Argument 3 of `mq3.client.snapshot_parse.parsePacketEntities`.
/// @param newframe Argument 4 of `mq3.client.snapshot_parse.parsePacketEntities`.
function CL_ParsePacketEntities(state,msg,oldframe,newframe)
  return snapshotParse.parsePacketEntities(state,msg,oldframe,newframe)
end function

/// Adapts `mq3.client.snapshot_command.parseSnapshot` to engine client parse runtime `CL_ParseSnapshot`, returning its result for `state, msg`.
/// @param state Argument 1 of `mq3.client.snapshot_command.parseSnapshot`.
/// @param msg Argument 2 of `mq3.client.snapshot_command.parseSnapshot`.
function CL_ParseSnapshot(state,msg)
  return snapshotCommand.parseSnapshot(state,msg)
end function

/// Adapts `mq3.client.gamestate.parse` to engine client parse runtime `CL_ParseGamestate`, returning its result for `state, msg`.
/// @param state Argument 1 of `mq3.client.gamestate.parse`.
/// @param msg Argument 2 of `mq3.client.gamestate.parse`.
function CL_ParseGamestate(state,msg)
  return gamestate.parse(state,msg)
end function

/// Adapts `mq3.client.download.parseDownload` to engine client parse runtime `CL_ParseDownload`, returning its result for `state, services, msg`.
/// @param state Argument 1 of `mq3.client.download.parseDownload`.
/// @param services Argument 2 of `mq3.client.download.parseDownload`.
/// @param msg Argument 3 of `mq3.client.download.parseDownload`.
function CL_ParseDownload(state,services,msg)
  return download.parseDownload(state,services,msg)
end function

/// Adapts `mq3.client.server_message.parseCommandString` to engine client parse runtime `CL_ParseCommandString`, returning its result for `state, msg`.
/// @param state Argument 1 of `mq3.client.server_message.parseCommandString`.
/// @param msg Argument 2 of `mq3.client.server_message.parseCommandString`.
function CL_ParseCommandString(state,msg)
  return serverMessage.parseCommandString(state,msg)
end function

/// Calls `mq3.client.protocol_runtime.parse` from engine client parse runtime `CL_ParseServerMessage`. The final path returns `protocolRuntime.parse(runtime.protocol,msg)`.
/// @param runtime Record read through `runtime.protocol`.
/// @param msg Value used by `return protocolRuntime.parse(runtime.protocol,msg)`.
function CL_ParseServerMessage(runtime,msg)
  if runtime==void then return error(6992,"cl_parse: missing runtime") end if
  return protocolRuntime.parse(runtime.protocol,msg)
end function

/// Adapts `mq3.client.system_info.apply` to engine client parse runtime `CL_SystemInfoChanged`, returning its result for `state, services, text`.
/// @param state Argument 1 of `mq3.client.system_info.apply`.
/// @param services Argument 2 of `mq3.client.system_info.apply`.
/// @param text Argument 3 of `mq3.client.system_info.apply`.
function CL_SystemInfoChanged(state,services,text)
  return systemInfo.apply(state,services,text)
end function
