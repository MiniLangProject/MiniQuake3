// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// MISSIONPACK half of g_team.c: One Flag, Overload and Harvester obelisks.
package mq3.game.team_missionpack
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.events as events
import mq3.game.movement as movement
import mq3.game.scores as scores
import mq3.compat.numeric as n
import mq3.server.world as sv

const GT_TEAM = 3
const GT_1FCTF = 5
const GT_OBELISK = 6
const GT_HARVESTER = 7
const CONTENTS_SOLID = 1
const CONTENTS_TRIGGER = 0x40000000
const MASK_SOLID = 1
const ENTITYNUM_NONE = 1023
const FL_NO_KNOCKBACK = 0x800
const SVF_BROADCAST = 32
const AWARD_MASK = 0x38848
const CTF_CAPTURE_BONUS = 5
const REWARD_SPRITE_TIME = 2000
const OVERLOAD_ATTACK_BASE_SOUND_TIME = 20000

function gametype(level)
  if level.spawner == void then return 0 end if
  return level.spawner.gametype
end function
function otherTeam(team)
  if team == c.TEAM_RED then return c.TEAM_BLUE end if
  if team == c.TEAM_BLUE then return c.TEAM_RED end if
  return team
end function
function message(level,text)
  if level.teamMessageFn == void then return error(497,"Obelisk message requires PrintMsg delivery") end if
  level.teamMessageFn(level,-1,text); return void
end function
function forceGesture(level,team)
  for slot = 0 to 63
    ent = level.entities[slot]
    if ent.inuse and ent.client != void and ent.client.team == team then ent.flags = ent.flags | 0x8000 end if
  end for
  return void
end function
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
function captureSound(level,ent,team)
  if ent == void then
    game.diagnostic(level,"Warning:  NULL passed to Team_CaptureFlagSound\n"); return void
  end if
  sound = game.tempEntity(level,ent.s.pos.trBase,c.EV_GLOBAL_TEAM_SOUND)
  if team == c.TEAM_BLUE then sound.s.eventParm = c.GTS_BLUE_CAPTURE else sound.s.eventParm = c.GTS_RED_CAPTURE end if
  sound.r.svFlags = sound.r.svFlags | SVF_BROADCAST; return void
end function

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
function ObeliskRespawn(level,self)
  self.takedamage = true; self.health = level.obeliskHealth
  self.think = ObeliskRegen; self.nextthink = n.add32(level.time,n.mul32(level.obeliskRegenPeriod,1000))
  if self.activator == void then return error(497,"Obelisk has no visual activator") end if
  self.activator.s.frame = 0; return void
end function
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
function ObeliskPain(level,self,attacker,damage)
  actual = scores.integerDivide(damage,10); if actual <= 0 then actual = 1 end if
  if self.activator == void then return error(497,"Obelisk has no visual activator") end if
  if level.obeliskHealth == 0 then return error(497,"g_obeliskHealth must be nonzero") end if
  self.activator.s.modelindex2 = scores.integerDivide(n.mul32(self.health,255),level.obeliskHealth)
  if self.activator.s.frame == 0 then events.add(level,self,c.EV_OBELISKPAIN,0) end if
  self.activator.s.frame = 1; scores.addScore(level,attacker,self.r.currentOrigin,actual); return void
end function
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
function SP_team_redobelisk(level,ent) return teamObelisk(level,ent,c.TEAM_RED) end function
function SP_team_blueobelisk(level,ent) return teamObelisk(level,ent,c.TEAM_BLUE) end function
function SP_team_neutralobelisk(level,ent)
  level.obeliskAttackFn = CheckObeliskAttack
  if gametype(level) != GT_1FCTF and gametype(level) != GT_HARVESTER then game.free(level,ent); return void end if
  ent.s.eType = c.ET_TEAM
  if gametype(level) == GT_HARVESTER then
    level.neutralObelisk = SpawnObelisk(level,ent.s.origin,c.TEAM_FREE,ent.spawnflags); level.neutralObelisk.spawnflags = c.TEAM_FREE
  end if
  ent.s.modelindex = c.TEAM_FREE; game.link(level,ent); return void
end function
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
