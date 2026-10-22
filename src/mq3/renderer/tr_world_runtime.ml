// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native facade for renderer/tr_world.c.
package mq3.renderer.tr_world_runtime
import mq3.renderer.world_surface_selection as selection

const CULL_IN=0
const CULL_CLIP=1
const CULL_OUT=2
const CONTENTS_NODE=-1
const CONTENTS_SOLID=1
const CT_FRONT_SIDED=0
const CT_BACK_SIDED=1
const CT_TWO_SIDED=2

struct Plane normal dist end struct
struct Dlight origin radius end struct
struct Surface kind bounds localOrigin meshRadius plane cullType viewCount fogIndex dlightBits end struct
struct Node contents mins maxs plane children parent cluster area marks visframe end struct
struct World nodes planes surfaces vis novis numClusters clusterBytes visCount viewCluster end struct
struct DrawSurface surfaceIndex fogIndex dlighted end struct
struct Traversal draws leafs visBounds end struct
struct MarkResult changed cluster visCount end struct

function fail(message) return error(7793,"tr_world: "+message) end function
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function

function boxOnPlaneSide(bounds,plane)
  near=[];far=[]
  for axis=0 to 2 if plane.normal[axis]>=0.0 then near=near+[bounds[0][axis]];far=far+[bounds[1][axis]] else near=near+[bounds[1][axis]];far=far+[bounds[0][axis]] end if end for
  front=dot(far,plane.normal)-plane.dist;back=dot(near,plane.normal)-plane.dist
  if back>=0.0 then return CULL_IN end if;if front<0.0 then return CULL_OUT end if;return CULL_CLIP
end function
function boxCull(bounds,frustum)
  clipped=false;for each plane in frustum side=boxOnPlaneSide(bounds,plane);if side==CULL_OUT then return CULL_OUT end if;if side==CULL_CLIP then clipped=true end if end for;if clipped then return CULL_CLIP end if;return CULL_IN
end function
function sphereCull(origin,radius,frustum)
  clipped=false;for each plane in frustum distance=dot(origin,plane.normal)-plane.dist;if distance<0.0-radius then return CULL_OUT end if;if distance<=radius then clipped=true end if end for;if clipped then return CULL_CLIP end if;return CULL_IN
end function

function R_CullTriSurf(surface,frustum) return boxCull(surface.bounds,frustum)==CULL_OUT end function
function R_CullGrid(surface,noCurves,worldEntity,frustum)
  if noCurves then return true end if
  sphere=sphereCull(surface.localOrigin,surface.meshRadius,frustum);if sphere==CULL_OUT then return true end if
  if sphere==CULL_CLIP and boxCull(surface.bounds,frustum)==CULL_OUT then return true end if
  return false
end function
function R_CullSurface(surface,noCull,noCurves,facePlaneCull,viewOrigin,frustum)
  if noCull then return false end if
  if surface.kind=="grid" then return R_CullGrid(surface,noCurves,true,frustum) end if
  if surface.kind=="triangles" then return R_CullTriSurf(surface,frustum) end if
  if surface.kind!="face" or surface.cullType==CT_TWO_SIDED or not facePlaneCull then return false end if
  distance=dot(viewOrigin,surface.plane.normal)
  if surface.cullType==CT_FRONT_SIDED then return distance<surface.plane.dist-8.0 end if
  return distance>surface.plane.dist+8.0
end function

function R_DlightFace(surface,dlightBits,lights)
  for index=0 to len(lights)-1 if (dlightBits&(1<<index))!=0 then distance=dot(lights[index].origin,surface.plane.normal)-surface.plane.dist;if distance<0.0-lights[index].radius or distance>lights[index].radius then dlightBits=dlightBits&(~(1<<index)) end if end if end for
  surface.dlightBits=dlightBits;return dlightBits
end function
function R_DlightGrid(surface,dlightBits,lights)
  for index=0 to len(lights)-1
    if (dlightBits&(1<<index))!=0 then light=lights[index];b=surface.bounds
      if light.origin[0]-light.radius>b[1][0] or light.origin[0]+light.radius<b[0][0] or light.origin[1]-light.radius>b[1][1] or light.origin[1]+light.radius<b[0][1] or light.origin[2]-light.radius>b[1][2] or light.origin[2]+light.radius<b[0][2] then dlightBits=dlightBits&(~(1<<index)) end if
    end if
  end for
  surface.dlightBits=dlightBits;return dlightBits
end function
function R_DlightTrisurf(surface,dlightBits,lights) surface.dlightBits=dlightBits;return dlightBits end function
function R_DlightSurface(surface,dlightBits,lights)
  if surface.kind=="face" then return R_DlightFace(surface,dlightBits,lights) end if
  if surface.kind=="grid" then return R_DlightGrid(surface,dlightBits,lights) end if
  if surface.kind=="triangles" then return R_DlightTrisurf(surface,dlightBits,lights) end if
  surface.dlightBits=0;return 0
end function

function R_AddWorldSurface(surface,surfaceIndex,dlightBits,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum)
  if surface.viewCount==viewCount then return void end if;surface.viewCount=viewCount
  if R_CullSurface(surface,noCull,noCurves,facePlaneCull,viewOrigin,frustum) then return void end if
  lighted=false;if dlightBits!=0 then lighted=R_DlightSurface(surface,dlightBits,lights)!=0 end if
  return DrawSurface(surfaceIndex,surface.fogIndex,lighted)
end function

function boundsOutside(bounds,frustum) return boxCull(bounds,frustum)==CULL_OUT end function
function R_AddBrushModelSurfaces(surfaces,surfaceIndexes,bounds,lights,needDlights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum)
  if boundsOutside(bounds,frustum) then return [] end if;draws=[]
  for index=0 to len(surfaces)-1 draw=R_AddWorldSurface(surfaces[index],surfaceIndexes[index],needDlights,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum);if draw!=void then draws=draws+[draw] end if end for
  return draws
end function

function R_PointInLeaf(world,point)
  if world==void or len(world.nodes)==0 then return fail("bad model") end if;index=0;guard=0
  while world.nodes[index].contents==CONTENTS_NODE
    node=world.nodes[index];plane=world.planes[node.plane];distance=dot(point,plane.normal)-plane.dist;if distance>0.0 then index=node.children[0] else index=node.children[1] end if
    guard=guard+1;if index<0 or index>=len(world.nodes) or guard>len(world.nodes) then return fail("invalid node tree") end if
  end while
  return index
end function
function R_ClusterPVS(world,cluster)
  if world==void then return bytes(0) end if
  if world.vis==void or cluster<0 or cluster>=world.numClusters then return world.novis end if
  return slice(world.vis,cluster*world.clusterBytes,world.clusterBytes)
end function
function R_inPVS(world,p1,p2)
  first=R_PointInLeaf(world,p1);if first is error then return first end if;mask=R_ClusterPVS(world,world.nodes[first].cluster);second=R_PointInLeaf(world,p2);if second is error then return second end if;cluster=world.nodes[second].cluster
  if cluster<0 or (cluster>>3)>=len(mask) then return false end if;return (mask[cluster>>3]&(1<<(cluster&7)))!=0
end function

function R_MarkLeaves(world,pvsOrigin,areaMask,lockPvs,noVis,areaMaskModified,showClusterModified)
  leafIndex=R_PointInLeaf(world,pvsOrigin);if leafIndex is error then return leafIndex end if;cluster=world.nodes[leafIndex].cluster
  if lockPvs then return MarkResult(false,cluster,world.visCount) end if
  if world.viewCluster==cluster and not areaMaskModified and not showClusterModified then return MarkResult(false,cluster,world.visCount) end if
  world.visCount=world.visCount+1;world.viewCluster=cluster
  if noVis or cluster==-1 then for each node in world.nodes if node.contents!=CONTENTS_SOLID then node.visframe=world.visCount end if end for;return MarkResult(true,cluster,world.visCount) end if
  mask=R_ClusterPVS(world,cluster)
  for index=0 to len(world.nodes)-1
    node=world.nodes[index];other=node.cluster
    if other<0 or other>=world.numClusters or (mask[other>>3]&(1<<(other&7)))==0 then continue end if
    if node.area>=0 and (node.area>>3)<len(areaMask) and (areaMask[node.area>>3]&(1<<(node.area&7)))!=0 then continue end if
    parent=index
    while parent>=0
      if world.nodes[parent].visframe==world.visCount then break end if;world.nodes[parent].visframe=world.visCount;parent=world.nodes[parent].parent
    end while
  end for
  return MarkResult(true,cluster,world.visCount)
end function

function expandBounds(bounds,mins,maxs) for axis=0 to 2 if mins[axis]<bounds[0][axis] then bounds[0][axis]=mins[axis] end if;if maxs[axis]>bounds[1][axis] then bounds[1][axis]=maxs[axis] end if end for;return bounds end function
function recurseNode(world,nodeIndex,planeBits,dlightBits,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum,result)
  node=world.nodes[nodeIndex];if node.visframe!=world.visCount then return result end if
  bits=planeBits;if not noCull then for planeIndex=0 to len(frustum)-1 bit=1<<planeIndex;if (bits&bit)!=0 then side=boxOnPlaneSide([node.mins,node.maxs],frustum[planeIndex]);if side==CULL_OUT then return result end if;if side==CULL_IN then bits=bits&(~bit) end if end if end for end if
  if node.contents!=CONTENTS_NODE then
    result.leafs=result.leafs+1;expandBounds(result.visBounds,node.mins,node.maxs)
    for each surfaceIndex in node.marks draw=R_AddWorldSurface(world.surfaces[surfaceIndex],surfaceIndex,dlightBits,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum);if draw!=void then result.draws=result.draws+[draw] end if end for;return result
  end if
  childBits=[0,0]
  for lightIndex=0 to len(lights)-1 if (dlightBits&(1<<lightIndex))!=0 then light=lights[lightIndex];distance=dot(light.origin,world.planes[node.plane].normal)-world.planes[node.plane].dist;if distance>0.0-light.radius then childBits[0]=childBits[0]|(1<<lightIndex) end if;if distance<light.radius then childBits[1]=childBits[1]|(1<<lightIndex) end if end if end for
  recurseNode(world,node.children[0],bits,childBits[0],lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum,result);recurseNode(world,node.children[1],bits,childBits[1],lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum,result);return result
end function
function R_RecursiveWorldNode(world,nodeIndex,planeBits,dlightBits,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum)
  result=Traversal([],0,[[999999.0,999999.0,999999.0],[-999999.0,-999999.0,-999999.0]])
  return recurseNode(world,nodeIndex,planeBits,dlightBits,lights,viewCount,noCull,noCurves,facePlaneCull,viewOrigin,frustum,result)
end function

// Productive world entry: the retained selector performs the same leaf/PVS,
// frustum, backface and surface de-duplication before BSP triangle expansion.
function R_AddWorldSurfaces(cache,camera,config) return selection.prepareCached(cache,camera,config) end function
