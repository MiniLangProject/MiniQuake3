// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.game.triggers
import mq3.game.entities as entities
import mq3.game.constants as c
import mq3.game.jumppad as pad
import mq3.game.trajectory as trajectory
import mq3.game.teleport as teleport
import mq3.game.movement as movement
import mq3.collision.brush as brush
import mq3.server.world as sv
import mq3.compat.numeric as n
function pushTouch(level,self,other,trace)
  if other.client != void then pad.touch(other.client.ps,self.s.number,self.s.origin2) end if
  return void
end function
function teleporterTouch(level,self,other,trace)
  if other.client == void or other.client.ps.pm_type == c.PM_DEAD then return void end if
  if (self.spawnflags & 1) != 0 and other.client.team != c.TEAM_SPECTATOR then return void end if
  dest = entities.pickTarget(level,self.target)
  if dest != void then teleport.player(level,other,dest.s.origin,dest.s.angles) end if
  return void
end function
function touch(level,ent)
  if ent.client == void or ent.client.ps.stats[c.STAT_HEALTH] <= 0 then return void end if
  state = ent.client.ps; range = [40,40,52]; mins = array(3,0.0); maxs = array(3,0.0)
  for axis = 0 to 2
    mins[axis] = n.fsub(state.origin[axis],range[axis]); maxs[axis] = n.fadd(state.origin[axis],range[axis])
  end for
  touchlist = sv.areaEntities(level.scene,mins,maxs,1024)
  for axis = 0 to 2
    mins[axis] = n.fadd(state.origin[axis],ent.r.mins[axis]); maxs[axis] = n.fadd(state.origin[axis],ent.r.maxs[axis])
  end for
  // Keep the original candidate list and contact bounds even if a callback
  // teleports/frees/moves entities during this loop. Item tests read live ps.
  for each number in touchlist
    hit = level.entities[number]
    if hit.touch == void and ent.touch == void then continue end if
    if (hit.r.contents & 0x40000000) == 0 then continue end if
    if ent.client.team == c.TEAM_SPECTATOR then
      door = hit.touch != void and hit.touch == level.doorTouch
      if hit.s.eType != c.ET_TELEPORT_TRIGGER and not door then continue end if
    end if
    if hit.s.eType == c.ET_ITEM then
      if not trajectory.playerTouchesItem(ent.client.ps,hit.s.pos,level.time) then continue end if
    else
      entities.syncSpatial(hit)
      if not sv.entityContact(level.scene,mins,maxs,hit.slot,false) then continue end if
    end if
    trace = movement.Collision(brush.Trace(0.0,[0.0,0.0,0.0],0.0,0,0,false,false,0),[0.0,0.0,0.0],0)
    if hit.touch != void then hit.touch(level,hit,ent,trace) end if
    if (ent.r.svFlags & 8) != 0 and ent.touch != void then ent.touch(level,ent,hit,trace) end if
  end for
  if ent.client.ps.jumppad_frame != ent.client.ps.pmove_framecount then
    ent.client.ps.jumppad_frame = 0; ent.client.ps.jumppad_ent = 0
  end if
  return void
end function
