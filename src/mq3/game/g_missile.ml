// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/game/g_missile.c surface.  The exact-tested Baseq3 kernel
// remains in missiles.ml; this layer supplies every MISSIONPACK branch and is
// the productive entity-frame entry point.
package mq3.game.g_missile
import mq3.game.game_headers as headers
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.missiles as missileBase
import mq3.game.g_weapon as weapon
import mq3.game.combat as combat
import mq3.game.events as events
import mq3.game.trajectory as trajectory
import mq3.game.snapshot as snapshot
import mq3.game.movement as movement
import mq3.game.spawn_values as values
import mq3.shared.math as q
import mq3.shared.directions as directions
import mq3.compat.numeric as n

const WP_NAILGUN = 11
const WP_PROX_LAUNCHER = 12
const MOD_PROXIMITY_MINE = 26
const MOD_JUICED = 28
const EF_TICKING = 0x00000002
const EF_BOUNCE_HALF = 0x00000020
const EF_NODRAW = 0x00000080
const SVF_NOCLIENT = 0x00000001
const SVF_USE_CURRENT_ORIGIN = 0x00000080
const CONTENTS_TRIGGER=headers.CONTENTS_TRIGGER
const MASK_SHOT = 0x06000001
const ENTITYNUM_NONE = 1023
const DAMAGE_NO_KNOCKBACK = 4

function G_BounceMissile(level,ent,hit) return missileBase.bounce(level,ent,hit) end function
function G_ExplodeMissile(level,ent) return missileBase.explode(level,ent) end function

function ProximityMine_Explode(level,mine)
  G_ExplodeMissile(level,mine)
  if mine.activator != void then game.free(level,mine.activator); mine.activator = void end if
  return void
end function

function ProximityMine_Die(level,ent,inflictor,attacker,damage,mod)
  ent.think = ProximityMine_Explode; ent.nextthink = n.add32(level.time,1)
  return void
end function

function gameType(level)
  if level.spawner == void then return 0 end if
  return level.spawner.gametype
end function

function ProximityMine_Trigger(level,trigger,other,trace)
  if other.client == void then return void end if
  delta = [n.fsub(trigger.s.pos.trBase[0],other.s.pos.trBase[0]),n.fsub(trigger.s.pos.trBase[1],other.s.pos.trBase[1]),n.fsub(trigger.s.pos.trBase[2],other.s.pos.trBase[2])]
  if q.VectorLength(delta) > trigger.parent.splashRadius then return void end if
  if gameType(level) >= 3 and trigger.parent.s.generic1 == other.client.team then return void end if
  if not combat.canDamage(level,other,trigger.s.pos.trBase) then return void end if
  mine = trigger.parent; mine.s.loopSound = 0; events.add(level,mine,c.EV_PROXIMITY_MINE_TRIGGER,0)
  mine.nextthink = n.add32(level.time,500); game.free(level,trigger); mine.activator = void
  return void
end function

function ProximityMine_Activate(level,ent)
  ent.think = ProximityMine_Explode; ent.nextthink = n.add32(level.time,20000)
  ent.takedamage = true; ent.health = 1; ent.die = ProximityMine_Die
  if level.spawner != void then ent.s.loopSound = values.soundIndex(level.spawner,"sound/weapons/proxmine/wstbtick.wav") end if
  trigger = game.spawn(level); trigger.classname = "proxmine_trigger"; radius = n.f32(ent.splashRadius)
  trigger.r.mins = [n.fneg(radius),n.fneg(radius),n.fneg(radius)]; trigger.r.maxs = [radius,radius,radius]
  game.setOrigin(trigger,ent.s.pos.trBase); trigger.parent = ent; trigger.r.contents = CONTENTS_TRIGGER; trigger.touch = ProximityMine_Trigger
  game.link(level,trigger); ent.activator = trigger
  return trigger
end function

function ProximityMine_ExplodeOnPlayer(level,mine)
  player = mine.enemy; player.client.ps.eFlags = player.client.ps.eFlags & n.i32(~EF_TICKING)
  if player.client.invulnerabilityTime > level.time then
    combat.damage(level,player,mine.parent,mine.parent,[0.0,0.0,0.0],mine.s.origin,1000,DAMAGE_NO_KNOCKBACK,MOD_JUICED)
    player.client.invulnerabilityTime = 0; game.tempEntity(level,player.client.ps.origin,c.EV_JUICED)
  else
    game.setOrigin(mine,player.s.pos.trBase); mine.r.svFlags = mine.r.svFlags & n.i32(~SVF_NOCLIENT)
    mine.splashMethodOfDeath = MOD_PROXIMITY_MINE; G_ExplodeMissile(level,mine)
  end if
  return void
end function

function ProximityMine_Player(level,mine,player)
  if (mine.s.eFlags & EF_NODRAW) != 0 then return void end if
  events.add(level,mine,c.EV_PROXIMITY_MINE_STICK,0)
  if (player.s.eFlags & EF_TICKING) != 0 then
    player.activator.splashDamage = n.add32(player.activator.splashDamage,mine.splashDamage)
    player.activator.splashRadius = n.fmul(player.activator.splashRadius,1.5)
    mine.think = game.free; mine.nextthink = level.time; return void
  end if
  player.client.ps.eFlags = player.client.ps.eFlags | EF_TICKING; player.activator = mine
  mine.s.eFlags = mine.s.eFlags | EF_NODRAW; mine.r.svFlags = mine.r.svFlags | SVF_NOCLIENT
  mine.s.pos.trType = c.TR_LINEAR; mine.s.pos.trDelta = [0.0,0.0,0.0]; mine.enemy = player; mine.think = ProximityMine_ExplodeOnPlayer
  if player.client.invulnerabilityTime > level.time then mine.nextthink = n.add32(level.time,2000) else mine.nextthink = n.add32(level.time,10000) end if
  return void
end function

// Exact RaySphereIntersections/G_InvulnerabilityEffect geometry used by the
// Team Arena projectile reflection branch.
function invulnerabilityEffect(level,target,direction,point)
  if target.client == void then return [false,[0.0,0.0,0.0],[0.0,0.0,0.0]] end if
  ray = [n.fneg(direction[0]),n.fneg(direction[1]),n.fneg(direction[2])]; q.VectorNormalize(ray)
  offset = [n.fsub(point[0],target.client.ps.origin[0]),n.fsub(point[1],target.client.ps.origin[1]),n.fsub(point[2],target.client.ps.origin[2])]
  b = n.fmul(2.0,q.DotProduct(ray,offset)); cc = n.fsub(q.DotProduct(offset,offset),1764.0); discriminant = n.fsub(n.fmul(b,b),n.fmul(4.0,cc))
  if discriminant < 0 then return [false,[0.0,0.0,0.0],[0.0,0.0,0.0]] end if
  t = n.fdiv(n.fadd(n.fneg(b),n.fsqrt(discriminant)),2.0); impactPoint = q.VectorMA(point,t,ray)
  bounced = [n.fsub(impactPoint[0],target.client.ps.origin[0]),n.fsub(impactPoint[1],target.client.ps.origin[1]),n.fsub(impactPoint[2],target.client.ps.origin[2])]; q.VectorNormalize(bounced)
  effect = game.tempEntity(level,target.client.ps.origin,c.EV_INVUL_IMPACT); effect.s.angles = q.vectoangles(bounced); effect.s.angles[0] = n.fadd(effect.s.angles[0],90.0)
  if effect.s.angles[0] > 360.0 then effect.s.angles[0] = n.fsub(effect.s.angles[0],360.0) end if
  return [true,impactPoint,bounced]
end function

function G_MissileImpact(level,ent,hit)
  tr = hit.trace; other = level.entities[hit.entityNum]; hitClient = false
  if not other.takedamage and (ent.s.eFlags & 48) != 0 then G_BounceMissile(level,ent,hit); events.add(level,ent,c.EV_GRENADE_BOUNCE,0); return void end if
  if other.takedamage and ent.s.weapon != WP_PROX_LAUNCHER and other.client != void and other.client.invulnerabilityTime > level.time then
    forward = movement.copy(ent.s.pos.trDelta); q.VectorNormalize(forward); reflected = invulnerabilityEffect(level,other,forward,ent.s.pos.trBase)
    if reflected[0] then tr.normal = reflected[2]; half = ent.s.eFlags & EF_BOUNCE_HALF; ent.s.eFlags = ent.s.eFlags & n.i32(~EF_BOUNCE_HALF); G_BounceMissile(level,ent,hit); ent.s.eFlags = ent.s.eFlags | half end if
    ent.target_ent = other; return void
  end if
  if ent.s.weapon != WP_PROX_LAUNCHER then return missileBase.impact(level,ent,hit) end if
  if other.takedamage and ent.damage != 0 then
    owner = level.entities[ent.r.ownerNum]
    if combat.logAccuracyHit(level,other,owner) then missileBase.accuracy(level,ent); hitClient = true end if
    velocity = trajectory.evaluateDelta(ent.s.pos,level.time); if q.VectorLength(velocity) == 0 then velocity[2] = 1.0 end if
    combat.damage(level,other,ent,owner,velocity,ent.s.origin,ent.damage,0,ent.methodOfDeath)
  end if
  if ent.s.weapon == WP_PROX_LAUNCHER then
    if ent.s.pos.trType != c.TR_GRAVITY then return void end if
    if other.s.eType == c.ET_PLAYER and other.health > 0 then ProximityMine_Player(level,ent,other); return void end if
    missileBase.snapTowards(hit.endpos,ent.s.pos.trBase); game.setOrigin(ent,hit.endpos); ent.s.pos.trType = c.TR_STATIONARY; ent.s.pos.trDelta = [0.0,0.0,0.0]
    events.add(level,ent,c.EV_PROXIMITY_MINE_STICK,tr.surfaceFlags); ent.think = ProximityMine_Activate; ent.nextthink = n.add32(level.time,2000)
    ent.s.angles = q.vectoangles(tr.normal); ent.s.angles[0] = n.fadd(ent.s.angles[0],90.0); ent.enemy = other; ent.die = ProximityMine_Die
    ent.movedir = movement.copy(tr.normal); ent.r.mins = [-4.0,-4.0,-4.0]; ent.r.maxs = [4.0,4.0,4.0]; game.link(level,ent); return void
  end if
  return void
end function

function G_RunMissile(level,ent)
  origin = trajectory.evaluate(ent.s.pos,level.time); passEntity = ent.r.ownerNum
  if ent.target_ent != void then passEntity = ent.target_ent.s.number else if ent.s.weapon == WP_PROX_LAUNCHER and ent.count != 0 then passEntity = ENTITYNUM_NONE end if
  hit = combat.shotTrace(level,ent.r.currentOrigin,origin,ent.r.mins,ent.r.maxs,passEntity,ent.clipmask)
  if hit.trace.startsolid or hit.trace.allsolid then hit = combat.shotTrace(level,ent.r.currentOrigin,ent.r.currentOrigin,ent.r.mins,ent.r.maxs,passEntity,ent.clipmask); hit.trace.fraction = 0.0
  else ent.r.currentOrigin = movement.copy(hit.endpos) end if
  game.link(level,ent)
  if hit.trace.fraction != 1.0 then
    if (hit.trace.surfaceFlags & 16) != 0 then if ent.parent != void and ent.parent.client != void and ent.parent.client.hook == ent then ent.parent.client.hook = void end if; game.free(level,ent); return void end if
    G_MissileImpact(level,ent,hit); if ent.s.eType != c.ET_MISSILE then return void end if
  end if
  if ent.s.weapon == WP_PROX_LAUNCHER and ent.count == 0 then
    ownerHit = combat.shotTrace(level,ent.r.currentOrigin,ent.r.currentOrigin,ent.r.mins,ent.r.maxs,ENTITYNUM_NONE,ent.clipmask)
    if not ownerHit.trace.startsolid or ownerHit.entityNum != ent.r.ownerNum then ent.count = 1 end if
  end if
  return game.runThink(level,ent)
end function

function fire_plasma(level,self,start,dir) return missileBase.fire(level,self,start,dir,c.WP_PLASMAGUN) end function
function fire_grenade(level,self,start,dir) return missileBase.fire(level,self,start,dir,c.WP_GRENADE_LAUNCHER) end function
function fire_bfg(level,self,start,dir) return missileBase.fire(level,self,start,dir,c.WP_BFG) end function
function fire_rocket(level,self,start,dir) return missileBase.fire(level,self,start,dir,c.WP_ROCKET_LAUNCHER) end function
function fire_grapple(level,self,start,dir) return missileBase.fire(level,self,start,dir,c.WP_GRAPPLING_HOOK) end function
function fire_nail(level,self,start,forward,right,up) return weapon.fireNail(level,self,start,forward,right,up) end function
function fire_prox(level,self,start,dir) return weapon.fireProx(level,self,start,dir) end function

