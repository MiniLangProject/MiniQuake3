// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BSP brush collision from cm_load.c, cm_test.c and cm_trace.c.
// World, transformed inline BSP models and the original shared temporary box.
package mq3.collision.world
import mq3.compat.numeric as n
import mq3.shared.math as q
import mq3.format.bsp as bsp
import mq3.collision.brush as brush
import mq3.collision.patchmesh as mesh
import mq3.collision.patchtrace as patches
import mq3.collision.visibility as vis
import std.array as arrays

struct Brush
  planes
  contents
  mins
  maxs
end struct
struct Node
  plane
  axis
  children
end struct
struct Leaf
  brushes
  surfaces
end struct
struct Surface
  patch
  contents
  flags
end struct
struct World
  brushes
  nodes
  leaves
  models
  surfaces
  patchesReady
  playerCurveClip
  bounds
  temporary
  visibility
end struct
struct Temporary
  bounds
  brush
end struct
struct Work
  world
  trace
  start
  finish
  mins
  maxs
  boundsMin
  boundsMax
  capsule
  radius
  capsuleOffset
  mask
  isPoint
  seen
  seenPatches
  curves
end struct
struct Result
  trace
  endpos
end struct
struct LeafList
  entries
  lastLeaf
  overflowed
end struct

function fail(message)
  return error(3503, "Collision: " + message)
end function

function min(a,b)
  if a < b then return a end if
  return b
end function
function max(a,b)
  if a > b then return a end if
  return b
end function
function abs(a)
  return n.bitsFloat(n.floatBits(a) & 0x7fffffff)
end function

function real(data, offset)
  bits = n.readU32(data, offset)
  if (bits & 0x7f800000) == 0x7f800000 then return fail("non-finite map plane") end if
  return n.bitsFloat(bits)
end function

function planeType(normal)
  for axis = 0 to 2
    if normal[axis] == 1.0 then return axis end if
  end for
  return 3
end function

function planeMetadata(normal)
  if normal[0] == 0 and normal[1] == 0 and normal[2] == 0 then return 0 end if
  result = planeType(normal)
  for axis = 0 to 2
    if normal[axis] < 0 then result = result | (1 << (axis + 8)) end if
  end for
  return result
end function

function checkTree(nodes)
  // Iterative DFS prevents malformed cycles from reaching trace/point walkers.
  colors = array(len(nodes), 0)
  parents = array(len(nodes),0)
  for each node in nodes
    for each child in node.children
      if child >= 0 then
        parents[child] = parents[child]+1
        if parents[child] > 1 then return fail("BSP node has multiple parents") end if
      end if
    end for
  end for
  root = 0
  while root < len(nodes)
    stack = [[root, false]]
    while len(stack) > 0
      item = stack[len(stack)-1]
      stack = arrays.slice(stack, 0, len(stack)-1)
      index = item[0]
      if index < 0 then continue end if
      if item[1] then colors[index] = 2; continue end if
      if colors[index] == 1 then return fail("cyclic BSP nodes") end if
      if colors[index] == 2 then continue end if
      colors[index] = 1
      stack = stack + [[index, true], [nodes[index].children[1], false], [nodes[index].children[0], false]]
    end while
    root = root + 1
  end while
  return true
end function

function loadWorld(data,curves)
  map = bsp.load(data)
  if map.counts[3] == 0 then return fail("world has no nodes") end if
  // The original permits 256 models, overlapping its special handles 254/255.
  // Reject that ambiguous range until its capsule-model path has a separate profile.
  if map.counts[7] > 254 then return fail("models overlap reserved collision handles") end if
  visibility = vis.load(map)
  planes = array(map.counts[2], void)
  index = 0
  while index < len(planes)
    off = map.offsets[2] + index * 16
    planes[index] = brush.Plane([real(data,off),real(data,off+4),real(data,off+8)],real(data,off+12),0)
    index = index + 1
  end while
  sides = array(map.counts[9], void)
  index = 0
  while index < len(sides)
    off = map.offsets[9] + index * 8
    plane = planes[n.readI32(data,off)]
    shader = n.readI32(data,off+4)
    sides[index] = brush.Plane(plane.normal,plane.distance,n.readI32(data,map.offsets[1]+shader*72+64))
    index = index + 1
  end while
  brushes = array(map.counts[8], void)
  index = 0
  while index < len(brushes)
    off = map.offsets[8] + index * 12
    first = n.readI32(data,off)
    count = n.readI32(data,off+4)
    if count < 6 then return fail("brush lacks six axial bounding planes") end if
    shader = n.readI32(data,off+8)
    mins = array(3,0.0)
    maxs = array(3,0.0)
    for axis = 0 to 2
      mins[axis] = -sides[first+axis*2].distance
      maxs[axis] = sides[first+axis*2+1].distance
    end for
    brushes[index] = Brush(arrays.slice(sides,first,count),n.readI32(data,map.offsets[1]+shader*72+68),mins,maxs)
    index = index + 1
  end while
  nodes = array(map.counts[3],void)
  index = 0
  while index < len(nodes)
    off = map.offsets[3]+index*36
    plane = planes[n.readI32(data,off)]
    nodes[index] = Node(plane,planeType(plane.normal),[n.readI32(data,off+4),n.readI32(data,off+8)])
    index = index + 1
  end while
  checkTree(nodes)
  leaves = array(map.counts[4],void)
  index = 0
  while index < len(leaves)
    off = map.offsets[4]+index*48
    first = n.readI32(data,off+40)
    count = n.readI32(data,off+44)
    entries = array(count,0)
    k = 0
    while k < count
      entries[k] = n.readI32(data,map.offsets[6]+(first+k)*4)
      k = k + 1
    end while
    firstSurface = n.readI32(data,off+32)
    surfaceCount = n.readI32(data,off+36)
    surfaceEntries = array(surfaceCount,0);k = 0
    while k < surfaceCount
      surfaceEntries[k] = n.readI32(data,map.offsets[5]+(firstSurface+k)*4)
      k = k+1
    end while
    leaves[index] = Leaf(entries,surfaceEntries)
    index = index + 1
  end while
  models = array(map.counts[7],void)
  modelBounds = array(map.counts[7],void)
  index = 0
  while index < len(models)
    off = map.offsets[7]+index*40
    lower = array(3,0.0); upper = array(3,0.0)
    for axis = 0 to 2
      lower[axis] = n.fsub(real(data,off+axis*4),1.0)
      upper[axis] = n.fadd(real(data,off+12+axis*4),1.0)
      if lower[axis] > upper[axis] then return fail("inverted model bounds") end if
    end for
    modelBounds[index] = [lower,upper]
    first = n.readI32(data,off+32)
    count = n.readI32(data,off+36)
    entries = array(count,0)
    k = 0
    while k < count
      entries[k] = first+k
      k = k+1
    end while
    firstSurface = n.readI32(data,off+24)
    surfaceCount = n.readI32(data,off+28)
    surfaceEntries = array(surfaceCount,0);k = 0
    while k < surfaceCount
      surfaceEntries[k] = firstSurface+k;k = k+1
    end while
    models[index] = Leaf(entries,surfaceEntries)
    index = index + 1
  end while
  surfaces = array(map.counts[13],void)
  if curves then
    index = 0
    while index < len(surfaces)
      off = map.offsets[13]+index*104
      if n.readI32(data,off+8) == 2 then
        width = n.readI32(data,off+96);height = n.readI32(data,off+100)
        count = width*height
        if width < 3 or height < 3 or width > 129 or height > 129 or count > 1024 or count > n.readI32(data,off+16) then return fail("invalid BSP patch control grid") end if
        first = n.readI32(data,off+12);points = array(count,void);k = 0
        while k < count
          location = map.offsets[10]+(first+k)*44
          points[k] = [real(data,location),real(data,location+4),real(data,location+8)];k = k+1
        end while
        shader = n.readI32(data,off)
        surfaces[index] = Surface(mesh.generate(width,height,points),n.readI32(data,map.offsets[1]+shader*72+68),n.readI32(data,map.offsets[1]+shader*72+64))
      end if
      index = index+1
    end while
  end if
  zero = [0.0,0.0,0.0]
  return World(brushes,nodes,leaves,models,surfaces,curves,true,modelBounds,Temporary([zero,zero],makeBox(zero,zero)),visibility)
end function

function makeBox(mins,maxs)
  planes = []
  // CM_InitBoxHull uses +X,-X,+Y,-Y,+Z,-Z, unlike map brush bounds.
  for axis = 0 to 2
    positive = [0.0,0.0,0.0]; negative = [0.0,0.0,0.0]
    positive[axis] = 1.0; negative[axis] = -1.0
    planes = planes+[brush.Plane(positive,maxs[axis],0),brush.Plane(negative,n.fneg(mins[axis]),0)]
  end for
  return Brush(planes,0x2000000,mins,maxs)
end function

function tempBoxModel(world,mins,maxs,capsule)
  mins = vector32(mins); maxs = vector32(maxs)
  for axis = 0 to 2
    if mins[axis] > maxs[axis] then return fail("inverted temporary bounds") end if
  end for
  world.temporary.bounds = [mins,maxs]
  // Preserve the original handle and shared slot. Its capsule handle cannot be
  // resolved by the pinned CM_ClipHandleToModel unless it names an inline model.
  if capsule then return 254 end if
  world.temporary.brush = makeBox(mins,maxs)
  return 255
end function

function checkModel(world,model)
  if model >= 0 and (model < len(world.models) or model == 255) then return true end if
  return fail("invalid model handle")
end function

function modelBounds(world,model)
  checkModel(world,model)
  bounds = world.temporary.bounds
  if model < len(world.models) then bounds = world.bounds[model] end if
  return [arrays.slice(bounds[0],0,3),arrays.slice(bounds[1],0,3)]
end function

function inlineModel(world,index)
  if index < 0 or index >= len(world.models) then return fail("invalid inline model") end if
  return index
end function

function loadBrushWorld(data)
  return loadWorld(data,false)
end function

function load(data)
  return loadWorld(data,true)
end function

function pointLeafnum(world, point)
  point = vector32(point)
  num = 0
  while num >= 0
    node = world.nodes[num]
    distance = 0.0
    if node.axis < 3 then
      distance = n.fsub(point[node.axis],node.plane.distance)
    else
      distance = n.fsub(q.DotProduct(node.plane.normal,point),node.plane.distance)
    end if
    if distance < 0.0 then num = node.children[1] else num = node.children[0] end if
  end while
  return -1-num
end function

function modelBrushes(world, point, model)
  if model < 0 or model >= len(world.models) then return fail("invalid inline model") end if
  if model == 0 then return world.leaves[pointLeafnum(world,point)].brushes end if
  return world.models[model].brushes
end function

function pointContents(world, point, model)
  point = vector32(point)
  checkModel(world,model)
  contents = 0
  selected = []
  if model == 255 and model >= len(world.models) then
    selected = [world.temporary.brush]
  else
    for each index in modelBrushes(world,point,model)
      selected = selected+[world.brushes[index]]
    end for
  end if
  for each b in selected
    inside = true
    for each plane in b.planes
      if q.DotProduct(point,plane.normal) > plane.distance then inside = false; break end if
    end for
    if inside then contents = contents | b.contents end if
  end for
  return n.i32(contents)
end function

function testInBrush(work, b)
  for axis = 0 to 2
    if work.boundsMin[axis] > b.maxs[axis] or work.boundsMax[axis] < b.mins[axis] then return void end if
  end for
  side = 6
  while side < len(b.planes)
    plane = b.planes[side]
    distance = plane.distance
    point = work.start
    if work.capsule then
      distance = n.fadd(distance,work.radius)
      dot = q.DotProduct(plane.normal,work.capsuleOffset)
      point = array(3,0.0)
      for axis = 0 to 2
        if dot > 0.0 then point[axis] = n.fsub(work.start[axis],work.capsuleOffset[axis]) else point[axis] = n.fadd(work.start[axis],work.capsuleOffset[axis]) end if
      end for
    else
      corner = array(3,0.0)
      for axis = 0 to 2
        if plane.normal[axis] < 0 then corner[axis] = work.maxs[axis] else corner[axis] = work.mins[axis] end if
      end for
      distance = n.fsub(distance,q.DotProduct(corner,plane.normal))
    end if
    if n.fsub(q.DotProduct(point,plane.normal),distance) > 0 then return void end if
    side = side+1
  end while
  work.trace.startsolid = true
  work.trace.allsolid = true
  work.trace.fraction = n.f32(0)
  work.trace.contents = b.contents
  return void
end function

function throughLeaf(work, leaf, positionTest)
  for each index in leaf.brushes
    if work.seen[index] then continue end if
    work.seen[index] = true
    b = work.world.brushes[index]
    if (b.contents & work.mask) == 0 then continue end if
    if positionTest then
      testInBrush(work,b)
    else
      brush.traceThroughBrush(work.trace,b.planes,b.contents,work.start,work.finish,work.mins,work.maxs,work.capsule,work.radius,work.capsuleOffset)
    end if
    if work.trace.fraction == 0 then return void end if
  end for
  if work.curves then
    for each index in leaf.surfaces
      surface = work.world.surfaces[index]
      if surface == void or work.seenPatches[index] then continue end if
      work.seenPatches[index] = true
      if (surface.contents & work.mask) == 0 then continue end if
      if positionTest then
        if patches.positionTest(work,surface.patch) then
          work.trace.startsolid = true;work.trace.allsolid = true
          work.trace.fraction = n.f32(0);work.trace.contents = surface.contents
        end if
      else
        previous = work.trace.fraction
        patches.trace(work,surface.patch,work.world.playerCurveClip)
        if work.trace.fraction < previous then work.trace.surfaceFlags = surface.flags;work.trace.contents = surface.contents end if
      end if
      if work.trace.fraction == 0 then return void end if
    end for
  end if
  return void
end function

function boxSide(mins, maxs, plane)
  near = array(3,0.0)
  far = array(3,0.0)
  for axis = 0 to 2
    if plane.normal[axis] < 0 then
      near[axis] = maxs[axis]; far[axis] = mins[axis]
    else
      near[axis] = mins[axis]; far[axis] = maxs[axis]
    end if
  end for
  // Win32's original BoxOnPlaneSide is x87 assembly. Its sums remain extended
  // until comparison, with no intermediate binary32 stores. Map coordinates
  // have enough precision here in the host double to preserve this comparison.
  a = plane.normal[0]*far[0]+plane.normal[1]*far[1]+plane.normal[2]*far[2]
  b = plane.normal[0]*near[0]+plane.normal[1]*near[1]+plane.normal[2]*near[2]
  result = 0
  if a >= plane.distance then result = 1 end if
  if b < plane.distance then result = result | 2 end if
  return result
end function

function positionTest(work)
  mins = array(3,0.0)
  maxs = array(3,0.0)
  for axis = 0 to 2
    mins[axis] = n.fsub(n.fadd(work.start[axis],work.mins[axis]),1.0)
    maxs[axis] = n.fadd(n.fadd(work.start[axis],work.maxs[axis]),1.0)
  end for
  stack = [0]
  leaves = []
  while len(stack) > 0
    num = stack[len(stack)-1]
    stack = arrays.slice(stack,0,len(stack)-1)
    if num < 0 then
      if len(leaves) < 1024 then leaves = leaves + [-1-num] end if
    else
      node = work.world.nodes[num]
      side = boxSide(mins,maxs,node.plane)
      if side == 1 then
        stack = stack+[node.children[0]]
      else if side == 2 then
        stack = stack+[node.children[1]]
      else
        stack = stack+[node.children[1],node.children[0]]
      end if
    end if
  end while
  for each leaf in leaves
    throughLeaf(work,work.world.leaves[leaf],true)
    if work.trace.allsolid then break end if
  end for
  return void
end function

function interpolate(a,b,fraction)
  result = array(3,0.0)
  for axis = 0 to 2
    result[axis] = n.fadd(a[axis],n.fmul(fraction,n.fsub(b[axis],a[axis])))
  end for
  return result
end function

function throughTree(work)
  // Depth-first stack retains the original near-child/far-child visit order.
  stack = [[0,0.0,1.0,work.start,work.finish]]
  while len(stack) > 0
    item = stack[len(stack)-1]
    stack = arrays.slice(stack,0,len(stack)-1)
    num = item[0]; p1f = item[1]; p2f = item[2]; p1 = item[3]; p2 = item[4]
    if work.trace.fraction <= p1f then continue end if
    if num < 0 then throughLeaf(work,work.world.leaves[-1-num],false); continue end if
    node = work.world.nodes[num]
    t1 = 0.0; t2 = 0.0; offset = 0.0
    if node.axis < 3 then
      t1 = n.fsub(p1[node.axis],node.plane.distance)
      t2 = n.fsub(p2[node.axis],node.plane.distance)
      if not work.isPoint then offset = work.maxs[node.axis] end if
    else
      t1 = n.fsub(q.DotProduct(node.plane.normal,p1),node.plane.distance)
      t2 = n.fsub(q.DotProduct(node.plane.normal,p2),node.plane.distance)
      if not work.isPoint then offset = n.f32(2048) end if
    end if
    if t1 >= n.fadd(offset,1.0) and t2 >= n.fadd(offset,1.0) then
      stack = stack+[[node.children[0],p1f,p2f,p1,p2]]; continue
    end if
    if t1 < n.fsub(-offset,1.0) and t2 < n.fsub(-offset,1.0) then
      stack = stack+[[node.children[1],p1f,p2f,p1,p2]]; continue
    end if
    side = 0; fraction = n.f32(1); fraction2 = n.f32(0)
    if t1 < t2 then
      inverse = n.f32(1.0/n.fsub(t1,t2))
      side = 1
      fraction2 = n.f32((n.fadd(t1,offset)+0.125)*inverse)
      fraction = n.f32((n.fsub(t1,offset)+0.125)*inverse)
    else if t1 > t2 then
      inverse = n.f32(1.0/n.fsub(t1,t2))
      fraction2 = n.f32((n.fsub(t1,offset)-0.125)*inverse)
      fraction = n.f32((n.fadd(t1,offset)+0.125)*inverse)
    end if
    fraction = max(0.0,min(1.0,fraction))
    fraction2 = max(0.0,min(1.0,fraction2))
    midf = n.fadd(p1f,n.fmul(n.fsub(p2f,p1f),fraction))
    midf2 = n.fadd(p1f,n.fmul(n.fsub(p2f,p1f),fraction2))
    stack = stack+[[node.children[side^1],midf2,p2f,interpolate(p1,p2,fraction2),p2], [node.children[side],p1f,midf,p1,interpolate(p1,p2,fraction)]]
  end while
  return void
end function

function traceWithSphere(world, start, finish, mins, maxs, model, mask, capsule,curves,sphere)
  checkModel(world,model)
  if curves and not world.patchesReady then return fail("patch geometry has not been loaded") end if
  if mins == void then mins = [0.0,0.0,0.0] end if
  if maxs == void then maxs = [0.0,0.0,0.0] end if
  start = vector32(start);finish = vector32(finish);mins = vector32(mins);maxs = vector32(maxs)
  for axis = 0 to 2
    if mins[axis] > maxs[axis] then return fail("inverted trace bounds") end if
  end for
  center = array(3,0.0); lo = array(3,0.0); hi = array(3,0.0)
  a = array(3,0.0); b = array(3,0.0)
  for axis = 0 to 2
    center[axis] = n.fmul(n.fadd(mins[axis],maxs[axis]),0.5)
    lo[axis] = n.fsub(mins[axis],center[axis])
    hi[axis] = n.fsub(maxs[axis],center[axis])
    a[axis] = n.fadd(start[axis],center[axis])
    b[axis] = n.fadd(finish[axis],center[axis])
  end for
  radius = min(hi[0],hi[2])
  capsuleOffset = [0.0,0.0,n.fsub(hi[2],radius)]
  if sphere != void then radius = sphere[0]; capsuleOffset = sphere[1] end if
  boundsMin = array(3,0.0); boundsMax = array(3,0.0)
  for axis = 0 to 2
    if capsule then
      boundsMin[axis] = n.f32(min(a[axis],b[axis])-abs(capsuleOffset[axis])-radius)
      boundsMax[axis] = n.f32(max(a[axis],b[axis])+abs(capsuleOffset[axis])+radius)
    else
      boundsMin[axis] = n.fadd(min(a[axis],b[axis]),lo[axis])
      boundsMax[axis] = n.fadd(max(a[axis],b[axis]),hi[axis])
    end if
  end for
  point = lo[0] == 0 and lo[1] == 0 and lo[2] == 0
  work = Work(world,brush.emptyTrace(),a,b,lo,hi,boundsMin,boundsMax,capsule,radius,capsuleOffset,mask,point,array(len(world.brushes),false),array(len(world.surfaces),false),curves)
  stationary = start[0] == finish[0] and start[1] == finish[1] and start[2] == finish[2]
  // Original CM_Trace assigns isPoint only in its non-stationary branch.
  if stationary then work.isPoint = false end if
  if model == 255 and model >= len(world.models) then
    temp = world.temporary.brush
    if (temp.contents & mask) != 0 then
      if stationary then testInBrush(work,temp)
      else brush.traceThroughBrush(work.trace,temp.planes,temp.contents,a,b,lo,hi,capsule,radius,capsuleOffset) end if
    end if
    // Temporary negative axial planes keep types 3,4,5; map planes use 3.
    for axis = 0 to 2
      if work.trace.normal[axis] == -1 then work.trace.planeMetadata = (3+axis) | (1 << (axis+8)) end if
    end for
  else if model != 0 then
    throughLeaf(work,world.models[model],stationary)
  else if stationary then
    positionTest(work)
  else
    throughTree(work)
  end if
  endpos = finish
  if work.trace.fraction != 1 then endpos = interpolate(start,finish,work.trace.fraction) end if
  return Result(work.trace,endpos)
end function

function enumerateLeaves(world,mins,maxs)
  mins = vector32(mins); maxs = vector32(maxs)
  for axis = 0 to 2
    if mins[axis] > maxs[axis] then return fail("inverted query bounds") end if
  end for
  stack = [0]; leaves = []
  while len(stack) > 0
    num = stack[len(stack)-1]; stack = arrays.slice(stack,0,len(stack)-1)
    if num < 0 then leaves = leaves+[-1-num]
    else
      node = world.nodes[num]; side = boxSide(mins,maxs,node.plane)
      if side == 1 then stack = stack+[node.children[0]]
      else if side == 2 then stack = stack+[node.children[1]]
      else stack = stack+[node.children[1],node.children[0]] end if
    end if
  end while
  return leaves
end function

function boxLeafnums(world,mins,maxs,capacity)
  if capacity < 0 or capacity > 131072 then return fail("invalid leaf-list capacity") end if
  result = LeafList([],0,false)
  for each leaf in enumerateLeaves(world,mins,maxs)
    if vis.leafCluster(world.visibility,leaf) != -1 then result.lastLeaf = leaf end if
    if len(result.entries) >= capacity then result.overflowed = true
    else result.entries = result.entries+[leaf] end if
  end for
  return result
end function

function boxBrushes(world,mins,maxs,capacity)
  if capacity < 0 or capacity > 131072 then return fail("invalid brush-list capacity") end if
  mins = vector32(mins); maxs = vector32(maxs)
  result = LeafList([],0,false); seen = array(len(world.brushes),false)
  for each leaf in enumerateLeaves(world,mins,maxs)
    for each index in world.leaves[leaf].brushes
      if seen[index] then continue end if
      seen[index] = true; b = world.brushes[index]; overlaps = true
      for axis = 0 to 2
        if b.mins[axis] >= maxs[axis] or b.maxs[axis] <= mins[axis] then overlaps = false; break end if
      end for
      if not overlaps then continue end if
      if len(result.entries) >= capacity then result.overflowed = true; break end if
      result.entries = result.entries+[index]
    end for
  end for
  return result
end function

function trace(world,start,finish,mins,maxs,model,mask,capsule,curves)
  return traceWithSphere(world,start,finish,mins,maxs,model,mask,capsule,curves,void)
end function

function rotationMatrix(angles)
  matrix = q.AngleVectors(angles)
  for axis = 0 to 2
    matrix[1][axis] = n.fneg(matrix[1][axis])
  end for
  return matrix
end function

function rotatePoint(point,matrix)
  return [q.DotProduct(matrix[0],point),q.DotProduct(matrix[1],point),q.DotProduct(matrix[2],point)]
end function

function transpose(matrix)
  return [[matrix[0][0],matrix[1][0],matrix[2][0]],[matrix[0][1],matrix[1][1],matrix[2][1]],[matrix[0][2],matrix[1][2],matrix[2][2]]]
end function

function transformedPointContents(world,point,model,origin,angles)
  point = vector32(point); origin = vector32(origin); angles = vector32(angles)
  localPoint = array(3,0.0)
  for axis = 0 to 2
    localPoint[axis] = n.fsub(point[axis],origin[axis])
  end for
  if model != 255 and (angles[0] != 0 or angles[1] != 0 or angles[2] != 0) then
    // The original negates the dot product, not each right-vector component.
    axes = q.AngleVectors(angles)
    localPoint = [q.DotProduct(localPoint,axes[0]),n.fneg(q.DotProduct(localPoint,axes[1])),q.DotProduct(localPoint,axes[2])]
  end if
  return pointContents(world,localPoint,model)
end function

function transformedTrace(world,start,finish,mins,maxs,model,mask,origin,angles,capsule,curves)
  start = vector32(start); finish = vector32(finish); origin = vector32(origin); angles = vector32(angles)
  if mins == void then mins = [0.0,0.0,0.0] end if
  if maxs == void then maxs = [0.0,0.0,0.0] end if
  mins = vector32(mins); maxs = vector32(maxs)
  a = array(3,0.0); b = array(3,0.0); lo = array(3,0.0); hi = array(3,0.0)
  for axis = 0 to 2
    if mins[axis] > maxs[axis] then return fail("inverted trace bounds") end if
    offset = n.fmul(n.fadd(mins[axis],maxs[axis]),0.5)
    lo[axis] = n.fsub(mins[axis],offset); hi[axis] = n.fsub(maxs[axis],offset)
    a[axis] = n.fsub(n.fadd(start[axis],offset),origin[axis])
    b[axis] = n.fsub(n.fadd(finish[axis],offset),origin[axis])
  end for
  rotated = model != 255 and (angles[0] != 0 or angles[1] != 0 or angles[2] != 0)
  radius = min(hi[0],hi[2]); t = n.fsub(hi[2],radius)
  sphereOffset = [0.0,0.0,t]; matrix = void
  if rotated then
    matrix = rotationMatrix(angles); a = rotatePoint(a,matrix); b = rotatePoint(b,matrix)
    // Preserve the original sign on the second capsule-offset component.
    sphereOffset = [n.fmul(matrix[0][2],t),n.fmul(n.fneg(matrix[1][2]),t),n.fmul(matrix[2][2],t)]
  end if
  result = traceWithSphere(world,a,b,lo,hi,model,mask,capsule,curves,[radius,sphereOffset])
  if rotated and result.trace.fraction != 1 then result.trace.normal = rotatePoint(result.trace.normal,transpose(matrix)) end if
  // Plane distance/type/signbits intentionally remain in the model's frame.
  // Unlike CM_BoxTrace, this interpolation is executed even on a miss.
  result.endpos = interpolate(start,finish,result.trace.fraction)
  return result
end function

function vector32(value)
  if typeof(value) != "array" or len(value) != 3 then return fail("expected a three-component vector") end if
  result = array(3,0.0)
  for axis = 0 to 2
    result[axis] = n.f32(value[axis])
    if (n.floatBits(result[axis]) & 0x7f800000) == 0x7f800000 then return fail("non-finite trace coordinate") end if
  end for
  return result
end function

function boxTraceNoCurves(world,start,finish,mins,maxs,model,mask,capsule)
  return trace(world,start,finish,mins,maxs,model,mask,capsule,false)
end function

function boxTrace(world,start,finish,mins,maxs,model,mask,capsule)
  return trace(world,start,finish,mins,maxs,model,mask,capsule,true)
end function
