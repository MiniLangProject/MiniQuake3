// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named g_itemCore.c surface. Gameplay stays in the exact-tested
// item kernel; this facade is the productive spawn/frame/QAGame entry point.
package mq3.game.g_items
import mq3.game.items as itemCore
import mq3.qcommon.cvar as cv

function Pickup_Powerup(level,ent,other) return itemCore.pickupPowerup(level,ent,other) end function
function Pickup_PersistantPowerup(level,ent,other) return itemCore.pickupPersistantPowerup(level,ent,other) end function
function Pickup_Holdable(level,ent,other) return itemCore.pickupHoldable(level,ent,other) end function
function Add_Ammo(ent,weapon,count) return itemCore.addAmmo(ent,weapon,count) end function
function Pickup_Ammo(level,ent,other) return itemCore.pickupAmmo(level,ent,other) end function
function Pickup_Weapon(level,ent,other) return itemCore.pickupWeapon(level,ent,other) end function
function Pickup_Health(level,ent,other) return itemCore.pickupHealth(level,ent,other) end function
function Pickup_Armor(level,ent,other) return itemCore.pickupArmor(level,ent,other) end function
function RespawnItem(level,ent) return itemCore.respawn(level,ent) end function
function Touch_Item(level,ent,other,trace) return itemCore.touch(level,ent,other,trace) end function
function LaunchItem(level,item,origin,velocity) return itemCore.launch(level,item,origin,velocity) end function
function Drop_Item(level,ent,item,angle) return itemCore.drop(level,ent,item,angle) end function
function Use_Item(level,ent,other,activator) return itemCore.use(level,ent,other,activator) end function
function FinishSpawningItem(level,ent) return itemCore.finishSpawning(level,ent) end function
function G_CheckTeamItems(level) return itemCore.checkTeamItems(level) end function
function ClearRegisteredItems(level) return itemCore.clearRegistered(level) end function
function RegisterItem(level,item) return itemCore.register(level,item) end function
function SaveRegisteredItems(level) return itemCore.saveRegistered(level) end function
function G_ItemDisabled(level,item)
  name = itemCore.modeItemName(level,item); value = cv.find(level.spawner.cvars,"disable_"+name)
  if value == void then return 0 end if
  return value.integer
end function
function G_SpawnItem(level,ent,item) return itemCore.spawnItem(level,ent,item) end function
function G_BounceItem(level,ent,trace) return itemCore.bounce(level,ent,trace) end function
function G_RunItem(level,ent) return itemCore.run(level,ent) end function

