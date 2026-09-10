// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 item entities, pickups, physics and CTF flag rules.
package mq3.game.items
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.events as events
import mq3.game.movement as movement
import mq3.game.trajectory as trajectory
import mq3.game.combat as combat
import mq3.game.spawn_tables as tables
import mq3.game.spawn_values as values
import mq3.game.snapshot as snapshot
import mq3.game.team_bonuses as bonuses
import mq3.game.scores as scores
import mq3.game.targets as targets
import mq3.server.world as sv
import mq3.shared.math as q
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import mq3.qcommon.cvar as cv
import std.string as strings

const FL_DROPPED_ITEM = 0x1000
const FL_FORCE_GESTURE = 0x8000
const FLAG_ATBASE = 0
const FLAG_TAKEN = 1
const FLAG_DROPPED = 4
const AWARD_MASK = 0x38848

function validItem(index)
  return typeof(index) == "int" and index > 0 and index < len(tables.items())
end function
function requireItem(index)
  if not validItem(index) then return error(497,"Invalid baseq3 item") end if
  return index
end function
function itemName(index)
  return tables.items()[requireItem(index)]
end function
function itemType(index)
  requireItem(index); return c.itemType(index)
end function
function itemTag(index)
  requireItem(index); return c.itemTag(index)
end function
function itemQuantity(index)
  requireItem(index); return c.itemQuantity(index)
end function
function centeredRandom(level)
  // random() divides as float; crandom() then promotes its operands to double.
  return 2.0*(n.fdiv(game.random(level),32767)-0.5)
end function
function register(level,item)
  // Frozen MiniLang compares integer zero equal to void; inspect its type
  // first so the valid bg_itemlist[0] pointer is not mistaken for NULL.
  if typeof(item) != "int" then
    if item == void then return error(497,"RegisterItem: NULL") end if
    return error(497,"RegisterItem requires an original item-array pointer")
  end if
  // RegisterItem only computes an array offset; unlike pickup/spawn it does
  // not dereference the item. Include the dummy and terminating descriptors.
  if item < 0 or item > len(tables.items()) then return error(497,"RegisterItem requires an original item-array pointer") end if
  level.itemRegistered[item] = 1; return void
end function
function clearRegistered(level)
  for index = 0 to 255
    level.itemRegistered[index] = 0
  end for
  // BG_FindItemForWeapon returns these two descriptors in the pinned table.
  register(level,10); register(level,8); return void
end function
function itemInitializationPrint(level,text)
  if level.gamePrintFn == void then return error(497,"Item initialization requires game diagnostic delivery") end if
  level.gamePrintFn(level,text); return void
end function
function saveRegistered(level)
  count = 0; bits = bytes(len(tables.items()),48)
  for index = 0 to len(tables.items())-1
    if level.itemRegistered[index] != 0 then bits[index] = 49; count = count+1 end if
  end for
  itemInitializationPrint(level,str(count)+" items registered\n")
  if level.spawner == void then return error(497,"Item registration requires game configstrings") end if
  return values.setConfig(level.spawner,27,decode(bits))
end function
function initTeamGame(level)
  level.lastFlagCapture = 0.0; level.lastCaptureTeam = 0
  level.redFlagStatus = 0; level.blueFlagStatus = 0; level.neutralFlagStatus = 0
  level.redTakenTime = 0; level.blueTakenTime = 0
  level.redObeliskAttackedTime = 0; level.blueObeliskAttackedTime = 0
  if level.spawner == void then return error(497,"Team initialization requires game spawn state") end if
  if level.spawner.gametype == 4 then
    level.redFlagStatus = -1; level.blueFlagStatus = -1
    // Native Team_SetFlagStatus(RED,ATBASE) reads ctfFlagStatusRemap[-1]
    // for blue. Keep its state transition and first publication, defining the
    // otherwise undefined second byte as NUL. The next publication is "00".
    level.redFlagStatus = 0; values.setConfig(level.spawner,23,"0")
    setFlagStatus(level,c.TEAM_BLUE,FLAG_ATBASE)
  end if
  return void
end function
function checkTeamItems(level)
  initTeamGame(level)
  if level.spawner.gametype == 4 then
    if level.itemRegistered[34] == 0 then itemInitializationPrint(level,"^3WARNING: No team_CTF_redflag in map") end if
    if level.itemRegistered[35] == 0 then itemInitializationPrint(level,"^3WARNING: No team_CTF_blueflag in map") end if
  end if
  return void
end function
function predictableEvent(level,ent,event,parm)
  state = ent.client.ps; slot = state.eventSequence & 1
  state.events[slot] = event; state.eventParms[slot] = parm; state.eventSequence = n.add32(state.eventSequence,1)
  return void
end function
function canGrab(gametype,ent,state)
  item = requireItem(ent.s.modelindex); type = itemType(item); tag = itemTag(item)
  if type == c.IT_WEAPON then return true end if
  if type == c.IT_AMMO then return state.ammo[tag] < 200 end if
  if type == c.IT_ARMOR then return state.stats[c.STAT_ARMOR] < n.mul32(state.stats[c.STAT_MAX_HEALTH],2) end if
  if type == c.IT_HEALTH then
    if itemQuantity(item) == 5 or itemQuantity(item) == 100 then return state.stats[c.STAT_HEALTH] < n.mul32(state.stats[c.STAT_MAX_HEALTH],2) end if
    return state.stats[c.STAT_HEALTH] < state.stats[c.STAT_MAX_HEALTH]
  end if
  if type == c.IT_POWERUP then return true end if
  if type == c.IT_TEAM then
    if gametype != 4 then return false end if
    if state.persistant[c.PERS_TEAM] == c.TEAM_RED then
      return tag == c.PW_BLUEFLAG or (tag == c.PW_REDFLAG and ent.s.modelindex2 != 0) or (tag == c.PW_REDFLAG and state.powerups[c.PW_BLUEFLAG] != 0)
    end if
    if state.persistant[c.PERS_TEAM] == c.TEAM_BLUE then
      return tag == c.PW_REDFLAG or (tag == c.PW_BLUEFLAG and ent.s.modelindex2 != 0) or (tag == c.PW_BLUEFLAG and state.powerups[c.PW_REDFLAG] != 0)
    end if
    return false
  end if
  if type == c.IT_HOLDABLE then return state.stats[c.STAT_HOLDABLE_ITEM] == 0 end if
  if type == c.IT_BAD then return error(497,"BG_CanItemBeGrabbed: IT_BAD") end if
  return false
end function
function pickupPowerup(level,ent,other)
  state = other.client.ps; tag = itemTag(ent.item)
  if state.powerups[tag] == 0 then state.powerups[tag] = n.add32(level.time,0-(level.time % 1000)) end if
  quantity = itemQuantity(ent.item); if ent.count != 0 then quantity = ent.count end if
  state.powerups[tag] = n.add32(state.powerups[tag],n.mul32(quantity,1000))
  for i = 0 to level.maxclients-1
    client = level.clients[i]
    if client == other.client or client.connected == 0 or client.ps.stats[c.STAT_HEALTH] <= 0 then continue end if
    if level.spawner.gametype >= 3 and other.client.team == client.team then continue end if
    delta = [n.fsub(ent.s.pos.trBase[0],client.ps.origin[0]),n.fsub(ent.s.pos.trBase[1],client.ps.origin[1]),n.fsub(ent.s.pos.trBase[2],client.ps.origin[2])]
    length = q.VectorNormalize(delta)
    if length > 192 then continue end if
    if q.DotProduct(delta,q.AngleVectors(client.ps.viewangles)[0]) < 0.4 then continue end if
    hit = combat.shotTrace(level,client.ps.origin,ent.s.pos.trBase,void,void,1023,1)
    if hit.trace.fraction != 1.0 then continue end if
    client.ps.persistant[c.PERS_PLAYEREVENTS] = client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 1
  end for
  return 120
end function
function pickupHoldable(level,ent,other)
  other.client.ps.stats[c.STAT_HOLDABLE_ITEM] = ent.item; return 60
end function
function addAmmo(ent,weapon,count)
  ent.client.ps.ammo[weapon] = n.add32(ent.client.ps.ammo[weapon],count)
  if ent.client.ps.ammo[weapon] > 200 then ent.client.ps.ammo[weapon] = 200 end if
  return void
end function
function pickupAmmo(level,ent,other)
  quantity = itemQuantity(ent.item); if ent.count != 0 then quantity = ent.count end if
  addAmmo(other,itemTag(ent.item),quantity); return 40
end function
function pickupWeapon(level,ent,other)
  tag = itemTag(ent.item); quantity = 0
  if ent.count >= 0 then
    quantity = itemQuantity(ent.item); if ent.count != 0 then quantity = ent.count end if
    if (ent.flags & FL_DROPPED_ITEM) == 0 and level.spawner.gametype != 3 then
      if other.client.ps.ammo[tag] < quantity then quantity = quantity-other.client.ps.ammo[tag] else quantity = 1 end if
    end if
  end if
  other.client.ps.stats[c.STAT_WEAPONS] = other.client.ps.stats[c.STAT_WEAPONS] | (1 << tag)
  addAmmo(other,tag,quantity)
  if tag == c.WP_GRAPPLING_HOOK then other.client.ps.ammo[tag] = -1 end if
  if level.spawner.gametype == 3 then return level.weaponTeamRespawn end if
  return level.weaponRespawn
end function
function pickupHealth(level,ent,other)
  quantity = itemQuantity(ent.item); max = other.client.ps.stats[c.STAT_MAX_HEALTH]
  if quantity == 5 or quantity == 100 then max = n.mul32(max,2) end if
  if ent.count != 0 then quantity = ent.count end if
  other.health = n.add32(other.health,quantity); if other.health > max then other.health = max end if
  other.client.ps.stats[c.STAT_HEALTH] = other.health
  if itemQuantity(ent.item) == 100 then return 35 end if
  return 35
end function
function pickupArmor(level,ent,other)
  value = n.add32(other.client.ps.stats[c.STAT_ARMOR],itemQuantity(ent.item)); max = n.mul32(other.client.ps.stats[c.STAT_MAX_HEALTH],2)
  if value > max then value = max end if
  other.client.ps.stats[c.STAT_ARMOR] = value; return 25
end function
function teamMessage(level,recipient,text)
  if level.teamMessageFn == void then return error(497,"Team item requires a PrintMsg sink") end if
  level.teamMessageFn(level,recipient,text); return void
end function
function addTeamScore(level,origin,team,score)
  if team != c.TEAM_RED and team != c.TEAM_BLUE then return error(497,"Invalid CTF score team") end if
  temp = game.tempEntity(level,origin,c.EV_GLOBAL_TEAM_SOUND); temp.r.svFlags = temp.r.svFlags | 32
  if team == c.TEAM_RED then
    if n.add32(level.teamScores[c.TEAM_RED],score) == level.teamScores[c.TEAM_BLUE] then temp.s.eventParm = c.GTS_TEAMS_ARE_TIED
    else if level.teamScores[c.TEAM_RED] <= level.teamScores[c.TEAM_BLUE] and n.add32(level.teamScores[c.TEAM_RED],score) > level.teamScores[c.TEAM_BLUE] then temp.s.eventParm = c.GTS_REDTEAM_TOOK_LEAD
    else temp.s.eventParm = c.GTS_REDTEAM_SCORED end if
  else
    if n.add32(level.teamScores[c.TEAM_BLUE],score) == level.teamScores[c.TEAM_RED] then temp.s.eventParm = c.GTS_TEAMS_ARE_TIED
    else if level.teamScores[c.TEAM_BLUE] <= level.teamScores[c.TEAM_RED] and n.add32(level.teamScores[c.TEAM_BLUE],score) > level.teamScores[c.TEAM_RED] then temp.s.eventParm = c.GTS_BLUETEAM_TOOK_LEAD
    else temp.s.eventParm = c.GTS_BLUETEAM_SCORED end if
  end if
  level.teamScores[team] = n.add32(level.teamScores[team],score); return void
end function
function forceGesture(level,team)
  for i = 0 to 63
    ent = level.entities[i]
    if ent.inuse and ent.client != void and ent.client.team == team then ent.flags = ent.flags | FL_FORCE_GESTURE end if
  end for
  return void
end function
function takeFlagSound(level,ent,team)
  if ent == void then return void end if
  if team == c.TEAM_RED then
    if level.blueFlagStatus != FLAG_ATBASE and level.blueTakenTime > n.add32(level.time,-10000) then return void end if
    level.blueTakenTime = level.time
  else if team == c.TEAM_BLUE then
    if level.redFlagStatus != FLAG_ATBASE and level.redTakenTime > n.add32(level.time,-10000) then return void end if
    level.redTakenTime = level.time
  end if
  temp = game.tempEntity(level,ent.s.pos.trBase,c.EV_GLOBAL_TEAM_SOUND)
  if team == c.TEAM_BLUE then temp.s.eventParm = c.GTS_RED_TAKEN else temp.s.eventParm = c.GTS_BLUE_TAKEN end if
  temp.r.svFlags = temp.r.svFlags | 32; return void
end function
function captureFlagSound(level,ent,team)
  if ent == void then return void end if
  temp = game.tempEntity(level,ent.s.pos.trBase,c.EV_GLOBAL_TEAM_SOUND)
  if team == c.TEAM_BLUE then temp.s.eventParm = c.GTS_BLUE_CAPTURE else temp.s.eventParm = c.GTS_RED_CAPTURE end if
  temp.r.svFlags = temp.r.svFlags | 32; return void
end function
function resetFlags(level)
  if level.spawner.gametype == 4 then resetFlag(level,c.TEAM_RED); resetFlag(level,c.TEAM_BLUE) end if
  return void
end function
function touchOurFlag(level,ent,other,team)
  client = other.client; enemyFlag = c.PW_REDFLAG
  if client.team == c.TEAM_RED then enemyFlag = c.PW_BLUEFLAG end if
  if (ent.flags & FL_DROPPED_ITEM) != 0 then
    teamMessage(level,-1,client.netname+"^7 returned the "+bonuses.teamName(team)+" flag!\n")
    scores.addScore(level,other,ent.r.currentOrigin,1); client.flagrecovery = n.add32(client.flagrecovery,1); client.lastreturnedflag = n.f32(level.time)
    returnFlagSound(level,resetFlag(level,team),team); return 0
  end if
  if client.ps.powerups[enemyFlag] == 0 then return 0 end if
  teamMessage(level,-1,client.netname+"^7 captured the "+bonuses.teamName(bonuses.otherTeam(team))+" flag!\n")
  client.ps.powerups[enemyFlag] = 0; level.lastFlagCapture = n.f32(level.time); level.lastCaptureTeam = team
  addTeamScore(level,ent.s.pos.trBase,client.team,1); forceGesture(level,client.team)
  client.captures = n.add32(client.captures,1); client.ps.eFlags = (client.ps.eFlags & ~AWARD_MASK) | 0x800
  client.rewardTime = n.add32(level.time,2000); client.ps.persistant[c.PERS_CAPTURES] = n.add32(client.ps.persistant[c.PERS_CAPTURES],1)
  scores.addScore(level,other,ent.r.currentOrigin,5); captureFlagSound(level,ent,team)
  for i = 0 to level.maxclients-1
    player = level.entities[i]
    if not player.inuse then continue end if
    if player.client == void then return error(497,"Active CTF client slot has no client") end if
    if player.client.team != client.team then player.client.lasthurtcarrier = -5.0
    else
      if player != other then scores.addScore(level,player,ent.r.currentOrigin,0) end if
      assistScore = 0
      if n.fadd(player.client.lastreturnedflag,10000.0) > n.f32(level.time) then assistScore = 1
      else if n.fadd(player.client.lastfraggedcarrier,10000.0) > n.f32(level.time) then assistScore = 2 end if
      if assistScore != 0 then
        scores.addScore(level,player,ent.r.currentOrigin,assistScore); client.assists = n.add32(client.assists,1)
        player.client.ps.persistant[c.PERS_ASSIST_COUNT] = n.add32(player.client.ps.persistant[c.PERS_ASSIST_COUNT],1)
        player.client.ps.eFlags = (player.client.ps.eFlags & ~AWARD_MASK) | 0x20000; player.client.rewardTime = n.add32(level.time,2000)
      end if
    end if
  end for
  resetFlags(level); scores.calculateRanks(level); return 0
end function
function touchEnemyFlag(level,ent,other,team)
  client = other.client
  teamMessage(level,-1,client.netname+"^7 got the "+bonuses.teamName(team)+" flag!\n")
  if team == c.TEAM_RED then client.ps.powerups[c.PW_REDFLAG] = 2147483647 else client.ps.powerups[c.PW_BLUEFLAG] = 2147483647 end if
  setFlagStatus(level,team,FLAG_TAKEN); scores.addScore(level,other,ent.r.currentOrigin,0); client.flagsince = n.f32(level.time); takeFlagSound(level,ent,team)
  return -1
end function
function pickupTeam(level,ent,other)
  team = 0
  if ent.classname == "team_CTF_redflag" then team = c.TEAM_RED
  else if ent.classname == "team_CTF_blueflag" then team = c.TEAM_BLUE
  else teamMessage(level,other.slot,"Don't know what team the flag is on.\n"); return 0 end if
  if team == other.client.team then return touchOurFlag(level,ent,other,team) end if
  return touchEnemyFlag(level,ent,other,team)
end function
function touch(level,ent,other,trace)
  if other.client == void or other.health < 1 then return void end if
  if not canGrab(level.spawner.gametype,ent,other.client.ps) then return void end if
  if level.gameLogFn == void then return error(497,"Touch_Item requires a game log sink") end if
  level.gameLogFn(level,"Item: "+str(other.s.number)+" "+itemName(ent.item)+"\n")
  predict = other.client.predictItemPickup; type = itemType(ent.item); respawnTime = 0
  if type == c.IT_WEAPON then respawnTime = pickupWeapon(level,ent,other)
  else if type == c.IT_AMMO then respawnTime = pickupAmmo(level,ent,other)
  else if type == c.IT_ARMOR then respawnTime = pickupArmor(level,ent,other)
  else if type == c.IT_HEALTH then respawnTime = pickupHealth(level,ent,other)
  else if type == c.IT_POWERUP then respawnTime = pickupPowerup(level,ent,other); predict = false
  else if type == c.IT_TEAM then respawnTime = pickupTeam(level,ent,other)
  else if type == c.IT_HOLDABLE then respawnTime = pickupHoldable(level,ent,other)
  else return void end if
  if respawnTime == 0 then return void end if
  if predict then predictableEvent(level,other,c.EV_ITEM_PICKUP,ent.s.modelindex) else events.add(level,other,c.EV_ITEM_PICKUP,ent.s.modelindex) end if
  if type == c.IT_POWERUP or type == c.IT_TEAM then
    temp = game.tempEntity(level,ent.s.pos.trBase,c.EV_GLOBAL_ITEM_PICKUP); temp.s.eventParm = ent.s.modelindex
    if ent.speed == 0 then temp.r.svFlags = temp.r.svFlags | 32 else temp.r.svFlags = temp.r.svFlags | 256; temp.r.singleClient = other.s.number end if
  end if
  targets.useTargets(level,ent,other)
  if ent.wait == -1 then
    ent.r.svFlags = ent.r.svFlags | 1; ent.s.eFlags = ent.s.eFlags | 0x80; ent.r.contents = 0; ent.unlinkAfterEvent = true; return void
  end if
  if ent.wait != 0 then respawnTime = n.trunc32(ent.wait) end if
  if ent.random != 0 then
    respawnTime = textnum.truncDouble32(respawnTime+centeredRandom(level)*ent.random); if respawnTime < 1 then respawnTime = 1 end if
  end if
  if (ent.flags & FL_DROPPED_ITEM) != 0 then ent.freeAfterEvent = true end if
  ent.r.svFlags = ent.r.svFlags | 1; ent.s.eFlags = ent.s.eFlags | 0x80; ent.r.contents = 0
  if respawnTime <= 0 then ent.nextthink = 0; ent.think = void else ent.nextthink = n.add32(level.time,n.mul32(respawnTime,1000)); ent.think = respawn end if
  return game.link(level,ent)
end function
function setFlagStatus(level,team,status)
  if status < 0 or status > 4 then return error(497,"Invalid flag status") end if
  modified = false
  if team == c.TEAM_RED then
    if level.redFlagStatus != status then level.redFlagStatus = status; modified = true end if
  else if team == c.TEAM_BLUE then
    if level.blueFlagStatus != status then level.blueFlagStatus = status; modified = true end if
  else if team == c.TEAM_FREE then
    if level.neutralFlagStatus != status then level.neutralFlagStatus = status; modified = true end if
  end if
  if not modified then return void end if
  if level.spawner == void then return error(497,"Flag status requires game configstrings") end if
  if level.spawner.gametype == 4 then
    remap = [48,49,42,42,50]
    values.setConfig(level.spawner,23,decode(bytes([remap[level.redFlagStatus],remap[level.blueFlagStatus]])))
  else
    remap = [48,49,50,51,52]
    values.setConfig(level.spawner,23,decode(bytes([remap[level.neutralFlagStatus]])))
  end if
  return void
end function
function checkDropped(level,dropped)
  tag = itemTag(dropped.item)
  if tag == c.PW_REDFLAG then setFlagStatus(level,c.TEAM_RED,FLAG_DROPPED)
  else if tag == c.PW_BLUEFLAG then setFlagStatus(level,c.TEAM_BLUE,FLAG_DROPPED)
  else if tag == c.PW_NEUTRALFLAG then setFlagStatus(level,c.TEAM_FREE,FLAG_DROPPED) end if
  return void
end function
function respawn(level,ent)
  requireItem(ent.item)
  if ent.team != void then
    if ent.teammaster == void then return error(497,"RespawnItem: bad teammaster") end if
    chain = []; current = ent.teammaster
    while current != void
      chain = chain+[current]
      if len(chain) > 1024 then return error(497,"Invalid item team chain") end if
      current = current.teamchain
    end while
    if len(chain) == 0 then return error(497,"Empty item team chain") end if
    ent = chain[game.random(level) % len(chain)]
    requireItem(ent.item)
  end if
  ent.r.contents = 0x40000000; ent.s.eFlags = ent.s.eFlags & ~0x80; ent.r.svFlags = ent.r.svFlags & ~1
  game.link(level,ent)
  if itemType(ent.item) == c.IT_POWERUP then
    event = c.EV_GLOBAL_SOUND
    if ent.speed != 0 then event = c.EV_GENERAL_SOUND end if
    temp = game.tempEntity(level,ent.s.pos.trBase,event)
    temp.s.eventParm = values.soundIndex(level.spawner,"sound/items/poweruprespawn.wav"); temp.r.svFlags = temp.r.svFlags | 32
  end if
  events.add(level,ent,c.EV_ITEM_RESPAWN,0); ent.nextthink = 0
  return void
end function
function use(level,ent,other,activator)
  return respawn(level,ent)
end function
function finishSpawning(level,ent)
  item = requireItem(ent.item)
  ent.r.mins = [-15.0,-15.0,-15.0]; ent.r.maxs = [15.0,15.0,15.0]
  ent.s.eType = c.ET_ITEM; ent.s.modelindex = item; ent.s.modelindex2 = 0
  ent.r.contents = 0x40000000; ent.touch = touch; ent.use = use
  if (ent.spawnflags & 1) != 0 then game.setOrigin(ent,ent.s.origin)
  else
    destination = [ent.s.origin[0],ent.s.origin[1],n.fsub(ent.s.origin[2],4096.0)]
    hit = combat.shotTrace(level,ent.s.origin,destination,ent.r.mins,ent.r.maxs,ent.s.number,1)
    if hit.trace.startsolid then
      location = game.vtos(level,ent.s.origin)
      if level.gamePrintFn != void then
        name = ent.classname
        if name == void then name = "(null)" end if
        level.gamePrintFn(level,"FinishSpawningItem: "+name+" startsolid at "+location+"\n")
      end if
      game.free(level,ent); return void
    end if
    ent.s.groundEntityNum = hit.entityNum; game.setOrigin(ent,hit.endpos)
  end if
  if (ent.flags & 0x400) != 0 or ent.targetname != void then
    ent.s.eFlags = ent.s.eFlags | 0x80; ent.r.contents = 0; return void
  end if
  if itemType(item) == c.IT_POWERUP then
    respawnTime = 45.0+centeredRandom(level)*15.0
    ent.s.eFlags = ent.s.eFlags | 0x80; ent.r.contents = 0
    ent.nextthink = textnum.truncDouble32(level.time+respawnTime*1000.0); ent.think = respawn
    return void
  end if
  return game.link(level,ent)
end function
function spawnItem(level,ent,item)
  item = requireItem(item)
  ent.random = values.getFloat(level.spawner,"random","0")[1]; ent.wait = values.getFloat(level.spawner,"wait","0")[1]
  register(level,item)
  disabled = cv.find(level.spawner.cvars,"disable_"+itemName(item))
  if disabled != void and disabled.integer != 0 then return void end if
  ent.item = item; ent.nextthink = n.add32(level.time,200); ent.think = finishSpawning; ent.physicsBounce = 0.5
  if itemType(item) == c.IT_POWERUP then
    values.soundIndex(level.spawner,"sound/items/poweruprespawn.wav")
    ent.speed = values.getFloat(level.spawner,"noglobalsound","0")[1]
  end if
  return void
end function
function findClass(level,after,name)
  index = 0
  if after != void then index = after.slot+1 end if
  while index < level.num_entities
    ent = level.entities[index]; index = index+1
    if ent.inuse and ent.classname != void and strings.equalsIgnoreCaseAscii(ent.classname,name) then return ent end if
  end while
  return void
end function
function resetFlag(level,team)
  name = void
  if team == c.TEAM_RED then name = "team_CTF_redflag"
  else if team == c.TEAM_BLUE then name = "team_CTF_blueflag"
  else if team == c.TEAM_FREE then name = "team_CTF_neutralflag"
  else return void end if
  rent = void; ent = void
  while true
    ent = findClass(level,ent,name)
    if ent == void then break end if
    if (ent.flags & FL_DROPPED_ITEM) != 0 then game.free(level,ent)
    else rent = ent; respawn(level,ent) end if
  end while
  setFlagStatus(level,team,FLAG_ATBASE)
  return rent
end function
function returnFlagSound(level,ent,team)
  if ent == void then
    if level.gamePrintFn != void then level.gamePrintFn(level,"Warning:  NULL passed to Team_ReturnFlagSound\n") end if
    return void
  end if
  temp = game.tempEntity(level,ent.s.pos.trBase,c.EV_GLOBAL_TEAM_SOUND)
  if team == c.TEAM_BLUE then temp.s.eventParm = c.GTS_RED_RETURN else temp.s.eventParm = c.GTS_BLUE_RETURN end if
  temp.r.svFlags = temp.r.svFlags | 32
  return void
end function
function returnFlag(level,team)
  returnFlagSound(level,resetFlag(level,team),team)
  if level.teamMessageFn == void then return error(497,"Team_ReturnFlag requires a PrintMsg sink") end if
  if team == c.TEAM_FREE then level.teamMessageFn(level,-1,"The flag has returned!\n")
  else level.teamMessageFn(level,-1,"The "+bonuses.teamName(team)+" flag has returned!\n") end if
  return void
end function
function teamFree(level,ent)
  tag = itemTag(ent.item)
  if tag == c.PW_REDFLAG then returnFlag(level,c.TEAM_RED)
  else if tag == c.PW_BLUEFLAG then returnFlag(level,c.TEAM_BLUE)
  else if tag == c.PW_NEUTRALFLAG then returnFlag(level,c.TEAM_FREE) end if
  return void
end function
function droppedFlagThink(level,ent)
  team = c.TEAM_FREE; tag = itemTag(ent.item)
  if tag == c.PW_REDFLAG then team = c.TEAM_RED
  else if tag == c.PW_BLUEFLAG then team = c.TEAM_BLUE end if
  return returnFlagSound(level,resetFlag(level,team),team)
end function
function launch(level,item,origin,velocity)
  item = requireItem(item); dropped = game.spawn(level)
  dropped.s.eType = c.ET_ITEM; dropped.s.modelindex = item; dropped.s.modelindex2 = 1
  dropped.classname = itemName(item); dropped.item = item
  dropped.r.mins = [-15.0,-15.0,-15.0]; dropped.r.maxs = [15.0,15.0,15.0]; dropped.r.contents = 0x40000000
  dropped.touch = touch; game.setOrigin(dropped,origin); dropped.s.pos.trType = c.TR_GRAVITY; dropped.s.pos.trTime = level.time
  dropped.s.pos.trDelta = movement.copy(velocity); dropped.s.eFlags = dropped.s.eFlags | 0x20
  if level.spawner != void and level.spawner.gametype == 4 and itemType(item) == c.IT_TEAM then
    dropped.think = droppedFlagThink; dropped.nextthink = n.add32(level.time,30000); checkDropped(level,dropped)
  else
    dropped.think = game.free; dropped.nextthink = n.add32(level.time,30000)
  end if
  dropped.flags = FL_DROPPED_ITEM; game.link(level,dropped)
  return dropped
end function
function drop(level,ent,item,angle)
  angles = movement.copy(ent.s.apos.trBase); angles[1] = n.fadd(angles[1],angle); angles[0] = 0.0
  velocity = q.AngleVectors(angles)[0]; velocity = q.VectorScale(velocity,150.0)
  velocity[2] = n.f32(velocity[2]+200.0+centeredRandom(level)*50.0)
  return launch(level,item,ent.s.pos.trBase,velocity)
end function
function bounce(level,ent,hit)
  tr = hit.trace
  hitTime = n.trunc32(n.fadd(level.previousTime,n.fmul(n.i32(level.time-level.previousTime),tr.fraction)))
  velocity = trajectory.evaluateDelta(ent.s.pos,hitTime); dot = q.DotProduct(velocity,tr.normal)
  ent.s.pos.trDelta = q.VectorMA(velocity,n.fmul(-2,dot),tr.normal)
  for axis = 0 to 2
    ent.s.pos.trDelta[axis] = n.fmul(ent.s.pos.trDelta[axis],ent.physicsBounce)
  end for
  if tr.normal[2] > 0 and ent.s.pos.trDelta[2] < 40 then
    hit.endpos[2] = n.fadd(hit.endpos[2],1.0); snapshot.snapVector(hit.endpos); game.setOrigin(ent,hit.endpos)
    ent.s.groundEntityNum = hit.entityNum; return void
  end if
  for axis = 0 to 2
    ent.r.currentOrigin[axis] = n.fadd(ent.r.currentOrigin[axis],tr.normal[axis])
  end for
  ent.s.pos.trBase = movement.copy(ent.r.currentOrigin); ent.s.pos.trTime = level.time
  return void
end function
function run(level,ent)
  if ent.item != void then requireItem(ent.item)
  else if not ent.physicsObject then return error(497,"G_RunItem requires an item or physics object") end if
  if ent.s.groundEntityNum == -1 and ent.s.pos.trType != c.TR_GRAVITY then ent.s.pos.trType = c.TR_GRAVITY; ent.s.pos.trTime = level.time end if
  if ent.s.pos.trType == c.TR_STATIONARY then return game.runThink(level,ent) end if
  origin = trajectory.evaluate(ent.s.pos,level.time); mask = ent.clipmask
  if mask == 0 then mask = 0x10001 end if
  hit = combat.shotTrace(level,ent.r.currentOrigin,origin,ent.r.mins,ent.r.maxs,ent.r.ownerNum,mask)
  ent.r.currentOrigin = movement.copy(hit.endpos)
  if hit.trace.startsolid then hit.trace.fraction = 0.0 end if
  game.link(level,ent); game.runThink(level,ent)
  if hit.trace.fraction == 1 then return void end if
  if (sv.pointContents(level.scene,ent.r.currentOrigin,-1) & 0x80000000) != 0 then
    if ent.item != void and itemType(ent.item) == c.IT_TEAM then return teamFree(level,ent) end if
    return game.free(level,ent)
  end if
  return bounce(level,ent,hit)
end function
