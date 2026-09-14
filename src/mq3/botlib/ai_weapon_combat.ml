// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BotChooseBestFightWeapon and weaponinfo_t encoding from be_ai_weap.c/h.
package mq3.botlib.ai_weapon_combat

import mq3.botlib.ai_item_weights as fuzzy
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_weapon_weights as weapons
import mq3.compat.numeric as n

const OP_CHOOSE_BEST_FIGHT_WEAPON=558
const OP_GET_WEAPON_INFO=559
const STRING_FIELD_SIZE=80
const PROJECTILE_INFO_SIZE=208
const WEAPON_INFO_SIZE=552

function fail(message) return error(7597,"AI weapon combat: "+message) end function

function chooseBestFightWeapon(runtime,statePools,handle,inventory)
  state=pools.weaponState(statePools,handle)
  if state==void or runtime==void or runtime.config==void or runtime.config is error or state.weaponWeightConfig==void or state.weaponWeightIndex==void then return 0 end if
  bestWeight=0.0;bestWeapon=0
  for index=0 to len(runtime.config.weapons)-1
    weapon=runtime.config.weapons[index]
    if weapon.valid and index<len(state.weaponWeightIndex) then
      weightIndex=state.weaponWeightIndex[index]
      if weightIndex>=0 then
        weight=fuzzy.fuzzyWeight(inventory,state.weaponWeightConfig,weightIndex)
        if weight>bestWeight then bestWeight=weight;bestWeapon=index end if
      end if
    end if
  end for
  return bestWeapon
end function

function weaponInfo(runtime,statePools,handle,number)
  if pools.weaponState(statePools,handle)==void or runtime==void or runtime.config==void or runtime.config is error then return void end if
  // Retail weapon numbers start at one; entry zero is deliberately invalid.
  if number<=0 or number>=len(runtime.config.weapons) then return void end if
  return runtime.config.weapons[number]
end function

function putI32(output,offset,value) n.writeU32(output,offset,n.i32(value));return void end function
function putF32(output,offset,value) n.writeU32(output,offset,n.floatBits(value));return void end function
function putVector(output,offset,value) for axis=0 to 2 putF32(output,offset+axis*4,value[axis]) end for;return void end function
function putString(output,offset,value)
  if typeof(value)!="string" then return fail("weapon string field is not text") end if
  data=bytes(value);count=len(data);if count>=STRING_FIELD_SIZE then count=STRING_FIELD_SIZE-1 end if
  if count>0 then copyBytes(output,offset,data,0,count) end if;output[offset+count]=0;return void
end function

function encodeProjectile(output,offset,value)
  if value==void then value=weapons.emptyProjectile() end if
  putString(output,offset,value.name);putString(output,offset+80,value.model)
  putI32(output,offset+160,value.flags);putF32(output,offset+164,value.gravity);putI32(output,offset+168,value.damage);putF32(output,offset+172,value.radius)
  putI32(output,offset+176,value.visibleDamage);putI32(output,offset+180,value.damageType);putI32(output,offset+184,value.healthIncrease)
  putF32(output,offset+188,value.push);putF32(output,offset+192,value.detonation);putF32(output,offset+196,value.bounce);putF32(output,offset+200,value.bounceFriction);putF32(output,offset+204,value.bounceStop)
  return void
end function

function encodeWeaponInfo(value)
  if value==void then return fail("missing weapon info") end if
  output=bytes(WEAPON_INFO_SIZE,0)
  if value.valid then putI32(output,0,1) end if;putI32(output,4,value.number);putString(output,8,value.name);putString(output,88,value.model)
  putI32(output,168,value.level);putI32(output,172,value.weaponIndex);putI32(output,176,value.flags);putString(output,180,value.projectileName)
  putI32(output,260,value.numProjectiles);putF32(output,264,value.horizontalSpread);putF32(output,268,value.verticalSpread);putF32(output,272,value.speed);putF32(output,276,value.acceleration)
  putVector(output,280,value.recoil);putVector(output,292,value.offset);putVector(output,304,value.angleOffset);putF32(output,316,value.extraZVelocity)
  putI32(output,320,value.ammoAmount);putI32(output,324,value.ammoIndex);putF32(output,328,value.activate);putF32(output,332,value.reload);putF32(output,336,value.spinup);putF32(output,340,value.spindown)
  encoded=encodeProjectile(output,344,value.projectile);if encoded is error then return encoded end if;return output
end function
