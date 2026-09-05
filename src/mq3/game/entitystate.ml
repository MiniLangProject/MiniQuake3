// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Generated from pinned q_shared.h; storage layout, not delta network encoding.
package mq3.game.entitystate
import mq3.compat.numeric as n
import mq3.game.trajectory as tr
const BYTE_SIZE = 208
struct EntityState
  number
  eType
  eFlags
  pos
  apos
  time
  time2
  origin
  origin2
  angles
  angles2
  otherEntityNum
  otherEntityNum2
  groundEntityNum
  constantLight
  loopSound
  modelindex
  modelindex2
  clientNum
  frame
  solid
  event
  eventParm
  powerups
  weapon
  legsAnim
  torsoAnim
  generic1
end struct

function create()
  return EntityState(0,0,0,tr.Trajectory(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]),tr.Trajectory(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]),0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
end function

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

function words(state)
  result = []
  result = result+[n.u32(state.number)]
  result = result+[n.u32(state.eType)]
  result = result+[n.u32(state.eFlags)]
  result = result+[n.u32(state.pos.trType)]
  result = result+[n.u32(state.pos.trTime)]
  result = result+[n.u32(state.pos.trDuration)]
  result = result+[n.floatBits(state.pos.trBase[0]),n.floatBits(state.pos.trBase[1]),n.floatBits(state.pos.trBase[2])]
  result = result+[n.floatBits(state.pos.trDelta[0]),n.floatBits(state.pos.trDelta[1]),n.floatBits(state.pos.trDelta[2])]
  result = result+[n.u32(state.apos.trType)]
  result = result+[n.u32(state.apos.trTime)]
  result = result+[n.u32(state.apos.trDuration)]
  result = result+[n.floatBits(state.apos.trBase[0]),n.floatBits(state.apos.trBase[1]),n.floatBits(state.apos.trBase[2])]
  result = result+[n.floatBits(state.apos.trDelta[0]),n.floatBits(state.apos.trDelta[1]),n.floatBits(state.apos.trDelta[2])]
  result = result+[n.u32(state.time)]
  result = result+[n.u32(state.time2)]
  result = result+[n.floatBits(state.origin[0]),n.floatBits(state.origin[1]),n.floatBits(state.origin[2])]
  result = result+[n.floatBits(state.origin2[0]),n.floatBits(state.origin2[1]),n.floatBits(state.origin2[2])]
  result = result+[n.floatBits(state.angles[0]),n.floatBits(state.angles[1]),n.floatBits(state.angles[2])]
  result = result+[n.floatBits(state.angles2[0]),n.floatBits(state.angles2[1]),n.floatBits(state.angles2[2])]
  result = result+[n.u32(state.otherEntityNum)]
  result = result+[n.u32(state.otherEntityNum2)]
  result = result+[n.u32(state.groundEntityNum)]
  result = result+[n.u32(state.constantLight)]
  result = result+[n.u32(state.loopSound)]
  result = result+[n.u32(state.modelindex)]
  result = result+[n.u32(state.modelindex2)]
  result = result+[n.u32(state.clientNum)]
  result = result+[n.u32(state.frame)]
  result = result+[n.u32(state.solid)]
  result = result+[n.u32(state.event)]
  result = result+[n.u32(state.eventParm)]
  result = result+[n.u32(state.powerups)]
  result = result+[n.u32(state.weapon)]
  result = result+[n.u32(state.legsAnim)]
  result = result+[n.u32(state.torsoAnim)]
  result = result+[n.u32(state.generic1)]
  return result
end function
