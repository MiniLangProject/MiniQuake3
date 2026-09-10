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

struct Definition
  id
  name
  classname
  ammoClassname
  weaponQuantity
  ammoQuantity
end struct

struct Inventory
  ownedBits
  ammo
  selectedWeapon
  spawnCount
end struct

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

function isWeaponName(def,name)
  if typeof(name)!="string" then return false end if
  if stringEqualsIgnoreCaseAscii(def.name,name) or stringEqualsIgnoreCaseAscii(def.classname,name) then return true end if
  if def.id==WP_GRENADE_LAUNCHER and stringEqualsIgnoreCaseAscii(name,"grenadelauncher") then return true end if
  if def.id==WP_ROCKET_LAUNCHER and stringEqualsIgnoreCaseAscii(name,"rocketlauncher") then return true end if
  if def.id==WP_RAILGUN and stringEqualsIgnoreCaseAscii(name,"railgun") then return true end if
  if def.id==WP_PLASMAGUN and stringEqualsIgnoreCaseAscii(name,"plasmagun") then return true end if
  return false
end function

function weaponDefinition(value)
  if value==WP_GAUNTLET or (typeof(value)=="string" and (stringEqualsIgnoreCaseAscii(value,"gauntlet") or stringEqualsIgnoreCaseAscii(value,"weapon_gauntlet"))) then
    return Definition(WP_GAUNTLET,"gauntlet","weapon_gauntlet","",0,0)
  end if
  for each def in definitions()
    if value==def.id or isWeaponName(def,value) then return def end if
  end for
  return void
end function

function ammoDefinition(classname)
  if typeof(classname)!="string" then return void end if
  for each def in definitions() if stringEqualsIgnoreCaseAscii(def.ammoClassname,classname) then return def end if end for
  return void
end function

function validState(state) return state!=void and typeof(state.ammo)=="array" and len(state.ammo)>=MAX_WEAPONS end function
function validWeaponId(weapon) return typeof(weapon)=="int" and weapon>WP_NONE and weapon<MAX_WEAPONS end function

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

function create(teamMode)
  state=Inventory(0,array(MAX_WEAPONS,0),WP_MACHINEGUN,0)
  return resetBaseLoadout(state,teamMode)
end function

// Like ClientSpawn, transient weapons and ammo are reset while persistent spawn
// bookkeeping survives. The Inventory object and ammo array retain their identity.
function respawn(state,teamMode)
  if not validState(state) then return fail("respawn needs an inventory") end if
  state.spawnCount=state.spawnCount+1
  return resetBaseLoadout(state,teamMode)
end function

function owns(state,weapon)
  if not validState(state) or not validWeaponId(weapon) then return false end if
  return (state.ownedBits&(1<<weapon))!=0
end function

function ammoFor(state,weapon)
  if not validState(state) or not validWeaponId(weapon) then return fail("invalid ammo query") end if
  return state.ammo[weapon]
end function

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

function pickupAmmo(state,classname,countOverride)
  if not validState(state) then return fail("ammo pickup needs an inventory") end if
  def=ammoDefinition(classname);if def==void then return fail("unknown ammo pickup") end if
  if typeof(countOverride)!="int" then return fail("ammo pickup count must be an integer") end if
  quantity=def.ammoQuantity;if countOverride!=0 then quantity=countOverride end if
  result=addAmmo(state,def.id,quantity);if result is error then return result end if
  return quantity
end function

function consume(state,weapon,amount)
  if not validState(state) or not validWeaponId(weapon) or typeof(amount)!="int" or amount<0 then return fail("invalid ammo consumption") end if
  if not owns(state,weapon) then return false end if
  if state.ammo[weapon]<0 then return true end if
  if state.ammo[weapon]<amount then return false end if
  state.ammo[weapon]=state.ammo[weapon]-amount
  return true
end function

function selectable(state,weapon)
  if not owns(state,weapon) then return false end if
  return state.ammo[weapon]!=0
end function

// CG_Weapon_f allows direct selection of an owned weapon even when empty.
function select(state,weapon)
  if not validState(state) or not validWeaponId(weapon) then return false end if
  if not owns(state,weapon) then return false end if
  state.selectedWeapon=weapon
  return true
end function

// Baseq3's `weapon N` command maps number keys directly to weapon ids. It
// permits selecting an owned weapon with zero ammo; the next attack produces
// EV_NOAMMO and invokes the normal fallback selection.
function selectDigit(state,digit)
  if typeof(digit)!="int" or digit<WP_GAUNTLET or digit>WP_BFG then return false end if
  if not validState(state) or not owns(state,digit) then return false end if
  state.selectedWeapon=digit
  return true
end function

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

function nextWeapon(state) return cycle(state,1) end function
function previousWeapon(state) return cycle(state,-1) end function

// Exact CG_OutOfAmmoChange preference: highest numbered selectable weapon,
// including the unlimited gauntlet as the final fallback.
function outOfAmmoChange(state)
  if not validState(state) then return fail("out-of-ammo change needs an inventory") end if
  for offset=0 to MAX_WEAPONS-2
    weapon=MAX_WEAPONS-1-offset
    if selectable(state,weapon) then state.selectedWeapon=weapon;return weapon end if
  end for
  return state.selectedWeapon
end function
