// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Shared BG trajectories and item contact geometry from bg_misc.c.
package mq3.game.trajectory
import mq3.compat.numeric as n
import mq3.compat.transcendental as crt
import mq3.shared.math as q
import mq3.game.movement as movement
/// `Trajectory` record for trajectory, containing `trType`, `trTime`, `trDuration`, `trBase` and `trDelta`.
struct Trajectory
  /// Trajectory evaluation mode, selected from the TR_* constants.
  trType
  /// Game time in milliseconds at which the trajectory starts.
  trTime
  /// Trajectory duration or sinusoidal period in milliseconds.
  trDuration
  /// Base position or angle vector from which the trajectory is evaluated.
  trBase
  /// Trajectory velocity or amplitude vector, interpreted according to trType.
  trDelta
end struct
/// Calculate the sine-trajectory phase in radians at the supplied game time; reject a zero trajectory duration.
/// @param tr Trajectory record containing the start time and nonzero duration in milliseconds.
/// @param atTime Game time in milliseconds at which the trajectory is evaluated.
function phaseAngle(tr,atTime)
  if tr.trDuration == 0 then return error(481,"Sine trajectory requires a nonzero duration") end if
  delta = n.fdiv(n.i32(atTime-tr.trTime),tr.trDuration)
  return n.fmul(n.fmul(delta,n.f32(3.14159265358979323846)),2.0)
end function
// Every branch returns. A dense switch here emits unresolved jump-table data
// when this package is imported by the published MiniLang 1.3.9 compiler.
/// @param tr Trajectory record containing type, base position, velocity, start time and duration.
/// @param atTime Game time in milliseconds at which the trajectory is evaluated.
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
/// Evaluate trajectory velocity for stationary, linear, stopped, sinusoidal and gravity-driven motion at the supplied time.
/// @param tr Trajectory record containing type, velocity, start time and duration.
/// @param atTime Game time in milliseconds at which the trajectory is evaluated.
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
/// Test the player origin against the asymmetric item-pickup bounds after evaluating the item trajectory.
/// @param ps Player movement state; accesses `origin`.
/// @param trajectory Trajectory record containing type, base position, velocity, start time and duration.
/// @param atTime Game time in milliseconds at which the trajectory is evaluated.
function playerTouchesItem(ps,trajectory,atTime)
  origin = evaluate(trajectory,atTime)
  x = n.fsub(ps.origin[0],origin[0]); y = n.fsub(ps.origin[1],origin[1]); z = n.fsub(ps.origin[2],origin[2])
  return x <= 44 and x >= -50 and y <= 36 and y >= -36 and z <= 36 and z >= -36
end function
