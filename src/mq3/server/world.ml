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
end struct
struct Sector
  axis
  distance
  children
  head
end struct
struct Scene
  world
  entities
  sectors
end struct

function entity(number)
  return Entity(number,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],false,0,0,false,[0.0,0.0,0.0],[0.0,0.0,0.0],0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,-1,-1,[],0,0,0)
end function
function getEntity(scene,number)
  if typeof(number) != "int" or number < 0 or number >= 1024 then return error(480,"Invalid server entity number") end if
  return scene.entities[number]
end function
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
function create(world)
  scene = Scene(world,[],[])
  for i = 0 to 1023
    scene.entities = scene.entities+[entity(i)]
  end for
  bounds = cm.modelBounds(world,0); createSector(scene,0,bounds[0],bounds[1])
  return scene
end function
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
function packedExtent(value)
  return cm.max(1,cm.min(255,n.trunc32(value)))
end function
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
  for each leaf in leafs.entries
    cluster = vis.leafCluster(scene.world.visibility,leaf)
    if cluster != -1 then
      ent.clusters = ent.clusters+[cluster]
      if len(ent.clusters) == 16 then
        // Original tests i != num_leafs after breaking, even at the last leaf.
        ent.lastCluster = vis.leafCluster(scene.world.visibility,leafs.lastLeaf)
        break
      end if
    end if
  end for
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
function areaEntities(scene,mins,maxs,capacity)
  if typeof(capacity) != "int" or capacity < 0 or capacity > 1024 then return error(480,"Invalid server area-list capacity") end if
  mins = cm.vector32(mins); maxs = cm.vector32(maxs)
  result = []; stack = [0]
  while len(stack) > 0
    index = stack[len(stack)-1]; stack = arrays.slice(stack,0,len(stack)-1)
    node = scene.sectors[index]; scan = node.head; full = false
    while scan != -1
      ent = scene.entities[scan]; scan = ent.nextEntity; overlaps = true
      for axis = 0 to 2
        if ent.absmin[axis] > maxs[axis] or ent.absmax[axis] < mins[axis] then overlaps = false; break end if
      end for
      if not overlaps then continue end if
      if len(result) == capacity then full = true; break end if
      result = result+[ent.number]
    end while
    if full or node.axis == -1 then continue end if
    // LIFO: original visits positive child first, with strict split comparisons.
    if mins[node.axis] < node.distance then stack = stack+[node.children[1]] end if
    if maxs[node.axis] > node.distance then stack = stack+[node.children[0]] end if
  end while
  return result
end function
function clipHandleForEntity(scene,ent)
  if ent.bmodel then return cm.inlineModel(scene.world,ent.modelindex) end if
  return cm.tempBoxModel(scene.world,ent.mins,ent.maxs,(ent.svFlags & 1024) != 0)
end function
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
function pmoveTrace(p,start,finish)
  return trace(p.context,start,finish,p.k.mins,p.k.maxs,p.ps.clientNum,p.k.mask,false)
end function
function pmoveContents(p,point)
  return pointContents(p.context,point,p.ps.clientNum)
end function
function entityContact(scene,mins,maxs,number,capsule)
  ent = getEntity(scene,number); model = clipHandleForEntity(scene,ent)
  hit = cm.transformedTrace(scene.world,[0.0,0.0,0.0],[0.0,0.0,0.0],mins,maxs,model,-1,ent.currentOrigin,ent.currentAngles,capsule,scene.world.patchesReady)
  return hit.trace.startsolid
end function
