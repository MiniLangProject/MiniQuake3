// SPDX-License-Identifier: GPL-2.0-or-later
// Local player health, armor, death and spawn cycle for the playable preview.
package mq3.client.playable_player

import mq3.format.bsp as bsp
import mq3.compat.textnumbers as textnumbers
import std.string as strings

extern function ceil(value as double) from "ucrtbase.dll" returns double

const DEFAULT_HEALTH=100
const DEFAULT_ARMOR=0
const DEFAULT_AMMO=50
const DEFAULT_WEAPON="weapon_machinegun"
const DEFAULT_RESPAWN_MILLISECONDS=1700
const DEFAULT_INVULNERABILITY_MILLISECONDS=1000
const CAMERA_EYE_HEIGHT=48.0

struct Spawn origin yaw end struct
struct State spawns spawnIndex position yaw health maxHealth armor ammo weapon alive deaths respawnAt invulnerableUntil respawnMilliseconds invulnerabilityMilliseconds end struct
struct Damage requested saved taken killed ignored health armor end struct
struct Respawn respawned spawnIndex position yaw invulnerableUntil end struct

function fail(message) return error(7540,"preview player: "+message) end function

function field(fields,key)
  wanted=strings.toLowerAscii(key)
  for each pair in fields
    if len(pair)>=2 and strings.toLowerAscii(pair[0])==wanted then return pair[1] end if
  end for
  return ""
end function

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

function fromEntities(entities)
  if entities==void then return fail("entities are required") end if
  spawns=collectSpawns(entities,"info_player_deathmatch")
  if len(spawns)==0 then spawns=collectSpawns(entities,"info_player_start") end if
  if len(spawns)==0 then spawns=[Spawn([0.0,0.0,64.0],0.0)] end if
  first=spawns[0]
  return State(spawns,0,[first.origin[0],first.origin[1],first.origin[2]],first.yaw,DEFAULT_HEALTH,DEFAULT_HEALTH,DEFAULT_ARMOR,DEFAULT_AMMO,DEFAULT_WEAPON,true,0,0,0,DEFAULT_RESPAWN_MILLISECONDS,DEFAULT_INVULNERABILITY_MILLISECONDS)
end function

function load(map)
  entities=bsp.entities(map);if entities is error then return entities end if
  return fromEntities(entities)
end function

function configure(state,respawnMilliseconds,invulnerabilityMilliseconds)
  if state==void or respawnMilliseconds<0 or invulnerabilityMilliseconds<0 then return fail("state and non-negative timings are required") end if
  state.respawnMilliseconds=respawnMilliseconds;state.invulnerabilityMilliseconds=invulnerabilityMilliseconds
  return void
end function

function setStats(state,health,armor,ammo,weapon)
  if state==void or health<0 or armor<0 or ammo<0 then return fail("state and non-negative stats are required") end if
  state.health=health;state.maxHealth=health;if state.maxHealth<1 then state.maxHealth=DEFAULT_HEALTH end if
  state.armor=armor;state.ammo=ammo;state.weapon=weapon;state.alive=health>0
  return void
end function

// Mirrors baseq3 CheckArmor: ceil(damage * 0.66), capped by available armor.
function armorSave(armor,damage)
  if armor<=0 or damage<=0 then return 0 end if
  saved=textnumbers.truncDouble32(ceil(damage*0.66));if saved>armor then saved=armor end if
  return saved
end function

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

function applyNormalDamage(state,amount,now) return applyDamage(state,amount,now,false) end function

function pollRespawn(state,now)
  if state==void or now<0 then return fail("state and non-negative time are required") end if
  if state.alive or now<state.respawnAt then return Respawn(false,state.spawnIndex,state.position,state.yaw,state.invulnerableUntil) end if
  state.spawnIndex=(state.spawnIndex+1)%len(state.spawns);spawn=state.spawns[state.spawnIndex]
  state.position=[spawn.origin[0],spawn.origin[1],spawn.origin[2]];state.yaw=spawn.yaw
  state.health=DEFAULT_HEALTH;state.maxHealth=DEFAULT_HEALTH;state.armor=DEFAULT_ARMOR;state.ammo=DEFAULT_AMMO;state.weapon=DEFAULT_WEAPON
  state.alive=true;state.respawnAt=0;state.invulnerableUntil=now+state.invulnerabilityMilliseconds
  return Respawn(true,state.spawnIndex,state.position,state.yaw,state.invulnerableUntil)
end function
