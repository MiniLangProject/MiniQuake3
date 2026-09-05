// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
function real(data,off)
  return n.bitsFloat(n.readU32(data,off))
end function
function vector(data,off)
  return [real(data,off),real(data,off+4),real(data,off+8)]
end function
function main(args)
  curves = args[3] == "0"
  world = cm.loadWorld(fs.readAllBytes(args[0]),curves)
  inputs = fs.readAllBytes(args[1])
  expected = fs.readAllBytes(args[2])
  count = n.quotient(len(inputs),60)
  if len(inputs) % 60 != 0 or len(expected) != count*64 then return 2 end if
  index = 0
  while index < count
    off = index*60
    a = vector(inputs,off); b = vector(inputs,off+12)
    model = n.readI32(inputs,off+48)
    result = cm.trace(world,a,b,vector(inputs,off+24),vector(inputs,off+36),model,n.readI32(inputs,off+52),n.readI32(inputs,off+56)!=0,curves)
    tr = result.trace
    startsolid = 0; allsolid = 0
    if tr.startsolid then startsolid = 1 end if
    if tr.allsolid then allsolid = 1 end if
    actual = [n.floatBits(tr.fraction),n.floatBits(tr.normal[0]),n.floatBits(tr.normal[1]),n.floatBits(tr.normal[2]),n.floatBits(tr.distance),n.u32(tr.surfaceFlags),n.u32(tr.contents),startsolid,allsolid,n.floatBits(result.endpos[0]),n.floatBits(result.endpos[1]),n.floatBits(result.endpos[2]),cm.pointLeafnum(world,a),n.u32(cm.pointContents(world,a,model)),n.u32(cm.pointContents(world,b,model)),tr.planeMetadata]
    for field = 0 to 15
      wanted = n.readU32(expected,index*64+field*4)
      if actual[field] != wanted then
        print "FAIL collision case " + str(index) + " field " + str(field) + " got " + str(actual[field]) + " wanted " + str(wanted)
        return 1
      end if
    end for
    index = index+1
  end while
  print "PASS: " + str(count) + " original map traces/point contents (cm_noCurves="+args[3]+")"
  return 0
end function
