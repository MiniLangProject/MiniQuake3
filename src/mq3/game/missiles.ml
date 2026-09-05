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
function snapTowards(v,towards)
  for axis = 0 to 2
    value = n.trunc32(v[axis])
    if towards[axis] > v[axis] then value = n.add32(value,1) end if
    v[axis] = n.f32(value)
  end for
  return void
end function
function accuracy(level,ent)
  owner = level.entities[ent.r.ownerNum]
  if owner.client == void then return error(492,"Missile accuracy requires an owner client") end if
  owner.client.accuracy_hits = n.add32(owner.client.accuracy_hits,1)
  return void
end function
function hookClient(ent)
  if ent.parent == void or ent.parent.client == void then return error(492,"Grapple requires a parent client") end if
  return ent.parent.client
end function
function hookFree(level,ent)
  client = hookClient(ent); client.hook = void; client.ps.pm_flags = client.ps.pm_flags & n.i32(~2048)
  return game.free(level,ent)
end function
function hookPoint(other)
  point = [0.0,0.0,0.0]
  for axis = 0 to 2
    point[axis] = n.f32(other.r.currentOrigin[axis]+n.fadd(other.r.mins[axis],other.r.maxs[axis])*0.5)
  end for
  return point
end function
function hookThink(level,ent)
  if ent.enemy != void then
    point = hookPoint(ent.enemy); snapTowards(point,ent.r.currentOrigin); game.setOrigin(ent,point)
  end if
  client = hookClient(ent); client.ps.grapplePoint = movement.copy(ent.r.currentOrigin)
  return void
end function
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
function explode(level,ent)
  origin = trajectory.evaluate(ent.s.pos,level.time); snapshot.snapVector(origin); game.setOrigin(ent,origin)
  ent.s.eType = c.ET_GENERAL; events.add(level,ent,c.EV_MISSILE_MISS,directions.dirToByte([0.0,0.0,1.0]))
  ent.freeAfterEvent = true
  if ent.splashDamage != 0 then
    if combat.radiusDamage(level,ent.r.currentOrigin,ent.parent,ent.splashDamage,ent.splashRadius,ent,ent.splashMethodOfDeath) then accuracy(level,ent) end if
  end if
  return game.link(level,ent)
end function
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
