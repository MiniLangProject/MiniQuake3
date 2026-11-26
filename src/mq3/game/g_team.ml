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

/// Set `level.neutralFlagStatus` to `-1` in `mq3.game.g_team.Team_InitGame`.
/// @param level Game-level state; accesses `spawner` and `neutralFlagStatus`. May update `level.neutralFlagStatus` in place.
function Team_InitGame(level)
  items.initTeamGame(level)
  if level.spawner != void and level.spawner.gametype == 5 then
    level.neutralFlagStatus = -1; items.setFlagStatus(level,c.TEAM_FREE,0)
  end if
  return void
end function
/// Forward `OtherTeam` to `mq3.game.team_bonuses.otherTeam` and return the delegated result.
/// @param team Team identifier used by the game rules.
function OtherTeam(team) return bonuses.otherTeam(team) end function
/// Forward `TeamName` to `mq3.game.team_bonuses.teamName` and return the delegated result.
/// @param team Team identifier used by the game rules.
function TeamName(team) return bonuses.teamName(team) end function
/// Forward `OtherTeamName` to `mq3.game.team_bonuses.teamName` and return the delegated result.
/// @param team Team identifier used by the game rules.
function OtherTeamName(team) return bonuses.teamName(bonuses.otherTeam(team)) end function
/// Execute `if team == c.TEAM_RED then return "^1" end if if team == c.TEAM_BLUE then return "^4" end if if team == c.TEAM_SPECTA...` in `TeamColorString`.
/// @param team Team identifier used by the game rules.
function TeamColorString(team)
  if team == c.TEAM_RED then return "^1" end if
  if team == c.TEAM_BLUE then return "^4" end if
  if team == c.TEAM_SPECTATOR then return "^3" end if
  return "^7"
end function
/// Use `level.teamMessageFn` to perform `PrintMsg`.
/// @param level Game-level state; accesses `teamMessageFn`.
/// @param ent Game entity; accesses `slot`.
/// @param text Text to parse, format or deliver.
function PrintMsg(level,ent,text)
  if level.teamMessageFn == void then return error(497,"PrintMsg requires server-command delivery") end if
  data = bytes(text); if len(data) > 1023 then return error(497,"PrintMsg overrun") end if
  for index = 0 to len(data)-1
    if data[index] == 34 then data[index] = 39 end if
  end for
  slot = -1; if ent != void then slot = ent.slot end if
  level.teamMessageFn(level,slot,decode(data)); return void
end function
/// Forward `AddTeamScore` to `mq3.game.items.addTeamScore` and return the delegated result.
/// @param level Game-level state; accesses `teamScores`. May update `level.teamScores[team]` in place.
/// @param origin World-space position as three coordinates.
/// @param team Team identifier used by the game rules.
/// @param score Value passed as argument 2 to `mq3.compat.numeric.add32`.
function AddTeamScore(level,origin,team,score) return items.addTeamScore(level,origin,team,score) end function
/// Forward `OnSameTeam` to `mq3.game.team_bonuses.sameTeam` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param first First record; accesses `client`.
/// @param second Second record; accesses `client`.
function OnSameTeam(level,first,second) return bonuses.sameTeam(level,first,second) end function
/// Forward `Team_SetFlagStatus` to `mq3.game.items.setFlagStatus` and return the delegated result.
/// @param level Game-level state; accesses `redFlagStatus`, `blueFlagStatus`, `neutralFlagStatus` and `spawner`. May update `level.redFlagStatus`, `level.blueFlagStatus` and `level.neutralFlagStatus` in place.
/// @param team Team identifier used by the game rules.
/// @param value Value used by `setFlagStatus` in `if status < 0 or status > 4 then return error(497,"Invalid flag status") end if`.
function Team_SetFlagStatus(level,team,value) return items.setFlagStatus(level,team,value) end function
/// Forward `Team_CheckDroppedItem` to `mq3.game.items.checkDropped` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param dropped Dropped record; accesses `item`.
function Team_CheckDroppedItem(level,dropped) return items.checkDropped(level,dropped) end function
/// Forward `Team_ForceGesture` to `mq3.game.items.forceGesture` and return the delegated result.
/// @param level Game-level state; accesses `entities`.
/// @param team Team identifier used by the game rules.
function Team_ForceGesture(level,team) return items.forceGesture(level,team) end function
/// Forward `Team_FragBonuses` to `mq3.game.team_bonuses.fragBonuses` and return the delegated result.
/// @param level Game-level state; accesses `time`, `maxclientsCvar`, `entities` and `scene`.
/// @param targ Targ record; accesses `client` and `r`. May update `targ.client.lasthurtcarrier` in place.
/// @param inflictor Entity directly delivering the damage.
/// @param attacker Entity credited with the attack.
function Team_FragBonuses(level,targ,inflictor,attacker) return bonuses.fragBonuses(level,targ,inflictor,attacker) end function
/// Forward `Team_CheckHurtCarrier` to `mq3.game.combat.checkHurtCarrier` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param targ Targ record; accesses `client`.
/// @param attacker Entity credited with the attack.
function Team_CheckHurtCarrier(level,targ,attacker) return combat.checkHurtCarrier(level,targ,attacker) end function
/// Forward `Team_ResetFlag` to `mq3.game.items.resetFlag` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param team Team identifier used by the game rules.
function Team_ResetFlag(level,team) return items.resetFlag(level,team) end function
/// Forward `Team_ResetFlags` to `mq3.game.items.resetFlags` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
function Team_ResetFlags(level) return items.resetFlags(level) end function
/// Forward `Team_ReturnFlagSound` to `mq3.game.items.returnFlagSound` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `s`.
/// @param team Team identifier used by the game rules.
function Team_ReturnFlagSound(level,ent,team) return items.returnFlagSound(level,ent,team) end function
/// Forward `Team_TakeFlagSound` to `mq3.game.items.takeFlagSound` and return the delegated result.
/// @param level Game-level state; accesses `blueFlagStatus`, `blueTakenTime`, `time`, `redFlagStatus` and `redTakenTime`. May update `level.blueTakenTime` and `level.redTakenTime` in place.
/// @param ent Game entity; accesses `s`.
/// @param team Team identifier used by the game rules.
function Team_TakeFlagSound(level,ent,team) return items.takeFlagSound(level,ent,team) end function
/// Forward `Team_CaptureFlagSound` to `mq3.game.items.captureFlagSound` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`.
/// @param team Team identifier used by the game rules.
function Team_CaptureFlagSound(level,ent,team) return items.captureFlagSound(level,ent,team) end function
/// Forward `Team_ReturnFlag` to `mq3.game.items.returnFlag` and return the delegated result.
/// @param level Game-level state; accesses `teamMessageFn`.
/// @param team Team identifier used by the game rules.
function Team_ReturnFlag(level,team) return items.returnFlag(level,team) end function
/// Forward `Team_FreeEntity` to `mq3.game.items.teamFree` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`.
function Team_FreeEntity(level,ent) return items.teamFree(level,ent) end function
/// Forward `Team_DroppedFlagThink` to `mq3.game.items.droppedFlagThink` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`.
function Team_DroppedFlagThink(level,ent) return items.droppedFlagThink(level,ent) end function
/// Forward `Team_TouchOurFlag` to `mq3.game.items.touchOurFlag` and return the delegated result.
/// @param level Game-level state; accesses `time`, `lastFlagCapture`, `lastCaptureTeam`, `maxclients` and `entities`. May update `level.lastFlagCapture` and `level.lastCaptureTeam` in place.
/// @param ent Game entity; accesses `flags`, `r` and `s`.
/// @param other Other record; accesses `client`.
/// @param team Team identifier used by the game rules.
function Team_TouchOurFlag(level,ent,other,team) return items.touchOurFlag(level,ent,other,team) end function
/// Set `other.client.ps.powerups[c.PW_NEUTRALFLAG]` to `2147483647` and `other.client.flagsince` to `n.f32(level.time)` in `mq3.game.g_team.Team_TouchEnemyFlag`. Return paths include `items.touchEnemyFlag(level,ent,other,team)`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param ent Game entity; accesses `s`.
/// @param other Other record; accesses `client`. May update `other.client.ps.powerups[c.PW_NEUTRALFLAG]` and `other.client.flagsince` in place.
/// @param team Team identifier used by the game rules.
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
/// Set `other.client.ps.generic1` to `n.add32(other.client.ps.generic1,1)` in `mq3.game.g_team.Pickup_Team`. Return paths include `items.pickupTeam(level,ent,other)`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `spawnflags` and `classname`.
/// @param other Other record; accesses `client`. May update `other.client.ps.generic1` in place.
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
/// Forward `Team_GetLocation` to `mq3.game.team_status.getLocation` and return the delegated result.
/// @param level Game-level state; accesses `locationHead` and `scene`.
/// @param ent Game entity; accesses `r`.
function Team_GetLocation(level,ent) return status.getLocation(level,ent) end function
/// Forward `Team_GetLocationMsg` to `mq3.game.team_status.getLocationMsg` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `r`.
/// @param capacity Maximum number of entries to allocate or retain.
function Team_GetLocationMsg(level,ent,capacity) return status.getLocationMsg(level,ent,capacity) end function
/// Forward `SelectRandomTeamSpawnPoint` to `mq3.game.player_spawns.randomTeam` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param teamstate Value used by `randomTeam` in `if teamstate == 0 then`.
/// @param team Team identifier used by the game rules.
function SelectRandomTeamSpawnPoint(level,teamstate,team) return spawns.randomTeam(level,teamstate,team) end function
/// Forward `SelectCTFSpawnPoint` to `mq3.game.player_spawns.ctf` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param team Team identifier used by the game rules.
/// @param teamstate Value used by `randomTeam` in `if teamstate == 0 then`.
/// @param origin World-space position as three coordinates.
/// @param angles Pitch, yaw and roll angles in degrees.
function SelectCTFSpawnPoint(level,team,teamstate,origin,angles) return spawns.ctf(level,team,teamstate,origin,angles) end function
/// Forward `SortClients` to `mq3.game.team_status.sortClients` and return the delegated result.
/// @param a Operand used to evaluate the returned expression `n.i32(a-b)`.
/// @param b Operand used to evaluate the returned expression `n.i32(a-b)`.
function SortClients(a,b) return status.sortClients(a,b) end function
/// Forward `TeamplayInfoMessage` to `mq3.game.team_status.sendInfo` and return the delegated result.
/// @param level Game-level state; accesses `sortedClients`, `entities` and `serverCommandFn`.
/// @param ent Game entity; accesses `slot`.
function TeamplayInfoMessage(level,ent) return status.sendInfo(level,ent) end function
/// Forward `CheckTeamStatus` to `mq3.game.team_status.check` and return the delegated result.
/// @param level Game-level state; accesses `time`, `lastTeamLocationTime` and `entities`. May update `level.lastTeamLocationTime` in place.
function CheckTeamStatus(level) return status.check(level) end function
/// Return `void` for `SP_team_CTF_redplayer`.
/// @param level Not read by this implementation; retained in the `SP_team_CTF_redplayer` signature.
/// @param ent Not read by this implementation; retained in the `SP_team_CTF_redplayer` signature.
function SP_team_CTF_redplayer(level,ent) return void end function
/// Return `void` for `SP_team_CTF_blueplayer`.
/// @param level Not read by this implementation; retained in the `SP_team_CTF_blueplayer` signature.
/// @param ent Not read by this implementation; retained in the `SP_team_CTF_blueplayer` signature.
function SP_team_CTF_blueplayer(level,ent) return void end function
/// Return `void` for `SP_team_CTF_redspawn`.
/// @param level Not read by this implementation; retained in the `SP_team_CTF_redspawn` signature.
/// @param ent Not read by this implementation; retained in the `SP_team_CTF_redspawn` signature.
function SP_team_CTF_redspawn(level,ent) return void end function
/// Return `void` for `SP_team_CTF_bluespawn`.
/// @param level Not read by this implementation; retained in the `SP_team_CTF_bluespawn` signature.
/// @param ent Not read by this implementation; retained in the `SP_team_CTF_bluespawn` signature.
function SP_team_CTF_bluespawn(level,ent) return void end function
/// Forward `ObeliskRegen` to `mq3.game.team_missionpack.ObeliskRegen` and return the delegated result.
/// @param level Game-level state; accesses `time`, `obeliskRegenPeriod`, `obeliskHealth` and `obeliskRegenAmount`.
/// @param self Entity receiving the callback; accesses `nextthink`, `health` and `activator`. May update `self.nextthink`, `self.health` and `self.activator.s.modelindex2` and additional fields in place.
function ObeliskRegen(level,self) return mission.ObeliskRegen(level,self) end function
/// Forward `ObeliskRespawn` to `mq3.game.team_missionpack.ObeliskRespawn` and return the delegated result.
/// @param level Game-level state; accesses `obeliskHealth`, `time` and `obeliskRegenPeriod`.
/// @param self Entity receiving the callback; accesses `takedamage`, `health`, `think`, `nextthink` and `activator`. May update `self.takedamage`, `self.health` and `self.think` and additional fields in place.
function ObeliskRespawn(level,self) return mission.ObeliskRespawn(level,self) end function
/// Forward `ObeliskDie` to `mq3.game.team_missionpack.ObeliskDie` and return the delegated result.
/// @param level Game-level state; accesses `time`, `obeliskRespawnDelay`, `redObeliskAttackedTime` and `blueObeliskAttackedTime`. May update `level.redObeliskAttackedTime` and `level.blueObeliskAttackedTime` in place.
/// @param self Entity receiving the callback; accesses `spawnflags`, `s`, `takedamage`, `think` and `nextthink` and related fields. May update `self.takedamage`, `self.think` and `self.nextthink` and additional fields in place.
/// @param inflictor Entity directly delivering the damage.
/// @param attacker Entity credited with the attack.
/// @param damage Damage amount before the current operation applies its rules.
/// @param mod Means-of-death code used for damage attribution.
function ObeliskDie(level,self,inflictor,attacker,damage,mod) return mission.ObeliskDie(level,self,inflictor,attacker,damage,mod) end function
/// Forward `ObeliskTouch` to `mq3.game.team_missionpack.ObeliskTouch` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `spawnflags`, `s` and `r`.
/// @param other Other record; accesses `client`. May update `other.client.ps.eFlags`, `other.client.rewardTime` and `other.client.ps.persistant[c.PERS_CAPTURES]` and additional fields in place.
/// @param trace Value passed as argument 4 to `mq3.game.team_missionpack.ObeliskTouch`.
function ObeliskTouch(level,self,other,trace) return mission.ObeliskTouch(level,self,other,trace) end function
/// Forward `ObeliskPain` to `mq3.game.team_missionpack.ObeliskPain` and return the delegated result.
/// @param level Game-level state; accesses `obeliskHealth`.
/// @param self Entity receiving the callback; accesses `activator`, `health` and `r`. May update `self.activator.s.modelindex2` and `self.activator.s.frame` in place.
/// @param attacker Entity credited with the attack.
/// @param damage Damage amount before the current operation applies its rules.
function ObeliskPain(level,self,attacker,damage) return mission.ObeliskPain(level,self,attacker,damage) end function
/// Forward `SpawnObelisk` to `mq3.game.team_missionpack.SpawnObelisk` and return the delegated result.
/// @param level Game-level state; accesses `obeliskHealth`, `time`, `obeliskRegenPeriod` and `scene`.
/// @param origin World-space position as three coordinates.
/// @param team Team identifier used by the game rules.
/// @param spawnflags Value used by `SpawnObelisk` in `if (spawnflags & 1) != 0 then game.setOrigin(ent,ent.s.origin)`.
function SpawnObelisk(level,origin,team,spawnflags) return mission.SpawnObelisk(level,origin,team,spawnflags) end function
/// Forward `SP_team_redobelisk` to `mq3.game.team_missionpack.SP_team_redobelisk` and return the delegated result.
/// @param level Game-level state; accesses `obeliskAttackFn`. May update `level.obeliskAttackFn` in place.
/// @param ent Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and additional fields in place.
function SP_team_redobelisk(level,ent) return mission.SP_team_redobelisk(level,ent) end function
/// Forward `SP_team_blueobelisk` to `mq3.game.team_missionpack.SP_team_blueobelisk` and return the delegated result.
/// @param level Game-level state; accesses `obeliskAttackFn`. May update `level.obeliskAttackFn` in place.
/// @param ent Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType`, `ent.s.modelindex2` and `ent.s.frame` and additional fields in place.
function SP_team_blueobelisk(level,ent) return mission.SP_team_blueobelisk(level,ent) end function
/// Forward `SP_team_neutralobelisk` to `mq3.game.team_missionpack.SP_team_neutralobelisk` and return the delegated result.
/// @param level Game-level state; accesses `obeliskAttackFn` and `neutralObelisk`. May update `level.obeliskAttackFn`, `level.neutralObelisk` and `level.neutralObelisk.spawnflags` in place.
/// @param ent Game entity; accesses `s` and `spawnflags`. May update `ent.s.eType` and `ent.s.modelindex` in place.
function SP_team_neutralobelisk(level,ent) return mission.SP_team_neutralobelisk(level,ent) end function
/// Forward `CheckObeliskAttack` to `mq3.game.team_missionpack.CheckObeliskAttack` and return the delegated result.
/// @param level Game-level state; accesses `time`, `redObeliskAttackedTime` and `blueObeliskAttackedTime`. May update `level.redObeliskAttackedTime` and `level.blueObeliskAttackedTime` in place.
/// @param obelisk Obelisk record; accesses `die`, `spawnflags` and `s`.
/// @param attacker Entity credited with the attack.
function CheckObeliskAttack(level,obelisk,attacker) return mission.CheckObeliskAttack(level,obelisk,attacker) end function
