// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BG_PlayerStateToEntityState and ExtraPolate. Untouched fields stay untouched.
package mq3.game.snapshot
import mq3.game.constants as c
import mq3.game.movement as movement
import mq3.compat.numeric as n
function snapVector(v)
  // The game macro casts to int (truncates); trap_SnapVector rounds nearest.
  for axis = 0 to 2
    v[axis] = n.f32(n.trunc32(v[axis]))
  end for
  return void
end function
function convert(ps,s,snap,extrapolate,time)
  s.eType = c.ET_PLAYER
  if ps.pm_type == c.PM_INTERMISSION or ps.pm_type == c.PM_SPECTATOR or ps.stats[c.STAT_HEALTH] <= -40 then s.eType = c.ET_INVISIBLE end if
  s.number = ps.clientNum; s.pos.trType = c.TR_INTERPOLATE
  if extrapolate then s.pos.trType = c.TR_LINEAR_STOP end if
  s.pos.trBase = movement.copy(ps.origin)
  if snap then snapVector(s.pos.trBase) end if
  s.pos.trDelta = movement.copy(ps.velocity)
  if extrapolate then s.pos.trTime = time; s.pos.trDuration = 50 end if
  s.apos.trType = c.TR_INTERPOLATE; s.apos.trBase = movement.copy(ps.viewangles)
  if snap then snapVector(s.apos.trBase) end if
  s.angles2[1] = n.f32(ps.movementDir); s.legsAnim = ps.legsAnim; s.torsoAnim = ps.torsoAnim; s.clientNum = ps.clientNum
  s.eFlags = ps.eFlags
  if ps.stats[c.STAT_HEALTH] <= 0 then s.eFlags = s.eFlags | 1 else s.eFlags = s.eFlags & ~1 end if
  if ps.externalEvent != 0 then s.event = ps.externalEvent; s.eventParm = ps.externalEventParm
  else if ps.entityEventSequence < ps.eventSequence then
    if ps.entityEventSequence < n.add32(ps.eventSequence,-2) then ps.entityEventSequence = n.add32(ps.eventSequence,-2) end if
    seq = ps.entityEventSequence & 1
    s.event = ps.events[seq] | ((ps.entityEventSequence & 3) << 8); s.eventParm = ps.eventParms[seq]
    ps.entityEventSequence = n.add32(ps.entityEventSequence,1)
  end if
  s.weapon = ps.weapon; s.groundEntityNum = ps.groundEntityNum; s.powerups = 0
  for i = 0 to 15
    if ps.powerups[i] != 0 then s.powerups = s.powerups | (1 << i) end if
  end for
  s.loopSound = ps.loopSound; s.generic1 = ps.generic1
  return void
end function
function fromPlayer(ps,s,snap)
  return convert(ps,s,snap,false,0)
end function
function extrapolate(ps,s,time,snap)
  return convert(ps,s,snap,true,time)
end function
