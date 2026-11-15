// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native adapter for code/botlib/be_aas_route.c.
package mq3.botlib.be_aas_route

import mq3.botlib.aas_runtime as runtimeAas
import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_routing_tables as tables
import mq3.botlib.aas_routing_cache as routeCache
import mq3.botlib.aas_route_extras as extras
import mq3.format.aas as aas
import mq3.compat.numeric as n

const MAX_REACHABILITY_PASS_AREAS=32

struct Services context visibleFn traceAreasFn randomFn end struct
struct ReachabilityAreas firstArea numAreas end struct
struct RoutingCache size cluster areaNum travelFlags travelTimes reachabilities time linked payloadType end struct
struct State runtime router cache staticTables areaContentTravelFlags reachabilityAreas reachabilityAreaIndex lru initialized routingCacheSize maxRoutingCacheSize services end struct

function defaultVisible(context,sourceArea,destinationArea) return false end function
function defaultTraceAreas(context,start,finish,maximum) return [] end function
function defaultRandom(context) return 0.0 end function
function createServices(context) return Services(context,defaultVisible,defaultTraceAreas,defaultRandom) end function
function copyVector(value) return [value[0],value[1],value[2]] end function
function validState(state) return state!=void and state.runtime!=void and state.router!=void end function
function removeAt(values,index) result=[];if len(values)>0 then for cursor=0 to len(values)-1 if cursor!=index then result=result+[values[cursor]] end if end for end if;return result end function

function create(runtime,maxEntries,services)
  router=routing.create(runtime);if router is error then return router end if
  if services==void then services=createServices(void) end if
  state=State(runtime,router,routeCache.create(router,maxEntries),void,[],[],[],[],false,0,maxEntries,services)
  AAS_InitRouting(state);return state
end function

function AAS_RoutingInfo(state)
  if not validState(state) then return [0,0,0,0,0] end if
  cache=state.cache;return [cache.areaUpdates,cache.portalUpdates,state.routingCacheSize,cache.hits,cache.misses]
end function
function AAS_ClusterAreaNum(state,cluster,areaNum) if not validState(state) then return -1 end if;return routeCache.clusterAreaNum(state.cache,cluster,areaNum) end function
function AAS_InitTravelFlagFromType(state) return 20 end function
function AAS_TravelFlagForType_inline(state,travelType) return routing.travelFlagForType(travelType) end function
function AAS_TravelFlagForType(state,travelType) return AAS_TravelFlagForType_inline(state,travelType) end function

function AAS_UnlinkCache(state,value)
  if state==void or value==void or not value.linked then return false end if
  if len(state.lru)>0 then for index=0 to len(state.lru)-1 if state.lru[index]==value then state.lru=removeAt(state.lru,index);break end if end for end if
  value.linked=false;return true
end function
function AAS_LinkCache(state,value)
  if state==void or value==void then return false end if;if value.linked then AAS_UnlinkCache(state,value) end if
  state.lru=state.lru+[value];value.linked=true;value.time=AAS_RoutingTime(state);return true
end function
function AAS_FreeRoutingCache(state,value)
  if state==void or value==void then return false end if;AAS_UnlinkCache(state,value);state.routingCacheSize=state.routingCacheSize-value.size;if state.routingCacheSize<0 then state.routingCacheSize=0 end if;return true
end function
function AAS_RemoveRoutingCacheInCluster(state,cluster)
  if state==void then return 0 end if;kept=[];removed=0
  for each value in state.lru if value.cluster==cluster then value.linked=false;state.routingCacheSize=state.routingCacheSize-value.size;removed=removed+1 else kept=kept+[value] end if end for
  state.lru=kept;if state.routingCacheSize<0 then state.routingCacheSize=0 end if
  state.cache.areaCaches=[];state.cache.entries=[];state.cache.areaIndex.clear();state.cache.routeIndex.clear();return removed
end function
function AAS_RemoveRoutingCacheUsingArea(state,areaNum)
  if not validState(state) or areaNum<=0 or areaNum>=len(state.router.settings) then return 0 end if
  cluster=state.router.settings[areaNum].cluster;removed=0
  if cluster>0 then removed=removed+AAS_RemoveRoutingCacheInCluster(state,cluster)
  else portal=routeCache.portalForArea(state.cache,areaNum);if portal!=void and not (portal is error) then removed=removed+AAS_RemoveRoutingCacheInCluster(state,portal.frontCluster);removed=removed+AAS_RemoveRoutingCacheInCluster(state,portal.backCluster) end if end if
  state.cache.portalCaches=[];state.cache.entries=[];state.cache.portalIndex.clear();state.cache.routeIndex.clear();return removed
end function
function AAS_EnableRoutingArea(state,areaNum,enable)
  if not validState(state) then return 0 end if;before=runtimeAas.enableRoutingArea(state.runtime,areaNum,-1);result=runtimeAas.enableRoutingArea(state.runtime,areaNum,enable)
  if enable>=0 and before!=(enable!=0) then AAS_RemoveRoutingCacheUsingArea(state,areaNum) end if;return result
end function
function AAS_RoutingTime(state) if state==void then return 0.0 end if;return runtimeAas.getTime(state.runtime) end function

function AAS_GetAreaContentsTravelFlags(state,areaNum) if not validState(state) then return routing.TFL_INVALID end if;return routing.areaContentsTravelFlags(state.router,areaNum) end function
function AAS_AreaContentsTravelFlags_inline(state,areaNum) if state==void or areaNum<0 or areaNum>=len(state.areaContentTravelFlags) then return routing.TFL_INVALID end if;return state.areaContentTravelFlags[areaNum] end function
function AAS_AreaContentsTravelFlags(state,areaNum) return AAS_AreaContentsTravelFlags_inline(state,areaNum) end function
function AAS_InitAreaContentsTravelFlags(state)
  if not validState(state) then return 0 end if;state.areaContentTravelFlags=array(len(state.router.settings),0)
  if len(state.areaContentTravelFlags)>0 then for areaNum=0 to len(state.areaContentTravelFlags)-1 state.areaContentTravelFlags[areaNum]=AAS_GetAreaContentsTravelFlags(state,areaNum) end for end if;return len(state.areaContentTravelFlags)
end function
function AAS_CreateReversedReachability(state) if not validState(state) then return 0 end if;state.staticTables=tables.create(state.router);state.cache.staticTables=state.staticTables;return state.staticTables.totalLinks end function
function AAS_AreaTravelTime(state,areaNum,start,finish) if not validState(state) then return 0 end if;return routing.areaTravelTime(state.router,areaNum,start,finish) end function
function AAS_CalculateAreaTravelTimes(state) if not validState(state) then return 0 end if;if state.staticTables==void then AAS_CreateReversedReachability(state) end if;return len(state.staticTables.areaTravelTimes) end function
function AAS_PortalMaxTravelTime(state,portalNum) if state==void or state.staticTables==void then return 0 end if;return tables.portalMaxTravelTime(state.staticTables,portalNum) end function
function AAS_InitPortalMaxTravelTimes(state) if not validState(state) then return 0 end if;if state.staticTables==void then AAS_CreateReversedReachability(state) end if;return len(state.staticTables.portalMaxTravelTimes) end function

function AAS_FreeOldestCache(state)
  if state==void or len(state.lru)==0 then return 0 end if;value=state.lru[0];AAS_FreeRoutingCache(state,value);return 1
end function
function AAS_AllocRoutingCache(state,numTravelTimes)
  if state==void or numTravelTimes<0 then return void end if;size=48+numTravelTimes*3;value=RoutingCache(size,0,0,0,array(numTravelTimes,0),array(numTravelTimes,0),0.0,false,0);state.routingCacheSize=state.routingCacheSize+size;AAS_LinkCache(state,value)
  while state.maxRoutingCacheSize>0 and state.routingCacheSize>state.maxRoutingCacheSize and len(state.lru)>1 AAS_FreeOldestCache(state) end while;return value
end function
function AAS_FreeAllClusterAreaCache(state) if state==void then return 0 end if;count=len(state.cache.areaCaches);state.cache.areaCaches=[];state.cache.entries=[];state.cache.areaIndex.clear();state.cache.routeIndex.clear();return count end function
function AAS_InitClusterAreaCache(state) if state==void then return 0 end if;state.cache.areaCaches=[];state.cache.areaIndex.clear();return state.runtime.map.counts[aas.LUMP_CLUSTERS] end function
function AAS_FreeAllPortalCache(state) if state==void then return 0 end if;count=len(state.cache.portalCaches);state.cache.portalCaches=[];state.cache.entries=[];state.cache.portalIndex.clear();state.cache.routeIndex.clear();return count end function
function AAS_InitPortalCache(state) if state==void then return 0 end if;state.cache.portalCaches=[];state.cache.portalIndex.clear();return state.runtime.map.counts[aas.LUMP_AREAS] end function
function AAS_InitRoutingUpdate(state) if state==void then return 0 end if;return state.runtime.map.counts[aas.LUMP_AREAS]+state.runtime.map.counts[aas.LUMP_PORTALS] end function
function AAS_CreateAllRoutingCache(state)
  if not validState(state) then return 0 end if;created=0;areaCount=len(state.router.settings)
  if areaCount>1 then for source=1 to areaCount-1 if state.router.settings[source].numReachableAreas>0 then origin=aas.area(state.runtime.map,source).center;for goal=1 to areaCount-1 if routeCache.areaTravelTimeToGoalArea(state.cache,source,origin,goal,routing.TFL_DEFAULT)>0 then created=created+1 end if end for end if end for end if;return created
end function
function AAS_WriteRouteCache(state,path) if state==void then return false end if;return routeCache.saveRcd(state.cache,path) end function
function AAS_ReadCache(state,data) if state==void then return false end if;return routeCache.decodeRcd(state.cache,data) end function
function AAS_ReadRouteCache(state,path) if state==void then return false end if;return routeCache.loadRcd(state.cache,path) end function

function tracePassAreas(state,start,finish)
  if state.services==void or state.services.traceAreasFn==void then return [] end if;values=state.services.traceAreasFn(state.services.context,start,finish,MAX_REACHABILITY_PASS_AREAS);if len(values)>MAX_REACHABILITY_PASS_AREAS then result=[];for index=0 to MAX_REACHABILITY_PASS_AREAS-1 result=result+[values[index]] end for;return result end if;return values
end function
function AAS_InitReachabilityAreas(state)
  if not validState(state) then return 0 end if;state.reachabilityAreas=[];state.reachabilityAreaIndex=[]
  if len(state.router.reaches)>0 then for each reach in state.router.reaches values=[];kind=reach.travelType&routing.TRAVELTYPE_MASK
    if kind==routing.TRAVEL_BARRIERJUMP or kind==routing.TRAVEL_WATERJUMP then finish=copyVector(reach.start);finish[2]=reach.finish[2];values=tracePassAreas(state,reach.start,finish)
    else if kind==routing.TRAVEL_WALKOFFLEDGE then start=copyVector(reach.finish);start[2]=reach.start[2];values=tracePassAreas(state,start,reach.finish)
    else if kind==routing.TRAVEL_GRAPPLEHOOK then values=tracePassAreas(state,reach.start,reach.finish) end if
    state.reachabilityAreas=state.reachabilityAreas+[ReachabilityAreas(len(state.reachabilityAreaIndex),len(values))];state.reachabilityAreaIndex=state.reachabilityAreaIndex+values
  end for end if;return len(state.reachabilityAreaIndex)
end function
function AAS_InitRouting(state)
  if not validState(state) then return false end if;AAS_InitTravelFlagFromType(state);AAS_InitAreaContentsTravelFlags(state);AAS_InitRoutingUpdate(state);AAS_CreateReversedReachability(state);AAS_InitClusterAreaCache(state);AAS_InitPortalCache(state);AAS_CalculateAreaTravelTimes(state);AAS_InitPortalMaxTravelTimes(state);AAS_InitReachabilityAreas(state);state.initialized=true;return true
end function
function AAS_FreeRoutingCaches(state)
  if state==void then return 0 end if;count=len(state.cache.entries)+len(state.cache.areaCaches)+len(state.cache.portalCaches)+len(state.lru);routeCache.clear(state.cache);state.staticTables=void;state.areaContentTravelFlags=[];state.reachabilityAreas=[];state.reachabilityAreaIndex=[];state.lru=[];state.routingCacheSize=0;state.initialized=false;return count
end function
function AAS_UpdateAreaRoutingCache(state,value) if state==void or value==void then return void end if;return routeCache.buildAreaCache(state.cache,value.cluster,value.goalAreaNum,value.travelFlags) end function
function AAS_GetAreaRoutingCache(state,cluster,areaNum,travelFlags) if state==void then return void end if;return routeCache.getAreaCache(state.cache,cluster,areaNum,travelFlags) end function
function AAS_UpdatePortalRoutingCache(state,value) if state==void or value==void then return void end if;return routeCache.buildPortalCache(state.cache,value.cluster,value.goalAreaNum,value.travelFlags) end function
function AAS_GetPortalRoutingCache(state,cluster,areaNum,travelFlags) if state==void then return void end if;return routeCache.getPortalCache(state.cache,cluster,areaNum,travelFlags) end function

function AAS_AreaRouteToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags)
  if state==void then return routing.Route(0,0) end if;value=routeCache.query(state.cache,areaNum,origin,goalAreaNum,travelFlags)
  // Maps produced by early tools can contain reachability areas outside the
  // cluster table.  The released router still walks those links directly.
  if value.travelTime==0 then return routing.areaRouteToGoalArea(state.router,areaNum,origin,goalAreaNum,travelFlags) end if;return value
end function
function AAS_AreaTravelTimeToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags) return AAS_AreaRouteToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags).travelTime end function
function AAS_AreaReachabilityToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags) return AAS_AreaRouteToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags).reachNum end function
function AAS_PredictRoute(state,route,areaNum,origin,goalAreaNum,travelFlags,maxAreas,maxTime,stopEvent,stopContents,stopTravelFlags,stopAreaNum) if state==void then return 0 end if;return extras.predictRoute(state.router,route,areaNum,origin,goalAreaNum,travelFlags,maxAreas,maxTime,stopEvent,stopContents,stopTravelFlags,stopAreaNum) end function
function AAS_BridgeWalkable(state,areaNum) return false end function
function AAS_ReachabilityFromNum(state,num) if state==void then return error(7520,"AAS route: state missing") end if;return runtimeAas.reachabilityFromNum(state.runtime,num) end function
function AAS_NextAreaReachability(state,areaNum,reachNum) if state==void then return 0 end if;return runtimeAas.nextAreaReachability(state.runtime,areaNum,reachNum) end function
function AAS_NextModelReachability(state,num,modelNum)
  if not validState(state) then return 0 end if;if num<=0 then num=1 else if num>=len(state.router.reaches) then return 0 else num=num+1 end if
  if num<len(state.router.reaches) then for index=num to len(state.router.reaches)-1 reach=state.router.reaches[index];kind=reach.travelType&routing.TRAVELTYPE_MASK;if kind==routing.TRAVEL_ELEVATOR and reach.faceNum==modelNum then return index end if;if kind==routing.TRAVEL_FUNCBOB and (reach.faceNum&65535)==modelNum then return index end if end for end if;return 0
end function
function randomStart(state,count) if count<=1 then return 1 end if;value=state.services.randomFn(state.services.context);if value<0.0 then value=0.0 else if value>=1.0 then value=0.999999 end if;return n.trunc32(value*count) end function
function AAS_RandomGoalArea(state,areaNum,travelFlags)
  if not validState(state) or runtimeAas.areaReachability(state.runtime,areaNum)==0 then return [false,0,[0.0,0.0,0.0]] end if;count=len(state.router.settings);candidate=randomStart(state,count)
  if count>1 then for step=0 to count-1 if candidate<=0 or candidate>=count then candidate=1 end if;if runtimeAas.areaReachability(state.runtime,candidate)!=0 then goal=aas.area(state.runtime.map,candidate);source=aas.area(state.runtime.map,areaNum);if AAS_AreaTravelTimeToGoalArea(state,areaNum,source.center,candidate,travelFlags)>0 and runtimeAas.pointAreaNum(state.runtime,goal.center)==candidate then return [true,candidate,copyVector(goal.center)] end if end if;candidate=candidate+1 end for end if;return [false,0,[0.0,0.0,0.0]]
end function
function AAS_AreaVisible(state,sourceArea,destinationArea) if state==void or state.services==void or state.services.visibleFn==void then return false end if;return state.services.visibleFn(state.services.context,sourceArea,destinationArea) end function
function DistancePointToLine(v1,v2,point)
  direction=[n.fsub(v2[0],v1[0]),n.fsub(v2[1],v1[1]),n.fsub(v2[2],v1[2])];denominator=n.fadd(n.fadd(n.fmul(direction[0],direction[0]),n.fmul(direction[1],direction[1])),n.fmul(direction[2],direction[2]));ratio=0.0
  if denominator>0.0 then ratio=n.fdiv(n.fadd(n.fadd(n.fmul(n.fsub(point[0],v1[0]),direction[0]),n.fmul(n.fsub(point[1],v1[1]),direction[1])),n.fmul(n.fsub(point[2],v1[2]),direction[2])),denominator) end if
  projection=[n.fadd(v1[0],n.fmul(ratio,direction[0])),n.fadd(v1[1],n.fmul(ratio,direction[1])),n.fadd(v1[2],n.fmul(ratio,direction[2]))];delta=[n.fsub(point[0],projection[0]),n.fsub(point[1],projection[1]),n.fsub(point[2],projection[2])];return n.fsqrt(n.fadd(n.fadd(n.fmul(delta[0],delta[0]),n.fmul(delta[1],delta[1])),n.fmul(delta[2],delta[2])))
end function
function AAS_NearestHideArea(state,sourceNum,origin,areaNum,enemyNum,enemyOrigin,enemyAreaNum,travelFlags)
  if not validState(state) or areaNum<=0 or areaNum>=len(state.router.settings) then return 0 end if;times=array(len(state.router.settings),0);queue=[[areaNum,copyVector(origin),0]];head=0;bestArea=0;bestTime=0;startVisible=AAS_AreaVisible(state,enemyAreaNum,areaNum)
  while head<len(queue) current=queue[head];head=head+1;currentArea=current[0];currentOrigin=current[1];currentTime=current[2];settings=state.router.settings[currentArea]
    if settings.numReachableAreas>0 then for link=settings.firstReachableArea to settings.firstReachableArea+settings.numReachableAreas-1 reach=state.router.reaches[link];nextArea=reach.areaNum
      if nextArea==enemyAreaNum or not routing.edgeAllowed(state.router,reach,travelFlags) then continue end if;travel=currentTime+AAS_AreaTravelTime(state,currentArea,currentOrigin,reach.start)+reach.travelTime;enemyDistance=DistancePointToLine(currentOrigin,reach.finish,enemyOrigin);if enemyDistance<40.0 then continue end if
      direct=[n.fsub(enemyOrigin[0],currentOrigin[0]),n.fsub(enemyOrigin[1],currentOrigin[1]),n.fsub(enemyOrigin[2],currentOrigin[2])];before=n.fsqrt(n.fadd(n.fadd(n.fmul(direct[0],direct[0]),n.fmul(direct[1],direct[1])),n.fmul(direct[2],direct[2])));endDelta=[n.fsub(enemyOrigin[0],reach.finish[0]),n.fsub(enemyOrigin[1],reach.finish[1]),n.fsub(enemyOrigin[2],reach.finish[2])];after=n.fsqrt(n.fadd(n.fadd(n.fmul(endDelta[0],endDelta[0]),n.fmul(endDelta[1],endDelta[1])),n.fmul(endDelta[2],endDelta[2])));if after<before then travel=travel+n.trunc32((before-after)*10.0) end if
      visible=AAS_AreaVisible(state,enemyAreaNum,nextArea);if not startVisible and visible then continue end if;if bestTime!=0 and travel>=bestTime then continue end if;if times[nextArea]==0 or travel<times[nextArea] then times[nextArea]=travel;if not visible then bestTime=travel;bestArea=nextArea end if;queue=queue+[[nextArea,copyVector(reach.finish),travel]] end if
    end for end if
  end while;return bestArea
end function

// be_aas_routealt.c is exposed here as the natural companion of the routing adapter.
function AAS_AlternativeRouteGoals(state,start,startAreaNum,goal,goalAreaNum,travelFlags,maximum,type) if state==void then return [] end if;return extras.alternativeRouteGoals(state.router,start,startAreaNum,goal,goalAreaNum,travelFlags,maximum,type) end function
