// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_missile.c and the hook/snap helpers from g_weapon.c.
package mq3.game.missiles
import mq3.game.entities as game
import mq3.game.constants as c
import mq3.game.combat as combat
import mq3.game.events as events
import mq3.game.trajectory as trajectory
import mq3.game.snapshot as snapshot
import mq3.game.movement as movement
import mq3.shared.math as q
import mq3.shared.directions as directions
import mq3.compat.numeric as n
/// Set `v[axis]` to `n.f32(value)` in `mq3.game.missiles.snapTowards`.
/// @param v Array or byte sequence accessed at `axis`. Entries are written in place.
/// @param towards Array or byte sequence accessed at `axis`.
function snapTowards(v,towards)
  for axis = 0 to 2
    value = n.trunc32(v[axis])
    if towards[axis] > v[axis] then value = n.add32(value,1) end if
    v[axis] = n.f32(value)
  end for
  return void
end function
/// Increment the owning client's accuracy-hit count and reject missiles without a client owner.
/// @param level Game-level state; accesses `entities`.
/// @param ent Game entity; accesses `r`.
function accuracy(level,ent)
  owner = level.entities[ent.r.ownerNum]
  if owner.client == void then return error(492,"Missile accuracy requires an owner client") end if
  owner.client.accuracy_hits = n.add32(owner.client.accuracy_hits,1)
  return void
end function
/// Require and return the parent client of a grappling-hook entity.
/// @param ent Game entity; accesses `parent`.
function hookClient(ent)
  if ent.parent == void or ent.parent.client == void then return error(492,"Grapple requires a parent client") end if
  return ent.parent.client
end function
/// Apply `mq3.game.missiles.hookClient` and `mq3.game.entities.free` while evaluating `hookFree`. Return paths include `game.free(level,ent)`.
/// @param level Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place.
/// @param ent Game entity; accesses `parent`.
function hookFree(level,ent)
  client = hookClient(ent); client.hook = void; client.ps.pm_flags = client.ps.pm_flags & n.i32(~2048)
  return game.free(level,ent)
end function
/// Calculate the hooked entity's bounding-box center relative to its current world origin.
/// @param other Other record; accesses `r`.
function hookPoint(other)
  point = [0.0,0.0,0.0]
  for axis = 0 to 2
    point[axis] = n.f32(other.r.currentOrigin[axis]+n.fadd(other.r.mins[axis],other.r.maxs[axis])*0.5)
  end for
  return point
end function
/// Apply `mq3.game.missiles.hookPoint`, `mq3.game.missiles.snapTowards` and `mq3.game.entities.setOrigin` while evaluating `hookThink`.
/// @param level Not read by this implementation; retained in the `hookThink` signature.
/// @param ent Game entity; accesses `enemy` and `r`.
function hookThink(level,ent)
  if ent.enemy != void then
    point = hookPoint(ent.enemy); snapTowards(point,ent.r.currentOrigin); game.setOrigin(ent,point)
  end if
  client = hookClient(ent); client.ps.grapplePoint = movement.copy(ent.r.currentOrigin)
  return void
end function
/// Update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]`, `ent.r.currentOrigin[axis]` and `ent.s.pos.trBase` and related state during `bounce`.
/// @param level Game-level state; accesses `previousTime` and `time`.
/// @param ent Game entity; accesses `s` and `r`. May update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]` and `ent.r.currentOrigin[axis]` and additional fields in place.
/// @param hit Hit record; accesses `trace` and `endpos`.
function bounce(level,ent,hit)
  tr = hit.trace
  hitTime = n.trunc32(n.fadd(level.previousTime,n.fmul(n.i32(level.time-level.previousTime),tr.fraction)))
  velocity = trajectory.evaluateDelta(ent.s.pos,hitTime); dot = q.DotProduct(velocity,tr.normal)
  ent.s.pos.trDelta = q.VectorMA(velocity,n.fmul(-2,dot),tr.normal)
  if (ent.s.eFlags & 32) != 0 then
    for axis = 0 to 2
      ent.s.pos.trDelta[axis] = n.f32(ent.s.pos.trDelta[axis]*0.65)
    end for
    if tr.normal[2] > 0.2 and q.VectorLength(ent.s.pos.trDelta) < 40 then game.setOrigin(ent,hit.endpos); return void end if
  end if
  for axis = 0 to 2
    ent.r.currentOrigin[axis] = n.fadd(ent.r.currentOrigin[axis],tr.normal[axis])
  end for
  ent.s.pos.trBase = movement.copy(ent.r.currentOrigin); ent.s.pos.trTime = level.time
  return void
end function
/// Set `ent.s.eType` to `c.ET_GENERAL` and `ent.freeAfterEvent` to `true` in `mq3.game.missiles.explode`. Return paths include `game.link(level,ent)`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`, `freeAfterEvent`, `splashDamage`, `r` and `parent` and related fields. May update `ent.s.eType` and `ent.freeAfterEvent` in place.
function explode(level,ent)
  origin = trajectory.evaluate(ent.s.pos,level.time); snapshot.snapVector(origin); game.setOrigin(ent,origin)
  ent.s.eType = c.ET_GENERAL; events.add(level,ent,c.EV_MISSILE_MISS,directions.dirToByte([0.0,0.0,1.0]))
  ent.freeAfterEvent = true
  if ent.splashDamage != 0 then
    if combat.radiusDamage(level,ent.r.currentOrigin,ent.parent,ent.splashDamage,ent.splashRadius,ent,ent.splashMethodOfDeath) then accuracy(level,ent) end if
  end if
  return game.link(level,ent)
end function
/// Update `ent.enemy`, `ent.s.eType`, `ent.think` and `ent.nextthink` and related state during `impact`. Return paths include `game.link(level,ent)`.
/// @param level Game-level state; accesses `entities` and `time`.
/// @param ent Game entity; accesses `s`, `damage`, `r`, `methodOfDeath` and `classname` and related fields. May update `ent.enemy`, `ent.s.eType` and `ent.think` and additional fields in place.
/// @param hit Hit record; accesses `trace`, `entityNum` and `endpos`.
function impact(level,ent,hit)
  tr = hit.trace; other = level.entities[hit.entityNum]; hitClient = false
  if not other.takedamage and (ent.s.eFlags & 48) != 0 then
    bounce(level,ent,hit); events.add(level,ent,c.EV_GRENADE_BOUNCE,0); return void
  end if
  if other.takedamage and ent.damage != 0 then
    if combat.logAccuracyHit(level,other,level.entities[ent.r.ownerNum]) then accuracy(level,ent); hitClient = true end if
    velocity = trajectory.evaluateDelta(ent.s.pos,level.time)
    if q.VectorLength(velocity) == 0 then velocity[2] = 1.0 end if
    combat.damage(level,other,ent,level.entities[ent.r.ownerNum],velocity,ent.s.origin,ent.damage,0,ent.methodOfDeath)
  end if
  if ent.classname == "hook" then
    created = game.spawn(level); point = [0.0,0.0,0.0]
    if other.takedamage and other.client != void then
      events.add(level,created,c.EV_MISSILE_HIT,directions.dirToByte(tr.normal)); created.s.otherEntityNum = other.s.number
      ent.enemy = other; point = hookPoint(other); snapTowards(point,ent.s.pos.trBase)
    else
      point = movement.copy(hit.endpos); events.add(level,created,c.EV_MISSILE_MISS,directions.dirToByte(tr.normal)); ent.enemy = void
    end if
    snapTowards(point,ent.s.pos.trBase); created.freeAfterEvent = true; created.s.eType = c.ET_GENERAL; ent.s.eType = c.ET_GRAPPLE
    game.setOrigin(ent,point); game.setOrigin(created,point); ent.think = hookThink; ent.nextthink = n.add32(level.time,100)
    client = hookClient(ent); client.ps.pm_flags = client.ps.pm_flags | 2048; client.ps.grapplePoint = movement.copy(ent.r.currentOrigin)
    game.link(level,ent); game.link(level,created); return void
  end if
  if other.takedamage and other.client != void then
    events.add(level,ent,c.EV_MISSILE_HIT,directions.dirToByte(tr.normal)); ent.s.otherEntityNum = other.s.number
  else if (tr.surfaceFlags & 4096) != 0 then events.add(level,ent,c.EV_MISSILE_MISS_METAL,directions.dirToByte(tr.normal))
  else events.add(level,ent,c.EV_MISSILE_MISS,directions.dirToByte(tr.normal)) end if
  ent.freeAfterEvent = true; ent.s.eType = c.ET_GENERAL
  snapTowards(hit.endpos,ent.s.pos.trBase); game.setOrigin(ent,hit.endpos)
  if ent.splashDamage != 0 then
    if combat.radiusDamage(level,hit.endpos,ent.parent,ent.splashDamage,ent.splashRadius,other,ent.splashMethodOfDeath) and not hitClient then accuracy(level,ent) end if
  end if
  return game.link(level,ent)
end function
/// Set `ent.r.currentOrigin` to `movement.copy(hit.endpos)` and `ent.parent.client.hook` to `void` in `mq3.game.missiles.run`. Return paths include `game.runThink(level,ent)`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`, `r`, `target_ent`, `clipmask` and `parent`. May update `ent.r.currentOrigin` and `ent.parent.client.hook` in place.
function run(level,ent)
  origin = trajectory.evaluate(ent.s.pos,level.time); passEntity = ent.r.ownerNum
  if ent.target_ent != void then passEntity = ent.target_ent.s.number end if
  hit = combat.shotTrace(level,ent.r.currentOrigin,origin,ent.r.mins,ent.r.maxs,passEntity,ent.clipmask)
  if hit.trace.startsolid or hit.trace.allsolid then
    hit = combat.shotTrace(level,ent.r.currentOrigin,ent.r.currentOrigin,ent.r.mins,ent.r.maxs,passEntity,ent.clipmask); hit.trace.fraction = 0.0
  else
    ent.r.currentOrigin = movement.copy(hit.endpos)
  end if
  game.link(level,ent)
  if hit.trace.fraction != 1.0 then
    if (hit.trace.surfaceFlags & 16) != 0 then
      if ent.parent != void and ent.parent.client != void and ent.parent.client.hook == ent then ent.parent.client.hook = void end if
      game.free(level,ent); return void
    end if
    impact(level,ent,hit)
    if ent.s.eType != c.ET_MISSILE then return void end if
  end if
  return game.runThink(level,ent)
end function
/// Apply `mq3.game.entities.spawn`, `mq3.game.movement.copy` and `mq3.game.snapshot.snapVector` while evaluating `fire`. Return paths include `ent`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `s`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param dir Value passed as argument 1 to `mq3.shared.math.VectorNormalize`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function fire(level,self,start,dir,weapon)
  // Shared assignments of the five original fire_* routines, in their order.
  if weapon != 4 and weapon != 5 and weapon != 8 and weapon != 9 and weapon != 10 then return error(492,"Unsupported missile weapon") end if
  q.VectorNormalize(dir); ent = game.spawn(level)
  names = ["grenade","rocket","plasma","bfg","hook"]; index = 0
  if weapon == 5 then index = 1 else if weapon == 8 then index = 2 else if weapon == 9 then index = 3 else if weapon == 10 then index = 4 end if
  lifetimes = [2500,15000,10000,10000,10000]; speeds = [700,900,2000,2000,800]
  ent.classname = names[index]; ent.nextthink = n.add32(level.time,lifetimes[index]); ent.think = explode
  if weapon == 10 then ent.think = hookFree end if
  ent.s.eType = c.ET_MISSILE; ent.r.svFlags = 128; ent.s.weapon = weapon
  if weapon == 4 then ent.s.eFlags = 32 end if
  ent.r.ownerNum = self.s.number; ent.parent = self
  if weapon != 10 then
    damageValues = [100,100,20,100]; radii = [150,120,20,120]; mods = [4,6,8,12]
    ent.damage = damageValues[index]; ent.splashDamage = damageValues[index]
    if weapon == 8 then ent.splashDamage = 15 end if
    ent.splashRadius = radii[index]; ent.methodOfDeath = mods[index]; ent.splashMethodOfDeath = mods[index]+1
  else
    ent.methodOfDeath = c.MOD_GRAPPLE
  end if
  ent.clipmask = 0x6000001; ent.target_ent = void; ent.s.pos.trType = c.TR_LINEAR
  if weapon == 4 then ent.s.pos.trType = c.TR_GRAVITY end if
  ent.s.pos.trTime = n.add32(level.time,-50)
  if weapon == 10 then ent.s.otherEntityNum = self.s.number end if
  ent.s.pos.trBase = movement.copy(start); ent.s.pos.trDelta = q.VectorScale(dir,speeds[index]); snapshot.snapVector(ent.s.pos.trDelta)
  ent.r.currentOrigin = movement.copy(start)
  if weapon == 10 then client = hookClient(ent); client.hook = ent end if
  return ent
end function
