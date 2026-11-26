// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.collision.world as cm
import mq3.collision.visibility as vis
import mq3.compat.numeric as n
import std.fs as fs
struct Reader
  data
  offset
  words
  bytes
end struct
function compare(reader,values,label)
  for each value in values
    expected = n.readU32(reader.data,reader.offset)
    if n.u32(value) != expected then return error(3600,"FAIL "+label+" byte "+str(reader.offset)+" got "+str(n.u32(value))+" wanted "+str(expected)) end if
    reader.offset = reader.offset+4; reader.words = reader.words+1
  end for
  return void
end function
function compareBytes(reader,values,label)
  for each value in values
    if value != reader.data[reader.offset] then return error(3600,"FAIL "+label+" byte "+str(reader.offset)) end if
    reader.offset = reader.offset+1; reader.bytes = reader.bytes+1
  end for
  return void
end function
function vector(data,off)
  return [n.bitsFloat(n.readU32(data,off)),n.bitsFloat(n.readU32(data,off+4)),n.bitsFloat(n.readU32(data,off+8))]
end function
function boolean(value)
  if value then return 1 end if
  return 0
end function
function padded(entries)
  result = array(64,-1); index = 0
  while index < len(entries)
    result[index] = entries[index]; index = index+1
  end while
  return result
end function
function main(args)
  world = cm.loadBrushWorld(fs.readAllBytes(args[0])); state = world.visibility
  inputs = fs.readAllBytes(args[1]); reader = Reader(fs.readAllBytes(args[2]),0,0,0)
  boxCount = n.readI32(inputs,0); portalCount = n.readI32(inputs,4)
  compare(reader,[state.numClusters,state.numAreas,state.clusterBytes,len(world.leaves),len(world.models),boolean(state.vised)],"header")
  index = 0
  while index < len(world.leaves)
    compare(reader,[vis.leafCluster(state,index),vis.leafArea(state,index)],"leaf"); index = index+1
  end while
  for cluster = -2 to state.numClusters+1
    row=vis.clusterPVS(state,cluster)
    compareBytes(reader,row,"PVS "+str(cluster))
    for target=-2 to state.clusterBytes*8+1
      expected=false
      if target>=0 and (target>>3)<len(row) then expected=(row[target>>3]&(1<<(target&7)))!=0 end if
      if vis.clusterVisible(state,cluster,target)!=expected then return error(3600,"FAIL PVS bit "+str(cluster)+":"+str(target)) end if
    end for
  end for
  index = 0
  while index < len(world.models)
    bounds = cm.modelBounds(world,cm.inlineModel(world,index)); values = []
    for each value in bounds[0]+bounds[1]
      values = values+[n.floatBits(value)]
    end for
    compare(reader,values,"model bounds"); index = index+1
  end while
  off = 8; index = 0
  while index < boxCount
    mins = vector(inputs,off); maxs = vector(inputs,off+12); capacity = n.readI32(inputs,off+24)
    leaves = cm.boxLeafnums(world,mins,maxs,capacity)
    compare(reader,[len(leaves.entries),leaves.lastLeaf,boolean(leaves.overflowed)]+padded(leaves.entries),"leaf list "+str(index))
    brushes = cm.boxBrushes(world,mins,maxs,capacity)
    compare(reader,[len(brushes.entries),boolean(brushes.overflowed)]+padded(brushes.entries),"brush list "+str(index))
    off = off+28; index = index+1
  end while
  index = 0
  while index < portalCount
    state.noAreas = n.readI32(inputs,off+28) != 0
    if n.readI32(inputs,off) != 0 then vis.adjustAreaPortalState(state,n.readI32(inputs,off+4),n.readI32(inputs,off+8),n.readI32(inputs,off+12)!=0) end if
    bits = slice(inputs,off+32,32)
    connected = vis.areasConnected(state,n.readI32(inputs,off+20),n.readI32(inputs,off+24))
    count = vis.writeAreaBits(state,bits,n.readI32(inputs,off+16))
    compare(reader,[boolean(connected),count],"portal "+str(index))
    compareBytes(reader,bits,"area bits "+str(index))
    compare(reader,state.floodnums+state.portals,"portal state "+str(index))
    off = off+64; index = index+1
  end while
  if reader.offset != len(reader.data) or off != len(inputs) then return 2 end if
  print "PASS: "+str(reader.words)+" visibility/list/portal words and "+str(reader.bytes)+" PVS/area bytes"
  return 0
end function
