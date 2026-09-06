// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_target.c item, powerup, score and center-print targets.
package mq3.game.map_targets
import mq3.game.constants as c
import mq3.game.entities as mapTargetEntities
import mq3.game.items as mapTargetItems
import mq3.game.scores as mapTargetScores
import mq3.game.movement as mapTargetMovement
import mq3.collision.brush as mapTargetBrush

function mapTargetsEntity(ent)
  if ent is void then return error(477,"Map target requires a native entity") end if
  return ent
end function
function mapTargetsEntityLimit(level)
  if typeof(level.num_entities) != "int" or level.num_entities < 0 or level.num_entities > 1024 then
    return error(477,"Map target search exceeds native entity storage")
  end if
  return level.num_entities
end function
function mapTargetsClientLimit(level)
  if typeof(level.maxclients) != "int" or level.maxclients < 0 or level.maxclients > 64 then
    return error(477,"Map target team command exceeds native client storage")
  end if
  return level.maxclients
end function
function mapTargetsText(text,limit)
  // Native Windows CRT prints (null) for the original va %s NULL argument.
  // This measured profile behavior is separate from ISO-C-defined cases.
  if text is void then text = "(null)" end if
  if typeof(text) != "string" then return error(477,"Map target format requires a native string argument") end if
  data = bytes(text); length = 0
  while length < len(data) and data[length] != 0
    length = length+1
    if length > limit then return error(477,"Map target format exceeds native va storage") end if
  end while
  return decode(slice(data,0,length))
end function
function mapTargetsNamesEqual(first,second)
  // Q_stricmp rejects either NULL, stops at NUL and compares at most 99999
  // bytes. Bytes above ASCII are unchanged by its case folding.
  if first is void or second is void then return false end if
  if typeof(first) != "string" or typeof(second) != "string" then return error(477,"Map target name must be a native string") end if
  left = bytes(first); right = bytes(second); index = 0
  while index < 99999
    a = 0; b = 0
    if index < len(left) then a = left[index] end if
    if index < len(right) then b = right[index] end if
    if a >= 97 and a <= 122 then a = a-32 end if
    if b >= 97 and b <= 122 then b = b-32 end if
    if a != b then return false end if
    if a == 0 then return true end if
    index = index+1
  end while
  return true
end function

function giveUse(level,ent,other,activator)
  mapTargetsEntity(activator)
  if activator.client is void then return void end if
  mapTargetsEntity(ent)
  if ent.target is void then return void end if
  trace = mapTargetBrush.Trace(0.0,[0.0,0.0,0.0],0.0,0,0,false,false,0)
  hit = mapTargetMovement.Collision(trace,[0.0,0.0,0.0],0)
  index = 0
  // G_Find resumes after the previous entity. Keep the array position, and
  // read the live target and live entity limit again after each callback.
  while index < mapTargetsEntityLimit(level)
    candidate = level.entities[index]; index = index+1
    if not candidate.inuse or candidate.targetname is void then continue end if
    if not mapTargetsNamesEqual(candidate.targetname,ent.target) then continue end if
    // Item index zero represents a non-NULL bg_itemlist pointer. Only void
    // skips Touch_Item; that real port owns validation of a reached pickup.
    if candidate.item is void then continue end if
    mapTargetItems.touch(level,candidate,activator,hit)
    candidate.nextthink = 0
    mapTargetEntities.unlink(level,candidate)
  end while
  return void
end function
function giveSpawn(level,ent)
  mapTargetsEntity(ent); ent.use = giveUse; return void
end function

function mapTargetsPowerups(activator)
  if activator.client is void then return error(477,"Map target lost its activating client") end if
  if activator.client.ps is void or len(activator.client.ps.powerups) != 16 then
    return error(477,"Map target requires the native sixteen powerup slots")
  end if
  return activator.client.ps.powerups
end function
function removePowerupsUse(level,ent,other,activator)
  mapTargetsEntity(activator)
  if activator.client is void then return void end if
  powerups = mapTargetsPowerups(activator)
  if powerups[c.PW_REDFLAG] != 0 then mapTargetItems.returnFlag(level,c.TEAM_RED)
  else if powerups[c.PW_BLUEFLAG] != 0 then mapTargetItems.returnFlag(level,c.TEAM_BLUE)
  else if powerups[c.PW_NEUTRALFLAG] != 0 then mapTargetItems.returnFlag(level,c.TEAM_FREE) end if
  // Team_ReturnFlag can invoke game/engine callbacks. Native memset uses
  // the current client after those calls and preserves its embedded array.
  powerups = mapTargetsPowerups(activator)
  for index = 0 to 15
    powerups[index] = 0
  end for
  return void
end function
function removePowerupsSpawn(level,ent)
  mapTargetsEntity(ent); ent.use = removePowerupsUse; return void
end function

function scoreUse(level,ent,other,activator)
  mapTargetsEntity(ent); mapTargetsEntity(activator)
  // Keep the origin vector aliased through G_TempEntity's allocation/link
  // callbacks. AddScore supplies warmup, score-plum and rank behavior.
  return mapTargetScores.addScore(level,activator,ent.r.currentOrigin,ent.count)
end function
function scoreSpawn(level,ent)
  mapTargetsEntity(ent)
  if ent.count == 0 then ent.count = 1 end if
  ent.use = scoreUse; return void
end function

function mapTargetsCenterCommand(ent)
  // va("cp \"%s\"", message): five framing bytes plus the final NUL must
  // fit in string[2][32000]. Embedded NUL terminates the %s argument.
  return "cp \""+mapTargetsText(ent.message,31994)+"\""
end function
function mapTargetsTeamCommand(level,team,command)
  index = 0; message = void
  while index < mapTargetsClientLimit(level)
    slot = index; index = index+1
    // G_TeamCommand differs from PrintTeam: connecting/disconnected team
    // members receive nothing. Conditions and the loop bound stay live.
    if level.clients[slot].connected != 2 then continue end if
    if level.clients[slot].team != team then continue end if
    if message is void then message = mapTargetsText(command,31999) end if
    // Native va("%s",cmd) reuses two static buffers. Multiple recipients can
    // make sprintf input/output overlap (undefined C); preserve owned text
    // here and report native observations separately from defined parity.
    mapTargetScores.send(level,slot,message)
  end while
  return void
end function
function printUse(level,ent,other,activator)
  mapTargetsEntity(activator); mapTargetsEntity(ent)
  if not (activator.client is void) and (ent.spawnflags & 4) != 0 then
    slot = activator.slot
    if typeof(slot) != "int" or slot < 0 or slot >= 1024 then return error(477,"Private map target requires an entity-array slot") end if
    if level.entities[slot] != activator then return error(477,"Private map target activator is outside the native entity array") end if
    return mapTargetScores.send(level,slot,mapTargetsCenterCommand(ent))
  end if
  if (ent.spawnflags & 3) != 0 then
    if (ent.spawnflags & 1) != 0 then mapTargetsTeamCommand(level,c.TEAM_RED,mapTargetsCenterCommand(ent)) end if
    // Red-team delivery may change flags, message, clients or maxclients.
    if (ent.spawnflags & 2) != 0 then mapTargetsTeamCommand(level,c.TEAM_BLUE,mapTargetsCenterCommand(ent)) end if
    return void
  end if
  return mapTargetScores.send(level,-1,mapTargetsCenterCommand(ent))
end function
function printSpawn(level,ent)
  mapTargetsEntity(ent); ent.use = printUse; return void
end function
