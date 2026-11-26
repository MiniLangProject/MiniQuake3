// SPDX-License-Identifier: GPL-2.0-or-later
// Small entity-driven item simulation for the interactive BSP preview.
package mq3.client.playable_items

import mq3.format.bsp as bsp
import mq3.compat.textnumbers as textnumbers
import mq3.client.playable_weapon_inventory as weaponInventory
import std.string as strings

const DEFAULT_PICKUP_RADIUS=42.0
const HEALTH_NORMAL_CAP=100
const HEALTH_OVERMAX_CAP=200
const ARMOR_CAP=200
const AMMO_CAP=200

/// Stores playable items menu item, including `classname`, `kind`, `origin`, `amount`, `cap`, `respawnMs` and additional values.
struct Item classname kind origin amount cap respawnMs active respawnAt weapon end struct
/// Stores playable items stats record, including `health`, `armor`, `ammo`, `weapon`.
struct Stats health armor ammo weapon end struct
/// Stores playable items state, including `items`, `stats`, `pickupRadius`, `lastTime`.
struct State items stats pickupRadius lastTime end struct
/// Stores playable items pickup record, including `itemIndex`, `classname`, `kind`, `amount`, `before`, `after` and additional values.
struct Pickup itemIndex classname kind amount before after weapon end struct

/// Creates the playable items error `7501` with diagnostic text `"preview items: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview items: "+message`.
function fail(message) return error(7501,"preview items: "+message) end function

/// Calls `std.string.toLowerAscii` from playable items `field`. The final path returns `""`.
/// @param fields Value used by `for each pair in fields`.
/// @param key Key or control identifier used to select the corresponding playable items entry.
function field(fields,key)
  wanted=strings.toLowerAscii(key)
  for each pair in fields
    if len(pair)>=2 and strings.toLowerAscii(pair[0])==wanted then return pair[1] end if
  end for
  return ""
end function

// [kind, amount, cap, respawn milliseconds, weapon name]. Values follow the
// Baseq3 item table closely while the preview keeps one combined ammo counter.
/// @param classname Value used by `name=strings.toLowerAscii(classname)`.
function definition(classname)
  name=strings.toLowerAscii(classname)
  if name=="item_health_small" then return ["health",5,HEALTH_OVERMAX_CAP,35000,""] end if
  if name=="item_health_large" then return ["health",50,HEALTH_NORMAL_CAP,35000,""] end if
  if name=="item_health_mega" then return ["health",100,HEALTH_OVERMAX_CAP,35000,""] end if
  if strings.startsWith(name,"item_health") then return ["health",25,HEALTH_NORMAL_CAP,35000,""] end if
  if name=="item_armor_shard" then return ["armor",5,ARMOR_CAP,25000,""] end if
  if name=="item_armor_combat" then return ["armor",50,ARMOR_CAP,25000,""] end if
  if name=="item_armor_body" then return ["armor",100,ARMOR_CAP,25000,""] end if
  if strings.startsWith(name,"item_armor") then return ["armor",25,ARMOR_CAP,25000,""] end if
  if strings.startsWith(name,"ammo_") then
    amount=10
    if name=="ammo_bullets" then amount=50
    else if name=="ammo_shells" then amount=10
    else if name=="ammo_grenades" then amount=5
    else if name=="ammo_rockets" then amount=5
    else if name=="ammo_lightning" then amount=60
    else if name=="ammo_slugs" then amount=10
    else if name=="ammo_cells" then amount=30
    else if name=="ammo_bfg" then amount=15
    end if
    return ["ammo",amount,AMMO_CAP,40000,""]
  end if
  if strings.startsWith(name,"weapon_") then
    amount=10
    if name=="weapon_machinegun" then amount=40
    else if name=="weapon_lightning" then amount=100
    else if name=="weapon_plasmagun" then amount=50
    else if name=="weapon_bfg" then amount=20
    end if
    return ["weapon",amount,AMMO_CAP,5000,name]
  end if
  return void
end function

/// Calls `mq3.client.playable_items.field`, `mq3.client.playable_items.definition`, `mq3.compat.textnumbers.vector` and additional helpers from playable items `fromEntities`. The final path returns `State(items,Stats(100,0,50,"weapon_machinegun"),pickupRadius,0)`.
/// @param entities Value used by `if entities==void or pickupRadius<=0.0 then return fail("entities and a positive pickup radius are required") end if`.
/// @param pickupRadius Value used by `if entities==void or pickupRadius<=0.0 then return fail("entities and a positive pickup radius are required") end if`.
function fromEntities(entities,pickupRadius)
  if entities==void or pickupRadius<=0.0 then return fail("entities and a positive pickup radius are required") end if
  items=[]
  for each entity in entities
    classname=field(entity,"classname");def=definition(classname)
    if def!=void then
      parsed=textnumbers.vector(field(entity,"origin"),[0.0,0.0,0.0])
      if parsed[0]==3 then items=items+[Item(strings.toLowerAscii(classname),def[0],parsed[1],def[1],def[2],def[3],true,0,def[4])] end if
    end if
  end for
  return State(items,Stats(100,0,50,"weapon_machinegun"),pickupRadius,0)
end function

/// Calls `mq3.format.bsp.entities`, `mq3.client.playable_items.fromEntities` from playable items `load`. The final path returns `fromEntities(entities,DEFAULT_PICKUP_RADIUS)`.
/// @param map map record passed to the playable items helper calls.
function load(map)
  entities=bsp.entities(map);if entities is error then return entities end if
  return fromEntities(entities,DEFAULT_PICKUP_RADIUS)
end function

/// Updates `state.stats.health`, `state.stats.armor`, `state.stats.ammo`, `state.stats.weapon` during playable items `setStats`.
/// @param state Mutable playable items record/storage; this routine assigns `state.stats.health`, `state.stats.armor`, `state.stats.ammo`, `state.stats.weapon`.
/// @param health Value assigned to `state.stats.health`.
/// @param armor Value assigned to `state.stats.armor`.
/// @param ammo Value assigned to `state.stats.ammo`.
/// @param weapon Value assigned to `state.stats.weapon`.
function setStats(state,health,armor,ammo,weapon)
  if state==void then return fail("state is required") end if
  if health<0 or armor<0 or ammo<0 then return fail("negative player stat") end if
  state.stats.health=health;if state.stats.health>HEALTH_OVERMAX_CAP then state.stats.health=HEALTH_OVERMAX_CAP end if
  state.stats.armor=armor;if state.stats.armor>ARMOR_CAP then state.stats.armor=ARMOR_CAP end if
  state.stats.ammo=ammo;if state.stats.ammo>AMMO_CAP then state.stats.ammo=AMMO_CAP end if
  state.stats.weapon=weapon
  return void
end function

/// Evaluates playable items `canTake` and returns `stats.health<item.cap`, `stats.armor<item.cap`, `stats.ammo<item.cap` and additional values according to its guard/selection conditions.
/// @param item Record read through `item.kind`, `item.cap`, `item.weapon`.
/// @param stats Record read through `stats.health`, `stats.armor`, `stats.ammo`, `stats.weapon`.
function canTake(item,stats)
  if item.kind=="health" then return stats.health<item.cap end if
  if item.kind=="armor" then return stats.armor<item.cap end if
  if item.kind=="ammo" then return stats.ammo<item.cap end if
  if item.kind=="weapon" then return stats.ammo<item.cap or stats.weapon!=item.weapon end if
  return false
end function

// The integrated preview keeps Baseq3's independent ammo pools.  The legacy
// aggregate path above remains useful to small callers and map probes.
/// @param item Record read through `item.kind`, `item.classname`.
/// @param stats Value used by `if item.kind=="health" or item.kind=="armor" then return canTake(item,stats) end if`.
/// @param inventory Value used by `amount=weaponInventory.ammoFor(inventory,def.id)`.
function canTakeInventory(item,stats,inventory)
  if item.kind=="health" or item.kind=="armor" then return canTake(item,stats) end if
  if item.kind=="ammo" then
    def=weaponInventory.ammoDefinition(item.classname);if def==void then return false end if
    amount=weaponInventory.ammoFor(inventory,def.id);if amount is error then return false end if
    return amount<weaponInventory.MAX_AMMO
  end if
  if item.kind=="weapon" then
    def=weaponInventory.weaponDefinition(item.classname);if def==void then return false end if
    amount=weaponInventory.ammoFor(inventory,def.id);if amount is error then return false end if
    return not weaponInventory.owns(inventory,def.id) or amount<weaponInventory.MAX_AMMO
  end if
  return false
end function

/// Evaluates playable items `distanceSquared` and returns `x*x+y*y+z*z` according to its guard/selection conditions.
/// @param a Sequence read at `a[0]`, `a[1]`, `a[2]`.
/// @param b Sequence read at `b[0]`, `b[1]`, `b[2]`.
function distanceSquared(a,b)
  x=a[0]-b[0];y=a[1]-b[1];z=a[2]-b[2]
  return x*x+y*y+z*z
end function

/// Calls `mq3.client.playable_items.Pickup` from playable items `take`. The final path returns `Pickup(index,item.classname,item.kind,after-before,before,after,stats.weapon)`.
/// @param state Record read through `state.items`, `state.stats`.
/// @param index Value used by `item=state.items[index]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function take(state,index,now)
  item=state.items[index];stats=state.stats
  before=0;after=0
  if item.kind=="health" then before=stats.health;stats.health=stats.health+item.amount;if stats.health>item.cap then stats.health=item.cap end if;after=stats.health
  else if item.kind=="armor" then before=stats.armor;stats.armor=stats.armor+item.amount;if stats.armor>item.cap then stats.armor=item.cap end if;after=stats.armor
  else if item.kind=="ammo" then before=stats.ammo;stats.ammo=stats.ammo+item.amount;if stats.ammo>item.cap then stats.ammo=item.cap end if;after=stats.ammo
  else if item.kind=="weapon" then before=stats.ammo;stats.ammo=stats.ammo+item.amount;if stats.ammo>item.cap then stats.ammo=item.cap end if;stats.weapon=item.weapon;after=stats.ammo
  end if
  item.active=false;item.respawnAt=now+item.respawnMs
  return Pickup(index,item.classname,item.kind,after-before,before,after,stats.weapon)
end function

/// Updates `state.lastTime` during playable items `update`.
/// @param state Mutable playable items record/storage; this routine assigns `state.lastTime`.
/// @param playerPosition Sequence whose length/content is inspected by `update`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function update(state,playerPosition,now)
  if state==void or playerPosition==void or len(playerPosition)!=3 then return fail("state and three-axis player position are required") end if
  if now<0 then return fail("negative time") end if
  state.lastTime=now;events=[];radiusSquared=state.pickupRadius*state.pickupRadius
  for index=0 to len(state.items)-1
    item=state.items[index]
    if not item.active and now>=item.respawnAt then item.active=true end if
    if item.active and distanceSquared(item.origin,playerPosition)<=radiusSquared and canTake(item,state.stats) then
      events=events+[take(state,index,now)]
    end if
  end for
  return events
end function

/// Updates `state.stats.ammo`, `state.stats.weapon` during playable items `takeInventory`.
/// @param state Mutable playable items record/storage; this routine assigns `state.stats.ammo`, `state.stats.weapon`.
/// @param index Value used by `item=state.items[index]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param inventory Record read through `inventory.selectedWeapon`.
/// @param teamMode Value used by `granted=weaponInventory.pickupWeapon(inventory,item.classname,0,false,teamMode) end if`.
function takeInventory(state,index,now,inventory,teamMode)
  item=state.items[index]
  if item.kind=="health" or item.kind=="armor" then
    picked=take(state,index,now);if picked is error then return picked end if
    selectedAmmo=weaponInventory.ammoFor(inventory,inventory.selectedWeapon);if selectedAmmo is error then return selectedAmmo end if
    state.stats.ammo=selectedAmmo
    return picked
  end if
  def=weaponInventory.weaponDefinition(item.classname)
  if item.kind=="ammo" then def=weaponInventory.ammoDefinition(item.classname) end if
  if def==void then return fail("unknown inventory item "+item.classname) end if
  before=weaponInventory.ammoFor(inventory,def.id);if before is error then return before end if
  hadWeapon=false;granted=0
  if item.kind=="ammo" then granted=weaponInventory.pickupAmmo(inventory,item.classname,0)
  else hadWeapon=weaponInventory.owns(inventory,def.id);granted=weaponInventory.pickupWeapon(inventory,item.classname,0,false,teamMode) end if
  if granted is error then return granted end if
  after=weaponInventory.ammoFor(inventory,def.id);if after is error then return after end if
  if item.kind=="weapon" and not hadWeapon then
    selected=weaponInventory.select(inventory,def.id);if not selected then return fail("could not select picked up weapon") end if
  end if
  selectedDef=weaponInventory.weaponDefinition(inventory.selectedWeapon);if selectedDef!=void then state.stats.weapon=selectedDef.classname end if
  selectedAmmo=weaponInventory.ammoFor(inventory,inventory.selectedWeapon);if selectedAmmo is error then return selectedAmmo end if
  state.stats.ammo=selectedAmmo
  item.active=false;item.respawnAt=now+item.respawnMs
  return Pickup(index,item.classname,item.kind,after-before,before,after,state.stats.weapon)
end function

/// Updates `state.lastTime` during playable items `updateInventory`.
/// @param state Mutable playable items record/storage; this routine assigns `state.lastTime`.
/// @param playerPosition Sequence whose length/content is inspected by `updateInventory`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param inventory Value used by `if state==void or playerPosition==void or len(playerPosition)!=3 or inventory==void then return fail("state, inventory and three-axis player p...`.
/// @param teamMode Value used by `picked=takeInventory(state,index,now,inventory,teamMode)`.
function updateInventory(state,playerPosition,now,inventory,teamMode)
  if state==void or playerPosition==void or len(playerPosition)!=3 or inventory==void then return fail("state, inventory and three-axis player position are required") end if
  if now<0 then return fail("negative time") end if
  state.lastTime=now;events=[];radiusSquared=state.pickupRadius*state.pickupRadius
  for index=0 to len(state.items)-1
    item=state.items[index]
    if not item.active and now>=item.respawnAt then item.active=true end if
    if item.active and distanceSquared(item.origin,playerPosition)<=radiusSquared and canTakeInventory(item,state.stats,inventory) then
      picked=takeInventory(state,index,now,inventory,teamMode);if picked is error then return picked end if
      events=events+[picked]
    end if
  end for
  return events
end function

/// Evaluates playable items `activeCount` and returns `0`, `count` according to its guard/selection conditions.
/// @param state Record read through `state.items`.
function activeCount(state)
  if state==void then return 0 end if
  count=0;for each item in state.items if item.active then count=count+1 end if end for
  return count
end function
