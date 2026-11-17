// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Shared BG trajectories and item contact geometry from bg_misc.c.
package mq3.game.trajectory
import mq3.compat.numeric as n
import mq3.compat.transcendental as crt
import mq3.shared.math as q
import mq3.game.movement as movement
struct Trajectory
  trType
  trTime
  trDuration
  trBase
  trDelta
end struct
function phaseAngle(tr,atTime)
  if tr.trDuration == 0 then return error(481,"Sine trajectory requires a nonzero duration") end if
  delta = n.fdiv(n.i32(atTime-tr.trTime),tr.trDuration)
  return n.fmul(n.fmul(delta,n.f32(3.14159265358979323846)),2.0)
end function
// Keep small numeric dispatch explicit: the published 1.3.9 compiler can
// retain a switch jump table after discarding an unused trajectory function.
// These branches preserve the original ordering and float operations.
function evaluate(tr,atTime)
  kind=tr.trType
  if kind==0 or kind==1 then
    return movement.copy(tr.trBase)
  end if
  if kind==2 then
    return q.VectorMA(tr.trBase,n.f32(n.i32(atTime-tr.trTime)*0.001),tr.trDelta)
  end if
  if kind==3 then
    endTime = n.add32(tr.trTime,tr.trDuration)
    if atTime > endTime then atTime = endTime end if
    delta = n.f32(n.i32(atTime-tr.trTime)*0.001)
    if delta < 0 then delta = 0.0 end if
    return q.VectorMA(tr.trBase,delta,tr.trDelta)
  end if
  if kind==4 then
    return q.VectorMA(tr.trBase,n.f32(crt.sin(phaseAngle(tr,atTime))),tr.trDelta)
  end if
  if kind==5 then
    delta = n.f32(n.i32(atTime-tr.trTime)*0.001)
    result = q.VectorMA(tr.trBase,delta,tr.trDelta)
    result[2] = n.f32(result[2]-0.5*800*delta*delta)
    return result
  end if
  return error(481,"Unknown trajectory type")
end function
function evaluateDelta(tr,atTime)
  kind=tr.trType
  if kind==0 or kind==1 then
    return [0.0,0.0,0.0]
  end if
  if kind==2 then
    return movement.copy(tr.trDelta)
  end if
  if kind==3 then
    if atTime > n.add32(tr.trTime,tr.trDuration) then return [0.0,0.0,0.0] end if
    return movement.copy(tr.trDelta)
  end if
  if kind==4 then
    phase = n.f32(n.f32(crt.cos(phaseAngle(tr,atTime)))*0.5)
    return q.VectorScale(tr.trDelta,phase)
  end if
  if kind==5 then
    delta = n.f32(n.i32(atTime-tr.trTime)*0.001); result = movement.copy(tr.trDelta)
    result[2] = n.fsub(result[2],n.fmul(800,delta)); return result
  end if
  return error(481,"Unknown trajectory type")
end function
function playerTouchesItem(ps,trajectory,atTime)
  origin = evaluate(trajectory,atTime)
  x = n.fsub(ps.origin[0],origin[0]); y = n.fsub(ps.origin[1],origin[1]); z = n.fsub(ps.origin[2],origin[2])
  return x <= 44 and x >= -50 and y <= 36 and y >= -36 and z <= 36 and z >= -36
end function
