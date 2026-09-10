// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Protocol-68 server packet-entity merge from server/sv_snapshot.c.
package mq3.server.snapshot_delta
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta

const ENTITY_SENTINEL = 9999
const SVC_SNAPSHOT = 7
const PACKET_BACKUP = 32

struct SnapshotFrame
  firstEntity
  numEntities
end struct

function frame(firstEntity,numEntities)
  return SnapshotFrame(firstEntity,numEntities)
end function

struct PacketFrame
  firstEntity
  numEntities
  areaBits
  playerState
end struct

function packetFrame(firstEntity,numEntities,areaBits,playerState)
  return PacketFrame(firstEntity,numEntities,areaBits,playerState)
end function

// The host supplies the frame indexed by deltaMessage. This predicate mirrors
// the rejection conditions in SV_WriteSnapshotToClient before it is used.
function deltaFrameValid(deltaMessage,outgoingSequence,clientActive,oldFrame,nextSnapshotEntities,capacity)
  if deltaMessage<=0 or not clientActive or oldFrame==void then return false end if
  if outgoingSequence-deltaMessage>=PACKET_BACKUP-3 then return false end if
  if capacity<=0 or oldFrame.firstEntity<=nextSnapshotEntities-capacity then return false end if
  return true
end function

// Snapshot-ring ownership remains with the server host. This helper applies
// Baseq3's modulo addressing and rejects an invalid host boundary explicitly.
function entityAt(snapshotEntities,capacity,absoluteIndex)
  if capacity<=0 or capacity>len(snapshotEntities) then return error(6860,"snapshot delta: invalid ring capacity") end if
  index=absoluteIndex%capacity
  if index<0 then index=index+capacity end if
  return snapshotEntities[index]
end function

// Baselines are supplied by the server host as entityState records. Keeping
// this lookup outside the game-state model avoids importing svEntity_t.
function baselineFor(baselines,number)
  for each state in baselines
    if state.number==number then return state end if
  end for
  return error(6861,"snapshot delta: missing entity baseline")
end function

// Exact SV_EmitPacketEntities two-way sorted merge. `oldFrame` may be void for
// a non-delta snapshot. Returns the number of emitted entity records; the
// protocol terminator is not counted.
function emitPacketEntities(msg,oldFrame,newFrame,snapshotEntities,capacity,baselines)
  if newFrame==void then return error(6862,"snapshot delta: missing target frame") end if
  if newFrame.firstEntity<0 or newFrame.numEntities<0 or newFrame.numEntities>capacity then return error(6863,"snapshot delta: invalid target frame") end if
  oldCount=0
  if oldFrame!=void then
    if oldFrame.firstEntity<0 or oldFrame.numEntities<0 or oldFrame.numEntities>capacity then return error(6864,"snapshot delta: invalid base frame") end if
    oldCount=oldFrame.numEntities
  end if
  oldIndex=0;newIndex=0;emitted=0
  while newIndex<newFrame.numEntities or oldIndex<oldCount
    newState=void;oldState=void;newNumber=ENTITY_SENTINEL;oldNumber=ENTITY_SENTINEL
    if newIndex<newFrame.numEntities then
      newState=entityAt(snapshotEntities,capacity,newFrame.firstEntity+newIndex);newNumber=newState.number
    end if
    if oldIndex<oldCount then
      oldState=entityAt(snapshotEntities,capacity,oldFrame.firstEntity+oldIndex);oldNumber=oldState.number
    end if
    if newNumber==oldNumber then
      if delta.writeDeltaEntity(msg,oldState,newState,false) then emitted=emitted+1 end if
      oldIndex=oldIndex+1;newIndex=newIndex+1
    else if newNumber<oldNumber then
      delta.writeDeltaEntity(msg,baselineFor(baselines,newNumber),newState,true)
      emitted=emitted+1;newIndex=newIndex+1
    else
      delta.writeDeltaEntity(msg,oldState,void,true)
      emitted=emitted+1;oldIndex=oldIndex+1
    end if
  end while
  message.writeBits(msg,delta.MAX_GENTITIES-1,delta.GENTITYNUM_BITS)
  return emitted
end function

// Snapshot payload beginning at svc_snapshot. The outer sequencing, flags and
// padding are provided by server/snapshot_send.ml.
function writeSnapshotPayload(msg,oldFrame,newFrame,snapshotEntities,capacity,baselines,serverTime,lastFrame,snapFlags)
  if newFrame==void or newFrame.playerState==void then return error(6865,"snapshot delta: incomplete packet frame") end if
  if len(newFrame.areaBits)>255 then return error(6866,"snapshot delta: too many area bytes") end if
  if oldFrame==void and lastFrame!=0 then return error(6867,"snapshot delta: lastframe without base") end if
  message.writeByte(msg,SVC_SNAPSHOT)
  message.writeLong(msg,serverTime)
  message.writeByte(msg,lastFrame)
  message.writeByte(msg,snapFlags)
  message.writeByte(msg,len(newFrame.areaBits))
  message.writeData(msg,newFrame.areaBits)
  if oldFrame==void then delta.writeDeltaPlayerstate(msg,void,newFrame.playerState)
  else delta.writeDeltaPlayerstate(msg,oldFrame.playerState,newFrame.playerState) end if
  return emitPacketEntities(msg,oldFrame,newFrame,snapshotEntities,capacity,baselines)
end function
