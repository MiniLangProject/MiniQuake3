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

struct Runtime protocol systemState systemServices end struct

function create(downloadServices,systemServices)
  if downloadServices==void then downloadServices=download.services() end if
  if systemServices==void then systemServices=systemInfo.services() end if
  protocol=protocolRuntime.create(downloadServices);systemState=systemInfo.create()
  systemInfo.install(protocol.gamestateState,systemState,systemServices)
  return Runtime(protocol,systemState,systemServices)
end function

function configureShownet(runtime,level,outputFn,context)
  if runtime==void then return error(6990,"cl_parse: missing runtime") end if
  state=runtime.protocol.dispatcher;state.shownetLevel=level;state.shownetFn=outputFn;state.shownetContext=context
  return void
end function

function SHOWNET(state,msg,text)
  if state==void or msg==void then return error(6991,"cl_parse: missing shownet state") end if
  return serverMessage.shownet(state,msg,text)
end function

function CL_DeltaEntity(state,msg,frame,newnum,old,unchanged)
  return snapshotParse.deltaEntity(state,msg,frame,newnum,old,unchanged)
end function

function CL_ParsePacketEntities(state,msg,oldframe,newframe)
  return snapshotParse.parsePacketEntities(state,msg,oldframe,newframe)
end function

function CL_ParseSnapshot(state,msg)
  return snapshotCommand.parseSnapshot(state,msg)
end function

function CL_ParseGamestate(state,msg)
  return gamestate.parse(state,msg)
end function

function CL_ParseDownload(state,services,msg)
  return download.parseDownload(state,services,msg)
end function

function CL_ParseCommandString(state,msg)
  return serverMessage.parseCommandString(state,msg)
end function

function CL_ParseServerMessage(runtime,msg)
  if runtime==void then return error(6992,"cl_parse: missing runtime") end if
  return protocolRuntime.parse(runtime.protocol,msg)
end function

function CL_SystemInfoChanged(state,services,text)
  return systemInfo.apply(state,services,text)
end function
