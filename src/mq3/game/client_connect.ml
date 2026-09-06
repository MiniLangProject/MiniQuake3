// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ClientConnect with default IP filtering; bot setup remains a boundary.
package mq3.game.client_connect
import mq3.game.entities as game
import mq3.game.session as sessions
import mq3.game.client_info as clientInfo
import mq3.game.scores as scores
import mq3.game.ip_filters as ipFilters
import mq3.shared.info as infoStrings
import std.string as strings

function connect(level,slot,firstTime,isBot)
  if slot < 0 or slot >= 64 then return error(492,"Invalid connecting client slot") end if
  ent = level.entities[slot]
  if level.userinfoFn == void then return error(492,"Connect requires userinfo delivery") end if
  info = infoStrings.copy(level.userinfoFn(level,slot),1024); ip = infoStrings.value(info,"ip")
  banned = false
  if level.filterPacketFn != void then banned = level.filterPacketFn(level,ip)
  else banned = ipFilters.filterPacket(level,ip) end if
  if banned then return "You are banned from this server." end if
  // Password exemption checks the existing entity flag, not the isBot argument.
  if (ent.r.svFlags & 8) == 0 and ip != "localhost" then
    password = level.cvarMaintenance.password
    if password != "" and not strings.equalsIgnoreCaseAscii(password,"none") and password != infoStrings.value(info,"password") then return "Invalid password" end if
  end if
  client = level.clients[slot]; game.bindClient(level,ent,client); game.resetClient(client); client.connected = 1
  if firstTime or level.newSession then sessions.initClient(level,client,info) end if
  sessions.readClient(level,client)
  if isBot then
    ent.r.svFlags = ent.r.svFlags | 8; ent.inuse = true
    if level.botConnectFn == void then return error(492,"Connect requires bot setup") end if
    if not level.botConnectFn(level,slot,not firstTime) then return "BotConnectfailed" end if
  end if
  if level.gameLogFn == void then return error(492,"Connect requires game-log delivery") end if
  level.gameLogFn(level,"ClientConnect: "+str(slot)+"\n"); clientInfo.changed(level,slot)
  if firstTime then
    if level.serverCommandFn == void then return error(492,"Connect requires announcement delivery") end if
    level.serverCommandFn(level,-1,"print \""+client.netname+"^7 connected\n\"")
  end if
  if level.spawner.gametype >= 3 and client.team != 3 then sessions.broadcastTeamChange(level,client,-1) end if
  scores.calculateRanks(level); return void
end function
