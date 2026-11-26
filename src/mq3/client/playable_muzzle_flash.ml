// SPDX-License-Identifier: GPL-2.0-or-later
// Retail Baseq3 muzzle-flash MD3 placement and visibility for the playable view.
package mq3.client.playable_muzzle_flash

import mq3.client.playable_item_models as itemModels
import mq3.renderer.playable_dynamic_lights as dynamicLights
import mq3.compat.numeric as numeric

const MUZZLE_FLASH_TIME=20

/// Stores playable muzzle flash definition record, including `weaponClass`, `flashClass`, `modelPath`, `continuous`, `red`, `green` and additional values.
struct Definition weaponClass flashClass modelPath continuous red green blue end struct
/// Stores playable muzzle flash rendered record, including `triangles`, `red`, `green`, `blue`.
struct Rendered triangles red green blue end struct

/// Creates the playable muzzle flash error `7610` with diagnostic text `"playable muzzle flash: "+message`.
/// @param message Argument 2 of `error`; passed as `"playable muzzle flash: "+message`.
function fail(message) return error(7610,"playable muzzle flash: "+message) end function

/// Builds the playable muzzle flash `definitions` sequence from `[ Definition("weapon_gauntlet","flash_gauntlet","models/weapons2/gauntlet/gauntlet_flash.md3",true,153,153,255), Definition("weapon_machinegun","flash_machinegun","models/weapons2/machinegun/machin...`.
function definitions()
  return [
    Definition("weapon_gauntlet","flash_gauntlet","models/weapons2/gauntlet/gauntlet_flash.md3",true,153,153,255),
    Definition("weapon_machinegun","flash_machinegun","models/weapons2/machinegun/machinegun_flash.md3",false,255,255,0),
    Definition("weapon_shotgun","flash_shotgun","models/weapons2/shotgun/shotgun_flash.md3",false,255,255,0),
    Definition("weapon_grenadelauncher","flash_grenadelauncher","models/weapons2/grenadel/grenadel_flash.md3",false,255,179,0),
    Definition("weapon_rocketlauncher","flash_rocketlauncher","models/weapons2/rocketl/rocketl_flash.md3",false,255,191,0),
    Definition("weapon_lightning","flash_lightning","models/weapons2/lightning/lightning_flash.md3",true,153,153,255),
    Definition("weapon_railgun","flash_railgun","models/weapons2/railgun/railgun_flash.md3",false,255,128,0),
    Definition("weapon_plasmagun","flash_plasmagun","models/weapons2/plasma/plasma_flash.md3",false,153,153,255),
    Definition("weapon_bfg","flash_bfg","models/weapons2/bfg/bfg_flash.md3",false,255,179,255)
  ]
end function

/// Calls `mq3.client.playable_muzzle_flash.definitions`, `stringEqualsIgnoreCaseAscii` from playable muzzle flash `definition`.
/// @param classname Value used by `for each value in definitions() if stringEqualsIgnoreCaseAscii(value.weaponClass,classname) then return value end if end for`.
function definition(classname)
  for each value in definitions() if stringEqualsIgnoreCaseAscii(value.weaponClass,classname) then return value end if end for
  return void
end function

/// Calls `mq3.client.playable_muzzle_flash.definitions` from playable muzzle flash `classnames`. The final path returns `result`.
function classnames()
  result=[];for each value in definitions() result=result+[value.flashClass] end for;return result
end function

/// Evaluates playable muzzle flash `lightColor` and returns `[0.0,0.0,0.0]`, `[0.6,0.6,1.0]`, `[1.0,0.7,0.0]` and additional values according to its guard/selection conditions.
/// @param value Record read through `value.weaponClass`.
function lightColor(value)
  if value==void then return [0.0,0.0,0.0] end if
  if value.weaponClass=="weapon_gauntlet" or value.weaponClass=="weapon_lightning" or value.weaponClass=="weapon_plasmagun" then return [0.6,0.6,1.0] end if
  if value.weaponClass=="weapon_grenadelauncher" then return [1.0,0.7,0.0] end if
  if value.weaponClass=="weapon_rocketlauncher" then return [1.0,0.75,0.0] end if
  if value.weaponClass=="weapon_railgun" then return [1.0,0.5,0.0] end if
  if value.weaponClass=="weapon_bfg" then return [1.0,0.7,1.0] end if
  return [1.0,1.0,0.0]
end function

// Baseq3 uses 300 + (rand() & 31). Keep that exact radius range while deriving
// the variation deterministically from frame time for reproducible preview runs.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function lightRadius(now)
  seed=numeric.add32(numeric.mul32(now,214013),2531011)
  return 300+((seed >> 16) & 31)
end function

// CG_AddPlayerWeapon keeps Lightning/Gauntlet flashes while EF_FIRING is set;
// all other weapons use the 20 ms MUZZLE_FLASH_TIME impulse window.
/// @param value Record read through `value.continuous`.
/// @param lastFire Value used by `elapsed=now-lastFire`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param triggerHeld Value used by `if value.continuous and triggerHeld then return true end if`.
function visible(value,lastFire,now,triggerHeld)
  if value==void or now<0 then return false end if
  if value.continuous and triggerHeld then return true end if
  elapsed=now-lastFire
  return elapsed>=0 and elapsed<=MUZZLE_FLASH_TIME
end function

/// Calls `stringEqualsIgnoreCaseAscii` from playable muzzle flash `tag`. The final path returns `value`.
/// @param model Record read through `model.tags`.
/// @param name Name used to select or register the corresponding playable muzzle flash resource.
function tag(model,name)
  if model==void or len(model.tags)==0 then return void end if
  for each value in model.tags[0] if stringEqualsIgnoreCaseAscii(value.name,name) then return value end if end for
  return void
end function

/// Evaluates playable muzzle flash `multiplyAxis` and returns `result` according to its guard/selection conditions.
/// @param left Sequence read at `left[row]`.
/// @param right Sequence read at `right[0]`, `right[1]`, `right[2]`.
function multiplyAxis(left,right)
  result=[]
  for row=0 to 2
    output=[]
    for column=0 to 2 output=output+[left[row][0]*right[0][column]+left[row][1]*right[1][column]+left[row][2]*right[2][column]] end for
    result=result+[output]
  end for
  return result
end function

// CG_PositionRotatedEntityOnTag, including the view weapon's uniform scale.
/// @param parent Record read through `parent.origin`, `parent.scale`, `parent.axis`.
/// @param attachment Record read through `attachment.origin`, `attachment.axis`.
function attachTransform(parent,attachment)
  if parent==void or attachment==void then return fail("parent transform and tag are required") end if
  local=attachment.origin
  origin=[parent.origin[0]+parent.scale*(local[0]*parent.axis[0][0]+local[1]*parent.axis[1][0]+local[2]*parent.axis[2][0]),parent.origin[1]+parent.scale*(local[0]*parent.axis[0][1]+local[1]*parent.axis[1][1]+local[2]*parent.axis[2][1]),parent.origin[2]+parent.scale*(local[0]*parent.axis[0][2]+local[1]*parent.axis[1][2]+local[2]*parent.axis[2][2])]
  return itemModels.transform(origin,multiplyAxis(attachment.axis,parent.axis),parent.scale)
end function

// Resolve the weapon's retail tag_flash independently of flash visibility so
// projectile simulation and rendering can share the exact muzzle origin.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param weaponClass Value used by `gun=itemModels.find(catalog,weaponClass)`.
/// @param gunTransform Value used by `if catalog==void or gunTransform==void then return void end if`.
function muzzleTransform(catalog,weaponClass,gunTransform)
  if catalog==void or gunTransform==void then return void end if
  gun=itemModels.find(catalog,weaponClass);if gun==void then return void end if
  flashTag=tag(gun.model,"tag_flash");if flashTag==void then return void end if
  return attachTransform(gunTransform,flashTag)
end function

/// Calls `mq3.client.playable_muzzle_flash.definition`, `mq3.client.playable_muzzle_flash.visible`, `mq3.client.playable_muzzle_flash.muzzleTransform` and additional helpers from playable muzzle flash `dynamicLight`. The final path returns `dynamicLights.Light(placed.origin,lightRadius(now),lightColor(def),false)`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param weaponClass Value used by `def=definition(weaponClass)`.
/// @param gunTransform Value used by `if def==void or not visible(def,lastFire,now,triggerHeld) or catalog==void or gunTransform==void then return void end if`.
/// @param lastFire Value used by `if def==void or not visible(def,lastFire,now,triggerHeld) or catalog==void or gunTransform==void then return void end if`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param triggerHeld Value used by `if def==void or not visible(def,lastFire,now,triggerHeld) or catalog==void or gunTransform==void then return void end if`.
function dynamicLight(catalog,weaponClass,gunTransform,lastFire,now,triggerHeld)
  def=definition(weaponClass);if def==void or not visible(def,lastFire,now,triggerHeld) or catalog==void or gunTransform==void then return void end if
  placed=muzzleTransform(catalog,weaponClass,gunTransform);if placed is error then return placed end if;if placed==void then return void end if
  return dynamicLights.Light(placed.origin,lightRadius(now),lightColor(def),false)
end function

/// Calls `mq3.client.playable_muzzle_flash.definition`, `mq3.client.playable_muzzle_flash.visible`, `mq3.client.playable_muzzle_flash.Rendered` and additional helpers from playable muzzle flash `render`. The final path returns `Rendered(triangles,def.red,def.green,def.blue)`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param weaponClass Value used by `def=definition(weaponClass)`.
/// @param gunTransform Value used by `placed=muzzleTransform(catalog,weaponClass,gunTransform)`.
/// @param lastFire Value used by `if def==void or not visible(def,lastFire,now,triggerHeld) then return Rendered([],255,255,255) end if`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param triggerHeld Value used by `if def==void or not visible(def,lastFire,now,triggerHeld) then return Rendered([],255,255,255) end if`.
/// @param maxTriangles Upper bound on emitted render triangles.
function render(catalog,weaponClass,gunTransform,lastFire,now,triggerHeld,maxTriangles)
  if maxTriangles<0 then return fail("negative triangle budget") end if
  def=definition(weaponClass);if def==void or not visible(def,lastFire,now,triggerHeld) then return Rendered([],255,255,255) end if
  if catalog==void then return Rendered([],def.red,def.green,def.blue) end if
  flash=itemModels.find(catalog,def.flashClass);if flash==void then return Rendered([],def.red,def.green,def.blue) end if
  placed=muzzleTransform(catalog,weaponClass,gunTransform);if placed is error then return placed end if;if placed==void then return Rendered([],def.red,def.green,def.blue) end if
  triangles=itemModels.renderAsset(flash,placed,maxTriangles);if triangles is error then return triangles end if
  return Rendered(triangles,def.red,def.green,def.blue)
end function
