// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ClientCleanName, ClientUserinfoChanged, TeamLeader and PickTeam.
package mq3.game.client_info
import mq3.shared.info as infoStrings
import mq3.game.constants as c
import mq3.game.spawn_values as values
import mq3.game.tournament as tournament
import mq3.compat.textnumbers as textnum
import std.string as strings
const SVF_BOT = 0x00000008
function leaderValue(client)
  // Session sscanf can preserve a noncanonical qboolean integer verbatim.
  if typeof(client.teamLeader) == "int" then return client.teamLeader end if
  if client.teamLeader then return 1 end if
  return 0
end function

function cleanName(text,capacity)
  if capacity < 2 then return error(494,"Client name has no native fallback storage") end if
  data = infoStrings.textBytes(text); limit = capacity-1; output = []; colorless = 0; spaces = 0; index = 0
  while index < len(data)
    part = data[index]; index = index+1
    if len(output) == 0 and part == 32 then continue end if
    if part == 94 then
      if index == len(data) then break end if
      color = data[index]
      if ((color-48) & 7) == 0 then index = index+1; continue end if
      if len(output) > limit-2 then break end if
      output = output+[part,color]; index = index+1; continue
    end if
    if part == 32 then
      spaces = spaces+1
      if spaces > 3 then continue end if
    else
      spaces = 0
    end if
    if len(output) > limit-1 then break end if
    output = output+[part]; colorless = colorless+1
  end while
  // Original fallback passes the already-decremented outSize to Q_strncpyz.
  if len(output) == 0 or colorless == 0 then return infoStrings.copy("UnnamedPlayer",limit) end if
  return decode(bytes(output))
end function
function infoClientLimit(level)
  if level.maxclients < 0 or level.maxclients > 64 then return error(494,"Invalid userinfo team client limit") end if
  return void
end function
function teamLeader(level,team)
  infoClientLimit(level); index = 0
  while index < level.maxclients
    client = level.clients[index]
    if client.connected != 0 and client.team == team and client.teamLeader then return index end if
    index = index+1
  end while
  return -1
end function
function pickTeam(level,ignoreClientNum)
  blue = tournament.teamCount(level,ignoreClientNum,c.TEAM_BLUE)
  red = tournament.teamCount(level,ignoreClientNum,c.TEAM_RED)
  if blue > red then return c.TEAM_RED end if
  if red > blue then return c.TEAM_BLUE end if
  if level.teamScores[c.TEAM_BLUE] > level.teamScores[c.TEAM_RED] then return c.TEAM_RED end if
  return c.TEAM_BLUE
end function
function changed(level,slot)
  if slot < 0 or slot >= 64 then return error(494,"Invalid userinfo client slot") end if
  ent = level.entities[slot]; client = ent.client
  if client == void then return error(494,"Userinfo requires client binding") end if
  if level.userinfoFn == void then return error(494,"Userinfo requires engine delivery") end if
  info = infoStrings.copy(level.userinfoFn(level,slot),1024)
  if not infoStrings.valid(info) then info = "\\name\\badinfo" end if
  if infoStrings.value(info,"ip") == "localhost" then client.localClient = true end if
  client.predictItemPickup = textnum.atoi(infoStrings.value(info,"cg_predictItems")) != 0
  oldname = infoStrings.copy(client.netname,1024)
  client.netname = cleanName(infoStrings.value(info,"name"),36)
  if client.team == c.TEAM_SPECTATOR and client.spectatorState == 3 then client.netname = "scoreboard" end if
  if client.connected == 2 and oldname != client.netname then
    if level.serverCommandFn == void then return error(494,"Userinfo rename requires server-command delivery") end if
    level.serverCommandFn(level,-1,"print \""+oldname+"^7 renamed to "+client.netname+"\n\"")
  end if
  client.maxHealth = textnum.atoi(infoStrings.value(info,"handicap"))
  if client.maxHealth < 1 or client.maxHealth > 100 then client.maxHealth = 100 end if
  client.ps.stats[c.STAT_MAX_HEALTH] = client.maxHealth
  if level.spawner == void then return error(494,"Userinfo requires game spawn state") end if
  gametype = level.spawner.gametype; bot = (ent.r.svFlags & SVF_BOT) != 0; model = ""; head = ""
  if gametype >= 3 then
    model = infoStrings.copy(infoStrings.value(info,"team_model"),64)
    head = infoStrings.copy(infoStrings.value(info,"team_headmodel"),64)
  else
    model = infoStrings.copy(infoStrings.value(info,"model"),64)
    head = infoStrings.copy(infoStrings.value(info,"headmodel"),64)
  end if
  team = client.team
  if gametype >= 3 and bot then
    wanted = infoStrings.value(info,"team")
    if strings.equalsIgnoreCaseAscii(wanted,"red") or strings.equalsIgnoreCaseAscii(wanted,"r") then team = c.TEAM_RED
    else if strings.equalsIgnoreCaseAscii(wanted,"blue") or strings.equalsIgnoreCaseAscii(wanted,"b") then team = c.TEAM_BLUE
    else team = pickTeam(level,slot) end if
  end if
  overlay = infoStrings.value(info,"teamoverlay"); client.teamInfo = overlay == "" or textnum.atoi(overlay) != 0
  task = textnum.atoi(infoStrings.value(info,"teamtask")); leader = leaderValue(client)
  color1 = infoStrings.value(info,"color1"); color2 = infoStrings.value(info,"color2")
  redTeam = infoStrings.value(info,"g_redteam"); blueTeam = infoStrings.value(info,"g_blueteam")
  // Configstrings are formatted by va, not a MAX_INFO_STRING-sized sprintf.
  // Preserve their complete bytes even when the formatted subset exceeds 1023.
  packet = "n\\"+client.netname+"\\t\\"+str(team)+"\\model\\"+model+"\\hmodel\\"+head
  if not bot then packet = packet+"\\g_redteam\\"+redTeam+"\\g_blueteam\\"+blueTeam end if
  packet = packet+"\\c1\\"+color1+"\\c2\\"+color2+"\\hc\\"+str(client.maxHealth)+"\\w\\"+str(client.wins)+"\\l\\"+str(client.losses)
  if bot then packet = packet+"\\skill\\"+infoStrings.value(info,"skill") end if
  packet = packet+"\\tt\\"+str(task)+"\\tl\\"+str(leader)
  values.setConfig(level.spawner,544+slot,packet)
  if level.gameLogFn == void then return error(494,"Userinfo requires game-log delivery") end if
  level.gameLogFn(level,"ClientUserinfoChanged: "+str(slot)+" "+packet+"\n")
  return void
end function
