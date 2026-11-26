// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named g_itemCore.c surface. Gameplay stays in the exact-tested
// item kernel; this facade is the productive spawn/frame/QAGame entry point.
package mq3.game.g_items
import mq3.game.items as itemCore
import mq3.qcommon.cvar as cv

/// Forward `Pickup_Powerup` to `mq3.game.items.pickupPowerup` and return the delegated result.
/// @param level Game-level state; accesses `time`, `maxclients`, `clients` and `spawner`.
/// @param ent Game entity; accesses `item`, `count` and `s`.
/// @param other Other record; accesses `client`.
function Pickup_Powerup(level,ent,other) return itemCore.pickupPowerup(level,ent,other) end function
/// Forward `Pickup_PersistantPowerup` to `mq3.game.items.pickupPersistantPowerup` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`.
/// @param other Other record; accesses `client` and `health`. May update `other.client.ps.stats[7]`, `other.client.persistantPowerup` and `other.health` and additional fields in place.
function Pickup_PersistantPowerup(level,ent,other) return itemCore.pickupPersistantPowerup(level,ent,other) end function
/// Forward `Pickup_Holdable` to `mq3.game.items.pickupHoldable` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`.
/// @param other Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_HOLDABLE_ITEM]` and `other.client.ps.eFlags` in place.
function Pickup_Holdable(level,ent,other) return itemCore.pickupHoldable(level,ent,other) end function
/// Forward `Add_Ammo` to `mq3.game.items.addAmmo` and return the delegated result.
/// @param ent Game entity; accesses `client`. May update `ent.client.ps.ammo[weapon]` in place.
/// @param weapon Weapon identifier used by the action or inventory lookup.
/// @param count Number of entries or bytes processed by this call.
function Add_Ammo(ent,weapon,count) return itemCore.addAmmo(ent,weapon,count) end function
/// Forward `Pickup_Ammo` to `mq3.game.items.pickupAmmo` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item` and `count`.
/// @param other Game entity; accesses `client`. May update `other.client.ps.ammo[weapon]` in place.
function Pickup_Ammo(level,ent,other) return itemCore.pickupAmmo(level,ent,other) end function
/// Forward `Pickup_Weapon` to `mq3.game.items.pickupWeapon` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `weaponTeamRespawn` and `weaponRespawn`.
/// @param ent Game entity; accesses `item`, `count` and `flags`.
/// @param other Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_WEAPONS]` and `other.client.ps.ammo[tag]` in place.
function Pickup_Weapon(level,ent,other) return itemCore.pickupWeapon(level,ent,other) end function
/// Forward `Pickup_Health` to `mq3.game.items.pickupHealth` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item` and `count`.
/// @param other Other record; accesses `client` and `health`. May update `other.health` and `other.client.ps.stats[c.STAT_HEALTH]` in place.
function Pickup_Health(level,ent,other) return itemCore.pickupHealth(level,ent,other) end function
/// Forward `Pickup_Armor` to `mq3.game.items.pickupArmor` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`.
/// @param other Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_ARMOR]` in place.
function Pickup_Armor(level,ent,other) return itemCore.pickupArmor(level,ent,other) end function
/// Forward `RespawnItem` to `mq3.game.items.respawn` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`, `team`, `teammaster`, `r` and `s` and related fields. May update `ent.r.contents`, `ent.s.eFlags` and `ent.r.svFlags` and additional fields in place.
function RespawnItem(level,ent) return itemCore.respawn(level,ent) end function
/// Forward `Touch_Item` to `mq3.game.items.touch` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `gameLogFn` and `time`.
/// @param ent Game entity; accesses `item`, `s`, `speed`, `wait` and `r` and related fields. May update `ent.r.svFlags`, `ent.s.eFlags` and `ent.r.contents` and additional fields in place.
/// @param other Other record; accesses `client`, `health` and `s`.
/// @param trace Value passed as argument 4 to `mq3.game.items.touch`.
function Touch_Item(level,ent,other,trace) return itemCore.touch(level,ent,other,trace) end function
/// Forward `LaunchItem` to `mq3.game.items.launch` and return the delegated result.
/// @param level Game-level state; accesses `time` and `spawner`.
/// @param item Index of the entry to access.
/// @param origin World-space position as three coordinates.
/// @param velocity Three-component movement velocity.
function LaunchItem(level,item,origin,velocity) return itemCore.launch(level,item,origin,velocity) end function
/// Forward `Drop_Item` to `mq3.game.items.drop` and return the delegated result.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
/// @param ent Game entity; accesses `s`.
/// @param item Index of the entry to access.
/// @param angle Value passed as argument 2 to `mq3.compat.numeric.fadd`.
function Drop_Item(level,ent,item,angle) return itemCore.drop(level,ent,item,angle) end function
/// Forward `Use_Item` to `mq3.game.items.use` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `item`, `team`, `teammaster`, `r` and `s` and related fields. May update `ent.r.contents`, `ent.s.eFlags` and `ent.r.svFlags` and additional fields in place.
/// @param other Value passed as argument 3 to `mq3.game.items.use`.
/// @param activator Entity responsible for activating the target.
function Use_Item(level,ent,other,activator) return itemCore.use(level,ent,other,activator) end function
/// Forward `FinishSpawningItem` to `mq3.game.items.finishSpawning` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn` and `time`.
/// @param ent Game entity; accesses `item`, `r`, `s`, `touch` and `use` and related fields. May update `ent.r.mins`, `ent.r.maxs` and `ent.s.eType` and additional fields in place.
function FinishSpawningItem(level,ent) return itemCore.finishSpawning(level,ent) end function
/// Forward `G_CheckTeamItems` to `mq3.game.items.checkTeamItems` and return the delegated result.
/// @param level Game-level state; accesses `spawner` and `itemRegistered`.
function G_CheckTeamItems(level) return itemCore.checkTeamItems(level) end function
/// Forward `ClearRegisteredItems` to `mq3.game.items.clearRegistered` and return the delegated result.
/// @param level Game-level state; accesses `itemRegistered` and `spawner`. May update `level.itemRegistered[index]` in place.
function ClearRegisteredItems(level) return itemCore.clearRegistered(level) end function
/// Forward `RegisterItem` to `mq3.game.items.register` and return the delegated result.
/// @param level Game-level state; accesses `itemRegistered`. May update `level.itemRegistered[item]` in place.
/// @param item Value passed as argument 1 to `typeof`.
function RegisterItem(level,item) return itemCore.register(level,item) end function
/// Forward `SaveRegisteredItems` to `mq3.game.items.saveRegistered` and return the delegated result.
/// @param level Game-level state; accesses `itemRegistered` and `spawner`.
function SaveRegisteredItems(level) return itemCore.saveRegistered(level) end function
/// Apply `mq3.game.items.modeItemName` and `mq3.qcommon.cvar.find` while evaluating `G_ItemDisabled`. Return paths include `value.integer`.
/// @param level Game-level state; accesses `spawner`.
/// @param item Index of the entry to access.
function G_ItemDisabled(level,item)
  name = itemCore.modeItemName(level,item); value = cv.find(level.spawner.cvars,"disable_"+name)
  if value == void then return 0 end if
  return value.integer
end function
/// Forward `G_SpawnItem` to `mq3.game.items.spawnItem` and return the delegated result.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param ent Game entity; accesses `random`, `wait`, `item`, `nextthink` and `think` and related fields. May update `ent.random`, `ent.wait` and `ent.item` and additional fields in place.
/// @param item Index of the entry to access.
function G_SpawnItem(level,ent,item) return itemCore.spawnItem(level,ent,item) end function
/// Forward `G_BounceItem` to `mq3.game.items.bounce` and return the delegated result.
/// @param level Game-level state; accesses `previousTime` and `time`.
/// @param ent Game entity; accesses `s`, `physicsBounce` and `r`. May update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]` and `ent.s.groundEntityNum` and additional fields in place.
/// @param trace Hit record; accesses `trace`, `endpos` and `entityNum`. May update `trace.endpos[2]` in place.
function G_BounceItem(level,ent,trace) return itemCore.bounce(level,ent,trace) end function
/// Forward `G_RunItem` to `mq3.game.items.run` and return the delegated result.
/// @param level Game-level state; accesses `time` and `scene`.
/// @param ent Game entity; accesses `item`, `physicsObject`, `s`, `clipmask` and `r`. May update `ent.s.pos.trType`, `ent.s.pos.trTime` and `ent.r.currentOrigin` in place.
function G_RunItem(level,ent) return itemCore.run(level,ent) end function

