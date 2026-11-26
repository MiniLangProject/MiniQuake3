// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete productive facade for code/game/g_trigger.c.
package mq3.game.g_trigger
import mq3.game.game_headers as headers
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

/// Collision-contents bit identifying trigger space or objects.
const CONTENTS_TRIGGER=headers.CONTENTS_TRIGGER
/// Server entity-flag bit controlling noclient.
const SVF_NOCLIENT = 1
/// Nominal game frame duration in milliseconds.
const FRAMETIME = 100

// Kept because the historical symbol inventory picked the word from the
// g_trigger.c comments. It is also useful to contracts that describe the
// inclusive trigger ranges; it is not an upstream C function.
/// @param value Operand used to evaluate the returned expression `value >= minimum and value <= maximum`.
/// @param minimum Operand used to evaluate the returned expression `value >= minimum and value <= maximum`.
/// @param maximum Upper bound applied by the operation.
function between(value,minimum,maximum)
  return value >= minimum and value <= maximum
end function

/// Update `self.movedir`, `self.s.angles`, `self.r.contents` and `self.r.svFlags` during `InitTrigger`.
/// @param level Game-level state; accesses `scene`.
/// @param self Entity receiving the callback; accesses `s`, `movedir`, `model` and `r`. May update `self.movedir`, `self.s.angles` and `self.r.contents` and additional fields in place.
function InitTrigger(level,self)
  if self.s.angles[0] != 0 or self.s.angles[1] != 0 or self.s.angles[2] != 0 then
    self.movedir = directions.movedirVector(self.s.angles); self.s.angles = [0.0,0.0,0.0]
  end if
  movers.setBrushModel(level,self,self.model)
  self.r.contents = CONTENTS_TRIGGER; self.r.svFlags = SVF_NOCLIENT
  return void
end function

/// Set `ent.nextthink` to `0` in `mq3.game.g_trigger.multi_wait`.
/// @param level Not read by this implementation; retained in the `multi_wait` signature.
/// @param ent Game entity; accesses `nextthink`. May update `ent.nextthink` in place.
function multi_wait(level,ent)
  ent.nextthink = 0
  return void
end function

/// Update `ent.activator`, `ent.think`, `ent.nextthink` and `ent.touch` during `multi_trigger`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `activator`, `nextthink`, `spawnflags`, `wait` and `think` and related fields. May update `ent.activator`, `ent.think` and `ent.nextthink` and additional fields in place.
/// @param activator Activator record; accesses `client`.
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

/// Forward `Use_Multi` to `mq3.game.g_trigger.multi_trigger` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `activator`, `nextthink`, `spawnflags`, `wait` and `think` and related fields. May update `ent.activator`, `ent.think` and `ent.nextthink` and additional fields in place.
/// @param other Not read by this implementation; retained in the `Use_Multi` signature.
/// @param activator Entity responsible for activating the target.
function Use_Multi(level,ent,other,activator)
  return multi_trigger(level,ent,activator)
end function

/// Apply `mq3.game.g_trigger.multi_trigger` while evaluating `Touch_Multi`. Return paths include `multi_trigger(level,self,other)`.
/// @param level Game-level state; accesses `time`.
/// @param self Game entity; accesses `activator`, `nextthink`, `spawnflags`, `wait` and `think` and related fields. May update `self.activator`, `self.think` and `self.nextthink` and additional fields in place.
/// @param other Other record; accesses `client`.
/// @param trace Not read by this implementation; retained in the `Touch_Multi` signature.
function Touch_Multi(level,self,other,trace)
  if other.client == void then return void end if
  return multi_trigger(level,self,other)
end function

/// Update `ent.wait`, `ent.random`, `ent.touch` and `ent.use` during `SP_trigger_multiple`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `wait`, `random`, `touch` and `use`. May update `ent.wait`, `ent.random` and `ent.touch` and additional fields in place.
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

/// Apply `mq3.game.targets.useTargets` and `mq3.game.entities.free` while evaluating `trigger_always_think`.
/// @param level Game-level state; accesses `time`, `spawner`, `num_entities` and `entities`.
/// @param ent Game entity; accesses `targetShaderName`, `targetShaderNewName`, `target` and `inuse`.
function trigger_always_think(level,ent)
  targets.useTargets(level,ent,ent); game.free(level,ent)
  return void
end function

/// Set `ent.nextthink` to `n.add32(level.time,300)` and `ent.think` to `trigger_always_think` in `mq3.game.g_trigger.SP_trigger_always`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `nextthink` and `think`. May update `ent.nextthink` and `ent.think` in place.
function SP_trigger_always(level,ent)
  ent.nextthink = n.add32(level.time,300); ent.think = trigger_always_think
  return void
end function

/// Apply `mq3.game.jumppad.touch` while evaluating `trigger_push_touch`.
/// @param level Not read by this implementation; retained in the `trigger_push_touch` signature.
/// @param self Entity receiving the callback; accesses `s`.
/// @param other Other record; accesses `client`.
/// @param trace Not read by this implementation; retained in the `trigger_push_touch` signature.
function trigger_push_touch(level,self,other,trace)
  if other.client == void then return void end if
  pad.touch(other.client.ps,self.s.number,self.s.origin2)
  return void
end function

/// Update `self.s.origin2` and `self.s.origin2[2]` during `AimAtTarget`.
/// @param level Game-level state; accesses `spawner`.
/// @param self Entity receiving the callback; accesses `r`, `target` and `s`. May update `self.s.origin2` and `self.s.origin2[2]` in place.
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

/// Update `self.r.svFlags`, `self.s.eType`, `self.touch` and `self.think` and related state during `SP_trigger_push`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param self Entity receiving the callback; accesses `r`, `s`, `touch`, `think` and `nextthink`. May update `self.r.svFlags`, `self.s.eType` and `self.touch` and additional fields in place.
function SP_trigger_push(level,self)
  InitTrigger(level,self)
  self.r.svFlags = self.r.svFlags & ~SVF_NOCLIENT
  values.soundIndex(level.spawner,"sound/world/jumppad.wav")
  self.s.eType = c.ET_PUSH_TRIGGER; self.touch = trigger_push_touch
  self.think = AimAtTarget; self.nextthink = n.add32(level.time,FRAMETIME)
  game.link(level,self)
  return void
end function

/// Set `activator.client.ps.velocity` to `movement.copy(self.s.origin2)` and `activator.fly_sound_debounce_time` to `n.add32(level.time,1500)` in `mq3.game.g_trigger.Use_target_push`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `s` and `noise_index`.
/// @param other Not read by this implementation; retained in the `Use_target_push` signature.
/// @param activator Activator record; accesses `client` and `fly_sound_debounce_time`. May update `activator.client.ps.velocity` and `activator.fly_sound_debounce_time` in place.
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

/// Update `self.speed`, `self.s.origin2`, `self.s.angles` and `self.noise_index` and related state during `SP_target_push`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param self Entity receiving the callback; accesses `speed`, `s`, `spawnflags`, `noise_index` and `target` and related fields. May update `self.speed`, `self.s.origin2` and `self.s.angles` and additional fields in place.
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

/// Apply `mq3.game.entities.pickTarget`, `mq3.game.entities.diagnostic` and `mq3.game.teleport.player` while evaluating `trigger_teleporter_touch`.
/// @param level Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`.
/// @param self Entity receiving the callback; accesses `spawnflags` and `target`.
/// @param other Other record; accesses `client`.
/// @param trace Not read by this implementation; retained in the `trigger_teleporter_touch` signature.
function trigger_teleporter_touch(level,self,other,trace)
  if other.client == void or other.client.ps.pm_type == c.PM_DEAD then return void end if
  if (self.spawnflags & 1) != 0 and other.client.team != c.TEAM_SPECTATOR then return void end if
  dest = game.pickTarget(level,self.target)
  if dest == void then game.diagnostic(level,"Couldn't find teleporter destination\n"); return void end if
  teleport.player(level,other,dest.s.origin,dest.s.angles)
  return void
end function

/// Update `self.r.svFlags`, `self.s.eType` and `self.touch` during `SP_trigger_teleport`.
/// @param level Game-level state; accesses `spawner`.
/// @param self Entity receiving the callback; accesses `spawnflags`, `r`, `s` and `touch`. May update `self.r.svFlags`, `self.s.eType` and `self.touch` in place.
function SP_trigger_teleport(level,self)
  InitTrigger(level,self)
  if (self.spawnflags & 1) != 0 then self.r.svFlags = self.r.svFlags | SVF_NOCLIENT
  else self.r.svFlags = self.r.svFlags & ~SVF_NOCLIENT end if
  values.soundIndex(level.spawner,"sound/world/jumppad.wav")
  self.s.eType = c.ET_TELEPORT_TRIGGER; self.touch = trigger_teleporter_touch
  game.link(level,self)
  return void
end function

/// Apply `mq3.game.entities.unlink` and `mq3.game.entities.link` while evaluating `hurt_use`.
/// @param level Game-level state; accesses `scene`.
/// @param self Entity receiving the callback; accesses `r`.
/// @param other Not read by this implementation; retained in the `hurt_use` signature.
/// @param activator Not read by this implementation; retained in the `hurt_use` signature.
function hurt_use(level,self,other,activator)
  if self.r.linked then game.unlink(level,self) else game.link(level,self) end if
  return void
end function

/// Set `self.timestamp` to `n.add32(level.time,1000)` and `self.timestamp` to `n.add32(level.time,FRAMETIME)` in `mq3.game.g_trigger.hurt_touch`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `timestamp`, `spawnflags`, `noise_index` and `damage`. May update `self.timestamp` in place.
/// @param other Other record; accesses `takedamage`.
/// @param trace Not read by this implementation; retained in the `hurt_touch` signature.
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

/// Update `self.noise_index`, `self.touch`, `self.damage` and `self.r.contents` and related state during `SP_trigger_hurt`.
/// @param level Game-level state; accesses `spawner`.
/// @param self Entity receiving the callback; accesses `noise_index`, `touch`, `damage`, `r` and `spawnflags` and related fields. May update `self.noise_index`, `self.touch` and `self.damage` and additional fields in place.
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

/// Update `self.nextthink` during `func_timer_think`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `activator`, `nextthink`, `wait` and `random`. May update `self.nextthink` in place.
function func_timer_think(level,self)
  targets.useTargets(level,self,self.activator)
  randomValue = n.fdiv(game.random(level),32767)
  self.nextthink = textnum.truncDouble32(level.time+1000*(self.wait+(2.0*(randomValue-0.5))*self.random))
  return void
end function

/// Set `self.activator` to `activator` and `self.nextthink` to `0` in `mq3.game.g_trigger.func_timer_use`. Return paths include `func_timer_think(level,self)`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `activator` and `nextthink`. May update `self.activator` and `self.nextthink` in place.
/// @param other Not read by this implementation; retained in the `func_timer_use` signature.
/// @param activator Entity responsible for activating the target.
function func_timer_use(level,self,other,activator)
  self.activator = activator
  if self.nextthink != 0 then self.nextthink = 0; return void end if
  return func_timer_think(level,self)
end function

/// Update `self.random`, `self.wait`, `self.use` and `self.think` and related state during `SP_func_timer`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param self Entity receiving the callback; accesses `random`, `wait`, `use`, `think` and `s` and related fields. May update `self.random`, `self.wait` and `self.use` and additional fields in place.
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
