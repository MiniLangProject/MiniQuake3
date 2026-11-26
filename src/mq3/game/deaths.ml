// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 player death, item-toss decisions and respawn wrapper.
package mq3.game.deaths
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.events as events
import mq3.game.scores as scores
import mq3.game.bodies as bodies
import mq3.game.missiles as missiles
import mq3.game.g_items as gItems
import mq3.game.items as itemCore
import mq3.game.team_bonuses as bonuses
import mq3.game.client_spawn as clientSpawn
import mq3.game.combat_missionpack as combatMissionpack
import mq3.game.movement as movement
import mq3.server.world as sv
import mq3.shared.math as q
import mq3.compat.numeric as n
import std.string as strings

/// Player-award identifier selecting the mask reward.
const AWARD_MASK = 0x38848
/// Find the next active entity with a case-insensitive class-name match for deaths.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param after After record; accesses `slot`.
/// @param name Name used to identify the requested entry.
function findClass(level,after,name)
  index = 0
  if after != void then index = after.slot+1 end if
  while index < level.num_entities
    ent = level.entities[index]; index = index+1
    if ent.inuse and ent.classname != void and strings.equalsIgnoreCaseAscii(ent.classname,name) then return ent end if
  end while
  return void
end function
/// Calculate Euclidean distance between two three-component points for deaths.
/// @param first Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param second Three-component array; components 0, 1 and 2 are used in their stored order.
function distance(first,second)
  return q.VectorLength([n.fsub(first[0],second[0]),n.fsub(first[1],second[1]),n.fsub(first[2],second[2])])
end function
/// Set `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS]` to `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 4` in `mq3.game.deaths.checkAlmostCapture`.
/// @param level Game-level state; accesses `spawner`.
/// @param self Entity receiving the callback; accesses `client`.
/// @param attacker Attacking entity; accesses `client`. May update `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS]` in place.
function checkAlmostCapture(level,self,attacker)
  ps = self.client.ps
  if ps.powerups[c.PW_REDFLAG] == 0 and ps.powerups[c.PW_BLUEFLAG] == 0 and ps.powerups[c.PW_NEUTRALFLAG] == 0 then return void end if
  name = "team_CTF_blueflag"
  if level.spawner.gametype == 4 then
    if self.client.team == c.TEAM_BLUE then name = "team_CTF_blueflag" else name = "team_CTF_redflag" end if
  else
    if self.client.team == c.TEAM_BLUE then name = "team_CTF_redflag" else name = "team_CTF_blueflag" end if
  end if
  flag = void; scan = void
  while true
    scan = findClass(level,scan,name)
    if scan == void then break end if
    if (scan.flags & 0x1000) == 0 then flag = scan; break end if
  end while
  if flag != void and (flag.r.svFlags & 1) == 0 and distance(ps.origin,flag.s.origin) < 200.0 then
    ps.persistant[c.PERS_PLAYEREVENTS] = ps.persistant[c.PERS_PLAYEREVENTS] ^ 4
    if attacker != void and attacker.client != void then attacker.client.ps.persistant[c.PERS_PLAYEREVENTS] = attacker.client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 4 end if
  end if
  return void
end function
/// Set `self.client.ps.persistant[c.PERS_PLAYEREVENTS]` to `self.client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 4` and `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS]` to `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 4` in `mq3.game.deaths.checkAlmostScored`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param self Entity receiving the callback; accesses `client`. May update `self.client.ps.persistant[c.PERS_PLAYEREVENTS]` in place.
/// @param attacker Attacking entity; accesses `client`. May update `attacker.client.ps.persistant[c.PERS_PLAYEREVENTS]` in place.
function checkAlmostScored(level,self,attacker)
  if self.client.ps.generic1 == 0 then return void end if
  name = "team_blueobelisk"
  if self.client.team == c.TEAM_BLUE then name = "team_redobelisk" end if
  goal = findClass(level,void,name)
  if goal != void and distance(self.client.ps.origin,goal.s.origin) < 200.0 then
    self.client.ps.persistant[c.PERS_PLAYEREVENTS] = self.client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 4
    if attacker != void and attacker.client != void then attacker.client.ps.persistant[c.PERS_PLAYEREVENTS] = attacker.client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 4 end if
  end if
  return void
end function
/// Map a weapon identifier to its pickup-item index, returning -1 for an unsupported weapon.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function weaponItem(weapon)
  if weapon == c.WP_GAUNTLET then return 8 end if
  if weapon == c.WP_MACHINEGUN then return 10 end if
  if weapon == c.WP_SHOTGUN then return 9 end if
  if weapon >= c.WP_GRENADE_LAUNCHER and weapon <= c.WP_GRAPPLING_HOOK then return weapon+7 end if
  if weapon >= 11 and weapon <= 13 then return weapon+38 end if
  return -1
end function
/// Map a powerup identifier to its pickup-item index, including the red and blue flags.
/// @param powerup Operand used to evaluate the returned expression `powerup+27`.
function powerupItem(powerup)
  if powerup >= c.PW_QUAD and powerup <= c.PW_FLIGHT then return powerup+27 end if
  if powerup == c.PW_REDFLAG then return 34 end if
  if powerup == c.PW_BLUEFLAG then return 35 end if
  return -1
end function
/// Apply `mq3.game.deaths.powerupItem` while evaluating `modePowerupItem`. Return paths include `-1`.
/// @param level Game-level state; accesses `spawner`.
/// @param powerup Operand used to evaluate the returned expression `powerup+27`.
function modePowerupItem(level,powerup)
  item = powerupItem(powerup)
  if item >= 0 or level.spawner == void or not level.spawner.missionpack then return item end if
  if powerup == c.PW_NEUTRALFLAG then return 46 end if
  if powerup >= c.PW_SCOUT and powerup <= c.PW_AMMOREGEN then return powerup+32 end if
  if powerup == c.PW_INVULNERABILITY then return 38 end if
  return -1
end function
/// Use `level.itemDropFn` to perform `dropItem`. Return paths include `gItems.Drop_Item(level,self,item,angle)`.
/// @param level Game-level state; accesses `itemDropFn`.
/// @param self Game entity; accesses `s`.
/// @param item Index of the entry to access.
/// @param angle Value passed as argument 2 to `mq3.compat.numeric.fadd`.
function dropItem(level,self,item,angle)
  if level.itemDropFn != void then return level.itemDropFn(level,self,item,angle) end if
  return gItems.Drop_Item(level,self,item,angle)
end function
/// Drop the dying client's carried weapon and active powerup items through the level item-spawn services.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param self Entity receiving the callback; accesses `client` and `s`.
function tossClientItems(level,self)
  if self.client == void then return error(496,"TossClientItems requires a client") end if
  weapon = self.s.weapon
  if weapon == c.WP_MACHINEGUN or weapon == c.WP_GRAPPLING_HOOK then
    if self.client.ps.weaponstate == c.WEAPON_DROPPING then weapon = self.client.cmdWeapon end if
    if weapon < 0 or weapon >= 31 or (self.client.ps.stats[c.STAT_WEAPONS] & (1 << weapon)) == 0 then weapon = c.WP_NONE end if
  end if
  if weapon > c.WP_MACHINEGUN and weapon != c.WP_GRAPPLING_HOOK and weapon < len(self.client.ps.ammo) and self.client.ps.ammo[weapon] != 0 then
    item = weaponItem(weapon)
    if item < 0 then return error(496,"Invalid dropped weapon") end if
    dropItem(level,self,item,0.0)
  end if
  if level.spawner.gametype != 3 then
    angle = 45.0
    for powerup = 1 to c.PW_NUM_POWERUPS-1
      if self.client.ps.powerups[powerup] > level.time then
        item = modePowerupItem(level,powerup)
        if item >= 0 then
          drop = dropItem(level,self,item,angle); drop.count = n.quotient(n.i32(self.client.ps.powerups[powerup]-level.time),1000)
          if drop.count < 1 then drop.count = 1 end if
          angle = n.fadd(angle,45.0)
        end if
      end if
    end for
  end if
  return void
end function
/// Use `level.flagReturnFn` to perform `returnFlag`. Return paths include `itemCore.returnFlag(level,team)`.
/// @param level Game-level state; accesses `flagReturnFn`.
/// @param team Team identifier used by the game rules.
function returnFlag(level,team)
  if level.flagReturnFn != void then level.flagReturnFn(level,team); return void end if
  return itemCore.returnFlag(level,team)
end function
/// Apply `mq3.game.deaths.returnFlag` while evaluating `returnCarriedFlag`.
/// @param level Game-level state; accesses `flagReturnFn`.
/// @param self Entity receiving the callback; accesses `client`.
/// @param clear Value used by `returnCarriedFlag` in `if clear then ps.powerups[c.PW_NEUTRALFLAG] = 0 end if`.
function returnCarriedFlag(level,self,clear)
  ps = self.client.ps
  if ps.powerups[c.PW_NEUTRALFLAG] != 0 then returnFlag(level,c.TEAM_FREE); if clear then ps.powerups[c.PW_NEUTRALFLAG] = 0 end if
  else if ps.powerups[c.PW_REDFLAG] != 0 then returnFlag(level,c.TEAM_RED); if clear then ps.powerups[c.PW_REDFLAG] = 0 end if
  else if ps.powerups[c.PW_BLUEFLAG] != 0 then returnFlag(level,c.TEAM_BLUE); if clear then ps.powerups[c.PW_BLUEFLAG] = 0 end if end if
  return void
end function
/// Resolve a means-of-death code to the baseq3 or Team Arena symbolic obituary name.
/// @param level Game-level state; accesses `spawner`.
/// @param mod Means-of-death code used for damage attribution.
function modName(level,mod)
  names = ["MOD_UNKNOWN","MOD_SHOTGUN","MOD_GAUNTLET","MOD_MACHINEGUN","MOD_GRENADE","MOD_GRENADE_SPLASH","MOD_ROCKET","MOD_ROCKET_SPLASH","MOD_PLASMA","MOD_PLASMA_SPLASH","MOD_RAILGUN","MOD_LIGHTNING","MOD_BFG","MOD_BFG_SPLASH","MOD_WATER","MOD_SLIME","MOD_LAVA","MOD_CRUSH","MOD_TELEFRAG","MOD_FALLING","MOD_SUICIDE","MOD_TARGET_LASER","MOD_TRIGGER_HURT","MOD_GRAPPLE"]
  if level.spawner != void and level.spawner.missionpack then names = ["MOD_UNKNOWN","MOD_SHOTGUN","MOD_GAUNTLET","MOD_MACHINEGUN","MOD_GRENADE","MOD_GRENADE_SPLASH","MOD_ROCKET","MOD_ROCKET_SPLASH","MOD_PLASMA","MOD_PLASMA_SPLASH","MOD_RAILGUN","MOD_LIGHTNING","MOD_BFG","MOD_BFG_SPLASH","MOD_WATER","MOD_SLIME","MOD_LAVA","MOD_CRUSH","MOD_TELEFRAG","MOD_FALLING","MOD_SUICIDE","MOD_TARGET_LASER","MOD_TRIGGER_HURT","MOD_NAIL","MOD_CHAINGUN","MOD_PROXIMITY_MINE","MOD_KAMIKAZE","MOD_JUICED","MOD_GRAPPLE"] end if
  if mod < 0 or mod >= len(names) then return "<bad obituary>" end if
  return names[mod]
end function
/// Check whether two client entities share a team in a team game for deaths.
/// @param level Game-level state; accesses `spawner`.
/// @param first First record; accesses `client`.
/// @param second Second record; accesses `client`.
function sameTeam(level,first,second)
  if first.client == void or second.client == void or level.spawner.gametype < 3 then return false end if
  return first.client.team == second.client.team
end function
/// Set `client.ps.eFlags` to `(client.ps.eFlags & n.i32(~AWARD_MASK)) | award` and `client.rewardTime` to `n.add32(level.time,2000)` in `mq3.game.deaths.clearAward`.
/// @param client Client state; accesses `ps` and `rewardTime`. May update `client.ps.eFlags` and `client.rewardTime` in place.
/// @param award Value used by `clearAward` in `client.ps.eFlags = (client.ps.eFlags & n.i32(~AWARD_MASK)) | award`.
/// @param level Game-level state; accesses `time`.
function clearAward(client,award,level)
  client.ps.eFlags = (client.ps.eFlags & n.i32(~AWARD_MASK)) | award; client.rewardTime = n.add32(level.time,2000)
  return void
end function
/// Update `self.client.ps.pm_type`, `self.enemy`, `self.client.ps.persistant[c.PERS_KILLED]` and `attacker.client.lastkilled_client` and related state during `playerDie`.
/// @param level Game-level state; accesses `intermissiontime`, `time`, `scene`, `maxclients` and `clients` and related fields. May update `level.deathAnimIndex` in place.
/// @param self Entity receiving the callback; accesses `client`, `s`, `r`, `enemy` and `takedamage` and related fields. May update `self.client.ps.pm_type`, `self.enemy` and `self.client.ps.persistant[c.PERS_KILLED]` and additional fields in place.
/// @param inflictor Entity directly delivering the damage.
/// @param attacker Attacking entity; accesses `s` and `client`. May update `attacker.client.lastkilled_client`, `attacker.client.ps.persistant[c.PERS_GAUNTLET_FRAG_COUNT]` and `attacker.client.ps.persistant[c.PERS_EXCELLENT_COUNT]` and additional fields in place.
/// @param damage Not read by this implementation; retained in the `playerDie` signature.
/// @param meansOfDeath Means-of-death code used for damage attribution.
function playerDie(level,self,inflictor,attacker,damage,meansOfDeath)
  if self.client == void then return error(496,"player_die requires a client") end if
  if self.client.ps.pm_type == c.PM_DEAD or level.intermissiontime != 0 then return void end if
  checkAlmostCapture(level,self,attacker); checkAlmostScored(level,self,attacker)
  if self.client.hook != void then missiles.hookFree(level,self.client.hook) end if
  combatMissionpack.cleanupPlayerDie(level,self)
  self.client.ps.pm_type = c.PM_DEAD
  killer = 1022; killerName = "<world>"
  if attacker != void then
    killer = attacker.s.number
    if attacker.client != void then killerName = attacker.client.netname else killerName = "<non-client>" end if
  end if
  if killer < 0 or killer >= 64 then killer = 1022; killerName = "<world>" end if
  scores.logLine(level,"Kill: "+str(killer)+" "+str(self.s.number)+" "+str(meansOfDeath)+": "+killerName+" killed "+self.client.netname+" by "+modName(level,meansOfDeath)+"\n")
  obituary = game.tempEntity(level,self.r.currentOrigin,c.EV_OBITUARY); obituary.s.eventParm = meansOfDeath
  obituary.s.otherEntityNum = self.s.number; obituary.s.otherEntityNum2 = killer; obituary.r.svFlags = 32
  self.enemy = attacker; self.client.ps.persistant[c.PERS_KILLED] = n.add32(self.client.ps.persistant[c.PERS_KILLED],1)
  if attacker != void and attacker.client != void then
    attacker.client.lastkilled_client = self.s.number
    if attacker == self or sameTeam(level,self,attacker) then scores.addScore(level,attacker,self.r.currentOrigin,-1)
    else
      scores.addScore(level,attacker,self.r.currentOrigin,1)
      if meansOfDeath == c.MOD_GAUNTLET then
        attacker.client.ps.persistant[c.PERS_GAUNTLET_FRAG_COUNT] = n.add32(attacker.client.ps.persistant[c.PERS_GAUNTLET_FRAG_COUNT],1)
        clearAward(attacker.client,0x40,level)
        self.client.ps.persistant[c.PERS_PLAYEREVENTS] = self.client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 2
      end if
      if n.i32(level.time-attacker.client.lastKillTime) < 3000 then
        attacker.client.ps.persistant[c.PERS_EXCELLENT_COUNT] = n.add32(attacker.client.ps.persistant[c.PERS_EXCELLENT_COUNT],1)
        clearAward(attacker.client,8,level)
      end if
      attacker.client.lastKillTime = level.time
    end if
  else scores.addScore(level,self,self.r.currentOrigin,-1) end if
  bonuses.fragBonuses(level,self,inflictor,attacker)
  if meansOfDeath == c.MOD_SUICIDE then returnCarriedFlag(level,self,true) end if
  contents = sv.pointContents(level.scene,self.r.currentOrigin,-1)
  if (contents & 0x80000000) == 0 then tossClientItems(level,self) else returnCarriedFlag(level,self,false) end if
  combatMissionpack.dropPlayerDeathItems(level,self)
  scores.commandScore(level,self)
  if level.maxclients < 0 or level.maxclients > 64 then return error(496,"Invalid death client limit") end if
  // A zero client limit skips the C loop; MiniLang for would count backwards.
  i = 0
  while i < level.maxclients
    client = level.clients[i]
    if client.connected == 2 and client.team == c.TEAM_SPECTATOR and client.spectatorClient == self.s.number then scores.commandScore(level,level.entities[i]) end if
    i = i+1
  end while
  self.takedamage = true; self.s.weapon = c.WP_NONE; self.s.powerups = 0; self.r.contents = 0x4000000
  self.s.angles[0] = 0.0; self.s.angles[2] = 0.0; bodies.lookAtKiller(level,self,inflictor,attacker)
  self.client.ps.viewangles = movement.copy(self.s.angles); self.s.loopSound = 0; self.r.maxs[2] = -8.0
  self.client.respawnTime = n.add32(level.time,1700); self.client.ps.powerups = array(16,0)
  if (self.health <= -40 and (contents & 0x80000000) == 0 and level.blood != 0) or meansOfDeath == c.MOD_SUICIDE then bodies.gib(level,self,killer)
  else
    anim = c.BOTH_DEATH1
    if level.deathAnimIndex == 1 then
      anim = c.BOTH_DEATH2
    else if level.deathAnimIndex == 2 then
      anim = c.BOTH_DEATH3
    end if
    if self.health <= -40 then self.health = -39 end if
    self.client.ps.legsAnim = ((self.client.ps.legsAnim & 128) ^ 128) | anim
    self.client.ps.torsoAnim = ((self.client.ps.torsoAnim & 128) ^ 128) | anim
    events.add(level,self,c.EV_DEATH1+level.deathAnimIndex,killer); self.die = bodies.die
    level.deathAnimIndex = (level.deathAnimIndex+1) % 3
  end if
  game.link(level,self); combatMissionpack.afterPlayerDie(level,self); return void
end function
/// Set `level.playerDieFn` to `playerDie` in `mq3.game.deaths.respawn`. Return paths include `clientSpawn.respawn(level,ent)`.
/// @param level Game-level state; accesses `playerDieFn`. May update `level.playerDieFn` in place.
/// @param ent Game entity; accesses `client` and `s`.
function respawn(level,ent)
  if level.playerDieFn == void then level.playerDieFn = playerDie end if
  return clientSpawn.respawn(level,ent)
end function
