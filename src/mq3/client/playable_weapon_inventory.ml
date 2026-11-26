// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3-compatible weapon ownership, ammo pickups and client weapon cycling.
package mq3.client.playable_weapon_inventory

const MAX_WEAPONS=16
const MAX_AMMO=200
const WP_NONE=0
const WP_GAUNTLET=1
const WP_MACHINEGUN=2
const WP_SHOTGUN=3
const WP_GRENADE_LAUNCHER=4
const WP_ROCKET_LAUNCHER=5
const WP_LIGHTNING=6
const WP_RAILGUN=7
const WP_PLASMAGUN=8
const WP_BFG=9
const WP_GRAPPLING_HOOK=10

/// Stores playable weapon inventory definition record, including `id`, `name`, `classname`, `ammoClassname`, `weaponQuantity`, `ammoQuantity`.
struct Definition
  id
  name
  classname
  ammoClassname
  weaponQuantity
  ammoQuantity
end struct

/// Stores playable weapon inventory inventory record, including `ownedBits`, `ammo`, `selectedWeapon`, `spawnCount`.
struct Inventory
  ownedBits
  ammo
  selectedWeapon
  spawnCount
end struct

/// Creates the playable weapon inventory error `7580` with diagnostic text `"Weapon inventory: "+message`.
/// @param message Argument 2 of `error`; passed as `"Weapon inventory: "+message`.
function fail(message) return error(7580,"Weapon inventory: "+message) end function

// Quantities and giTag relationships are the stock baseq3 bg_itemlist entries.
function definitions()
  return [
    Definition(WP_MACHINEGUN,"machinegun","weapon_machinegun","ammo_bullets",40,50),
    Definition(WP_SHOTGUN,"shotgun","weapon_shotgun","ammo_shells",10,10),
    Definition(WP_GRENADE_LAUNCHER,"grenade","weapon_grenadelauncher","ammo_grenades",10,5),
    Definition(WP_ROCKET_LAUNCHER,"rocket","weapon_rocketlauncher","ammo_rockets",10,5),
    Definition(WP_LIGHTNING,"lightning","weapon_lightning","ammo_lightning",100,60),
    Definition(WP_RAILGUN,"rail","weapon_railgun","ammo_slugs",10,10),
    Definition(WP_PLASMAGUN,"plasma","weapon_plasmagun","ammo_cells",50,30),
    Definition(WP_BFG,"bfg","weapon_bfg","ammo_bfg",20,15)
  ]
end function

/// Calls `stringEqualsIgnoreCaseAscii` from playable weapon inventory `isWeaponName`.
/// @param def Record read through `def.name`, `def.classname`, `def.id`.
/// @param name Name used to select or register the corresponding playable weapon inventory resource.
function isWeaponName(def,name)
  if typeof(name)!="string" then return false end if
  if stringEqualsIgnoreCaseAscii(def.name,name) or stringEqualsIgnoreCaseAscii(def.classname,name) then return true end if
  if def.id==WP_GRENADE_LAUNCHER and stringEqualsIgnoreCaseAscii(name,"grenadelauncher") then return true end if
  if def.id==WP_ROCKET_LAUNCHER and stringEqualsIgnoreCaseAscii(name,"rocketlauncher") then return true end if
  if def.id==WP_RAILGUN and stringEqualsIgnoreCaseAscii(name,"railgun") then return true end if
  if def.id==WP_PLASMAGUN and stringEqualsIgnoreCaseAscii(name,"plasmagun") then return true end if
  return false
end function

/// Calls `stringEqualsIgnoreCaseAscii`, `mq3.client.playable_weapon_inventory.Definition`, `mq3.client.playable_weapon_inventory.definitions` and additional helpers from playable weapon inventory `weaponDefinition`.
/// @param value Value tested by `value==WP_GAUNTLET or (typeof(value)=="string" and (stringEqualsIgnoreCaseAscii(value,"gauntlet") or stringEqualsIgnoreCaseAscii(value,"weapon_gauntlet")))`, `value==def.id or isWeaponName(def,value)` before the calculation continues.
function weaponDefinition(value)
  if value==WP_GAUNTLET or (typeof(value)=="string" and (stringEqualsIgnoreCaseAscii(value,"gauntlet") or stringEqualsIgnoreCaseAscii(value,"weapon_gauntlet"))) then
    return Definition(WP_GAUNTLET,"gauntlet","weapon_gauntlet","",0,0)
  end if
  for each def in definitions()
    if value==def.id or isWeaponName(def,value) then return def end if
  end for
  return void
end function

/// Calls `mq3.client.playable_weapon_inventory.definitions`, `stringEqualsIgnoreCaseAscii` from playable weapon inventory `ammoDefinition`. The final path returns `def`.
/// @param classname Value used by `if typeof(classname)!="string" then return void end if`.
function ammoDefinition(classname)
  if typeof(classname)!="string" then return void end if
  for each def in definitions() if stringEqualsIgnoreCaseAscii(def.ammoClassname,classname) then return def end if end for
  return void
end function

/// Computes `state!=void and typeof(state.ammo)=="array" and len(state.ammo)>=MAX_WEAPONS` for playable weapon inventory `validState`.
/// @param state Record read through `state.ammo`.
function validState(state) return state!=void and typeof(state.ammo)=="array" and len(state.ammo)>=MAX_WEAPONS end function
/// Computes `typeof(weapon)=="int" and weapon>WP_NONE and weapon<MAX_WEAPONS` for playable weapon inventory `validWeaponId`.
/// @param weapon Value used by `return typeof(weapon)=="int" and weapon>WP_NONE and weapon<MAX_WEAPONS`.
function validWeaponId(weapon) return typeof(weapon)=="int" and weapon>WP_NONE and weapon<MAX_WEAPONS end function

/// Updates `state.ownedBits`, `state.ammo[index]`, `state.ammo[WP_GAUNTLET]`, `state.ammo[WP_GRAPPLING_HOOK]` and additional values during playable weapon inventory `resetBaseLoadout`.
/// @param state Mutable playable weapon inventory record/storage; this routine assigns `state.ownedBits`, `state.ammo[index]`, `state.ammo[WP_GAUNTLET]`, `state.ammo[WP_GRAPPLING_HOOK]` and additional values.
/// @param teamMode Value used by `if teamMode then state.ammo[WP_MACHINEGUN]=50 else state.ammo[WP_MACHINEGUN]=100 end if`.
function resetBaseLoadout(state,teamMode)
  if not validState(state) then return fail("reset needs an inventory") end if
  state.ownedBits=(1<<WP_GAUNTLET)|(1<<WP_MACHINEGUN)
  for index=0 to MAX_WEAPONS-1 state.ammo[index]=0 end for
  state.ammo[WP_GAUNTLET]=-1
  state.ammo[WP_GRAPPLING_HOOK]=-1
  if teamMode then state.ammo[WP_MACHINEGUN]=50 else state.ammo[WP_MACHINEGUN]=100 end if
  state.selectedWeapon=WP_MACHINEGUN
  return state
end function

/// Calls `mq3.client.playable_weapon_inventory.Inventory`, `mq3.client.playable_weapon_inventory.resetBaseLoadout` from playable weapon inventory `create`. The final path returns `resetBaseLoadout(state,teamMode)`.
/// @param teamMode Value used by `return resetBaseLoadout(state,teamMode)`.
function create(teamMode)
  state=Inventory(0,array(MAX_WEAPONS,0),WP_MACHINEGUN,0)
  return resetBaseLoadout(state,teamMode)
end function

// Like ClientSpawn, transient weapons and ammo are reset while persistent spawn
// bookkeeping survives. The Inventory object and ammo array retain their identity.
/// @param state Mutable playable weapon inventory record/storage; this routine assigns `state.spawnCount`.
/// @param teamMode Value used by `return resetBaseLoadout(state,teamMode)`.
function respawn(state,teamMode)
  if not validState(state) then return fail("respawn needs an inventory") end if
  state.spawnCount=state.spawnCount+1
  return resetBaseLoadout(state,teamMode)
end function

/// Calls `mq3.client.playable_weapon_inventory.validState`, `mq3.client.playable_weapon_inventory.validWeaponId` from playable weapon inventory `owns`. The final path returns `(state.ownedBits&(1<<weapon))!=0`.
/// @param state Record read through `state.ownedBits`.
/// @param weapon Value used by `if not validState(state) or not validWeaponId(weapon) then return false end if`.
function owns(state,weapon)
  if not validState(state) or not validWeaponId(weapon) then return false end if
  return (state.ownedBits&(1<<weapon))!=0
end function

/// Calls `mq3.client.playable_weapon_inventory.validState`, `mq3.client.playable_weapon_inventory.validWeaponId` from playable weapon inventory `ammoFor`. The final path returns `state.ammo[weapon]`.
/// @param state Record read through `state.ammo`.
/// @param weapon Value used by `if not validState(state) or not validWeaponId(weapon) then return fail("invalid ammo query") end if`.
function ammoFor(state,weapon)
  if not validState(state) or not validWeaponId(weapon) then return fail("invalid ammo query") end if
  return state.ammo[weapon]
end function

/// Updates `state.ammo[weapon]` during playable weapon inventory `addAmmo`.
/// @param state Mutable playable weapon inventory record/storage; this routine assigns `state.ammo[weapon]`.
/// @param weapon Value used by `if not validState(state) or not validWeaponId(weapon) then return fail("invalid ammo target") end if`.
/// @param amount Value tested by `if typeof(amount)!="int"` before the calculation continues.
function addAmmo(state,weapon,amount)
  if not validState(state) or not validWeaponId(weapon) then return fail("invalid ammo target") end if
  if typeof(amount)!="int" then return fail("ammo amount must be an integer") end if
  // Negative ammo means an unlimited weapon in Baseq3 (gauntlet/grapple).
  if state.ammo[weapon]<0 then return state.ammo[weapon] end if
  state.ammo[weapon]=state.ammo[weapon]+amount
  if state.ammo[weapon]>MAX_AMMO then state.ammo[weapon]=MAX_AMMO end if
  return state.ammo[weapon]
end function

// countOverride follows g_items.c: zero uses bg_itemlist, a negative weapon
// count grants ownership without ammo, and a positive value overrides quantity.
/// @param state Mutable playable weapon inventory record/storage; this routine assigns `state.ownedBits`.
/// @param name Name used to select or register the corresponding playable weapon inventory resource.
/// @param countOverride Value used by `if typeof(countOverride)!="int" then return fail("weapon pickup count must be an integer") end if`.
/// @param dropped Value used by `if not dropped and not teamMode then`.
/// @param teamMode Value used by `if not dropped and not teamMode then`.
function pickupWeapon(state,name,countOverride,dropped,teamMode)
  if not validState(state) then return fail("weapon pickup needs an inventory") end if
  def=weaponDefinition(name);if def==void then return fail("unknown weapon pickup") end if
  if typeof(countOverride)!="int" then return fail("weapon pickup count must be an integer") end if
  quantity=def.weaponQuantity
  if countOverride<0 then quantity=0
  else
    if countOverride>0 then quantity=countOverride end if
    if not dropped and not teamMode then
      // Stock respawning weapon rule: reach its nominal quantity, or add one shot.
      if state.ammo[def.id]<quantity then quantity=quantity-state.ammo[def.id] else quantity=1 end if
    end if
  end if
  state.ownedBits=state.ownedBits|(1<<def.id)
  result=addAmmo(state,def.id,quantity);if result is error then return result end if
  return quantity
end function

/// Calls `mq3.client.playable_weapon_inventory.validState`, `mq3.client.playable_weapon_inventory.ammoDefinition`, `mq3.client.playable_weapon_inventory.addAmmo` from playable weapon inventory `pickupAmmo`. The final path returns `quantity`.
/// @param state Shared playable weapon inventory state passed to the helper calls in `pickupAmmo`.
/// @param classname Value used by `def=ammoDefinition(classname)`.
/// @param countOverride Value used by `if typeof(countOverride)!="int" then return fail("ammo pickup count must be an integer") end if`.
function pickupAmmo(state,classname,countOverride)
  if not validState(state) then return fail("ammo pickup needs an inventory") end if
  def=ammoDefinition(classname);if def==void then return fail("unknown ammo pickup") end if
  if typeof(countOverride)!="int" then return fail("ammo pickup count must be an integer") end if
  quantity=def.ammoQuantity;if countOverride!=0 then quantity=countOverride end if
  result=addAmmo(state,def.id,quantity);if result is error then return result end if
  return quantity
end function

/// Updates `state.ammo[weapon]` during playable weapon inventory `consume`.
/// @param state Mutable playable weapon inventory record/storage; this routine assigns `state.ammo[weapon]`.
/// @param weapon Value used by `if not validState(state) or not validWeaponId(weapon) or typeof(amount)!="int" or amount<0 then return fail("invalid ammo consumption") end if`.
/// @param amount Value tested by `not validState(state) or not validWeaponId(weapon) or typeof(amount)!="int" or amount<0`, `if state.ammo[weapon]<amount` before the calculation continues.
function consume(state,weapon,amount)
  if not validState(state) or not validWeaponId(weapon) or typeof(amount)!="int" or amount<0 then return fail("invalid ammo consumption") end if
  if not owns(state,weapon) then return false end if
  if state.ammo[weapon]<0 then return true end if
  if state.ammo[weapon]<amount then return false end if
  state.ammo[weapon]=state.ammo[weapon]-amount
  return true
end function

/// Calls `mq3.client.playable_weapon_inventory.owns` from playable weapon inventory `selectable`. The final path returns `state.ammo[weapon]!=0`.
/// @param state Record read through `state.ammo`.
/// @param weapon Value used by `if not owns(state,weapon) then return false end if`.
function selectable(state,weapon)
  if not owns(state,weapon) then return false end if
  return state.ammo[weapon]!=0
end function

// CG_Weapon_f allows direct selection of an owned weapon even when empty.
/// @param state Mutable playable weapon inventory record/storage; this routine assigns `state.selectedWeapon`.
/// @param weapon Value assigned to `state.selectedWeapon`.
function select(state,weapon)
  if not validState(state) or not validWeaponId(weapon) then return false end if
  if not owns(state,weapon) then return false end if
  state.selectedWeapon=weapon
  return true
end function

// Baseq3's `weapon N` command maps number keys directly to weapon ids. It
// permits selecting an owned weapon with zero ammo; the next attack produces
// EV_NOAMMO and invokes the normal fallback selection.
/// @param state Mutable playable weapon inventory record/storage; this routine assigns `state.selectedWeapon`.
/// @param digit Value assigned to `state.selectedWeapon`.
function selectDigit(state,digit)
  if typeof(digit)!="int" or digit<WP_GAUNTLET or digit>WP_BFG then return false end if
  if not validState(state) or not owns(state,digit) then return false end if
  state.selectedWeapon=digit
  return true
end function

/// Updates `state.selectedWeapon` during playable weapon inventory `cycle`.
/// @param state Mutable playable weapon inventory record/storage; this routine assigns `state.selectedWeapon`.
/// @param direction Direction vector used by the spatial calculation.
function cycle(state,direction)
  if not validState(state) then return fail("weapon cycle needs an inventory") end if
  if direction!=1 and direction!=-1 then return fail("weapon cycle direction must be -1 or 1") end if
  original=state.selectedWeapon
  candidate=original
  for index=0 to MAX_WEAPONS-1
    candidate=candidate+direction
    if candidate==MAX_WEAPONS then candidate=0 end if
    if candidate==-1 then candidate=MAX_WEAPONS-1 end if
    if candidate==WP_GAUNTLET then continue end if
    if selectable(state,candidate) then state.selectedWeapon=candidate;return candidate end if
  end for
  state.selectedWeapon=original
  return original
end function

/// Adapts `mq3.client.playable_weapon_inventory.cycle` to playable weapon inventory `nextWeapon`, returning its result for `state, 1`.
/// @param state Argument 1 of `mq3.client.playable_weapon_inventory.cycle`.
function nextWeapon(state) return cycle(state,1) end function
/// Adapts `mq3.client.playable_weapon_inventory.cycle` to playable weapon inventory `previousWeapon`, returning its result for `state, -1`.
/// @param state Argument 1 of `mq3.client.playable_weapon_inventory.cycle`.
function previousWeapon(state) return cycle(state,-1) end function

// Exact CG_OutOfAmmoChange preference: highest numbered selectable weapon,
// including the unlimited gauntlet as the final fallback.
/// @param state Mutable playable weapon inventory record/storage; this routine assigns `state.selectedWeapon`.
function outOfAmmoChange(state)
  if not validState(state) then return fail("out-of-ammo change needs an inventory") end if
  for offset=0 to MAX_WEAPONS-2
    weapon=MAX_WEAPONS-1-offset
    if selectable(state,weapon) then state.selectedWeapon=weapon;return weapon end if
  end for
  return state.selectedWeapon
end function
