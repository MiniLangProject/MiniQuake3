// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Winding operations needed by the original patch bevel generator.
package mq3.collision.winding
import mq3.compat.numeric as n
import mq3.shared.math as q

function add(a,b)
  return [n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])]
end function
function subtract(a,b)
  return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])]
end function
function negate(a)
  return [n.bitsFloat(n.floatBits(a[0])^0x80000000),n.bitsFloat(n.floatBits(a[1])^0x80000000),n.bitsFloat(n.floatBits(a[2])^0x80000000)]
end function

function base(normal, distance)
  largest = -65535.0; axis = -1
  for i = 0 to 2
    value = q.Q_fabs(normal[i])
    if value > largest then largest = value; axis = i end if
  end for
  if axis < 0 then return error(3504,"Winding: no plane axis") end if
  up = [0.0,0.0,1.0]
  if axis == 2 then up = [1.0,0.0,0.0] end if
  up = q.VectorNormalize2(q.VectorMA(up,n.fneg(q.DotProduct(up,normal)),normal))
  origin = q.VectorScale(normal,distance)
  right = q.CrossProduct(up,normal)
  up = q.VectorScale(up,65535.0); right = q.VectorScale(right,65535.0)
  return [add(subtract(origin,right),up),add(add(origin,right),up),subtract(add(origin,right),up),subtract(subtract(origin,right),up)]
end function

function bounds(points)
  mins = [99999.0,99999.0,99999.0]; maxs = [-99999.0,-99999.0,-99999.0]
  for each point in points
    for axis = 0 to 2
      if point[axis] < mins[axis] then mins[axis] = point[axis] end if
      if point[axis] > maxs[axis] then maxs[axis] = point[axis] end if
    end for
  end for
  return [mins,maxs]
end function

function chop(points, normal, distance)
  if len(points) == 0 then return [] end if
  dists = array(len(points)+1,0.0); sides = array(len(points)+1,0)
  counts = [0,0,0]; epsilon = n.f32(0.1)
  i = 0
  while i < len(points)
    dot = n.fsub(q.DotProduct(points[i],normal),distance)
    dists[i] = dot
    side = 2
    if dot > epsilon then side = 0 else if dot < -epsilon then side = 1 end if
    sides[i] = side;counts[side] = counts[side]+1
    i = i+1
  end while
  sides[i] = sides[0];dists[i] = dists[0]
  if counts[0] == 0 then return [] end if
  if counts[1] == 0 then return points end if
  result = []
  i = 0
  while i < len(points)
    p1 = points[i]
    if sides[i] == 2 then result = result+[p1];i = i+1;continue end if
    if sides[i] == 0 then result = result+[p1] end if
    if sides[i+1] == 2 or sides[i+1] == sides[i] then i = i+1;continue end if
    p2 = points[(i+1)%len(points)]
    dot = n.fdiv(dists[i],n.fsub(dists[i],dists[i+1]))
    mid = array(3,0.0)
    for axis = 0 to 2
      if normal[axis] == 1 then
        mid[axis] = distance
      else if normal[axis] == -1 then
        mid[axis] = n.fneg(distance)
      else
        mid[axis] = n.fadd(p1[axis],n.fmul(dot,n.fsub(p2[axis],p1[axis])))
      end if
    end for
    result = result+[mid]
    i = i+1
  end while
  if len(result) > len(points)+4 or len(result) > 64 then return error(3504,"Winding: point limit exceeded") end if
  return result
end function
