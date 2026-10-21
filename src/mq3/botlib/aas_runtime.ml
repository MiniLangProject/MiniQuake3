// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Runtime queries from be_aas_sample.c, be_aas_reach.c and be_aas_route.c.
package mq3.botlib.aas_runtime

import mq3.format.aas as aas
import mq3.compat.numeric as n
import std.array as arrays

const PRESENCE_NORMAL=2
const PRESENCE_CROUCH=4
const AREA_DISABLED=8

struct Runtime map initialized disabled time cacheInvalidations end struct
struct AreaInfo contents flags presenceType cluster clusterAreaNum numReachableAreas firstReachableArea mins maxs center end struct

function fail(message) return error(7520,"AAS runtime: "+message) end function
function create(map)
  if map==void then return fail("map missing") end if
  disabled=array(map.counts[aas.LUMP_AREAS],false)
  if len(disabled)>0 then for index=0 to len(disabled)-1 settings=aas.areaSettings(map,index);if settings is error then return settings end if;disabled[index]=(settings.flags&AREA_DISABLED)!=0 end for end if
  return Runtime(map,true,disabled,0.0,0)
end function
function validArea(runtime,areaNum) return runtime!=void and runtime.initialized and areaNum>0 and areaNum<runtime.map.counts[aas.LUMP_AREAS] end function
function dot(point,normal) return point[0]*normal[0]+point[1]*normal[1]+point[2]*normal[2] end function
function pointAreaNum(runtime,point)
  if runtime==void or not runtime.initialized or runtime.map.counts[aas.LUMP_NODES]<2 then return 0 end if
  if point==void or len(point)!=3 then return 0 end if
  nodeNum=1;steps=0;limit=runtime.map.counts[aas.LUMP_NODES]+1
  while nodeNum>0
    if nodeNum>=runtime.map.counts[aas.LUMP_NODES] or steps>=limit then return 0 end if
    node=aas.node(runtime.map,nodeNum);if node is error then return 0 end if
    plane=aas.plane(runtime.map,node.planeNum);if plane is error then return 0 end if
    if dot(point,plane.normal)-plane.dist>0.0 then nodeNum=node.children[0] else nodeNum=node.children[1] end if
    steps=steps+1
  end while
  if nodeNum==0 then return 0 end if
  areaNum=0-nodeNum;if areaNum<=0 or areaNum>=runtime.map.counts[aas.LUMP_AREAS] then return 0 end if;return areaNum
end function
function pointPresenceType(runtime,point)
  areaNum=pointAreaNum(runtime,point);if areaNum==0 then return 0 end if;settings=aas.areaSettings(runtime.map,areaNum);if settings is error then return 0 end if;return settings.presenceType
end function
function presenceTypeBoundingBox(presenceType)
  if presenceType==PRESENCE_NORMAL then return [[-15.0,-15.0,-24.0],[15.0,15.0,32.0]] end if
  if presenceType==PRESENCE_CROUCH then return [[-15.0,-15.0,-24.0],[15.0,15.0,8.0]] end if
  return fail("unknown presence type")
end function
function areaInfo(runtime,areaNum)
  if not validArea(runtime,areaNum) then return fail("area outside map") end if
  area=aas.area(runtime.map,areaNum);if area is error then return area end if;settings=aas.areaSettings(runtime.map,areaNum);if settings is error then return settings end if
  flags=settings.flags;if runtime.disabled[areaNum] then flags=flags|AREA_DISABLED else flags=flags&(~AREA_DISABLED) end if
  return AreaInfo(settings.contents,flags,settings.presenceType,settings.cluster,settings.clusterAreaNum,settings.numReachableAreas,settings.firstReachableArea,[area.mins[0],area.mins[1],area.mins[2]],[area.maxs[0],area.maxs[1],area.maxs[2]],[area.center[0],area.center[1],area.center[2]])
end function
function areaReachability(runtime,areaNum)
  if not validArea(runtime,areaNum) then return 0 end if;settings=aas.areaSettings(runtime.map,areaNum);if settings is error then return 0 end if;return settings.numReachableAreas
end function
function vectorSubtract(a,b) return [a[0]-b[0],a[1]-b[1],a[2]-b[2]] end function
function vectorCross(a,b) return [a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]] end function
function vectorLength(value) return n.fsqrt(value[0]*value[0]+value[1]*value[1]+value[2]*value[2]) end function
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
function nextAreaReachability(runtime,areaNum,reachNum)
  if not validArea(runtime,areaNum) then return 0 end if;settings=aas.areaSettings(runtime.map,areaNum);if settings is error then return 0 end if
  if reachNum==0 then return settings.firstReachableArea end if
  if reachNum<settings.firstReachableArea then return 0 end if
  reachNum=reachNum+1;if reachNum>=settings.firstReachableArea+settings.numReachableAreas then return 0 end if;return reachNum
end function
function reachabilityFromNum(runtime,reachNum)
  if runtime==void or not runtime.initialized or reachNum<0 or reachNum>=runtime.map.counts[aas.LUMP_REACHABILITY] then return fail("reachability outside map") end if
  return aas.reachability(runtime.map,reachNum)
end function
function enableRoutingArea(runtime,areaNum,enable)
  if not validArea(runtime,areaNum) then return 0 end if
  wasEnabled=not runtime.disabled[areaNum];if enable<0 then return wasEnabled end if
  runtime.disabled[areaNum]=not (enable!=0);if wasEnabled!=(not runtime.disabled[areaNum]) then runtime.cacheInvalidations=runtime.cacheInvalidations+1 end if;return wasEnabled
end function
function appendUnique(values,value,maximum)
  if value<=0 then return values end if
  if len(values)>0 then for index=0 to len(values)-1 if values[index]==value then return values end if end for end if
  if len(values)<maximum then values=values+[value] end if;return values
end function
function absValue(value) if value<0.0 then return 0.0-value end if;return value end function
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
function setTime(runtime,value) if runtime!=void then runtime.time=value end if;return value end function
function getTime(runtime) if runtime==void then return 0.0 end if;return runtime.time end function
