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

struct OutPacket
  serverTime
  realtime
end struct

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
end struct

function emptySnapshot()
  return Snapshot(false,0,0,0,0,0,bytes(MAX_MAP_AREA_BYTES,0),playerstate.create(),0,0,0)
end function

function copyAreaMask(source)
  result=bytes(MAX_MAP_AREA_BYTES,0)
  if source!=void then
    count=len(source);if count>MAX_MAP_AREA_BYTES then count=MAX_MAP_AREA_BYTES end if
    if count>0 then for index=0 to count-1 result[index]=source[index] end for end if
  end if
  return result
end function

function copySnapshot(source)
  if source==void then return emptySnapshot() end if
  return Snapshot(source.valid,source.snapFlags,source.serverTime,source.messageNum,source.deltaNum,source.ping,copyAreaMask(source.areaMask),
    playerstate.copy(source.playerState),source.numEntities,source.parseEntitiesNum,source.serverCommandNum)
end function

function create()
  shots=array(PACKET_BACKUP,void);packets=array(PACKET_BACKUP,void)
  for index=0 to PACKET_BACKUP-1 shots[index]=emptySnapshot();packets[index]=OutPacket(0,0) end for
  return State(snapshotEntities.createState(),shots,emptySnapshot(),packets,0,0,0,0,true,false)
end function

function oldFrameFor(state,newSnapshot)
  if newSnapshot.deltaNum<=0 then newSnapshot.valid=true;state.demoWaiting=false;return void end if
  old=state.snapshots[newSnapshot.deltaNum&PACKET_MASK]
  if old.valid and old.messageNum==newSnapshot.deltaNum and state.entityState.parseEntitiesNum-old.parseEntitiesNum<=MAX_PARSE_ENTITIES-128 then newSnapshot.valid=true end if
  return old
end function

function calculatePing(state,snapshot)
  snapshot.ping=999;index=0
  while index<PACKET_BACKUP
    packetNum=(state.outgoingSequence-1-index)&PACKET_MASK;packet=state.outPackets[packetNum]
    if snapshot.playerState.commandTime>=packet.serverTime then snapshot.ping=state.realtime-packet.realtime;return void end if
    index=index+1
  end while
  return void
end function

// `svc_snapshot` has already been consumed by CL_ParseServerMessage.
// Invalid deltas are fully consumed and populate the parse-entity ring like C,
// but are not promoted to the current/backup snapshot.
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
  if old==void then fresh.playerState=delta.readDeltaPlayerstate(msg,void) else fresh.playerState=delta.readDeltaPlayerstate(msg,old.playerState) end if
  snapshotEntities.parsePacketEntities(state.entityState,msg,old,fresh)
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
