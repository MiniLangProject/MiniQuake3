// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MISSIONPACK half of g_team.c: One Flag, Overload and Harvester obelisks.
package mq3.game.team_missionpack
import mq3.game.game_headers as headers
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.events as events
import mq3.game.movement as movement
import mq3.game.scores as scores
import mq3.compat.numeric as n
import mq3.server.world as sv

/// Game-mode identifier selecting team rules.
const GT_TEAM = 3
/// Game-mode identifier selecting 1 fctf rules.
const GT_1FCTF = 5
/// Game-mode identifier selecting obelisk rules.
const GT_OBELISK = 6
/// Game-mode identifier selecting harvester rules.
const GT_HARVESTER = 7
/// Collision-contents bit identifying solid space or objects.
const CONTENTS_SOLID=headers.CONTENTS_SOLID
/// Collision-contents bit identifying trigger space or objects.
const CONTENTS_TRIGGER=headers.CONTENTS_TRIGGER
/// Combined CONTENTS_* mask used for solid collision queries.
const MASK_SOLID = 1
/// Entity-number sentinel meaning that no entity was hit or referenced.
const ENTITYNUM_NONE = 1023
/// Game entity-flag bit enabling or marking no knockback.
const FL_NO_KNOCKBACK = 0x800
/// Server entity-flag bit controlling broadcast.
const SVF_BROADCAST = 32
/// Player-award identifier selecting the mask reward.
const AWARD_MASK = 0x38848
/// Capture-the-flag scoring or timing parameter for capture bonus.
const CTF_CAPTURE_BONUS=headers.CTF_CAPTURE_BONUS
/// Duration in milliseconds for which a player reward sprite remains visible.
const REWARD_SPRITE_TIME = 2000
/// Minimum interval in milliseconds between base-under-attack announcements.
const OVERLOAD_ATTACK_BASE_SOUND_TIME=headers.OVERLOAD_ATTACK_BASE_SOUND_TIME

/// Read the Team Arena game type from the spawner, returning zero when the spawner is absent.
/// @param level Game-level state; accesses `spawner`.
function gametype(level)
  if level.spawner == void then return 0 end if
  return level.spawner.gametype
end function
/// Exchange red and blue team identifiers for team missionpack, preserving other team values.
/// @param team Team identifier used by the game rules.
function otherTeam(team)
  if team == c.TEAM_RED then return c.TEAM_BLUE end if
  if team == c.TEAM_BLUE then return c.TEAM_RED end if
  return team
end function
/// Use `level.teamMessageFn` to perform `message`.
/// @param level Game-level state; accesses `teamMessageFn`.
/// @param text Text to parse, format or deliver.
function message(level,text)
  if level.teamMessageFn == void then return error(497,"Obelisk message requires PrintMsg delivery") end if
  level.teamMessageFn(level,-1,text); return void
end function
/// Force a team celebration gesture for active clients through the Team Arena entity flag.
/// @param level Game-level state; accesses `entities`.
/// @param team Team identifier used by the game rules.
function forceGesture(level,team)
  for slot = 0 to 63
    ent = level.entities[slot]
    if ent.inuse and ent.client != void and ent.client.team == team then ent.flags = ent.flags | 0x8000 end if
  end for
  return void
end function
/// Set `level.teamScores[team]` to `n.add32(level.teamScores[team],score)` in `mq3.game.team_missionpack.addTeamScore`.
/// @param level Game-level state; accesses `teamScores`. May update `level.teamScores[team]` in place.
/// @param origin World-space position as three coordinates.
/// @param team Team identifier used by the game rules.
/// @param score Value passed as argument 2 to `mq3.compat.numeric.add32`.
function addTeamScore(level,origin,team,score)
  if team != c.TEAM_RED and team != c.TEAM_BLUE then return error(497,"Invalid obelisk score team") end if
  sound = game.tempEntity(level,origin,c.EV_GLOBAL_TEAM_SOUND); sound.r.svFlags = sound.r.svFlags | SVF_BROADCAST
  if team == c.TEAM_RED then
    if n.add32(level.teamScores[c.TEAM_RED],score) == level.teamScores[c.TEAM_BLUE] then sound.s.eventParm = c.GTS_TEAMS_ARE_TIED
    else if level.teamScores[c.TEAM_RED] <= level.teamScores[c.TEAM_BLUE] and n.add32(level.teamScores[c.TEAM_RED],score) > level.teamScores[c.TEAM_BLUE] then sound.s.eventParm = c.GTS_REDTEAM_TOOK_LEAD
    else sound.s.eventParm = c.GTS_REDTEAM_SCORED end if
  else
    if n.add32(level.teamScores[c.TEAM_BLUE],score) == level.teamScores[c.TEAM_RED] then sound.s.eventParm = c.GTS_TEAMS_ARE_TIED
    else if level.teamScores[c.TEAM_BLUE] <= level.teamScores[c.TEAM_RED] and n.add32(level.teamScores[c.TEAM_BLUE],score) > level.teamScores[c.TEAM_RED] then sound.s.eventParm = c.GTS_BLUETEAM_TOOK_LEAD
    else sound.s.eventParm = c.GTS_BLUETEAM_SCORED end if
  end if
  level.teamScores[team] = n.add32(level.teamScores[team],score); return void
end function
/// Apply `mq3.game.entities.diagnostic` and `mq3.game.entities.tempEntity` while evaluating `captureSound`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `s`.
/// @param team Team identifier used by the game rules.
function captureSound(level,ent,team)
  if ent == void then
    game.diagnostic(level,"Warning:  NULL passed to Team_CaptureFlagSound\n"); return void
  end if
  sound = game.tempEntity(level,ent.s.pos.trBase,c.EV_GLOBAL_TEAM_SOUND)
  if team == c.TEAM_BLUE then sound.s.eventParm = c.GTS_BLUE_CAPTURE else sound.s.eventParm = c.GTS_RED_CAPTURE end if
  sound.r.svFlags = sound.r.svFlags | SVF_BROADCAST; return void
end function

/// Update `self.nextthink`, `self.health`, `self.activator.s.modelindex2` and `self.activator.s.frame` during `ObeliskRegen`.
/// @param level Game-level state; accesses `time`, `obeliskRegenPeriod`, `obeliskHealth` and `obeliskRegenAmount`.
/// @param self Entity receiving the callback; accesses `nextthink`, `health` and `activator`. May update `self.nextthink`, `self.health` and `self.activator.s.modelindex2` and additional fields in place.
function ObeliskRegen(level,self)
  self.nextthink = n.add32(level.time,n.mul32(level.obeliskRegenPeriod,1000))
  if self.health >= level.obeliskHealth then return void end if
  events.add(level,self,c.EV_POWERUP_REGEN,0)
  self.health = n.add32(self.health,level.obeliskRegenAmount)
  if self.health > level.obeliskHealth then self.health = level.obeliskHealth end if
  if self.activator == void then return error(497,"Obelisk has no visual activator") end if
  if level.obeliskHealth == 0 then return error(497,"g_obeliskHealth must be nonzero") end if
  self.activator.s.modelindex2 = scores.integerDivide(n.mul32(self.health,255),level.obeliskHealth)
  self.activator.s.frame = 0; return void
end function
/// Update `self.takedamage`, `self.health`, `self.think` and `self.nextthink` and related state during `ObeliskRespawn`.
/// @param level Game-level state; accesses `obeliskHealth`, `time` and `obeliskRegenPeriod`.
/// @param self Entity receiving the callback; accesses `takedamage`, `health`, `think`, `nextthink` and `activator`. May update `self.takedamage`, `self.health` and `self.think` and additional fields in place.
function ObeliskRespawn(level,self)
  self.takedamage = true; self.health = level.obeliskHealth
  self.think = ObeliskRegen; self.nextthink = n.add32(level.time,n.mul32(level.obeliskRegenPeriod,1000))
  if self.activator == void then return error(497,"Obelisk has no visual activator") end if
  self.activator.s.frame = 0; return void
end function
/// Update `self.takedamage`, `self.think`, `self.nextthink` and `self.activator.s.modelindex2` and related state during `ObeliskDie`.
/// @param level Game-level state; accesses `time`, `obeliskRespawnDelay`, `redObeliskAttackedTime` and `blueObeliskAttackedTime`. May update `level.redObeliskAttackedTime` and `level.blueObeliskAttackedTime` in place.
/// @param self Entity receiving the callback; accesses `spawnflags`, `s`, `takedamage`, `think` and `nextthink` and related fields. May update `self.takedamage`, `self.think` and `self.nextthink` and additional fields in place.
/// @param inflictor Not read by this implementation; retained in the `ObeliskDie` signature.
/// @param attacker Attacking entity; accesses `client`. May update `attacker.client.ps.eFlags`, `attacker.client.rewardTime` and `attacker.client.ps.persistant[c.PERS_CAPTURES]` in place.
/// @param damage Not read by this implementation; retained in the `ObeliskDie` signature.
/// @param mod Not read by this implementation; retained in the `ObeliskDie` signature.
function ObeliskDie(level,self,inflictor,attacker,damage,mod)
  team = otherTeam(self.spawnflags); addTeamScore(level,self.s.pos.trBase,team,1); forceGesture(level,team); scores.calculateRanks(level)
  self.takedamage = false; self.think = ObeliskRespawn
  self.nextthink = n.add32(level.time,n.mul32(level.obeliskRespawnDelay,1000))
  if self.activator == void then return error(497,"Obelisk has no visual activator") end if
  self.activator.s.modelindex2 = 255; self.activator.s.frame = 2; events.add(level,self.activator,c.EV_OBELISKEXPLODE,0)
  scores.addScore(level,attacker,self.r.currentOrigin,CTF_CAPTURE_BONUS)
  if attacker.client == void then return error(497,"Obelisk attacker has no client") end if
  attacker.client.ps.eFlags = (attacker.client.ps.eFlags & n.i32(~AWARD_MASK)) | 0x800
  attacker.client.rewardTime = n.add32(level.time,REWARD_SPRITE_TIME)
  attacker.client.ps.persistant[c.PERS_CAPTURES] = n.add32(attacker.client.ps.persistant[c.PERS_CAPTURES],1)
  level.redObeliskAttackedTime = 0; level.blueObeliskAttackedTime = 0; return void
end function
/// Update `other.client.ps.eFlags`, `other.client.rewardTime`, `other.client.ps.persistant[c.PERS_CAPTURES]` and `other.client.ps.generic1` during `ObeliskTouch`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `spawnflags`, `s` and `r`.
/// @param other Other record; accesses `client`. May update `other.client.ps.eFlags`, `other.client.rewardTime` and `other.client.ps.persistant[c.PERS_CAPTURES]` and additional fields in place.
/// @param trace Not read by this implementation; retained in the `ObeliskTouch` signature.
function ObeliskTouch(level,self,other,trace)
  if other.client == void or otherTeam(other.client.team) != self.spawnflags then return void end if
  tokens = other.client.ps.generic1; if tokens <= 0 then return void end if
  suffix = "s"; if tokens == 0 then suffix = "" end if
  message(level,other.client.netname+"^7 brought in "+str(tokens)+" skull"+suffix+".\n")
  addTeamScore(level,self.s.pos.trBase,other.client.team,tokens); forceGesture(level,other.client.team)
  scores.addScore(level,other,self.r.currentOrigin,n.mul32(CTF_CAPTURE_BONUS,tokens))
  other.client.ps.eFlags = (other.client.ps.eFlags & n.i32(~AWARD_MASK)) | 0x800
  other.client.rewardTime = n.add32(level.time,REWARD_SPRITE_TIME)
  other.client.ps.persistant[c.PERS_CAPTURES] = n.add32(other.client.ps.persistant[c.PERS_CAPTURES],tokens)
  other.client.ps.generic1 = 0; scores.calculateRanks(level); captureSound(level,self,self.spawnflags); return void
end function
/// Update `self.activator.s.modelindex2` and `self.activator.s.frame` during `ObeliskPain`.
/// @param level Game-level state; accesses `obeliskHealth`.
/// @param self Entity receiving the callback; accesses `activator`, `health` and `r`. May update `self.activator.s.modelindex2` and `self.activator.s.frame` in place.
/// @param attacker Entity credited with the attack.
/// @param damage Damage amount before the current operation applies its rules.
function ObeliskPain(level,self,attacker,damage)
  actual = scores.integerDivide(damage,10); if actual <= 0 then actual = 1 end if
  if self.activator == void then return error(497,"Obelisk has no visual activator") end if
  if level.obeliskHealth == 0 then return error(497,"g_obeliskHealth must be nonzero") end if
  self.activator.s.modelindex2 = scores.integerDivide(n.mul32(self.health,255),level.obeliskHealth)
  if self.activator.s.frame == 0 then events.add(level,self,c.EV_OBELISKPAIN,0) end if
  self.activator.s.frame = 1; scores.addScore(level,attacker,self.r.currentOrigin,actual); return void
end function
/// Apply `mq3.game.entities.spawn`, `mq3.game.movement.copy` and `mq3.game.entities.setOrigin` while evaluating `SpawnObelisk`. Return paths include `ent`.
/// @param level Game-level state; accesses `obeliskHealth`, `time`, `obeliskRegenPeriod` and `scene`.
/// @param origin World-space position as three coordinates. Entries may be updated in place.
/// @param team Team identifier used by the game rules.
/// @param spawnflags Value used by `SpawnObelisk` in `if (spawnflags & 1) != 0 then game.setOrigin(ent,ent.s.origin)`.
function SpawnObelisk(level,origin,team,spawnflags)
  ent = game.spawn(level); ent.s.origin = movement.copy(origin); game.setOrigin(ent,origin)
  ent.r.mins = [-15.0,-15.0,0.0]; ent.r.maxs = [15.0,15.0,87.0]
  ent.s.eType = c.ET_GENERAL; ent.flags = FL_NO_KNOCKBACK
  if gametype(level) == GT_OBELISK then
    ent.r.contents = CONTENTS_SOLID; ent.takedamage = true; ent.health = level.obeliskHealth
    ent.die = ObeliskDie; ent.pain = ObeliskPain; ent.think = ObeliskRegen
    ent.nextthink = n.add32(level.time,n.mul32(level.obeliskRegenPeriod,1000))
  end if
  if gametype(level) == GT_HARVESTER then ent.r.contents = CONTENTS_TRIGGER; ent.touch = ObeliskTouch end if
  if (spawnflags & 1) != 0 then game.setOrigin(ent,ent.s.origin)
  else
    ent.s.origin[2] = n.fadd(ent.s.origin[2],1.0); finish = [ent.s.origin[0],ent.s.origin[1],n.fsub(ent.s.origin[2],4096.0)]
    hit = sv.trace(level.scene,ent.s.origin,finish,ent.r.mins,ent.r.maxs,ent.s.number,MASK_SOLID,false)
    if hit.trace.startsolid then
      ent.s.origin[2] = n.fsub(ent.s.origin[2],1.0)
      game.diagnostic(level,"SpawnObelisk: "+game.diagnosticArgument(ent.classname)+" startsolid at "+game.vtos(level,ent.s.origin)+"\n")
      ent.s.groundEntityNum = ENTITYNUM_NONE; game.setOrigin(ent,ent.s.origin)
    else ent.s.groundEntityNum = hit.entityNum; game.setOrigin(ent,hit.endpos) end if
  end if
  ent.spawnflags = team; game.link(level,ent); return ent
end function
/// Update `level.obeliskAttackFn`, `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and related state during `teamObelisk`.
/// @param level Game-level state; accesses `obeliskAttackFn`. May update `level.obeliskAttackFn` in place.
/// @param ent Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and additional fields in place.
/// @param team Team identifier used by the game rules.
function teamObelisk(level,ent,team)
  level.obeliskAttackFn = CheckObeliskAttack
  if gametype(level) <= GT_TEAM then game.free(level,ent); return void end if
  ent.s.eType = c.ET_TEAM
  if gametype(level) == GT_OBELISK or gametype(level) == GT_HARVESTER then
    obelisk = SpawnObelisk(level,ent.s.origin,team,ent.spawnflags); obelisk.activator = ent
    if gametype(level) == GT_OBELISK then ent.s.modelindex2 = 255; ent.s.frame = 0 end if
  end if
  ent.s.modelindex = team; game.link(level,ent); return void
end function
/// Forward `SP_team_redobelisk` to `mq3.game.team_missionpack.teamObelisk` and return the delegated result.
/// @param level Game-level state; accesses `obeliskAttackFn`. May update `level.obeliskAttackFn` in place.
/// @param ent Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and additional fields in place.
function SP_team_redobelisk(level,ent) return teamObelisk(level,ent,c.TEAM_RED) end function
/// Forward `SP_team_blueobelisk` to `mq3.game.team_missionpack.teamObelisk` and return the delegated result.
/// @param level Game-level state; accesses `obeliskAttackFn`. May update `level.obeliskAttackFn` in place.
/// @param ent Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and additional fields in place.
function SP_team_blueobelisk(level,ent) return teamObelisk(level,ent,c.TEAM_BLUE) end function
/// Update `level.obeliskAttackFn`, `ent.s.eType`, `level.neutralObelisk` and `level.neutralObelisk.spawnflags` and related state during `SP_team_neutralobelisk`.
/// @param level Game-level state; accesses `obeliskAttackFn` and `neutralObelisk`. May update `level.obeliskAttackFn`, `level.neutralObelisk` and `level.neutralObelisk.spawnflags` in place.
/// @param ent Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType` and `ent.s.modelindex` in place.
function SP_team_neutralobelisk(level,ent)
  level.obeliskAttackFn = CheckObeliskAttack
  if gametype(level) != GT_1FCTF and gametype(level) != GT_HARVESTER then game.free(level,ent); return void end if
  ent.s.eType = c.ET_TEAM
  if gametype(level) == GT_HARVESTER then
    level.neutralObelisk = SpawnObelisk(level,ent.s.origin,c.TEAM_FREE,ent.spawnflags); level.neutralObelisk.spawnflags = c.TEAM_FREE
  end if
  ent.s.modelindex = c.TEAM_FREE; game.link(level,ent); return void
end function
/// Set `level.redObeliskAttackedTime` to `level.time` and `level.blueObeliskAttackedTime` to `level.time` in `mq3.game.team_missionpack.CheckObeliskAttack`.
/// @param level Game-level state; accesses `time`, `redObeliskAttackedTime` and `blueObeliskAttackedTime`. May update `level.redObeliskAttackedTime` and `level.blueObeliskAttackedTime` in place.
/// @param obelisk Obelisk record; accesses `die`, `spawnflags` and `s`.
/// @param attacker Attacking entity; accesses `client`.
function CheckObeliskAttack(level,obelisk,attacker)
  if obelisk.die != ObeliskDie or attacker.client == void then return false end if
  if obelisk.spawnflags == attacker.client.team then return true end if
  expired = n.i32(level.time-OVERLOAD_ATTACK_BASE_SOUND_TIME)
  if (obelisk.spawnflags == c.TEAM_RED and level.redObeliskAttackedTime < expired) or (obelisk.spawnflags == c.TEAM_BLUE and level.blueObeliskAttackedTime < expired) then
    sound = game.tempEntity(level,obelisk.s.pos.trBase,c.EV_GLOBAL_TEAM_SOUND)
    if obelisk.spawnflags == c.TEAM_RED then sound.s.eventParm = c.GTS_REDOBELISK_ATTACKED; level.redObeliskAttackedTime = level.time
    else sound.s.eventParm = c.GTS_BLUEOBELISK_ATTACKED; level.blueObeliskAttackedTime = level.time end if
    sound.r.svFlags = sound.r.svFlags | SVF_BROADCAST
  end if
  return false
end function
