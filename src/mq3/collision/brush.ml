// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CM_TraceThroughBrush kernel from qcommon/cm_trace.c. BSP traversal is separate.
package mq3.collision.brush
import mq3.compat.numeric as n
import mq3.shared.math as q

struct Plane
  normal
  distance
  flags
end struct

struct Trace
  fraction
  normal
  distance
  surfaceFlags
  contents
  startsolid
  allsolid
end struct

function emptyTrace()
  return Trace(n.f32(1), [0.0,0.0,0.0], 0.0, 0, 0, false, false)
end function

function traceThroughBrush(trace, planes, contents, start, finish, mins, maxs, capsule, radius, capsuleOffset)
  if len(planes) == 0 then return trace end if
  enterFraction = n.f32(-1)
  leaveFraction = n.f32(1)
  startout = false
  getout = false
  lead = void
  for each plane in planes
    distance = plane.distance
    d1 = 0.0
    d2 = 0.0
    if capsule then
      distance = n.fadd(distance, radius)
      dot = q.DotProduct(plane.normal, capsuleOffset)
      startPoint = array(3, 0.0)
      endPoint = array(3, 0.0)
      for axis = 0 to 2
        if dot > 0.0 then
          startPoint[axis] = n.fsub(start[axis], capsuleOffset[axis])
          endPoint[axis] = n.fsub(finish[axis], capsuleOffset[axis])
        else
          startPoint[axis] = n.fadd(start[axis], capsuleOffset[axis])
          endPoint[axis] = n.fadd(finish[axis], capsuleOffset[axis])
        end if
      end for
      d1 = n.fsub(q.DotProduct(startPoint, plane.normal), distance)
      d2 = n.fsub(q.DotProduct(endPoint, plane.normal), distance)
    else
      corner = array(3, 0.0)
      for axis = 0 to 2
        if plane.normal[axis] < 0.0 then corner[axis] = maxs[axis] else corner[axis] = mins[axis] end if
      end for
      distance = n.fsub(distance, q.DotProduct(corner, plane.normal))
      d1 = n.fsub(q.DotProduct(start, plane.normal), distance)
      d2 = n.fsub(q.DotProduct(finish, plane.normal), distance)
    end if
    if d2 > 0.0 then getout = true end if
    if d1 > 0.0 then startout = true end if
    if d1 > 0.0 and (d2 >= 0.125 or d2 >= d1) then return trace end if
    if d1 <= 0.0 and d2 <= 0.0 then continue end if
    if d1 > d2 then
      // SURFACE_CLIP_EPSILON is a C double literal. The numerator and division
      // use double precision before the final float assignment in the original.
      fraction = n.f32((d1 - 0.125) / n.fsub(d1, d2))
      if fraction < 0.0 then fraction = n.f32(0) end if
      if fraction > enterFraction then enterFraction = fraction; lead = plane end if
    else
      fraction = n.f32((d1 + 0.125) / n.fsub(d1, d2))
      if fraction > 1.0 then fraction = n.f32(1) end if
      if fraction < leaveFraction then leaveFraction = fraction end if
    end if
  end for
  if not startout then
    trace.startsolid = true
    if not getout then trace.allsolid = true; trace.fraction = n.f32(0); trace.contents = contents end if
    return trace
  end if
  if enterFraction < leaveFraction and enterFraction > -1.0 and enterFraction < trace.fraction then
    if enterFraction < 0.0 then enterFraction = n.f32(0) end if
    trace.fraction = enterFraction
    trace.normal = lead.normal
    trace.distance = lead.distance
    trace.surfaceFlags = lead.flags
    trace.contents = contents
  end if
  return trace
end function
