// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Spatial part of sv_world.c. Entity contains only the fields used by this
// subsystem, not a replacement for the complete network entityState codec.
package mq3.server.world
import mq3.collision.world as cm
import mq3.collision.visibility as vis
import mq3.collision.brush as brush
import mq3.game.movement as movement
import mq3.shared.math as q
import mq3.compat.numeric as n
import std.array as arrays
import std.ds.list as spatialAreaLists

/// Entity record for server.world, containing `number`, `modelindex`, `solid`, `origin`, `angles`, `linked`, and 18 further fields.
struct Entity
  number
  modelindex
  solid
  origin
  angles
  linked
  linkcount
  svFlags
  bmodel
  mins
  maxs
  contents
  absmin
  absmax
  currentOrigin
  currentAngles
  ownerNum
  sector
  nextEntity
  clusters
  lastCluster
  areanum
  areanum2
  singleClient
end struct
/// Sector record for server.world, containing `axis`, `distance`, `children`, `head`.
struct Sector
  axis
  distance
  children
  head
end struct
/// Scene record for server.world, containing `world`, `entities`, `sectors`.
struct Scene
  world
  entities
  sectors
end struct

/// Create `mq3.server.world.Entity` with number=number; modelindex=0; solid=0; origin=[0.0, 0.0, 0.0]; 20 further fields.
/// @param number Initial `number` field stored in the returned or constructed `mq3.server.world.Entity` record.
function entity(number)
  return Entity(number,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],false,0,0,false,[0.0,0.0,0.0],[0.0,0.0,0.0],0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,-1,-1,[],0,0,0,0)
end function
/// Get entity in server.world; the normal completion returns `scene.entities[number]`.
///
/// Validation failures include `Invalid server entity number`.
/// @param scene Record exposing `entities`.
/// @param number Zero-based index into `scene.entities`.
function getEntity(scene,number)
  if typeof(number) != "int" or number < 0 or number >= 1024 then return error(480,"Invalid server entity number") end if
  return scene.entities[number]
end function
/// Compute in pvs in server.world; the normal completion returns `vis.areasConnected(visibility, area1, area2)`.
/// @param scene Record exposing `world`.
/// @param p1 Point passed as `point` to `mq3.collision.world.pointLeafnum`.
/// @param p2 Point passed as `point` to `mq3.collision.world.pointLeafnum`.
function inPVS(scene,p1,p2)
  visibility = scene.world.visibility
  leaf1 = cm.pointLeafnum(scene.world,p1); cluster1 = vis.leafCluster(visibility,leaf1); area1 = vis.leafArea(visibility,leaf1)
  leaf2 = cm.pointLeafnum(scene.world,p2); cluster2 = vis.leafCluster(visibility,leaf2); area2 = vis.leafArea(visibility,leaf2)
  // Valid engine points have a non-negative cluster. Guard malformed or
  // solid-only leaves instead of reproducing C's negative array subscript.
  if not vis.clusterVisible(visibility,cluster1,cluster2) then return false end if
  return vis.areasConnected(visibility,area1,area2)
end function
/// Create sector in server.world; the normal completion returns `index`.
///
/// Direct state writes: `scene.sectors`.
/// @param scene Record exposing `sectors`. Updated in place: `sectors`.
/// @param depth Depth used in `(depth + 1)` and `(depth == 4)`.
/// @param mins V passed as `v` to `mq3.game.movement.copy`.
/// @param maxs V passed as `v` to `mq3.game.movement.copy`.
function createSector(scene,depth,mins,maxs)
  index = len(scene.sectors); node = Sector(-1,0.0,[-1,-1],-1)
  scene.sectors = scene.sectors+[node]
  if depth == 4 then return index end if
  node.axis = 1
  if n.fsub(maxs[0],mins[0]) > n.fsub(maxs[1],mins[1]) then node.axis = 0 end if
  node.distance = n.f32(0.5*n.fadd(maxs[node.axis],mins[node.axis]))
  maxs1 = movement.copy(maxs); mins2 = movement.copy(mins)
  maxs1[node.axis] = node.distance; mins2[node.axis] = node.distance
  node.children[0] = createSector(scene,depth+1,mins2,maxs)
  node.children[1] = createSector(scene,depth+1,mins,maxs1)
  return index
end function
/// Create world in server.world; the normal completion returns `scene`.
/// @param world Initial `world` field stored in the returned or constructed `mq3.server.world.Scene` record.
function create(world)
  entities=array(1024,void);for i=0 to 1023 entities[i]=entity(i) end for
  scene = Scene(world,entities,[])
  bounds = cm.modelBounds(world,0); createSector(scene,0,bounds[0],bounds[1])
  return scene
end function
// SV_SectorList_f is a diagnostic command, but it deliberately walks the
// same intrusive sector chains used by collision queries.  Baseq3 prints all
// 64 statically allocated slots; only the first 31 belong to the depth-four
// tree and the remaining slots consequently report zero entities.
/// @param scene Record exposing `sectors`, `entities`.
function sectorList(scene)
  lines = []
  for index = 0 to 63
    count = 0
    if index < len(scene.sectors) then
      scan = scene.sectors[index].head
      while scan != -1
        count = count+1
        scan = scene.entities[scan].nextEntity
      end while
    end if
    lines = lines+["sector "+str(index)+": "+str(count)+" entities\n"]
  end for
  return lines
end function
/// Compute sector list f in server.world; the normal completion returns `len(lines)`.
/// @param scene Scene passed as `scene` to `mq3.server.world.sectorList`.
/// @param printFn Callback invoked for print; the call sites below define the callback arguments.
/// @param context Context used in `printFn(context, line)`.
function SV_SectorList_f(scene,printFn,context)
  lines = sectorList(scene)
  if printFn != void then for each line in lines printFn(context,line) end for end if
  return len(lines)
end function
/// Compute unlink entity in server.world.
/// @param scene Record exposing `sectors`, `entities`.
/// @param number Number passed as `number` to `mq3.server.world.getEntity`.
function unlinkEntity(scene,number)
  ent = getEntity(scene,number); ent.linked = false
  if ent.sector == -1 then return void end if
  node = scene.sectors[ent.sector]; ent.sector = -1
  if node.head == number then node.head = ent.nextEntity; return void end if
  scan = node.head
  while scan != -1
    previous = scene.entities[scan]
    if previous.nextEntity == number then previous.nextEntity = ent.nextEntity; return void end if
    scan = previous.nextEntity
  end while
  return void
end function
/// Return `mq3.collision.world.max(1, cm.min(255, n.trunc32(value)))` from `server.world.packedExtent`.
/// @param value Floating-point value to convert to signed 32-bit integer semantics.
function packedExtent(value)
  return cm.max(1,cm.min(255,n.trunc32(value)))
end function
/// Compute link entity in server.world.
///
/// Validation failures include `Server entity number does not match its slot`; `Inverted entity bounds`.
/// @param scene Record exposing `world`, `sectors`.
/// @param number Number passed as `number` to `mq3.server.world.getEntity`.
function linkEntity(scene,number)
  ent = getEntity(scene,number)
  if ent.number != number then return error(480,"Server entity number does not match its slot") end if
  ent.mins = cm.vector32(ent.mins); ent.maxs = cm.vector32(ent.maxs)
  ent.currentOrigin = cm.vector32(ent.currentOrigin); ent.currentAngles = cm.vector32(ent.currentAngles)
  for axis = 0 to 2
    if ent.mins[axis] > ent.maxs[axis] then return error(480,"Inverted entity bounds") end if
  end for
  if ent.sector != -1 then unlinkEntity(scene,number) end if
  if ent.bmodel then ent.solid = 0xffffff
  else if (ent.contents & 0x2000001) != 0 then
    ent.solid = packedExtent(ent.maxs[0]) | (packedExtent(n.fneg(ent.mins[2])) << 8) | (packedExtent(n.fadd(ent.maxs[2],32.0)) << 16)
  else ent.solid = 0 end if
  rotated = ent.bmodel and (ent.currentAngles[0] != 0 or ent.currentAngles[1] != 0 or ent.currentAngles[2] != 0)
  radius = 0.0
  if rotated then
    corner = array(3,0.0)
    for axis = 0 to 2
      corner[axis] = cm.max(q.Q_fabs(ent.mins[axis]),q.Q_fabs(ent.maxs[axis]))
    end for
    radius = q.VectorLength(corner)
  end if
  for axis = 0 to 2
    lo = ent.mins[axis]; hi = ent.maxs[axis]
    if rotated then lo = n.fneg(radius); hi = radius end if
    ent.absmin[axis] = n.fsub(n.fadd(ent.currentOrigin[axis],lo),1.0)
    ent.absmax[axis] = n.fadd(n.fadd(ent.currentOrigin[axis],hi),1.0)
  end for
  ent.clusters = []; ent.lastCluster = 0; ent.areanum = -1; ent.areanum2 = -1
  leafs = cm.boxLeafnums(scene.world,ent.absmin,ent.absmax,128)
  if len(leafs.entries) == 0 then return void end if
  for each leaf in leafs.entries
    area = vis.leafArea(scene.world.visibility,leaf)
    if area != -1 then
      if ent.areanum != -1 and ent.areanum != area then ent.areanum2 = area else ent.areanum = area end if
    end if
  end for
  clusterValues=array(16,0);clusterCount=0
  for each leaf in leafs.entries
    cluster = vis.leafCluster(scene.world.visibility,leaf)
    if cluster != -1 then
      clusterValues[clusterCount]=cluster;clusterCount=clusterCount+1
      if clusterCount == 16 then
        // Original tests i != num_leafs after breaking, even at the last leaf.
        ent.lastCluster = vis.leafCluster(scene.world.visibility,leafs.lastLeaf)
        break
      end if
    end if
  end for
  ent.clusters=arrays.slice(clusterValues,0,clusterCount)
  ent.linkcount = n.add32(ent.linkcount,1)
  index = 0
  while scene.sectors[index].axis != -1
    node = scene.sectors[index]
    if ent.absmin[node.axis] > node.distance then index = node.children[0]
    else if ent.absmax[node.axis] < node.distance then index = node.children[1]
    else break end if
  end while
  ent.sector = index; ent.nextEntity = scene.sectors[index].head
  scene.sectors[index].head = number; ent.linked = true
  return void
end function
/// Compute area entities in server.world; the normal completion returns `result.toArray()`.
///
/// Validation failures include `Invalid server area-list capacity`.
/// @param scene Record exposing `sectors`, `entities`.
/// @param mins Value passed as `value` to `mq3.collision.world.vector32`.
/// @param maxs Value passed as `value` to `mq3.collision.world.vector32`.
/// @param capacity Capacity used in `(capacity < 0)` and `typeof(capacity)`.
function areaEntities(scene,mins,maxs,capacity)
  if typeof(capacity) != "int" or capacity < 0 or capacity > 1024 then return error(480,"Invalid server area-list capacity") end if
  mins = cm.vector32(mins); maxs = cm.vector32(maxs)
  // Most trace queries return few entities even when capacity is1024. Grow
  // with actual hits rather than searching for an8KiB allocation each query.
  initialCapacity=capacity;if initialCapacity>32 then initialCapacity=32 end if
  result=spatialAreaLists.List.withCapacity(initialCapacity);resultCount=0
  // The world has a fixed depth-four tree. Use an explicit fixed stack so a
  // trace does not allocate and copy a new array on every visited sector.
  stack=array(32,0);stackCount=1;stack[0]=0
  while stackCount > 0 and resultCount < capacity
    stackCount=stackCount-1;index=stack[stackCount]
    node = scene.sectors[index]; scan = node.head
    while scan != -1
      ent = scene.entities[scan]; scan = ent.nextEntity; overlaps = true
      for axis = 0 to 2
        if ent.absmin[axis] > maxs[axis] or ent.absmax[axis] < mins[axis] then overlaps = false; break end if
      end for
      if not overlaps then continue end if
      if resultCount == capacity then break end if
      result.add(ent.number);resultCount=resultCount+1
    end while
    if resultCount == capacity or node.axis == -1 then continue end if
    // LIFO: original visits positive child first, with strict split comparisons.
    if mins[node.axis] < node.distance then stack[stackCount]=node.children[1];stackCount=stackCount+1 end if
    if maxs[node.axis] > node.distance then stack[stackCount]=node.children[0];stackCount=stackCount+1 end if
  end while
  return result.toArray()
end function
/// Compute clip handle for entity in server.world; the normal completion returns `cm.tempBoxModel(scene.world, ent.mins, ent.maxs, ((ent.svFlags & 1024) != 0))`.
/// @param scene Record exposing `world`.
/// @param ent Record exposing `bmodel`, `modelindex`, `mins`, `maxs`, `svFlags`.
function clipHandleForEntity(scene,ent)
  if ent.bmodel then return cm.inlineModel(scene.world,ent.modelindex) end if
  return cm.tempBoxModel(scene.world,ent.mins,ent.maxs,(ent.svFlags & 1024) != 0)
end function
/// Compute clip to entity in server.world; the normal completion returns `movement.Collision(result.trace, result.endpos, hit)`.
/// @param scene Record exposing `world`.
/// @param start Start passed as `start` to `mq3.collision.world.transformedTrace`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.transformedTrace`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.transformedTrace`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.transformedTrace`.
/// @param number Number passed as `number` to `mq3.server.world.getEntity`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.transformedTrace`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.transformedTrace`.
function clipToEntity(scene,start,finish,mins,maxs,number,mask,capsule)
  ent = getEntity(scene,number)
  if (mask & ent.contents) == 0 then return movement.Collision(brush.emptyTrace(),[0.0,0.0,0.0],0) end if
  model = clipHandleForEntity(scene,ent); angles = ent.currentAngles
  if not ent.bmodel then angles = [0.0,0.0,0.0] end if
  result = cm.transformedTrace(scene.world,start,finish,mins,maxs,model,mask,ent.currentOrigin,angles,capsule,scene.world.patchesReady)
  hit = 0
  if result.trace.fraction < 1 then hit = ent.number end if
  return movement.Collision(result.trace,result.endpos,hit)
end function
/// Trace world in server.world; the normal completion returns `result`.
/// @param scene Record exposing `world`, `entities`.
/// @param start Value passed as `value` to `mq3.collision.world.vector32`.
/// @param finish Value passed as `value` to `mq3.collision.world.vector32`.
/// @param mins Value passed as `value` to `mq3.collision.world.vector32`.
/// @param maxs Value passed as `value` to `mq3.collision.world.vector32`.
/// @param passEntity Number passed as `number` to `mq3.server.world.getEntity`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.trace`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.trace`.
function trace(scene,start,finish,mins,maxs,passEntity,mask,capsule)
  start = cm.vector32(start); finish = cm.vector32(finish)
  if mins == void then mins = [0.0,0.0,0.0] end if
  if maxs == void then maxs = [0.0,0.0,0.0] end if
  mins = cm.vector32(mins); maxs = cm.vector32(maxs)
  if passEntity != 1023 then getEntity(scene,passEntity) end if
  worldHit = cm.trace(scene.world,start,finish,mins,maxs,0,mask,capsule,scene.world.patchesReady)
  hit = 1023
  if worldHit.trace.fraction != 1 then hit = 1022 end if
  result = movement.Collision(worldHit.trace,worldHit.endpos,hit)
  if result.trace.fraction == 0 then return result end if
  boxmins = array(3,0.0); boxmaxs = array(3,0.0)
  for axis = 0 to 2
    a = finish[axis]; b = start[axis]
    if finish[axis] > start[axis] then a = start[axis]; b = finish[axis] end if
    boxmins[axis] = n.fsub(n.fadd(a,mins[axis]),1.0)
    boxmaxs[axis] = n.fadd(n.fadd(b,maxs[axis]),1.0)
  end for
  owner = -1
  if passEntity != 1023 then
    owner = scene.entities[passEntity].ownerNum
    if owner == 1023 then owner = -1 end if
  end if
  for each number in areaEntities(scene,boxmins,boxmaxs,1024)
    if result.trace.allsolid then break end if
    ent = scene.entities[number]
    if passEntity != 1023 and (number == passEntity or ent.ownerNum == passEntity or ent.ownerNum == owner) then continue end if
    if (mask & ent.contents) == 0 then continue end if
    other = clipToEntity(scene,start,finish,mins,maxs,number,mask,capsule)
    if other.trace.allsolid then result.trace.allsolid = true
    else if other.trace.startsolid then result.trace.startsolid = true end if
    if other.trace.fraction < result.trace.fraction then
      oldStart = result.trace.startsolid; result = other
      result.trace.startsolid = result.trace.startsolid or oldStart
    end if
  end for
  return result
end function
/// Compute point contents in server.world; the normal completion returns `contents`.
/// @param scene Record exposing `world`, `entities`.
/// @param point Value passed as `value` to `mq3.collision.world.vector32`.
/// @param passEntity Pass entity used in `(number == passEntity)`.
function pointContents(scene,point,passEntity)
  point = cm.vector32(point); contents = cm.pointContents(scene.world,point,0)
  for each number in areaEntities(scene,point,point,1024)
    if number == passEntity then continue end if
    ent = scene.entities[number]; model = clipHandleForEntity(scene,ent)
    // sv_world.c passes s.origin/s.angles here despite computing unused angles.
    contents = contents | cm.transformedPointContents(scene.world,point,model,ent.origin,ent.angles)
  end for
  return contents
end function
/// Return `mq3.server.world.trace(p.context, start, finish, p.k.mins, p.k.maxs, p.ps.clientNum, p.k.mask, false)` from `server.world.pmoveTrace`.
/// @param p Record exposing `context`, `k`, `ps`.
/// @param start Start passed as `start` to `mq3.server.world.trace`.
/// @param finish Finish passed as `finish` to `mq3.server.world.trace`.
function pmoveTrace(p,start,finish)
  return trace(p.context,start,finish,p.k.mins,p.k.maxs,p.ps.clientNum,p.k.mask,false)
end function
/// Return `mq3.server.world.pointContents(p.context, point, p.ps.clientNum)` from `server.world.pmoveContents`.
/// @param p Record exposing `context`, `ps`.
/// @param point Point passed as `point` to `mq3.server.world.pointContents`.
function pmoveContents(p,point)
  return pointContents(p.context,point,p.ps.clientNum)
end function
/// Compute entity contact in server.world; the normal completion returns `hit.trace.startsolid`.
/// @param scene Record exposing `world`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.transformedTrace`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.transformedTrace`.
/// @param number Number passed as `number` to `mq3.server.world.getEntity`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.transformedTrace`.
function entityContact(scene,mins,maxs,number,capsule)
  ent = getEntity(scene,number); model = clipHandleForEntity(scene,ent)
  hit = cm.transformedTrace(scene.world,[0.0,0.0,0.0],[0.0,0.0,0.0],mins,maxs,model,-1,ent.currentOrigin,ent.currentAngles,capsule,scene.world.patchesReady)
  return hit.trace.startsolid
end function
