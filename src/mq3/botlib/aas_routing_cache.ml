// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Cluster/portal-aware bounded routing cache inspired by be_aas_route.c.
package mq3.botlib.aas_routing_cache

import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_routing_tables as routingTables
import mq3.format.aas as aas
import mq3.compat.numeric as n
import mq3.botlib.crc16 as crc16
import std.fs as fs
import std.ds.hashmap as maps
import std.ds.queue as queues
import std.ds.list as lists
import mq3.botlib.cache_lru as lru

const CACHE_AREA=1
const CACHE_PORTAL=2
const DEFAULT_MAX_ENTRIES=4096
const RCD_IDENT=0x4352454d
const RCD_VERSION=2
const RCD_HEADER_SIZE=32
const RCD_PAYLOAD_IDENT=0x4d4c5243
const RCD_PAYLOAD_VERSION=1
const RCD_RECORD_HEADER_SIZE=24

struct ItemQuery cache area origin flags times enterTimes end struct
struct Entry type cluster areaNum goalAreaNum travelFlags hasOrigin originBits route generation serial end struct
struct AreaCache cluster goalAreaNum travelFlags travelTimes reachabilities generation serial end struct
struct PortalCache cluster goalAreaNum travelFlags travelTimes reachabilities generation serial end struct
struct Cache router entries areaCaches portalCaches generation serial maxEntries hits misses evictions invalidations areaHits areaMisses areaUpdates areaEvictions portalHits portalMisses portalUpdates portalEvictions staticTables routeIndex areaIndex portalIndex scratch scratchBuilds routeLru areaLru portalLru destinationLru destinationCosts weightedBuilds weightedFallbacks end struct

function create(router,maxEntries)
  if maxEntries<=0 then maxEntries=DEFAULT_MAX_ENTRIES end if;generation=0;if router!=void and router.runtime!=void then generation=router.runtime.cacheInvalidations end if
  destinationCapacity=16
  if router!=void and len(router.reaches)>65536 then destinationCapacity=4 end if
  return Cache(router,lists.List.withCapacity(maxEntries),[],[],generation,0,maxEntries,0,0,0,0,0,0,0,0,0,0,0,0,routingTables.create(router),maps.HashMap.withCapacity(maxEntries*2),maps.HashMap.withCapacity(maxEntries),maps.HashMap.withCapacity(maxEntries),void,0,lru.create(maxEntries),lru.create(maxEntries),lru.create(maxEntries),lru.create(destinationCapacity),array(destinationCapacity,void),0,0)
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
function routeKey(type,cluster,areaNum,goalAreaNum,travelFlags,hasOrigin,originBits)
  key=bytes(36,0);n.writeU32(key,0,type);n.writeU32(key,4,cluster);n.writeU32(key,8,areaNum);n.writeU32(key,12,goalAreaNum);n.writeU32(key,16,travelFlags)
  if hasOrigin then n.writeU32(key,20,1);n.writeU32(key,24,originBits[0]);n.writeU32(key,28,originBits[1]);n.writeU32(key,32,originBits[2]) end if
  return key
end function
function tableKey(cluster,goalAreaNum,travelFlags)
  key=bytes(12,0);n.writeU32(key,0,cluster);n.writeU32(key,4,goalAreaNum);n.writeU32(key,8,travelFlags);return key
end function
function sync(cache)
  if cache==void or cache.router==void or cache.router.runtime==void then return 0 end if;current=cache.router.runtime.cacheInvalidations
  if current!=cache.generation then clearRouteEntries(cache);cache.areaCaches=[];cache.portalCaches=[];cache.areaIndex.clear();cache.portalIndex.clear();resetLru(cache);cache.generation=current;cache.invalidations=cache.invalidations+1 end if;return current
end function
function clearRouteEntries(cache)
  cache.entries.clear()
  cache.routeIndex.clear()
  lru.clear(cache.routeLru)
  lru.clear(cache.destinationLru)
  for slot=0 to len(cache.destinationCosts)-1 cache.destinationCosts[slot]=void end for
  return void
end function
// Area and portal builders have separate scratch space: portal propagation
// calls getAreaCache recursively and must not overwrite its own queue.
struct PortalUpdate cluster area time end struct
struct Scratch areaQueue areaQueued areaTimes areaOutgoing portalQueue portalQueued portalUpdates end struct
function scratchFor(cache)
  areas=len(cache.router.settings);portals=cache.router.runtime.map.counts[aas.LUMP_PORTALS]
  value=cache.scratch
  if value==void or len(value.areaQueued)!=areas or len(value.portalQueued)!=portals then
    value=Scratch(queues.Queue.withCapacity(areas),array(areas,false),array(areas,0),array(areas,-1),queues.Queue.withCapacity(portals+1),array(portals,false),array(portals,void))
    cache.scratch=value;cache.scratchBuilds=cache.scratchBuilds+1
  end if
  return value
end function
function resetLru(cache)
  lru.clear(cache.routeLru);lru.clear(cache.areaLru);lru.clear(cache.portalLru);return void
end function
function buildAreaCache(cache,cluster,goalAreaNum,travelFlags)
  if cache==void or cache.router==void or cluster<=0 then return void end if
  clusterValue=aas.cluster(cache.router.runtime.map,cluster);if clusterValue is error then return void end if;count=clusterValue.numReachabilityAreas
  times=array(count,0);reachabilities=array(count,0);areaCount=len(cache.router.settings);scratch=scratchFor(cache);queued=scratch.areaQueued;queue=scratch.areaQueue;queue.clear();queueTimes=scratch.areaTimes;queueOutgoing=scratch.areaOutgoing
  if areaCount>0 then for index=0 to areaCount-1 queued[index]=false end for end if
  goalIndex=clusterAreaNum(cache,cluster,goalAreaNum);if goalIndex<0 or goalIndex>=count then return AreaCache(cluster,goalAreaNum,travelFlags,times,reachabilities,cache.generation,cache.serial) end if
  times[goalIndex]=1;queue.enqueue(goalAreaNum);queued[goalAreaNum]=true;queueTimes[goalAreaNum]=1;queueOutgoing[goalAreaNum]=-1
  while not queue.isEmpty()
    currentArea=queue.dequeue();queued[currentArea]=false;currentTime=queueTimes[currentArea];outgoingOffset=queueOutgoing[currentArea];incoming=routingTables.incoming(cache.staticTables,currentArea)
    if len(incoming)>0 then for incomingIndex=0 to len(incoming)-1
      reverse=incoming[incomingIndex];linkNum=reverse.linkNum;reach=cache.router.reaches[linkNum]
      if routing.edgeAllowed(cache.router,reach,travelFlags) then
        sourceArea=reverse.areaNum;sourceCluster=cache.router.settings[sourceArea].cluster
        if sourceCluster<=0 or sourceCluster==cluster then
          sourceIndex=clusterAreaNum(cache,cluster,sourceArea)
          if sourceIndex>=0 and sourceIndex<count then
            through=0;if outgoingOffset>=0 then through=routingTables.areaTravelTime(cache.staticTables,currentArea,outgoingOffset,incomingIndex) end if
            candidate=(currentTime+through+reach.travelTime)&0xffff
            if candidate!=0 and (times[sourceIndex]==0 or candidate<times[sourceIndex]) then
              times[sourceIndex]=candidate;reachabilities[sourceIndex]=linkNum-cache.router.settings[sourceArea].firstReachableArea;queueTimes[sourceArea]=candidate;queueOutgoing[sourceArea]=reachabilities[sourceIndex]
              if not queued[sourceArea] then queue.enqueue(sourceArea);queued[sourceArea]=true end if
            end if
          end if
        end if
      end if
    end for end if
  end while
  cache.areaUpdates=cache.areaUpdates+1;return AreaCache(cluster,goalAreaNum,travelFlags,times,reachabilities,cache.generation,cache.serial)
end function
function getAreaCache(cache,cluster,goalAreaNum,travelFlags)
  key=tableKey(cluster,goalAreaNum,travelFlags);value=cache.areaIndex.get(key)
  if value!=void then cache.areaHits=cache.areaHits+1;cache.serial=cache.serial+1;value.serial=cache.serial;lru.touch(cache.areaLru,key);return value end if
  cache.areaMisses=cache.areaMisses+1;cache.serial=cache.serial+1;value=buildAreaCache(cache,cluster,goalAreaNum,travelFlags);if value==void then return void end if;value.serial=cache.serial
  slot=lru.reserve(cache.areaLru,key)
  if slot==len(cache.areaCaches) then cache.areaCaches=cache.areaCaches+[value]
  else old=cache.areaCaches[slot];cache.areaIndex.remove(tableKey(old.cluster,old.goalAreaNum,old.travelFlags));cache.areaCaches[slot]=value;cache.areaEvictions=cache.areaEvictions+1 end if
  cache.areaIndex.set(key,value);return value
end function
function buildPortalCache(cache,cluster,goalAreaNum,travelFlags)
  if cache==void or cache.router==void or cluster<=0 or goalAreaNum<=0 or goalAreaNum>=len(cache.router.settings) then return void end if
  portalCount=cache.router.runtime.map.counts[aas.LUMP_PORTALS];times=array(portalCount,0);reachabilities=array(portalCount,0)
  goalCluster=cache.router.settings[goalAreaNum].cluster
  if goalCluster<0 then goalPortal=0-goalCluster;if goalPortal>=0 and goalPortal<portalCount then times[goalPortal]=1 end if end if
  scratch=scratchFor(cache);queue=scratch.portalQueue;queue.clear();queued=scratch.portalQueued
  if portalCount>0 then for index=0 to portalCount-1 queued[index]=false end for end if
  queue.enqueue(PortalUpdate(cluster,goalAreaNum,1))
  while not queue.isEmpty()
    update=queue.dequeue();currentCluster=update.cluster;currentArea=update.area;currentTime=update.time
    if currentArea>0 and currentArea<len(cache.router.settings) then currentPortal=0-cache.router.settings[currentArea].cluster;if currentPortal>0 and currentPortal<portalCount then queued[currentPortal]=false end if end if
    clusterValue=aas.cluster(cache.router.runtime.map,currentCluster)
    if not (clusterValue is error) then
      areaCache=getAreaCache(cache,currentCluster,currentArea,travelFlags)
      if areaCache!=void and clusterValue.numPortals>0 then for offset=0 to clusterValue.numPortals-1
        portalNum=aas.portalIndex(cache.router.runtime.map,clusterValue.firstPortal+offset)
        if not (portalNum is error) and portalNum>=0 and portalNum<portalCount then
          portal=aas.portal(cache.router.runtime.map,portalNum)
          if not (portal is error) and portal.areaNum!=currentArea then
            areaIndex=clusterAreaNum(cache,currentCluster,portal.areaNum)
            if areaIndex>=0 and areaIndex<clusterValue.numReachabilityAreas and areaIndex<len(areaCache.travelTimes) and areaCache.travelTimes[areaIndex]!=0 then
              candidate=(areaCache.travelTimes[areaIndex]+currentTime)&0xffff
              if candidate!=0 and (times[portalNum]==0 or times[portalNum]>candidate) then
                times[portalNum]=candidate;nextCluster=portal.frontCluster;if nextCluster==currentCluster then nextCluster=portal.backCluster end if
                nextTime=(candidate+routingTables.portalMaxTravelTime(cache.staticTables,portalNum))&0xffff
                // Mutate the already-queued record in place. FIFO position and
                // original replacement semantics stay unchanged, without a scan.
                replacement=scratch.portalUpdates[portalNum]
                if replacement==void then replacement=PortalUpdate(nextCluster,portal.areaNum,nextTime);scratch.portalUpdates[portalNum]=replacement end if
                replacement.cluster=nextCluster;replacement.area=portal.areaNum;replacement.time=nextTime
                if not queued[portalNum] then queue.enqueue(replacement);queued[portalNum]=true end if
              end if
            end if
          end if
        end if
      end for end if
    end if
  end while
  cache.portalUpdates=cache.portalUpdates+1;return PortalCache(cluster,goalAreaNum,travelFlags,times,reachabilities,cache.generation,cache.serial)
end function
function getPortalCache(cache,cluster,goalAreaNum,travelFlags)
  key=tableKey(cluster,goalAreaNum,travelFlags);value=cache.portalIndex.get(key)
  if value!=void then cache.portalHits=cache.portalHits+1;cache.serial=cache.serial+1;value.serial=cache.serial;lru.touch(cache.portalLru,key);return value end if
  cache.portalMisses=cache.portalMisses+1;cache.serial=cache.serial+1;value=buildPortalCache(cache,cluster,goalAreaNum,travelFlags);if value==void then return void end if;value.serial=cache.serial
  slot=lru.reserve(cache.portalLru,key)
  if slot==len(cache.portalCaches) then cache.portalCaches=cache.portalCaches+[value]
  else old=cache.portalCaches[slot];cache.portalIndex.remove(tableKey(old.cluster,old.goalAreaNum,old.travelFlags));cache.portalCaches[slot]=value;cache.portalEvictions=cache.portalEvictions+1 end if
  cache.portalIndex.set(key,value);return value
end function
function propagatedRoute(cache,cluster,areaNum,origin,goalAreaNum,travelFlags)
  noRoute=routing.Route(0,0);value=getAreaCache(cache,cluster,goalAreaNum,travelFlags);if value==void then return noRoute end if;areaIndex=clusterAreaNum(cache,cluster,areaNum)
  if areaIndex<0 or areaIndex>=len(value.travelTimes) or value.travelTimes[areaIndex]==0 then return noRoute end if
  reachNum=cache.router.settings[areaNum].firstReachableArea+value.reachabilities[areaIndex];travelTime=value.travelTimes[areaIndex]
  if origin!=void then if len(origin)!=3 or reachNum<0 or reachNum>=len(cache.router.reaches) then return noRoute end if;travelTime=travelTime+routing.areaTravelTime(cache.router,areaNum,origin,cache.router.reaches[reachNum].start) end if
  return routing.Route(travelTime,reachNum)
end function
function propagatedPortalRoute(cache,goalCluster,areaNum,origin,goalAreaNum,travelFlags)
  noRoute=routing.Route(0,0);portalCache=getPortalCache(cache,goalCluster,goalAreaNum,travelFlags);if portalCache==void then return noRoute end if
  sourceCluster=cache.router.settings[areaNum].cluster
  if sourceCluster<0 then portalNum=0-sourceCluster;if portalNum<0 or portalNum>=len(portalCache.travelTimes) or portalCache.travelTimes[portalNum]==0 then return noRoute end if;return routing.Route(portalCache.travelTimes[portalNum],cache.router.settings[areaNum].firstReachableArea+portalCache.reachabilities[portalNum]) end if
  if sourceCluster<=0 then return noRoute end if;clusterValue=aas.cluster(cache.router.runtime.map,sourceCluster);if clusterValue is error then return noRoute end if
  sourceIndex=clusterAreaNum(cache,sourceCluster,areaNum);if sourceIndex<0 or sourceIndex>=clusterValue.numReachabilityAreas then return noRoute end if;bestTime=0;bestReach=-1
  if clusterValue.numPortals>0 then for offset=0 to clusterValue.numPortals-1
    portalNum=aas.portalIndex(cache.router.runtime.map,clusterValue.firstPortal+offset)
    if not (portalNum is error) and portalNum>=0 and portalNum<len(portalCache.travelTimes) and portalCache.travelTimes[portalNum]!=0 then
      portal=aas.portal(cache.router.runtime.map,portalNum)
      if not (portal is error) then areaCache=getAreaCache(cache,sourceCluster,portal.areaNum,travelFlags)
        if areaCache!=void and sourceIndex<len(areaCache.travelTimes) and areaCache.travelTimes[sourceIndex]!=0 then
          reachNum=cache.router.settings[areaNum].firstReachableArea+areaCache.reachabilities[sourceIndex]
          candidate=(portalCache.travelTimes[portalNum]+areaCache.travelTimes[sourceIndex]+routingTables.portalMaxTravelTime(cache.staticTables,portalNum))&0xffff
          if origin!=void then if len(origin)!=3 or reachNum<0 or reachNum>=len(cache.router.reaches) then return noRoute end if;candidate=(candidate+routing.areaTravelTime(cache.router,areaNum,origin,cache.router.reaches[reachNum].start))&0xffff end if
          if candidate!=0 and (bestTime==0 or candidate<bestTime) then bestTime=candidate;bestReach=reachNum end if
        end if
      end if
    end if
  end for end if
  if bestReach<0 then return noRoute end if;return routing.Route(bestTime,bestReach)
end function
// Store the cost of the route after each incoming reach. Travel between
// reaches depends on their endpoints, so a cache of costs per area loses
// information. Origin travel is added only when choosing the first reach.
function buildDestinationCosts(cache,goalAreaNum,travelFlags)
  router=cache.router;tables=cache.staticTables
  costs=array(len(router.reaches),0)
  heap=routing.heapCreate(len(router.reaches))
  for each link in tables.reversed[goalAreaNum]
    if not routing.edgeAllowed(router,router.reaches[link.linkNum],travelFlags) then continue end if
    costs[link.linkNum]=1
    routing.heapPut(heap,link.linkNum,1,link.linkNum)
  end for
  while heap.size>0
    current=routing.heapPop(heap)
    number=current[1];source=tables.reachSources[number]
    if source==0 then continue end if
    reach=router.reaches[number]
    row=tables.areaTravelTimes[source][number-router.settings[source].firstReachableArea]
    predecessors=tables.reversed[source]
    if len(predecessors)==0 then continue end if
    for index=0 to len(predecessors)-1
      incoming=predecessors[index].linkNum
      if not routing.edgeAllowed(router,router.reaches[incoming],travelFlags) then continue end if
      cost=current[0]+reach.travelTime+row[index]
      if costs[incoming]==0 or cost<costs[incoming] then
        costs[incoming]=cost
        routing.heapPut(heap,incoming,cost,incoming)
      end if
    end for
  end while
  cache.weightedBuilds=cache.weightedBuilds+1
  return costs
end function
function weightedRoute(cache,areaNum,origin,goalAreaNum,travelFlags,timeOnly)
  router=cache.router
  if cache.staticTables.truncatedSources==0 then
    key=tableKey(0,goalAreaNum,travelFlags)
    slot=lru.touch(cache.destinationLru,key)
    if slot<0 then
      slot=lru.reserve(cache.destinationLru,key)
      cache.destinationCosts[slot]=buildDestinationCosts(cache,goalAreaNum,travelFlags)
    end if
    costs=cache.destinationCosts[slot]
    settings=router.settings[areaNum]
    if settings.numReachableAreas==0 then return routing.Route(0,0) end if
    best=0;bestTime=0;tied=false
    for number=settings.firstReachableArea to settings.firstReachableArea+settings.numReachableAreas-1
      if costs[number]==0 then continue end if
      reach=router.reaches[number]
      cost=costs[number]+reach.travelTime
      if origin!=void then cost=cost+routing.areaTravelTime(router,areaNum,origin,reach.start) end if
      if best==0 or cost<bestTime then
        best=number;bestTime=cost;tied=false
      else if cost==bestTime then tied=true end if
    end for
    if not tied or timeOnly then return routing.Route(bestTime,best) end if
  end if
  // On an equal total the forward search's stable reach ordering decides
  // which route to use. Preserve its choice and cache the resulting point.
  cache.weightedFallbacks=cache.weightedFallbacks+1
  return routing.areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags)
end function
function query(cache,areaNum,origin,goalAreaNum,travelFlags)
  if cache==void or cache.router==void then return routing.Route(0,0) end if
  if areaNum<=0 or goalAreaNum<=0 or areaNum>=len(cache.router.settings) or goalAreaNum>=len(cache.router.settings) then return routing.Route(0,0) end if
  if origin!=void and len(origin)!=3 then return routing.Route(0,0) end if
  if areaNum==goalAreaNum and areaNum>0 and areaNum<len(cache.router.settings) then return routing.Route(1,0) end if
  sync(cache);kind=routeType(cache,areaNum,goalAreaNum);flags=normalizedFlags(cache,areaNum,goalAreaNum,travelFlags)
  originBits=bits(origin);key=routeKey(kind[0],kind[1],areaNum,goalAreaNum,flags,origin!=void,originBits);entry=cache.routeIndex.get(key)
  if entry!=void then cache.hits=cache.hits+1;cache.serial=cache.serial+1;entry.serial=cache.serial;lru.touch(cache.routeLru,key);return routing.Route(entry.route.travelTime,entry.route.reachNum) end if
  cache.misses=cache.misses+1;route=routing.Route(0,0)
  if kind[0]==CACHE_AREA then route=propagatedRoute(cache,kind[1],areaNum,origin,goalAreaNum,flags) else route=propagatedPortalRoute(cache,kind[1],areaNum,origin,goalAreaNum,flags) end if
  // A cache miss must never change the route selected by the weighted router.
  // The original FIFO propagation can retain a later equal-cluster branch on
  // dense retail graphs; keep its reusable area/portal tables, but cache the
  // authoritative route whenever the two results differ.
  if kind[0]==CACHE_AREA then
    direct=weightedRoute(cache,areaNum,origin,goalAreaNum,flags,false)
    if route.travelTime!=direct.travelTime or route.reachNum!=direct.reachNum then route=direct end if
  end if;cache.serial=cache.serial+1
  entry=Entry(kind[0],kind[1],areaNum,goalAreaNum,flags,origin!=void,originBits,routing.Route(route.travelTime,route.reachNum),cache.generation,cache.serial)
  slot=lru.reserve(cache.routeLru,key)
  if slot==cache.entries.len() then cache.entries.add(entry)
  else old=cache.entries.get(slot);cache.routeIndex.remove(routeKey(old.type,old.cluster,old.areaNum,old.goalAreaNum,old.travelFlags,old.hasOrigin,old.originBits));cache.entries.set(slot,entry);cache.evictions=cache.evictions+1 end if
  cache.routeIndex.set(key,entry);return route
end function
function areaTravelTimeToGoalArea(cache,areaNum,origin,goalAreaNum,travelFlags) return query(cache,areaNum,origin,goalAreaNum,travelFlags).travelTime end function
function areaReachabilityToGoalArea(cache,areaNum,origin,goalAreaNum,travelFlags) return query(cache,areaNum,origin,goalAreaNum,travelFlags).reachNum end function
function weightedQuery(cache,areaNum,origin,goalAreaNum,travelFlags,timeOnly)
  if cache==void or cache.router==void or areaNum<=0 or goalAreaNum<=0 or areaNum>=len(cache.router.settings) or goalAreaNum>=len(cache.router.settings) then return routing.Route(0,0) end if
  if areaNum==goalAreaNum then return routing.Route(1,0) end if
  if origin!=void and len(origin)!=3 then return routing.Route(0,0) end if
  sync(cache)
  flags=normalizedFlags(cache,areaNum,goalAreaNum,travelFlags)
  return weightedRoute(cache,areaNum,origin,goalAreaNum,flags,timeOnly)
end function
function weightedTravelTime(cache,areaNum,origin,goalAreaNum,travelFlags)
  return weightedQuery(cache,areaNum,origin,goalAreaNum,travelFlags,true).travelTime
end function
function itemTravelTime(cache,areaNum,origin,goalAreaNum,travelFlags)
  if origin!=void and len(origin)!=3 then return 0 end if
  // Within a cluster query() always resolves to the weighted result. Item
  // scoring needs its time only, so no propagated table or tie-breaking
  // forward search is needed. Portal routes keep their existing semantics.
  if routeType(cache,areaNum,goalAreaNum)[0]==CACHE_AREA then return weightedTravelTime(cache,areaNum,origin,goalAreaNum,travelFlags) end if
  return areaTravelTimeToGoalArea(cache,areaNum,origin,goalAreaNum,travelFlags)
end function
function itemQuery(cache,area,origin,flags)
  if cache==void then return void end if
  sync(cache)
  return ItemQuery(cache,area,origin,flags,void,void)
end function
function itemQueryTravelTime(query,goal)
  cache=query.cache;area=query.area
  if routeType(cache,area,goal)[0]!=CACHE_AREA then return areaTravelTimeToGoalArea(cache,area,query.origin,goal,query.flags) end if
  if area==goal then return 1 end if
  flags=normalizedFlags(cache,area,goal,query.flags)
  // Prefer an already cached destination. For cold destinations within one
  // BotChooseLTGItem invocation, search the graph once in the forward direction.
  if lru.touch(cache.destinationLru,tableKey(0,goal,flags))>=0 then return weightedRoute(cache,area,query.origin,goal,flags,true).travelTime end if
  if flags==query.flags then
    if query.times==void then query.times=routing.travelTimesFromArea(cache.router,area,query.origin,flags) end if
    if query.times!=void then return query.times[goal] end if
  else
    if query.enterTimes==void then query.enterTimes=routing.travelTimesFromArea(cache.router,area,query.origin,flags) end if
    if query.enterTimes!=void then return query.enterTimes[goal] end if
  end if
  return 0
end function
function clear(cache) if cache!=void then clearRouteEntries(cache);cache.areaCaches=[];cache.portalCaches=[];cache.areaIndex.clear();cache.portalIndex.clear();resetLru(cache);cache.generation=0;if cache.router!=void and cache.router.runtime!=void then cache.generation=cache.router.runtime.cacheInvalidations end if;cache.serial=0;cache.hits=0;cache.misses=0;cache.evictions=0;cache.invalidations=0;cache.areaHits=0;cache.areaMisses=0;cache.areaUpdates=0;cache.areaEvictions=0;cache.portalHits=0;cache.portalMisses=0;cache.portalUpdates=0;cache.portalEvictions=0;cache.weightedBuilds=0;cache.weightedFallbacks=0 end if;return 0 end function

// AAS_WriteRouteCache writes a stable 32-byte RCD v2 header.  The original
// payload embeds native pointers, so MiniQuake3 follows that header with a
// versioned pointer-free representation of the same routing arrays.
function crc16Span(data,offset,count)
  return crc16.processSpan(data,offset,count)
end function
function mapCrc(cache,lump)
  if cache==void or cache.router==void or cache.router.runtime==void or cache.router.runtime.map==void then return -1 end if
  map=cache.router.runtime.map;return crc16Span(map.data,map.offsets[lump],map.lengths[lump])
end function
function putU16(data,offset,value) data[offset]=value&255;data[offset+1]=(value>>8)&255;return void end function
function getU16(data,offset) return data[offset]|(data[offset+1]<<8) end function
function recordSize(value) return RCD_RECORD_HEADER_SIZE+len(value.travelTimes)*3 end function
function writeRecord(data,offset,type,value)
  count=len(value.travelTimes);size=recordSize(value);n.writeU32(data,offset,size);n.writeU32(data,offset+4,type);n.writeU32(data,offset+8,value.cluster);n.writeU32(data,offset+12,value.goalAreaNum);n.writeU32(data,offset+16,value.travelFlags);n.writeU32(data,offset+20,count)
  for index=0 to count-1 putU16(data,offset+RCD_RECORD_HEADER_SIZE+index*2,value.travelTimes[index]);data[offset+RCD_RECORD_HEADER_SIZE+count*2+index]=value.reachabilities[index]&255 end for
  return offset+size
end function
function encodeRcd(cache)
  if cache==void or cache.router==void or cache.router.runtime==void then return error(7544,"RCD: routing cache is not attached") end if
  sync(cache);total=RCD_HEADER_SIZE+8
  for each value in cache.portalCaches if len(value.travelTimes)!=len(value.reachabilities) then return error(7544,"RCD: portal array size mismatch") end if;total=total+recordSize(value) end for
  for each value in cache.areaCaches if len(value.travelTimes)!=len(value.reachabilities) then return error(7544,"RCD: area array size mismatch") end if;total=total+recordSize(value) end for
  map=cache.router.runtime.map;data=bytes(total,0);n.writeU32(data,0,RCD_IDENT);n.writeU32(data,4,RCD_VERSION);n.writeU32(data,8,map.counts[aas.LUMP_AREAS]);n.writeU32(data,12,map.counts[aas.LUMP_CLUSTERS]);n.writeU32(data,16,mapCrc(cache,aas.LUMP_AREAS));n.writeU32(data,20,mapCrc(cache,aas.LUMP_CLUSTERS));n.writeU32(data,24,len(cache.portalCaches));n.writeU32(data,28,len(cache.areaCaches));n.writeU32(data,32,RCD_PAYLOAD_IDENT);n.writeU32(data,36,RCD_PAYLOAD_VERSION);offset=40
  for each value in cache.portalCaches offset=writeRecord(data,offset,0,value) end for
  for each value in cache.areaCaches offset=writeRecord(data,offset,1,value) end for
  return data
end function
function decodeRecord(cache,data,offset,expectedType,generation,serial)
  if offset<0 or offset+RCD_RECORD_HEADER_SIZE>len(data) then return error(7544,"RCD: truncated cache record") end if
  size=n.readI32(data,offset);type=n.readI32(data,offset+4);cluster=n.readI32(data,offset+8);goal=n.readI32(data,offset+12);flags=n.readI32(data,offset+16);count=n.readI32(data,offset+20)
  if size<RCD_RECORD_HEADER_SIZE or count<0 or size!=RCD_RECORD_HEADER_SIZE+count*3 or offset+size>len(data) or type!=expectedType then return error(7544,"RCD: invalid cache record") end if
  if cluster<=0 or cluster>=cache.router.runtime.map.counts[aas.LUMP_CLUSTERS] or goal<=0 or goal>=cache.router.runtime.map.counts[aas.LUMP_AREAS] then return error(7544,"RCD: cache key outside map") end if
  expected=0;if type==0 then expected=cache.router.runtime.map.counts[aas.LUMP_PORTALS] else clusterValue=aas.cluster(cache.router.runtime.map,cluster);if clusterValue is error then return clusterValue end if;expected=clusterValue.numReachabilityAreas end if
  if count!=expected then return error(7544,"RCD: routing array count mismatch") end if
  times=array(count,0);reaches=array(count,0);for index=0 to count-1 times[index]=getU16(data,offset+RCD_RECORD_HEADER_SIZE+index*2);reaches[index]=data[offset+RCD_RECORD_HEADER_SIZE+count*2+index] end for
  value=void;if type==0 then value=PortalCache(cluster,goal,flags,times,reaches,generation,serial) else value=AreaCache(cluster,goal,flags,times,reaches,generation,serial) end if
  return [value,offset+size]
end function
function decodeRcd(cache,data)
  if cache==void or cache.router==void or cache.router.runtime==void or data==void or typeof(data)!="bytes" or len(data)<40 then return false end if
  map=cache.router.runtime.map
  if n.readU32(data,0)!=RCD_IDENT or n.readI32(data,4)!=RCD_VERSION or n.readI32(data,8)!=map.counts[aas.LUMP_AREAS] or n.readI32(data,12)!=map.counts[aas.LUMP_CLUSTERS] then return false end if
  if n.readI32(data,16)!=mapCrc(cache,aas.LUMP_AREAS) or n.readI32(data,20)!=mapCrc(cache,aas.LUMP_CLUSTERS) or n.readU32(data,32)!=RCD_PAYLOAD_IDENT or n.readI32(data,36)!=RCD_PAYLOAD_VERSION then return false end if
  portalCount=n.readI32(data,24);areaCount=n.readI32(data,28);if portalCount<0 or areaCount<0 or portalCount>cache.maxEntries or areaCount>cache.maxEntries then return false end if
  offset=40;portals=[];areas=[];generation=cache.router.runtime.cacheInvalidations;serial=cache.serial
  if portalCount>0 then for index=0 to portalCount-1 serial=serial+1;decoded=try(decodeRecord(cache,data,offset,0,generation,serial));if decoded is error then return false end if;portals=portals+[decoded[0]];offset=decoded[1] end for end if
  if areaCount>0 then for index=0 to areaCount-1 serial=serial+1;decoded=try(decodeRecord(cache,data,offset,1,generation,serial));if decoded is error then return false end if;areas=areas+[decoded[0]];offset=decoded[1] end for end if
  if offset!=len(data) then return false end if
  // Validate unique keys before committing any state; malformed RCD input
  // must neither exceed per-cache capacity nor leave inconsistent LRU slots.
  seenPortals=maps.HashMap.withCapacity(cache.maxEntries);seenAreas=maps.HashMap.withCapacity(cache.maxEntries)
  for each value in portals key=tableKey(value.cluster,value.goalAreaNum,value.travelFlags);if seenPortals.get(key)!=void then return false end if;seenPortals.set(key,true) end for
  for each value in areas key=tableKey(value.cluster,value.goalAreaNum,value.travelFlags);if seenAreas.get(key)!=void then return false end if;seenAreas.set(key,true) end for
  clearRouteEntries(cache);cache.portalIndex.clear();cache.areaIndex.clear();resetLru(cache);cache.portalCaches=portals;cache.areaCaches=areas
  for each value in portals key=tableKey(value.cluster,value.goalAreaNum,value.travelFlags);cache.portalIndex.set(key,value);lru.reserve(cache.portalLru,key) end for
  for each value in areas key=tableKey(value.cluster,value.goalAreaNum,value.travelFlags);cache.areaIndex.set(key,value);lru.reserve(cache.areaLru,key) end for
  cache.generation=generation;cache.serial=serial;return true
end function
function saveRcd(cache,path) data=encodeRcd(cache);if data is error then return false end if;result=try(fs.writeAllBytes(path,data));if result is error then return false end if;return result==true end function
function loadRcd(cache,path) data=try(fs.readAllBytes(path));if data is error then return false end if;return decodeRcd(cache,data) end function
