// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_misc.c portal surface/camera setup and delayed camera lookup.
package mq3.game.portals
import mq3.game.entities as game
import mq3.game.spawn_values as values
import mq3.game.constants as c
import mq3.shared.directions as directions
import mq3.shared.math as q
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum

/// Update `ent.r.ownerNum`, `ent.s.frame`, `ent.s.powerups` and `ent.s.clientNum` and related state during `locateCamera`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `target`, `r` and `s`. May update `ent.r.ownerNum`, `ent.s.frame` and `ent.s.powerups` and additional fields in place.
function locateCamera(level,ent)
  owner = game.pickTarget(level,ent.target)
  if owner == void then
    if level.gamePrintFn != void then level.gamePrintFn(level,"Couldn't find target for misc_partal_surface\n") end if
    game.free(level,ent); return void
  end if
  ent.r.ownerNum = owner.s.number
  if (owner.spawnflags & 1) != 0 then ent.s.frame = 25
  else if (owner.spawnflags & 2) != 0 then ent.s.frame = 75 end if
  if (owner.spawnflags & 4) != 0 then ent.s.powerups = 0 else ent.s.powerups = 1 end if
  ent.s.clientNum = owner.s.clientNum
  for axis = 0 to 2
    ent.s.origin2[axis] = owner.s.origin[axis]
  end for
  target = game.pickTarget(level,owner.target); dir = void
  if target != void then
    dir = [n.fsub(target.s.origin[0],owner.s.origin[0]),n.fsub(target.s.origin[1],owner.s.origin[1]),n.fsub(target.s.origin[2],owner.s.origin[2])]
    q.VectorNormalize(dir)
  else
    dir = directions.movedirVector(owner.s.angles)
    // G_SetMovedir consumes the owner's angles, including when owner == ent.
    for axis = 0 to 2
      owner.s.angles[axis] = 0.0
    end for
  end if
  ent.s.eventParm = directions.dirToByte(dir)
  return void
end function

/// Update `ent.r.mins[axis]`, `ent.r.maxs[axis]`, `ent.r.svFlags` and `ent.s.eType` and related state during `surface`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `r`, `s`, `target`, `think` and `nextthink`. May update `ent.r.mins[axis]`, `ent.r.maxs[axis]` and `ent.r.svFlags` and additional fields in place.
function surface(level,ent)
  for axis = 0 to 2
    ent.r.mins[axis] = 0.0; ent.r.maxs[axis] = 0.0
  end for
  // The engine observes the old flags and type at this link boundary.
  game.link(level,ent)
  ent.r.svFlags = 0x40; ent.s.eType = c.ET_PORTAL
  if ent.target == void then
    for axis = 0 to 2
      ent.s.origin2[axis] = ent.s.origin[axis]
    end for
  else
    ent.think = locateCamera; ent.nextthink = n.add32(level.time,100)
  end if
  return void
end function

/// Update `ent.r.mins[axis]`, `ent.r.maxs[axis]` and `ent.s.clientNum` during `camera`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `r` and `s`. May update `ent.r.mins[axis]`, `ent.r.maxs[axis]` and `ent.s.clientNum` in place.
function camera(level,ent)
  for axis = 0 to 2
    ent.r.mins[axis] = 0.0; ent.r.maxs[axis] = 0.0
  end for
  game.link(level,ent)
  roll = values.getFloat(level.spawner,"roll","0")[1]
  // 360.0 promotes roll to double; neither operation stores a float or byte.
  offset = roll/360.0*256
  // C truncates before checking int representability. Undefined casts are
  // rejected after the original link, before touching the previous clientNum.
  if (n.floatBits(roll) & 0x7f800000) == 0x7f800000 or offset <= -2147483649.0 or offset >= 2147483648.0 then
    return error(485,"Portal camera roll is outside defined native integer range")
  end if
  ent.s.clientNum = textnum.truncDouble32(offset)
  return void
end function
