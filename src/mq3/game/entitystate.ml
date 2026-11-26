// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Generated from pinned q_shared.h; storage layout, not delta network encoding.
package mq3.game.entitystate
import mq3.compat.numeric as n
import mq3.game.trajectory as tr
/// Byte size used for byte storage or binary layout in mq3.game.entitystate.
const BYTE_SIZE = 208
/// `EntityState` record for entitystate, containing `number`, `eType`, `eFlags`, `pos` and `apos` and related fields.
struct EntityState
  /// Network entity slot number.
  number
  /// Network entity category selected from the ET_* constants.
  eType
  /// Network-visible entity flags selected from the EF_* constants.
  eFlags
  /// Position trajectory carried by the network entity state.
  pos
  /// Angular trajectory carried by the network entity state.
  apos
  /// Primary game timestamp carried by the network entity state.
  time
  /// Secondary game timestamp carried by the entity state.
  time2
  /// Entity origin carried by the networked entity-state record.
  origin
  /// Secondary position/vector channel carried by the entity state.
  origin2
  /// Orientation angles used by the entity or movement operation.
  angles
  /// Secondary angular channel carried by the entity state.
  angles2
  /// Primary related entity number carried by an entity event or snapshot.
  otherEntityNum
  /// Secondary related entity number carried by an entity event or snapshot.
  otherEntityNum2
  /// Entity number supporting the player, or ENTITYNUM_NONE while airborne.
  groundEntityNum
  /// Packed constant-light color and intensity associated with the entity.
  constantLight
  /// Continuously playing sound identifier associated with the entity state.
  loopSound
  /// Primary model index referenced by the entity snapshot.
  modelindex
  /// Secondary model index referenced by the entity snapshot.
  modelindex2
  /// Client slot number represented by this player state.
  clientNum
  /// Model animation frame carried by the entity state.
  frame
  /// Encoded collision representation advertised by the entity state.
  solid
  /// Transient event identifier associated with the entity or snapshot.
  event
  /// Parameter accompanying the current entity event.
  eventParm
  /// Powerup state or expiration values indexed by PW_* identifiers.
  powerups
  /// Selected or reported weapon identifier.
  weapon
  /// Leg-animation identifier including its restart toggle bit.
  legsAnim
  /// Torso-animation identifier including its restart toggle bit.
  torsoAnim
  /// Protocol-defined auxiliary entity/player value whose interpretation depends on the game object
  /// type.
  generic1
end struct

/// Create a `mq3.game.entitystate.EntityState` record, initializing `pos` as `tr.Trajectory(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0])`, `apos` as `tr.Trajectory(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0])` and `origin` as `[0.0,0.0,0.0]`.
function create()
  return EntityState(0,0,0,tr.Trajectory(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]),tr.Trajectory(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]),0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
end function

/// Populate an entity state from its ordered snapshot-word representation.
/// @param data Sequence whose length bounds the iteration or lookup in `load`.
/// @param offset Offset into the buffer or sequence used by this operation.
function load(data,offset)
  if offset < 0 or offset+BYTE_SIZE > len(data) then return error(482,"Truncated entityState") end if
  state = create()
  state.number = n.readI32(data,offset+0)
  state.eType = n.readI32(data,offset+4)
  state.eFlags = n.readI32(data,offset+8)
  state.pos.trType = n.readI32(data,offset+12)
  state.pos.trTime = n.readI32(data,offset+16)
  state.pos.trDuration = n.readI32(data,offset+20)
  state.pos.trBase = [n.bitsFloat(n.readI32(data,offset+24)),n.bitsFloat(n.readI32(data,offset+28)),n.bitsFloat(n.readI32(data,offset+32))]
  state.pos.trDelta = [n.bitsFloat(n.readI32(data,offset+36)),n.bitsFloat(n.readI32(data,offset+40)),n.bitsFloat(n.readI32(data,offset+44))]
  state.apos.trType = n.readI32(data,offset+48)
  state.apos.trTime = n.readI32(data,offset+52)
  state.apos.trDuration = n.readI32(data,offset+56)
  state.apos.trBase = [n.bitsFloat(n.readI32(data,offset+60)),n.bitsFloat(n.readI32(data,offset+64)),n.bitsFloat(n.readI32(data,offset+68))]
  state.apos.trDelta = [n.bitsFloat(n.readI32(data,offset+72)),n.bitsFloat(n.readI32(data,offset+76)),n.bitsFloat(n.readI32(data,offset+80))]
  state.time = n.readI32(data,offset+84)
  state.time2 = n.readI32(data,offset+88)
  state.origin = [n.bitsFloat(n.readI32(data,offset+92)),n.bitsFloat(n.readI32(data,offset+96)),n.bitsFloat(n.readI32(data,offset+100))]
  state.origin2 = [n.bitsFloat(n.readI32(data,offset+104)),n.bitsFloat(n.readI32(data,offset+108)),n.bitsFloat(n.readI32(data,offset+112))]
  state.angles = [n.bitsFloat(n.readI32(data,offset+116)),n.bitsFloat(n.readI32(data,offset+120)),n.bitsFloat(n.readI32(data,offset+124))]
  state.angles2 = [n.bitsFloat(n.readI32(data,offset+128)),n.bitsFloat(n.readI32(data,offset+132)),n.bitsFloat(n.readI32(data,offset+136))]
  state.otherEntityNum = n.readI32(data,offset+140)
  state.otherEntityNum2 = n.readI32(data,offset+144)
  state.groundEntityNum = n.readI32(data,offset+148)
  state.constantLight = n.readI32(data,offset+152)
  state.loopSound = n.readI32(data,offset+156)
  state.modelindex = n.readI32(data,offset+160)
  state.modelindex2 = n.readI32(data,offset+164)
  state.clientNum = n.readI32(data,offset+168)
  state.frame = n.readI32(data,offset+172)
  state.solid = n.readI32(data,offset+176)
  state.event = n.readI32(data,offset+180)
  state.eventParm = n.readI32(data,offset+184)
  state.powerups = n.readI32(data,offset+188)
  state.weapon = n.readI32(data,offset+192)
  state.legsAnim = n.readI32(data,offset+196)
  state.torsoAnim = n.readI32(data,offset+200)
  state.generic1 = n.readI32(data,offset+204)
  return state
end function

/// Serialize an entity state into the ordered 32-bit words used by Quake III snapshot fields.
/// @param state Entitystate state; accesses `number`, `eType`, `eFlags`, `pos` and `apos` and related fields.
function words(state)
  return [
    n.u32(state.number),
    n.u32(state.eType),
    n.u32(state.eFlags),
    n.u32(state.pos.trType),
    n.u32(state.pos.trTime),
    n.u32(state.pos.trDuration),
    n.floatBits(state.pos.trBase[0]),n.floatBits(state.pos.trBase[1]),n.floatBits(state.pos.trBase[2]),
    n.floatBits(state.pos.trDelta[0]),n.floatBits(state.pos.trDelta[1]),n.floatBits(state.pos.trDelta[2]),
    n.u32(state.apos.trType),
    n.u32(state.apos.trTime),
    n.u32(state.apos.trDuration),
    n.floatBits(state.apos.trBase[0]),n.floatBits(state.apos.trBase[1]),n.floatBits(state.apos.trBase[2]),
    n.floatBits(state.apos.trDelta[0]),n.floatBits(state.apos.trDelta[1]),n.floatBits(state.apos.trDelta[2]),
    n.u32(state.time),
    n.u32(state.time2),
    n.floatBits(state.origin[0]),n.floatBits(state.origin[1]),n.floatBits(state.origin[2]),
    n.floatBits(state.origin2[0]),n.floatBits(state.origin2[1]),n.floatBits(state.origin2[2]),
    n.floatBits(state.angles[0]),n.floatBits(state.angles[1]),n.floatBits(state.angles[2]),
    n.floatBits(state.angles2[0]),n.floatBits(state.angles2[1]),n.floatBits(state.angles2[2]),
    n.u32(state.otherEntityNum),
    n.u32(state.otherEntityNum2),
    n.u32(state.groundEntityNum),
    n.u32(state.constantLight),
    n.u32(state.loopSound),
    n.u32(state.modelindex),
    n.u32(state.modelindex2),
    n.u32(state.clientNum),
    n.u32(state.frame),
    n.u32(state.solid),
    n.u32(state.event),
    n.u32(state.eventParm),
    n.u32(state.powerups),
    n.u32(state.weapon),
    n.u32(state.legsAnim),
    n.u32(state.torsoAnim),
    n.u32(state.generic1)
  ]
end function

/// Apply `mq3.game.entitystate.create` while evaluating `copy`. Return paths include `state`.
/// @param source Parser source state; accesses `number`, `eType`, `eFlags`, `pos` and `apos` and related fields.
function copy(source)
  state = create()
  state.number = source.number
  state.eType = source.eType
  state.eFlags = source.eFlags
  state.pos.trType = source.pos.trType
  state.pos.trTime = source.pos.trTime
  state.pos.trDuration = source.pos.trDuration
  state.pos.trBase = [source.pos.trBase[0],source.pos.trBase[1],source.pos.trBase[2]]
  state.pos.trDelta = [source.pos.trDelta[0],source.pos.trDelta[1],source.pos.trDelta[2]]
  state.apos.trType = source.apos.trType
  state.apos.trTime = source.apos.trTime
  state.apos.trDuration = source.apos.trDuration
  state.apos.trBase = [source.apos.trBase[0],source.apos.trBase[1],source.apos.trBase[2]]
  state.apos.trDelta = [source.apos.trDelta[0],source.apos.trDelta[1],source.apos.trDelta[2]]
  state.time = source.time
  state.time2 = source.time2
  state.origin = [source.origin[0],source.origin[1],source.origin[2]]
  state.origin2 = [source.origin2[0],source.origin2[1],source.origin2[2]]
  state.angles = [source.angles[0],source.angles[1],source.angles[2]]
  state.angles2 = [source.angles2[0],source.angles2[1],source.angles2[2]]
  state.otherEntityNum = source.otherEntityNum
  state.otherEntityNum2 = source.otherEntityNum2
  state.groundEntityNum = source.groundEntityNum
  state.constantLight = source.constantLight
  state.loopSound = source.loopSound
  state.modelindex = source.modelindex
  state.modelindex2 = source.modelindex2
  state.clientNum = source.clientNum
  state.frame = source.frame
  state.solid = source.solid
  state.event = source.event
  state.eventParm = source.eventParm
  state.powerups = source.powerups
  state.weapon = source.weapon
  state.legsAnim = source.legsAnim
  state.torsoAnim = source.torsoAnim
  state.generic1 = source.generic1
  return state
end function
