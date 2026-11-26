// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_ParseSnapshot state transition from client/cl_parse.c.
package mq3.client.snapshot_command
import mq3.client.snapshot_parse as snapshotEntities
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.playerstate as playerstate

const PACKET_BACKUP=32
const PACKET_MASK=31
const MAX_PARSE_ENTITIES=2048
const MAX_MAP_AREA_BYTES=32

/// Stores snapshot command out packet record, including `serverTime`, `realtime`.
struct OutPacket
  serverTime
  realtime
end struct

/// Stores snapshot command snapshot metadata and contents, including `valid`, `snapFlags`, `serverTime`, `messageNum`, `deltaNum`, `ping` and additional values.
struct Snapshot
  valid
  snapFlags
  serverTime
  messageNum
  deltaNum
  ping
  areaMask
  playerState
  numEntities
  parseEntitiesNum
  serverCommandNum
end struct

/// Stores snapshot command state, including `entityState`, `snapshots`, `snap`, `outPackets`, `serverMessageSequence`, `serverCommandSequence` and additional values.
struct State
  entityState
  snapshots
  snap
  outPackets
  serverMessageSequence
  serverCommandSequence
  outgoingSequence
  realtime
  demoWaiting
  newSnapshots
  shownetLevel
  shownetLines
end struct

/// Creates an invalid snapshot with a zeroed area mask, fresh player state and empty sequence metadata.
function emptySnapshot()
  return Snapshot(false,0,0,0,0,0,bytes(MAX_MAP_AREA_BYTES,0),playerstate.create(),0,0,0)
end function

/// Copies at most MAX_MAP_AREA_BYTES bytes into a zero-filled area mask; a void source produces an all-zero mask.
/// @param source Optional area-mask bytes; at most MAX_MAP_AREA_BYTES are copied and the remaining destination bytes stay zero.
function copyAreaMask(source)
  result=bytes(MAX_MAP_AREA_BYTES,0)
  if source!=void then
    count=len(source);if count>MAX_MAP_AREA_BYTES then count=MAX_MAP_AREA_BYTES end if
    if count>0 then for index=0 to count-1 result[index]=source[index] end for end if
  end if
  return result
end function

/// Copies snapshot metadata, area-mask bytes and player state; a void source produces an empty snapshot.
/// @param source Record read through `source.valid`, `source.snapFlags`, `source.serverTime`, `source.messageNum` and additional values.
function copySnapshot(source)
  if source==void then return emptySnapshot() end if
  return Snapshot(source.valid,source.snapFlags,source.serverTime,source.messageNum,source.deltaNum,source.ping,copyAreaMask(source.areaMask),
    playerstate.copy(source.playerState),source.numEntities,source.parseEntitiesNum,source.serverCommandNum)
end function

/// Creates the client snapshot ring, outgoing-packet ring and entity-delta state with demo waiting enabled.
function create()
  shots=array(PACKET_BACKUP,void);packets=array(PACKET_BACKUP,void)
  for index=0 to PACKET_BACKUP-1 shots[index]=emptySnapshot();packets[index]=OutPacket(0,0) end for
  return State(snapshotEntities.createState(),shots,emptySnapshot(),packets,0,0,0,0,true,false,0,[])
end function

/// Left-pads a snapshot diagnostic offset to at least three characters.
/// @param value Value used by `text=str(value)`.
function pad3(value) text=str(value);while len(bytes(text))<3 text=" "+text end while;return text end function
/// Adds a snapshot parser offset/message diagnostic when shownet verbosity is at least two.
/// @param state Mutable snapshot command record/storage; this routine assigns `state.shownetLines`.
/// @param msg Record read through `msg.readcount`.
/// @param text Text consumed or emitted by `shownet` in the snapshot command path.
function shownet(state,msg,text)
  if state.shownetLevel>=2 then state.shownetLines=state.shownetLines+[pad3(msg.readcount-1)+":"+text] end if
  return void
end function

/// Finds the snapshot delta base and marks the new snapshot valid only when its sequence and parse-entity window can be reused.
/// @param state Record read through `state.snapshots`, `state.entityState.parseEntitiesNum`.
/// @param newSnapshot Snapshot being reconstructed; its valid flag is set only when the delta base and entity history can be reused.
function oldFrameFor(state,newSnapshot)
  if newSnapshot.deltaNum<=0 then newSnapshot.valid=true;return void end if
  old=state.snapshots[newSnapshot.deltaNum&PACKET_MASK]
  if old.valid and old.messageNum==newSnapshot.deltaNum and state.entityState.parseEntitiesNum-old.parseEntitiesNum<=MAX_PARSE_ENTITIES-128 then newSnapshot.valid=true end if
  return old
end function

/// Matches the snapshot command time to the outgoing-packet history and computes elapsed client time, leaving ping at 999 when no packet matches.
/// @param state Record read through `state.outgoingSequence`, `state.outPackets`, `state.realtime`.
/// @param snapshot Mutable snapshot command record/storage; this routine assigns `snapshot.ping`.
function calculatePing(state,snapshot)
  snapshot.ping=999;index=0
  while index<PACKET_BACKUP
    packetNum=(state.outgoingSequence-1-index)&PACKET_MASK;packet=state.outPackets[packetNum]
    if snapshot.playerState.commandTime>=packet.serverTime then snapshot.ping=state.realtime-packet.realtime;return void end if
    index=index+1
  end while
  return void
end function

// Parse packet entities against an isolated copy.  A malformed packet must not
// advance or overwrite the live parse-entity ring before its error reaches the
// outer CL_ParseServerMessage dispatcher.
/// @param source Record read through `source.parseEntitiesNum`, `source.shownetLevel`, `source.shownetLines`, `source.parseEntities` and additional values.
function copyEntityState(source)
  result=snapshotEntities.createState();result.parseEntitiesNum=source.parseEntitiesNum
  result.shownetLevel=source.shownetLevel;result.shownetLines=source.shownetLines
  for index=0 to snapshotEntities.MAX_PARSE_ENTITIES-1 result.parseEntities[index]=source.parseEntities[index] end for
  for index=0 to snapshotEntities.MAX_GENTITIES-1 result.entityBaselines[index]=source.entityBaselines[index] end for
  return result
end function

/// Promotes the successfully parsed entity ring, absolute sequence and diagnostic state into the live snapshot parser.
/// @param target Mutable snapshot command record/storage; this routine assigns `target.parseEntities`, `target.parseEntitiesNum`, `target.shownetLevel`, `target.shownetLines`.
/// @param source Record read through `source.parseEntities`, `source.parseEntitiesNum`, `source.shownetLevel`, `source.shownetLines`.
function commitEntityState(target,source)
  target.parseEntities=source.parseEntities;target.parseEntitiesNum=source.parseEntitiesNum
  target.shownetLevel=source.shownetLevel;target.shownetLines=source.shownetLines
  return void
end function

// `svc_snapshot` has already been consumed by CL_ParseServerMessage.
// Invalid deltas are fully consumed and populate the parse-entity ring like C,
// but are not promoted to the current/backup snapshot.
/// @param state Mutable snapshot command record/storage; this routine assigns `state.shownetLines`, `state.demoWaiting`, `state.snapshots[oldMessageNum&PACKET_MASK].valid`, `state.snap` and additional values.
/// @param msg Record read through `msg.readcount`, `msg.cursize`.
function parseSnapshot(state,msg)
  if state==void or msg==void then return error(6870,"snapshot command: missing state") end if
  fresh=emptySnapshot();fresh.serverCommandNum=state.serverCommandSequence
  fresh.serverTime=message.readI32(msg);fresh.messageNum=state.serverMessageSequence
  distance=message.readU8(msg)
  if distance==0 then fresh.deltaNum=-1 else fresh.deltaNum=fresh.messageNum-distance end if
  fresh.snapFlags=message.readU8(msg);old=oldFrameFor(state,fresh)
  areaLength=message.readU8(msg)
  if areaLength<0 or areaLength>MAX_MAP_AREA_BYTES then return error(6871,"snapshot command: bad area mask length") end if
  areaData=message.readData(msg,areaLength);fresh.areaMask=bytes(MAX_MAP_AREA_BYTES,0)
  if areaLength>0 then for index=0 to areaLength-1 fresh.areaMask[index]=areaData[index] end for end if
  if msg.readcount>msg.cursize then return error(6872,"snapshot command: truncated area mask") end if
  shownet(state,msg,"playerstate")
  if old==void then fresh.playerState=try(delta.readDeltaPlayerstate(msg,void)) else fresh.playerState=try(delta.readDeltaPlayerstate(msg,old.playerState)) end if
  if fresh.playerState is error then return fresh.playerState end if
  if msg.readcount>msg.cursize then return error(6873,"snapshot command: truncated playerstate") end if
  shownet(state,msg,"packet entities")
  entityWork=copyEntityState(state.entityState);entityWork.shownetLevel=state.shownetLevel;entityWork.shownetLines=[]
  parsedEntities=try(snapshotEntities.parsePacketEntities(entityWork,msg,old,fresh))
  if parsedEntities is error then return parsedEntities end if
  commitEntityState(state.entityState,entityWork)
  for each line in entityWork.shownetLines state.shownetLines=state.shownetLines+[line] end for
  if fresh.deltaNum<=0 then state.demoWaiting=false end if
  if not fresh.valid then return fresh end if
  oldMessageNum=state.snap.messageNum+1
  if fresh.messageNum-oldMessageNum>=PACKET_BACKUP then oldMessageNum=fresh.messageNum-(PACKET_BACKUP-1) end if
  while oldMessageNum<fresh.messageNum
    state.snapshots[oldMessageNum&PACKET_MASK].valid=false;oldMessageNum=oldMessageNum+1
  end while
  state.snap=copySnapshot(fresh);calculatePing(state,state.snap)
  state.snapshots[state.snap.messageNum&PACKET_MASK]=copySnapshot(state.snap);state.newSnapshots=true
  return state.snap
end function
