// SPDX-License-Identifier: GPL-2.0-or-later
// Local player health, armor, death and spawn cycle for the playable preview.
package mq3.client.playable_player

import mq3.format.bsp as bsp
import mq3.compat.textnumbers as textnumbers
import std.string as strings

/// Rounds a floating-point value upward to the nearest integral value using the Windows C runtime. This binding is used by playable player.
/// @param value Floating-point argument passed to the native mathematical function.
/// @returns The smallest integral-valued double greater than or equal to the argument.
extern function ceil(value as double) from "ucrtbase.dll" returns double

/// Fallback health setting used when constructing the native client simulation or effect configuration.
const DEFAULT_HEALTH=100
/// Fallback armor setting used when constructing the native client simulation or effect configuration.
const DEFAULT_ARMOR=0
/// Fallback ammo setting used when constructing the native client simulation or effect configuration.
const DEFAULT_AMMO=50
/// Fallback weapon setting used when constructing the native client simulation or effect configuration.
const DEFAULT_WEAPON="weapon_machinegun"
/// Default respawn duration in milliseconds when the caller supplies no override.
const DEFAULT_RESPAWN_MILLISECONDS=1700
/// Default invulnerability duration in milliseconds when the caller supplies no override.
const DEFAULT_INVULNERABILITY_MILLISECONDS=1000
/// Vertical camera offset above the player origin in the native preview.
const CAMERA_EYE_HEIGHT=48.0

/// Stores playable player spawn record, including `origin`, `yaw`.
struct Spawn
  /// World-space spawn position copied into the player's state when selecting a spawn point.
  origin
  /// When constructing this record, `collectSpawns` supplies `yaw` for this member.
  yaw
end struct
/// Stores playable player state, including `spawns`, `spawnIndex`, `position`, `yaw`, `health`, `maxHealth` and additional values.
struct State
  /// When constructing this record, `fromEntities` supplies `spawns` for this member. Used by
  /// `pollRespawn` during subsequent processing.
  spawns
  /// When constructing this record, `fromEntities` supplies `0` for this member.
  spawnIndex
  /// When constructing this record, `fromEntities` supplies
  /// `[first.origin[0],first.origin[1],first.origin[2]]` for this member.
  position
  /// When constructing this record, `fromEntities` supplies `first.yaw` for this member.
  yaw
  /// Current local-player health governing damage, death, and respawn in the playable preview.
  health
  /// When constructing this record, `fromEntities` supplies `DEFAULT_HEALTH` for this member. Used by
  /// `setStats` and `pollRespawn` during subsequent processing.
  maxHealth
  /// Current local-player armor available to absorb incoming preview damage.
  armor
  /// Ammunition quantity or ammunition state associated with the selected weapon.
  ammo
  /// Weapon classname restored and tracked with the local preview player loadout.
  weapon
  /// True while the simulated player or target remains alive and can participate in gameplay.
  alive
  /// When constructing this record, `fromEntities` supplies `0` for this member. Used by `applyDamage`
  /// during subsequent processing.
  deaths
  /// Client simulation timestamp at which the entity becomes eligible to respawn.
  respawnAt
  /// When constructing this record, `fromEntities` supplies `0` for this member.
  invulnerableUntil
  /// When constructing this record, `fromEntities` supplies `DEFAULT_RESPAWN_MILLISECONDS` for this
  /// member. Used by `configure` and `applyDamage` during subsequent processing.
  respawnMilliseconds
  /// When constructing this record, `fromEntities` supplies `DEFAULT_INVULNERABILITY_MILLISECONDS` for
  /// this member. Used by `configure` and `pollRespawn` during subsequent processing.
  invulnerabilityMilliseconds
end struct
/// Stores playable player damage record, including `requested`, `saved`, `taken`, `killed`, `ignored`, `health` and additional values.
struct Damage
  /// When constructing this record, `applyDamage` supplies `0` for this member.
  requested
  /// When constructing this record, `applyDamage` supplies `0` for this member.
  saved
  /// When constructing this record, `applyDamage` supplies `0` for this member.
  taken
  /// When constructing this record, `applyDamage` supplies `false` for this member.
  killed
  /// When constructing this record, `applyDamage` supplies `false` for this member.
  ignored
  /// Player health remaining after this damage attempt, including an ignored or invulnerable hit.
  health
  /// Player armor remaining after armor absorption for this damage attempt.
  armor
end struct
/// Stores playable player respawn record, including `respawned`, `spawnIndex`, `position`, `yaw`, `invulnerableUntil`.
struct Respawn
  /// When constructing this record, `pollRespawn` supplies `false` for this member.
  respawned
  /// When constructing this record, `pollRespawn` supplies `state.spawnIndex` for this member.
  spawnIndex
  /// When constructing this record, `pollRespawn` supplies `state.position` for this member.
  position
  /// When constructing this record, `pollRespawn` supplies `state.yaw` for this member.
  yaw
  /// When constructing this record, `pollRespawn` supplies `state.invulnerableUntil` for this member.
  invulnerableUntil
end struct

/// Creates the playable player error `7540` with diagnostic text `"preview player: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview player: "+message`.
function fail(message) return error(7540,"preview player: "+message) end function

/// Calls `std.string.toLowerAscii` from playable player `field`. The final path returns `""`.
/// @param fields Value used by `for each pair in fields`.
/// @param key Key or control identifier used to select the corresponding playable player entry.
function field(fields,key)
  wanted=strings.toLowerAscii(key)
  for each pair in fields
    if len(pair)>=2 and strings.toLowerAscii(pair[0])==wanted then return pair[1] end if
  end for
  return ""
end function

/// Calls `std.string.toLowerAscii`, `mq3.client.playable_player.field`, `mq3.compat.textnumbers.vector` and additional helpers from playable player `collectSpawns`. The final path returns `result`.
/// @param entities Value used by `for each entity in entities`.
/// @param classname Value used by `wanted=strings.toLowerAscii(classname)`.
function collectSpawns(entities,classname)
  result=[];wanted=strings.toLowerAscii(classname)
  for each entity in entities
    if strings.toLowerAscii(field(entity,"classname"))==wanted then
      parsed=textnumbers.vector(field(entity,"origin"),[0.0,0.0,0.0])
      if parsed[0]==3 then
        origin=[parsed[1][0],parsed[1][1],parsed[1][2]+CAMERA_EYE_HEIGHT]
        angle=field(entity,"angle");yaw=0.0;if angle!="" then yaw=textnumbers.atof32(angle) end if
        result=result+[Spawn(origin,yaw)]
      end if
    end if
  end for
  return result
end function

/// Calls `mq3.client.playable_player.collectSpawns`, `mq3.client.playable_player.Spawn`, `mq3.client.playable_player.State` from playable player `fromEntities`.
/// @param entities Value used by `if entities==void then return fail("entities are required") end if`.
function fromEntities(entities)
  if entities==void then return fail("entities are required") end if
  spawns=collectSpawns(entities,"info_player_deathmatch")
  if len(spawns)==0 then spawns=collectSpawns(entities,"info_player_start") end if
  if len(spawns)==0 then spawns=[Spawn([0.0,0.0,64.0],0.0)] end if
  first=spawns[0]
  return State(spawns,0,[first.origin[0],first.origin[1],first.origin[2]],first.yaw,DEFAULT_HEALTH,DEFAULT_HEALTH,DEFAULT_ARMOR,DEFAULT_AMMO,DEFAULT_WEAPON,true,0,0,0,DEFAULT_RESPAWN_MILLISECONDS,DEFAULT_INVULNERABILITY_MILLISECONDS)
end function

/// Calls `mq3.format.bsp.entities`, `mq3.client.playable_player.fromEntities` from playable player `load`. The final path returns `fromEntities(entities)`.
/// @param map map record passed to the playable player helper calls.
function load(map)
  entities=bsp.entities(map);if entities is error then return entities end if
  return fromEntities(entities)
end function

/// Updates `state.respawnMilliseconds`, `state.invulnerabilityMilliseconds` during playable player `configure`.
/// @param state Mutable playable player record/storage; this routine assigns `state.respawnMilliseconds`, `state.invulnerabilityMilliseconds`.
/// @param respawnMilliseconds Value assigned to `state.respawnMilliseconds`.
/// @param invulnerabilityMilliseconds Value assigned to `state.invulnerabilityMilliseconds`.
function configure(state,respawnMilliseconds,invulnerabilityMilliseconds)
  if state==void or respawnMilliseconds<0 or invulnerabilityMilliseconds<0 then return fail("state and non-negative timings are required") end if
  state.respawnMilliseconds=respawnMilliseconds;state.invulnerabilityMilliseconds=invulnerabilityMilliseconds
  return void
end function

/// Updates `state.health`, `state.maxHealth`, `state.armor`, `state.ammo` and additional values during playable player `setStats`.
/// @param state Mutable playable player record/storage; this routine assigns `state.health`, `state.maxHealth`, `state.armor`, `state.ammo` and additional values.
/// @param health Value assigned to `state.health`, `state.maxHealth`, `state.alive`.
/// @param armor Value assigned to `state.armor`.
/// @param ammo Value assigned to `state.ammo`.
/// @param weapon Value assigned to `state.weapon`.
function setStats(state,health,armor,ammo,weapon)
  if state==void or health<0 or armor<0 or ammo<0 then return fail("state and non-negative stats are required") end if
  state.health=health;state.maxHealth=health;if state.maxHealth<1 then state.maxHealth=DEFAULT_HEALTH end if
  state.armor=armor;state.ammo=ammo;state.weapon=weapon;state.alive=health>0
  return void
end function

// Mirrors baseq3 CheckArmor: ceil(damage * 0.66), capped by available armor.
/// @param armor Value used by `if armor<=0 or damage<=0 then return 0 end if`.
/// @param damage Value used by `if armor<=0 or damage<=0 then return 0 end if`.
function armorSave(armor,damage)
  if armor<=0 or damage<=0 then return 0 end if
  saved=textnumbers.truncDouble32(ceil(damage*0.66));if saved>armor then saved=armor end if
  return saved
end function

/// Updates `state.armor`, `state.health`, `state.alive`, `state.deaths` and additional values during playable player `applyDamage`.
/// @param state Mutable playable player record/storage; this routine assigns `state.armor`, `state.health`, `state.alive`, `state.deaths` and additional values.
/// @param amount Value tested by `state==void or amount<0 or now<0`, `if amount==0` before the calculation continues.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param bypassArmor Value used by `if not bypassArmor then saved=armorSave(state.armor,amount) end if`.
function applyDamage(state,amount,now,bypassArmor)
  if state==void or amount<0 or now<0 then return fail("state, non-negative damage and time are required") end if
  if amount==0 then return Damage(0,0,0,false,false,state.health,state.armor) end if
  if not state.alive or now<state.invulnerableUntil then return Damage(amount,0,0,false,true,state.health,state.armor) end if
  saved=0;if not bypassArmor then saved=armorSave(state.armor,amount) end if
  state.armor=state.armor-saved;taken=amount-saved;if taken>state.health then taken=state.health end if
  state.health=state.health-taken;killed=false
  if state.health<=0 then
    state.health=0;state.alive=false;state.deaths=state.deaths+1;state.respawnAt=now+state.respawnMilliseconds;state.invulnerableUntil=0;killed=true
  end if
  return Damage(amount,saved,taken,killed,false,state.health,state.armor)
end function

/// Adapts `mq3.client.playable_player.applyDamage` to playable player `applyNormalDamage`, returning its result for `state, amount, now, false`.
/// @param state Argument 1 of `mq3.client.playable_player.applyDamage`.
/// @param amount Argument 2 of `mq3.client.playable_player.applyDamage`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_player.applyDamage`.
function applyNormalDamage(state,amount,now) return applyDamage(state,amount,now,false) end function

/// Updates `state.spawnIndex`, `state.position`, `state.yaw`, `state.health` and additional values during playable player `pollRespawn`.
/// @param state Mutable playable player record/storage; this routine assigns `state.spawnIndex`, `state.position`, `state.yaw`, `state.health` and additional values.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function pollRespawn(state,now)
  if state==void or now<0 then return fail("state and non-negative time are required") end if
  if state.alive or now<state.respawnAt then return Respawn(false,state.spawnIndex,state.position,state.yaw,state.invulnerableUntil) end if
  state.spawnIndex=(state.spawnIndex+1)%len(state.spawns);spawn=state.spawns[state.spawnIndex]
  state.position=[spawn.origin[0],spawn.origin[1],spawn.origin[2]];state.yaw=spawn.yaw
  state.health=DEFAULT_HEALTH;state.maxHealth=DEFAULT_HEALTH;state.armor=DEFAULT_ARMOR;state.ammo=DEFAULT_AMMO;state.weapon=DEFAULT_WEAPON
  state.alive=true;state.respawnAt=0;state.invulnerableUntil=now+state.invulnerabilityMilliseconds
  return Respawn(true,state.spawnIndex,state.position,state.yaw,state.invulnerableUntil)
end function
