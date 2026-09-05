// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
function vector(data,off)
  return [n.bitsFloat(n.readU32(data,off)),n.bitsFloat(n.readU32(data,off+4)),n.bitsFloat(n.readU32(data,off+8))]
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),args[3] == "0")
  inputs = fs.readAllBytes(args[1]); expected = fs.readAllBytes(args[2])
  count = n.quotient(len(inputs),112)
  if len(inputs) != count*112 or len(expected) != count*96 then return 2 end if
  index = 0
  while index < count
    off = index*112
    start = vector(inputs,off); finish = vector(inputs,off+12)
    mins = vector(inputs,off+24); maxs = vector(inputs,off+36)
    origin = vector(inputs,off+48); angles = vector(inputs,off+60)
    model = n.readI32(inputs,off+96); mask = n.readI32(inputs,off+100)
    capsule = n.readI32(inputs,off+104) != 0; kind = n.readI32(inputs,off+108)
    if kind >= 1 and kind <= 3 then model = cm.tempBoxModel(world,vector(inputs,off+72),vector(inputs,off+84),false) end if
    if kind == 3 then cm.tempBoxModel(world,mins,maxs,true) end if
    result = void
    if kind == 2 or kind == 3 or kind == 4 then
      result = cm.trace(world,start,finish,mins,maxs,model,mask,capsule,world.patchesReady)
    else
      if kind == 5 then mins = void; maxs = void end if
      result = cm.transformedTrace(world,start,finish,mins,maxs,model,mask,origin,angles,capsule,world.patchesReady)
    end if
    tr = result.trace; startsolid = 0; allsolid = 0
    if tr.startsolid then startsolid = 1 end if
    if tr.allsolid then allsolid = 1 end if
    actual = [n.floatBits(tr.fraction)]
    for each value in tr.normal+[tr.distance]
      actual = actual+[n.floatBits(value)]
    end for
    actual = actual+[n.u32(tr.surfaceFlags),n.u32(tr.contents),startsolid,allsolid]
    for each value in result.endpos
      actual = actual+[n.floatBits(value)]
    end for
    actual = actual+[n.u32(cm.transformedPointContents(world,start,model,origin,angles)),n.u32(cm.transformedPointContents(world,finish,model,origin,angles)),tr.planeMetadata,model]
    bounds = cm.modelBounds(world,model)
    for each value in bounds[0]+bounds[1]
      actual = actual+[n.floatBits(value)]
    end for
    actual = actual+[n.u32(cm.pointContents(world,start,model)),n.u32(cm.pointContents(world,finish,model))]
    for field = 0 to 23
      wanted = n.readU32(expected,index*96+field*4)
      if actual[field] != wanted then
        print "FAIL spatial case "+str(index)+" kind "+str(kind)+" field "+str(field)+" got "+str(actual[field])+" wanted "+str(wanted)
        return 1
      end if
    end for
    index = index+1
  end while
  handle = cm.tempBoxModel(world,[-15.0,-15.0,-24.0],[15.0,15.0,32.0],true)
  if handle != 254 then return 1 end if
  if len(world.models) <= 254 then
    caught = try(cm.trace(world,[0.0,0.0,0.0],[0.0,0.0,0.0],[-15.0,-15.0,-24.0],[15.0,15.0,32.0],handle,-1,true,world.patchesReady))
    if caught is not error then return 1 end if
  end if
  print "PASS: "+str(count)+" transformed/temporary collision cases and original capsule-handle rejection"
  return 0
end function
