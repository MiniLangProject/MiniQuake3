// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native adapter for code/botlib/be_aas_route.c.
package mq3.botlib.be_aas_route

import mq3.botlib.aas_runtime as runtimeAas
import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_routing_tables as tables
import mq3.botlib.aas_routing_cache as routeCache
import mq3.botlib.aas_route_extras as extras
import mq3.botlib.cache_lru as lru
import mq3.format.aas as aas
import mq3.compat.numeric as n

const MAX_REACHABILITY_PASS_AREAS=32

/// `Services` record for be aas route, containing `context`, `visibleFn`, `traceAreasFn` and `randomFn`.
struct Services context visibleFn traceAreasFn randomFn end struct
/// `ReachabilityAreas` record for be aas route, containing `firstArea` and `numAreas`.
struct ReachabilityAreas firstArea numAreas end struct
/// `RoutingCache` record for be aas route, containing `size`, `cluster`, `areaNum`, `travelFlags` and `travelTimes` and related fields.
struct RoutingCache size cluster areaNum travelFlags travelTimes reachabilities time linked payloadType end struct
/// `State` record for be aas route, containing `runtime`, `router`, `cache`, `staticTables` and `areaContentTravelFlags` and related fields.
struct State runtime router cache staticTables areaContentTravelFlags reachabilityAreas reachabilityAreaIndex lru initialized routingCacheSize maxRoutingCacheSize services end struct

/// Return `false` for `defaultVisible`.
/// @param context Not read by this implementation; retained in the `defaultVisible` signature.
/// @param sourceArea Not read by this implementation; retained in the `defaultVisible` signature.
/// @param destinationArea Not read by this implementation; retained in the `defaultVisible` signature.
function defaultVisible(context,sourceArea,destinationArea) return false end function
/// Return a new array `[]` for `defaultTraceAreas`.
/// @param context Not read by this implementation; retained in the `defaultTraceAreas` signature.
/// @param start Not read by this implementation; retained in the `defaultTraceAreas` signature.
/// @param finish Not read by this implementation; retained in the `defaultTraceAreas` signature.
/// @param maximum Not read by this implementation; retained in the `defaultTraceAreas` signature.
function defaultTraceAreas(context,start,finish,maximum) return [] end function
/// Return `0.0` for `defaultRandom`.
/// @param context Not read by this implementation; retained in the `defaultRandom` signature.
function defaultRandom(context) return 0.0 end function
/// Create a `mq3.botlib.be_aas_route.Services` record, initializing `context` from `context`, `visibleFn` as `defaultVisible` and `traceAreasFn` as `defaultTraceAreas`.
/// @param context Context forwarded to the configured host callbacks.
function createServices(context) return Services(context,defaultVisible,defaultTraceAreas,defaultRandom) end function
/// Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for be aas route.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function copyVector(value) return [value[0],value[1],value[2]] end function
/// Test `state!=void and state.runtime!=void and state.router!=void` as the condition for `validState`.
/// @param state Be AAS route state; accesses `runtime` and `router`.
function validState(state) return state!=void and state.runtime!=void and state.router!=void end function
/// Return a copy of the routing list without the specified element, preserving the other entries in order.
/// @param values Array or byte sequence accessed at `cursor`.
/// @param index Index of the entry to access.
function removeAt(values,index) result=[];if len(values)>0 then for cursor=0 to len(values)-1 if cursor!=index then result=result+[values[cursor]] end if end for end if;return result end function

/// Apply `mq3.botlib.aas_routing.create`, `mq3.botlib.be_aas_route.createServices` and `mq3.botlib.aas_routing_cache.create` while evaluating `create`. Return paths include `state`.
/// @param runtime AAS routing runtime; accesses `initialized` and `map`.
/// @param maxEntries Initial value stored in `mq3.botlib.be_aas_route.State.maxRoutingCacheSize`.
/// @param services Initial value stored in `mq3.botlib.be_aas_route.State.services`.
function create(runtime,maxEntries,services)
  router=routing.create(runtime);if router is error then return router end if
  if services==void then services=createServices(void) end if
  state=State(runtime,router,routeCache.create(router,maxEntries),void,[],[],[],[],false,0,maxEntries,services)
  AAS_InitRouting(state);return state
end function

/// Apply `mq3.botlib.be_aas_route.validState` while evaluating `AAS_RoutingInfo`. Return paths include `[cache.areaUpdates,cache.portalUpdates,state.routingCacheSize,cache.hits,cache.misses]`.
/// @param state Be AAS route state; accesses `cache` and `routingCacheSize`.
function AAS_RoutingInfo(state)
  if not validState(state) then return [0,0,0,0,0] end if
  cache=state.cache;return [cache.areaUpdates,cache.portalUpdates,state.routingCacheSize,cache.hits,cache.misses]
end function
/// Apply `mq3.botlib.be_aas_route.validState` and `mq3.botlib.aas_routing_cache.clusterAreaNum` while evaluating `AAS_ClusterAreaNum`. Return paths include `routeCache.clusterAreaNum(state.cache,cluster,areaNum)`.
/// @param state Be AAS route state; accesses `cache`.
/// @param cluster Value used by `clusterAreaNum` in `if settings.cluster>0 then return settings.clusterAreaNum end if`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_ClusterAreaNum(state,cluster,areaNum) if not validState(state) then return -1 end if;return routeCache.clusterAreaNum(state.cache,cluster,areaNum) end function
/// Return `20` for `AAS_InitTravelFlagFromType`.
/// @param state Not read by this implementation; retained in the `AAS_InitTravelFlagFromType` signature.
function AAS_InitTravelFlagFromType(state) return 20 end function
/// Forward `AAS_TravelFlagForType_inline` to `mq3.botlib.aas_routing.travelFlagForType` and return the delegated result.
/// @param state Not read by this implementation; retained in the `AAS_TravelFlagForType_inline` signature.
/// @param travelType AAS reachability travel-type code.
function AAS_TravelFlagForType_inline(state,travelType) return routing.travelFlagForType(travelType) end function
/// Forward `AAS_TravelFlagForType` to `mq3.botlib.be_aas_route.AAS_TravelFlagForType_inline` and return the delegated result.
/// @param state Value passed as argument 1 to `mq3.botlib.be_aas_route.AAS_TravelFlagForType_inline`.
/// @param travelType AAS reachability travel-type code.
function AAS_TravelFlagForType(state,travelType) return AAS_TravelFlagForType_inline(state,travelType) end function

/// Set `state.lru` to `removeAt(state.lru,index)` and `value.linked` to `false` in `mq3.botlib.be_aas_route.AAS_UnlinkCache`.
/// @param state Be AAS route state; accesses `lru`. May update `state.lru` in place.
/// @param value Value record; accesses `linked`. May update `value.linked` in place.
function AAS_UnlinkCache(state,value)
  if state==void or value==void or not value.linked then return false end if
  if len(state.lru)>0 then for index=0 to len(state.lru)-1 if state.lru[index]==value then state.lru=removeAt(state.lru,index);break end if end for end if
  value.linked=false;return true
end function
/// Update `state.lru`, `value.linked` and `value.time` during `AAS_LinkCache`.
/// @param state Be AAS route state; accesses `lru`. May update `state.lru` in place.
/// @param value Value record; accesses `linked` and `time`. May update `value.linked` and `value.time` in place.
function AAS_LinkCache(state,value)
  if state==void or value==void then return false end if;if value.linked then AAS_UnlinkCache(state,value) end if
  state.lru=state.lru+[value];value.linked=true;value.time=AAS_RoutingTime(state);return true
end function
/// Set `state.routingCacheSize` to `state.routingCacheSize-value.size` and `state.routingCacheSize` to `0` in `mq3.botlib.be_aas_route.AAS_FreeRoutingCache`.
/// @param state Be AAS route state; accesses `routingCacheSize`. May update `state.routingCacheSize` in place.
/// @param value Value record; accesses `size`.
function AAS_FreeRoutingCache(state,value)
  if state==void or value==void then return false end if;AAS_UnlinkCache(state,value);state.routingCacheSize=state.routingCacheSize-value.size;if state.routingCacheSize<0 then state.routingCacheSize=0 end if;return true
end function
/// Update `state.routingCacheSize` and `state.lru` during `AAS_RemoveRoutingCacheInCluster`. Return paths include `removed`.
/// @param state Be AAS route state; accesses `lru` and `routingCacheSize`. May update `state.routingCacheSize` and `state.lru` in place.
/// @param cluster Value used by `AAS_RemoveRoutingCacheInCluster` in `for each value in state.lru if value.cluster==cluster then value.linked=false`.
function AAS_RemoveRoutingCacheInCluster(state,cluster)
  if state==void then return 0 end if;kept=[];removed=0
  for each value in state.lru if value.cluster==cluster then value.linked=false;state.routingCacheSize=state.routingCacheSize-value.size;removed=removed+1 else kept=kept+[value] end if end for
  state.lru=kept;if state.routingCacheSize<0 then state.routingCacheSize=0 end if
  AAS_FreeAllClusterAreaCache(state);return removed
end function
/// Apply `mq3.botlib.be_aas_route.validState`, `mq3.botlib.be_aas_route.AAS_RemoveRoutingCacheInCluster` and `mq3.botlib.aas_routing_cache.portalForArea` while evaluating `AAS_RemoveRoutingCacheUsingArea`. Return paths include `removed`.
/// @param state Be AAS route state; accesses `router` and `cache`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_RemoveRoutingCacheUsingArea(state,areaNum)
  if not validState(state) or areaNum<=0 or areaNum>=len(state.router.settings) then return 0 end if
  cluster=state.router.settings[areaNum].cluster;removed=0
  if cluster>0 then removed=removed+AAS_RemoveRoutingCacheInCluster(state,cluster)
  else portal=routeCache.portalForArea(state.cache,areaNum);if portal!=void and not (portal is error) then removed=removed+AAS_RemoveRoutingCacheInCluster(state,portal.frontCluster);removed=removed+AAS_RemoveRoutingCacheInCluster(state,portal.backCluster) end if end if
  AAS_FreeAllPortalCache(state);return removed
end function
/// Apply `mq3.botlib.be_aas_route.validState`, `mq3.botlib.aas_runtime.enableRoutingArea` and `mq3.botlib.be_aas_route.AAS_RemoveRoutingCacheUsingArea` while evaluating `AAS_EnableRoutingArea`.
/// @param state Be AAS route state; accesses `runtime`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param enable Value used by `enableRoutingArea` in `if enable<0 then return wasEnabled end if`.
function AAS_EnableRoutingArea(state,areaNum,enable)
  if not validState(state) then return 0 end if;before=runtimeAas.enableRoutingArea(state.runtime,areaNum,-1);result=runtimeAas.enableRoutingArea(state.runtime,areaNum,enable)
  if enable>=0 and before!=(enable!=0) then AAS_RemoveRoutingCacheUsingArea(state,areaNum) end if;return result
end function
/// Apply `mq3.botlib.aas_runtime.getTime` while evaluating `AAS_RoutingTime`. Return paths include `runtimeAas.getTime(state.runtime)`.
/// @param state Be AAS route state; accesses `runtime`.
function AAS_RoutingTime(state) if state==void then return 0.0 end if;return runtimeAas.getTime(state.runtime) end function

/// Apply `mq3.botlib.be_aas_route.validState` and `mq3.botlib.aas_routing.areaContentsTravelFlags` while evaluating `AAS_GetAreaContentsTravelFlags`. Return paths include `routing.areaContentsTravelFlags(state.router,areaNum)`.
/// @param state Be AAS route state; accesses `router`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_GetAreaContentsTravelFlags(state,areaNum) if not validState(state) then return routing.TFL_INVALID end if;return routing.areaContentsTravelFlags(state.router,areaNum) end function
/// Read the precomputed area contents travel flags, returning TFL_INVALID for an invalid state or area.
/// @param state Be AAS route state; accesses `areaContentTravelFlags`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaContentsTravelFlags_inline(state,areaNum) if state==void or areaNum<0 or areaNum>=len(state.areaContentTravelFlags) then return routing.TFL_INVALID end if;return state.areaContentTravelFlags[areaNum] end function
/// Forward `AAS_AreaContentsTravelFlags` to `mq3.botlib.be_aas_route.AAS_AreaContentsTravelFlags_inline` and return the delegated result.
/// @param state Be AAS route state; accesses `areaContentTravelFlags`.
/// @param areaNum AAS area number; zero denotes no area.
function AAS_AreaContentsTravelFlags(state,areaNum) return AAS_AreaContentsTravelFlags_inline(state,areaNum) end function
/// Set `state.areaContentTravelFlags` to `array(len(state.router.settings),0)` and `state.areaContentTravelFlags[areaNum]` to `AAS_GetAreaContentsTravelFlags(state,areaNum)` in `mq3.botlib.be_aas_route.AAS_InitAreaContentsTravelFlags`. Return paths include `len(state.areaContentTravelFlags)`.
/// @param state Be AAS route state; accesses `areaContentTravelFlags` and `router`. May update `state.areaContentTravelFlags` and `state.areaContentTravelFlags[areaNum]` in place.
function AAS_InitAreaContentsTravelFlags(state)
  if not validState(state) then return 0 end if;state.areaContentTravelFlags=array(len(state.router.settings),0)
  if len(state.areaContentTravelFlags)>0 then for areaNum=0 to len(state.areaContentTravelFlags)-1 state.areaContentTravelFlags[areaNum]=AAS_GetAreaContentsTravelFlags(state,areaNum) end for end if;return len(state.areaContentTravelFlags)
end function
/// Set `state.staticTables` to `tables.create(state.router)` and `state.cache.staticTables` to `state.staticTables` in `mq3.botlib.be_aas_route.AAS_CreateReversedReachability`. Return paths include `state.staticTables.totalLinks`.
/// @param state Be AAS route state; accesses `staticTables`, `router` and `cache`. May update `state.staticTables` and `state.cache.staticTables` in place.
function AAS_CreateReversedReachability(state) if not validState(state) then return 0 end if;state.staticTables=tables.create(state.router);state.cache.staticTables=state.staticTables;return state.staticTables.totalLinks end function
/// Apply `mq3.botlib.be_aas_route.validState` and `mq3.botlib.aas_routing.areaTravelTime` while evaluating `AAS_AreaTravelTime`. Return paths include `routing.areaTravelTime(state.router,areaNum,start,finish)`.
/// @param state Be AAS route state; accesses `router`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
function AAS_AreaTravelTime(state,areaNum,start,finish) if not validState(state) then return 0 end if;return routing.areaTravelTime(state.router,areaNum,start,finish) end function
/// Apply `mq3.botlib.be_aas_route.validState` and `mq3.botlib.be_aas_route.AAS_CreateReversedReachability` while evaluating `AAS_CalculateAreaTravelTimes`. Return paths include `len(state.staticTables.areaTravelTimes)`.
/// @param state Be AAS route state; accesses `staticTables`.
function AAS_CalculateAreaTravelTimes(state) if not validState(state) then return 0 end if;if state.staticTables==void then AAS_CreateReversedReachability(state) end if;return len(state.staticTables.areaTravelTimes) end function
/// Apply `mq3.botlib.aas_routing_tables.portalMaxTravelTime` while evaluating `AAS_PortalMaxTravelTime`. Return paths include `tables.portalMaxTravelTime(state.staticTables,portalNum)`.
/// @param state Be AAS route state; accesses `staticTables`.
/// @param portalNum Operand used to evaluate the returned expression `tables.portalMaxTravelTimes[portalNum]`.
function AAS_PortalMaxTravelTime(state,portalNum) if state==void or state.staticTables==void then return 0 end if;return tables.portalMaxTravelTime(state.staticTables,portalNum) end function
/// Apply `mq3.botlib.be_aas_route.validState` and `mq3.botlib.be_aas_route.AAS_CreateReversedReachability` while evaluating `AAS_InitPortalMaxTravelTimes`. Return paths include `len(state.staticTables.portalMaxTravelTimes)`.
/// @param state Be AAS route state; accesses `staticTables`.
function AAS_InitPortalMaxTravelTimes(state) if not validState(state) then return 0 end if;if state.staticTables==void then AAS_CreateReversedReachability(state) end if;return len(state.staticTables.portalMaxTravelTimes) end function

/// Apply `mq3.botlib.be_aas_route.AAS_FreeRoutingCache` while evaluating `AAS_FreeOldestCache`.
/// @param state Be AAS route state; accesses `lru`.
function AAS_FreeOldestCache(state)
  if state==void or len(state.lru)==0 then return 0 end if;value=state.lru[0];AAS_FreeRoutingCache(state,value);return 1
end function
/// Set `state.routingCacheSize` to `state.routingCacheSize+size` in `mq3.botlib.be_aas_route.AAS_AllocRoutingCache`.
/// @param state Be AAS route state; accesses `routingCacheSize`, `maxRoutingCacheSize` and `lru`. May update `state.routingCacheSize` in place.
/// @param numTravelTimes Value passed as argument 1 to `array`.
function AAS_AllocRoutingCache(state,numTravelTimes)
  if state==void or numTravelTimes<0 then return void end if;size=48+numTravelTimes*3;value=RoutingCache(size,0,0,0,array(numTravelTimes,0),array(numTravelTimes,0),0.0,false,0);state.routingCacheSize=state.routingCacheSize+size;AAS_LinkCache(state,value)
  while state.maxRoutingCacheSize>0 and state.routingCacheSize>state.maxRoutingCacheSize and len(state.lru)>1 AAS_FreeOldestCache(state) end while;return value
end function
/// Set `state.cache.areaCaches` to `[]` in `mq3.botlib.be_aas_route.AAS_FreeAllClusterAreaCache`. Return paths include `count`.
/// @param state Be AAS route state; accesses `cache`. May update `state.cache.areaCaches` in place.
function AAS_FreeAllClusterAreaCache(state) if state==void then return 0 end if;count=len(state.cache.areaCaches);state.cache.areaCaches=[];state.cache.areaIndex.clear();lru.clear(state.cache.areaLru);routeCache.clearRouteEntries(state.cache);return count end function
/// Apply `mq3.botlib.be_aas_route.AAS_FreeAllClusterAreaCache` while evaluating `AAS_InitClusterAreaCache`. Return paths include `state.runtime.map.counts[aas.LUMP_CLUSTERS]`.
/// @param state Be AAS route state; accesses `runtime`.
function AAS_InitClusterAreaCache(state) if state==void then return 0 end if;AAS_FreeAllClusterAreaCache(state);return state.runtime.map.counts[aas.LUMP_CLUSTERS] end function
/// Set `state.cache.portalCaches` to `[]` in `mq3.botlib.be_aas_route.AAS_FreeAllPortalCache`. Return paths include `count`.
/// @param state Be AAS route state; accesses `cache`. May update `state.cache.portalCaches` in place.
function AAS_FreeAllPortalCache(state) if state==void then return 0 end if;count=len(state.cache.portalCaches);state.cache.portalCaches=[];state.cache.portalIndex.clear();lru.clear(state.cache.portalLru);routeCache.clearRouteEntries(state.cache);return count end function
/// Apply `mq3.botlib.be_aas_route.AAS_FreeAllPortalCache` while evaluating `AAS_InitPortalCache`. Return paths include `state.runtime.map.counts[aas.LUMP_AREAS]`.
/// @param state Be AAS route state; accesses `runtime`.
function AAS_InitPortalCache(state) if state==void then return 0 end if;AAS_FreeAllPortalCache(state);return state.runtime.map.counts[aas.LUMP_AREAS] end function
/// Return the combined number of AAS areas and portals required by routing updates.
/// @param state Be AAS route state; accesses `runtime`.
function AAS_InitRoutingUpdate(state) if state==void then return 0 end if;return state.runtime.map.counts[aas.LUMP_AREAS]+state.runtime.map.counts[aas.LUMP_PORTALS] end function
/// Apply `mq3.botlib.be_aas_route.validState`, `mq3.format.aas.area` and `mq3.botlib.aas_routing_cache.areaTravelTimeToGoalArea` while evaluating `AAS_CreateAllRoutingCache`. Return paths include `created`.
/// @param state Be AAS route state; accesses `router`, `runtime` and `cache`.
function AAS_CreateAllRoutingCache(state)
  if not validState(state) then return 0 end if;created=0;areaCount=len(state.router.settings)
  if areaCount>1 then for source=1 to areaCount-1 if state.router.settings[source].numReachableAreas>0 then origin=aas.area(state.runtime.map,source).center;for goal=1 to areaCount-1 if routeCache.areaTravelTimeToGoalArea(state.cache,source,origin,goal,routing.TFL_DEFAULT)>0 then created=created+1 end if end for end if end for end if;return created
end function
/// Apply `mq3.botlib.aas_routing_cache.saveRcd` while evaluating `AAS_WriteRouteCache`. Return paths include `routeCache.saveRcd(state.cache,path)`.
/// @param state Be AAS route state; accesses `cache`.
/// @param path Resource path supplied to the file or parser operation.
function AAS_WriteRouteCache(state,path) if state==void then return false end if;return routeCache.saveRcd(state.cache,path) end function
/// Apply `mq3.botlib.aas_routing_cache.decodeRcd` while evaluating `AAS_ReadCache`. Return paths include `routeCache.decodeRcd(state.cache,data)`.
/// @param state Be AAS route state; accesses `cache`.
/// @param data Array or byte sequence accessed at `offset` and `offset+1`.
function AAS_ReadCache(state,data) if state==void then return false end if;return routeCache.decodeRcd(state.cache,data) end function
/// Apply `mq3.botlib.aas_routing_cache.loadRcd` while evaluating `AAS_ReadRouteCache`. Return paths include `routeCache.loadRcd(state.cache,path)`.
/// @param state Be AAS route state; accesses `cache`.
/// @param path Resource path supplied to the file or parser operation.
function AAS_ReadRouteCache(state,path) if state==void then return false end if;return routeCache.loadRcd(state.cache,path) end function

/// Use `state.services.traceAreasFn` to perform `tracePassAreas`. Return paths include `values`.
/// @param state Be AAS route state; accesses `services`.
/// @param start Value passed as argument 2 to `state.services.traceAreasFn`.
/// @param finish Value passed as argument 3 to `state.services.traceAreasFn`.
function tracePassAreas(state,start,finish)
  if state.services==void or state.services.traceAreasFn==void then return [] end if;values=state.services.traceAreasFn(state.services.context,start,finish,MAX_REACHABILITY_PASS_AREAS);if len(values)>MAX_REACHABILITY_PASS_AREAS then result=[];for index=0 to MAX_REACHABILITY_PASS_AREAS-1 result=result+[values[index]] end for;return result end if;return values
end function
/// Update `state.reachabilityAreas` and `state.reachabilityAreaIndex` during `AAS_InitReachabilityAreas`. Return paths include `len(state.reachabilityAreaIndex)`.
/// @param state Be AAS route state; accesses `reachabilityAreas`, `reachabilityAreaIndex` and `router`. May update `state.reachabilityAreas` and `state.reachabilityAreaIndex` in place.
function AAS_InitReachabilityAreas(state)
  if not validState(state) then return 0 end if;state.reachabilityAreas=[];state.reachabilityAreaIndex=[]
  if len(state.router.reaches)>0 then for each reach in state.router.reaches values=[];kind=reach.travelType&routing.TRAVELTYPE_MASK
    if kind==routing.TRAVEL_BARRIERJUMP or kind==routing.TRAVEL_WATERJUMP then finish=copyVector(reach.start);finish[2]=reach.finish[2];values=tracePassAreas(state,reach.start,finish)
    else if kind==routing.TRAVEL_WALKOFFLEDGE then start=copyVector(reach.finish);start[2]=reach.start[2];values=tracePassAreas(state,start,reach.finish)
    else if kind==routing.TRAVEL_GRAPPLEHOOK then values=tracePassAreas(state,reach.start,reach.finish) end if
    state.reachabilityAreas=state.reachabilityAreas+[ReachabilityAreas(len(state.reachabilityAreaIndex),len(values))];state.reachabilityAreaIndex=state.reachabilityAreaIndex+values
  end for end if;return len(state.reachabilityAreaIndex)
end function
/// Set `state.initialized` to `true` in `mq3.botlib.be_aas_route.AAS_InitRouting`.
/// @param state Be AAS route state; accesses `initialized`. May update `state.initialized` in place.
function AAS_InitRouting(state)
  if not validState(state) then return false end if;AAS_InitTravelFlagFromType(state);AAS_InitAreaContentsTravelFlags(state);AAS_InitRoutingUpdate(state);AAS_CreateReversedReachability(state);AAS_InitClusterAreaCache(state);AAS_InitPortalCache(state);AAS_CalculateAreaTravelTimes(state);AAS_InitPortalMaxTravelTimes(state);AAS_InitReachabilityAreas(state);state.initialized=true;return true
end function
/// Update `state.staticTables`, `state.areaContentTravelFlags`, `state.reachabilityAreas` and `state.reachabilityAreaIndex` and related state during `AAS_FreeRoutingCaches`. Return paths include `count`.
/// @param state Be AAS route state; accesses `cache`, `lru`, `staticTables`, `areaContentTravelFlags` and `reachabilityAreas` and related fields. May update `state.staticTables`, `state.areaContentTravelFlags` and `state.reachabilityAreas` and additional fields in place.
function AAS_FreeRoutingCaches(state)
  if state==void then return 0 end if;count=state.cache.entries.len()+len(state.cache.areaCaches)+len(state.cache.portalCaches)+len(state.lru);routeCache.clear(state.cache);state.staticTables=void;state.areaContentTravelFlags=[];state.reachabilityAreas=[];state.reachabilityAreaIndex=[];state.lru=[];state.routingCacheSize=0;state.initialized=false;return count
end function
/// Apply `mq3.botlib.aas_routing_cache.buildAreaCache` while evaluating `AAS_UpdateAreaRoutingCache`. Return paths include `routeCache.buildAreaCache(state.cache,value.cluster,value.goalAreaNum,value.travelFlags)`.
/// @param state Be AAS route state; accesses `cache`.
/// @param value Value record; accesses `cluster`, `goalAreaNum` and `travelFlags`.
function AAS_UpdateAreaRoutingCache(state,value) if state==void or value==void then return void end if;return routeCache.buildAreaCache(state.cache,value.cluster,value.goalAreaNum,value.travelFlags) end function
/// Apply `mq3.botlib.aas_routing_cache.getAreaCache` while evaluating `AAS_GetAreaRoutingCache`. Return paths include `routeCache.getAreaCache(state.cache,cluster,areaNum,travelFlags)`.
/// @param state Be AAS route state; accesses `cache`.
/// @param cluster Value passed as argument 3 to `mq3.compat.numeric.writeU32`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function AAS_GetAreaRoutingCache(state,cluster,areaNum,travelFlags) if state==void then return void end if;return routeCache.getAreaCache(state.cache,cluster,areaNum,travelFlags) end function
/// Apply `mq3.botlib.aas_routing_cache.buildPortalCache` while evaluating `AAS_UpdatePortalRoutingCache`. Return paths include `routeCache.buildPortalCache(state.cache,value.cluster,value.goalAreaNum,value.travelFlags)`.
/// @param state Be AAS route state; accesses `cache`.
/// @param value Value record; accesses `cluster`, `goalAreaNum` and `travelFlags`.
function AAS_UpdatePortalRoutingCache(state,value) if state==void or value==void then return void end if;return routeCache.buildPortalCache(state.cache,value.cluster,value.goalAreaNum,value.travelFlags) end function
/// Apply `mq3.botlib.aas_routing_cache.getPortalCache` while evaluating `AAS_GetPortalRoutingCache`. Return paths include `routeCache.getPortalCache(state.cache,cluster,areaNum,travelFlags)`.
/// @param state Be AAS route state; accesses `cache`.
/// @param cluster Value passed as argument 3 to `mq3.compat.numeric.writeU32`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function AAS_GetPortalRoutingCache(state,cluster,areaNum,travelFlags) if state==void then return void end if;return routeCache.getPortalCache(state.cache,cluster,areaNum,travelFlags) end function

/// Build the `mq3.botlib.aas_routing.Route` result for `AAS_AreaRouteToGoalArea`.
/// @param state Be AAS route state; accesses `cache` and `router`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param goalAreaNum Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function AAS_AreaRouteToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags)
  if state==void then return routing.Route(0,0) end if;value=routeCache.query(state.cache,areaNum,origin,goalAreaNum,travelFlags)
  // Maps produced by early tools can contain reachability areas outside the
  // cluster table.  The released router still walks those links directly.
  if value.travelTime==0 then return routing.areaRouteToGoalArea(state.router,areaNum,origin,goalAreaNum,travelFlags) end if;return value
end function
/// Return `AAS_AreaRouteToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags).travelTime` for `AAS_AreaTravelTimeToGoalArea`.
/// @param state Be AAS route state; accesses `cache` and `router`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param goalAreaNum Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function AAS_AreaTravelTimeToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags) return AAS_AreaRouteToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags).travelTime end function
/// Return `AAS_AreaRouteToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags).reachNum` for `AAS_AreaReachabilityToGoalArea`.
/// @param state Be AAS route state; accesses `cache` and `router`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param goalAreaNum Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function AAS_AreaReachabilityToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags) return AAS_AreaRouteToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags).reachNum end function
/// Apply `mq3.botlib.aas_route_extras.predictRoute` while evaluating `AAS_PredictRoute`.
/// @param state Be AAS route state; accesses `router`.
/// @param route Route record; accesses `stopEvent`, `endArea`, `endContents`, `endTravelFlags` and `endPos` and related fields. May update `route.stopEvent`, `route.endArea` and `route.endContents` and additional fields in place.
/// @param areaNum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param goalAreaNum Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param maxAreas Value used by `predictRouteCached` in `while currentArea!=goalAreaNum and (maxAreas==0 or step<maxAreas) and step<areaCount`.
/// @param maxTime Upper limit on the route travel-time value.
/// @param stopEvent Value used by `predictRouteCached` in `route.stopEvent=RSE_NONE`.
/// @param stopContents Value used by `predictRouteCached` in `if (stopEvent&RSE_ENTERCONTENTS)!=0 and (router.settings[testArea].contents&stopContents)!=0 then route.stopEven...`.
/// @param stopTravelFlags Value used by `predictRouteCached` in `if (reachFlags&stopTfl)!=0 then route.stopEvent=RSE_USETRAVELTYPE`.
/// @param stopAreaNum Value used by `predictRouteCached` in `if (stopEvent&RSE_ENTERAREA)!=0 and testArea==stopAreaNum then route.stopEvent=RSE_ENTERAREA`.
function AAS_PredictRoute(state,route,areaNum,origin,goalAreaNum,travelFlags,maxAreas,maxTime,stopEvent,stopContents,stopTravelFlags,stopAreaNum) if state==void then return 0 end if;return extras.predictRoute(state.router,route,areaNum,origin,goalAreaNum,travelFlags,maxAreas,maxTime,stopEvent,stopContents,stopTravelFlags,stopAreaNum) end function
/// Return `false` for `AAS_BridgeWalkable`.
/// @param state Not read by this implementation; retained in the `AAS_BridgeWalkable` signature.
/// @param areaNum Not read by this implementation; retained in the `AAS_BridgeWalkable` signature.
function AAS_BridgeWalkable(state,areaNum) return false end function
/// Apply `mq3.botlib.aas_runtime.reachabilityFromNum` while evaluating `AAS_ReachabilityFromNum`. Return paths include `runtimeAas.reachabilityFromNum(state.runtime,num)`.
/// @param state Be AAS route state; accesses `runtime`.
/// @param num Index of the entry to access.
function AAS_ReachabilityFromNum(state,num) if state==void then return error(7520,"AAS route: state missing") end if;return runtimeAas.reachabilityFromNum(state.runtime,num) end function
/// Apply `mq3.botlib.aas_runtime.nextAreaReachability` while evaluating `AAS_NextAreaReachability`. Return paths include `runtimeAas.nextAreaReachability(state.runtime,areaNum,reachNum)`.
/// @param state Be AAS route state; accesses `runtime`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param reachNum Operand used to evaluate the returned expression `reachNum`.
function AAS_NextAreaReachability(state,areaNum,reachNum) if state==void then return 0 end if;return runtimeAas.nextAreaReachability(state.runtime,areaNum,reachNum) end function
/// Apply `mq3.botlib.be_aas_route.validState` while evaluating `AAS_NextModelReachability`.
/// @param state Be AAS route state; accesses `router`.
/// @param num Value used by `AAS_NextModelReachability` in `if num<=0 then num=1 else if num>=len(state.router.reaches) then return 0 else num=num+1 end if`.
/// @param modelNum Value used by `AAS_NextModelReachability` in `if kind==routing.TRAVEL_ELEVATOR and reach.faceNum==modelNum then return index end if`.
function AAS_NextModelReachability(state,num,modelNum)
  if not validState(state) then return 0 end if;if num<=0 then num=1 else if num>=len(state.router.reaches) then return 0 else num=num+1 end if
  if num<len(state.router.reaches) then for index=num to len(state.router.reaches)-1 reach=state.router.reaches[index];kind=reach.travelType&routing.TRAVELTYPE_MASK;if kind==routing.TRAVEL_ELEVATOR and reach.faceNum==modelNum then return index end if;if kind==routing.TRAVEL_FUNCBOB and (reach.faceNum&65535)==modelNum then return index end if end for end if;return 0
end function
/// Use `state.services.randomFn` to perform `randomStart`. Return paths include `n.trunc32(value*count)`.
/// @param state Be AAS route state; accesses `services`.
/// @param count Number of entries or bytes processed by this call.
function randomStart(state,count) if count<=1 then return 1 end if;value=state.services.randomFn(state.services.context);if value<0.0 then value=0.0 else if value>=1.0 then value=0.999999 end if;return n.trunc32(value*count) end function
/// Apply `mq3.botlib.be_aas_route.validState`, `mq3.botlib.aas_runtime.areaReachability` and `mq3.botlib.be_aas_route.randomStart` while evaluating `AAS_RandomGoalArea`. Return paths include `[false,0,[0.0,0.0,0.0]]`.
/// @param state Be AAS route state; accesses `runtime` and `router`.
/// @param areaNum AAS area number; zero denotes no area.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function AAS_RandomGoalArea(state,areaNum,travelFlags)
  if not validState(state) or runtimeAas.areaReachability(state.runtime,areaNum)==0 then return [false,0,[0.0,0.0,0.0]] end if;count=len(state.router.settings);candidate=randomStart(state,count)
  if count>1 then for step=0 to count-1 if candidate<=0 or candidate>=count then candidate=1 end if;if runtimeAas.areaReachability(state.runtime,candidate)!=0 then goal=aas.area(state.runtime.map,candidate);source=aas.area(state.runtime.map,areaNum);if AAS_AreaTravelTimeToGoalArea(state,areaNum,source.center,candidate,travelFlags)>0 and runtimeAas.pointAreaNum(state.runtime,goal.center)==candidate then return [true,candidate,copyVector(goal.center)] end if end if;candidate=candidate+1 end for end if;return [false,0,[0.0,0.0,0.0]]
end function
/// Use `state.services.visibleFn` to perform `AAS_AreaVisible`. Return paths include `state.services.visibleFn(state.services.context,sourceArea,destinationArea)`.
/// @param state Be AAS route state; accesses `services`.
/// @param sourceArea Value passed as argument 2 to `state.services.visibleFn`.
/// @param destinationArea Value passed as argument 3 to `state.services.visibleFn`.
function AAS_AreaVisible(state,sourceArea,destinationArea) if state==void or state.services==void or state.services.visibleFn==void then return false end if;return state.services.visibleFn(state.services.context,sourceArea,destinationArea) end function
/// Calculate the distance from a point to the infinite line through two endpoints, treating coincident endpoints as a point.
/// @param v1 Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param v2 Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param point Three-component point used by the geometric query.
function DistancePointToLine(v1,v2,point)
  direction=[n.fsub(v2[0],v1[0]),n.fsub(v2[1],v1[1]),n.fsub(v2[2],v1[2])];denominator=n.fadd(n.fadd(n.fmul(direction[0],direction[0]),n.fmul(direction[1],direction[1])),n.fmul(direction[2],direction[2]));ratio=0.0
  if denominator>0.0 then ratio=n.fdiv(n.fadd(n.fadd(n.fmul(n.fsub(point[0],v1[0]),direction[0]),n.fmul(n.fsub(point[1],v1[1]),direction[1])),n.fmul(n.fsub(point[2],v1[2]),direction[2])),denominator) end if
  projection=[n.fadd(v1[0],n.fmul(ratio,direction[0])),n.fadd(v1[1],n.fmul(ratio,direction[1])),n.fadd(v1[2],n.fmul(ratio,direction[2]))];delta=[n.fsub(point[0],projection[0]),n.fsub(point[1],projection[1]),n.fsub(point[2],projection[2])];return n.fsqrt(n.fadd(n.fadd(n.fmul(delta[0],delta[0]),n.fmul(delta[1],delta[1])),n.fmul(delta[2],delta[2])))
end function
/// Apply `mq3.botlib.be_aas_route.validState`, `mq3.botlib.be_aas_route.copyVector` and `mq3.botlib.be_aas_route.AAS_AreaVisible` while evaluating `AAS_NearestHideArea`. Return paths include `bestArea`.
/// @param state Be AAS route state; accesses `router`.
/// @param sourceNum Not read by this implementation; retained in the `AAS_NearestHideArea` signature.
/// @param origin World-space position as three coordinates.
/// @param areaNum AAS area number; zero denotes no area.
/// @param enemyNum Not read by this implementation; retained in the `AAS_NearestHideArea` signature.
/// @param enemyOrigin Three-component point used by the geometric query.
/// @param enemyAreaNum Value passed as argument 2 to `state.services.visibleFn`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
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
/// @param state Be AAS route state; accesses `router`.
/// @param start World-space position as three coordinates.
/// @param startAreaNum AAS area number; zero denotes no area.
/// @param goal Value used by `alternativeRouteGoals` in `if not validRouter(router) or start==void or goal==void or startAreaNum==0 or goalAreaNum==0 or maximum<=0 then...`.
/// @param goalAreaNum Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param maximum Upper bound applied by the operation.
/// @param type Value used by `alternativeRouteGoals` in `if (type&ALTROUTEGOAL_ALL)==0 and not (((type&ALTROUTEGOAL_CLUSTERPORTALS)!=0 and (contents&AREACONTENTS_CLUSTER...`.
function AAS_AlternativeRouteGoals(state,start,startAreaNum,goal,goalAreaNum,travelFlags,maximum,type) if state==void then return [] end if;return extras.alternativeRouteGoals(state.router,start,startAreaNum,goal,goalAreaNum,travelFlags,maximum,type) end function
