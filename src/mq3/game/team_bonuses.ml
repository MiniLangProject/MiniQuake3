// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 Team_FragBonuses, including the original carrier-defense vector reuse.
package mq3.game.team_bonuses
import mq3.game.constants as c
import mq3.game.scores as scores
import mq3.server.world as sv
import mq3.shared.math as q
import mq3.compat.numeric as n
import std.string as strings

const AWARD_MASK = 0x38848
/// Exchange red and blue team identifiers for team bonuses, preserving other team values.
/// @param team Team identifier used by the game rules.
function otherTeam(team)
  if team == c.TEAM_RED then return c.TEAM_BLUE end if
  if team == c.TEAM_BLUE then return c.TEAM_RED end if
  return team
end function
/// Execute `if team == c.TEAM_RED then return "RED" end if if team == c.TEAM_BLUE then return "BLUE" end if if team == c.TEAM_SPE...` in `teamName`.
/// @param team Team identifier used by the game rules.
function teamName(team)
  if team == c.TEAM_RED then return "RED" end if
  if team == c.TEAM_BLUE then return "BLUE" end if
  if team == c.TEAM_SPECTATOR then return "SPECTATOR" end if
  return "FREE"
end function
/// Check whether two client entities share a team in a team game for team bonuses.
/// @param level Game-level state; accesses `spawner`.
/// @param first First record; accesses `client`.
/// @param second Second record; accesses `client`.
function sameTeam(level,first,second)
  if first.client == void or second.client == void or level.spawner.gametype < 3 then return false end if
  return first.client.team == second.client.team
end function
/// Find the next active entity with a case-insensitive class-name match for team bonuses.
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
/// Return a new array `[n.fsub(first[0],second[0]),n.fsub(first[1],second[1]),n.fsub(first[2],second[2])]` for `delta`.
/// @param first Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param second Three-component array; components 0, 1 and 2 are used in their stored order.
function delta(first,second)
  return [n.fsub(first[0],second[0]),n.fsub(first[1],second[1]),n.fsub(first[2],second[2])]
end function
/// Increment the defender award count and set its player-state flag and two-second reward timer.
/// @param level Game-level state; accesses `time`.
/// @param attacker Attacking entity; accesses `client`.
function awardDefense(level,attacker)
  cl = attacker.client; cl.ps.persistant[c.PERS_DEFEND_COUNT] = n.add32(cl.ps.persistant[c.PERS_DEFEND_COUNT],1)
  cl.ps.eFlags = (cl.ps.eFlags & n.i32(~AWARD_MASK)) | 0x10000; cl.rewardTime = n.add32(level.time,2000)
  return void
end function
/// Use `level.teamMessageFn` to perform `message`.
/// @param level Game-level state; accesses `teamMessageFn`.
/// @param text Text to parse, format or deliver.
function message(level,text)
  if level.teamMessageFn == void then return error(496,"Team bonus message requires a PrintMsg sink") end if
  level.teamMessageFn(level,-1,text)
  return void
end function
/// Update `attacker.client.lastfraggedcarrier`, `attacker.client.fragcarrier`, `attacker.client.carrierdefense` and `targ.client.lasthurtcarrier` and related state during `fragBonuses`.
/// @param level Game-level state; accesses `time`, `maxclientsCvar`, `entities` and `scene`.
/// @param targ Targ record; accesses `client` and `r`. May update `targ.client.lasthurtcarrier` in place.
/// @param inflictor Not read by this implementation; retained in the `fragBonuses` signature.
/// @param attacker Attacking entity; accesses `client` and `r`. May update `attacker.client.lastfraggedcarrier`, `attacker.client.fragcarrier` and `attacker.client.carrierdefense` and additional fields in place.
function fragBonuses(level,targ,inflictor,attacker)
  if targ.client == void or attacker == void or attacker.client == void or targ == attacker or sameTeam(level,targ,attacker) then return void end if
  team = targ.client.team; other = otherTeam(team)
  if other < 0 then return void end if
  flagPowerup = c.PW_BLUEFLAG; enemyFlagPowerup = c.PW_REDFLAG
  if team == c.TEAM_RED then flagPowerup = c.PW_REDFLAG; enemyFlagPowerup = c.PW_BLUEFLAG end if
  if targ.client.ps.powerups[enemyFlagPowerup] != 0 then
    attacker.client.lastfraggedcarrier = n.f32(level.time); scores.addScore(level,attacker,targ.r.currentOrigin,2)
    attacker.client.fragcarrier = n.add32(attacker.client.fragcarrier,1)
    message(level,attacker.client.netname+"^7 fragged "+teamName(team)+"'s flag carrier!\n")
    if level.maxclientsCvar < 0 or level.maxclientsCvar > 64 then return error(496,"Invalid team client limit") end if
    for i = 0 to level.maxclientsCvar-1
      ent = level.entities[i]
      if ent.inuse and ent.client != void and ent.client.team == other then ent.client.lasthurtcarrier = 0.0 end if
    end for
    return void
  end if
  recent = targ.client.lasthurtcarrier != 0 and n.fsub(n.f32(level.time),targ.client.lasthurtcarrier) < 8000.0
  if recent and attacker.client.ps.powerups[flagPowerup] == 0 then
    scores.addScore(level,attacker,targ.r.currentOrigin,2); attacker.client.carrierdefense = n.add32(attacker.client.carrierdefense,1)
    targ.client.lasthurtcarrier = 0.0; awardDefense(level,attacker); return void
  end if
  // Kept as a separate branch because the baseq3 source contains it even
  // without MISSIONPACK; it also awards a carrier holding the team's flag.
  if recent then
    scores.addScore(level,attacker,targ.r.currentOrigin,2); attacker.client.carrierdefense = n.add32(attacker.client.carrierdefense,1)
    targ.client.lasthurtcarrier = 0.0; awardDefense(level,attacker); return void
  end if
  flagClass = void
  if attacker.client.team == c.TEAM_RED then flagClass = "team_CTF_redflag"
  else if attacker.client.team == c.TEAM_BLUE then flagClass = "team_CTF_blueflag"
  else return void end if
  carrier = void
  if level.maxclientsCvar < 0 or level.maxclientsCvar > 64 then return error(496,"Invalid team client limit") end if
  for i = 0 to level.maxclientsCvar-1
    candidate = level.entities[i]
    if candidate.inuse and candidate.client != void and candidate.client.ps.powerups[flagPowerup] != 0 then carrier = candidate; break end if
  end for
  flag = void; scan = void
  while true
    scan = findClass(level,scan,flagClass)
    if scan == void then break end if
    if (scan.flags & 0x1000) == 0 then flag = scan; break end if
  end while
  if flag == void then return void end if
  v1 = delta(targ.r.currentOrigin,flag.r.currentOrigin); v2 = delta(attacker.r.currentOrigin,flag.r.currentOrigin)
  targetNear = q.VectorLength(v1) < 1000.0 and sv.inPVS(level.scene,flag.r.currentOrigin,targ.r.currentOrigin)
  attackerNear = q.VectorLength(v2) < 1000.0 and sv.inPVS(level.scene,flag.r.currentOrigin,attacker.r.currentOrigin)
  if (targetNear or attackerNear) and attacker.client.team != targ.client.team then
    scores.addScore(level,attacker,targ.r.currentOrigin,1); attacker.client.basedefense = n.add32(attacker.client.basedefense,1)
    awardDefense(level,attacker); return void
  end if
  if carrier != void and carrier != attacker then
    // Original baseq3 overwrites v1 with attacker-to-carrier and leaves v2 as
    // attacker-to-flag. The native comparison suite locks this behavior down.
    v1 = delta(targ.r.currentOrigin,carrier.r.currentOrigin); v1 = delta(attacker.r.currentOrigin,carrier.r.currentOrigin)
    carrierTarget = q.VectorLength(v1) < 1000.0 and sv.inPVS(level.scene,carrier.r.currentOrigin,targ.r.currentOrigin)
    carrierAttacker = q.VectorLength(v2) < 1000.0 and sv.inPVS(level.scene,carrier.r.currentOrigin,attacker.r.currentOrigin)
    if (carrierTarget or carrierAttacker) and attacker.client.team != targ.client.team then
      scores.addScore(level,attacker,targ.r.currentOrigin,1); attacker.client.carrierdefense = n.add32(attacker.client.carrierdefense,1)
      awardDefense(level,attacker); return void
    end if
  end if
  return void
end function
