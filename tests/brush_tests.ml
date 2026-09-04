// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.collision.brush as brush
import mq3.compat.numeric as n
import std.fs as fs
function f(data,off)
  return n.bitsFloat(n.readU32(data,off))
end function
function vector(data,off)
  return [f(data,off),f(data,off+4),f(data,off+8)]
end function
function main(args)
  data = fs.readAllBytes(args[0])
  if len(data) != 4096 * 268 then return 2 end if
  for index = 0 to 4095
    off = index * 268
    planes = []
    for side = 0 to 7
      location = off + 72 + side * 20
      planes = planes + [brush.Plane(vector(data,location), f(data,location+12), n.readI32(data,location+16))]
    end for
    result = brush.traceThroughBrush(brush.emptyTrace(),planes,1,vector(data,off),vector(data,off+12),vector(data,off+24),vector(data,off+36),n.readI32(data,off+64)!=0,f(data,off+48),vector(data,off+52))
    startsolid = 0
    allsolid = 0
    if result.startsolid then startsolid = 1 end if
    if result.allsolid then allsolid = 1 end if
    actual = [n.floatBits(result.fraction),n.floatBits(result.normal[0]),n.floatBits(result.normal[1]),n.floatBits(result.normal[2]),n.floatBits(result.distance),result.surfaceFlags,result.contents,startsolid,allsolid]
    for field = 0 to 8
      expected = n.readU32(data, off + 232 + field * 4)
      if actual[field] != expected then
        print "FAIL brush case " + str(index) + " field " + str(field) + " got " + str(actual[field]) + " wanted " + str(expected)
        return 1
      end if
    end for
  end for
  print "PASS: 4096 original box/capsule brush traces (36864 exact fields)"
  return 0
end function
