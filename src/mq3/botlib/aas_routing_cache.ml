// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Cluster/portal-aware bounded routing cache inspired by be_aas_route.c.
package mq3.botlib.aas_routing_cache

import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_routing_tables as routingTables
import mq3.format.aas as aas
import mq3.compat.numeric as n

const CACHE_AREA=1
const CACHE_PORTAL=2
const DEFAULT_MAX_ENTRIES=4096

struct Entry type cluster areaNum goalAreaNum travelFlags hasOrigin originBits route generation serial end struct
struct Cache router entries generation serial maxEntries hits misses evictions invalidations staticTables end struct

function create(router,maxEntries)
  if maxEntries<=0 then maxEntries=DEFAULT_MAX_ENTRIES end if;generation=0;if router!=void and router.runtime!=void then generation=router.runtime.cacheInvalidations end if
  return Cache(router,[],generation,0,maxEntries,0,0,0,0,routingTables.create(router))
end function
function portalForArea(cache,areaNum)
  if cache==void or cache.router==void or areaNum<=0 or areaNum>=len(cache.router.settings) then return void end if;cluster=cache.router.settings[areaNum].cluster;if cluster>=0 then return void end if
  portalNum=0-cluster;if portalNum<0 or portalNum>=cache.router.runtime.map.counts[aas.LUMP_PORTALS] then return void end if;return aas.portal(cache.router.runtime.map,portalNum)
end function
function clusterAreaNum(cache,cluster,areaNum)
  if cache==void or areaNum<=0 or areaNum>=len(cache.router.settings) then return -1 end if;settings=cache.router.settings[areaNum]
  if settings.cluster>0 then return settings.clusterAreaNum end if;portal=portalForArea(cache,areaNum);if portal==void or portal is error then return -1 end if
  side=0;if portal.frontCluster!=cluster then side=1 end if;return portal.clusterAreaNums[side]
end function
function routeType(cache,areaNum,goalAreaNum)
  if cache==void or cache.router==void or areaNum<=0 or goalAreaNum<=0 or areaNum>=len(cache.router.settings) or goalAreaNum>=len(cache.router.settings) then return [0,0] end if
  cluster=cache.router.settings[areaNum].cluster;goalCluster=cache.router.settings[goalAreaNum].cluster
  if cluster<0 and goalCluster>0 then portal=portalForArea(cache,areaNum);if portal!=void and not (portal is error) and (portal.frontCluster==goalCluster or portal.backCluster==goalCluster) then cluster=goalCluster end if
  else if cluster>0 and goalCluster<0 then portal=portalForArea(cache,goalAreaNum);if portal!=void and not (portal is error) and (portal.frontCluster==cluster or portal.backCluster==cluster) then goalCluster=cluster end if end if
  if cluster>0 and goalCluster>0 and cluster==goalCluster then return [CACHE_AREA,cluster] end if
  if goalCluster<0 then portal=portalForArea(cache,goalAreaNum);if portal!=void and not (portal is error) then goalCluster=portal.frontCluster end if end if
  return [CACHE_PORTAL,goalCluster]
end function
function normalizedFlags(cache,areaNum,goalAreaNum,travelFlags)
  if areaNum>0 and goalAreaNum>0 and areaNum<len(cache.router.settings) and goalAreaNum<len(cache.router.settings) then
    if (cache.router.settings[areaNum].contents&routing.AREACONTENTS_DONOTENTER)!=0 or (cache.router.settings[goalAreaNum].contents&routing.AREACONTENTS_DONOTENTER)!=0 then return travelFlags|routing.TFL_DONOTENTER end if
  end if;return travelFlags
end function
function bits(origin)
  if origin==void then return [0,0,0] end if;return [n.floatBits(origin[0]),n.floatBits(origin[1]),n.floatBits(origin[2])]
end function
function sameKey(entry,type,cluster,areaNum,goalAreaNum,travelFlags,origin)
  hasOrigin=origin!=void;if entry.type!=type or entry.cluster!=cluster or entry.areaNum!=areaNum or entry.goalAreaNum!=goalAreaNum or entry.travelFlags!=travelFlags or entry.hasOrigin!=hasOrigin then return false end if
  if hasOrigin then return entry.originBits==bits(origin) end if;return true
end function
function sync(cache)
  if cache==void or cache.router==void or cache.router.runtime==void then return 0 end if;current=cache.router.runtime.cacheInvalidations
  if current!=cache.generation then cache.entries=[];cache.generation=current;cache.invalidations=cache.invalidations+1 end if;return current
end function
function removeAt(values,index)
  result=[];if len(values)>0 then for cursor=0 to len(values)-1 if cursor!=index then result=result+[values[cursor]] end if end for end if;return result
end function
function query(cache,areaNum,origin,goalAreaNum,travelFlags)
  if cache==void or cache.router==void then return routing.Route(0,0) end if;sync(cache);kind=routeType(cache,areaNum,goalAreaNum);flags=normalizedFlags(cache,areaNum,goalAreaNum,travelFlags)
  if len(cache.entries)>0 then for index=0 to len(cache.entries)-1
    entry=cache.entries[index];if sameKey(entry,kind[0],kind[1],areaNum,goalAreaNum,flags,origin) then cache.hits=cache.hits+1;cache.serial=cache.serial+1;entry.serial=cache.serial;cache.entries=removeAt(cache.entries,index)+[entry];return routing.Route(entry.route.travelTime,entry.route.reachNum) end if
  end for end if
  cache.misses=cache.misses+1;route=routing.areaRouteToGoalArea(cache.router,areaNum,origin,goalAreaNum,flags);cache.serial=cache.serial+1
  cache.entries=cache.entries+[Entry(kind[0],kind[1],areaNum,goalAreaNum,flags,origin!=void,bits(origin),routing.Route(route.travelTime,route.reachNum),cache.generation,cache.serial)]
  if len(cache.entries)>cache.maxEntries then cache.entries=removeAt(cache.entries,0);cache.evictions=cache.evictions+1 end if;return route
end function
function areaTravelTimeToGoalArea(cache,areaNum,origin,goalAreaNum,travelFlags) return query(cache,areaNum,origin,goalAreaNum,travelFlags).travelTime end function
function areaReachabilityToGoalArea(cache,areaNum,origin,goalAreaNum,travelFlags) return query(cache,areaNum,origin,goalAreaNum,travelFlags).reachNum end function
function clear(cache) if cache!=void then cache.entries=[];cache.generation=0;if cache.router!=void and cache.router.runtime!=void then cache.generation=cache.router.runtime.cacheInvalidations end if;cache.serial=0;cache.hits=0;cache.misses=0;cache.evictions=0;cache.invalidations=0 end if;return 0 end function
