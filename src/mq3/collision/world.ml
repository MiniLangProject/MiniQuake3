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
import mq3.qcommon.md4 as md4
import mq3.qcommon.headers as qcommonHeaders
import std.array as arrays

struct Shader name surfaceFlags contentFlags end struct
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
  entityString
  shaders
  checksum
  name
end struct
struct Submodels models bounds end struct
struct MapState world name checksum lastChecksum curves end struct
struct LoadResult world checksum cached end struct
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
  halfheight
  capsuleOffset
  modelOrigin
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

// BSPC's local SetPlaneSignbits and the qcommon loader use the same bit order.
function SetPlaneSignbits(normal)
  bits=0;for axis=0 to 2 if normal[axis]<0.0 then bits=bits|(1<<axis) end if end for;return bits
end function
function shaderName(data,offset)
  count=0;while count<64 and data[offset+count]!=0 count=count+1 end while;return decode(slice(data,offset,count))
end function
function CMod_LoadShaders(map)
  if map.counts[1]<1 then return fail("map has no shaders") end if
  values=array(map.counts[1],void);for index=0 to len(values)-1 off=map.offsets[1]+index*72;values[index]=Shader(shaderName(map.data,off),n.readI32(map.data,off+64),n.readI32(map.data,off+68)) end for;return values
end function
function CMod_LoadPlanes(map)
  if map.counts[2]<1 then return fail("map has no planes") end if
  values=array(map.counts[2],void);for index=0 to len(values)-1 off=map.offsets[2]+index*16;normal=[real(map.data,off),real(map.data,off+4),real(map.data,off+8)];values[index]=brush.Plane(normal,real(map.data,off+12),SetPlaneSignbits(normal)) end for;return values
end function
function CMod_LoadBrushSides(map,planes,shaders)
  values=array(map.counts[9],void);index=0;while index<len(values) off=map.offsets[9]+index*8;planeNumber=n.readI32(map.data,off);shaderNumber=n.readI32(map.data,off+4);if planeNumber<0 or planeNumber>=len(planes) or shaderNumber<0 or shaderNumber>=len(shaders) then return fail("invalid brush side reference") end if;plane=planes[planeNumber];values[index]=brush.Plane(plane.normal,plane.distance,shaders[shaderNumber].surfaceFlags);index=index+1 end while;return values
end function
function CM_BoundBrush(sides)
  if sides==void or len(sides)<6 then return fail("brush lacks six axial bounding planes") end if
  return [[0.0-sides[0].distance,0.0-sides[2].distance,0.0-sides[4].distance],[sides[1].distance,sides[3].distance,sides[5].distance]]
end function
function CMod_LoadBrushes(map,sides,shaders)
  values=array(map.counts[8],void);index=0;while index<len(values) off=map.offsets[8]+index*12;first=n.readI32(map.data,off);count=n.readI32(map.data,off+4);shaderNumber=n.readI32(map.data,off+8);if count<6 or first<0 or first+count>len(sides) or shaderNumber<0 or shaderNumber>=len(shaders) then return fail("invalid brush record") end if;selected=arrays.slice(sides,first,count);bounds=CM_BoundBrush(selected);values[index]=Brush(selected,shaders[shaderNumber].contentFlags,bounds[0],bounds[1]);index=index+1 end while;return values
end function
function CMod_LoadLeafBrushes(map)
  values=array(map.counts[6],0);index=0;while index<len(values) values[index]=n.readI32(map.data,map.offsets[6]+index*4);index=index+1 end while;return values
end function
function CMod_LoadLeafSurfaces(map)
  values=array(map.counts[5],0);index=0;while index<len(values) values[index]=n.readI32(map.data,map.offsets[5]+index*4);index=index+1 end while;return values
end function
function CMod_LoadLeafs(map,leafBrushes,leafSurfaces)
  if map.counts[4]<1 then return fail("map has no leaves") end if
  values=array(map.counts[4],void);for index=0 to len(values)-1 off=map.offsets[4]+index*48;firstSurface=n.readI32(map.data,off+32);surfaceCount=n.readI32(map.data,off+36);firstBrush=n.readI32(map.data,off+40);brushCount=n.readI32(map.data,off+44);if firstSurface<0 or surfaceCount<0 or firstSurface+surfaceCount>len(leafSurfaces) or firstBrush<0 or brushCount<0 or firstBrush+brushCount>len(leafBrushes) then return fail("invalid leaf range") end if;values[index]=Leaf(arrays.slice(leafBrushes,firstBrush,brushCount),arrays.slice(leafSurfaces,firstSurface,surfaceCount)) end for;return values
end function
function CMod_LoadNodes(map,planes)
  if map.counts[3]<1 then return fail("map has no nodes") end if
  values=array(map.counts[3],void);for index=0 to len(values)-1 off=map.offsets[3]+index*36;planeNumber=n.readI32(map.data,off);if planeNumber<0 or planeNumber>=len(planes) then return fail("invalid node plane") end if;plane=planes[planeNumber];values[index]=Node(plane,planeType(plane.normal),[n.readI32(map.data,off+4),n.readI32(map.data,off+8)]) end for;return values
end function
function CMod_LoadSubmodels(map)
  if map.counts[7]<1 then return fail("map has no models") end if;if map.counts[7]>qcommonHeaders.MAX_SUBMODELS then return fail("MAX_SUBMODELS exceeded") end if
  models=array(map.counts[7],void);bounds=array(map.counts[7],void)
  for index=0 to len(models)-1
    off=map.offsets[7]+index*40;lower=[];upper=[]
    for axis=0 to 2 lower=lower+[n.fsub(real(map.data,off+axis*4),1.0)];upper=upper+[n.fadd(real(map.data,off+12+axis*4),1.0)] end for
    for axis=0 to 2 if lower[axis]>upper[axis] then return fail("inverted model bounds") end if end for
    // The original leaves the world model's synthetic leaf empty. World
    // collision reaches its real leaves through the BSP node tree.
    brushes=[];surfaces=[]
    if index!=0 then
      firstSurface=n.readI32(map.data,off+24);surfaceCount=n.readI32(map.data,off+28);firstBrush=n.readI32(map.data,off+32);brushCount=n.readI32(map.data,off+36)
      if firstSurface<0 or surfaceCount<0 or firstSurface+surfaceCount>map.counts[13] or firstBrush<0 or brushCount<0 or firstBrush+brushCount>map.counts[8] then return fail("invalid submodel range") end if
      cursor=0;while cursor<brushCount brushes=brushes+[firstBrush+cursor];cursor=cursor+1 end while
      cursor=0;while cursor<surfaceCount surfaces=surfaces+[firstSurface+cursor];cursor=cursor+1 end while
    end if
    models[index]=Leaf(brushes,surfaces);bounds[index]=[lower,upper]
  end for
  return Submodels(models,bounds)
end function
function CMod_LoadEntityString(map) return decode(slice(map.data,map.offsets[0],map.lengths[0])) end function
function CMod_LoadVisibility(map) return vis.load(map) end function
function CMod_LoadPatches(map,shaders,curves)
  surfaces=array(map.counts[13],void);if not curves then return surfaces end if
  index=0;while index<len(surfaces) off=map.offsets[13]+index*104;if n.readI32(map.data,off+8)==2 then width=n.readI32(map.data,off+96);height=n.readI32(map.data,off+100);count=width*height;first=n.readI32(map.data,off+12);shaderNumber=n.readI32(map.data,off);if width<3 or height<3 or width>129 or height>129 or count>1024 or count>n.readI32(map.data,off+16) or first<0 or first+count>map.counts[10] or shaderNumber<0 or shaderNumber>=len(shaders) then return fail("invalid BSP patch") end if;points=[];cursor=0;while cursor<count location=map.offsets[10]+(first+cursor)*44;points=points+[[real(map.data,location),real(map.data,location+4),real(map.data,location+8)]];cursor=cursor+1 end while;surfaces[index]=Surface(mesh.CM_GeneratePatchCollide(width,height,points),shaders[shaderNumber].contentFlags,shaders[shaderNumber].surfaceFlags) end if;index=index+1 end while;return surfaces
end function
function CM_LumpChecksum(map,lump) if lump<0 or lump>=17 then return fail("invalid checksum lump") end if;return md4.blockChecksum(slice(map.data,map.offsets[lump],map.lengths[lump])) end function
function CM_Checksum(map)
  order=[1,4,6,5,2,9,8,7,3,13,10];data=bytes(44,0);for index=0 to 10 n.writeU32(data,index*4,CM_LumpChecksum(map,order[index])) end for;return md4.blockChecksum(data)
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
  shaders=CMod_LoadShaders(map);planes=CMod_LoadPlanes(map);sides=CMod_LoadBrushSides(map,planes,shaders);brushes=CMod_LoadBrushes(map,sides,shaders)
  nodes=CMod_LoadNodes(map,planes)
  checkTree(nodes)
  leafBrushes=CMod_LoadLeafBrushes(map);leafSurfaces=CMod_LoadLeafSurfaces(map);leaves=CMod_LoadLeafs(map,leafBrushes,leafSurfaces)
  submodels=CMod_LoadSubmodels(map);models=submodels.models;modelBounds=submodels.bounds
  surfaces=CMod_LoadPatches(map,shaders,curves);visibility=CMod_LoadVisibility(map);entityText=CMod_LoadEntityString(map);checksum=md4.blockChecksum(data)
  zero = [0.0,0.0,0.0]
  world=World(brushes,nodes,leaves,models,surfaces,curves,true,modelBounds,Temporary([zero,zero],makeBox(zero,zero)),visibility,entityText,shaders,checksum,"")
  CM_InitBoxHull(world);return world
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
  // The original capsule handle updates the shared bounds but deliberately
  // leaves the temporary box planes untouched. Reciprocal box-vs-capsule
  // paths create their replacement box only after consuming these bounds.
  if capsule then return qcommonHeaders.CAPSULE_MODEL_HANDLE end if
  world.temporary.brush = makeBox(mins,maxs)
  return qcommonHeaders.BOX_MODEL_HANDLE
end function

function CM_InitBoxHull(world)
  if world==void then return fail("box hull requires a loaded map") end if;zero=[0.0,0.0,0.0];world.temporary=Temporary([zero,zero],makeBox(zero,zero));return void
end function
function CM_TempBoxModel(world,mins,maxs,capsule) return tempBoxModel(world,mins,maxs,capsule) end function

function checkModel(world,model)
  if model >= 0 and (model < len(world.models) or model == qcommonHeaders.CAPSULE_MODEL_HANDLE or model == qcommonHeaders.BOX_MODEL_HANDLE) then return true end if
  return fail("invalid model handle")
end function

function modelBounds(world,model)
  checkModel(world,model)
  if model==qcommonHeaders.CAPSULE_MODEL_HANDLE then return fail("bad clip handle") end if
  bounds = world.temporary.bounds
  if model < len(world.models) then bounds = world.bounds[model] end if
  return [arrays.slice(bounds[0],0,3),arrays.slice(bounds[1],0,3)]
end function

function CM_ClipHandleToModel(world,handle)
  if world==void or handle<0 then return fail("bad clip handle") end if
  if handle<len(world.models) then return world.models[handle] end if
  // CM_ClipHandleToModel exposes only the box hull.  The capsule handle is
  // consumed directly by trace code and must remain invalid here.
  if handle==qcommonHeaders.BOX_MODEL_HANDLE then return world.temporary end if
  return fail("bad clip handle")
end function
function CM_ModelBounds(world,model) return modelBounds(world,model) end function

function inlineModel(world,index)
  if index < 0 or index >= len(world.models) then return fail("invalid inline model") end if
  return index
end function
function CM_InlineModel(world,index) return inlineModel(world,index) end function
function CM_NumClusters(world) if world==void then return 0 end if;return world.visibility.numClusters end function
function CM_NumInlineModels(world) if world==void then return 0 end if;return len(world.models) end function
function CM_EntityString(world) if world==void then return "" end if;return world.entityString end function
function CM_LeafCluster(world,leaf) if world==void then return fail("leaf cluster requires a loaded map") end if;return vis.leafCluster(world.visibility,leaf) end function
function CM_LeafArea(world,leaf) if world==void then return fail("leaf area requires a loaded map") end if;return vis.leafArea(world.visibility,leaf) end function

function mapState(curves) return MapState(void,"",0,0,curves) end function
function CM_ClearMap(state) if state!=void then state.world=void;state.name="";state.checksum=0 end if;return void end function
function CM_LoadMap(state,name,data,clientload)
  if state==void then return fail("map state required") end if
  if name==void or name=="" then return fail("NULL map name") end if
  if state.world!=void and state.name==name and clientload then return LoadResult(state.world,state.lastChecksum,true) end if
  CM_ClearMap(state);if data==void or typeof(data)!="bytes" then return fail("map data missing") end if
  world=loadWorld(data,state.curves);if world is error then return world end if;checksum=md4.blockChecksum(data);world.checksum=checksum
  if not clientload then state.name=name;world.name=name end if
  state.world=world;state.checksum=checksum;state.lastChecksum=checksum;return LoadResult(world,checksum,false)
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
  if model == qcommonHeaders.CAPSULE_MODEL_HANDLE and model >= len(world.models) then
    bounds=world.temporary.bounds;center=array(3,0.0)
    for axis=0 to 2 center[axis]=n.fmul(n.fadd(bounds[0][axis],bounds[1][axis]),0.5) end for
    halfwidth=n.fsub(bounds[1][0],center[0]);halfheight=n.fsub(bounds[1][2],center[2]);radius=min(halfwidth,halfheight);offset=n.fsub(halfheight,radius)
    z=point[2]
    if z>n.fadd(center[2],offset) then z=n.fadd(center[2],offset) end if
    if z<n.fsub(center[2],offset) then z=n.fsub(center[2],offset) end if
    delta=[n.fsub(point[0],center[0]),n.fsub(point[1],center[1]),n.fsub(point[2],z)]
    if q.DotProduct(delta,delta)<=n.fmul(radius,radius) then contents=0x2000000 end if
    return n.i32(contents)
  end if
  if model == qcommonHeaders.BOX_MODEL_HANDLE and model >= len(world.models) then
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
        if patches.CM_PositionTestInPatchCollide(work,surface.patch) then
          work.trace.startsolid = true;work.trace.allsolid = true
          work.trace.fraction = n.f32(0);work.trace.contents = surface.contents
        end if
      else
        previous = work.trace.fraction
        patches.CM_TraceThroughPatchCollide(work,surface.patch,work.world.playerCurveClip)
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
  // The BSP has already been validated as a tree, so its maximum pending
  // frontier is bounded. An indexed stack avoids copying that frontier on
  // every pop and push in each gameplay trace.
  stack = array(len(work.world.nodes)+1,void); top = 0
  stack[0] = [0,0.0,1.0,work.start,work.finish]
  while top >= 0
    item = stack[top]; top = top-1
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
      top = top+1; stack[top] = [node.children[0],p1f,p2f,p1,p2]; continue
    end if
    if t1 < n.fsub(-offset,1.0) and t2 < n.fsub(-offset,1.0) then
      top = top+1; stack[top] = [node.children[1],p1f,p2f,p1,p2]; continue
    end if
    side = 0; fraction = n.f32(1); fraction2 = n.f32(0)
    if t1 < t2 then
      inverse = n.f32(1.0/n.fsub(t1,t2))
      side = 1
      fraction2 = n.f32((n.fadd(t1,offset)+qcommonHeaders.SURFACE_CLIP_EPSILON)*inverse)
      fraction = n.f32((n.fsub(t1,offset)+qcommonHeaders.SURFACE_CLIP_EPSILON)*inverse)
    else if t1 > t2 then
      inverse = n.f32(1.0/n.fsub(t1,t2))
      fraction2 = n.f32((n.fsub(t1,offset)-qcommonHeaders.SURFACE_CLIP_EPSILON)*inverse)
      fraction = n.f32((n.fadd(t1,offset)+qcommonHeaders.SURFACE_CLIP_EPSILON)*inverse)
    end if
    fraction = max(0.0,min(1.0,fraction))
    fraction2 = max(0.0,min(1.0,fraction2))
    midf = n.fadd(p1f,n.fmul(n.fsub(p2f,p1f),fraction))
    midf2 = n.fadd(p1f,n.fmul(n.fsub(p2f,p1f),fraction2))
    top = top+1; stack[top] = [node.children[side^1],midf2,p2f,interpolate(p1,p2,fraction2),p2]
    top = top+1; stack[top] = [node.children[side],p1f,midf,p1,interpolate(p1,p2,fraction)]
  end while
  return void
end function

function capsuleTarget(world,model)
  bounds = world.temporary.bounds
  if model!=qcommonHeaders.CAPSULE_MODEL_HANDLE then bounds=modelBounds(world,model) end if
  center=array(3,0.0);lo=array(3,0.0);hi=array(3,0.0)
  for axis=0 to 2
    center[axis]=n.fmul(n.fadd(bounds[0][axis],bounds[1][axis]),0.5)
    lo[axis]=n.fsub(bounds[0][axis],center[axis]);hi[axis]=n.fsub(bounds[1][axis],center[axis])
  end for
  halfwidth=hi[0];halfheight=hi[2];radius=min(halfwidth,halfheight);offset=n.fsub(halfheight,radius)
  top=[center[0],center[1],n.fadd(center[2],offset)]
  bottom=[center[0],center[1],n.fsub(center[2],offset)]
  return [bounds,center,lo,hi,radius,halfheight,top,bottom]
end function

function markCapsulePositionHit(work)
  work.trace.startsolid=true;work.trace.allsolid=true;work.trace.fraction=n.f32(0)
  return void
end function

function testCapsuleInCapsule(work,model)
  target=capsuleTarget(work.world,model);radius=target[4]
  top=[n.fadd(work.start[0],work.capsuleOffset[0]),n.fadd(work.start[1],work.capsuleOffset[1]),n.fadd(work.start[2],work.capsuleOffset[2])]
  bottom=[n.fsub(work.start[0],work.capsuleOffset[0]),n.fsub(work.start[1],work.capsuleOffset[1]),n.fsub(work.start[2],work.capsuleOffset[2])]
  combined=n.fadd(work.radius,radius);squared=n.fmul(combined,combined)
  for each targetPoint in [target[6],target[7]]
    if brush.vectorDistanceSquared(targetPoint,top)<squared then markCapsulePositionHit(work) end if
    if brush.vectorDistanceSquared(targetPoint,bottom)<squared then markCapsulePositionHit(work) end if
  end for
  // Keep the original comparison order (p1 is the upper sphere center and p2
  // the lower one), including its historically unreachable cylinder clause.
  if (top[2]>=target[6][2] and top[2]<=target[7][2]) or (bottom[2]>=target[6][2] and bottom[2]<=target[7][2]) then
    top2=[top[0],top[1],0.0];target2=[target[6][0],target[6][1],0.0]
    if brush.vectorDistanceSquared(top2,target2)<squared then markCapsulePositionHit(work) end if
  end if
  return void
end function

function reciprocalCapsuleWork(work,model)
  target=capsuleTarget(work.world,model);center=target[1]
  for axis=0 to 2
    work.start[axis]=n.fsub(work.start[axis],center[axis]);work.finish[axis]=n.fsub(work.finish[axis],center[axis])
  end for
  work.capsule=true;work.radius=target[4];work.halfheight=target[5]
  work.capsuleOffset=[0.0,0.0,n.fsub(target[5],target[4])]
  tempBoxModel(work.world,work.mins,work.maxs,false)
  return work.world.temporary.brush
end function

function testBoundingBoxInCapsule(work,model)
  box=reciprocalCapsuleWork(work,model)
  if (box.contents & work.mask)!=0 then testInBrush(work,box) end if
  return void
end function

function traceThroughSphere(work,origin,radius,start,finish)
  direction=[n.fsub(start[0],origin[0]),n.fsub(start[1],origin[1]),n.fsub(start[2],origin[2])]
  lengthSquared=q.DotProduct(direction,direction);radiusSquared=n.fmul(radius,radius)
  if lengthSquared<radiusSquared then
    work.trace.fraction=n.f32(0);work.trace.startsolid=true
    direction=[n.fsub(finish[0],origin[0]),n.fsub(finish[1],origin[1]),n.fsub(finish[2],origin[2])]
    if q.DotProduct(direction,direction)<radiusSquared then work.trace.allsolid=true end if
    return void
  end if
  direction=[n.fsub(finish[0],start[0]),n.fsub(finish[1],start[1]),n.fsub(finish[2],start[2])]
  length=q.VectorNormalize(direction)
  lineDistance=brush.distanceFromLineSquared(origin,start,finish,direction)
  endDelta=[n.fsub(finish[0],origin[0]),n.fsub(finish[1],origin[1]),n.fsub(finish[2],origin[2])]
  epsilonRadius=n.fadd(radius,1.0)
  if lineDistance>=radiusSquared and q.DotProduct(endDelta,endDelta)>n.fmul(n.fadd(radius,qcommonHeaders.SURFACE_CLIP_EPSILON),n.fadd(radius,qcommonHeaders.SURFACE_CLIP_EPSILON)) then return void end if
  delta=[n.fsub(start[0],origin[0]),n.fsub(start[1],origin[1]),n.fsub(start[2],origin[2])]
  b=n.fmul(2.0,q.DotProduct(direction,delta))
  c=n.fsub(q.DotProduct(delta,delta),n.fmul(epsilonRadius,epsilonRadius))
  discriminant=n.fsub(n.fmul(b,b),n.fmul(4.0,c))
  if discriminant>0.0 then
    fraction=n.fmul(n.fsub(n.fneg(b),brush.squareRootFloat(discriminant)),0.5)
    if fraction<0.0 then fraction=n.f32(0) else fraction=n.fdiv(fraction,length) end if
    if fraction<work.trace.fraction then
      segment=[n.fsub(finish[0],start[0]),n.fsub(finish[1],start[1]),n.fsub(finish[2],start[2])]
      intersection=q.VectorMA(start,fraction,segment)
      normal=[n.fsub(intersection[0],origin[0]),n.fsub(intersection[1],origin[1]),n.fsub(intersection[2],origin[2])]
      normal=q.VectorScale(normal,n.fdiv(1.0,epsilonRadius))
      work.trace.fraction=fraction;work.trace.normal=normal
      planePoint=[n.fadd(work.modelOrigin[0],intersection[0]),n.fadd(work.modelOrigin[1],intersection[1]),n.fadd(work.modelOrigin[2],intersection[2])]
      work.trace.distance=q.DotProduct(normal,planePoint);work.trace.contents=0x2000000
    end if
  end if
  return void
end function

function traceThroughVerticalCylinder(work,origin,radius,halfheight,start,finish)
  start2d=[start[0],start[1],0.0];finish2d=[finish[0],finish[1],0.0];origin2d=[origin[0],origin[1],0.0]
  radiusSquared=n.fmul(radius,radius)
  if start[2]<=n.fadd(origin[2],halfheight) and start[2]>=n.fsub(origin[2],halfheight) then
    delta=[n.fsub(start2d[0],origin2d[0]),n.fsub(start2d[1],origin2d[1]),0.0]
    if q.DotProduct(delta,delta)<radiusSquared then
      work.trace.fraction=n.f32(0);work.trace.startsolid=true
      delta=[n.fsub(finish2d[0],origin2d[0]),n.fsub(finish2d[1],origin2d[1]),0.0]
      if q.DotProduct(delta,delta)<radiusSquared then work.trace.allsolid=true end if
      return void
    end if
  end if
  direction=[n.fsub(finish2d[0],start2d[0]),n.fsub(finish2d[1],start2d[1]),0.0]
  length=q.VectorNormalize(direction)
  lineDistance=brush.distanceFromLineSquared(origin2d,start2d,finish2d,direction)
  endDelta=[n.fsub(finish2d[0],origin2d[0]),n.fsub(finish2d[1],origin2d[1]),0.0]
  if lineDistance>=radiusSquared and q.DotProduct(endDelta,endDelta)>n.fmul(n.fadd(radius,qcommonHeaders.SURFACE_CLIP_EPSILON),n.fadd(radius,qcommonHeaders.SURFACE_CLIP_EPSILON)) then return void end if
  delta=[n.fsub(start[0],origin[0]),n.fsub(start[1],origin[1]),n.fsub(start[2],origin[2])]
  b=n.fmul(2.0,n.fadd(n.fmul(delta[0],direction[0]),n.fmul(delta[1],direction[1])))
  epsilonRadius=n.fadd(radius,1.0)
  c=n.fsub(n.fadd(n.fmul(delta[0],delta[0]),n.fmul(delta[1],delta[1])),n.fmul(epsilonRadius,epsilonRadius))
  discriminant=n.fsub(n.fmul(b,b),n.fmul(4.0,c))
  if discriminant>0.0 then
    fraction=n.fmul(n.fsub(n.fneg(b),brush.squareRootFloat(discriminant)),0.5)
    if fraction<0.0 then fraction=n.f32(0) else fraction=n.fdiv(fraction,length) end if
    if fraction<work.trace.fraction then
      segment=[n.fsub(finish[0],start[0]),n.fsub(finish[1],start[1]),n.fsub(finish[2],start[2])]
      intersection=q.VectorMA(start,fraction,segment)
      if intersection[2]<=n.fadd(origin[2],halfheight) and intersection[2]>=n.fsub(origin[2],halfheight) then
        normal=[n.fsub(intersection[0],origin[0]),n.fsub(intersection[1],origin[1]),0.0]
        normal=q.VectorScale(normal,n.fdiv(1.0,epsilonRadius))
        work.trace.fraction=fraction;work.trace.normal=normal
        planePoint=[n.fadd(work.modelOrigin[0],intersection[0]),n.fadd(work.modelOrigin[1],intersection[1]),n.fadd(work.modelOrigin[2],intersection[2])]
        work.trace.distance=q.DotProduct(normal,planePoint);work.trace.contents=0x2000000
      end if
    end if
  end if
  return void
end function

function traceCapsuleThroughCapsule(work,model)
  target=capsuleTarget(work.world,model);bounds=target[0]
  for axis=0 to 2
    if work.boundsMin[axis]>n.fadd(bounds[1][axis],1.0) or work.boundsMax[axis]<n.fsub(bounds[0][axis],1.0) then return void end if
  end for
  startTop=[n.fadd(work.start[0],work.capsuleOffset[0]),n.fadd(work.start[1],work.capsuleOffset[1]),n.fadd(work.start[2],work.capsuleOffset[2])]
  startBottom=[n.fsub(work.start[0],work.capsuleOffset[0]),n.fsub(work.start[1],work.capsuleOffset[1]),n.fsub(work.start[2],work.capsuleOffset[2])]
  endTop=[n.fadd(work.finish[0],work.capsuleOffset[0]),n.fadd(work.finish[1],work.capsuleOffset[1]),n.fadd(work.finish[2],work.capsuleOffset[2])]
  endBottom=[n.fsub(work.finish[0],work.capsuleOffset[0]),n.fsub(work.finish[1],work.capsuleOffset[1]),n.fsub(work.finish[2],work.capsuleOffset[2])]
  radius=n.fadd(target[4],work.radius)
  if work.start[0]!=work.finish[0] or work.start[1]!=work.finish[1] then
    cylinderHalfheight=n.fsub(n.fadd(target[5],work.halfheight),radius)
    if cylinderHalfheight>0.0 then traceThroughVerticalCylinder(work,target[1],radius,cylinderHalfheight,work.start,work.finish) end if
  end if
  traceThroughSphere(work,target[6],radius,startBottom,endBottom)
  traceThroughSphere(work,target[7],radius,startTop,endTop)
  return void
end function

function traceBoundingBoxThroughCapsule(work,model)
  box=reciprocalCapsuleWork(work,model)
  if (box.contents & work.mask)!=0 then brush.traceThroughBrush(work.trace,box.planes,box.contents,work.start,work.finish,work.mins,work.maxs,true,work.radius,work.capsuleOffset) end if
  return void
end function

function CM_TestCapsuleInCapsule(work,model) return testCapsuleInCapsule(work,model) end function
function CM_TestBoundingBoxInCapsule(work,model) return testBoundingBoxInCapsule(work,model) end function
function CM_TraceThroughSphere(work,origin,radius,start,finish) return traceThroughSphere(work,origin,radius,start,finish) end function
function CM_TraceThroughVerticalCylinder(work,origin,radius,halfheight,start,finish) return traceThroughVerticalCylinder(work,origin,radius,halfheight,start,finish) end function
function CM_TraceCapsuleThroughCapsule(work,model) return traceCapsuleThroughCapsule(work,model) end function
function CM_TraceBoundingBoxThroughCapsule(work,model) return traceBoundingBoxThroughCapsule(work,model) end function

function traceWithSphereOrigin(world, start, finish, mins, maxs, model, mask, capsule,curves,sphere,modelOrigin)
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
  if modelOrigin==void then modelOrigin=[0.0,0.0,0.0] else modelOrigin=vector32(modelOrigin) end if
  work = Work(world,brush.emptyTrace(),a,b,lo,hi,boundsMin,boundsMax,capsule,radius,hi[2],capsuleOffset,modelOrigin,mask,point,array(len(world.brushes),false),array(len(world.surfaces),false),curves)
  stationary = start[0] == finish[0] and start[1] == finish[1] and start[2] == finish[2]
  // Original CM_Trace assigns isPoint only in its non-stationary branch.
  if stationary then work.isPoint = false end if
  if model == qcommonHeaders.CAPSULE_MODEL_HANDLE and model >= len(world.models) then
    if stationary then
      if capsule then testCapsuleInCapsule(work,model) else testBoundingBoxInCapsule(work,model) end if
    else
      if capsule then traceCapsuleThroughCapsule(work,model) else traceBoundingBoxThroughCapsule(work,model) end if
    end if
  else if model == qcommonHeaders.BOX_MODEL_HANDLE and model >= len(world.models) then
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

function traceWithSphere(world,start,finish,mins,maxs,model,mask,capsule,curves,sphere)
  return traceWithSphereOrigin(world,start,finish,mins,maxs,model,mask,capsule,curves,sphere,[0.0,0.0,0.0])
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
  if model != qcommonHeaders.BOX_MODEL_HANDLE and (angles[0] != 0 or angles[1] != 0 or angles[2] != 0) then
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
  rotated = model != qcommonHeaders.BOX_MODEL_HANDLE and (angles[0] != 0 or angles[1] != 0 or angles[2] != 0)
  radius = min(hi[0],hi[2]); t = n.fsub(hi[2],radius)
  sphereOffset = [0.0,0.0,t]; matrix = void
  if rotated then
    matrix = rotationMatrix(angles); a = rotatePoint(a,matrix); b = rotatePoint(b,matrix)
    // Preserve the original sign on the second capsule-offset component.
    sphereOffset = [n.fmul(matrix[0][2],t),n.fmul(n.fneg(matrix[1][2]),t),n.fmul(matrix[2][2],t)]
  end if
  result = traceWithSphereOrigin(world,a,b,lo,hi,model,mask,capsule,curves,[radius,sphereOffset],origin)
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

// Public spellings retained by the original qcommon collision API.
function CM_TestBoxInBrush(work,value) return testInBrush(work,value) end function
function CM_TestInLeaf(work,leaf) return throughLeaf(work,leaf,true) end function
function CM_PositionTest(work) return positionTest(work) end function
function CM_TraceThroughLeaf(work,leaf) return throughLeaf(work,leaf,false) end function
function CM_TraceThroughPatch(work,surface)
  previous=work.trace.fraction;patches.CM_TraceThroughPatchCollide(work,surface.patch,work.world.playerCurveClip)
  if work.trace.fraction<previous then work.trace.surfaceFlags=surface.flags;work.trace.contents=surface.contents end if
  return void
end function
function CM_TraceThroughTree(work) return throughTree(work) end function
function CM_Trace(world,start,finish,mins,maxs,model,mask,capsule,curves) return trace(world,start,finish,mins,maxs,model,mask,capsule,curves) end function
function CM_BoxTrace(world,start,finish,mins,maxs,model,mask,capsule) return boxTrace(world,start,finish,mins,maxs,model,mask,capsule) end function
function CM_TransformedBoxTrace(world,start,finish,mins,maxs,model,mask,origin,angles,capsule) return transformedTrace(world,start,finish,mins,maxs,model,mask,origin,angles,capsule,true) end function
function CreateRotationMatrix(angles) return rotationMatrix(angles) end function
function RotatePoint(point,matrix) return rotatePoint(point,matrix) end function
function TransposeMatrix(matrix) return transpose(matrix) end function
