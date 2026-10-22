// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete productive facade for code/game/g_trigger.c.
package mq3.game.g_trigger
import mq3.game.entities as game
import mq3.game.constants as c
import mq3.game.spawn_values as values
import mq3.game.targets as targets
import mq3.game.movers as movers
import mq3.game.jumppad as pad
import mq3.game.teleport as teleport
import mq3.game.events as events
import mq3.game.combat as combat
import mq3.game.movement as movement
import mq3.shared.math as q
import mq3.shared.directions as directions
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import mq3.compat.transcendental as crt

const CONTENTS_TRIGGER = 0x40000000
const SVF_NOCLIENT = 1
const FRAMETIME = 100

// Kept because the historical symbol inventory picked the word from the
// g_trigger.c comments. It is also useful to contracts that describe the
// inclusive trigger ranges; it is not an upstream C function.
function between(value,minimum,maximum)
  return value >= minimum and value <= maximum
end function

function InitTrigger(level,self)
  if self.s.angles[0] != 0 or self.s.angles[1] != 0 or self.s.angles[2] != 0 then
    self.movedir = directions.movedirVector(self.s.angles); self.s.angles = [0.0,0.0,0.0]
  end if
  movers.setBrushModel(level,self,self.model)
  self.r.contents = CONTENTS_TRIGGER; self.r.svFlags = SVF_NOCLIENT
  return void
end function

function multi_wait(level,ent)
  ent.nextthink = 0
  return void
end function

function multi_trigger(level,ent,activator)
  ent.activator = activator
  if ent.nextthink != 0 then return void end if
  if activator.client != void then
    if (ent.spawnflags & 1) != 0 and activator.client.team != c.TEAM_RED then return void end if
    if (ent.spawnflags & 2) != 0 and activator.client.team != c.TEAM_BLUE then return void end if
  end if
  targets.useTargets(level,ent,ent.activator)
  if ent.wait > 0 then
    ent.think = multi_wait; ent.nextthink = targets.delayTime(level,ent)
  else
    // The touch traversal still owns self, so defer the free one server frame.
    ent.touch = void; ent.nextthink = n.add32(level.time,FRAMETIME); ent.think = game.free
  end if
  return void
end function

function Use_Multi(level,ent,other,activator)
  return multi_trigger(level,ent,activator)
end function

function Touch_Multi(level,self,other,trace)
  if other.client == void then return void end if
  return multi_trigger(level,self,other)
end function

function SP_trigger_multiple(level,ent)
  ent.wait = values.getFloat(level.spawner,"wait","0.5")[1]
  ent.random = values.getFloat(level.spawner,"random","0")[1]
  if ent.random >= ent.wait and ent.wait >= 0 then
    ent.random = n.fsub(ent.wait,FRAMETIME)
    game.diagnostic(level,"trigger_multiple has random >= wait\n")
  end if
  ent.touch = Touch_Multi; ent.use = Use_Multi
  InitTrigger(level,ent); game.link(level,ent)
  return void
end function

function trigger_always_think(level,ent)
  targets.useTargets(level,ent,ent); game.free(level,ent)
  return void
end function

function SP_trigger_always(level,ent)
  ent.nextthink = n.add32(level.time,300); ent.think = trigger_always_think
  return void
end function

function trigger_push_touch(level,self,other,trace)
  if other.client == void then return void end if
  pad.touch(other.client.ps,self.s.number,self.s.origin2)
  return void
end function

function AimAtTarget(level,self)
  origin = array(3,0.0)
  for axis = 0 to 2
    origin[axis] = n.fmul(n.fadd(self.r.absmin[axis],self.r.absmax[axis]),0.5)
  end for
  ent = game.pickTarget(level,self.target)
  if ent == void then game.free(level,self); return void end if
  height = n.fsub(ent.s.origin[2],origin[2]); gravity = level.spawner.gravity
  ratio = 0.0
  if gravity == 0 then ratio = n.fdiv(height,gravity) else ratio = height/(0.5*gravity) end if
  time = n.f32(crt.sqrt(ratio))
  if time == 0 then game.free(level,self); return void end if
  self.s.origin2 = [n.fsub(ent.s.origin[0],origin[0]),n.fsub(ent.s.origin[1],origin[1]),0.0]
  dist = q.VectorNormalize(self.s.origin2); forward = n.fdiv(dist,time)
  self.s.origin2 = q.VectorScale(self.s.origin2,forward); self.s.origin2[2] = n.fmul(time,gravity)
  return void
end function

function SP_trigger_push(level,self)
  InitTrigger(level,self)
  self.r.svFlags = self.r.svFlags & ~SVF_NOCLIENT
  values.soundIndex(level.spawner,"sound/world/jumppad.wav")
  self.s.eType = c.ET_PUSH_TRIGGER; self.touch = trigger_push_touch
  self.think = AimAtTarget; self.nextthink = n.add32(level.time,FRAMETIME)
  game.link(level,self)
  return void
end function

function Use_target_push(level,self,other,activator)
  if activator.client == void then return void end if
  if activator.client.ps.pm_type != c.PM_NORMAL then return void end if
  if activator.client.ps.powerups[c.PW_FLIGHT] != 0 then return void end if
  activator.client.ps.velocity = movement.copy(self.s.origin2)
  if activator.fly_sound_debounce_time < level.time then
    activator.fly_sound_debounce_time = n.add32(level.time,1500)
    events.sound(level,activator,0,self.noise_index)
  end if
  return void
end function

function SP_target_push(level,self)
  if self.speed == 0 then self.speed = 1000.0 end if
  self.s.origin2 = directions.movedirVector(self.s.angles); self.s.angles = [0.0,0.0,0.0]
  self.s.origin2 = q.VectorScale(self.s.origin2,self.speed)
  if (self.spawnflags & 1) != 0 then self.noise_index = values.soundIndex(level.spawner,"sound/world/jumppad.wav")
  else self.noise_index = values.soundIndex(level.spawner,"sound/misc/windfly.wav") end if
  if self.target != void then
    self.r.absmin = movement.copy(self.s.origin); self.r.absmax = movement.copy(self.s.origin)
    self.think = AimAtTarget; self.nextthink = n.add32(level.time,FRAMETIME)
  end if
  self.use = Use_target_push
  return void
end function

function trigger_teleporter_touch(level,self,other,trace)
  if other.client == void or other.client.ps.pm_type == c.PM_DEAD then return void end if
  if (self.spawnflags & 1) != 0 and other.client.team != c.TEAM_SPECTATOR then return void end if
  dest = game.pickTarget(level,self.target)
  if dest == void then game.diagnostic(level,"Couldn't find teleporter destination\n"); return void end if
  teleport.player(level,other,dest.s.origin,dest.s.angles)
  return void
end function

function SP_trigger_teleport(level,self)
  InitTrigger(level,self)
  if (self.spawnflags & 1) != 0 then self.r.svFlags = self.r.svFlags | SVF_NOCLIENT
  else self.r.svFlags = self.r.svFlags & ~SVF_NOCLIENT end if
  values.soundIndex(level.spawner,"sound/world/jumppad.wav")
  self.s.eType = c.ET_TELEPORT_TRIGGER; self.touch = trigger_teleporter_touch
  game.link(level,self)
  return void
end function

function hurt_use(level,self,other,activator)
  if self.r.linked then game.unlink(level,self) else game.link(level,self) end if
  return void
end function

function hurt_touch(level,self,other,trace)
  if not other.takedamage or self.timestamp > level.time then return void end if
  if (self.spawnflags & 16) != 0 then self.timestamp = n.add32(level.time,1000)
  else self.timestamp = n.add32(level.time,FRAMETIME) end if
  if (self.spawnflags & 4) == 0 then events.sound(level,other,0,self.noise_index) end if
  dflags = 0
  if (self.spawnflags & 8) != 0 then dflags = combat.DAMAGE_NO_PROTECTION end if
  combat.damage(level,other,self,self,void,void,self.damage,dflags,c.MOD_TRIGGER_HURT)
  return void
end function

function SP_trigger_hurt(level,self)
  InitTrigger(level,self)
  self.noise_index = values.soundIndex(level.spawner,"sound/world/electro.wav")
  self.touch = hurt_touch
  if self.damage == 0 then self.damage = 5 end if
  self.r.contents = CONTENTS_TRIGGER
  if (self.spawnflags & 2) != 0 then self.use = hurt_use end if
  if (self.spawnflags & 1) == 0 then game.link(level,self) end if
  return void
end function

function func_timer_think(level,self)
  targets.useTargets(level,self,self.activator)
  randomValue = n.fdiv(game.random(level),32767)
  self.nextthink = textnum.truncDouble32(level.time+1000*(self.wait+(2.0*(randomValue-0.5))*self.random))
  return void
end function

function func_timer_use(level,self,other,activator)
  self.activator = activator
  if self.nextthink != 0 then self.nextthink = 0; return void end if
  return func_timer_think(level,self)
end function

function SP_func_timer(level,self)
  self.random = values.getFloat(level.spawner,"random","1")[1]
  self.wait = values.getFloat(level.spawner,"wait","1")[1]
  self.use = func_timer_use; self.think = func_timer_think
  if self.random >= self.wait then
    self.random = n.fsub(self.wait,FRAMETIME)
    game.diagnostic(level,"func_timer at "+game.vtos(level,self.s.origin)+" has random >= wait\n")
  end if
  if (self.spawnflags & 1) != 0 then
    self.nextthink = n.add32(level.time,FRAMETIME); self.activator = self
  end if
  self.r.svFlags = SVF_NOCLIENT
  return void
end function
