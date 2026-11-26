// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native adapter for code/botlib/be_aas_sample.c.
package mq3.botlib.aas_sample
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as aasSampleRuntime
import mq3.botlib.aas_trace_areas as traceAreas
import mq3.botlib.aas_client_trace as clientTrace
import mq3.compat.numeric as n

/// AAS presence-mask value selecting none.
const PRESENCE_NONE=1
/// AAS presence-mask value selecting normal.
const PRESENCE_NORMAL=2
/// AAS presence-mask value selecting crouch.
const PRESENCE_CROUCH=4
/// Standing on ground when in this face.
const FACE_GROUND=4
/// Collision contents bit marking water.
const CONTENTS_WATER=32
/// Collision contents bit marking slime.
const CONTENTS_SLIME=16
/// Collision contents bit marking lava.
const CONTENTS_LAVA=8
/// Combined collision-contents mask for water, slime, and lava volumes.
const MASK_WATER=56
/// Combined collision-contents mask for solid geometry and player clipping.
const MASK_SOLID_PLAYERCLIP=65537
/// Tolerance used when classifying a bounding box against an AAS plane.
const BBOX_NORMAL_EPSILON=0.001

/// `Link` record for aas sample, containing `id`, `entNum`, `areaNum` and `allocated`.
struct Link
  /// Identifier of this allocated entity-to-area link.
  id
  /// Game-entity number associated with the area link.
  entNum
  /// Navigation area associated with this entity-to-area link.
  areaNum
  /// True when the represented object currently owns a live allocation.
  allocated
end struct
/// `Services` record for aas sample, containing `entityCollisionFn`, `pointContentsFn` and `context`.
struct Services
  /// Host callback that tests collision against a game entity.
  entityCollisionFn
  /// Host callback that queries world contents at a supplied point.
  pointContentsFn
  /// Caller-supplied data associated with dynamic entity collisions and contents sampling around the
  /// navigation mesh.
  context
end struct
/// `World` record for aas sample, containing `runtime`, `map`, `heap`, `links` and `freeIds` and related fields.
struct World
  /// Loaded AAS geometry runtime used for area queries and static navigation traces.
  runtime
  /// Parsed AAS map supplying areas and partition nodes.
  map
  /// Managed storage allocated for entity-to-area links.
  heap
  /// Entity-to-area link records indexed by their link identifiers.
  links
  /// Link identifiers available for reuse.
  freeIds
  /// Number of free represented by this record.
  numFree
  /// Heads of entity-link chains for each AAS area.
  areaLinked
  /// Entities currently represented in the AAS area-link tables.
  linkedEntities
  /// Dynamic collision and contents callbacks supplementing static AAS sampling.
  services
  /// Indicates whether the host-backed retail-compatible runtime path is active.
  retailActive
  /// Recorded sampling and entity-link operations exposed to the navigation host.
  actions
end struct
/// `Action` record for aas sample, containing `boundary`, `kind`, `subject`, `detail` and `dispatched`.
struct Action
  /// Subsystem boundary at which this host action must be dispatched.
  boundary
  /// Discriminator identifying the recorded area-linking operation.
  kind
  /// Entity or area identifier affected by the recorded operation.
  subject
  /// Additional diagnostic information about the recorded operation.
  detail
  /// True after the recorded action has been delivered to the host.
  dispatched
end struct

/// Build the `mq3.botlib.aas_sample.World` result for `create`. Return paths include `World(rt,rt.map,[],[],[],0,array(count,void),[],Services(void,void,void),false,[])`.
/// @param rt Rt record; accesses `initialized` and `map`.
function create(rt)
  if rt==void or not rt.initialized then return error(7960,"AAS sample requires initialized runtime") end if
  count=rt.map.counts[aas.LUMP_AREAS];return World(rt,rt.map,[],[],[],0,array(count,void),[],Services(void,void,void),false,[])
end function
/// Set `world.actions` to `world.actions+[event]` in `mq3.botlib.aas_sample.emit`. Return paths include `event`.
/// @param world World data; accesses `retailActive` and `actions`. May update `world.actions` in place.
/// @param kind Initial value stored in `mq3.botlib.aas_sample.Action.kind`.
/// @param subject Initial value stored in `mq3.botlib.aas_sample.Action.subject`.
/// @param detail Initial value stored in `mq3.botlib.aas_sample.Action.detail`.
function emit(world,kind,subject,detail) event=Action("aas-sample",kind,subject,detail,not world.retailActive);world.actions=world.actions+[event];return event end function
/// Copy `v[0]`, `v[1]` and `v[2]` into a new ordered array for aas sample.
/// @param v Three-component array; components 0, 1 and 2 are used in their stored order.
function copy3(v) return [v[0],v[1],v[2]] end function
/// Return a new array `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]` for `sub`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function sub(a,b) return [a[0]-b[0],a[1]-b[1],a[2]-b[2]] end function
/// Return `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `dot`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function
/// Return a new array `[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]` for `cross`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function cross(a,b) return [a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]] end function
/// Test `areaNum>0 and areaNum<world.map.counts[aas.LUMP_AREAS]` as the condition for `validArea`.
/// @param world World data; accesses `map`.
/// @param areaNum AAS area number; zero denotes no area.
function validArea(world,areaNum) return areaNum>0 and areaNum<world.map.counts[aas.LUMP_AREAS] end function

/// Return standing bounds for normal presence and crouching bounds for the other presence values.
/// @param presenceType AAS presence type selecting the movement bounds.
function AAS_PresenceTypeBoundingBox(presenceType)
  if presenceType==PRESENCE_NORMAL then return [[-15.0,-15.0,-24.0],[15.0,15.0,32.0]] end if
  return [[-15.0,-15.0,-24.0],[15.0,15.0,8.0]]
end function
/// Update `world.heap`, `world.links`, `world.freeIds` and `world.heap[index]` and related state during `AAS_InitAASLinkHeap`. Return paths include `maximum`.
/// @param world World data; accesses `heap`, `links`, `freeIds` and `numFree`. May update `world.heap`, `world.links` and `world.freeIds` and additional fields in place.
/// @param maximum Upper bound applied by the operation.
function AAS_InitAASLinkHeap(world,maximum)
  if maximum<0 then maximum=0 end if;world.heap=array(maximum,void);world.links=[];world.freeIds=[];for index=0 to maximum-1 world.heap[index]=Link(index,0,0,false);world.freeIds=world.freeIds+[index] end for;world.numFree=maximum;return maximum
end function
/// Update `world.heap`, `world.links`, `world.freeIds` and `world.numFree` during `AAS_FreeAASLinkHeap`.
/// @param world World data; accesses `heap`, `links`, `freeIds` and `numFree`. May update `world.heap`, `world.links` and `world.freeIds` and additional fields in place.
function AAS_FreeAASLinkHeap(world) world.heap=[];world.links=[];world.freeIds=[];world.numFree=0;return void end function
/// Record or dispatch `"heap-empty"` actions in `AAS_AllocAASLink`.
/// @param world World data; accesses `freeIds`, `heap` and `numFree`. May update `world.freeIds` and `world.numFree` in place.
function AAS_AllocAASLink(world)
  if len(world.freeIds)==0 then emit(world,"heap-empty",-1,"empty aas link heap");return void end if;id=world.freeIds[0];remaining=[];if len(world.freeIds)>1 then for index=1 to len(world.freeIds)-1 remaining=remaining+[world.freeIds[index]] end for end if;world.freeIds=remaining;value=world.heap[id];value.allocated=true;value.entNum=0;value.areaNum=0;world.numFree=world.numFree-1;return value
end function
/// Update `link.allocated`, `link.entNum`, `link.areaNum` and `world.freeIds` and related state during `AAS_DeAllocAASLink`.
/// @param world World data; accesses `freeIds` and `numFree`. May update `world.freeIds` and `world.numFree` in place.
/// @param link Link record; accesses `allocated`, `entNum`, `areaNum` and `id`. May update `link.allocated`, `link.entNum` and `link.areaNum` in place.
function AAS_DeAllocAASLink(world,link)
  if link==void or not link.allocated then return false end if;link.allocated=false;link.entNum=0;link.areaNum=0;world.freeIds=[link.id]+world.freeIds;world.numFree=world.numFree+1;return true
end function
/// Update `world.areaLinked`, `world.areaLinked[index]` and `world.linkedEntities` during `AAS_InitAASLinkedEntities`.
/// @param world World data; accesses `areaLinked`, `map` and `linkedEntities`. May update `world.areaLinked`, `world.areaLinked[index]` and `world.linkedEntities` in place.
function AAS_InitAASLinkedEntities(world) world.areaLinked=array(world.map.counts[aas.LUMP_AREAS],void);for index=0 to len(world.areaLinked)-1 world.areaLinked[index]=[] end for;world.linkedEntities=[];return true end function
/// Set `world.areaLinked` to `[]` and `world.linkedEntities` to `[]` in `mq3.botlib.aas_sample.AAS_FreeAASLinkedEntities`.
/// @param world World data; accesses `areaLinked` and `linkedEntities`. May update `world.areaLinked` and `world.linkedEntities` in place.
function AAS_FreeAASLinkedEntities(world) world.areaLinked=[];world.linkedEntities=[];return void end function
/// Forward `AAS_PointAreaNum` to `mq3.botlib.aas_runtime.pointAreaNum` and return the delegated result.
/// @param world World data; accesses `runtime`.
/// @param point Three-component point used by the geometric query.
function AAS_PointAreaNum(world,point) return aasSampleRuntime.pointAreaNum(world.runtime,point) end function
/// Apply `mq3.format.aas.cluster`, `mq3.botlib.aas_sample.AAS_PointAreaNum` and `mq3.botlib.aas_sample.validArea` while evaluating `AAS_PointReachabilityAreaIndex`.
/// @param world World data; accesses `map`.
/// @param origin World-space position as three coordinates.
function AAS_PointReachabilityAreaIndex(world,origin)
  clusterCount=world.map.counts[aas.LUMP_CLUSTERS];if origin==void then total=0;for index=0 to clusterCount-1 value=aas.cluster(world.map,index);total=total+value.numReachabilityAreas end for;return total end if
  areaNum=AAS_PointAreaNum(world,origin);if not validArea(world,areaNum) then return 0 end if;settings=aas.areaSettings(world.map,areaNum);if settings.numReachableAreas==0 then return 0 end if;clusterNum=settings.cluster;areaIndex=settings.clusterAreaNum
  if clusterNum<0 then portal=aas.portal(world.map,0-clusterNum);clusterNum=portal.frontCluster;areaIndex=portal.clusterAreaNums[0] end if
  result=areaIndex;if clusterNum>0 then for index=0 to clusterNum-1 value=aas.cluster(world.map,index);result=result+value.numReachabilityAreas end for end if;return result
end function
/// Apply `mq3.botlib.aas_sample.validArea` and `mq3.format.aas.areaSettings` while evaluating `AAS_AreaCluster`. Return paths include `aas.areaSettings(world.map,areaNum).cluster`.
/// @param world World data; accesses `map`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaCluster(world,areaNum) if not validArea(world,areaNum) then return 0 end if;return aas.areaSettings(world.map,areaNum).cluster end function
/// Apply `mq3.botlib.aas_sample.validArea` and `mq3.format.aas.areaSettings` while evaluating `AAS_AreaPresenceType`. Return paths include `aas.areaSettings(world.map,areaNum).presenceType`.
/// @param world World data; accesses `map`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaPresenceType(world,areaNum) if not validArea(world,areaNum) then return 0 end if;return aas.areaSettings(world.map,areaNum).presenceType end function
/// Forward `AAS_PointPresenceType` to `mq3.botlib.aas_runtime.pointPresenceType` and return the delegated result.
/// @param world World data; accesses `runtime`.
/// @param point Three-component point used by the geometric query.
function AAS_PointPresenceType(world,point) return aasSampleRuntime.pointPresenceType(world.runtime,point) end function
/// Use `world.services.pointContentsFn` to perform `AAS_SwimLevel`.
/// @param world World data; accesses `services`.
/// @param point Three-component point used by the geometric query.
function AAS_SwimLevel(world,point) contents=0;if world.services.pointContentsFn!=void then contents=world.services.pointContentsFn(world.services.context,point) end if;if (contents&CONTENTS_LAVA)!=0 then return 3 else if (contents&CONTENTS_SLIME)!=0 then return 2 else if (contents&CONTENTS_WATER)!=0 then return 1 end if;return 0 end function
/// Apply `mq3.botlib.aas_sample.dot` while evaluating `AAS_BoxOriginDistanceFromPlane`. Return paths include `0.0-dot(point,normal)`.
/// @param normal Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param side Value used by `AAS_BoxOriginDistanceFromPlane` in `if side!=0 then`.
function AAS_BoxOriginDistanceFromPlane(normal,mins,maxs,side)
  point=[0.0,0.0,0.0]
  for axis=0 to 2
    if side!=0 then
      if normal[axis]>BBOX_NORMAL_EPSILON then point[axis]=maxs[axis] end if
      if normal[axis]<0.0-BBOX_NORMAL_EPSILON then point[axis]=mins[axis] end if
    else
      if normal[axis]>BBOX_NORMAL_EPSILON then point[axis]=mins[axis] end if
      if normal[axis]<0.0-BBOX_NORMAL_EPSILON then point[axis]=maxs[axis] end if
    end if
  end for
  return 0.0-dot(point,normal)
end function
/// Use `world.services.entityCollisionFn` to perform `AAS_AreaEntityCollision`.
/// @param world World data; accesses `areaLinked`, `services` and `heap`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param start Value passed as argument 3 to `world.services.entityCollisionFn`.
/// @param finish Value passed as argument 6 to `world.services.entityCollisionFn`.
/// @param presenceType AAS presence type selecting the movement bounds.
/// @param passent Value used by `AAS_AreaEntityCollision` in `if not link.allocated or link.entNum==passent then continue end if`.
function AAS_AreaEntityCollision(world,areaNum,start,finish,presenceType,passent)
  result=clientTrace.empty();result.fraction=1.0;if areaNum<0 or areaNum>=len(world.areaLinked) or world.services.entityCollisionFn==void then return result end if;bounds=AAS_PresenceTypeBoundingBox(presenceType)
  for each id in world.areaLinked[areaNum] link=world.heap[id];if not link.allocated or link.entNum==passent then continue end if;candidate=world.services.entityCollisionFn(world.services.context,link.entNum,start,bounds[0],bounds[1],finish,MASK_SOLID_PLAYERCLIP);if candidate!=void and (candidate.startsolid or candidate.fraction<result.fraction) then result=candidate end if end for;return result
end function
/// Apply `mq3.botlib.aas_client_trace.trace`, `mq3.botlib.aas_trace_areas.trace` and `mq3.botlib.aas_sample.AAS_AreaEntityCollision` while evaluating `AAS_TraceClientBBox`. Return paths include `best`.
/// @param world World data; accesses `runtime` and `services`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param presenceType AAS presence type selecting the movement bounds.
/// @param passent Value used by `AAS_AreaEntityCollision` in `if not link.allocated or link.entNum==passent then continue end if`.
function AAS_TraceClientBBox(world,start,finish,presenceType,passent)
  staticTrace=clientTrace.trace(world.runtime,start,finish,presenceType);if passent<0 or world.services.entityCollisionFn==void then return staticTrace end if
  crossed=traceAreas.trace(world.runtime,start,finish,128);best=staticTrace;for each areaNum in crossed.areas candidate=AAS_AreaEntityCollision(world,areaNum,start,finish,presenceType,passent);if candidate.startsolid or candidate.fraction<best.fraction then best=candidate end if end for;return best
end function
/// Forward `AAS_TraceAreas` to `mq3.botlib.aas_trace_areas.trace` and return the delegated result.
/// @param world World data; accesses `runtime`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param maximum Upper bound applied by the operation.
function AAS_TraceAreas(world,start,finish,maximum) return traceAreas.trace(world.runtime,start,finish,maximum) end function
/// Apply `mq3.format.aas.edge` and `mq3.format.aas.vertex` while evaluating `edgeVertices`. Return paths include `[aas.vertex(world.map,edge[side]),aas.vertex(world.map,edge[1-side])]`.
/// @param world World data; accesses `map`.
/// @param signedEdge Index of the entry to access.
function edgeVertices(world,signedEdge)
  side=0;if signedEdge<0 then signedEdge=0-signedEdge;side=1 end if;edge=aas.edge(world.map,signedEdge);return [aas.vertex(world.map,edge[side]),aas.vertex(world.map,edge[1-side])]
end function
/// Apply `mq3.format.aas.face`, `mq3.format.aas.edgeIndex` and `mq3.botlib.aas_sample.edgeVertices` while evaluating `AAS_InsideFace`.
/// @param world World data; accesses `map`.
/// @param faceNum AAS face index.
/// @param pnormal Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param point Three-component point used by the geometric query.
/// @param epsilon Value used by `AAS_InsideFace` in `if dot(pointvec,separation)<0.0-epsilon then return false end if end for`.
function AAS_InsideFace(world,faceNum,pnormal,point,epsilon)
  face=aas.face(world.map,faceNum);for offset=0 to face.numEdges-1 signedEdge=aas.edgeIndex(world.map,face.firstEdge+offset);vertices=edgeVertices(world,signedEdge);edgevec=sub(vertices[1],vertices[0]);pointvec=sub(point,vertices[0]);separation=cross(edgevec,pnormal);if dot(pointvec,separation)<0.0-epsilon then return false end if end for;return true
end function
/// Apply `mq3.format.aas.face`, `mq3.format.aas.plane` and `mq3.botlib.aas_sample.AAS_InsideFace` while evaluating `AAS_PointInsideFace`. Return paths include `AAS_InsideFace(world,faceNum,plane.normal,point,epsilon)`.
/// @param world World data; accesses `map`.
/// @param faceNum AAS face index.
/// @param point Three-component point used by the geometric query.
/// @param epsilon Value used by `AAS_InsideFace` in `if dot(pointvec,separation)<0.0-epsilon then return false end if end for`.
function AAS_PointInsideFace(world,faceNum,point,epsilon) face=aas.face(world.map,faceNum);plane=aas.plane(world.map,face.planeNum);return AAS_InsideFace(world,faceNum,plane.normal,point,epsilon) end function
/// Apply `mq3.botlib.aas_runtime.pointAreaNum`, `mq3.format.aas.areaSettings` and `mq3.format.aas.area` while evaluating `againstLadder`.
/// @param rt Rt record; accesses `map`.
/// @param origin World-space position as three coordinates.
function againstLadder(rt,origin)
  areaNum=aasSampleRuntime.pointAreaNum(rt,origin)
  if areaNum==0 then areaNum=aasSampleRuntime.pointAreaNum(rt,[origin[0]+1.0,origin[1],origin[2]]) end if
  if areaNum==0 then areaNum=aasSampleRuntime.pointAreaNum(rt,[origin[0]+1.0,origin[1]+1.0,origin[2]]) end if
  if areaNum==0 then areaNum=aasSampleRuntime.pointAreaNum(rt,[origin[0]-1.0,origin[1]+1.0,origin[2]]) end if
  if areaNum==0 then areaNum=aasSampleRuntime.pointAreaNum(rt,[origin[0]-1.0,origin[1]-1.0,origin[2]]) end if
  if areaNum==0 then return false end if
  settings=aas.areaSettings(rt.map,areaNum)
  if (settings.flags&aas.AREA_LADDER)==0 or (settings.presenceType&PRESENCE_NORMAL)==0 then return false end if
  area=aas.area(rt.map,areaNum)
  if area.numFaces==0 then return false end if
  for offset=0 to area.numFaces-1
    faceNum=aas.faceIndex(rt.map,area.firstFace+offset)
    side=0
    if faceNum<0 then side=1;faceNum=0-faceNum end if
    face=aas.face(rt.map,faceNum)
    if (face.flags&aas.FACE_LADDER)==0 then continue end if
    plane=aas.plane(rt.map,face.planeNum^side)
    if aasSampleRuntime.absValue(dot(plane.normal,origin)-plane.dist)<3.0 and AAS_PointInsideFace(rt,faceNum,origin,0.1) then return true end if
  end for
  return false
end function
/// Apply `mq3.botlib.aas_sample.validArea`, `mq3.format.aas.area` and `mq3.format.aas.faceIndex` while evaluating `AAS_AreaGroundFace`.
/// @param world World data; accesses `map`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param point Three-component point used by the geometric query.
function AAS_AreaGroundFace(world,areaNum,point)
  if not validArea(world,areaNum) then return 0 end if;area=aas.area(world.map,areaNum);for offset=0 to area.numFaces-1 faceNum=aas.faceIndex(world.map,area.firstFace+offset);if faceNum<0 then faceNum=0-faceNum end if;face=aas.face(world.map,faceNum);if (face.flags&FACE_GROUND)!=0 then plane=aas.plane(world.map,face.planeNum);normal=[0.0,0.0,1.0];if plane.normal[2]<0.0 then normal=[0.0,0.0,-1.0] end if;if AAS_InsideFace(world,faceNum,normal,point,0.01) then return faceNum end if end if end for;return 0
end function
/// Apply `mq3.format.aas.face`, `mq3.format.aas.plane` and `mq3.botlib.aas_sample.copy3` while evaluating `AAS_FacePlane`. Return paths include `[copy3(plane.normal),plane.dist]`.
/// @param world World data; accesses `map`.
/// @param faceNum AAS face index.
function AAS_FacePlane(world,faceNum) face=aas.face(world.map,faceNum);plane=aas.plane(world.map,face.planeNum);return [copy3(plane.normal),plane.dist] end function
/// Apply `mq3.botlib.aas_sample.validArea`, `mq3.format.aas.area` and `mq3.format.aas.faceIndex` while evaluating `AAS_TraceEndFace`.
/// @param world World data; accesses `map`.
/// @param trace Trace record; accesses `startsolid`, `lastarea`, `planenum` and `endpos`.
function AAS_TraceEndFace(world,trace)
  if trace.startsolid or not validArea(world,trace.lastarea) then return 0 end if;area=aas.area(world.map,trace.lastarea);for offset=0 to area.numFaces-1 faceNum=aas.faceIndex(world.map,area.firstFace+offset);if faceNum<0 then faceNum=0-faceNum end if;face=aas.face(world.map,faceNum);if (face.planeNum&(~1))==(trace.planenum&(~1)) then plane=aas.plane(world.map,face.planeNum);if AAS_InsideFace(world,faceNum,plane.normal,trace.endpos,0.01) then return faceNum end if end if end for;return 0
end function
/// Apply `mq3.botlib.aas_sample.dot` while evaluating `AAS_BoxOnPlaneSide2`. Return paths include `sides`.
/// @param absmins World-space minimum coordinates of the bounds.
/// @param absmaxs World-space maximum coordinates of the bounds.
/// @param plane Plane record; accesses `normal` and `dist`.
function AAS_BoxOnPlaneSide2(absmins,absmaxs,plane)
  near=[0.0,0.0,0.0];far=[0.0,0.0,0.0];for axis=0 to 2 if plane.normal[axis]<0.0 then near[axis]=absmins[axis];far[axis]=absmaxs[axis] else far[axis]=absmins[axis];near[axis]=absmaxs[axis] end if end for;dist1=dot(plane.normal,near)-plane.dist;dist2=dot(plane.normal,far)-plane.dist;sides=0;if dist1>=0.0 then sides=1 end if;if dist2<0.0 then sides=sides|2 end if;return sides
end function
/// Set `world.areaLinked[link.areaNum]` to `remaining` in `mq3.botlib.aas_sample.AAS_UnlinkFromAreas`. Return paths include `count`.
/// @param world World data; accesses `heap` and `areaLinked`. May update `world.areaLinked[link.areaNum]` in place.
/// @param links Value used by `AAS_UnlinkFromAreas` in `for each id in links if id<0 or id>=len(world.heap) then continue end if`.
function AAS_UnlinkFromAreas(world,links)
  count=0;for each id in links if id<0 or id>=len(world.heap) then continue end if;link=world.heap[id];if not link.allocated then continue end if;remaining=[];for each current in world.areaLinked[link.areaNum] if current!=id then remaining=remaining+[current] end if end for;world.areaLinked[link.areaNum]=remaining;AAS_DeAllocAASLink(world,link);count=count+1 end for;return count
end function
/// Set `world.areaLinked[areaNum]` to `[link.id]+world.areaLinked[areaNum]` and `world.linkedEntities` to `world.linkedEntities+[result]` in `mq3.botlib.aas_sample.AAS_AASLinkEntity`.
/// @param world World data; accesses `areaLinked`, `runtime`, `heap` and `linkedEntities`. May update `world.areaLinked[areaNum]` and `world.linkedEntities` in place.
/// @param absmins World-space minimum coordinates of the bounds.
/// @param absmaxs World-space maximum coordinates of the bounds.
/// @param entNum Value used by `AAS_AASLinkEntity` in `for each id in world.areaLinked[areaNum] if world.heap[id].allocated and world.heap[id].entNum==entNum then dupl...`.
function AAS_AASLinkEntity(world,absmins,absmaxs,entNum)
  if len(world.areaLinked)==0 then AAS_InitAASLinkedEntities(world) end if;areas=aasSampleRuntime.bboxAreas(world.runtime,absmins,absmaxs,128);result=[]
  for each areaNum in areas duplicate=false;for each id in world.areaLinked[areaNum] if world.heap[id].allocated and world.heap[id].entNum==entNum then duplicate=true;break end if end for;if duplicate then continue end if;link=AAS_AllocAASLink(world);if link==void then break end if;link.entNum=entNum;link.areaNum=areaNum;world.areaLinked[areaNum]=[link.id]+world.areaLinked[areaNum];result=result+[link.id] end for;world.linkedEntities=world.linkedEntities+[result];return result
end function
/// Apply `mq3.botlib.aas_sample.AAS_PresenceTypeBoundingBox` and `mq3.botlib.aas_sample.AAS_AASLinkEntity` while evaluating `AAS_LinkEntityClientBBox`. Return paths include `AAS_AASLinkEntity(world,newmins,newmaxs,entNum)`.
/// @param world World data; accesses `areaLinked`, `runtime`, `heap` and `linkedEntities`. May update `world.areaLinked[areaNum]` and `world.linkedEntities` in place.
/// @param absmins World-space minimum coordinates of the bounds.
/// @param absmaxs World-space maximum coordinates of the bounds.
/// @param entNum Value used by `AAS_AASLinkEntity` in `for each id in world.areaLinked[areaNum] if world.heap[id].allocated and world.heap[id].entNum==entNum then dupl...`.
/// @param presenceType AAS presence type selecting the movement bounds.
function AAS_LinkEntityClientBBox(world,absmins,absmaxs,entNum,presenceType) bounds=AAS_PresenceTypeBoundingBox(presenceType);newmins=[absmins[0]-bounds[1][0],absmins[1]-bounds[1][1],absmins[2]-bounds[1][2]];newmaxs=[absmaxs[0]-bounds[0][0],absmaxs[1]-bounds[0][1],absmaxs[2]-bounds[0][2]];return AAS_AASLinkEntity(world,newmins,newmaxs,entNum) end function
/// Forward `AAS_BBoxAreas` to `mq3.botlib.aas_runtime.bboxAreas` and return the delegated result.
/// @param world World data; accesses `runtime`.
/// @param absmins World-space minimum coordinates of the bounds.
/// @param absmaxs World-space maximum coordinates of the bounds.
/// @param maximum Upper bound applied by the operation.
function AAS_BBoxAreas(world,absmins,absmaxs,maximum) return aasSampleRuntime.bboxAreas(world.runtime,absmins,absmaxs,maximum) end function
/// Apply `mq3.botlib.aas_sample.validArea` and `mq3.botlib.aas_runtime.areaInfo` while evaluating `AAS_AreaInfo`. Return paths include `aasSampleRuntime.areaInfo(world.runtime,areaNum)`.
/// @param world World data; accesses `runtime`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaInfo(world,areaNum) if not validArea(world,areaNum) then return void end if;return aasSampleRuntime.areaInfo(world.runtime,areaNum) end function
/// Apply `mq3.format.aas.plane` while evaluating `AAS_PlaneFromNum`. Return paths include `aas.plane(world.map,planeNum)`.
/// @param world World data; accesses `map`.
/// @param planeNum Index of the entry to access.
function AAS_PlaneFromNum(world,planeNum) if planeNum<0 or planeNum>=world.map.counts[aas.LUMP_PLANES] then return void end if;return aas.plane(world.map,planeNum) end function
