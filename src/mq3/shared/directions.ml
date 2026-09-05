// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.shared.directions
import mq3.shared.bytedirs as bytedirs
import mq3.shared.math as q
import mq3.compat.numeric as n
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
function projectPoint(p,normal)
  inv = n.fdiv(1.0,q.DotProduct(normal,normal)); d = n.fmul(q.DotProduct(normal,p),inv)
  result = [0.0,0.0,0.0]
  for axis = 0 to 2
    result[axis] = n.fsub(p[axis],n.fmul(d,n.fmul(normal[axis],inv)))
  end for
  return result
end function
function perpendicular(src)
  pos = 0; minimum = 1.0
  for axis = 0 to 2
    if q.Q_fabs(src[axis]) < minimum then pos = axis; minimum = q.Q_fabs(src[axis]) end if
  end for
  temp = [0.0,0.0,0.0]; temp[pos] = 1.0
  result = projectPoint(temp,src); q.VectorNormalize(result)
  return result
end function
