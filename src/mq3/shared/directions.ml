// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.shared.directions
import mq3.shared.bytedirs as bytedirs
import mq3.shared.math as q
import mq3.compat.numeric as n
/// Compute movedir vector in shared.directions; the normal completion returns `axes[0]`.
/// @param angles Three-element [pitch, yaw, roll] array in degrees.
function movedirVector(angles)
  if angles[0] == 0 and angles[2] == 0 and angles[1] == -1 then return [0.0,0.0,1.0] end if
  if angles[0] == 0 and angles[2] == 0 and angles[1] == -2 then return [0.0,0.0,-1.0] end if
  axes = q.AngleVectors(angles); return axes[0]
end function
/// Compute dir to byte in shared.directions; the normal completion returns `best`.
/// @param dir Left three-element vector.
function dirToByte(dir)
  if dir == void then return 0 end if
  best = 0; bestd = 0.0; i = 0
  for each normal in bytedirs.values()
    d = q.DotProduct(dir,normal)
    if d > bestd then bestd = d; best = i end if
    i = i+1
  end for
  return best
end function
/// Compute project point in shared.directions; the normal completion returns `result`.
/// @param p Right three-element vector.
/// @param normal Left three-element vector.
function projectPoint(p,normal)
  inv = n.fdiv(1.0,q.DotProduct(normal,normal)); d = n.fmul(q.DotProduct(normal,p),inv)
  result = [0.0,0.0,0.0]
  for axis = 0 to 2
    result[axis] = n.fsub(p[axis],n.fmul(d,n.fmul(normal[axis],inv)))
  end for
  return result
end function
/// Compute perpendicular in shared.directions; the normal completion returns `result`.
/// @param src Normal passed as `normal` to `mq3.shared.directions.projectPoint`.
function perpendicular(src)
  pos = 0; minimum = 1.0
  for axis = 0 to 2
    if q.Q_fabs(src[axis]) < minimum then pos = axis; minimum = q.Q_fabs(src[axis]) end if
  end for
  temp = [0.0,0.0,0.0]; temp[pos] = 1.0
  result = projectPoint(temp,src); q.VectorNormalize(result)
  return result
end function
