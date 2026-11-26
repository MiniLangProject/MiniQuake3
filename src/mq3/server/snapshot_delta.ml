// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Protocol-68 server packet-entity merge from server/sv_snapshot.c.
package mq3.server.snapshot_delta
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta

/// Internal entity-number sentinel used after a snapshot entity list is exhausted.
const ENTITY_SENTINEL = 9999
/// Server-to-client opcode introducing a delta-compressed world snapshot.
const SVC_SNAPSHOT = 7
/// Number of old messages that must be kept on client and.
const PACKET_BACKUP = 32

/// SnapshotFrame record for server.snapshot_delta, containing `firstEntity`, `numEntities`.
struct SnapshotFrame
  /// First entity-state position for this snapshot in the shared circular snapshot buffer.
  firstEntity
  /// Number of entity records currently represented by this state or snapshot.
  numEntities
end struct

/// Create `mq3.server.snapshot_delta.SnapshotFrame` with firstEntity=firstEntity; numEntities=numEntities.
/// @param firstEntity Initial `firstEntity` field stored in the returned or constructed `mq3.server.snapshot_delta.SnapshotFrame` record.
/// @param numEntities Initial `numEntities` field stored in the returned or constructed `mq3.server.snapshot_delta.SnapshotFrame` record.
function frame(firstEntity,numEntities)
  return SnapshotFrame(firstEntity,numEntities)
end function

/// PacketFrame record for server.snapshot_delta, containing `firstEntity`, `numEntities`, `areaBits`, `playerState`.
struct PacketFrame
  /// First entity-state position for this snapshot in the shared circular snapshot buffer.
  firstEntity
  /// Number of entity records currently represented by this state or snapshot.
  numEntities
  /// Bitset of map areas visible in this snapshot.
  areaBits
  /// Authoritative player-state record used for snapshots and game simulation.
  playerState
end struct

/// Create `mq3.server.snapshot_delta.PacketFrame` with firstEntity=firstEntity; numEntities=numEntities; areaBits=areaBits; playerState=playerState.
/// @param firstEntity Initial `firstEntity` field stored in the returned or constructed `mq3.server.snapshot_delta.PacketFrame` record.
/// @param numEntities Initial `numEntities` field stored in the returned or constructed `mq3.server.snapshot_delta.PacketFrame` record.
/// @param areaBits Initial `areaBits` field stored in the returned or constructed `mq3.server.snapshot_delta.PacketFrame` record.
/// @param playerState Initial `playerState` field stored in the returned or constructed `mq3.server.snapshot_delta.PacketFrame` record.
function packetFrame(firstEntity,numEntities,areaBits,playerState)
  return PacketFrame(firstEntity,numEntities,areaBits,playerState)
end function

// The host supplies the frame indexed by deltaMessage. This predicate mirrors
// the rejection conditions in SV_WriteSnapshotToClient before it is used.
/// @param deltaMessage Delta message used in `(deltaMessage <= 0)` and `(outgoingSequence - deltaMessage)`.
/// @param outgoingSequence Outgoing sequence used in `(outgoingSequence - deltaMessage)` and `((outgoingSequence - deltaMessage) >= (PACKET_BACKUP - 3))`.
/// @param clientActive Client active used in `((deltaMessage <= 0) or not clientActive)` and `(((deltaMessage <= 0) or not clientActive) or (oldFrame == void))`.
/// @param oldFrame Record exposing `firstEntity`.
/// @param nextSnapshotEntities Next snapshot entities used in `(nextSnapshotEntities - capacity)` and `(oldFrame.firstEntity <= (nextSnapshotEntities - capacity))`.
/// @param capacity Capacity used in `(capacity <= 0)` and `(nextSnapshotEntities - capacity)`.
function deltaFrameValid(deltaMessage,outgoingSequence,clientActive,oldFrame,nextSnapshotEntities,capacity)
  if deltaMessage<=0 or not clientActive or oldFrame==void then return false end if
  if outgoingSequence-deltaMessage>=PACKET_BACKUP-3 then return false end if
  if capacity<=0 or oldFrame.firstEntity<=nextSnapshotEntities-capacity then return false end if
  return true
end function

// Snapshot-ring ownership remains with the server host. This helper applies
// Baseq3's modulo addressing and rejects an invalid host boundary explicitly.
/// @param snapshotEntities Snapshot entities used in `len(snapshotEntities)` and `snapshotEntities[index]`.
/// @param capacity Capacity used in `(capacity <= 0)` and `(index + capacity)`.
/// @param absoluteIndex Absolute index used in `(absoluteIndex % capacity)`.
function entityAt(snapshotEntities,capacity,absoluteIndex)
  if capacity<=0 or capacity>len(snapshotEntities) then return error(6860,"snapshot delta: invalid ring capacity") end if
  index=absoluteIndex%capacity
  if index<0 then index=index+capacity end if
  return snapshotEntities[index]
end function

// Baselines are supplied by the server host as entityState records. Keeping
// this lookup outside the game-state model avoids importing svEntity_t.
/// @param baselines Sequence traversed as `state` by the loop in `baselineFor`.
/// @param number Number used in `(state.number == number)`.
function baselineFor(baselines,number)
  for each state in baselines
    if state.number==number then return state end if
  end for
  return error(6861,"snapshot delta: missing entity baseline")
end function

// Exact SV_EmitPacketEntities two-way sorted merge. `oldFrame` may be void for
// a non-delta snapshot. Returns the number of emitted entity records; the
// protocol terminator is not counted.
/// @param msg Msg passed as `msg` to `mq3.qcommon.message_state_delta.writeDeltaEntity`.
/// @param oldFrame Record exposing `firstEntity`, `numEntities`.
/// @param newFrame Record exposing `firstEntity`, `numEntities`.
/// @param snapshotEntities Snapshot entities passed as `snapshotEntities` to `mq3.server.snapshot_delta.entityAt`.
/// @param capacity Capacity passed as `capacity` to `mq3.server.snapshot_delta.entityAt`.
/// @param baselines Baselines passed as `baselines` to `mq3.server.snapshot_delta.baselineFor`.
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
/// @param msg Msg passed as `msg` to `mq3.qcommon.message.writeByte`.
/// @param oldFrame Record exposing `playerState`.
/// @param newFrame Record exposing `playerState`, `areaBits`.
/// @param snapshotEntities Snapshot entities passed as `snapshotEntities` to `mq3.server.snapshot_delta.emitPacketEntities`.
/// @param capacity Capacity passed as `capacity` to `mq3.server.snapshot_delta.emitPacketEntities`.
/// @param baselines Baselines passed as `baselines` to `mq3.server.snapshot_delta.emitPacketEntities`.
/// @param serverTime Value passed as `value` to `mq3.qcommon.message.writeLong`.
/// @param lastFrame Value passed as `value` to `mq3.qcommon.message.writeByte`.
/// @param snapFlags Value passed as `value` to `mq3.qcommon.message.writeByte`.
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
