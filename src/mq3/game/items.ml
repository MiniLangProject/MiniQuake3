// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 item entities, pickups, physics and CTF flag rules.
package mq3.game.items
import mq3.game.constants as c
import mq3.game.entities as game
import mq3.game.events as events
import mq3.game.movement as movement
import mq3.game.trajectory as trajectory
import mq3.game.combat as itemCombat
import mq3.game.spawn_tables as tables
import mq3.game.spawn_values as values
import mq3.game.snapshot as snapshot
import mq3.game.team_bonuses as bonuses
import mq3.game.scores as scores
import mq3.game.targets as targets
import mq3.game.g_utils as gUtils
import mq3.server.world as sv
import mq3.shared.math as q
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import mq3.qcommon.cvar as cv
import std.string as strings
import mq3.shared.info as infoStrings

const FL_DROPPED_ITEM = 0x1000
const FL_FORCE_GESTURE = 0x8000
const FLAG_ATBASE = 0
const FLAG_TAKEN = 1
const FLAG_DROPPED = 4
const AWARD_MASK = 0x38848

/// Test `typeof(index) == "int" and index > 0 and index < len(tables.items())` as the condition for `validItem`.
/// @param index Index of the entry to access.
function validItem(index)
  return typeof(index) == "int" and index > 0 and index < len(tables.items())
end function
/// Apply `mq3.game.items.validItem` while evaluating `requireItem`. Return paths include `index`.
/// @param index Index of the entry to access.
function requireItem(index)
  if not validItem(index) then return error(497,"Invalid baseq3 item") end if
  return index
end function
/// Return `tables.items()[requireItem(index)]` for `itemName`.
/// @param index Index of the entry to access.
function itemName(index)
  return tables.items()[requireItem(index)]
end function
/// Apply `mq3.game.items.requireItem` and `mq3.game.constants.itemType` while evaluating `itemType`. Return paths include `c.itemType(index)`.
/// @param index Index of the entry to access.
function itemType(index)
  requireItem(index); return c.itemType(index)
end function
/// Apply `mq3.game.items.requireItem` and `mq3.game.constants.itemTag` while evaluating `itemTag`. Return paths include `c.itemTag(index)`.
/// @param index Index of the entry to access.
function itemTag(index)
  requireItem(index); return c.itemTag(index)
end function
/// Apply `mq3.game.items.requireItem` and `mq3.game.constants.itemQuantity` while evaluating `itemQuantity`. Return paths include `c.itemQuantity(index)`.
/// @param index Index of the entry to access.
function itemQuantity(index)
  requireItem(index); return c.itemQuantity(index)
end function
/// Test `level != void and level.spawner != void and level.spawner.missionpack` as the condition for `missionpack`.
/// @param level Game-level state; accesses `spawner`.
function missionpack(level)
  return level != void and level.spawner != void and level.spawner.missionpack
end function
/// Apply `mq3.game.spawn_tables.items`, `mq3.game.items.missionpack` and `mq3.game.spawn_tables.missionpackItems` while evaluating `requireModeItem`. Return paths include `index`.
/// @param level Game-level state; accesses `spawner`.
/// @param index Index of the entry to access.
function requireModeItem(level,index)
  limit = len(tables.items()); if missionpack(level) then limit = len(tables.missionpackItems()) end if
  if typeof(index) != "int" or index <= 0 or index >= limit then return error(497,"Invalid game item") end if
  return index
end function
/// Apply `mq3.game.items.requireModeItem`, `mq3.game.items.missionpack` and `mq3.game.spawn_tables.missionpackItems` while evaluating `modeItemName`. Return paths include `tables.items()[index]`.
/// @param level Game-level state; accesses `spawner`.
/// @param index Index of the entry to access.
function modeItemName(level,index)
  requireModeItem(level,index); if missionpack(level) then return tables.missionpackItems()[index] end if; return tables.items()[index]
end function
/// Apply `mq3.game.items.requireModeItem`, `mq3.game.items.missionpack` and `mq3.game.constants.missionpackItemType` while evaluating `modeItemType`. Return paths include `c.itemType(index)`.
/// @param level Game-level state; accesses `spawner`.
/// @param index Index of the entry to access.
function modeItemType(level,index)
  requireModeItem(level,index); if missionpack(level) then return c.missionpackItemType(index) end if; return c.itemType(index)
end function
/// Apply `mq3.game.items.requireModeItem`, `mq3.game.items.missionpack` and `mq3.game.constants.missionpackItemTag` while evaluating `modeItemTag`. Return paths include `c.itemTag(index)`.
/// @param level Game-level state; accesses `spawner`.
/// @param index Index of the entry to access.
function modeItemTag(level,index)
  requireModeItem(level,index); if missionpack(level) then return c.missionpackItemTag(index) end if; return c.itemTag(index)
end function
/// Apply `mq3.game.items.requireModeItem`, `mq3.game.items.missionpack` and `mq3.game.constants.missionpackItemQuantity` while evaluating `modeItemQuantity`. Return paths include `c.itemQuantity(index)`.
/// @param level Game-level state; accesses `spawner`.
/// @param index Index of the entry to access.
function modeItemQuantity(level,index)
  requireModeItem(level,index); if missionpack(level) then return c.missionpackItemQuantity(index) end if; return c.itemQuantity(index)
end function
/// Return `2.0*(n.fdiv(game.random(level),32767)-0.5)` for `centeredRandom`.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
function centeredRandom(level)
  // random() divides as float; crandom() then promotes its operands to double.
  return 2.0*(n.fdiv(game.random(level),32767)-0.5)
end function
/// Set `level.itemRegistered[item]` to `1` in `mq3.game.items.register`.
/// @param level Game-level state; accesses `itemRegistered`. May update `level.itemRegistered[item]` in place.
/// @param item Value passed as argument 1 to `typeof`.
function register(level,item)
  // Frozen MiniLang compares integer zero equal to void; inspect its type
  // first so the valid bg_itemlist[0] pointer is not mistaken for NULL.
  if typeof(item) != "int" then
    if item == void then return error(497,"RegisterItem: NULL") end if
    return error(497,"RegisterItem requires an original item-array pointer")
  end if
  // RegisterItem only computes an array offset; unlike pickup/spawn it does
  // not dereference the item. Include the dummy and terminating descriptors.
  limit = len(tables.items()); if missionpack(level) then limit = len(tables.missionpackItems()) end if
  if item < 0 or item > limit then return error(497,"RegisterItem requires an original item-array pointer") end if
  level.itemRegistered[item] = 1; return void
end function
/// Set `level.itemRegistered[index]` to `0` in `mq3.game.items.clearRegistered`.
/// @param level Game-level state; accesses `itemRegistered` and `spawner`. May update `level.itemRegistered[index]` in place.
function clearRegistered(level)
  for index = 0 to 255
    level.itemRegistered[index] = 0
  end for
  // BG_FindItemForWeapon returns these two descriptors in the pinned table.
  register(level,10); register(level,8)
  if missionpack(level) and level.spawner.gametype == 7 then register(level,47); register(level,48) end if
  return void
end function
/// Use `level.gamePrintFn` to perform `itemInitializationPrint`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param text Text to parse, format or deliver.
function itemInitializationPrint(level,text)
  if level.gamePrintFn == void then return error(497,"Item initialization requires game diagnostic delivery") end if
  level.gamePrintFn(level,text); return void
end function
/// Apply `mq3.game.spawn_tables.items`, `mq3.game.items.missionpack` and `mq3.game.spawn_tables.missionpackItems` while evaluating `saveRegistered`. Return paths include `values.setConfig(level.spawner,27,decode(bits))`.
/// @param level Game-level state; accesses `itemRegistered` and `spawner`.
function saveRegistered(level)
  limit = len(tables.items()); if missionpack(level) then limit = len(tables.missionpackItems()) end if
  count = 0; bits = bytes(limit,48)
  for index = 0 to limit-1
    if level.itemRegistered[index] != 0 then bits[index] = 49; count = count+1 end if
  end for
  itemInitializationPrint(level,str(count)+" items registered\n")
  if level.spawner == void then return error(497,"Item registration requires game configstrings") end if
  return values.setConfig(level.spawner,27,decode(bits))
end function
/// Update `level.lastFlagCapture`, `level.lastCaptureTeam`, `level.redFlagStatus` and `level.blueFlagStatus` and related state during `initTeamGame`.
/// @param level Game-level state; accesses `lastFlagCapture`, `lastCaptureTeam`, `redFlagStatus`, `blueFlagStatus` and `neutralFlagStatus` and related fields. May update `level.lastFlagCapture`, `level.lastCaptureTeam` and `level.redFlagStatus` and additional fields in place.
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
/// Apply `mq3.game.items.initTeamGame`, `mq3.game.items.itemInitializationPrint` and `mq3.game.items.missionpack` while evaluating `checkTeamItems`.
/// @param level Game-level state; accesses `spawner` and `itemRegistered`.
function checkTeamItems(level)
  initTeamGame(level)
  if level.spawner.gametype == 4 then
    if level.itemRegistered[34] == 0 then itemInitializationPrint(level,"^3WARNING: No team_CTF_redflag in map") end if
    if level.itemRegistered[35] == 0 then itemInitializationPrint(level,"^3WARNING: No team_CTF_blueflag in map") end if
  end if
  if missionpack(level) and level.spawner.gametype == 5 then
    if level.itemRegistered[34] == 0 then itemInitializationPrint(level,"^3WARNING: No team_CTF_redflag in map") end if
    if level.itemRegistered[35] == 0 then itemInitializationPrint(level,"^3WARNING: No team_CTF_blueflag in map") end if
    if level.itemRegistered[46] == 0 then itemInitializationPrint(level,"^3WARNING: No team_CTF_neutralflag in map") end if
  end if
  if missionpack(level) and (level.spawner.gametype == 6 or level.spawner.gametype == 7) then
    if findClass(level,void,"team_redobelisk") == void then itemInitializationPrint(level,"^3WARNING: No team_redobelisk in map") end if
    if findClass(level,void,"team_blueobelisk") == void then itemInitializationPrint(level,"^3WARNING: No team_blueobelisk in map") end if
    if level.spawner.gametype == 7 and findClass(level,void,"team_neutralobelisk") == void then itemInitializationPrint(level,"^3WARNING: No team_neutralobelisk in map") end if
  end if
  return void
end function
/// Append an item event and parameter to the two-slot player-state event ring.
/// @param level Not read by this implementation; retained in the `predictableEvent` signature.
/// @param ent Game entity; accesses `client`.
/// @param event Player or entity event identifier.
/// @param parm Integer parameter stored alongside the emitted event.
function predictableEvent(level,ent,event,parm)
  state = ent.client.ps; slot = state.eventSequence & 1
  state.events[slot] = event; state.eventParms[slot] = parm; state.eventSequence = n.add32(state.eventSequence,1)
  return void
end function
/// Apply `mq3.game.spawn_tables.items`, `mq3.game.constants.missionpackItemType` and `mq3.game.constants.missionpackItemTag` while evaluating `canGrab`.
/// @param gametype Value used by `canGrab` in `if gametype == 7 then return true end if`.
/// @param ent Game entity; accesses `s`.
/// @param state Items state; accesses `ammo`, `stats`, `persistant` and `powerups`.
function canGrab(gametype,ent,state)
  item = ent.s.modelindex; type = 0; tag = 0
  if item >= len(tables.items()) then type = c.missionpackItemType(item); tag = c.missionpackItemTag(item) else item = requireItem(item); type = itemType(item); tag = itemTag(item) end if
  if type == c.IT_WEAPON then return true end if
  if type == c.IT_AMMO then return state.ammo[tag] < 200 end if
  persistentTag = 0; if state.stats[7] >= 36 then persistentTag = c.missionpackItemTag(state.stats[7]) end if
  if type == c.IT_ARMOR then
    if persistentTag == c.PW_SCOUT then return false end if
    maximum = n.mul32(state.stats[c.STAT_MAX_HEALTH],2); if persistentTag == c.PW_GUARD then maximum = state.stats[c.STAT_MAX_HEALTH] end if
    return state.stats[c.STAT_ARMOR] < maximum
  end if
  if type == c.IT_HEALTH then
    if persistentTag == c.PW_GUARD then return state.stats[c.STAT_HEALTH] < state.stats[c.STAT_MAX_HEALTH] end if
    quantity = 0; if item >= len(tables.items()) then quantity = c.missionpackItemQuantity(item) else quantity = c.itemQuantity(item) end if
    if quantity == 5 or quantity == 100 then return state.stats[c.STAT_HEALTH] < n.mul32(state.stats[c.STAT_MAX_HEALTH],2) end if
    return state.stats[c.STAT_HEALTH] < state.stats[c.STAT_MAX_HEALTH]
  end if
  if type == c.IT_POWERUP then return true end if
  if type == c.IT_PERSISTANT_POWERUP then
    if state.stats[7] != 0 then return false end if
    if (ent.s.generic1 & 2) != 0 and state.persistant[c.PERS_TEAM] != c.TEAM_RED then return false end if
    if (ent.s.generic1 & 4) != 0 and state.persistant[c.PERS_TEAM] != c.TEAM_BLUE then return false end if
    return true
  end if
  if type == c.IT_TEAM then
    if gametype == 7 then return true end if
    if gametype == 5 then
      if tag == c.PW_NEUTRALFLAG then return true end if
      if state.persistant[c.PERS_TEAM] == c.TEAM_RED and tag == c.PW_BLUEFLAG and state.powerups[c.PW_NEUTRALFLAG] != 0 then return true end if
      if state.persistant[c.PERS_TEAM] == c.TEAM_BLUE and tag == c.PW_REDFLAG and state.powerups[c.PW_NEUTRALFLAG] != 0 then return true end if
    end if
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
/// Use `level.userinfoFn` to perform `userHandicap`. Return paths include `handicap`.
/// @param level Game-level state; accesses `userinfoFn`.
/// @param other Other record; accesses `s`.
function userHandicap(level,other)
  handicap = 100
  if level.userinfoFn != void then
    text = infoStrings.value(infoStrings.copy(level.userinfoFn(level,other.s.number),1024),"handicap")
    parsed = textnum.atoi(text); if parsed > 0 and parsed <= 100 then handicap = parsed end if
  end if
  return handicap
end function
/// Update `other.client.ps.stats[7]`, `other.client.persistantPowerup`, `other.health` and `other.client.ps.stats[c.STAT_HEALTH]` and related state during `pickupPersistantPowerup`. Return paths include `-1`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`.
/// @param other Other record; accesses `client` and `health`. May update `other.client.ps.stats[7]`, `other.client.persistantPowerup` and `other.health` and additional fields in place.
function pickupPersistantPowerup(level,ent,other)
  tag = modeItemTag(level,ent.item); handicap = userHandicap(level,other)
  // Baseq3 has no persistent-stat slot. The port keeps the Team Arena pointer
  // in unused base slot 7 while preserving every existing Baseq3 stat index.
  other.client.ps.stats[7] = ent.item; other.client.persistantPowerup = ent
  if tag == c.PW_GUARD then
    maximum = n.mul32(2,handicap); other.health = maximum; other.client.ps.stats[c.STAT_HEALTH] = maximum
    other.client.ps.stats[c.STAT_MAX_HEALTH] = maximum; other.client.ps.stats[c.STAT_ARMOR] = maximum; other.client.maxHealth = maximum
  else
    other.client.maxHealth = handicap
    if tag == c.PW_SCOUT then other.client.ps.stats[c.STAT_ARMOR] = 0 end if
    if tag == c.PW_AMMOREGEN then for index = 0 to 15 other.client.ammoTimes[index] = 0 end for end if
  end if
  return -1
end function
/// Apply `mq3.game.items.modeItemTag`, `mq3.game.items.modeItemQuantity` and `mq3.game.combat.shotTrace` while evaluating `pickupPowerup`. Return paths include `120`.
/// @param level Game-level state; accesses `time`, `maxclients`, `clients` and `spawner`.
/// @param ent Game entity; accesses `item`, `count` and `s`.
/// @param other Other record; accesses `client`.
function pickupPowerup(level,ent,other)
  state = other.client.ps; tag = modeItemTag(level,ent.item)
  if state.powerups[tag] == 0 then state.powerups[tag] = n.add32(level.time,0-(level.time % 1000)) end if
  quantity = modeItemQuantity(level,ent.item); if ent.count != 0 then quantity = ent.count end if
  state.powerups[tag] = n.add32(state.powerups[tag],n.mul32(quantity,1000))
  for i = 0 to level.maxclients-1
    client = level.clients[i]
    if client == other.client or client.connected == 0 or client.ps.stats[c.STAT_HEALTH] <= 0 then continue end if
    if level.spawner.gametype >= 3 and other.client.team == client.team then continue end if
    delta = [n.fsub(ent.s.pos.trBase[0],client.ps.origin[0]),n.fsub(ent.s.pos.trBase[1],client.ps.origin[1]),n.fsub(ent.s.pos.trBase[2],client.ps.origin[2])]
    length = q.VectorNormalize(delta)
    if length > 192 then continue end if
    if q.DotProduct(delta,q.AngleVectors(client.ps.viewangles)[0]) < 0.4 then continue end if
    hit = itemCombat.shotTrace(level,client.ps.origin,ent.s.pos.trBase,void,void,1023,1)
    if hit.trace.fraction != 1.0 then continue end if
    client.ps.persistant[c.PERS_PLAYEREVENTS] = client.ps.persistant[c.PERS_PLAYEREVENTS] ^ 1
  end for
  return 120
end function
/// Set `other.client.ps.stats[c.STAT_HOLDABLE_ITEM]` to `ent.item` and `other.client.ps.eFlags` to `other.client.ps.eFlags | 0x200` in `mq3.game.items.pickupHoldable`. Return paths include `60`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`.
/// @param other Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_HOLDABLE_ITEM]` and `other.client.ps.eFlags` in place.
function pickupHoldable(level,ent,other)
  other.client.ps.stats[c.STAT_HOLDABLE_ITEM] = ent.item
  if missionpack(level) and modeItemTag(level,ent.item) == c.HI_KAMIKAZE then other.client.ps.eFlags = other.client.ps.eFlags | 0x200 end if
  return 60
end function
/// Set `ent.client.ps.ammo[weapon]` to `n.add32(ent.client.ps.ammo[weapon],count)` and `ent.client.ps.ammo[weapon]` to `200` in `mq3.game.items.addAmmo`.
/// @param ent Game entity; accesses `client`. May update `ent.client.ps.ammo[weapon]` in place.
/// @param weapon Weapon identifier used by the action or inventory lookup.
/// @param count Number of entries or bytes processed by this call.
function addAmmo(ent,weapon,count)
  ent.client.ps.ammo[weapon] = n.add32(ent.client.ps.ammo[weapon],count)
  if ent.client.ps.ammo[weapon] > 200 then ent.client.ps.ammo[weapon] = 200 end if
  return void
end function
/// Apply `mq3.game.items.modeItemQuantity`, `mq3.game.items.addAmmo` and `mq3.game.items.modeItemTag` while evaluating `pickupAmmo`. Return paths include `40`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item` and `count`.
/// @param other Game entity; accesses `client`. May update `other.client.ps.ammo[weapon]` in place.
function pickupAmmo(level,ent,other)
  quantity = modeItemQuantity(level,ent.item); if ent.count != 0 then quantity = ent.count end if
  addAmmo(other,modeItemTag(level,ent.item),quantity); return 40
end function
/// Set `other.client.ps.stats[c.STAT_WEAPONS]` to `other.client.ps.stats[c.STAT_WEAPONS] | (1 << tag)` and `other.client.ps.ammo[tag]` to `-1` in `mq3.game.items.pickupWeapon`. Return paths include `level.weaponRespawn`.
/// @param level Game-level state; accesses `spawner`, `weaponTeamRespawn` and `weaponRespawn`.
/// @param ent Game entity; accesses `item`, `count` and `flags`.
/// @param other Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_WEAPONS]` and `other.client.ps.ammo[tag]` in place.
function pickupWeapon(level,ent,other)
  tag = modeItemTag(level,ent.item); quantity = 0
  if ent.count >= 0 then
    quantity = modeItemQuantity(level,ent.item); if ent.count != 0 then quantity = ent.count end if
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
/// Update `other.health` and `other.client.ps.stats[c.STAT_HEALTH]` during `pickupHealth`. Return paths include `35`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item` and `count`.
/// @param other Other record; accesses `client` and `health`. May update `other.health` and `other.client.ps.stats[c.STAT_HEALTH]` in place.
function pickupHealth(level,ent,other)
  quantity = modeItemQuantity(level,ent.item); max = other.client.ps.stats[c.STAT_MAX_HEALTH]
  guard = missionpack(level) and other.client.persistantPowerup != void and modeItemTag(level,other.client.persistantPowerup.item) == c.PW_GUARD
  if not guard and (quantity == 5 or quantity == 100) then max = n.mul32(max,2) end if
  if ent.count != 0 then quantity = ent.count end if
  other.health = n.add32(other.health,quantity); if other.health > max then other.health = max end if
  other.client.ps.stats[c.STAT_HEALTH] = other.health
  if modeItemQuantity(level,ent.item) == 100 then return 35 end if
  return 35
end function
/// Set `other.client.ps.stats[c.STAT_ARMOR]` to `value` in `mq3.game.items.pickupArmor`. Return paths include `25`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`.
/// @param other Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_ARMOR]` in place.
function pickupArmor(level,ent,other)
  value = n.add32(other.client.ps.stats[c.STAT_ARMOR],modeItemQuantity(level,ent.item)); max = n.mul32(other.client.ps.stats[c.STAT_MAX_HEALTH],2)
  if missionpack(level) and other.client.persistantPowerup != void and modeItemTag(level,other.client.persistantPowerup.item) == c.PW_GUARD then max = other.client.ps.stats[c.STAT_MAX_HEALTH] end if
  if value > max then value = max end if
  other.client.ps.stats[c.STAT_ARMOR] = value; return 25
end function
/// Use `level.teamMessageFn` to perform `teamMessage`.
/// @param level Game-level state; accesses `teamMessageFn`.
/// @param recipient Value passed as argument 2 to `level.teamMessageFn`.
/// @param text Text to parse, format or deliver.
function teamMessage(level,recipient,text)
  if level.teamMessageFn == void then return error(497,"Team item requires a PrintMsg sink") end if
  level.teamMessageFn(level,recipient,text); return void
end function
/// Set `level.teamScores[team]` to `n.add32(level.teamScores[team],score)` in `mq3.game.items.addTeamScore`.
/// @param level Game-level state; accesses `teamScores`. May update `level.teamScores[team]` in place.
/// @param origin World-space position as three coordinates.
/// @param team Team identifier used by the game rules.
/// @param score Value passed as argument 2 to `mq3.compat.numeric.add32`.
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
/// Set the forced-gesture flag on every active client belonging to the selected team.
/// @param level Game-level state; accesses `entities`.
/// @param team Team identifier used by the game rules.
function forceGesture(level,team)
  for i = 0 to 63
    ent = level.entities[i]
    if ent.inuse and ent.client != void and ent.client.team == team then ent.flags = ent.flags | FL_FORCE_GESTURE end if
  end for
  return void
end function
/// Set `level.blueTakenTime` to `level.time` and `level.redTakenTime` to `level.time` in `mq3.game.items.takeFlagSound`.
/// @param level Game-level state; accesses `blueFlagStatus`, `blueTakenTime`, `time`, `redFlagStatus` and `redTakenTime`. May update `level.blueTakenTime` and `level.redTakenTime` in place.
/// @param ent Game entity; accesses `s`.
/// @param team Team identifier used by the game rules.
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
/// Apply `mq3.game.entities.tempEntity` while evaluating `captureFlagSound`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`.
/// @param team Team identifier used by the game rules.
function captureFlagSound(level,ent,team)
  if ent == void then return void end if
  temp = game.tempEntity(level,ent.s.pos.trBase,c.EV_GLOBAL_TEAM_SOUND)
  if team == c.TEAM_BLUE then temp.s.eventParm = c.GTS_BLUE_CAPTURE else temp.s.eventParm = c.GTS_RED_CAPTURE end if
  temp.r.svFlags = temp.r.svFlags | 32; return void
end function
/// Apply `mq3.game.items.resetFlag` while evaluating `resetFlags`.
/// @param level Game-level state; accesses `spawner`.
function resetFlags(level)
  if level.spawner.gametype == 4 then resetFlag(level,c.TEAM_RED); resetFlag(level,c.TEAM_BLUE) end if
  return void
end function
/// Set `level.lastFlagCapture` to `n.f32(level.time)` and `level.lastCaptureTeam` to `team` in `mq3.game.items.touchOurFlag`.
/// @param level Game-level state; accesses `time`, `lastFlagCapture`, `lastCaptureTeam`, `maxclients` and `entities`. May update `level.lastFlagCapture` and `level.lastCaptureTeam` in place.
/// @param ent Game entity; accesses `flags`, `r` and `s`.
/// @param other Other record; accesses `client`.
/// @param team Team identifier used by the game rules.
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
/// Apply `mq3.game.items.teamMessage`, `mq3.game.team_bonuses.teamName` and `mq3.game.items.setFlagStatus` while evaluating `touchEnemyFlag`. Return paths include `-1`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `r`.
/// @param other Other record; accesses `client`.
/// @param team Team identifier used by the game rules.
function touchEnemyFlag(level,ent,other,team)
  client = other.client
  teamMessage(level,-1,client.netname+"^7 got the "+bonuses.teamName(team)+" flag!\n")
  if team == c.TEAM_RED then client.ps.powerups[c.PW_REDFLAG] = 2147483647 else client.ps.powerups[c.PW_BLUEFLAG] = 2147483647 end if
  setFlagStatus(level,team,FLAG_TAKEN); scores.addScore(level,other,ent.r.currentOrigin,0); client.flagsince = n.f32(level.time); takeFlagSound(level,ent,team)
  return -1
end function
/// Apply `mq3.game.items.teamMessage`, `mq3.game.items.touchOurFlag` and `mq3.game.items.touchEnemyFlag` while evaluating `pickupTeam`. Return paths include `touchEnemyFlag(level,ent,other,team)`.
/// @param level Game-level state; accesses `teamMessageFn`.
/// @param ent Game entity; accesses `classname`.
/// @param other Other record; accesses `slot` and `client`.
function pickupTeam(level,ent,other)
  team = 0
  if ent.classname == "team_CTF_redflag" then team = c.TEAM_RED
  else if ent.classname == "team_CTF_blueflag" then team = c.TEAM_BLUE
  else teamMessage(level,other.slot,"Don't know what team the flag is on.\n"); return 0 end if
  if team == other.client.team then return touchOurFlag(level,ent,other,team) end if
  return touchEnemyFlag(level,ent,other,team)
end function
/// Update `ent.r.svFlags`, `ent.s.eFlags`, `ent.r.contents` and `ent.unlinkAfterEvent` and related state during `touch`. Return paths include `game.link(level,ent)`.
/// @param level Game-level state; accesses `spawner`, `gameLogFn` and `time`.
/// @param ent Game entity; accesses `item`, `s`, `speed`, `wait` and `r` and related fields. May update `ent.r.svFlags`, `ent.s.eFlags` and `ent.r.contents` and additional fields in place.
/// @param other Other record; accesses `client`, `health` and `s`.
/// @param trace Not read by this implementation; retained in the `touch` signature.
function touch(level,ent,other,trace)
  if other.client == void or other.health < 1 then return void end if
  if not canGrab(level.spawner.gametype,ent,other.client.ps) then return void end if
  if level.gameLogFn == void then return error(497,"Touch_Item requires a game log sink") end if
  level.gameLogFn(level,"Item: "+str(other.s.number)+" "+modeItemName(level,ent.item)+"\n")
  predict = other.client.predictItemPickup; type = modeItemType(level,ent.item); respawnTime = 0
  if type == c.IT_WEAPON then respawnTime = pickupWeapon(level,ent,other)
  else if type == c.IT_AMMO then respawnTime = pickupAmmo(level,ent,other)
  else if type == c.IT_ARMOR then respawnTime = pickupArmor(level,ent,other)
  else if type == c.IT_HEALTH then respawnTime = pickupHealth(level,ent,other)
  else if type == c.IT_POWERUP then respawnTime = pickupPowerup(level,ent,other); predict = false
  else if type == c.IT_PERSISTANT_POWERUP then respawnTime = pickupPersistantPowerup(level,ent,other)
  else if type == c.IT_TEAM then respawnTime = pickupTeam(level,ent,other)
  else if type == c.IT_HOLDABLE then respawnTime = pickupHoldable(level,ent,other)
  else return void end if
  if respawnTime == 0 then return void end if
  if predict then gUtils.G_AddPredictableEvent(level,other,c.EV_ITEM_PICKUP,ent.s.modelindex) else events.add(level,other,c.EV_ITEM_PICKUP,ent.s.modelindex) end if
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
/// Update `level.redFlagStatus`, `level.blueFlagStatus` and `level.neutralFlagStatus` during `setFlagStatus`.
/// @param level Game-level state; accesses `redFlagStatus`, `blueFlagStatus`, `neutralFlagStatus` and `spawner`. May update `level.redFlagStatus`, `level.blueFlagStatus` and `level.neutralFlagStatus` in place.
/// @param team Team identifier used by the game rules.
/// @param status Value used by `setFlagStatus` in `if status < 0 or status > 4 then return error(497,"Invalid flag status") end if`.
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
/// Apply `mq3.game.items.modeItemTag` and `mq3.game.items.setFlagStatus` while evaluating `checkDropped`.
/// @param level Game-level state; accesses `spawner`.
/// @param dropped Dropped record; accesses `item`.
function checkDropped(level,dropped)
  tag = modeItemTag(level,dropped.item)
  if tag == c.PW_REDFLAG then setFlagStatus(level,c.TEAM_RED,FLAG_DROPPED)
  else if tag == c.PW_BLUEFLAG then setFlagStatus(level,c.TEAM_BLUE,FLAG_DROPPED)
  else if tag == c.PW_NEUTRALFLAG then setFlagStatus(level,c.TEAM_FREE,FLAG_DROPPED) end if
  return void
end function
/// Update `ent.r.contents`, `ent.s.eFlags`, `ent.r.svFlags` and `ent.nextthink` during `respawn`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`, `team`, `teammaster`, `r` and `s` and related fields. May update `ent.r.contents`, `ent.s.eFlags` and `ent.r.svFlags` and additional fields in place.
function respawn(level,ent)
  requireModeItem(level,ent.item)
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
    requireModeItem(level,ent.item)
  end if
  ent.r.contents = 0x40000000; ent.s.eFlags = ent.s.eFlags & ~0x80; ent.r.svFlags = ent.r.svFlags & ~1
  game.link(level,ent)
  if modeItemType(level,ent.item) == c.IT_POWERUP or (modeItemType(level,ent.item) == c.IT_HOLDABLE and modeItemTag(level,ent.item) == c.HI_KAMIKAZE) then
    event = c.EV_GLOBAL_SOUND
    if ent.speed != 0 then event = c.EV_GENERAL_SOUND end if
    temp = game.tempEntity(level,ent.s.pos.trBase,event)
    soundName = "sound/items/poweruprespawn.wav"; if modeItemType(level,ent.item) == c.IT_HOLDABLE then soundName = "sound/items/kamikazerespawn.wav" end if
    temp.s.eventParm = values.soundIndex(level.spawner,soundName); temp.r.svFlags = temp.r.svFlags | 32
  end if
  events.add(level,ent,c.EV_ITEM_RESPAWN,0); ent.nextthink = 0
  return void
end function
/// Forward `use` to `mq3.game.items.respawn` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`, `team`, `teammaster`, `r` and `s` and related fields. May update `ent.r.contents`, `ent.s.eFlags` and `ent.r.svFlags` and additional fields in place.
/// @param other Not read by this implementation; retained in the `use` signature.
/// @param activator Not read by this implementation; retained in the `use` signature.
function use(level,ent,other,activator)
  return respawn(level,ent)
end function
/// Update `ent.r.mins`, `ent.r.maxs`, `ent.s.eType` and `ent.s.modelindex` and related state during `finishSpawning`. Return paths include `game.link(level,ent)`.
/// @param level Game-level state; accesses `gamePrintFn` and `time`.
/// @param ent Game entity; accesses `item`, `r`, `s`, `touch` and `use` and related fields. May update `ent.r.mins`, `ent.r.maxs` and `ent.s.eType` and additional fields in place.
function finishSpawning(level,ent)
  item = requireModeItem(level,ent.item)
  ent.r.mins = [-15.0,-15.0,-15.0]; ent.r.maxs = [15.0,15.0,15.0]
  ent.s.eType = c.ET_ITEM; ent.s.modelindex = item; ent.s.modelindex2 = 0
  ent.r.contents = 0x40000000; ent.touch = touch; ent.use = use
  if (ent.spawnflags & 1) != 0 then game.setOrigin(ent,ent.s.origin)
  else
    destination = [ent.s.origin[0],ent.s.origin[1],n.fsub(ent.s.origin[2],4096.0)]
    hit = itemCombat.shotTrace(level,ent.s.origin,destination,ent.r.mins,ent.r.maxs,ent.s.number,1)
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
  if modeItemType(level,item) == c.IT_POWERUP then
    respawnTime = 45.0+centeredRandom(level)*15.0
    ent.s.eFlags = ent.s.eFlags | 0x80; ent.r.contents = 0
    ent.nextthink = textnum.truncDouble32(level.time+respawnTime*1000.0); ent.think = respawn
    return void
  end if
  return game.link(level,ent)
end function
/// Update `ent.random`, `ent.wait`, `ent.item` and `ent.nextthink` and related state during `spawnItem`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param ent Game entity; accesses `random`, `wait`, `item`, `nextthink` and `think` and related fields. May update `ent.random`, `ent.wait` and `ent.item` and additional fields in place.
/// @param item Index of the entry to access.
function spawnItem(level,ent,item)
  item = requireModeItem(level,item)
  ent.random = values.getFloat(level.spawner,"random","0")[1]; ent.wait = values.getFloat(level.spawner,"wait","0")[1]
  register(level,item)
  disabled = cv.find(level.spawner.cvars,"disable_"+modeItemName(level,item))
  if disabled != void and disabled.integer != 0 then return void end if
  ent.item = item; ent.nextthink = n.add32(level.time,200); ent.think = finishSpawning; ent.physicsBounce = 0.5
  if modeItemType(level,item) == c.IT_POWERUP then
    values.soundIndex(level.spawner,"sound/items/poweruprespawn.wav")
    ent.speed = values.getFloat(level.spawner,"noglobalsound","0")[1]
  end if
  if modeItemType(level,item) == c.IT_PERSISTANT_POWERUP then ent.s.generic1 = ent.spawnflags end if
  return void
end function
/// Find the next active entity with a case-insensitive class-name match for items.
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
/// Apply `mq3.game.items.findClass`, `mq3.game.entities.free` and `mq3.game.items.respawn` while evaluating `resetFlag`. Return paths include `rent`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param team Team identifier used by the game rules.
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
/// Use `level.gamePrintFn` to perform `returnFlagSound`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `s`.
/// @param team Team identifier used by the game rules.
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
/// Use `level.teamMessageFn` to perform `returnFlag`.
/// @param level Game-level state; accesses `teamMessageFn`.
/// @param team Team identifier used by the game rules.
function returnFlag(level,team)
  returnFlagSound(level,resetFlag(level,team),team)
  if level.teamMessageFn == void then return error(497,"Team_ReturnFlag requires a PrintMsg sink") end if
  if team == c.TEAM_FREE then level.teamMessageFn(level,-1,"The flag has returned!\n")
  else level.teamMessageFn(level,-1,"The "+bonuses.teamName(team)+" flag has returned!\n") end if
  return void
end function
/// Apply `mq3.game.items.modeItemTag` and `mq3.game.items.returnFlag` while evaluating `teamFree`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`.
function teamFree(level,ent)
  tag = modeItemTag(level,ent.item)
  if tag == c.PW_REDFLAG then returnFlag(level,c.TEAM_RED)
  else if tag == c.PW_BLUEFLAG then returnFlag(level,c.TEAM_BLUE)
  else if tag == c.PW_NEUTRALFLAG then returnFlag(level,c.TEAM_FREE) end if
  return void
end function
/// Apply `mq3.game.items.modeItemTag`, `mq3.game.items.returnFlagSound` and `mq3.game.items.resetFlag` while evaluating `droppedFlagThink`. Return paths include `returnFlagSound(level,resetFlag(level,team),team)`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`.
function droppedFlagThink(level,ent)
  team = c.TEAM_FREE; tag = modeItemTag(level,ent.item)
  if tag == c.PW_REDFLAG then team = c.TEAM_RED
  else if tag == c.PW_BLUEFLAG then team = c.TEAM_BLUE end if
  return returnFlagSound(level,resetFlag(level,team),team)
end function
/// Apply `mq3.game.items.requireModeItem`, `mq3.game.entities.spawn` and `mq3.game.items.modeItemName` while evaluating `launch`. Return paths include `dropped`.
/// @param level Game-level state; accesses `time` and `spawner`.
/// @param item Index of the entry to access.
/// @param origin World-space position as three coordinates.
/// @param velocity Three-component movement velocity.
function launch(level,item,origin,velocity)
  item = requireModeItem(level,item); dropped = game.spawn(level)
  dropped.s.eType = c.ET_ITEM; dropped.s.modelindex = item; dropped.s.modelindex2 = 1
  dropped.classname = modeItemName(level,item); dropped.item = item
  dropped.r.mins = [-15.0,-15.0,-15.0]; dropped.r.maxs = [15.0,15.0,15.0]; dropped.r.contents = 0x40000000
  dropped.touch = touch; game.setOrigin(dropped,origin); dropped.s.pos.trType = c.TR_GRAVITY; dropped.s.pos.trTime = level.time
  dropped.s.pos.trDelta = movement.copy(velocity); dropped.s.eFlags = dropped.s.eFlags | 0x20
  if level.spawner != void and (level.spawner.gametype == 4 or (missionpack(level) and level.spawner.gametype == 5)) and modeItemType(level,item) == c.IT_TEAM then
    dropped.think = droppedFlagThink; dropped.nextthink = n.add32(level.time,30000); checkDropped(level,dropped)
  else
    dropped.think = game.free; dropped.nextthink = n.add32(level.time,30000)
  end if
  dropped.flags = FL_DROPPED_ITEM; game.link(level,dropped)
  return dropped
end function
/// Apply `mq3.game.movement.copy`, `mq3.game.items.centeredRandom` and `mq3.game.items.launch` while evaluating `drop`. Return paths include `launch(level,item,ent.s.pos.trBase,velocity)`.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
/// @param ent Game entity; accesses `s`.
/// @param item Index of the entry to access.
/// @param angle Value passed as argument 2 to `mq3.compat.numeric.fadd`.
function drop(level,ent,item,angle)
  angles = movement.copy(ent.s.apos.trBase); angles[1] = n.fadd(angles[1],angle); angles[0] = 0.0
  velocity = q.AngleVectors(angles)[0]; velocity = q.VectorScale(velocity,150.0)
  velocity[2] = n.f32(velocity[2]+200.0+centeredRandom(level)*50.0)
  return launch(level,item,ent.s.pos.trBase,velocity)
end function
/// Update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]`, `hit.endpos[2]` and `ent.s.groundEntityNum` and related state during `bounce`.
/// @param level Game-level state; accesses `previousTime` and `time`.
/// @param ent Game entity; accesses `s`, `physicsBounce` and `r`. May update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]` and `ent.s.groundEntityNum` and additional fields in place.
/// @param hit Hit record; accesses `trace`, `endpos` and `entityNum`. May update `hit.endpos[2]` in place.
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
/// Update `ent.s.pos.trType`, `ent.s.pos.trTime` and `ent.r.currentOrigin` during `run`. Return paths include `bounce(level,ent,hit)`.
/// @param level Game-level state; accesses `time` and `scene`.
/// @param ent Game entity; accesses `item`, `physicsObject`, `s`, `clipmask` and `r`. May update `ent.s.pos.trType`, `ent.s.pos.trTime` and `ent.r.currentOrigin` in place.
function run(level,ent)
  if ent.item != void then requireModeItem(level,ent.item)
  else if not ent.physicsObject then return error(497,"G_RunItem requires an item or physics object") end if
  if ent.s.groundEntityNum == -1 and ent.s.pos.trType != c.TR_GRAVITY then ent.s.pos.trType = c.TR_GRAVITY; ent.s.pos.trTime = level.time end if
  if ent.s.pos.trType == c.TR_STATIONARY then return game.runThink(level,ent) end if
  origin = trajectory.evaluate(ent.s.pos,level.time); mask = ent.clipmask
  if mask == 0 then mask = 0x10001 end if
  hit = itemCombat.shotTrace(level,ent.r.currentOrigin,origin,ent.r.mins,ent.r.maxs,ent.r.ownerNum,mask)
  ent.r.currentOrigin = movement.copy(hit.endpos)
  if hit.trace.startsolid then hit.trace.fraction = 0.0 end if
  game.link(level,ent); game.runThink(level,ent)
  if hit.trace.fraction == 1 then return void end if
  if (sv.pointContents(level.scene,ent.r.currentOrigin,-1) & 0x80000000) != 0 then
    if ent.item != void and modeItemType(level,ent.item) == c.IT_TEAM then return teamFree(level,ent) end if
    return game.free(level,ent)
  end if
  return bounce(level,ent,hit)
end function
