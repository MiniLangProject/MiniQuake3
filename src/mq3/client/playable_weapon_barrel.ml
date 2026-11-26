// SPDX-License-Identifier: GPL-2.0-or-later
// Retail Baseq3 weapon barrel attachment and CG_MachinegunSpinAngle motion.
package mq3.client.playable_weapon_barrel

import mq3.client.playable_item_models as itemModels
import mq3.client.playable_muzzle_flash as attachmentMath
import mq3.compat.numeric as numeric
import mq3.shared.math as qmath

/// Firing-state weapon-barrel rotation rate in degrees per millisecond.
const SPIN_SPEED=0.9
/// Duration in milliseconds over which the weapon barrel coasts after firing stops.
const COAST_TIME=1000

/// Stores playable weapon barrel definition record, including `weaponClass`, `barrelClass`, `modelPath`.
struct Definition
  /// When constructing this record, `definitions` supplies `"weapon_gauntlet"` for this member.
  weaponClass
  /// When constructing this record, `definitions` supplies `"barrel_gauntlet"` for this member.
  barrelClass
  /// Virtual path used to load the model resource for this client presentation.
  modelPath
end struct
/// Stores playable weapon barrel state, including `angle`, `time`, `spinning`.
struct State
  /// When constructing this record, `state` supplies `0.0` for this member.
  angle
  /// Timestamp in milliseconds of the last transition between spinning and coasting, anchoring the
  /// stored barrel angle.
  time
  /// When constructing this record, `state` supplies `false` for this member.
  spinning
end struct

/// Creates the playable weapon barrel error `7630` with diagnostic text `"playable weapon barrel: "+message`.
/// @param message Argument 2 of `error`; passed as `"playable weapon barrel: "+message`.
function fail(message) return error(7630,"playable weapon barrel: "+message) end function

/// Builds the playable weapon barrel `definitions` sequence from `[ Definition("weapon_gauntlet","barrel_gauntlet","models/weapons2/gauntlet/gauntlet_barrel.md3"), Definition("weapon_machinegun","barrel_machinegun","models/weapons2/machinegun/machinegun_barrel.md...`.
function definitions()
  return [
    Definition("weapon_gauntlet","barrel_gauntlet","models/weapons2/gauntlet/gauntlet_barrel.md3"),
    Definition("weapon_machinegun","barrel_machinegun","models/weapons2/machinegun/machinegun_barrel.md3"),
    Definition("weapon_bfg","barrel_bfg","models/weapons2/bfg/bfg_barrel.md3")
  ]
end function

/// Calls `mq3.client.playable_weapon_barrel.definitions`, `stringEqualsIgnoreCaseAscii` from playable weapon barrel `definition`.
/// @param classname Value used by `for each value in definitions() if stringEqualsIgnoreCaseAscii(value.weaponClass,classname) then return value end if end for`.
function definition(classname)
  for each value in definitions() if stringEqualsIgnoreCaseAscii(value.weaponClass,classname) then return value end if end for
  return void
end function

/// Calls `mq3.client.playable_weapon_barrel.definitions` from playable weapon barrel `classnames`. The final path returns `result`.
function classnames() result=[];for each value in definitions() result=result+[value.barrelClass] end for;return result end function
/// Creates a `mq3.client.playable_weapon_barrel.State` record. Initializes the record with the defaults written in this constructor.
function state() return State(0.0,0,false) end function

// Q3's AngleMod macro stores the accumulated angle through a 16-bit turn.
/// @param angle Value used by `return (numeric.trunc32(angle*65536.0/360.0)&65535)*(360.0/65536.0)`.
function angleMod(angle) return (numeric.trunc32(angle*65536.0/360.0)&65535)*(360.0/65536.0) end function

/// Updates `value.time`, `value.angle`, `value.spinning` during playable weapon barrel `advance`.
/// @param value Mutable playable weapon barrel record/storage; this routine assigns `value.time`, `value.angle`, `value.spinning`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param firing Value assigned to `value.spinning`.
function advance(value,now,firing)
  if value==void or now<0 then return fail("state and non-negative time are required") end if
  delta=now-value.time;if delta<0 then return fail("time moved backwards") end if
  angle=value.angle
  if value.spinning then angle=value.angle+delta*SPIN_SPEED
  else
    if delta>COAST_TIME then delta=COAST_TIME end if
    speed=0.5*(SPIN_SPEED+(COAST_TIME-delta)/COAST_TIME)
    angle=value.angle+delta*speed
  end if
  if value.spinning==(not firing) then
    value.time=now;value.angle=angleMod(angle);value.spinning=firing
  end if
  return angle
end function

/// Calls `mq3.client.playable_muzzle_flash.attachTransform`, `mq3.shared.math.AngleVectors`, `mq3.shared.math.VectorScale` and additional helpers from playable weapon barrel `rotatedTransform`. The final path returns `itemModels.transform(attached.origin,attachmentMath.multiplyAxis(temp,parent.axis),parent.scale)`.
/// @param parent Record read through `parent.axis`, `parent.scale`.
/// @param tag Record read through `tag.axis`.
/// @param roll Value used by `localAxis=qmath.AngleVectors([0.0,0.0,roll])`.
function rotatedTransform(parent,tag,roll)
  if parent==void or tag==void then return fail("parent transform and tag are required") end if
  attached=attachmentMath.attachTransform(parent,tag);if attached is error then return attached end if
  localAxis=qmath.AngleVectors([0.0,0.0,roll]);localAxis[1]=qmath.VectorScale(localAxis[1],-1.0)
  temp=attachmentMath.multiplyAxis(localAxis,tag.axis)
  return itemModels.transform(attached.origin,attachmentMath.multiplyAxis(temp,parent.axis),parent.scale)
end function

/// Calls `mq3.client.playable_weapon_barrel.definition`, `mq3.client.playable_item_models.find`, `mq3.client.playable_muzzle_flash.tag` and additional helpers from playable weapon barrel `render`. The final path returns `itemModels.renderAsset(barrel,placed,maxTriangles)`.
/// @param catalog Asset catalog used to resolve names to loaded resources.
/// @param weaponClass Value used by `def=definition(weaponClass)`.
/// @param gunTransform Value used by `placed=rotatedTransform(gunTransform,tag,angle)`.
/// @param angle Value used by `placed=rotatedTransform(gunTransform,tag,angle)`.
/// @param maxTriangles Upper bound on emitted render triangles.
function render(catalog,weaponClass,gunTransform,angle,maxTriangles)
  if maxTriangles<0 then return fail("negative triangle budget") end if
  def=definition(weaponClass);if def==void or catalog==void then return [] end if
  gun=itemModels.find(catalog,weaponClass);barrel=itemModels.find(catalog,def.barrelClass)
  if gun==void or barrel==void then return [] end if
  tag=attachmentMath.tag(gun.model,"tag_barrel");if tag==void then return [] end if
  placed=rotatedTransform(gunTransform,tag,angle);if placed is error then return placed end if
  return itemModels.renderAsset(barrel,placed,maxTriangles)
end function
