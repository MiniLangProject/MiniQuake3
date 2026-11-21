// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Route prediction and alternative routes from be_aas_route.c,
// be_aas_routealt.c and be_aas_sample.c.
package mq3.botlib.aas_route_extras

import mq3.format.aas as routeExtraAas
import mq3.botlib.aas_runtime as routeExtraRuntime
import mq3.botlib.aas_routing as routeExtraRouting
import mq3.botlib.aas_routing_cache as routeExtraCache
import mq3.botlib.aas_trace_areas as routeExtraTraceAreas
import mq3.compat.numeric as n
import std.array as routeExtraArrays

const OP_ALTERNATIVE_ROUTE_GOAL=575
const OP_PREDICT_ROUTE=576
const OP_POINT_REACHABILITY_AREA_INDEX=577
const ALTROUTEGOAL_ALL=1
const ALTROUTEGOAL_CLUSTERPORTALS=2
const ALTROUTEGOAL_VIEWPORTALS=4
const AREACONTENTS_CLUSTERPORTAL=8
const AREACONTENTS_VIEWPORTAL=512
const RSE_NONE=0
const RSE_NOROUTE=1
const RSE_USETRAVELTYPE=2
const RSE_ENTERCONTENTS=4
const RSE_ENTERAREA=8
const MAX_REACHABILITY_PASS_AREAS=32

struct AlternativeRouteGoal origin areaNum startTravelTime goalTravelTime extraTravelTime end struct
struct PredictRoute endPos endArea stopEvent endContents endTravelFlags numAreas time end struct
struct AlternativeRoutingState valid clusterAreas numClusterAreas initialized end struct

function copyVector(value) return [value[0],value[1],value[2]] end function
function u16(value) return value&65535 end function
function absInt(value) if value<0 then return 0-value end if;return value end function
function validRouter(router) return router!=void and router.runtime!=void and router.runtime.initialized end function
function routeTime(router,area,origin,goalArea,travelFlags) return routeExtraRouting.areaTravelTimeToGoalArea(router,area,origin,goalArea,travelFlags) end function

// The released botlib keeps these two work arrays as process globals.  The
// port keeps them in an explicit owner so map restarts retain the same
// allocation/lifetime boundary without leaking state between botlib worlds.
function initAlternativeRouting(router)
  areaCount=0;if validRouter(router) then areaCount=len(router.settings) end if
  return AlternativeRoutingState(array(areaCount,false),array(areaCount,0),0,true)
end function
function shutdownAlternativeRouting(state)
  if state==void then return void end if
  state.valid=[];state.clusterAreas=[];state.numClusterAreas=0;state.initialized=false;return void
end function
function AAS_InitAlternativeRouting(router) return initAlternativeRouting(router) end function
function AAS_ShutdownAlternativeRouting(state) return shutdownAlternativeRouting(state) end function

function altRoutingFloodCluster(router,state,areaNum)
  if state==void or not state.initialized or not validRouter(router) or areaNum<=0 or areaNum>=len(state.valid) or not state.valid[areaNum] then return void end if
  state.clusterAreas[state.numClusterAreas]=areaNum;state.numClusterAreas=state.numClusterAreas+1;state.valid[areaNum]=false
  area=routeExtraAas.area(router.runtime.map,areaNum);if area is error then return void end if
  if area.numFaces>0 then for faceOffset=0 to area.numFaces-1
    faceNumber=routeExtraAas.faceIndex(router.runtime.map,area.firstFace+faceOffset);if faceNumber is error then continue end if
    faceNumber=absInt(faceNumber);face=routeExtraAas.face(router.runtime.map,faceNumber);if face is error then continue end if
    other=face.frontArea;if other==areaNum then other=face.backArea end if
    if other>0 and other<len(state.valid) and state.valid[other] then altRoutingFloodCluster(router,state,other) end if
  end for end if
  return void
end function

function passedAreas(router,reach)
  kind=reach.travelType&routeExtraRouting.TRAVELTYPE_MASK;start=reach.start;finish=reach.finish;shouldTrace=false
  if kind==routeExtraRouting.TRAVEL_BARRIERJUMP or kind==routeExtraRouting.TRAVEL_WATERJUMP then finish=[reach.start[0],reach.start[1],reach.finish[2]];shouldTrace=true
  else if kind==routeExtraRouting.TRAVEL_WALKOFFLEDGE then start=[reach.finish[0],reach.finish[1],reach.start[2]];shouldTrace=true
  else if kind==routeExtraRouting.TRAVEL_GRAPPLEHOOK then shouldTrace=true end if
  if not shouldTrace then return [] end if
  crossed=routeExtraTraceAreas.trace(router.runtime,start,finish,MAX_REACHABILITY_PASS_AREAS);if crossed is error then return [] end if;return crossed.areas
end function

function predictRouteCached(router,cache,route,areaNum,origin,goalAreaNum,travelFlags,maxAreas,maxTime,stopEvent,stopContents,stopTfl,stopAreaNum)
  if route==void or origin==void or len(origin)!=3 or not validRouter(router) then return 0 end if
  route.stopEvent=RSE_NONE;route.endArea=goalAreaNum;route.endContents=0;route.endTravelFlags=0;route.endPos=copyVector(origin);route.time=0
  currentArea=areaNum;currentOrigin=copyVector(origin);step=0;areaCount=len(router.settings)
  while currentArea!=goalAreaNum and (maxAreas==0 or step<maxAreas) and step<areaCount
    routeChoice=void
    if cache==void then routeChoice=routeExtraRouting.areaRouteToGoalArea(router,currentArea,currentOrigin,goalAreaNum,travelFlags)
    else routeChoice=routeExtraCache.weightedQuery(cache,currentArea,currentOrigin,goalAreaNum,travelFlags,false) end if
    reachNum=routeChoice.reachNum
    if reachNum==0 or reachNum<0 or reachNum>=len(router.reaches) then route.stopEvent=RSE_NOROUTE;return 0 end if
    reach=router.reaches[reachNum];reachFlags=routeExtraRouting.travelFlagForType(reach.travelType);destinationFlags=routeExtraRouting.areaContentsTravelFlags(router,reach.areaNum)
    if (stopEvent&RSE_USETRAVELTYPE)!=0 then
      if (reachFlags&stopTfl)!=0 then route.stopEvent=RSE_USETRAVELTYPE;route.endArea=currentArea;route.endContents=router.settings[currentArea].contents;route.endTravelFlags=reachFlags;route.endPos=copyVector(reach.start);return 1 end if
      if (destinationFlags&stopTfl)!=0 then route.stopEvent=RSE_USETRAVELTYPE;route.endArea=reach.areaNum;route.endContents=router.settings[reach.areaNum].contents;route.endTravelFlags=destinationFlags;route.endPos=copyVector(reach.finish);route.time=route.time+routeExtraRouting.areaTravelTime(router,areaNum,origin,reach.start)+reach.travelTime;return 1 end if
    end if
    candidates=passedAreas(router,reach)+[reach.areaNum]
    for each testArea in candidates
      if testArea<=0 or testArea>=len(router.settings) then continue end if
      if (stopEvent&RSE_ENTERCONTENTS)!=0 and (router.settings[testArea].contents&stopContents)!=0 then route.stopEvent=RSE_ENTERCONTENTS;route.endArea=testArea;route.endContents=router.settings[testArea].contents;route.endPos=copyVector(reach.finish);route.time=route.time+routeExtraRouting.areaTravelTime(router,areaNum,origin,reach.start)+reach.travelTime;return 1 end if
      if (stopEvent&RSE_ENTERAREA)!=0 and testArea==stopAreaNum then route.stopEvent=RSE_ENTERAREA;route.endArea=testArea;route.endContents=router.settings[testArea].contents;route.endPos=copyVector(reach.start);return 1 end if
    end for
    // The released routine intentionally uses the original area/origin here.
    route.time=route.time+routeExtraRouting.areaTravelTime(router,areaNum,origin,reach.start)+reach.travelTime
    route.endArea=reach.areaNum;route.endContents=router.settings[reach.areaNum].contents;route.endTravelFlags=reachFlags;route.endPos=copyVector(reach.finish)
    currentArea=reach.areaNum;currentOrigin=copyVector(reach.finish);step=step+1
    if maxTime!=0 and route.time>maxTime then break end if
  end while
  if currentArea!=goalAreaNum then return 0 end if;return 1
end function

function predictRoute(router,route,areaNum,origin,goalAreaNum,travelFlags,maxAreas,maxTime,stopEvent,stopContents,stopTfl,stopAreaNum)
  return predictRouteCached(router,void,route,areaNum,origin,goalAreaNum,travelFlags,maxAreas,maxTime,stopEvent,stopContents,stopTfl,stopAreaNum)
end function

function connectedMidrange(router,first,valid)
  state=AlternativeRoutingState(valid,array(len(valid),0),0,true);altRoutingFloodCluster(router,state,first)
  return routeExtraArrays.slice(state.clusterAreas,0,state.numClusterAreas)
end function
function distanceSquared(a,b) x=n.fsub(a[0],b[0]);y=n.fsub(a[1],b[1]);z=n.fsub(a[2],b[2]);return n.fadd(n.fadd(n.fmul(x,x),n.fmul(y,y)),n.fmul(z,z)) end function

function alternativeRouteGoals(router,start,startAreaNum,goal,goalAreaNum,travelFlags,maximum,type)
  result=[];if not validRouter(router) or start==void or goal==void or startAreaNum==0 or goalAreaNum==0 or maximum<=0 then return result end if
  areaCount=len(router.settings);goalTime=routeTime(router,startAreaNum,start,goalAreaNum,travelFlags);valid=array(areaCount,false);startTimes=array(areaCount,0);goalTimes=array(areaCount,0)
  if areaCount>1 then for areaNum=1 to areaCount-1
    contents=router.settings[areaNum].contents
    if (type&ALTROUTEGOAL_ALL)==0 and not (((type&ALTROUTEGOAL_CLUSTERPORTALS)!=0 and (contents&AREACONTENTS_CLUSTERPORTAL)!=0) or ((type&ALTROUTEGOAL_VIEWPORTALS)!=0 and (contents&AREACONTENTS_VIEWPORTAL)!=0)) then continue end if
    if router.settings[areaNum].numReachableAreas==0 then continue end if
    fromStart=routeTime(router,startAreaNum,start,areaNum,travelFlags);if fromStart==0 or fromStart>goalTime*1.1 then continue end if
    toGoal=routeTime(router,areaNum,void,goalAreaNum,travelFlags);if toGoal==0 or toGoal>goalTime*0.8 then continue end if
    valid[areaNum]=true;startTimes[areaNum]=fromStart;goalTimes[areaNum]=toGoal
  end for end if
  if areaCount>1 then for areaNum=1 to areaCount-1
    if not valid[areaNum] then continue end if;cluster=connectedMidrange(router,areaNum,valid);if len(cluster)==0 then continue end if
    middle=[0.0,0.0,0.0];for each member in cluster area=routeExtraAas.area(router.runtime.map,member);if not (area is error) then for axis=0 to 2 middle[axis]=n.fadd(middle[axis],area.center[axis]) end for end if end for
    for axis=0 to 2 middle[axis]=n.fdiv(middle[axis],len(cluster)*1.0) end for
    best=0;bestDistance=999999999.0;for each member in cluster area=routeExtraAas.area(router.runtime.map,member);if not (area is error) then value=distanceSquared(middle,area.center);if value<bestDistance then bestDistance=value;best=member end if end if end for
    if best!=0 then area=routeExtraAas.area(router.runtime.map,best);result=result+[AlternativeRouteGoal(copyVector(area.center),best,u16(startTimes[best]),u16(goalTimes[best]),u16(startTimes[best]+goalTimes[best]-goalTime))];if len(result)>=maximum then break end if end if
  end for end if
  return result
end function

function pointReachabilityAreaIndex(state,origin)
  if state==void or not state.initialized then return 0 end if;map=state.map;clusterCount=map.counts[routeExtraAas.LUMP_CLUSTERS]
  if origin==void then total=0;if clusterCount>0 then for index=0 to clusterCount-1 value=routeExtraAas.cluster(map,index);if not (value is error) then total=total+value.numReachabilityAreas end if end for end if;return total end if
  areaNum=routeExtraRuntime.pointAreaNum(state,origin);if areaNum==0 or routeExtraRuntime.areaReachability(state,areaNum)==0 then return 0 end if;settings=routeExtraAas.areaSettings(map,areaNum);if settings is error then return 0 end if;clusterNum=settings.cluster;clusterAreaNum=settings.clusterAreaNum
  if clusterNum<0 then portalNum=0-clusterNum;portal=routeExtraAas.portal(map,portalNum);if portal is error then return 0 end if;clusterNum=portal.frontCluster;clusterAreaNum=portal.clusterAreaNums[0] end if
  if clusterNum<0 or clusterNum>=clusterCount then return 0 end if;index=0;if clusterNum>0 then for current=0 to clusterNum-1 value=routeExtraAas.cluster(map,current);if value is error then return 0 end if;index=index+value.numReachabilityAreas end for end if;return index+clusterAreaNum
end function
function supportsTrap(op) return op==OP_ALTERNATIVE_ROUTE_GOAL or op==OP_PREDICT_ROUTE or op==OP_POINT_REACHABILITY_AREA_INDEX end function
