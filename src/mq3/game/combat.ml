// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 G_Damage. Entity-specific pain/die/use handlers are explicit callbacks.
package mq3.game.combat
import mq3.game.constants as c
import mq3.game.events as events
import mq3.game.entities as game
import mq3.game.movement as movement
import mq3.server.world as sv
import mq3.shared.math as q
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
extern function ceil(value as double) from "ucrtbase.dll" returns double
const DAMAGE_RADIUS = 1
const DAMAGE_NO_ARMOR = 2
const DAMAGE_NO_KNOCKBACK = 4
const DAMAGE_NO_PROTECTION = 8
const FL_GODMODE = 0x10
const FL_NO_KNOCKBACK = 0x800
const MOD_PROXIMITY_MINE = 26
const MOD_JUICED = 28
const STAT_PERSISTANT_POWERUP = 7
function missionpack(level)
  return level.spawner != void and level.spawner.missionpack
end function
function raySphereIntersections(origin,radius,point,dir,intersections)
  q.VectorNormalize(dir)
  offset = [n.fsub(point[0],origin[0]),n.fsub(point[1],origin[1]),n.fsub(point[2],origin[2])]
  b = n.fmul(2.0,q.DotProduct(dir,offset))
  cc = n.fsub(q.DotProduct(offset,offset),n.fmul(radius,radius))
  discriminant = n.fsub(n.fmul(b,b),n.fmul(4.0,cc))
  if discriminant > 0 then
    root = n.fsqrt(discriminant)
    intersections[0] = q.VectorMA(point,n.fdiv(n.fadd(n.fneg(b),root),2.0),dir)
    intersections[1] = q.VectorMA(point,n.fdiv(n.fsub(n.fneg(b),root),2.0),dir)
    return 2
  else if discriminant == 0 then
    intersections[0] = q.VectorMA(point,n.fdiv(n.fneg(b),2.0),dir)
    return 1
  end if
  return 0
end function
function invulnerabilityEffect(level,targ,dir,point,impactpoint,bouncedir)
  if targ.client == void then return false end if
  ray = [n.fneg(dir[0]),n.fneg(dir[1]),n.fneg(dir[2])]
  intersections = [[0.0,0.0,0.0],[0.0,0.0,0.0]]
  count = raySphereIntersections(targ.client.ps.origin,42.0,point,ray,intersections)
  if count == 0 then return false end if
  normal = [n.fsub(intersections[0][0],targ.client.ps.origin[0]),n.fsub(intersections[0][1],targ.client.ps.origin[1]),n.fsub(intersections[0][2],targ.client.ps.origin[2])]
  impact = game.tempEntity(level,targ.client.ps.origin,c.EV_INVUL_IMPACT)
  impact.s.angles = q.vectoangles(normal); impact.s.angles[0] = n.fadd(impact.s.angles[0],90.0)
  if impact.s.angles[0] > 360.0 then impact.s.angles[0] = n.fsub(impact.s.angles[0],360.0) end if
  if impactpoint != void then for axis = 0 to 2 impactpoint[axis] = intersections[0][axis] end for end if
  if bouncedir != void then q.VectorNormalize(normal); for axis = 0 to 2 bouncedir[axis] = normal[axis] end for end if
  return true
end function
function persistentTag(level,client)
  if not missionpack(level) then return c.PW_NONE end if
  index = client.ps.stats[STAT_PERSISTANT_POWERUP]
  if index < 0 or index >= 52 then return c.PW_NONE end if
  return c.missionpackItemTag(index)
end function
function gametype(level)
  if level.spawner == void then return 0 end if
  return level.spawner.gametype
end function
function shotTrace(level,start,finish,mins,maxs,passEntity,mask)
  hit = sv.trace(level.scene,start,finish,mins,maxs,passEntity,mask,false)
  if level.traceObserveFn != void then level.traceObserveFn(level,start,finish,mins,maxs,passEntity,mask,hit) end if
  return hit
end function
function canDamage(level,targ,origin)
  midpoint = [0.0,0.0,0.0]
  for axis = 0 to 2
    midpoint[axis] = n.fmul(n.fadd(targ.r.absmin[axis],targ.r.absmax[axis]),0.5)
  end for
  zero = [0.0,0.0,0.0]; hit = shotTrace(level,origin,midpoint,zero,zero,1023,1)
  if hit.trace.fraction == 1.0 or hit.entityNum == targ.s.number then return true end if
  for each offset in [[15.0,15.0],[15.0,-15.0],[-15.0,15.0],[-15.0,-15.0]]
    finish = [n.fadd(midpoint[0],offset[0]),n.fadd(midpoint[1],offset[1]),midpoint[2]]
    hit = shotTrace(level,origin,finish,zero,zero,1023,1)
    // The four corner probes accept only a clear trace, unlike the midpoint.
    if hit.trace.fraction == 1.0 then return true end if
  end for
  return false
end function
function logAccuracyHit(level,target,attacker)
  if not target.takedamage or target == attacker or target.client == void then return false end if
  if attacker == void then return error(491,"LogAccuracyHit requires an attacker") end if
  if attacker.client == void or target.client.ps.stats[c.STAT_HEALTH] <= 0 or onSameTeam(level,target,attacker) then return false end if
  return true
end function
function radiusDamage(level,origin,attacker,amount,radius,ignore,mod)
  amount = n.f32(amount); radius = n.f32(radius)
  if radius < 1 then radius = 1.0 end if
  mins = [0.0,0.0,0.0]; maxs = [0.0,0.0,0.0]; hitClient = false
  for axis = 0 to 2
    mins[axis] = n.fsub(origin[axis],radius); maxs[axis] = n.fadd(origin[axis],radius)
  end for
  // Freeze candidates, then read each entity's live state after earlier callbacks.
  for each number in sv.areaEntities(level.scene,mins,maxs,1024)
    ent = level.entities[number]
    if ent == ignore or not ent.takedamage then continue end if
    delta = [0.0,0.0,0.0]
    for axis = 0 to 2
      if origin[axis] < ent.r.absmin[axis] then delta[axis] = n.fsub(ent.r.absmin[axis],origin[axis])
      else if origin[axis] > ent.r.absmax[axis] then delta[axis] = n.fsub(origin[axis],ent.r.absmax[axis]) end if
    end for
    distance = q.VectorLength(delta)
    if distance >= radius then continue end if
    // The ratio is float; 1.0, subtraction and multiplication are double.
    points = n.f32(amount*(1.0-n.fdiv(distance,radius)))
    if canDamage(level,ent,origin) then
      if logAccuracyHit(level,ent,attacker) then hitClient = true end if
      dir = [n.fsub(ent.r.currentOrigin[0],origin[0]),n.fsub(ent.r.currentOrigin[1],origin[1]),n.fadd(n.fsub(ent.r.currentOrigin[2],origin[2]),24)]
      damage(level,ent,void,attacker,dir,origin,n.trunc32(points),DAMAGE_RADIUS,mod)
    end if
  end for
  return hitClient
end function
function onSameTeam(level,first,second)
  if first.client == void or second.client == void then return false end if
  if gametype(level) < 3 then return false end if
  return first.client.team == second.client.team
end function
function checkHurtCarrier(level,targ,attacker)
  if targ.client == void or attacker.client == void then return void end if
  flag = c.PW_REDFLAG
  if targ.client.team == c.TEAM_RED then flag = c.PW_BLUEFLAG end if
  if targ.client.ps.powerups[flag] != 0 and targ.client.team != attacker.client.team then attacker.client.lasthurtcarrier = n.f32(level.time) end if
  if targ.client.ps.generic1 != 0 and targ.client.team != attacker.client.team then attacker.client.lasthurtcarrier = n.f32(level.time) end if
  return void
end function
function checkArmor(ent,amount,dflags)
  if amount == 0 or ent.client == void or (dflags & DAMAGE_NO_ARMOR) != 0 then return 0 end if
  count = ent.client.ps.stats[c.STAT_ARMOR]
  // ARMOR_PROTECTION is the double literal 0.66, followed by ceil and CVTTSD2SI.
  saved = textnum.truncDouble32(ceil(amount*0.66))
  if saved >= count then saved = count end if
  if saved == 0 then return 0 end if
  ent.client.ps.stats[c.STAT_ARMOR] = n.i32(count-saved)
  return saved
end function
function damage(level,targ,inflictor,attacker,dir,point,amount,dflags,mod)
  if not targ.takedamage or level.intermissionQueued != 0 then return void end if
  if missionpack(level) and targ.client != void and mod != MOD_JUICED and targ.client.invulnerabilityTime > level.time then
    if dir != void and point != void then invulnerabilityEffect(level,targ,dir,point,void,void) end if
    return void
  end if
  if inflictor == void then inflictor = level.entities[1022] end if
  if attacker == void then attacker = level.entities[1022] end if
  if targ.s.eType == c.ET_MOVER then
    if targ.use != void and targ.moverState == 0 then targ.use(level,targ,inflictor,attacker) end if
    return void
  end if
  // MISSIONPACK G_Damage routes Overload obelisks through g_team.c before
  // handicap and friendly-fire processing. The callback is installed by the
  // obelisk spawn functions, avoiding a game-module import cycle.
  if gametype(level) == 6 and level.obeliskAttackFn != void and level.obeliskAttackFn(level,targ,attacker) then return void end if
  if attacker.client != void and attacker != targ then
    maximum = attacker.client.ps.stats[c.STAT_MAX_HEALTH]
    if persistentTag(level,attacker.client) == c.PW_GUARD then maximum = n.quotient(maximum,2) end if
    amount = textnum.truncDouble32(n.mul32(amount,maximum)/100.0)
  end if
  client = targ.client
  if client != void and client.noclip then return void end if
  if dir == void then dflags = dflags | DAMAGE_NO_KNOCKBACK else q.VectorNormalize(dir) end if
  knockback = amount
  if knockback > 200 then knockback = 200 end if
  if (targ.flags & FL_NO_KNOCKBACK) != 0 or (dflags & DAMAGE_NO_KNOCKBACK) != 0 then knockback = 0 end if
  if knockback != 0 and client != void then
    velocity = q.VectorScale(dir,n.fdiv(n.fmul(level.knockback,n.f32(knockback)),200.0))
    for axis = 0 to 2
      client.ps.velocity[axis] = n.fadd(client.ps.velocity[axis],velocity[axis])
    end for
    if client.ps.pm_time == 0 then
      time = n.mul32(knockback,2)
      if time < 50 then time = 50 end if
      if time > 200 then time = 200 end if
      client.ps.pm_time = time; client.ps.pm_flags = client.ps.pm_flags | 64
    end if
  end if
  if (dflags & DAMAGE_NO_PROTECTION) == 0 then
    // Team Arena's DAMAGE_NO_TEAM_PROTECTION is used by Kamikaze.  It skips
    // only the team-protection gate; DAMAGE_NO_PROTECTION remains the broader
    // armor/powerup/godmode bypass handled by its surrounding branch.
    if mod != MOD_JUICED and targ != attacker and onSameTeam(level,targ,attacker) and level.friendlyFire == 0 and (dflags & 16) == 0 then return void end if
    if missionpack(level) and mod == MOD_PROXIMITY_MINE then
      if inflictor != void and inflictor.parent != void and onSameTeam(level,targ,inflictor.parent) then return void end if
      if targ == attacker then return void end if
    end if
    if (targ.flags & FL_GODMODE) != 0 then return void end if
  end if
  if client != void and client.ps.powerups[c.PW_BATTLESUIT] != 0 then
    events.add(level,targ,c.EV_POWERUP_BATTLESUIT,0)
    if (dflags & DAMAGE_RADIUS) != 0 or mod == c.MOD_FALLING then return void end if
    amount = textnum.truncDouble32(amount*0.5)
  end if
  if attacker.client != void and targ != attacker and targ.health > 0 and targ.s.eType != c.ET_MISSILE and targ.s.eType != c.ET_GENERAL then
    if onSameTeam(level,targ,attacker) then attacker.client.ps.persistant[c.PERS_HITS] = n.add32(attacker.client.ps.persistant[c.PERS_HITS],-1)
    else attacker.client.ps.persistant[c.PERS_HITS] = n.add32(attacker.client.ps.persistant[c.PERS_HITS],1) end if
    if client == void then return error(491,"G_Damage hit counter requires a target client") end if
    attacker.client.ps.persistant[c.PERS_ATTACKEE_ARMOR] = n.i32((targ.health << 8) | client.ps.stats[c.STAT_ARMOR])
  end if
  if targ == attacker then amount = textnum.truncDouble32(amount*0.5) end if
  if amount < 1 then amount = 1 end if
  saved = checkArmor(targ,amount,dflags); take = n.i32(amount-saved)
  if client != void then
    client.ps.persistant[c.PERS_ATTACKER] = attacker.s.number
    client.damage_armor = n.add32(client.damage_armor,saved); client.damage_blood = n.add32(client.damage_blood,take); client.damage_knockback = n.add32(client.damage_knockback,knockback)
    if dir != void then client.damage_from = movement.copy(dir); client.damage_fromWorld = false
    else client.damage_from = movement.copy(targ.r.currentOrigin); client.damage_fromWorld = true end if
  end if
  if gametype(level) == 4 or (missionpack(level) and gametype(level) == 5) then checkHurtCarrier(level,targ,attacker) end if
  if targ.client != void then targ.client.lasthurt_client = attacker.s.number; targ.client.lasthurt_mod = mod end if
  if take != 0 then
    targ.health = n.i32(targ.health-take)
    if targ.client != void then targ.client.ps.stats[c.STAT_HEALTH] = targ.health end if
    if targ.health <= 0 then
      if client != void then targ.flags = targ.flags | FL_NO_KNOCKBACK end if
      if targ.health < -999 then targ.health = -999 end if
      targ.enemy = attacker
      if targ.die == void then return error(491,"G_Damage requires an entity death handler") end if
      targ.die(level,targ,inflictor,attacker,take,mod)
      return void
    else if targ.pain != void then targ.pain(level,targ,attacker,take) end if
  end if
  return void
end function
