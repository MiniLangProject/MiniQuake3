// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native adapter for code/botlib/be_aas_sample.c.
package mq3.botlib.aas_sample
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as aasSampleRuntime
import mq3.botlib.aas_trace_areas as traceAreas
import mq3.botlib.aas_client_trace as clientTrace
import mq3.compat.numeric as n

const PRESENCE_NONE=1
const PRESENCE_NORMAL=2
const PRESENCE_CROUCH=4
const FACE_GROUND=4
const CONTENTS_WATER=32
const CONTENTS_SLIME=16
const CONTENTS_LAVA=8
const MASK_WATER=56
const MASK_SOLID_PLAYERCLIP=65537
const BBOX_NORMAL_EPSILON=0.001

struct Link id entNum areaNum allocated end struct
struct Services entityCollisionFn pointContentsFn context end struct
struct World runtime map heap links freeIds numFree areaLinked linkedEntities services retailActive actions end struct
struct Action boundary kind subject detail dispatched end struct

function create(rt)
  if rt==void or not rt.initialized then return error(7960,"AAS sample requires initialized runtime") end if
  count=rt.map.counts[aas.LUMP_AREAS];return World(rt,rt.map,[],[],[],0,array(count,void),[],Services(void,void,void),false,[])
end function
function emit(world,kind,subject,detail) event=Action("aas-sample",kind,subject,detail,not world.retailActive);world.actions=world.actions+[event];return event end function
function copy3(v) return [v[0],v[1],v[2]] end function
function sub(a,b) return [a[0]-b[0],a[1]-b[1],a[2]-b[2]] end function
function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function
function cross(a,b) return [a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]] end function
function validArea(world,areaNum) return areaNum>0 and areaNum<world.map.counts[aas.LUMP_AREAS] end function

function AAS_PresenceTypeBoundingBox(presenceType)
  if presenceType==PRESENCE_NORMAL then return [[-15.0,-15.0,-24.0],[15.0,15.0,32.0]] end if
  return [[-15.0,-15.0,-24.0],[15.0,15.0,8.0]]
end function
function AAS_InitAASLinkHeap(world,maximum)
  if maximum<0 then maximum=0 end if;world.heap=array(maximum,void);world.links=[];world.freeIds=[];for index=0 to maximum-1 world.heap[index]=Link(index,0,0,false);world.freeIds=world.freeIds+[index] end for;world.numFree=maximum;return maximum
end function
function AAS_FreeAASLinkHeap(world) world.heap=[];world.links=[];world.freeIds=[];world.numFree=0;return void end function
function AAS_AllocAASLink(world)
  if len(world.freeIds)==0 then emit(world,"heap-empty",-1,"empty aas link heap");return void end if;id=world.freeIds[0];remaining=[];if len(world.freeIds)>1 then for index=1 to len(world.freeIds)-1 remaining=remaining+[world.freeIds[index]] end for end if;world.freeIds=remaining;value=world.heap[id];value.allocated=true;value.entNum=0;value.areaNum=0;world.numFree=world.numFree-1;return value
end function
function AAS_DeAllocAASLink(world,link)
  if link==void or not link.allocated then return false end if;link.allocated=false;link.entNum=0;link.areaNum=0;world.freeIds=[link.id]+world.freeIds;world.numFree=world.numFree+1;return true
end function
function AAS_InitAASLinkedEntities(world) world.areaLinked=array(world.map.counts[aas.LUMP_AREAS],void);for index=0 to len(world.areaLinked)-1 world.areaLinked[index]=[] end for;world.linkedEntities=[];return true end function
function AAS_FreeAASLinkedEntities(world) world.areaLinked=[];world.linkedEntities=[];return void end function
function AAS_PointAreaNum(world,point) return aasSampleRuntime.pointAreaNum(world.runtime,point) end function
function AAS_PointReachabilityAreaIndex(world,origin)
  clusterCount=world.map.counts[aas.LUMP_CLUSTERS];if origin==void then total=0;for index=0 to clusterCount-1 value=aas.cluster(world.map,index);total=total+value.numReachabilityAreas end for;return total end if
  areaNum=AAS_PointAreaNum(world,origin);if not validArea(world,areaNum) then return 0 end if;settings=aas.areaSettings(world.map,areaNum);if settings.numReachableAreas==0 then return 0 end if;clusterNum=settings.cluster;areaIndex=settings.clusterAreaNum
  if clusterNum<0 then portal=aas.portal(world.map,0-clusterNum);clusterNum=portal.frontCluster;areaIndex=portal.clusterAreaNums[0] end if
  result=areaIndex;if clusterNum>0 then for index=0 to clusterNum-1 value=aas.cluster(world.map,index);result=result+value.numReachabilityAreas end for end if;return result
end function
function AAS_AreaCluster(world,areaNum) if not validArea(world,areaNum) then return 0 end if;return aas.areaSettings(world.map,areaNum).cluster end function
function AAS_AreaPresenceType(world,areaNum) if not validArea(world,areaNum) then return 0 end if;return aas.areaSettings(world.map,areaNum).presenceType end function
function AAS_PointPresenceType(world,point) return aasSampleRuntime.pointPresenceType(world.runtime,point) end function
function AAS_SwimLevel(world,point) contents=0;if world.services.pointContentsFn!=void then contents=world.services.pointContentsFn(world.services.context,point) end if;if (contents&CONTENTS_LAVA)!=0 then return 3 else if (contents&CONTENTS_SLIME)!=0 then return 2 else if (contents&CONTENTS_WATER)!=0 then return 1 end if;return 0 end function
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
function AAS_AreaEntityCollision(world,areaNum,start,finish,presenceType,passent)
  result=clientTrace.empty();result.fraction=1.0;if areaNum<0 or areaNum>=len(world.areaLinked) or world.services.entityCollisionFn==void then return result end if;bounds=AAS_PresenceTypeBoundingBox(presenceType)
  for each id in world.areaLinked[areaNum] link=world.heap[id];if not link.allocated or link.entNum==passent then continue end if;candidate=world.services.entityCollisionFn(world.services.context,link.entNum,start,bounds[0],bounds[1],finish,MASK_SOLID_PLAYERCLIP);if candidate!=void and (candidate.startsolid or candidate.fraction<result.fraction) then result=candidate end if end for;return result
end function
function AAS_TraceClientBBox(world,start,finish,presenceType,passent)
  staticTrace=clientTrace.trace(world.runtime,start,finish,presenceType);if passent<0 or world.services.entityCollisionFn==void then return staticTrace end if
  crossed=traceAreas.trace(world.runtime,start,finish,128);best=staticTrace;for each areaNum in crossed.areas candidate=AAS_AreaEntityCollision(world,areaNum,start,finish,presenceType,passent);if candidate.startsolid or candidate.fraction<best.fraction then best=candidate end if end for;return best
end function
function AAS_TraceAreas(world,start,finish,maximum) return traceAreas.trace(world.runtime,start,finish,maximum) end function
function edgeVertices(world,signedEdge)
  side=0;if signedEdge<0 then signedEdge=0-signedEdge;side=1 end if;edge=aas.edge(world.map,signedEdge);return [aas.vertex(world.map,edge[side]),aas.vertex(world.map,edge[1-side])]
end function
function AAS_InsideFace(world,faceNum,pnormal,point,epsilon)
  face=aas.face(world.map,faceNum);for offset=0 to face.numEdges-1 signedEdge=aas.edgeIndex(world.map,face.firstEdge+offset);vertices=edgeVertices(world,signedEdge);edgevec=sub(vertices[1],vertices[0]);pointvec=sub(point,vertices[0]);separation=cross(edgevec,pnormal);if dot(pointvec,separation)<0.0-epsilon then return false end if end for;return true
end function
function AAS_PointInsideFace(world,faceNum,point,epsilon) face=aas.face(world.map,faceNum);plane=aas.plane(world.map,face.planeNum);return AAS_InsideFace(world,faceNum,plane.normal,point,epsilon) end function
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
function AAS_AreaGroundFace(world,areaNum,point)
  if not validArea(world,areaNum) then return 0 end if;area=aas.area(world.map,areaNum);for offset=0 to area.numFaces-1 faceNum=aas.faceIndex(world.map,area.firstFace+offset);if faceNum<0 then faceNum=0-faceNum end if;face=aas.face(world.map,faceNum);if (face.flags&FACE_GROUND)!=0 then plane=aas.plane(world.map,face.planeNum);normal=[0.0,0.0,1.0];if plane.normal[2]<0.0 then normal=[0.0,0.0,-1.0] end if;if AAS_InsideFace(world,faceNum,normal,point,0.01) then return faceNum end if end if end for;return 0
end function
function AAS_FacePlane(world,faceNum) face=aas.face(world.map,faceNum);plane=aas.plane(world.map,face.planeNum);return [copy3(plane.normal),plane.dist] end function
function AAS_TraceEndFace(world,trace)
  if trace.startsolid or not validArea(world,trace.lastarea) then return 0 end if;area=aas.area(world.map,trace.lastarea);for offset=0 to area.numFaces-1 faceNum=aas.faceIndex(world.map,area.firstFace+offset);if faceNum<0 then faceNum=0-faceNum end if;face=aas.face(world.map,faceNum);if (face.planeNum&(~1))==(trace.planenum&(~1)) then plane=aas.plane(world.map,face.planeNum);if AAS_InsideFace(world,faceNum,plane.normal,trace.endpos,0.01) then return faceNum end if end if end for;return 0
end function
function AAS_BoxOnPlaneSide2(absmins,absmaxs,plane)
  near=[0.0,0.0,0.0];far=[0.0,0.0,0.0];for axis=0 to 2 if plane.normal[axis]<0.0 then near[axis]=absmins[axis];far[axis]=absmaxs[axis] else far[axis]=absmins[axis];near[axis]=absmaxs[axis] end if end for;dist1=dot(plane.normal,near)-plane.dist;dist2=dot(plane.normal,far)-plane.dist;sides=0;if dist1>=0.0 then sides=1 end if;if dist2<0.0 then sides=sides|2 end if;return sides
end function
function AAS_UnlinkFromAreas(world,links)
  count=0;for each id in links if id<0 or id>=len(world.heap) then continue end if;link=world.heap[id];if not link.allocated then continue end if;remaining=[];for each current in world.areaLinked[link.areaNum] if current!=id then remaining=remaining+[current] end if end for;world.areaLinked[link.areaNum]=remaining;AAS_DeAllocAASLink(world,link);count=count+1 end for;return count
end function
function AAS_AASLinkEntity(world,absmins,absmaxs,entNum)
  if len(world.areaLinked)==0 then AAS_InitAASLinkedEntities(world) end if;areas=aasSampleRuntime.bboxAreas(world.runtime,absmins,absmaxs,128);result=[]
  for each areaNum in areas duplicate=false;for each id in world.areaLinked[areaNum] if world.heap[id].allocated and world.heap[id].entNum==entNum then duplicate=true;break end if end for;if duplicate then continue end if;link=AAS_AllocAASLink(world);if link==void then break end if;link.entNum=entNum;link.areaNum=areaNum;world.areaLinked[areaNum]=[link.id]+world.areaLinked[areaNum];result=result+[link.id] end for;world.linkedEntities=world.linkedEntities+[result];return result
end function
function AAS_LinkEntityClientBBox(world,absmins,absmaxs,entNum,presenceType) bounds=AAS_PresenceTypeBoundingBox(presenceType);newmins=[absmins[0]-bounds[1][0],absmins[1]-bounds[1][1],absmins[2]-bounds[1][2]];newmaxs=[absmaxs[0]-bounds[0][0],absmaxs[1]-bounds[0][1],absmaxs[2]-bounds[0][2]];return AAS_AASLinkEntity(world,newmins,newmaxs,entNum) end function
function AAS_BBoxAreas(world,absmins,absmaxs,maximum) return aasSampleRuntime.bboxAreas(world.runtime,absmins,absmaxs,maximum) end function
function AAS_AreaInfo(world,areaNum) if not validArea(world,areaNum) then return void end if;return aasSampleRuntime.areaInfo(world.runtime,areaNum) end function
function AAS_PlaneFromNum(world,planeNum) if planeNum<0 or planeNum>=world.map.counts[aas.LUMP_PLANES] then return void end if;return aas.plane(world.map,planeNum) end function
