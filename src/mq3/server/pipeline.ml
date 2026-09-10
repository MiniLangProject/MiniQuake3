// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Concrete snapshot_runtime -> snapshot_send -> download -> netchan pipeline.
package mq3.server.pipeline
import mq3.server.snapshot_runtime as pipelineSnapshotRuntime
import mq3.server.snapshot_send as pipelineSnapshotSend
import mq3.server.download as pipelineDownload
import mq3.qcommon.netchan as pipelineNetchan

struct Pipeline runtime runtimeLevel client server downloadState downloadServer downloadHost netRuntime netChannel clientNum fragments local lan end struct

function create(level,clientNum,ringCapacity,baselines,downloadState,downloadServer,downloadHost,netRuntime,netChannel)
  if level==void or clientNum<0 or clientNum>=len(level.clients) then return error(6920,"server pipeline: bad client") end if
  runtime=pipelineSnapshotRuntime.create(level,ringCapacity)
  server=pipelineSnapshotSend.server(0,runtime.buildWorld.ring,ringCapacity,baselines)
  client=pipelineSnapshotSend.client();client.outgoingSequence=netChannel.outgoingSequence
  return Pipeline(runtime,void,client,server,downloadState,downloadServer,downloadHost,netRuntime,netChannel,clientNum,[],false,false)
end function

function buildSnapshot(host,clientState,serverState)
  pipe=host.context;frame=pipelineSnapshotRuntime.buildClientFrame(pipe.runtime,pipe.runtimeLevel,pipe.clientNum,clientState.state==1)
  // Both scalar cursor and ring reference must describe the freshly built frame
  // before snapshot_send performs delta-frame validation.
  serverState.snapshotEntities=pipe.runtime.buildWorld.ring
  serverState.snapshotCapacity=pipe.runtime.buildWorld.ringCapacity
  serverState.nextSnapshotEntities=pipe.runtime.buildWorld.nextSnapshotEntities
  clientState.frames[clientState.outgoingSequence&31]=pipelineSnapshotSend.frame(frame.firstEntity,frame.numEntities,frame.areaBits,frame.playerState)
  return frame
end function

// Runtime level is attached only for the synchronous duration of sendSnapshot.
function writeDownload(host,clientState,msg)
  pipe=host.context
  if pipe.downloadState==void or pipe.downloadServer==void then return 0 end if
  pipe.downloadServer.time=pipe.server.time;pipe.downloadServer.maxRate=pipe.server.maxRate
  clientState.downloadName=pipe.downloadState.name
  return pipelineDownload.writeToClient(pipe.downloadState,pipe.downloadServer,pipe.downloadHost,msg)
end function

function transmit(host,clientState,payload)
  pipe=host.context;pipe.fragments=[]
  packet=pipelineNetchan.transmit(pipe.netRuntime,pipe.netChannel,payload);pipe.fragments=pipe.fragments+[packet]
  while pipe.netChannel.unsentFragments
    packet=pipelineNetchan.transmitNextFragment(pipe.netRuntime,pipe.netChannel);pipe.fragments=pipe.fragments+[packet]
  end while
  clientState.outgoingSequence=pipe.netChannel.outgoingSequence
  return len(pipe.fragments)
end function
function isLocal(host,clientState) return host.context.local end function
function isLan(host,clientState) return host.context.lan end function
function host(pipe) return pipelineSnapshotSend.services(buildSnapshot,writeDownload,transmit,isLocal,isLan,pipe) end function

function sendSnapshot(pipe,level,time)
  if pipe==void or level==void or level.scene!=pipe.runtime.scene then return error(6921,"server pipeline: level mismatch") end if
  pipe.runtimeLevel=level
  pipe.server.time=time
  pipe.client.outgoingSequence=pipe.netChannel.outgoingSequence
  result=pipelineSnapshotSend.sendClientSnapshot(pipe.client,pipe.server,host(pipe))
  pipe.runtimeLevel=void
  return result
end function
