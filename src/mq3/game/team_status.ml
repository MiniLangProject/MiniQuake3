// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_team.c location selection and team overlays.
package mq3.game.team_status
import mq3.game.constants as c
import mq3.server.world as sv
import mq3.compat.numeric as n
import mq3.shared.info as infoStrings
const TEAM_MAXOVERLAY = 32
const TEAM_LOCATION_UPDATE_TIME = 1000

function getLocation(level,ent)
  best = void; bestlen = 201326592.0; origin = ent.r.currentOrigin
  location = level.locationHead; visited = 0
  while location != void
    visited = visited+1
    if visited > 1024 then return error(490,"Invalid location chain") end if
    dx = n.fsub(origin[0],location.r.currentOrigin[0]); dy = n.fsub(origin[1],location.r.currentOrigin[1]); dz = n.fsub(origin[2],location.r.currentOrigin[2])
    distance = n.fadd(n.fadd(n.fmul(dx,dx),n.fmul(dy,dy)),n.fmul(dz,dz))
    if not (distance > bestlen) and sv.inPVS(level.scene,origin,location.r.currentOrigin) then
      bestlen = distance; best = location
    end if
    location = location.nextTrain
  end while
  return best
end function
function getLocationMsg(level,ent,capacity)
  best = getLocation(level,ent)
  if best == void then return void end if
  text = best.message
  // The pinned MSVC formatter emits this spelling for a NULL %s argument.
  if text == void then text = "(null)" end if
  if best.count != 0 then
    if best.count < 0 then best.count = 0 end if
    if best.count > 7 then best.count = 7 end if
    text = "^"+str(best.count)+text+"^7"
  end if
  size = len(infoStrings.textBytes(text))
  if size >= 32000 then return error(490,"Location message exceeds native temporary storage") end if
  if size >= capacity then
    if level.gamePrintFn == void then return error(490,"Location truncation requires game-print delivery") end if
    level.gamePrintFn(level,"Com_sprintf: overflow of "+str(size)+" in "+str(capacity)+"\n")
  end if
  return infoStrings.copy(text,capacity)
end function
function overlayLimit(level)
  if level.maxclientsCvar < 0 or level.maxclientsCvar > 64 then return error(490,"Invalid team-status Cvar client limit") end if
  return level.maxclientsCvar
end function
function boundClient(ent)
  if ent.client == void then return error(490,"Team status requires initialized client bindings") end if
  return ent.client
end function
function sortClients(a,b)
  return n.i32(a-b)
end function
function sendInfo(level,ent)
  client = boundClient(ent)
  if not client.teamInfo then return void end if
  limit = overlayLimit(level); clients = []; index = 0
  while index < limit and len(clients) < TEAM_MAXOVERLAY
    slot = level.sortedClients[index]; index = index+1
    if slot < 0 or slot >= 64 then return error(490,"Invalid sorted overlay client slot") end if
    player = level.entities[slot]
    if player.inuse and boundClient(player).team == client.team then clients = clients+[slot] end if
  end while
  // Retain the original preliminary selection/sort, although the output loop
  // below scans entity slots directly and never reads this sorted array.
  index = 1
  while index < len(clients)
    slot = clients[index]; j = index
    while j > 0 and sortClients(clients[j-1],slot) > 0
      clients[j] = clients[j-1]; j = j-1
    end while
    clients[j] = slot; index = index+1
  end while
  text = ""; count = 0; index = 0
  while index < limit and count < TEAM_MAXOVERLAY
    slot = index; index = index+1; player = level.entities[slot]
    if not player.inuse then continue end if
    member = boundClient(player)
    if member.team != client.team then continue end if
    health = n.i32(member.ps.stats[c.STAT_HEALTH]); armor = n.i32(member.ps.stats[c.STAT_ARMOR])
    if health < 0 then health = 0 end if
    if armor < 0 then armor = 0 end if
    entry = " "+str(slot)+" "+str(n.i32(member.teamStateLocation))+" "+str(health)+" "+str(armor)+" "+str(n.i32(member.ps.weapon))+" "+str(n.i32(player.s.powerups))
    if len(bytes(text))+len(bytes(entry)) > 8192 then break end if
    text = text+entry; count = count+1
  end while
  if level.serverCommandFn == void then return error(490,"Team overlay requires server-command delivery") end if
  level.serverCommandFn(level,ent.slot,"tinfo "+str(count)+" "+text); return void
end function
function check(level)
  if n.i32(level.time-level.lastTeamLocationTime) <= TEAM_LOCATION_UPDATE_TIME then return void end if
  level.lastTeamLocationTime = level.time; limit = overlayLimit(level); index = 0
  while index < limit
    ent = level.entities[index]; index = index+1; client = boundClient(ent)
    if client.connected != 2 then continue end if
    if ent.inuse and (client.team == c.TEAM_RED or client.team == c.TEAM_BLUE) then
      location = getLocation(level,ent); client.teamStateLocation = 0
      if location != void then client.teamStateLocation = location.health end if
    end if
  end while
  // Update every member before sending the first recipient's overlay.
  index = 0
  while index < limit
    ent = level.entities[index]; index = index+1; client = boundClient(ent)
    if client.connected != 2 then continue end if
    if ent.inuse and (client.team == c.TEAM_RED or client.team == c.TEAM_BLUE) then sendInfo(level,ent) end if
  end while
  return void
end function
