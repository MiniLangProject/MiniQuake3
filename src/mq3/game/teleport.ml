// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.game.teleport
import mq3.game.entities as entities
import mq3.game.constants as c
import mq3.game.snapshot as snapshot
import mq3.game.movement as movement
import mq3.server.world as sv
import mq3.shared.math as q
import mq3.compat.numeric as n
function setClientViewAngle(ent,angles)
  for axis = 0 to 2
    // ANGLE2SHORT uses two float operations, unlike AngleNormalize360.
    cmdAngle = n.trunc32(n.fdiv(n.fmul(angles[axis],65536),360)) & 65535
    ent.client.ps.delta_angles[axis] = n.i32(cmdAngle-ent.client.cmdAngles[axis])
  end for
  ent.s.angles = movement.copy(angles); ent.client.ps.viewangles = movement.copy(ent.s.angles)
  return void
end function
function killBox(level,ent)
  mins = array(3,0.0); maxs = array(3,0.0)
  for axis = 0 to 2
    mins[axis] = n.fadd(ent.client.ps.origin[axis],ent.r.mins[axis]); maxs[axis] = n.fadd(ent.client.ps.origin[axis],ent.r.maxs[axis])
  end for
  for each number in sv.areaEntities(level.scene,mins,maxs,1024)
    hit = level.entities[number]
    if hit.client == void then continue end if
    if level.damageFn == void then return error(484,"G_KillBox requires the game damage callback") end if
    level.damageFn(level,hit,ent,ent,void,void,100000,8,c.MOD_TELEFRAG)
  end for
  return void
end function
function player(level,ent,origin,angles)
  if ent.client == void then return error(484,"TeleportPlayer requires a client") end if
  if ent.client.team != c.TEAM_SPECTATOR then
    tent = entities.tempEntity(level,ent.client.ps.origin,c.EV_PLAYER_TELEPORT_OUT); tent.s.clientNum = ent.s.clientNum
    tent = entities.tempEntity(level,origin,c.EV_PLAYER_TELEPORT_IN); tent.s.clientNum = ent.s.clientNum
  end if
  entities.unlink(level,ent)
  state = ent.client.ps; state.origin = movement.copy(origin); state.origin[2] = n.fadd(state.origin[2],1.0)
  axes = q.AngleVectors(angles); state.velocity = q.VectorScale(axes[0],400)
  state.pm_time = 160; state.pm_flags = state.pm_flags | 64; state.eFlags = state.eFlags ^ 4
  setClientViewAngle(ent,angles)
  if ent.client.team != c.TEAM_SPECTATOR then killBox(level,ent) end if
  snapshot.fromPlayer(state,ent.s,true); ent.r.currentOrigin = movement.copy(state.origin)
  if ent.client.team != c.TEAM_SPECTATOR then entities.link(level,ent) end if
  return void
end function
