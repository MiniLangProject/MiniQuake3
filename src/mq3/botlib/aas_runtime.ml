// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Runtime queries from be_aas_sample.c, be_aas_reach.c and be_aas_route.c.
package mq3.botlib.aas_runtime

import mq3.format.aas as aas
import mq3.compat.numeric as n
import std.array as arrays

/// AAS presence-mask value selecting normal.
const PRESENCE_NORMAL=2
/// AAS presence-mask value selecting crouch.
const PRESENCE_CROUCH=4
/// Area is disabled for routing when set.
const AREA_DISABLED=8

/// `Runtime` record for aas runtime, containing `map`, `initialized`, `disabled`, `time` and `cacheInvalidations` and related fields.
struct Runtime
  /// Parsed AAS navigation map used by the runtime.
  map
  /// True when the loaded navigation map is ready for area and reachability queries.
  initialized
  /// Area-indexed flags excluding selected areas from route calculations.
  disabled
  /// Current AAS simulation time supplied by the bot frame.
  time
  /// Number of routing-cache invalidations caused by area changes.
  cacheInvalidations
  /// Cached decoded BSP/AAS node records.
  nodeCache
  /// Cached decoded AAS plane records.
  planeCache
end struct
/// `AreaInfo` record for aas runtime, containing `contents`, `flags`, `presenceType`, `cluster` and `clusterAreaNum` and related fields.
struct AreaInfo
  /// Collision or AAS contents flags describing the represented volume.
  contents
  /// Combined AAS area-property flags read from the area settings.
  flags
  /// Presence-type mask describing the bot hull or stance allowed here.
  presenceType
  /// Navigation cluster containing this area, or a portal-cluster marker.
  cluster
  /// Index of the area within its containing navigation cluster.
  clusterAreaNum
  /// Number of outgoing reachability records belonging to this AAS area.
  numReachableAreas
  /// First outgoing reachability index for this area in the shared reachability array.
  firstReachableArea
  /// Minimum XYZ corner of the navigation area returned by this runtime query.
  mins
  /// Maximum XYZ corner of the navigation area returned by this runtime query.
  maxs
  /// 'center' of the area.
  center
end struct

/// Construct error `7520` with diagnostic text `"AAS runtime: "+message`.
/// @param message Message text supplied to the diagnostic or chat operation.
function fail(message) return error(7520,"AAS runtime: "+message) end function
/// Build the `mq3.botlib.aas_runtime.Runtime` result for `create`.
/// @param map Map record; accesses `counts`.
function create(map)
  if map==void then return fail("map missing") end if
  disabled=array(map.counts[aas.LUMP_AREAS],false)
  if len(disabled)>0 then for index=0 to len(disabled)-1 settings=aas.areaSettings(map,index);if settings is error then return settings end if;disabled[index]=(settings.flags&AREA_DISABLED)!=0 end for end if
  return Runtime(map,true,disabled,0.0,0,array(map.counts[aas.LUMP_NODES],void),array(map.counts[aas.LUMP_PLANES],void))
end function
/// Test `runtime!=void and runtime.initialized and areaNum>0 and areaNum<runtime.map.counts[aas.LUMP_AREAS]` as the condition for `validArea`.
/// @param runtime AAS runtime; accesses `initialized` and `map`.
/// @param areaNum AAS area number; zero denotes no area.
function validArea(runtime,areaNum) return runtime!=void and runtime.initialized and areaNum>0 and areaNum<runtime.map.counts[aas.LUMP_AREAS] end function
/// Return `point[0]*normal[0]+point[1]*normal[1]+point[2]*normal[2]` for `dot`.
/// @param point Three-component point used by the geometric query.
/// @param normal Three-component array; components 0, 1 and 2 are used in their stored order.
function dot(point,normal) return point[0]*normal[0]+point[1]*normal[1]+point[2]*normal[2] end function
/// Traverse the AAS BSP nodes to locate the area containing the supplied point.
/// @param runtime AAS runtime; accesses `initialized`, `map`, `nodeCache` and `planeCache`. May update `runtime.nodeCache[nodeNum]` and `runtime.planeCache[node.planeNum]` in place.
/// @param point Three-component point used by the geometric query.
function pointAreaNum(runtime,point)
  if runtime==void or not runtime.initialized or runtime.map.counts[aas.LUMP_NODES]<2 then return 0 end if
  if point==void or len(point)!=3 then return 0 end if
  nodeNum=1;steps=0;limit=runtime.map.counts[aas.LUMP_NODES]+1
  while nodeNum>0
    if nodeNum>=runtime.map.counts[aas.LUMP_NODES] or steps>=limit then return 0 end if
    node=runtime.nodeCache[nodeNum]
    if node==void then node=aas.node(runtime.map,nodeNum);if node is error then return 0 end if;runtime.nodeCache[nodeNum]=node end if
    if node.planeNum<0 or node.planeNum>=len(runtime.planeCache) then return 0 end if
    plane=runtime.planeCache[node.planeNum]
    if plane==void then plane=aas.plane(runtime.map,node.planeNum);if plane is error then return 0 end if;runtime.planeCache[node.planeNum]=plane end if
    if dot(point,plane.normal)-plane.dist>0.0 then nodeNum=node.children[0] else nodeNum=node.children[1] end if
    steps=steps+1
  end while
  if nodeNum==0 then return 0 end if
  areaNum=0-nodeNum;if areaNum<=0 or areaNum>=runtime.map.counts[aas.LUMP_AREAS] then return 0 end if;return areaNum
end function
/// Apply `mq3.botlib.aas_runtime.pointAreaNum` and `mq3.format.aas.areaSettings` while evaluating `pointPresenceType`. Return paths include `settings.presenceType`.
/// @param runtime AAS runtime; accesses `map`.
/// @param point Three-component point used by the geometric query.
function pointPresenceType(runtime,point)
  areaNum=pointAreaNum(runtime,point);if areaNum==0 then return 0 end if;settings=aas.areaSettings(runtime.map,areaNum);if settings is error then return 0 end if;return settings.presenceType
end function
/// Return standing or crouching player bounds for the presence type and reject unsupported types.
/// @param presenceType AAS presence type selecting the movement bounds.
function presenceTypeBoundingBox(presenceType)
  if presenceType==PRESENCE_NORMAL then return [[-15.0,-15.0,-24.0],[15.0,15.0,32.0]] end if
  if presenceType==PRESENCE_CROUCH then return [[-15.0,-15.0,-24.0],[15.0,15.0,8.0]] end if
  return fail("unknown presence type")
end function
/// Build the `mq3.botlib.aas_runtime.AreaInfo` result for `areaInfo`.
/// @param runtime AAS runtime; accesses `map` and `disabled`.
/// @param areaNum AAS area number; zero denotes no area.
function areaInfo(runtime,areaNum)
  if not validArea(runtime,areaNum) then return fail("area outside map") end if
  area=aas.area(runtime.map,areaNum);if area is error then return area end if;settings=aas.areaSettings(runtime.map,areaNum);if settings is error then return settings end if
  flags=settings.flags;if runtime.disabled[areaNum] then flags=flags|AREA_DISABLED else flags=flags&(~AREA_DISABLED) end if
  return AreaInfo(settings.contents,flags,settings.presenceType,settings.cluster,settings.clusterAreaNum,settings.numReachableAreas,settings.firstReachableArea,[area.mins[0],area.mins[1],area.mins[2]],[area.maxs[0],area.maxs[1],area.maxs[2]],[area.center[0],area.center[1],area.center[2]])
end function
/// Apply `mq3.botlib.aas_runtime.validArea` and `mq3.format.aas.areaSettings` while evaluating `areaReachability`. Return paths include `settings.numReachableAreas`.
/// @param runtime AAS runtime; accesses `map`.
/// @param areaNum AAS area number; zero denotes no area.
function areaReachability(runtime,areaNum)
  if not validArea(runtime,areaNum) then return 0 end if;settings=aas.areaSettings(runtime.map,areaNum);if settings is error then return 0 end if;return settings.numReachableAreas
end function
/// Return a new array `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]` for `vectorSubtract`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function vectorSubtract(a,b) return [a[0]-b[0],a[1]-b[1],a[2]-b[2]] end function
/// Return a new array `[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]` for `vectorCross`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function vectorCross(a,b) return [a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]] end function
/// Forward `vectorLength` to `mq3.compat.numeric.fsqrt` and return the delegated result.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function vectorLength(value) return n.fsqrt(value[0]*value[0]+value[1]*value[1]+value[2]*value[2]) end function
/// Apply `mq3.format.aas.face`, `mq3.format.aas.edgeIndex` and `mq3.format.aas.edge` while evaluating `faceArea`. Return paths include `total`.
/// @param runtime AAS runtime; accesses `map`.
/// @param faceNum AAS face index.
function faceArea(runtime,faceNum)
  if runtime==void or runtime.map==void then return 0.0 end if;if faceNum<0 then faceNum=0-faceNum end if
  face=aas.face(runtime.map,faceNum);if face is error or face.numEdges<3 then return 0.0 end if
  edgeNum=aas.edgeIndex(runtime.map,face.firstEdge);if edgeNum is error then return 0.0 end if;firstSide=0;if edgeNum<0 then edgeNum=0-edgeNum;firstSide=1 end if
  edge=aas.edge(runtime.map,edgeNum);if edge is error then return 0.0 end if;corner=aas.vertex(runtime.map,edge[firstSide]);if corner is error then return 0.0 end if
  total=0.0
  for index=1 to face.numEdges-2
    signedEdge=aas.edgeIndex(runtime.map,face.firstEdge+index);if signedEdge is error then continue end if;side=0;if signedEdge<0 then signedEdge=0-signedEdge;side=1 end if
    current=aas.edge(runtime.map,signedEdge);if current is error then continue end if
    first=aas.vertex(runtime.map,current[side]);second=aas.vertex(runtime.map,current[1-side]);if first is error or second is error then continue end if
    total=total+0.5*vectorLength(vectorCross(vectorSubtract(first,corner),vectorSubtract(second,corner)))
  end for
  return total
end function
/// Apply `mq3.botlib.aas_runtime.validArea`, `mq3.format.aas.area` and `mq3.format.aas.faceIndex` while evaluating `areaVolume`. Return paths include `volume/3.0`.
/// @param runtime AAS runtime; accesses `map`.
/// @param areaNum AAS area number; zero denotes no area.
function areaVolume(runtime,areaNum)
  if not validArea(runtime,areaNum) then return 0.0 end if;area=aas.area(runtime.map,areaNum);if area is error or area.numFaces<1 then return 0.0 end if
  firstFace=aas.faceIndex(runtime.map,area.firstFace);if firstFace is error then return 0.0 end if;if firstFace<0 then firstFace=0-firstFace end if
  face=aas.face(runtime.map,firstFace);if face is error or face.numEdges<1 then return 0.0 end if
  firstEdge=aas.edgeIndex(runtime.map,face.firstEdge);if firstEdge is error then return 0.0 end if;if firstEdge<0 then firstEdge=0-firstEdge end if
  edge=aas.edge(runtime.map,firstEdge);if edge is error then return 0.0 end if;corner=aas.vertex(runtime.map,edge[0]);if corner is error then return 0.0 end if
  volume=0.0
  for index=0 to area.numFaces-1
    faceNum=aas.faceIndex(runtime.map,area.firstFace+index);if faceNum is error then continue end if;if faceNum<0 then faceNum=0-faceNum end if
    current=aas.face(runtime.map,faceNum);if current is error then continue end if;side=0;if current.backArea!=areaNum then side=1 end if
    plane=aas.plane(runtime.map,current.planeNum^side);if plane is error then continue end if
    distance=0.0-(corner[0]*plane.normal[0]+corner[1]*plane.normal[1]+corner[2]*plane.normal[2]-plane.dist)
    volume=volume+distance*faceArea(runtime,faceNum)
  end for
  return volume/3.0
end function
/// Apply `mq3.botlib.aas_runtime.validArea` and `mq3.format.aas.areaSettings` while evaluating `nextAreaReachability`. Return paths include `reachNum`.
/// @param runtime AAS runtime; accesses `map`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param reachNum Operand used to evaluate the returned expression `reachNum`.
function nextAreaReachability(runtime,areaNum,reachNum)
  if not validArea(runtime,areaNum) then return 0 end if;settings=aas.areaSettings(runtime.map,areaNum);if settings is error then return 0 end if
  if reachNum==0 then return settings.firstReachableArea end if
  if reachNum<settings.firstReachableArea then return 0 end if
  reachNum=reachNum+1;if reachNum>=settings.firstReachableArea+settings.numReachableAreas then return 0 end if;return reachNum
end function
/// Apply `mq3.format.aas.reachability` while evaluating `reachabilityFromNum`. Return paths include `aas.reachability(runtime.map,reachNum)`.
/// @param runtime AAS runtime; accesses `initialized` and `map`.
/// @param reachNum Index of the entry to access.
function reachabilityFromNum(runtime,reachNum)
  if runtime==void or not runtime.initialized or reachNum<0 or reachNum>=runtime.map.counts[aas.LUMP_REACHABILITY] then return fail("reachability outside map") end if
  return aas.reachability(runtime.map,reachNum)
end function
/// Set `runtime.disabled[areaNum]` to `not (enable!=0)` and `runtime.cacheInvalidations` to `runtime.cacheInvalidations+1` in `mq3.botlib.aas_runtime.enableRoutingArea`. Return paths include `wasEnabled`.
/// @param runtime AAS runtime; accesses `disabled` and `cacheInvalidations`. May update `runtime.disabled[areaNum]` and `runtime.cacheInvalidations` in place.
/// @param areaNum AAS area number; zero denotes no area.
/// @param enable Value used by `enableRoutingArea` in `if enable<0 then return wasEnabled end if`.
function enableRoutingArea(runtime,areaNum,enable)
  if not validArea(runtime,areaNum) then return 0 end if
  wasEnabled=not runtime.disabled[areaNum];if enable<0 then return wasEnabled end if
  runtime.disabled[areaNum]=not (enable!=0);if wasEnabled!=(not runtime.disabled[areaNum]) then runtime.cacheInvalidations=runtime.cacheInvalidations+1 end if;return wasEnabled
end function
/// Append a positive area number only when it is absent and the result list has remaining capacity.
/// @param values Array or byte sequence accessed at `index`.
/// @param value Value used by `appendUnique` in `if value<=0 then return values end if`.
/// @param maximum Upper bound applied by the operation.
function appendUnique(values,value,maximum)
  if value<=0 then return values end if
  if len(values)>0 then for index=0 to len(values)-1 if values[index]==value then return values end if end for end if
  if len(values)<maximum then values=values+[value] end if;return values
end function
/// Return the absolute value of the numeric argument for aas runtime.
/// @param value Operand used to evaluate the returned expression `0.0-value`.
function absValue(value) if value<0.0 then return 0.0-value end if;return value end function
/// Apply `mq3.botlib.aas_runtime.appendUnique`, `mq3.format.aas.node` and `mq3.format.aas.plane` while evaluating `bboxAreas`.
/// @param runtime AAS runtime; accesses `initialized` and `map`.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param maximum Upper bound applied by the operation.
function bboxAreas(runtime,mins,maxs,maximum)
  if runtime==void or not runtime.initialized or mins==void or maxs==void or len(mins)!=3 or len(maxs)!=3 or maximum<=0 or runtime.map.counts[aas.LUMP_NODES]<2 then return [] end if
  center=[(mins[0]+maxs[0])*0.5,(mins[1]+maxs[1])*0.5,(mins[2]+maxs[2])*0.5];extents=[(maxs[0]-mins[0])*0.5,(maxs[1]-mins[1])*0.5,(maxs[2]-mins[2])*0.5]
  stack=[1];result=[];visits=0;limit=runtime.map.counts[aas.LUMP_NODES]*2+2
  while len(stack)>0 and len(result)<maximum and visits<limit
    nodeNum=stack[len(stack)-1];stack=arrays.slice(stack,0,len(stack)-1);visits=visits+1
    if nodeNum<0 then result=appendUnique(result,0-nodeNum,maximum)
    else if nodeNum>0 and nodeNum<runtime.map.counts[aas.LUMP_NODES] then
      node=aas.node(runtime.map,nodeNum);plane=aas.plane(runtime.map,node.planeNum)
      distance=dot(center,plane.normal)-plane.dist
      radius=absValue(extents[0]*plane.normal[0])+absValue(extents[1]*plane.normal[1])+absValue(extents[2]*plane.normal[2])
      if distance+radius>=0.0 then stack=stack+[node.children[0]] end if
      if distance-radius<=0.0 then stack=stack+[node.children[1]] end if
    end if
  end while
  return result
end function
/// Set `runtime.time` to `value` in `mq3.botlib.aas_runtime.setTime`.
/// @param runtime AAS runtime; accesses `time`. May update `runtime.time` in place.
/// @param value Operand used to evaluate the returned expression `value`.
function setTime(runtime,value) if runtime!=void then runtime.time=value end if;return value end function
/// Return the AAS runtime time, or zero when the runtime is absent.
/// @param runtime AAS runtime; accesses `time`.
function getTime(runtime) if runtime==void then return 0.0 end if;return runtime.time end function
