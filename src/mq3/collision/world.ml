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
import std.ds.list as worldTraceLists

/// Classify or split one packed BSP trace segment against a plane, writing child-segment fractions in place.
/// @param records Writable packed segment-record buffer.
/// @param capacity Record-buffer byte capacity.
/// @param offset Byte offset with room for the 64-byte segment workspace.
/// @param axis Axial plane index 0..2, or 3 for the supplied general normal.
/// @param nx General plane-normal X component.
/// @param ny General plane-normal Y component.
/// @param nz General plane-normal Z component.
/// @param planeDistance Plane distance from the origin.
/// @param extent Box extent projected onto the plane.
/// @returns 0 or 1 for a single side, 2 or 3 for a split traversal order, or -1 for an invalid workspace or axis.
extern function traceSegmentStep(records as ptr,capacity as i32,offset as i32,axis as i32,nx as double,ny as double,nz as double,planeDistance as double,extent as double) from "miniquake3_qvm.dll" symbol "mq3_trace_segment_step" returns i32
/// Trace a moving box against an origin-translated temporary box and store five binary32 trace values.
/// @param ax X component of the sweep start.
/// @param ay Y component of the sweep start.
/// @param az Z component of the sweep start.
/// @param bx X component of the sweep end.
/// @param by Y component of the sweep end.
/// @param bz Z component of the sweep end.
/// @param lx X component of the moving box minimum.
/// @param ly Y component of the moving box minimum.
/// @param lz Z component of the moving box minimum.
/// @param hx X component of the moving box maximum.
/// @param hy Y component of the moving box maximum.
/// @param hz Z component of the moving box maximum.
/// @param ox X component of the model origin.
/// @param oy Y component of the model origin.
/// @param oz Z component of the model origin.
/// @param tx X component of the stationary box minimum.
/// @param ty Y component of the stationary box minimum.
/// @param tz Z component of the stationary box minimum.
/// @param ux X component of the stationary box maximum.
/// @param uy Y component of the stationary box maximum.
/// @param uz Z component of the stationary box maximum.
/// @param matchesMask Nonzero when the temporary box contents match the trace mask.
/// @param output Writable buffer for five binary32 values (20 bytes).
/// @returns The native trace status; nonnegative results write the output, while a negative result rejects invalid input.
extern function traceTransformedBoxNative(ax as double,ay as double,az as double,bx as double,by as double,bz as double,lx as double,ly as double,lz as double,hx as double,hy as double,hz as double,ox as double,oy as double,oz as double,tx as double,ty as double,tz as double,ux as double,uy as double,uz as double,matchesMask as i32,output as bytes) from "miniquake3_qvm.dll" symbol "mq3_trace_transformed_box" returns i32
/// Read a QVM transformed-box trace request and write its temporary-box result directly to VM memory.
/// @param data Mutable QVM data memory.
/// @param capacity VM memory size in bytes.
/// @param mask VM address mask.
/// @param base Byte offset of the syscall argument frame.
/// @param model Temporary collision-model handle.
/// @param contents Temporary box content flags.
/// @param tx X component of the stationary box minimum.
/// @param ty Y component of the stationary box minimum.
/// @param tz Z component of the stationary box minimum.
/// @param ux X component of the stationary box maximum.
/// @param uy Y component of the stationary box maximum.
/// @param uz Z component of the stationary box maximum.
/// @returns 1 when the 56-byte trace was written; 0 leaves VM memory unchanged so the checked MiniLang path can handle the request.
extern function writeVmBoxTraceNative(data as bytes,capacity as i32,mask as u32,base as i32,model as i32,contents as u32,tx as double,ty as double,tz as double,ux as double,uy as double,uz as double) from "miniquake3_qvm.dll" symbol "mq3_cgame_transformed_box_trace" returns i32

/// Shader record for collision.world, containing `name`, `surfaceFlags`, `contentFlags`.
struct Shader name surfaceFlags contentFlags end struct
/// Brush record for collision.world, containing `planes`, `packedPlanes`, `contents`, `mins`, `maxs`.
struct Brush
  planes
  packedPlanes
  contents
  mins
  maxs
end struct
/// Node record for collision.world, containing `plane`, `axis`, `children`.
struct Node
  plane
  axis
  children
end struct
/// Leaf record for collision.world, containing `brushes`, `surfaces`.
struct Leaf
  brushes
  surfaces
end struct
/// Surface record for collision.world, containing `patch`, `contents`, `flags`.
struct Surface
  patch
  contents
  flags
end struct
/// World record for collision.world, containing `brushes`, `nodes`, `leaves`, `models`, `surfaces`, `patchesReady`, and 8 further fields.
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
/// Submodels record for collision.world, containing `models`, `bounds`.
struct Submodels models bounds end struct
/// MapState record for collision.world, containing `world`, `name`, `checksum`, `lastChecksum`, `curves`.
struct MapState world name checksum lastChecksum curves end struct
/// LoadResult record for collision.world, containing `world`, `checksum`, `cached`.
struct LoadResult world checksum cached end struct
/// Temporary record for collision.world, containing `bounds`, `brush`, `capsuleReady`, `brushVisits`, `patchVisits`, `visitSerial`.
struct Temporary
  bounds
  brush
  capsuleReady
  brushVisits
  patchVisits
  visitSerial
end struct
/// Work record for collision.world, containing `world`, `trace`, `start`, `finish`, `mins`, `maxs`, and 14 further fields.
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
  visitSerial
  brushScratch
  curves
end struct
/// Result record for collision.world, containing `trace`, `endpos`.
struct Result
  trace
  endpos
end struct
/// LeafList record for collision.world, containing `entries`, `lastLeaf`, `overflowed`.
struct LeafList
  entries
  lastLeaf
  overflowed
end struct

/// Create the collision.world error for `fail` with 3503 and the supplied diagnostic text.
/// @param message Message used in `("Collision: " + message)` and `error(3503, ("Collision: " + message))`.
function fail(message)
  return error(3503, "Collision: " + message)
end function

/// Compute min in collision.world; the normal completion returns `b`.
/// @param a A used in `(a < b)`.
/// @param b B used in `(a < b)`.
function min(a,b)
  if a < b then return a end if
  return b
end function
/// Compute max in collision.world; the normal completion returns `b`.
/// @param a A used in `(a > b)`.
/// @param b B used in `(a > b)`.
function max(a,b)
  if a > b then return a end if
  return b
end function
/// Return `mq3.compat.numeric.bitsFloat((n.floatBits(a) & 2147483647))` from `collision.world.abs`.
/// @param a Floating-point value to narrow and reinterpret.
function abs(a)
  return n.bitsFloat(n.floatBits(a) & 0x7fffffff)
end function

/// Compute real in collision.world; the normal completion returns `n.bitsFloat(bits)`.
/// @param data Data passed as `data` to `mq3.compat.numeric.readU32`.
/// @param offset Offset passed as `offset` to `mq3.compat.numeric.readU32`.
function real(data, offset)
  bits = n.readU32(data, offset)
  if (bits & 0x7f800000) == 0x7f800000 then return fail("non-finite map plane") end if
  return n.bitsFloat(bits)
end function

/// Compute plane type in collision.world; the normal completion returns `3`.
/// @param normal Normal used in `normal[axis]` and `(normal[axis] == 1.0)`.
function planeType(normal)
  for axis = 0 to 2
    if normal[axis] == 1.0 then return axis end if
  end for
  return 3
end function

/// Compute plane metadata in collision.world; the normal completion returns `result`.
/// @param normal Normal passed as `normal` to `mq3.collision.world.planeType`.
function planeMetadata(normal)
  if normal[0] == 0 and normal[1] == 0 and normal[2] == 0 then return 0 end if
  result = planeType(normal)
  for axis = 0 to 2
    if normal[axis] < 0 then result = result | (1 << (axis + 8)) end if
  end for
  return result
end function

// BSPC's local SetPlaneSignbits and the qcommon loader use the same bit order.
/// @param normal Normal used in `normal[axis]` and `(normal[axis] < 0.0)`.
function SetPlaneSignbits(normal)
  bits=0;for axis=0 to 2 if normal[axis]<0.0 then bits=bits|(1<<axis) end if end for;return bits
end function
/// Compute shader name in collision.world; the normal completion returns `decode(slice(data, offset, count))`.
/// @param data Data used in `data[(offset + count)]` and `slice(data, offset, count)`.
/// @param offset Offset used in `(offset + count)` and `data[(offset + count)]`.
function shaderName(data,offset)
  count=0;while count<64 and data[offset+count]!=0 count=count+1 end while;return decode(slice(data,offset,count))
end function
/// Compute c mod load shaders in collision.world; the normal completion returns `values`.
/// @param map Record exposing `counts`, `offsets`, `data`.
function CMod_LoadShaders(map)
  if map.counts[1]<1 then return fail("map has no shaders") end if
  values=array(map.counts[1],void);for index=0 to len(values)-1 off=map.offsets[1]+index*72;values[index]=Shader(shaderName(map.data,off),n.readI32(map.data,off+64),n.readI32(map.data,off+68)) end for;return values
end function
/// Compute c mod load planes in collision.world; the normal completion returns `values`.
/// @param map Record exposing `counts`, `offsets`, `data`.
function CMod_LoadPlanes(map)
  if map.counts[2]<1 then return fail("map has no planes") end if
  values=array(map.counts[2],void);for index=0 to len(values)-1 off=map.offsets[2]+index*16;normal=[real(map.data,off),real(map.data,off+4),real(map.data,off+8)];values[index]=brush.Plane(normal,real(map.data,off+12),SetPlaneSignbits(normal)) end for;return values
end function
/// Compute c mod load brush sides in collision.world; the normal completion returns `values`.
/// @param map Record exposing `counts`, `offsets`, `data`.
/// @param planes Planes used in `len(planes)` and `planes[planeNumber]`.
/// @param shaders Shaders used in `len(shaders)` and `shaders[shaderNumber]`.
function CMod_LoadBrushSides(map,planes,shaders)
  values=array(map.counts[9],void);index=0;while index<len(values) off=map.offsets[9]+index*8;planeNumber=n.readI32(map.data,off);shaderNumber=n.readI32(map.data,off+4);if planeNumber<0 or planeNumber>=len(planes) or shaderNumber<0 or shaderNumber>=len(shaders) then return fail("invalid brush side reference") end if;plane=planes[planeNumber];values[index]=brush.Plane(plane.normal,plane.distance,shaders[shaderNumber].surfaceFlags);index=index+1 end while;return values
end function
/// Apply `mq3.collision.world.fail` for bound brush in collision.world.
/// @param sides Sides used in `sides[0]` and `sides[2]`.
function CM_BoundBrush(sides)
  if sides==void or len(sides)<6 then return fail("brush lacks six axial bounding planes") end if
  return [[0.0-sides[0].distance,0.0-sides[2].distance,0.0-sides[4].distance],[sides[1].distance,sides[3].distance,sides[5].distance]]
end function
/// Compute c mod load brushes in collision.world; the normal completion returns `values`.
/// @param map Record exposing `counts`, `offsets`, `data`.
/// @param sides Sides used in `len(sides)` and `((first + count) > len(sides))`.
/// @param shaders Shaders used in `len(shaders)` and `shaders[shaderNumber]`.
function CMod_LoadBrushes(map,sides,shaders)
  values=array(map.counts[8],void);index=0;while index<len(values) off=map.offsets[8]+index*12;first=n.readI32(map.data,off);count=n.readI32(map.data,off+4);shaderNumber=n.readI32(map.data,off+8);if count<6 or first<0 or first+count>len(sides) or shaderNumber<0 or shaderNumber>=len(shaders) then return fail("invalid brush record") end if;selected=arrays.slice(sides,first,count);bounds=CM_BoundBrush(selected);values[index]=Brush(selected,brush.packPlanes(selected),shaders[shaderNumber].contentFlags,bounds[0],bounds[1]);index=index+1 end while;return values
end function
/// Compute c mod load leaf brushes in collision.world; the normal completion returns `values`.
/// @param map Record exposing `counts`, `data`, `offsets`.
function CMod_LoadLeafBrushes(map)
  values=array(map.counts[6],0);index=0;while index<len(values) values[index]=n.readI32(map.data,map.offsets[6]+index*4);index=index+1 end while;return values
end function
/// Compute c mod load leaf surfaces in collision.world; the normal completion returns `values`.
/// @param map Record exposing `counts`, `data`, `offsets`.
function CMod_LoadLeafSurfaces(map)
  values=array(map.counts[5],0);index=0;while index<len(values) values[index]=n.readI32(map.data,map.offsets[5]+index*4);index=index+1 end while;return values
end function
/// Compute c mod load leafs in collision.world; the normal completion returns `values`.
/// @param map Record exposing `counts`, `offsets`, `data`.
/// @param leafBrushes Leaf brushes used in `len(leafBrushes)` and `((firstBrush + brushCount) > len(leafBrushes))`.
/// @param leafSurfaces Leaf surfaces used in `len(leafSurfaces)` and `((firstSurface + surfaceCount) > len(leafSurfaces))`.
function CMod_LoadLeafs(map,leafBrushes,leafSurfaces)
  if map.counts[4]<1 then return fail("map has no leaves") end if
  values=array(map.counts[4],void);for index=0 to len(values)-1 off=map.offsets[4]+index*48;firstSurface=n.readI32(map.data,off+32);surfaceCount=n.readI32(map.data,off+36);firstBrush=n.readI32(map.data,off+40);brushCount=n.readI32(map.data,off+44);if firstSurface<0 or surfaceCount<0 or firstSurface+surfaceCount>len(leafSurfaces) or firstBrush<0 or brushCount<0 or firstBrush+brushCount>len(leafBrushes) then return fail("invalid leaf range") end if;values[index]=Leaf(arrays.slice(leafBrushes,firstBrush,brushCount),arrays.slice(leafSurfaces,firstSurface,surfaceCount)) end for;return values
end function
/// Compute c mod load nodes in collision.world; the normal completion returns `values`.
/// @param map Record exposing `counts`, `offsets`, `data`.
/// @param planes Planes used in `len(planes)` and `planes[planeNumber]`.
function CMod_LoadNodes(map,planes)
  if map.counts[3]<1 then return fail("map has no nodes") end if
  values=array(map.counts[3],void);for index=0 to len(values)-1 off=map.offsets[3]+index*36;planeNumber=n.readI32(map.data,off);if planeNumber<0 or planeNumber>=len(planes) then return fail("invalid node plane") end if;plane=planes[planeNumber];values[index]=Node(plane,planeType(plane.normal),[n.readI32(map.data,off+4),n.readI32(map.data,off+8)]) end for;return values
end function
/// Compute c mod load submodels in collision.world; the normal completion returns `Submodels(models, bounds)`.
/// @param map Record exposing `counts`, `offsets`, `data`.
function CMod_LoadSubmodels(map)
  if map.counts[7]<1 then return fail("map has no models") end if
  // Indices 254 and 255 are reserved clip handles. A map that reaches either
  // value would shadow the capsule/box sentinels even though MAX_SUBMODELS is
  // 256 in the public ABI, so reject it at the trust boundary.
  if map.counts[7]>qcommonHeaders.CAPSULE_MODEL_HANDLE then return fail("reserved model handles exceeded") end if
  models=array(map.counts[7],void);bounds=array(map.counts[7],void)
  for index=0 to len(models)-1
    off=map.offsets[7]+index*40;lower=array(3,0.0);upper=array(3,0.0)
    for axis=0 to 2 lower[axis]=n.fsub(real(map.data,off+axis*4),1.0);upper[axis]=n.fadd(real(map.data,off+12+axis*4),1.0) end for
    for axis=0 to 2 if lower[axis]>upper[axis] then return fail("inverted model bounds") end if end for
    // The original leaves the world model's synthetic leaf empty. World
    // collision reaches its real leaves through the BSP node tree.
    brushes=[];surfaces=[]
    if index!=0 then
      firstSurface=n.readI32(map.data,off+24);surfaceCount=n.readI32(map.data,off+28);firstBrush=n.readI32(map.data,off+32);brushCount=n.readI32(map.data,off+36)
      if firstSurface<0 or surfaceCount<0 or firstSurface+surfaceCount>map.counts[13] or firstBrush<0 or brushCount<0 or firstBrush+brushCount>map.counts[8] then return fail("invalid submodel range") end if
      brushes=array(brushCount,0);surfaces=array(surfaceCount,0)
      cursor=0;while cursor<brushCount brushes[cursor]=firstBrush+cursor;cursor=cursor+1 end while
      cursor=0;while cursor<surfaceCount surfaces[cursor]=firstSurface+cursor;cursor=cursor+1 end while
    end if
    models[index]=Leaf(brushes,surfaces);bounds[index]=[lower,upper]
  end for
  return Submodels(models,bounds)
end function
/// Return `decode(slice(map.data, map.offsets[0], map.lengths[0]))` from `collision.world.CMod_LoadEntityString`.
/// @param map Record exposing `data`, `offsets`, `lengths`.
function CMod_LoadEntityString(map) return decode(slice(map.data,map.offsets[0],map.lengths[0])) end function
/// Return `mq3.collision.visibility.load(map)` from `collision.world.CMod_LoadVisibility`.
/// @param map Map passed as `map` to `mq3.collision.visibility.load`.
function CMod_LoadVisibility(map) return vis.load(map) end function
/// Compute c mod load patches in collision.world; the normal completion returns `surfaces`.
/// @param map Record exposing `counts`, `offsets`, `data`.
/// @param shaders Shaders used in `len(shaders)` and `shaders[shaderNumber]`.
/// @param curves Curves operand used by `CMod_LoadPatches`; its reads are shown in the implementation.
function CMod_LoadPatches(map,shaders,curves)
  surfaces=array(map.counts[13],void);if not curves then return surfaces end if
  index=0;while index<len(surfaces) off=map.offsets[13]+index*104;if n.readI32(map.data,off+8)==2 then width=n.readI32(map.data,off+96);height=n.readI32(map.data,off+100);count=width*height;first=n.readI32(map.data,off+12);shaderNumber=n.readI32(map.data,off);if width<3 or height<3 or width>129 or height>129 or count>1024 or count>n.readI32(map.data,off+16) or first<0 or first+count>map.counts[10] or shaderNumber<0 or shaderNumber>=len(shaders) then return fail("invalid BSP patch") end if;points=array(count,void);cursor=0;while cursor<count location=map.offsets[10]+(first+cursor)*44;points[cursor]=[real(map.data,location),real(map.data,location+4),real(map.data,location+8)];cursor=cursor+1 end while;surfaces[index]=Surface(mesh.CM_GeneratePatchCollide(width,height,points),shaders[shaderNumber].contentFlags,shaders[shaderNumber].surfaceFlags) end if;index=index+1 end while;return surfaces
end function
/// Compute lump checksum in collision.world; the normal completion returns `md4.blockChecksum(slice(map.data, map.offsets[lump], map.lengths[lump]))`.
/// @param map Record exposing `data`, `offsets`, `lengths`.
/// @param lump Zero-based index into `map.offsets`, `map.lengths`.
function CM_LumpChecksum(map,lump) if lump<0 or lump>=17 then return fail("invalid checksum lump") end if;return md4.blockChecksum(slice(map.data,map.offsets[lump],map.lengths[lump])) end function
/// Compute checksum in collision.world; the normal completion returns `md4.blockChecksum(data)`.
/// @param map Map passed as `map` to `mq3.collision.world.CM_LumpChecksum`.
function CM_Checksum(map)
  order=[1,4,6,5,2,9,8,7,3,13,10];data=bytes(44,0);for index=0 to 10 n.writeU32(data,index*4,CM_LumpChecksum(map,order[index])) end for;return md4.blockChecksum(data)
end function

/// Check tree in collision.world; the normal completion returns `true`.
/// @param nodes Nodes used in `len(nodes)` and `nodes[index]`.
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
  root = 0;stack=worldTraceLists.List.new()
  while root < len(nodes)
    stack.clear();stack.add([root,false])
    while stack.len() > 0
      item = stack.pop()
      index = item[0]
      if index < 0 then continue end if
      if item[1] then colors[index] = 2; continue end if
      if colors[index] == 1 then return fail("cyclic BSP nodes") end if
      if colors[index] == 2 then continue end if
      colors[index] = 1
      stack.add([index,true]);stack.add([nodes[index].children[1],false]);stack.add([nodes[index].children[0],false])
    end while
    root = root + 1
  end while
  return true
end function

/// Load world in collision.world; the normal completion returns `world`.
/// @param data Data passed as `data` to `mq3.format.bsp.load`.
/// @param curves Curves passed as `curves` to `mq3.collision.world.CMod_LoadPatches`.
function loadWorld(data,curves)
  map = bsp.load(data)
  shaders=CMod_LoadShaders(map);planes=CMod_LoadPlanes(map);sides=CMod_LoadBrushSides(map,planes,shaders);brushes=CMod_LoadBrushes(map,sides,shaders)
  nodes=CMod_LoadNodes(map,planes)
  checkTree(nodes)
  leafBrushes=CMod_LoadLeafBrushes(map);leafSurfaces=CMod_LoadLeafSurfaces(map);leaves=CMod_LoadLeafs(map,leafBrushes,leafSurfaces)
  submodels=CMod_LoadSubmodels(map);models=submodels.models;modelBounds=submodels.bounds
  surfaces=CMod_LoadPatches(map,shaders,curves);visibility=CMod_LoadVisibility(map);entityText=CMod_LoadEntityString(map);checksum=md4.blockChecksum(data)
  zero = [0.0,0.0,0.0]
  world=World(brushes,nodes,leaves,models,surfaces,curves,true,modelBounds,Temporary([zero,zero],makeBox(zero,zero),false,bytes(len(brushes),0),bytes(len(surfaces),0),0),visibility,entityText,shaders,checksum,"")
  CM_InitBoxHull(world);return world
end function

/// Compute make box in collision.world; the normal completion returns `Brush(planes, void, 33554432, mins, maxs)`.
/// @param mins Initial `mins` field stored in the returned or constructed `mq3.collision.world.Brush` record.
/// @param maxs Initial `maxs` field stored in the returned or constructed `mq3.collision.world.Brush` record.
function makeBox(mins,maxs)
  planes = array(6,void)
  // CM_InitBoxHull uses +X,-X,+Y,-Y,+Z,-Z, unlike map brush bounds.
  for axis = 0 to 2
    positive = [0.0,0.0,0.0]; negative = [0.0,0.0,0.0]
    positive[axis] = 1.0; negative[axis] = -1.0
    planes[axis*2]=brush.Plane(positive,maxs[axis],0)
    planes[axis*2+1]=brush.Plane(negative,n.fneg(mins[axis]),0)
  end for
  return Brush(planes,void,0x2000000,mins,maxs)
end function

/// Compute temp box model in collision.world; the normal completion returns `qcommonHeaders.BOX_MODEL_HANDLE`.
/// @param world Record exposing `temporary`.
/// @param mins Value passed as `value` to `mq3.collision.world.vector32`.
/// @param maxs Value passed as `value` to `mq3.collision.world.vector32`.
/// @param capsule Capsule operand used by `tempBoxModel`; its reads are shown in the implementation.
function tempBoxModel(world,mins,maxs,capsule)
  mins = vector32(mins); maxs = vector32(maxs)
  // CM_TempBoxModel copies caller bounds and face distances verbatim. Network
  // entity solids can produce an inverted axis; rejecting it aborts the
  // original QVM match even though Quake III continues with those planes.
  world.temporary.bounds = [mins,maxs]
  // The original capsule handle updates the shared bounds but deliberately
  // leaves the temporary box planes untouched. Reciprocal box-vs-capsule
  // paths create their replacement box only after consuming these bounds.
  world.temporary.capsuleReady = capsule
  if capsule then return qcommonHeaders.CAPSULE_MODEL_HANDLE end if
  hull=world.temporary.brush
  hull.mins=mins;hull.maxs=maxs
  for axis=0 to 2
    hull.planes[axis*2].distance=maxs[axis]
    hull.planes[axis*2+1].distance=n.fneg(mins[axis])
  end for
  return qcommonHeaders.BOX_MODEL_HANDLE
end function

/// Update `world.temporary` in collision.world.
///
/// Direct state writes: `world.temporary`.
/// @param world Record exposing `brushes`, `surfaces`. Updated in place: `temporary`.
function CM_InitBoxHull(world)
  if world==void then return fail("box hull requires a loaded map") end if;zero=[0.0,0.0,0.0];world.temporary=Temporary([zero,zero],makeBox(zero,zero),false,bytes(len(world.brushes),0),bytes(len(world.surfaces),0),0);return void
end function
/// Return `mq3.collision.world.tempBoxModel(world, mins, maxs, capsule)` from `collision.world.CM_TempBoxModel`.
/// @param world World passed as `world` to `mq3.collision.world.tempBoxModel`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.tempBoxModel`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.tempBoxModel`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.tempBoxModel`.
function CM_TempBoxModel(world,mins,maxs,capsule) return tempBoxModel(world,mins,maxs,capsule) end function

/// Check model in collision.world; the normal completion returns `fail("invalid model handle")`.
/// @param world Record exposing `models`, `temporary`.
/// @param model Model used in `(model >= 0)` and `(model < len(world.models))`.
function checkModel(world,model)
  // The capsule sentinel becomes valid only after CM_TempBoxModel has
  // supplied its shared bounds.  This keeps reciprocal box-vs-capsule traces
  // working while rejecting a bare reserved handle before initialization.
  if model >= 0 and (model < len(world.models) or model == qcommonHeaders.BOX_MODEL_HANDLE or (model == qcommonHeaders.CAPSULE_MODEL_HANDLE and world.temporary.capsuleReady)) then return true end if
  return fail("invalid model handle")
end function

/// Return `mq3.collision.world.checkModel(world, model)` from `collision.world.checkTraceModel`.
/// @param world World passed as `world` to `mq3.collision.world.checkModel`.
/// @param model Model passed as `model` to `mq3.collision.world.checkModel`.
/// @param capsule Reserved argument; this implementation does not read its value.
function checkTraceModel(world,model,capsule)
  return checkModel(world,model)
end function

/// Compute model bounds in collision.world; the normal completion returns `[arrays.slice(bounds[0], 0, 3), arrays.slice(bounds[1], 0, 3)]`.
/// @param world Record exposing `temporary`, `models`, `bounds`.
/// @param model Model passed as `model` to `mq3.collision.world.checkModel`.
function modelBounds(world,model)
  checkModel(world,model)
  if model==qcommonHeaders.CAPSULE_MODEL_HANDLE then return fail("bad clip handle") end if
  bounds = world.temporary.bounds
  if model < len(world.models) then bounds = world.bounds[model] end if
  return [arrays.slice(bounds[0],0,3),arrays.slice(bounds[1],0,3)]
end function

/// Compute clip handle to model in collision.world; the normal completion returns `fail("bad clip handle")`.
/// @param world Record exposing `models`, `temporary`.
/// @param handle Zero-based index into `world.models`.
function CM_ClipHandleToModel(world,handle)
  if world==void or handle<0 then return fail("bad clip handle") end if
  if handle<len(world.models) then return world.models[handle] end if
  // CM_ClipHandleToModel exposes only the box hull.  The capsule handle is
  // consumed directly by trace code and must remain invalid here.
  if handle==qcommonHeaders.BOX_MODEL_HANDLE then return world.temporary end if
  return fail("bad clip handle")
end function
/// Return `mq3.collision.world.modelBounds(world, model)` from `collision.world.CM_ModelBounds`.
/// @param world World passed as `world` to `mq3.collision.world.modelBounds`.
/// @param model Model passed as `model` to `mq3.collision.world.modelBounds`.
function CM_ModelBounds(world,model) return modelBounds(world,model) end function

/// Compute inline model in collision.world; the normal completion returns `index`.
/// @param world Record exposing `models`.
/// @param index Index used in `(index < 0)` and `(index >= len(world.models))`.
function inlineModel(world,index)
  if index < 0 or index >= len(world.models) then return fail("invalid inline model") end if
  return index
end function
/// Return `mq3.collision.world.inlineModel(world, index)` from `collision.world.CM_InlineModel`.
/// @param world World passed as `world` to `mq3.collision.world.inlineModel`.
/// @param index Index passed as `index` to `mq3.collision.world.inlineModel`.
function CM_InlineModel(world,index) return inlineModel(world,index) end function
/// Compute num clusters in collision.world; the normal completion returns `world.visibility.numClusters`.
/// @param world Record exposing `visibility`.
function CM_NumClusters(world) if world==void then return 0 end if;return world.visibility.numClusters end function
/// Compute num inline models in collision.world; the normal completion returns `len(world.models)`.
/// @param world Record exposing `models`.
function CM_NumInlineModels(world) if world==void then return 0 end if;return len(world.models) end function
/// Compute entity string in collision.world; the normal completion returns `world.entityString`.
/// @param world Record exposing `entityString`.
function CM_EntityString(world) if world==void then return "" end if;return world.entityString end function
/// Compute leaf cluster in collision.world; the normal completion returns `vis.leafCluster(world.visibility, leaf)`.
/// @param world Record exposing `visibility`.
/// @param leaf Leaf passed as `leaf` to `mq3.collision.visibility.leafCluster`.
function CM_LeafCluster(world,leaf) if world==void then return fail("leaf cluster requires a loaded map") end if;return vis.leafCluster(world.visibility,leaf) end function
/// Compute leaf area in collision.world; the normal completion returns `vis.leafArea(world.visibility, leaf)`.
/// @param world Record exposing `visibility`.
/// @param leaf Leaf passed as `leaf` to `mq3.collision.visibility.leafArea`.
function CM_LeafArea(world,leaf) if world==void then return fail("leaf area requires a loaded map") end if;return vis.leafArea(world.visibility,leaf) end function

/// Create `mq3.collision.world.MapState` with world=void; name=""; checksum=0; lastChecksum=0; curves=curves.
/// @param curves Initial `curves` field stored in the returned or constructed `mq3.collision.world.MapState` record.
function mapState(curves) return MapState(void,"",0,0,curves) end function
/// Clear map in collision.world; updates `state.world`, `state.name`, `state.checksum`.
///
/// Direct state writes: `state.world`, `state.name`, `state.checksum`.
/// @param state Updated in place: `world`, `name`, `checksum`.
function CM_ClearMap(state) if state!=void then state.world=void;state.name="";state.checksum=0 end if;return void end function
/// Load map in collision.world; the normal completion returns `LoadResult(world, checksum, false)`.
///
/// Direct state writes: `state.name`, `state.world`, `state.checksum`, `state.lastChecksum`.
/// @param state Record exposing `world`, `name`, `lastChecksum`, `curves`. Updated in place: `name`, `world`, `checksum`, `lastChecksum`.
/// @param name Name used in `(name == "")` and `(name == void)`.
/// @param data Data passed as `data` to `mq3.collision.world.loadWorld`.
/// @param clientload Clientload used in `(((state.world != void) and (state.name == name)) and clientload)`.
function CM_LoadMap(state,name,data,clientload)
  if state==void then return fail("map state required") end if
  if name==void or name=="" then return fail("NULL map name") end if
  if state.world!=void and state.name==name and clientload then return LoadResult(state.world,state.lastChecksum,true) end if
  CM_ClearMap(state);if data==void or typeof(data)!="bytes" then return fail("map data missing") end if
  world=loadWorld(data,state.curves);if world is error then return world end if;checksum=world.checksum
  if not clientload then state.name=name;world.name=name end if
  state.world=world;state.checksum=checksum;state.lastChecksum=checksum;return LoadResult(world,checksum,false)
end function

/// Return `mq3.collision.world.loadWorld(data, false)` from `collision.world.loadBrushWorld`.
/// @param data Data passed as `data` to `mq3.collision.world.loadWorld`.
function loadBrushWorld(data)
  return loadWorld(data,false)
end function

/// Return `mq3.collision.world.loadWorld(data, true)` from `collision.world.load`.
/// @param data Data passed as `data` to `mq3.collision.world.loadWorld`.
function load(data)
  return loadWorld(data,true)
end function

/// Compute point leafnum in collision.world; the normal completion returns `(- 1 - num)`.
/// @param world Record exposing `nodes`.
/// @param point Value passed as `value` to `mq3.collision.world.vector32`.
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

/// Compute model brushes in collision.world; the normal completion returns `world.models[model].brushes`.
/// @param world Record exposing `models`, `leaves`.
/// @param point Point passed as `point` to `mq3.collision.world.pointLeafnum`.
/// @param model Zero-based index into `world.models`.
function modelBrushes(world, point, model)
  if model < 0 or model >= len(world.models) then return fail("invalid inline model") end if
  if model == 0 then return world.leaves[pointLeafnum(world,point)].brushes end if
  return world.models[model].brushes
end function

/// Compute brush point contents in collision.world; the normal completion returns `b.contents`.
/// @param point Left three-element vector.
/// @param b Record exposing `planes`, `contents`.
function brushPointContents(point,b)
  for each plane in b.planes
    if q.DotProduct(point,plane.normal) > plane.distance then return 0 end if
  end for
  return b.contents
end function
/// Compute point contents in collision.world; the normal completion returns `n.i32(contents)`.
/// @param world Record exposing `models`, `temporary`, `brushes`.
/// @param point Value passed as `value` to `mq3.collision.world.vector32`.
/// @param model Model passed as `model` to `mq3.collision.world.checkModel`.
function pointContents(world, point, model)
  point = vector32(point)
  checkModel(world,model)
  contents = 0
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
    return n.i32(brushPointContents(point,world.temporary.brush))
  end if
  for each index in modelBrushes(world,point,model)
    contents=contents|brushPointContents(point,world.brushes[index])
  end for
  return n.i32(contents)
end function

/// Compute test in brush in collision.world.
/// @param work Record exposing `boundsMin`, `boundsMax`, `start`, `capsule`, `radius`, `capsuleOffset`, `mins` and further fields.
/// @param b Record exposing `maxs`, `mins`, `planes`, `contents`.
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
      distance = n.fsub(distance,brush.boxSupportDot(plane.normal,work.mins,work.maxs))
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

/// Compute through leaf in collision.world.
/// @param work Record exposing `seen`, `visitSerial`, `world`, `mask`, `capsule`, `trace`, `start` and further fields.
/// @param leaf Record exposing `brushes`, `surfaces`.
/// @param positionTest Position test operand used by `throughLeaf`; its reads are shown in the implementation.
function throughLeaf(work, leaf, positionTest)
  for each index in leaf.brushes
    if work.seen[index]==work.visitSerial then continue end if
    work.seen[index] = work.visitSerial
    b = work.world.brushes[index]
    if (b.contents & work.mask) == 0 then continue end if
    if positionTest then
      testInBrush(work,b)
    else if not work.capsule then
      brush.tracePacked(work.trace,b.planes,b.packedPlanes,b.contents,work.start,work.finish,work.mins,work.maxs,work.brushScratch)
    else
      brush.traceThroughBrush(work.trace,b.planes,b.contents,work.start,work.finish,work.mins,work.maxs,work.capsule,work.radius,work.capsuleOffset)
    end if
    if work.trace.fraction == 0 then return void end if
  end for
  if work.curves then
    for each index in leaf.surfaces
      surface = work.world.surfaces[index]
      if surface == void or work.seenPatches[index]==work.visitSerial then continue end if
      work.seenPatches[index] = work.visitSerial
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

/// Compute box side in collision.world; the normal completion returns `result`.
/// @param mins Mins used in `mins[axis]` and `(normal * mins[axis])`.
/// @param maxs Maxs used in `maxs[axis]` and `(normal * maxs[axis])`.
/// @param plane Record exposing `normal`, `distance`.
function boxSide(mins, maxs, plane)
  // Win32's original BoxOnPlaneSide is x87 assembly. Its sums remain extended
  // until comparison, with no intermediate binary32 stores. Map coordinates
  // have enough precision here in the host double to preserve this comparison.
  a=0.0;b=0.0
  for axis=0 to 2
    normal=plane.normal[axis]
    if normal<0 then
      a=a+normal*mins[axis];b=b+normal*maxs[axis]
    else
      a=a+normal*maxs[axis];b=b+normal*mins[axis]
    end if
  end for
  result = 0
  if a >= plane.distance then result = 1 end if
  if b < plane.distance then result = result | 2 end if
  return result
end function

/// Compute position test in collision.world.
/// @param work Record exposing `start`, `mins`, `maxs`, `world`, `trace`.
function positionTest(work)
  mins = array(3,0.0)
  maxs = array(3,0.0)
  for axis = 0 to 2
    mins[axis] = n.fsub(n.fadd(work.start[axis],work.mins[axis]),1.0)
    maxs[axis] = n.fadd(n.fadd(work.start[axis],work.maxs[axis]),1.0)
  end for
  stack = worldTraceLists.List.withCapacity(32); stack.add(0)
  leaves = worldTraceLists.List.withCapacity(32)
  while not stack.isEmpty()
    num = stack.pop()
    if num < 0 then
      if leaves.len() < 1024 then leaves.add(-1-num) end if
    else
      node = work.world.nodes[num]
      side = boxSide(mins,maxs,node.plane)
      if side == 1 then
        stack.add(node.children[0])
      else if side == 2 then
        stack.add(node.children[1])
      else
        stack.add(node.children[1]); stack.add(node.children[0])
      end if
    end if
  end while
  for leafIndex=0 to leaves.len()-1
    leaf=leaves.get(leafIndex)
    throughLeaf(work,work.world.leaves[leaf],true)
    if work.trace.allsolid then break end if
  end for
  return void
end function

/// Interpolate world in collision.world; the normal completion returns `result`.
/// @param a A used in `a[axis]` and `n.fsub(b[axis], a[axis])`.
/// @param b B used in `b[axis]` and `n.fsub(b[axis], a[axis])`.
/// @param fraction Left floating-point operand.
function interpolate(a,b,fraction)
  result = array(3,0.0)
  for axis = 0 to 2
    result[axis] = n.fadd(a[axis],n.fmul(fraction,n.fsub(b[axis],a[axis])))
  end for
  return result
end function

/// Compute through tree in collision.world.
///
/// Validation failures include `Collision: invalid BSP trace interval`.
/// @param work Record exposing `start`, `finish`, `trace`, `world`, `isPoint`, `maxs`.
function throughTree(work)
  // Each pending far child owns two (x,y,z,fraction) tuples. Descending an
  // unsplit node keeps the same interval; only a split grows the frontier.
  stack=worldTraceLists.List.withCapacity(32)
  segments=bytes(33*32,0);offset=0
  for axis=0 to 2
    n.writeU32(segments,axis*4,n.floatBits(work.start[axis]))
    n.writeU32(segments,16+axis*4,n.floatBits(work.finish[axis]))
  end for
  n.writeU32(segments,28,0x3f800000)
  num=0;startFraction=0.0
  while true
    if not (work.trace.fraction<=startFraction) then
      while num>=0
        node=work.world.nodes[num];plane=node.plane;axis=node.axis
        extent=0.0
        if not work.isPoint then
          if axis<3 then extent=work.maxs[axis] else extent=2048.0 end if
        end if
        if offset+64>len(segments) then
          grown=bytes(len(segments)*2,0);copyBytes(grown,0,segments,0,offset+32);segments=grown
        end if
        direction=traceSegmentStep(nativeBytesPtr(segments),len(segments),offset,axis,plane.normal[0],plane.normal[1],plane.normal[2],plane.distance,extent)
        if direction<0 then return error(3503,"Collision: invalid BSP trace interval") end if
        side=direction&1
        if direction>=2 then
          stack.add(node.children[side^1]);offset=offset+32
        end if
        num=node.children[side]
      end while
      throughLeaf(work,work.world.leaves[-1-num],false)
    end if
    if stack.isEmpty() then break end if
    num=stack.pop();offset=offset-32
    startFraction=n.bitsFloat(n.readU32(segments,offset+12))
  end while
  return void
end function

/// Compute capsule target in collision.world; the normal completion returns `[bounds, center, lo, hi, radius, halfheight, top, bottom]`.
/// @param world Record exposing `temporary`.
/// @param model Model passed as `model` to `mq3.collision.world.modelBounds`.
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

/// Compute mark capsule position hit in collision.world.
/// @param work Record exposing `trace`.
function markCapsulePositionHit(work)
  work.trace.startsolid=true;work.trace.allsolid=true;work.trace.fraction=n.f32(0)
  return void
end function

/// Compute test capsule in capsule in collision.world.
/// @param work Record exposing `world`, `start`, `capsuleOffset`, `radius`.
/// @param model Model passed as `model` to `mq3.collision.world.capsuleTarget`.
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

/// Update `work.capsule`, `work.radius`, `work.halfheight`, `work.capsuleOffset` in collision.world; the normal completion returns `work.world.temporary.brush`.
///
/// Direct state writes: `work.capsule`, `work.radius`, `work.halfheight`, `work.capsuleOffset`.
/// @param work Record exposing `world`, `start`, `finish`, `mins`, `maxs`. Updated in place: `capsule`, `radius`, `halfheight`, `capsuleOffset`.
/// @param model Model passed as `model` to `mq3.collision.world.capsuleTarget`.
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

/// Compute test bounding box in capsule in collision.world.
/// @param work Record exposing `mask`.
/// @param model Model passed as `model` to `mq3.collision.world.reciprocalCapsuleWork`.
function testBoundingBoxInCapsule(work,model)
  box=reciprocalCapsuleWork(work,model)
  if (box.contents & work.mask)!=0 then testInBrush(work,box) end if
  return void
end function

/// Trace through sphere in collision.world.
/// @param work Record exposing `trace`, `modelOrigin`.
/// @param origin Point passed as `point` to `mq3.collision.brush.distanceFromLineSquared`.
/// @param radius Left floating-point operand.
/// @param start Line start passed as `lineStart` to `mq3.collision.brush.distanceFromLineSquared`.
/// @param finish Line end passed as `lineEnd` to `mq3.collision.brush.distanceFromLineSquared`.
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

/// Trace through vertical cylinder in collision.world.
/// @param work Record exposing `trace`, `modelOrigin`.
/// @param origin Origin used in `origin[0]` and `origin[1]`.
/// @param radius Left floating-point operand.
/// @param halfheight Right floating-point operand.
/// @param start A passed as `a` to `mq3.shared.math.VectorMA`.
/// @param finish Finish used in `finish[0]` and `finish[1]`.
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

/// Trace capsule through capsule in collision.world.
/// @param work Record exposing `world`, `boundsMin`, `boundsMax`, `start`, `capsuleOffset`, `finish`, `radius` and further fields.
/// @param model Model passed as `model` to `mq3.collision.world.capsuleTarget`.
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

/// Trace bounding box through capsule in collision.world.
/// @param work Record exposing `mask`, `trace`, `start`, `finish`, `mins`, `maxs`, `radius` and further fields.
/// @param model Model passed as `model` to `mq3.collision.world.reciprocalCapsuleWork`.
function traceBoundingBoxThroughCapsule(work,model)
  box=reciprocalCapsuleWork(work,model)
  if (box.contents & work.mask)!=0 then brush.traceThroughBrush(work.trace,box.planes,box.contents,work.start,work.finish,work.mins,work.maxs,true,work.radius,work.capsuleOffset) end if
  return void
end function

/// Return `mq3.collision.world.testCapsuleInCapsule(work, model)` from `collision.world.CM_TestCapsuleInCapsule`.
/// @param work Work passed as `work` to `mq3.collision.world.testCapsuleInCapsule`.
/// @param model Model passed as `model` to `mq3.collision.world.testCapsuleInCapsule`.
function CM_TestCapsuleInCapsule(work,model) return testCapsuleInCapsule(work,model) end function
/// Return `mq3.collision.world.testBoundingBoxInCapsule(work, model)` from `collision.world.CM_TestBoundingBoxInCapsule`.
/// @param work Work passed as `work` to `mq3.collision.world.testBoundingBoxInCapsule`.
/// @param model Model passed as `model` to `mq3.collision.world.testBoundingBoxInCapsule`.
function CM_TestBoundingBoxInCapsule(work,model) return testBoundingBoxInCapsule(work,model) end function
/// Return `mq3.collision.world.traceThroughSphere(work, origin, radius, start, finish)` from `collision.world.CM_TraceThroughSphere`.
/// @param work Work passed as `work` to `mq3.collision.world.traceThroughSphere`.
/// @param origin Origin passed as `origin` to `mq3.collision.world.traceThroughSphere`.
/// @param radius Radius passed as `radius` to `mq3.collision.world.traceThroughSphere`.
/// @param start Start passed as `start` to `mq3.collision.world.traceThroughSphere`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.traceThroughSphere`.
function CM_TraceThroughSphere(work,origin,radius,start,finish) return traceThroughSphere(work,origin,radius,start,finish) end function
/// Return `mq3.collision.world.traceThroughVerticalCylinder(work, origin, radius, halfheight, start, finish)` from `collision.world.CM_TraceThroughVerticalCylinder`.
/// @param work Work passed as `work` to `mq3.collision.world.traceThroughVerticalCylinder`.
/// @param origin Origin passed as `origin` to `mq3.collision.world.traceThroughVerticalCylinder`.
/// @param radius Radius passed as `radius` to `mq3.collision.world.traceThroughVerticalCylinder`.
/// @param halfheight Halfheight passed as `halfheight` to `mq3.collision.world.traceThroughVerticalCylinder`.
/// @param start Start passed as `start` to `mq3.collision.world.traceThroughVerticalCylinder`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.traceThroughVerticalCylinder`.
function CM_TraceThroughVerticalCylinder(work,origin,radius,halfheight,start,finish) return traceThroughVerticalCylinder(work,origin,radius,halfheight,start,finish) end function
/// Return `mq3.collision.world.traceCapsuleThroughCapsule(work, model)` from `collision.world.CM_TraceCapsuleThroughCapsule`.
/// @param work Work passed as `work` to `mq3.collision.world.traceCapsuleThroughCapsule`.
/// @param model Model passed as `model` to `mq3.collision.world.traceCapsuleThroughCapsule`.
function CM_TraceCapsuleThroughCapsule(work,model) return traceCapsuleThroughCapsule(work,model) end function
/// Return `mq3.collision.world.traceBoundingBoxThroughCapsule(work, model)` from `collision.world.CM_TraceBoundingBoxThroughCapsule`.
/// @param work Work passed as `work` to `mq3.collision.world.traceBoundingBoxThroughCapsule`.
/// @param model Model passed as `model` to `mq3.collision.world.traceBoundingBoxThroughCapsule`.
function CM_TraceBoundingBoxThroughCapsule(work,model) return traceBoundingBoxThroughCapsule(work,model) end function

/// Trace with sphere origin in collision.world; the normal completion returns `Result(work.trace, endpos)`.
/// @param world Record exposing `patchesReady`, `models`, `temporary`, `brushes`, `surfaces`.
/// @param start Value passed as `value` to `mq3.collision.world.vector32`.
/// @param finish Value passed as `value` to `mq3.collision.world.vector32`.
/// @param mins Value passed as `value` to `mq3.collision.world.vector32`.
/// @param maxs Value passed as `value` to `mq3.collision.world.vector32`.
/// @param model Model passed as `model` to `mq3.collision.world.checkTraceModel`.
/// @param mask Initial `mask` field stored in the returned or constructed `mq3.collision.world.Work` record.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.checkTraceModel`.
/// @param curves Initial `curves` field stored in the returned or constructed `mq3.collision.world.Work` record.
/// @param sphere Sphere used in `sphere[0]` and `sphere[1]`.
/// @param modelOrigin Value passed as `value` to `mq3.collision.world.vector32`.
function traceWithSphereOrigin(world, start, finish, mins, maxs, model, mask, capsule,curves,sphere,modelOrigin)
  checkTraceModel(world,model,capsule)
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
  // Temporary hulls bypass BSP leaf traversal, so they need no visited maps.
  temporary=model>=len(world.models)
  stationary = start[0] == finish[0] and start[1] == finish[1] and start[2] == finish[2]
  seen=void;seenPatches=void;brushScratch=void;visitSerial=0
  if not temporary then
    scratch=world.temporary
    if scratch==void then
      seen=bytes(len(world.brushes),0);if curves then seenPatches=bytes(len(world.surfaces),0) end if;visitSerial=1
    else
      // Original CM_Trace uses a per-query checkcount to avoid revisiting a
      // brush or patch in several leaves. Reuse one byte per record; refresh
      // only when its 255 nonzero generations have been consumed.
      if scratch.visitSerial>=255 or len(scratch.brushVisits)!=len(world.brushes) or len(scratch.patchVisits)!=len(world.surfaces) then
        scratch.brushVisits=bytes(len(world.brushes),0);scratch.patchVisits=bytes(len(world.surfaces),0);scratch.visitSerial=0
      end if
      scratch.visitSerial=scratch.visitSerial+1;visitSerial=scratch.visitSerial
      seen=scratch.brushVisits;if curves then seenPatches=scratch.patchVisits end if
    end if
    if not stationary and not capsule then brushScratch=bytes(4,0) end if
  end if
  work = Work(world,brush.emptyTrace(),a,b,lo,hi,boundsMin,boundsMax,capsule,radius,hi[2],capsuleOffset,modelOrigin,mask,point,seen,seenPatches,visitSerial,brushScratch,curves)
  // Original CM_Trace assigns isPoint only in its non-stationary branch.
  if stationary then work.isPoint = false end if
  if model == qcommonHeaders.CAPSULE_MODEL_HANDLE and temporary then
    if stationary then
      if capsule then testCapsuleInCapsule(work,model) else testBoundingBoxInCapsule(work,model) end if
    else
      if capsule then traceCapsuleThroughCapsule(work,model) else traceBoundingBoxThroughCapsule(work,model) end if
    end if
  else if model == qcommonHeaders.BOX_MODEL_HANDLE and temporary then
    temp = world.temporary.brush
    if (temp.contents & mask) != 0 then
      if stationary then testInBrush(work,temp)
      else brush.traceThroughBrush(work.trace,temp.planes,temp.contents,a,b,lo,hi,capsule,radius,capsuleOffset) end if
    end if
    work.trace.normal=arrays.slice(work.trace.normal,0,3)
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

/// Return `mq3.collision.world.traceWithSphereOrigin(world, start, finish, mins, maxs, model, mask, capsule, curves, sphere, [0.0, 0.0, 0.0])` from `collision.world.traceWithSphere`.
/// @param world World passed as `world` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param start Start passed as `start` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param model Model passed as `model` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param curves Curves passed as `curves` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param sphere Sphere passed as `sphere` to `mq3.collision.world.traceWithSphereOrigin`.
function traceWithSphere(world,start,finish,mins,maxs,model,mask,capsule,curves,sphere)
  return traceWithSphereOrigin(world,start,finish,mins,maxs,model,mask,capsule,curves,sphere,[0.0,0.0,0.0])
end function

/// Compute enumerate leaves in collision.world; the normal completion returns `leaves.toArray()`.
/// @param world Record exposing `nodes`.
/// @param mins Value passed as `value` to `mq3.collision.world.vector32`.
/// @param maxs Value passed as `value` to `mq3.collision.world.vector32`.
function enumerateLeaves(world,mins,maxs)
  mins = vector32(mins); maxs = vector32(maxs)
  for axis = 0 to 2
    if mins[axis] > maxs[axis] then return fail("inverted query bounds") end if
  end for
  stack = worldTraceLists.List.new();stack.add(0);leaves = worldTraceLists.List.new()
  while stack.len() > 0
    num = stack.pop()
    if num < 0 then leaves.add(-1-num)
    else
      node = world.nodes[num]; side = boxSide(mins,maxs,node.plane)
      if side == 1 then stack.add(node.children[0])
      else if side == 2 then stack.add(node.children[1])
      else stack.add(node.children[1]);stack.add(node.children[0]) end if
    end if
  end while
  return leaves.toArray()
end function

/// Compute box leafnums in collision.world; the normal completion returns `result`.
/// @param world Record exposing `visibility`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.enumerateLeaves`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.enumerateLeaves`.
/// @param capacity B passed as `b` to `mq3.collision.world.min`.
function boxLeafnums(world,mins,maxs,capacity)
  if capacity < 0 or capacity > 131072 then return fail("invalid leaf-list capacity") end if
  result = LeafList([],0,false);entries=worldTraceLists.List.withCapacity(min(32,capacity))
  for each leaf in enumerateLeaves(world,mins,maxs)
    if vis.leafCluster(world.visibility,leaf) != -1 then result.lastLeaf = leaf end if
    if entries.len() >= capacity then result.overflowed = true
    else entries.add(leaf) end if
  end for
  result.entries=entries.toArray()
  return result
end function

/// Compute box brushes in collision.world; the normal completion returns `result`.
/// @param world Record exposing `brushes`, `leaves`.
/// @param mins Value passed as `value` to `mq3.collision.world.vector32`.
/// @param maxs Value passed as `value` to `mq3.collision.world.vector32`.
/// @param capacity B passed as `b` to `mq3.collision.world.min`.
function boxBrushes(world,mins,maxs,capacity)
  if capacity < 0 or capacity > 131072 then return fail("invalid brush-list capacity") end if
  mins = vector32(mins); maxs = vector32(maxs)
  result = LeafList([],0,false); seen = array(len(world.brushes),false);entries=worldTraceLists.List.withCapacity(min(32,capacity))
  for each leaf in enumerateLeaves(world,mins,maxs)
    for each index in world.leaves[leaf].brushes
      if seen[index] then continue end if
      seen[index] = true; b = world.brushes[index]; overlaps = true
      for axis = 0 to 2
        if b.mins[axis] >= maxs[axis] or b.maxs[axis] <= mins[axis] then overlaps = false; break end if
      end for
      if not overlaps then continue end if
      if entries.len() >= capacity then result.overflowed = true; break end if
      entries.add(index)
    end for
  end for
  result.entries=entries.toArray()
  return result
end function

/// Return `mq3.collision.world.traceWithSphere(world, start, finish, mins, maxs, model, mask, capsule, curves, void)` from `collision.world.trace`.
/// @param world World passed as `world` to `mq3.collision.world.traceWithSphere`.
/// @param start Start passed as `start` to `mq3.collision.world.traceWithSphere`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.traceWithSphere`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.traceWithSphere`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.traceWithSphere`.
/// @param model Model passed as `model` to `mq3.collision.world.traceWithSphere`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.traceWithSphere`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.traceWithSphere`.
/// @param curves Curves passed as `curves` to `mq3.collision.world.traceWithSphere`.
function trace(world,start,finish,mins,maxs,model,mask,capsule,curves)
  return traceWithSphere(world,start,finish,mins,maxs,model,mask,capsule,curves,void)
end function

/// Compute rotation matrix in collision.world; the normal completion returns `matrix`.
/// @param angles Three-element [pitch, yaw, roll] array in degrees.
function rotationMatrix(angles)
  matrix = q.AngleVectors(angles)
  for axis = 0 to 2
    matrix[1][axis] = n.fneg(matrix[1][axis])
  end for
  return matrix
end function

/// Compute collision.world.rotatePoint as `[q.DotProduct(matrix[0], point), q.DotProduct(matrix[1], point), q.DotProduct(matrix[2], point)]`.
/// @param point Right three-element vector.
/// @param matrix Matrix used in `matrix[0]` and `matrix[1]`.
function rotatePoint(point,matrix)
  return [q.DotProduct(matrix[0],point),q.DotProduct(matrix[1],point),q.DotProduct(matrix[2],point)]
end function

/// Compute collision.world.transpose as `[[matrix[0][0], matrix[1][0], matrix[2][0]], [matrix[0][1], matrix[1][1], matrix[2][1]], [matrix[0][2], matrix[1][2], matrix[2][2]]]`.
/// @param matrix Matrix used in `matrix[0]` and `matrix[1]`.
function transpose(matrix)
  return [[matrix[0][0],matrix[1][0],matrix[2][0]],[matrix[0][1],matrix[1][1],matrix[2][1]],[matrix[0][2],matrix[1][2],matrix[2][2]]]
end function

/// Compute transformed point contents in collision.world; the normal completion returns `pointContents(world, localPoint, model)`.
/// @param world World passed as `world` to `mq3.collision.world.pointContents`.
/// @param point Value passed as `value` to `mq3.collision.world.vector32`.
/// @param model Model passed as `model` to `mq3.collision.world.pointContents`.
/// @param origin Value passed as `value` to `mq3.collision.world.vector32`.
/// @param angles Value passed as `value` to `mq3.collision.world.vector32`.
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

/// Write vm temporary box trace in collision.world.
/// @param world Record exposing `models`, `temporary`.
/// @param vm Record exposing `data`, `mask`.
/// @param base Byte offset of the syscall argument frame.
function writeVmTemporaryBoxTrace(world,vm,base)
  handle=qcommonHeaders.BOX_MODEL_HANDLE
  if world==void or handle<len(world.models) then return false end if
  target=world.temporary.brush;lo=target.mins;hi=target.maxs
  return writeVmBoxTraceNative(vm.data,len(vm.data),vm.mask,base,handle,target.contents,
      lo[0],lo[1],lo[2],hi[0],hi[1],hi[2])==1
end function

/// Trace transformed box in collision.world.
/// @param world Record exposing `temporary`.
/// @param start Start used in `start[0]` and `start[1]`.
/// @param finish Finish used in `finish[0]` and `finish[1]`.
/// @param mins Mins used in `mins[0]` and `mins[1]`.
/// @param maxs Maxs used in `maxs[0]` and `maxs[1]`.
/// @param mask Mask used in `(target.contents & mask)` and `((target.contents & mask) != 0)`.
/// @param origin Origin used in `origin[0]` and `origin[1]`.
function traceTransformedBox(world,start,finish,mins,maxs,mask,origin)
  target=world.temporary.brush
  if mins==void then mins=[0.0,0.0,0.0] end if
  if maxs==void then maxs=[0.0,0.0,0.0] end if
  for each vector in [start,finish,mins,maxs,origin]
    if typeof(vector)!="array" or len(vector)!=3 then return void end if
  end for
  lo=target.mins;hi=target.maxs;matching=0
  if (target.contents&mask)!=0 then matching=1 end if
  output=bytes(20,0)
  hit=traceTransformedBoxNative(start[0],start[1],start[2],finish[0],finish[1],finish[2],mins[0],mins[1],mins[2],maxs[0],maxs[1],maxs[2],origin[0],origin[1],origin[2],lo[0],lo[1],lo[2],hi[0],hi[1],hi[2],matching,output)
  if hit<0 then return void end if
  result=brush.emptyTrace()
  result.fraction=n.bitsFloat(n.readU32(output,0))
  if hit==1 or hit==2 then
    result.startsolid=true
    if hit==2 then result.allsolid=true;result.contents=target.contents end if
  else if hit>=3 then
    side=hit-3;axis=side>>1
    result.contents=target.contents;result.distance=n.bitsFloat(n.readU32(output,4))
    if (side&1)==0 then result.normal[axis]=1.0;result.planeMetadata=axis
    else result.normal[axis]=-1.0;result.planeMetadata=(3+axis)|(1<<(axis+8)) end if
  end if
  return Result(result,[n.bitsFloat(n.readU32(output,8)),n.bitsFloat(n.readU32(output,12)),n.bitsFloat(n.readU32(output,16))])
end function

/// Compute transformed trace in collision.world; the normal completion returns `result`.
/// @param world Record exposing `models`, `patchesReady`.
/// @param start Start passed as `start` to `mq3.collision.world.traceTransformedBox`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.traceTransformedBox`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.traceTransformedBox`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.traceTransformedBox`.
/// @param model Model passed as `model` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.traceTransformedBox`.
/// @param origin Origin passed as `origin` to `mq3.collision.world.traceTransformedBox`.
/// @param angles Value passed as `value` to `mq3.collision.world.vector32`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.traceWithSphereOrigin`.
/// @param curves Curves passed as `curves` to `mq3.collision.world.traceWithSphereOrigin`.
function transformedTrace(world,start,finish,mins,maxs,model,mask,origin,angles,capsule,curves)
  if not capsule and model==qcommonHeaders.BOX_MODEL_HANDLE and model>=len(world.models) and (not curves or world.patchesReady) then
    vector32(angles)
    fast=traceTransformedBox(world,start,finish,mins,maxs,mask,origin)
    if fast!=void then return fast end if
  end if
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

/// Compute vector 32 in collision.world; the normal completion returns `result`.
/// @param value Value used in `len(value)` and `value[axis]`.
function vector32(value)
  if typeof(value) != "array" or len(value) != 3 then return fail("expected a three-component vector") end if
  result = array(3,0.0)
  for axis = 0 to 2
    result[axis] = n.f32(value[axis])
    if (n.floatBits(result[axis]) & 0x7f800000) == 0x7f800000 then return fail("non-finite trace coordinate") end if
  end for
  return result
end function

/// Return `mq3.collision.world.trace(world, start, finish, mins, maxs, model, mask, capsule, false)` from `collision.world.boxTraceNoCurves`.
/// @param world World passed as `world` to `mq3.collision.world.trace`.
/// @param start Start passed as `start` to `mq3.collision.world.trace`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.trace`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.trace`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.trace`.
/// @param model Model passed as `model` to `mq3.collision.world.trace`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.trace`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.trace`.
function boxTraceNoCurves(world,start,finish,mins,maxs,model,mask,capsule)
  return trace(world,start,finish,mins,maxs,model,mask,capsule,false)
end function

/// Return `mq3.collision.world.trace(world, start, finish, mins, maxs, model, mask, capsule, true)` from `collision.world.boxTrace`.
/// @param world World passed as `world` to `mq3.collision.world.trace`.
/// @param start Start passed as `start` to `mq3.collision.world.trace`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.trace`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.trace`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.trace`.
/// @param model Model passed as `model` to `mq3.collision.world.trace`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.trace`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.trace`.
function boxTrace(world,start,finish,mins,maxs,model,mask,capsule)
  return trace(world,start,finish,mins,maxs,model,mask,capsule,true)
end function

// Public spellings retained by the original qcommon collision API.
/// @param work Work passed as `work` to `mq3.collision.world.testInBrush`.
/// @param value B passed as `b` to `mq3.collision.world.testInBrush`.
function CM_TestBoxInBrush(work,value) return testInBrush(work,value) end function
/// Return `mq3.collision.world.throughLeaf(work, leaf, true)` from `collision.world.CM_TestInLeaf`.
/// @param work Work passed as `work` to `mq3.collision.world.throughLeaf`.
/// @param leaf Leaf passed as `leaf` to `mq3.collision.world.throughLeaf`.
function CM_TestInLeaf(work,leaf) return throughLeaf(work,leaf,true) end function
/// Return `mq3.collision.world.positionTest(work)` from `collision.world.CM_PositionTest`.
/// @param work Work passed as `work` to `mq3.collision.world.positionTest`.
function CM_PositionTest(work) return positionTest(work) end function
/// Return `mq3.collision.world.throughLeaf(work, leaf, false)` from `collision.world.CM_TraceThroughLeaf`.
/// @param work Work passed as `work` to `mq3.collision.world.throughLeaf`.
/// @param leaf Leaf passed as `leaf` to `mq3.collision.world.throughLeaf`.
function CM_TraceThroughLeaf(work,leaf) return throughLeaf(work,leaf,false) end function
/// Trace through patch in collision.world.
/// @param work Record exposing `trace`, `world`.
/// @param surface Record exposing `patch`, `flags`, `contents`.
function CM_TraceThroughPatch(work,surface)
  previous=work.trace.fraction;patches.CM_TraceThroughPatchCollide(work,surface.patch,work.world.playerCurveClip)
  if work.trace.fraction<previous then work.trace.surfaceFlags=surface.flags;work.trace.contents=surface.contents end if
  return void
end function
/// Return `mq3.collision.world.throughTree(work)` from `collision.world.CM_TraceThroughTree`.
/// @param work Work passed as `work` to `mq3.collision.world.throughTree`.
function CM_TraceThroughTree(work) return throughTree(work) end function
/// Return `mq3.collision.world.trace(world, start, finish, mins, maxs, model, mask, capsule, curves)` from `collision.world.CM_Trace`.
/// @param world World passed as `world` to `mq3.collision.world.trace`.
/// @param start Start passed as `start` to `mq3.collision.world.trace`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.trace`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.trace`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.trace`.
/// @param model Model passed as `model` to `mq3.collision.world.trace`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.trace`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.trace`.
/// @param curves Curves passed as `curves` to `mq3.collision.world.trace`.
function CM_Trace(world,start,finish,mins,maxs,model,mask,capsule,curves) return trace(world,start,finish,mins,maxs,model,mask,capsule,curves) end function
/// Return `mq3.collision.world.boxTrace(world, start, finish, mins, maxs, model, mask, capsule)` from `collision.world.CM_BoxTrace`.
/// @param world World passed as `world` to `mq3.collision.world.boxTrace`.
/// @param start Start passed as `start` to `mq3.collision.world.boxTrace`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.boxTrace`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.boxTrace`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.boxTrace`.
/// @param model Model passed as `model` to `mq3.collision.world.boxTrace`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.boxTrace`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.boxTrace`.
function CM_BoxTrace(world,start,finish,mins,maxs,model,mask,capsule) return boxTrace(world,start,finish,mins,maxs,model,mask,capsule) end function
/// Return `mq3.collision.world.transformedTrace(world, start, finish, mins, maxs, model, mask, origin, angles, capsule, true)` from `collision.world.CM_TransformedBoxTrace`.
/// @param world World passed as `world` to `mq3.collision.world.transformedTrace`.
/// @param start Start passed as `start` to `mq3.collision.world.transformedTrace`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.transformedTrace`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.transformedTrace`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.transformedTrace`.
/// @param model Model passed as `model` to `mq3.collision.world.transformedTrace`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.transformedTrace`.
/// @param origin Origin passed as `origin` to `mq3.collision.world.transformedTrace`.
/// @param angles Angles passed as `angles` to `mq3.collision.world.transformedTrace`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.transformedTrace`.
function CM_TransformedBoxTrace(world,start,finish,mins,maxs,model,mask,origin,angles,capsule) return transformedTrace(world,start,finish,mins,maxs,model,mask,origin,angles,capsule,true) end function
/// Return `mq3.collision.world.rotationMatrix(angles)` from `collision.world.CreateRotationMatrix`.
/// @param angles Angles passed as `angles` to `mq3.collision.world.rotationMatrix`.
function CreateRotationMatrix(angles) return rotationMatrix(angles) end function
/// Return `mq3.collision.world.rotatePoint(point, matrix)` from `collision.world.RotatePoint`.
/// @param point Point passed as `point` to `mq3.collision.world.rotatePoint`.
/// @param matrix Matrix passed as `matrix` to `mq3.collision.world.rotatePoint`.
function RotatePoint(point,matrix) return rotatePoint(point,matrix) end function
/// Return `mq3.collision.world.transpose(matrix)` from `collision.world.TransposeMatrix`.
/// @param matrix Matrix passed as `matrix` to `mq3.collision.world.transpose`.
function TransposeMatrix(matrix) return transpose(matrix) end function
