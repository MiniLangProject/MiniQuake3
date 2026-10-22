// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete g_team.c surface. Baseq3 calls reuse the production kernels; the
// MISSIONPACK obelisk calls live in team_missionpack and share game entities.
package mq3.game.g_team
import mq3.game.constants as c
import mq3.game.combat as combat
import mq3.game.entities as game
import mq3.game.items as items
import mq3.game.player_spawns as spawns
import mq3.game.team_bonuses as bonuses
import mq3.game.team_status as status
import mq3.game.team_missionpack as mission
import mq3.compat.numeric as n

function Team_InitGame(level)
  items.initTeamGame(level)
  if level.spawner != void and level.spawner.gametype == 5 then
    level.neutralFlagStatus = -1; items.setFlagStatus(level,c.TEAM_FREE,0)
  end if
  return void
end function
function OtherTeam(team) return bonuses.otherTeam(team) end function
function TeamName(team) return bonuses.teamName(team) end function
function OtherTeamName(team) return bonuses.teamName(bonuses.otherTeam(team)) end function
function TeamColorString(team)
  if team == c.TEAM_RED then return "^1" end if
  if team == c.TEAM_BLUE then return "^4" end if
  if team == c.TEAM_SPECTATOR then return "^3" end if
  return "^7"
end function
function PrintMsg(level,ent,text)
  if level.teamMessageFn == void then return error(497,"PrintMsg requires server-command delivery") end if
  data = bytes(text); if len(data) > 1023 then return error(497,"PrintMsg overrun") end if
  for index = 0 to len(data)-1
    if data[index] == 34 then data[index] = 39 end if
  end for
  slot = -1; if ent != void then slot = ent.slot end if
  level.teamMessageFn(level,slot,decode(data)); return void
end function
function AddTeamScore(level,origin,team,score) return items.addTeamScore(level,origin,team,score) end function
function OnSameTeam(level,first,second) return bonuses.sameTeam(level,first,second) end function
function Team_SetFlagStatus(level,team,value) return items.setFlagStatus(level,team,value) end function
function Team_CheckDroppedItem(level,dropped) return items.checkDropped(level,dropped) end function
function Team_ForceGesture(level,team) return items.forceGesture(level,team) end function
function Team_FragBonuses(level,targ,inflictor,attacker) return bonuses.fragBonuses(level,targ,inflictor,attacker) end function
function Team_CheckHurtCarrier(level,targ,attacker) return combat.checkHurtCarrier(level,targ,attacker) end function
function Team_ResetFlag(level,team) return items.resetFlag(level,team) end function
function Team_ResetFlags(level) return items.resetFlags(level) end function
function Team_ReturnFlagSound(level,ent,team) return items.returnFlagSound(level,ent,team) end function
function Team_TakeFlagSound(level,ent,team) return items.takeFlagSound(level,ent,team) end function
function Team_CaptureFlagSound(level,ent,team) return items.captureFlagSound(level,ent,team) end function
function Team_ReturnFlag(level,team) return items.returnFlag(level,team) end function
function Team_FreeEntity(level,ent) return items.teamFree(level,ent) end function
function Team_DroppedFlagThink(level,ent) return items.droppedFlagThink(level,ent) end function
function Team_TouchOurFlag(level,ent,other,team) return items.touchOurFlag(level,ent,other,team) end function
function Team_TouchEnemyFlag(level,ent,other,team)
  if level.spawner != void and level.spawner.gametype == 5 then
    PrintMsg(level,void,other.client.netname+"^7 got the flag!\n")
    other.client.ps.powerups[c.PW_NEUTRALFLAG] = 2147483647
    if team == c.TEAM_RED then items.setFlagStatus(level,c.TEAM_FREE,2) else items.setFlagStatus(level,c.TEAM_FREE,3) end if
    // CTF_FLAG_BONUS is zero in the pinned game constants.
    other.client.flagsince = n.f32(level.time); items.takeFlagSound(level,ent,team); return -1
  end if
  return items.touchEnemyFlag(level,ent,other,team)
end function
function Pickup_Team(level,ent,other)
  gametype = 0; if level.spawner != void then gametype = level.spawner.gametype end if
  if gametype == 6 then game.free(level,ent); return 0 end if
  if gametype == 7 then
    if ent.spawnflags != other.client.team then other.client.ps.generic1 = n.add32(other.client.ps.generic1,1) end if
    game.free(level,ent); return 0
  end if
  if gametype == 5 then
    team = -1
    if ent.classname == "team_CTF_redflag" then team = c.TEAM_RED
    else if ent.classname == "team_CTF_blueflag" then team = c.TEAM_BLUE
    else if ent.classname == "team_CTF_neutralflag" then team = c.TEAM_FREE end if
    if team < 0 then PrintMsg(level,other,"Don't know what team the flag is on.\n"); return 0 end if
    if team == c.TEAM_FREE then return Team_TouchEnemyFlag(level,ent,other,other.client.team) end if
    if team != other.client.team then return Team_TouchOurFlag(level,ent,other,other.client.team) end if
    return 0
  end if
  return items.pickupTeam(level,ent,other)
end function
function Team_GetLocation(level,ent) return status.getLocation(level,ent) end function
function Team_GetLocationMsg(level,ent,capacity) return status.getLocationMsg(level,ent,capacity) end function
function SelectRandomTeamSpawnPoint(level,teamstate,team) return spawns.randomTeam(level,teamstate,team) end function
function SelectCTFSpawnPoint(level,team,teamstate,origin,angles) return spawns.ctf(level,team,teamstate,origin,angles) end function
function SortClients(a,b) return status.sortClients(a,b) end function
function TeamplayInfoMessage(level,ent) return status.sendInfo(level,ent) end function
function CheckTeamStatus(level) return status.check(level) end function
function SP_team_CTF_redplayer(level,ent) return void end function
function SP_team_CTF_blueplayer(level,ent) return void end function
function SP_team_CTF_redspawn(level,ent) return void end function
function SP_team_CTF_bluespawn(level,ent) return void end function
function ObeliskRegen(level,self) return mission.ObeliskRegen(level,self) end function
function ObeliskRespawn(level,self) return mission.ObeliskRespawn(level,self) end function
function ObeliskDie(level,self,inflictor,attacker,damage,mod) return mission.ObeliskDie(level,self,inflictor,attacker,damage,mod) end function
function ObeliskTouch(level,self,other,trace) return mission.ObeliskTouch(level,self,other,trace) end function
function ObeliskPain(level,self,attacker,damage) return mission.ObeliskPain(level,self,attacker,damage) end function
function SpawnObelisk(level,origin,team,spawnflags) return mission.SpawnObelisk(level,origin,team,spawnflags) end function
function SP_team_redobelisk(level,ent) return mission.SP_team_redobelisk(level,ent) end function
function SP_team_blueobelisk(level,ent) return mission.SP_team_blueobelisk(level,ent) end function
function SP_team_neutralobelisk(level,ent) return mission.SP_team_neutralobelisk(level,ent) end function
function CheckObeliskAttack(level,obelisk,attacker) return mission.CheckObeliskAttack(level,obelisk,attacker) end function
