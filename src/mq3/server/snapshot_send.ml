// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Server snapshot message orchestration from server/sv_snapshot.c.
package mq3.server.snapshot_send
import mq3.qcommon.message as message
import mq3.compat.numeric as numeric
import mq3.server.reliable_commands as reliable
import mq3.server.snapshot_delta as sendSnapshotDelta

const MAX_MSGLEN=16384
const PACKET_BACKUP=32
const PACKET_MASK=31
const CS_ACTIVE=4
const SNAPFLAG_RATE_DELAYED=1
const SNAPFLAG_NOT_ACTIVE=2
const SVC_NOP=1
const SVC_EOF=8
const HEADER_RATE_BYTES=48

struct SendFrame
  firstEntity
  numEntities
  areaBits
  playerState
  messageSent
  messageAcked
  messageSize
end struct

function frame(firstEntity,numEntities,areaBits,playerState)
  return SendFrame(firstEntity,numEntities,areaBits,playerState,0,0,0)
end function

struct Client
  state
  reliableCommands
  reliableSequence
  reliableAcknowledge
  reliableSent
  lastClientCommand
  deltaMessage
  outgoingSequence
  frames
  rateDelayed
  rate
  snapshotMsec
  nextSnapshotTime
  downloadName
  bot
end struct

function client()
  return Client(CS_ACTIVE,array(64,""),0,0,0,0,0,1,array(PACKET_BACKUP,void),false,25000,50,0,"",false)
end function

struct Server
  time
  snapFlagServerBit
  snapshotEntities
  snapshotCapacity
  nextSnapshotEntities
  baselines
  padPackets
  maxRate
  lanForceRate
end struct

function server(time,snapshotEntities,snapshotCapacity,baselines)
  if snapshotCapacity<=0 or snapshotCapacity>len(snapshotEntities) then return error(6890,"snapshot send: invalid entity ring") end if
  return Server(time,0,snapshotEntities,snapshotCapacity,0,baselines,0,0,false)
end function

struct Services buildSnapshotFn writeDownloadFn transmitFn localAddressFn lanAddressFn context end struct
function services(buildSnapshotFn,writeDownloadFn,transmitFn,localAddressFn,lanAddressFn,context)
  return Services(buildSnapshotFn,writeDownloadFn,transmitFn,localAddressFn,lanAddressFn,context)
end function

function currentFrame(clientState)
  if clientState.frames==void or len(clientState.frames)!=PACKET_BACKUP then return error(6891,"snapshot send: invalid client frame ring") end if
  result=clientState.frames[clientState.outgoingSequence&PACKET_MASK]
  if result==void then return error(6892,"snapshot send: current frame missing") end if
  return result
end function

function deltaBase(clientState,serverState)
  if clientState.deltaMessage<=0 or clientState.state!=CS_ACTIVE then return [void,0] end if
  if clientState.outgoingSequence-clientState.deltaMessage>=PACKET_BACKUP-3 then return [void,0] end if
  oldFrame=clientState.frames[clientState.deltaMessage&PACKET_MASK]
  if oldFrame==void then return [void,0] end if
  if oldFrame.firstEntity<=serverState.nextSnapshotEntities-serverState.snapshotCapacity then return [void,0] end if
  return [oldFrame,clientState.outgoingSequence-clientState.deltaMessage]
end function

function snapshotFlags(clientState,serverState)
  flags=serverState.snapFlagServerBit
  if clientState.rateDelayed then flags=flags|SNAPFLAG_RATE_DELAYED end if
  if clientState.state!=CS_ACTIVE then flags=flags|SNAPFLAG_NOT_ACTIVE end if
  return flags
end function

function writeSnapshotToClient(clientState,serverState,msg)
  selected=deltaBase(clientState,serverState);oldFrame=selected[0];lastFrame=selected[1]
  emitted=sendSnapshotDelta.writeSnapshotPayload(msg,oldFrame,currentFrame(clientState),serverState.snapshotEntities,serverState.snapshotCapacity,serverState.baselines,serverState.time,lastFrame,snapshotFlags(clientState,serverState))
  if serverState.padPackets>0 then for index=1 to serverState.padPackets message.writeByte(msg,SVC_NOP) end for end if
  return emitted
end function

function rateMsec(clientState,messageSize,maxRate)
  if clientState.rate<=0 then return error(6893,"snapshot send: invalid client rate") end if
  if messageSize>1500 then messageSize=1500 end if
  rate=clientState.rate
  if maxRate!=0 then
    if maxRate<1000 then maxRate=1000 end if
    if maxRate<rate then rate=maxRate end if
  end if
  return numeric.trunc32(((messageSize+HEADER_RATE_BYTES)*1000)/rate)
end function

function packetBytes(msg)
  result=bytes(msg.cursize,0)
  if msg.cursize>0 then for index=0 to msg.cursize-1 result[index]=msg.data[index] end for end if
  return result
end function

// SV_SendMessageToClient plus the svc_EOF written by SV_Netchan_Transmit.
// `transmitFn` is the explicit server-netchan boundary.
function sendMessageToClient(clientState,serverState,host,msg)
  current=currentFrame(clientState);current.messageSize=msg.cursize;current.messageSent=serverState.time;current.messageAcked=-1
  message.writeByte(msg,SVC_EOF)
  payload=packetBytes(msg)
  if host==void or host.transmitFn==void then return error(6894,"snapshot send: missing netchan transmit service") end if
  host.transmitFn(host,clientState,payload)
  local=false;lan=false
  if host.localAddressFn!=void then local=host.localAddressFn(host,clientState) end if
  if serverState.lanForceRate and host.lanAddressFn!=void then lan=host.lanAddressFn(host,clientState) end if
  if local or lan then clientState.nextSnapshotTime=serverState.time-1;return payload end if
  delay=rateMsec(clientState,msg.cursize,serverState.maxRate)
  if delay<clientState.snapshotMsec then delay=clientState.snapshotMsec;clientState.rateDelayed=false else clientState.rateDelayed=true end if
  clientState.nextSnapshotTime=serverState.time+delay
  if clientState.state!=CS_ACTIVE and clientState.downloadName=="" and clientState.nextSnapshotTime<serverState.time+1000 then clientState.nextSnapshotTime=serverState.time+1000 end if
  return payload
end function

function sendClientSnapshot(clientState,serverState,host)
  if host!=void and host.buildSnapshotFn!=void then host.buildSnapshotFn(host,clientState,serverState) end if
  if clientState.bot then return void end if
  msg=message.init(MAX_MSGLEN);msg.allowoverflow=true
  message.writeLong(msg,clientState.lastClientCommand)
  reliable.updateServerCommandsToClient(clientState,msg)
  writeSnapshotToClient(clientState,serverState,msg)
  if host!=void and host.writeDownloadFn!=void then host.writeDownloadFn(host,clientState,msg) end if
  if msg.overflowed then message.clear(msg) end if
  return sendMessageToClient(clientState,serverState,host,msg)
end function
