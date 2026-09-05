// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 G_Damage. Entity-specific pain/die/use handlers are explicit callbacks.
package mq3.game.combat
import mq3.game.constants as c
import mq3.game.events as events
import mq3.game.movement as movement
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
function gametype(level)
  if level.spawner == void then return 0 end if
  return level.spawner.gametype
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
  if inflictor == void then inflictor = level.entities[1022] end if
  if attacker == void then attacker = level.entities[1022] end if
  if targ.s.eType == c.ET_MOVER then
    if targ.use != void and targ.moverState == 0 then targ.use(level,targ,inflictor,attacker) end if
    return void
  end if
  if attacker.client != void and attacker != targ then amount = textnum.truncDouble32(n.mul32(amount,attacker.client.ps.stats[c.STAT_MAX_HEALTH])/100.0) end if
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
    if targ != attacker and onSameTeam(level,targ,attacker) and level.friendlyFire == 0 then return void end if
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
  if gametype(level) == 4 then checkHurtCarrier(level,targ,attacker) end if
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
