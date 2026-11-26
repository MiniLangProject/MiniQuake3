// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.game.hazards
import mq3.game.entities as game
import mq3.game.events as events
import mq3.game.combat as combat
import mq3.game.constants as c
import mq3.compat.numeric as n
import mq3.shared.math as q
import mq3.game.movement as movement
/// Update `self.movedir`, `self.s.origin2` and `self.nextthink` during `laserThink`.
/// @param level Game-level state; accesses `entities` and `time`.
/// @param self Entity receiving the callback; accesses `enemy`, `movedir`, `s`, `activator` and `damage` and related fields. May update `self.movedir`, `self.s.origin2` and `self.nextthink` in place.
function laserThink(level,self)
  if self.enemy != void then
    point = [0.0,0.0,0.0]
    for axis = 0 to 2
      // VectorMA is a macro here: its 0.5 argument promotes both operations.
      point[axis] = n.f32(self.enemy.s.origin[axis]+self.enemy.r.mins[axis]*0.5)
      point[axis] = n.f32(point[axis]+self.enemy.r.maxs[axis]*0.5)
    end for
    self.movedir = [n.fsub(point[0],self.s.origin[0]),n.fsub(point[1],self.s.origin[1]),n.fsub(point[2],self.s.origin[2])]
    q.VectorNormalize(self.movedir)
  end if
  finish = q.VectorMA(self.s.origin,2048,self.movedir)
  hit = combat.shotTrace(level,self.s.origin,finish,void,void,self.s.number,0x6000001)
  // Original tests entityNum itself: client slot 0 is deliberately excluded.
  if hit.entityNum != 0 then combat.damage(level,level.entities[hit.entityNum],self,self.activator,self.movedir,hit.endpos,self.damage,combat.DAMAGE_NO_KNOCKBACK,c.MOD_TARGET_LASER) end if
  self.s.origin2 = movement.copy(hit.endpos); game.link(level,self); self.nextthink = n.add32(level.time,100)
  return void
end function
/// Set `self.activator` to `self` in `mq3.game.hazards.laserOn`. Return paths include `laserThink(level,self)`.
/// @param level Game-level state; accesses `entities` and `time`.
/// @param self Entity receiving the callback; accesses `activator`. May update `self.activator` in place.
function laserOn(level,self)
  if self.activator == void then self.activator = self end if
  return laserThink(level,self)
end function
/// Set `self.nextthink` to `0` in `mq3.game.hazards.laserOff`.
/// @param level Game-level state; accesses `scene`.
/// @param self Entity receiving the callback; accesses `nextthink`. May update `self.nextthink` in place.
function laserOff(level,self)
  game.unlink(level,self); self.nextthink = 0
  return void
end function
/// Set `self.activator` to `activator` in `mq3.game.hazards.laserUse`. Return paths include `laserOn(level,self)`.
/// @param level Game-level state; accesses `scene`.
/// @param self Entity receiving the callback; accesses `activator` and `nextthink`. May update `self.activator` in place.
/// @param other Not read by this implementation; retained in the `laserUse` signature.
/// @param activator Entity responsible for activating the target.
function laserUse(level,self,other,activator)
  self.activator = activator
  if self.nextthink > 0 then return laserOff(level,self) end if
  return laserOn(level,self)
end function
/// Apply `mq3.game.entities.unlink` and `mq3.game.entities.link` while evaluating `hurtUse`.
/// @param level Game-level state; accesses `scene`.
/// @param self Entity receiving the callback; accesses `r`.
/// @param other Not read by this implementation; retained in the `hurtUse` signature.
/// @param activator Not read by this implementation; retained in the `hurtUse` signature.
function hurtUse(level,self,other,activator)
  if self.r.linked then game.unlink(level,self) else game.link(level,self) end if
  return void
end function
/// Set `self.timestamp` to `n.add32(level.time,1000)` and `self.timestamp` to `n.add32(level.time,100)` in `mq3.game.hazards.hurtTouch`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `timestamp`, `spawnflags`, `noise_index` and `damage`. May update `self.timestamp` in place.
/// @param other Other record; accesses `takedamage`.
/// @param trace Not read by this implementation; retained in the `hurtTouch` signature.
function hurtTouch(level,self,other,trace)
  if not other.takedamage or self.timestamp > level.time then return void end if
  if (self.spawnflags & 16) != 0 then self.timestamp = n.add32(level.time,1000) else self.timestamp = n.add32(level.time,100) end if
  if (self.spawnflags & 4) == 0 then events.sound(level,other,0,self.noise_index) end if
  dflags = 0
  if (self.spawnflags & 8) != 0 then dflags = combat.DAMAGE_NO_PROTECTION end if
  combat.damage(level,other,self,self,void,void,self.damage,dflags,c.MOD_TRIGGER_HURT)
  return void
end function
/// Forward `killUse` to `mq3.game.combat.damage` and return the delegated result.
/// @param level Game-level state; accesses `intermissionQueued`, `time`, `entities`, `obeliskAttackFn` and `knockback` and related fields.
/// @param self Not read by this implementation; retained in the `killUse` signature.
/// @param other Not read by this implementation; retained in the `killUse` signature.
/// @param activator Entity responsible for activating the target.
function killUse(level,self,other,activator)
  return combat.damage(level,activator,void,void,void,void,100000,combat.DAMAGE_NO_PROTECTION,c.MOD_TELEFRAG)
end function
