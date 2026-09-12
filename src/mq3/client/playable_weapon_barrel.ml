// SPDX-License-Identifier: GPL-2.0-or-later
// Retail Baseq3 weapon barrel attachment and CG_MachinegunSpinAngle motion.
package mq3.client.playable_weapon_barrel

import mq3.client.playable_item_models as itemModels
import mq3.client.playable_muzzle_flash as attachmentMath
import mq3.compat.numeric as numeric
import mq3.shared.math as qmath

const SPIN_SPEED=0.9
const COAST_TIME=1000

struct Definition weaponClass barrelClass modelPath end struct
struct State angle time spinning end struct

function fail(message) return error(7630,"playable weapon barrel: "+message) end function

function definitions()
  return [
    Definition("weapon_gauntlet","barrel_gauntlet","models/weapons2/gauntlet/gauntlet_barrel.md3"),
    Definition("weapon_machinegun","barrel_machinegun","models/weapons2/machinegun/machinegun_barrel.md3"),
    Definition("weapon_bfg","barrel_bfg","models/weapons2/bfg/bfg_barrel.md3")
  ]
end function

function definition(classname)
  for each value in definitions() if stringEqualsIgnoreCaseAscii(value.weaponClass,classname) then return value end if end for
  return void
end function

function classnames() result=[];for each value in definitions() result=result+[value.barrelClass] end for;return result end function
function state() return State(0.0,0,false) end function

// Q3's AngleMod macro stores the accumulated angle through a 16-bit turn.
function angleMod(angle) return (numeric.trunc32(angle*65536.0/360.0)&65535)*(360.0/65536.0) end function

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

function rotatedTransform(parent,tag,roll)
  if parent==void or tag==void then return fail("parent transform and tag are required") end if
  attached=attachmentMath.attachTransform(parent,tag);if attached is error then return attached end if
  localAxis=qmath.AngleVectors([0.0,0.0,roll]);localAxis[1]=qmath.VectorScale(localAxis[1],-1.0)
  temp=attachmentMath.multiplyAxis(localAxis,tag.axis)
  return itemModels.transform(attached.origin,attachmentMath.multiplyAxis(temp,parent.axis),parent.scale)
end function

function render(catalog,weaponClass,gunTransform,angle,maxTriangles)
  if maxTriangles<0 then return fail("negative triangle budget") end if
  def=definition(weaponClass);if def==void or catalog==void then return [] end if
  gun=itemModels.find(catalog,weaponClass);barrel=itemModels.find(catalog,def.barrelClass)
  if gun==void or barrel==void then return [] end if
  tag=attachmentMath.tag(gun.model,"tag_barrel");if tag==void then return [] end if
  placed=rotatedTransform(gunTransform,tag,angle);if placed is error then return placed end if
  return itemModels.renderAsset(barrel,placed,maxTriangles)
end function
