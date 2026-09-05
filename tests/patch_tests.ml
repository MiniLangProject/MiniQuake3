// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.collision.patchmesh as mesh
import mq3.format.bsp as bsp
import mq3.compat.numeric as n
import std.fs as fs
struct Reader
  data
  offset
  surface
end struct
function check(reader,value,label)
  expected = n.readU32(reader.data,reader.offset)
  if n.u32(value) != expected then
    return error(3905,"patch surface "+str(reader.surface)+" "+label+" offset "+str(reader.offset)+" got "+str(value)+" expected "+str(expected))
  end if
  reader.offset = reader.offset+4
  return void
end function
function main(args)
  data = fs.readAllBytes(args[0]);map = bsp.load(data)
  expected = fs.readAllBytes(args[1]);reader = Reader(expected,4,-1)
  count = n.readU32(expected,0);index = 0;actualCount = 0;surface = 0
  while surface < map.counts[13]
    if n.readI32(data,map.offsets[13]+surface*104+8) == 2 then actualCount = actualCount+1 end if
    surface = surface+1
  end while
  if actualCount != count then return 2 end if
  while index < count
    reader.surface = n.readI32(expected,reader.offset);reader.offset = reader.offset+4
    off = map.offsets[13]+reader.surface*104
    width = n.readI32(data,off+96);height = n.readI32(data,off+100)
    first = n.readI32(data,off+12);points = array(width*height,void);j = 0
    while j < len(points)
      location = map.offsets[10]+(first+j)*44
      points[j] = [n.bitsFloat(n.readU32(data,location)),n.bitsFloat(n.readU32(data,location+4)),n.bitsFloat(n.readU32(data,location+8))]
      j = j+1
    end while
    patch = mesh.generate(width,height,points)
    check(reader,len(patch.planes),"plane count");check(reader,len(patch.facets),"facet count")
    for each bound in patch.bounds
      for each value in bound
        check(reader,n.floatBits(value),"bound")
      end for
    end for
    j = 0
    for each plane in patch.planes
      for each value in plane.normal
        check(reader,n.floatBits(value),"plane "+str(j)+" normal")
      end for
      check(reader,n.floatBits(plane.distance),"plane "+str(j)+" distance")
      check(reader,plane.signbits,"signbits");j = j+1
    end for
    for each facet in patch.facets
      check(reader,facet.surface,"surface plane");check(reader,len(facet.borders),"borders")
      j = 0
      while j < len(facet.borders)
        check(reader,facet.borders[j],"border plane");check(reader,facet.inward[j],"inward");check(reader,facet.noAdjust[j],"noAdjust")
        j = j+1
      end while
    end for
    index = index+1
  end while
  if reader.offset != len(expected) then return 3 end if
  print "PASS: "+str(count)+" original patch meshes (planes, facets, bevels and bounds)"
  return 0
end function
