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
  planeMetadata
end struct

function emptyTrace()
  return Trace(n.f32(1), [0.0,0.0,0.0], 0.0, 0, 0, false, false,0)
end function

// BASIC MATH from cm_trace.c.  These stay here beside the brush kernel so
// capsule primitives and their differential tests share the exact binary32
// operation ordering of the original C translation unit.
function projectPointOntoVector(point, start, direction)
  delta = [n.fsub(point[0],start[0]),n.fsub(point[1],start[1]),n.fsub(point[2],start[2])]
  scale = q.DotProduct(delta,direction)
  return q.VectorMA(start,scale,direction)
end function

function vectorDistanceSquared(a,b)
  delta = [n.fsub(b[0],a[0]),n.fsub(b[1],a[1]),n.fsub(b[2],a[2])]
  return q.DotProduct(delta,delta)
end function

function distanceFromLineSquared(point,lineStart,lineEnd,direction)
  projected = projectPointOntoVector(point,lineStart,direction)
  outside = -1
  for axis = 0 to 2
    if (projected[axis] > lineStart[axis] and projected[axis] > lineEnd[axis]) or (projected[axis] < lineStart[axis] and projected[axis] < lineEnd[axis]) then outside=axis;break end if
  end for
  endpoint = projected
  if outside >= 0 then
    if q.Q_fabs(n.fsub(projected[outside],lineStart[outside])) < q.Q_fabs(n.fsub(projected[outside],lineEnd[outside])) then endpoint=lineStart else endpoint=lineEnd end if
  end if
  delta = [n.fsub(point[0],endpoint[0]),n.fsub(point[1],endpoint[1]),n.fsub(point[2],endpoint[2])]
  return q.DotProduct(delta,delta)
end function

function squareRootFloat(number)
  x = n.fmul(number,0.5)
  y = n.f32(number)
  bits = n.i32(n.floatBits(y))
  bits = n.i32(0x5f3759df - (bits >> 1))
  y = n.bitsFloat(bits)
  y = n.fmul(y,n.fsub(1.5,n.fmul(n.fmul(x,y),y)))
  y = n.fmul(y,n.fsub(1.5,n.fmul(n.fmul(x,y),y)))
  return n.fmul(number,y)
end function

function CM_ProjectPointOntoVector(point,start,direction) return projectPointOntoVector(point,start,direction) end function
function CM_DistanceFromLineSquared(point,lineStart,lineEnd,direction) return distanceFromLineSquared(point,lineStart,lineEnd,direction) end function
function CM_VectorDistanceSquared(a,b) return vectorDistanceSquared(a,b) end function
function SquareRootFloat(number) return squareRootFloat(number) end function

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
    kind = 3;signbits = 0
    for axis = 0 to 2
      if lead.normal[axis] == 1 and kind == 3 then kind = axis end if
      if lead.normal[axis] < 0 then signbits = signbits | (1 << axis) end if
    end for
    trace.planeMetadata = kind | (signbits << 8)
  end if
  return trace
end function

function CM_TraceThroughBrush(trace,planes,contents,start,finish,mins,maxs,capsule,radius,capsuleOffset)
  return traceThroughBrush(trace,planes,contents,start,finish,mins,maxs,capsule,radius,capsuleOffset)
end function
