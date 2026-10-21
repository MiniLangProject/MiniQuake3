// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Cluster/portal-aware bounded routing cache inspired by be_aas_route.c.
package mq3.botlib.aas_routing_cache

import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_routing_tables as routingTables
import mq3.format.aas as aas
import mq3.compat.numeric as n
import std.fs as fs

const CACHE_AREA=1
const CACHE_PORTAL=2
const DEFAULT_MAX_ENTRIES=4096
const RCD_IDENT=0x4352454d
const RCD_VERSION=2
const RCD_HEADER_SIZE=32
const RCD_PAYLOAD_IDENT=0x4d4c5243
const RCD_PAYLOAD_VERSION=1
const RCD_RECORD_HEADER_SIZE=24

struct Entry type cluster areaNum goalAreaNum travelFlags hasOrigin originBits route generation serial end struct
struct AreaCache cluster goalAreaNum travelFlags travelTimes reachabilities generation serial end struct
struct PortalCache cluster goalAreaNum travelFlags travelTimes reachabilities generation serial end struct
struct Cache router entries areaCaches portalCaches generation serial maxEntries hits misses evictions invalidations areaHits areaMisses areaUpdates areaEvictions portalHits portalMisses portalUpdates portalEvictions staticTables end struct

function create(router,maxEntries)
  if maxEntries<=0 then maxEntries=DEFAULT_MAX_ENTRIES end if;generation=0;if router!=void and router.runtime!=void then generation=router.runtime.cacheInvalidations end if
  return Cache(router,[],[],[],generation,0,maxEntries,0,0,0,0,0,0,0,0,0,0,0,0,routingTables.create(router))
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
  if current!=cache.generation then cache.entries=[];cache.areaCaches=[];cache.portalCaches=[];cache.generation=current;cache.invalidations=cache.invalidations+1 end if;return current
end function
function removeAt(values,index)
  result=[];if len(values)>0 then for cursor=0 to len(values)-1 if cursor!=index then result=result+[values[cursor]] end if end for end if;return result
end function
function sameAreaCache(value,cluster,goalAreaNum,travelFlags,generation) return value.cluster==cluster and value.goalAreaNum==goalAreaNum and value.travelFlags==travelFlags and value.generation==generation end function
function buildAreaCache(cache,cluster,goalAreaNum,travelFlags)
  if cache==void or cache.router==void or cluster<=0 then return void end if
  clusterValue=aas.cluster(cache.router.runtime.map,cluster);if clusterValue is error then return void end if;count=clusterValue.numReachabilityAreas
  times=array(count,0);reachabilities=array(count,0);areaCount=len(cache.router.settings);queued=array(areaCount,false);queue=[];queueTimes=array(areaCount,0);queueOutgoing=array(areaCount,-1)
  goalIndex=clusterAreaNum(cache,cluster,goalAreaNum);if goalIndex<0 or goalIndex>=count then return AreaCache(cluster,goalAreaNum,travelFlags,times,reachabilities,cache.generation,cache.serial) end if
  times[goalIndex]=1;queue=[goalAreaNum];queued[goalAreaNum]=true;queueTimes[goalAreaNum]=1;head=0
  while head<len(queue)
    currentArea=queue[head];head=head+1;queued[currentArea]=false;currentTime=queueTimes[currentArea];outgoingOffset=queueOutgoing[currentArea];incoming=routingTables.incoming(cache.staticTables,currentArea)
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
              if not queued[sourceArea] then queue=queue+[sourceArea];queued[sourceArea]=true end if
            end if
          end if
        end if
      end if
    end for end if
  end while
  cache.areaUpdates=cache.areaUpdates+1;return AreaCache(cluster,goalAreaNum,travelFlags,times,reachabilities,cache.generation,cache.serial)
end function
function getAreaCache(cache,cluster,goalAreaNum,travelFlags)
  if len(cache.areaCaches)>0 then for index=0 to len(cache.areaCaches)-1
    value=cache.areaCaches[index]
    if sameAreaCache(value,cluster,goalAreaNum,travelFlags,cache.generation) then cache.areaHits=cache.areaHits+1;cache.serial=cache.serial+1;value.serial=cache.serial;cache.areaCaches=removeAt(cache.areaCaches,index)+[value];return value end if
  end for end if
  cache.areaMisses=cache.areaMisses+1;cache.serial=cache.serial+1;value=buildAreaCache(cache,cluster,goalAreaNum,travelFlags);if value==void then return void end if;value.serial=cache.serial;cache.areaCaches=cache.areaCaches+[value]
  if len(cache.areaCaches)>cache.maxEntries then cache.areaCaches=removeAt(cache.areaCaches,0);cache.areaEvictions=cache.areaEvictions+1 end if;return value
end function
function samePortalCache(value,cluster,goalAreaNum,travelFlags,generation) return value.cluster==cluster and value.goalAreaNum==goalAreaNum and value.travelFlags==travelFlags and value.generation==generation end function
function buildPortalCache(cache,cluster,goalAreaNum,travelFlags)
  if cache==void or cache.router==void or cluster<=0 or goalAreaNum<=0 or goalAreaNum>=len(cache.router.settings) then return void end if
  portalCount=cache.router.runtime.map.counts[aas.LUMP_PORTALS];times=array(portalCount,0);reachabilities=array(portalCount,0)
  goalCluster=cache.router.settings[goalAreaNum].cluster
  if goalCluster<0 then goalPortal=0-goalCluster;if goalPortal>=0 and goalPortal<portalCount then times[goalPortal]=1 end if end if
  queue=[[cluster,goalAreaNum,1]];queued=array(portalCount,false);head=0
  while head<len(queue)
    update=queue[head];head=head+1;currentCluster=update[0];currentArea=update[1];currentTime=update[2]
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
                replacement=[nextCluster,portal.areaNum,nextTime]
                if queued[portalNum] then
                  replaced=false;if head<len(queue) then for queueIndex=head to len(queue)-1 if queue[queueIndex][1]==portal.areaNum then queue[queueIndex]=replacement;replaced=true end if end for end if
                  if not replaced then queue=queue+[replacement] end if
                else queue=queue+[replacement];queued[portalNum]=true end if
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
  if len(cache.portalCaches)>0 then for index=0 to len(cache.portalCaches)-1
    value=cache.portalCaches[index]
    if samePortalCache(value,cluster,goalAreaNum,travelFlags,cache.generation) then cache.portalHits=cache.portalHits+1;cache.serial=cache.serial+1;value.serial=cache.serial;cache.portalCaches=removeAt(cache.portalCaches,index)+[value];return value end if
  end for end if
  cache.portalMisses=cache.portalMisses+1;cache.serial=cache.serial+1;value=buildPortalCache(cache,cluster,goalAreaNum,travelFlags);if value==void then return void end if;value.serial=cache.serial;cache.portalCaches=cache.portalCaches+[value]
  if len(cache.portalCaches)>cache.maxEntries then cache.portalCaches=removeAt(cache.portalCaches,0);cache.portalEvictions=cache.portalEvictions+1 end if;return value
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
function query(cache,areaNum,origin,goalAreaNum,travelFlags)
  if cache==void or cache.router==void then return routing.Route(0,0) end if
  if areaNum<=0 or goalAreaNum<=0 or areaNum>=len(cache.router.settings) or goalAreaNum>=len(cache.router.settings) then return routing.Route(0,0) end if
  if origin!=void and len(origin)!=3 then return routing.Route(0,0) end if
  if areaNum==goalAreaNum and areaNum>0 and areaNum<len(cache.router.settings) then return routing.Route(1,0) end if
  sync(cache);kind=routeType(cache,areaNum,goalAreaNum);flags=normalizedFlags(cache,areaNum,goalAreaNum,travelFlags)
  if len(cache.entries)>0 then for index=0 to len(cache.entries)-1
    entry=cache.entries[index];if sameKey(entry,kind[0],kind[1],areaNum,goalAreaNum,flags,origin) then cache.hits=cache.hits+1;cache.serial=cache.serial+1;entry.serial=cache.serial;cache.entries=removeAt(cache.entries,index)+[entry];return routing.Route(entry.route.travelTime,entry.route.reachNum) end if
  end for end if
  cache.misses=cache.misses+1;route=routing.Route(0,0)
  if kind[0]==CACHE_AREA then route=propagatedRoute(cache,kind[1],areaNum,origin,goalAreaNum,flags) else route=propagatedPortalRoute(cache,kind[1],areaNum,origin,goalAreaNum,flags) end if
  // A cache miss must never change the route selected by the weighted router.
  // The original FIFO propagation can retain a later equal-cluster branch on
  // dense retail graphs; keep its reusable area/portal tables, but cache the
  // authoritative route whenever the two results differ.
  if kind[0]==CACHE_AREA then
    direct=routing.areaRouteToGoalArea(cache.router,areaNum,origin,goalAreaNum,flags)
    if route.travelTime!=direct.travelTime or route.reachNum!=direct.reachNum then route=direct end if
  end if;cache.serial=cache.serial+1
  cache.entries=cache.entries+[Entry(kind[0],kind[1],areaNum,goalAreaNum,flags,origin!=void,bits(origin),routing.Route(route.travelTime,route.reachNum),cache.generation,cache.serial)]
  if len(cache.entries)>cache.maxEntries then cache.entries=removeAt(cache.entries,0);cache.evictions=cache.evictions+1 end if;return route
end function
function areaTravelTimeToGoalArea(cache,areaNum,origin,goalAreaNum,travelFlags) return query(cache,areaNum,origin,goalAreaNum,travelFlags).travelTime end function
function areaReachabilityToGoalArea(cache,areaNum,origin,goalAreaNum,travelFlags) return query(cache,areaNum,origin,goalAreaNum,travelFlags).reachNum end function
function clear(cache) if cache!=void then cache.entries=[];cache.areaCaches=[];cache.portalCaches=[];cache.generation=0;if cache.router!=void and cache.router.runtime!=void then cache.generation=cache.router.runtime.cacheInvalidations end if;cache.serial=0;cache.hits=0;cache.misses=0;cache.evictions=0;cache.invalidations=0;cache.areaHits=0;cache.areaMisses=0;cache.areaUpdates=0;cache.areaEvictions=0;cache.portalHits=0;cache.portalMisses=0;cache.portalUpdates=0;cache.portalEvictions=0 end if;return 0 end function

// AAS_WriteRouteCache writes a stable 32-byte RCD v2 header.  The original
// payload embeds native pointers, so MiniQuake3 follows that header with a
// versioned pointer-free representation of the same routing arrays.
function crc16Span(data,offset,count)
  crc=65535
  if count>0 then for index=0 to count-1
    crc=crc^((data[offset+index]&255)<<8)
    for bit=0 to 7 if (crc&0x8000)!=0 then crc=((crc<<1)^0x1021)&0xffff else crc=(crc<<1)&0xffff end if end for
  end for end if
  return crc
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
  portalCount=n.readI32(data,24);areaCount=n.readI32(data,28);if portalCount<0 or areaCount<0 or portalCount+areaCount>cache.maxEntries*2 then return false end if
  offset=40;portals=[];areas=[];generation=cache.router.runtime.cacheInvalidations;serial=cache.serial
  if portalCount>0 then for index=0 to portalCount-1 serial=serial+1;decoded=try(decodeRecord(cache,data,offset,0,generation,serial));if decoded is error then return false end if;portals=portals+[decoded[0]];offset=decoded[1] end for end if
  if areaCount>0 then for index=0 to areaCount-1 serial=serial+1;decoded=try(decodeRecord(cache,data,offset,1,generation,serial));if decoded is error then return false end if;areas=areas+[decoded[0]];offset=decoded[1] end for end if
  if offset!=len(data) then return false end if
  cache.entries=[];cache.portalCaches=portals;cache.areaCaches=areas;cache.generation=generation;cache.serial=serial;return true
end function
function saveRcd(cache,path) data=encodeRcd(cache);if data is error then return false end if;result=try(fs.writeAllBytes(path,data));if result is error then return false end if;return result==true end function
function loadRcd(cache,path) data=try(fs.readAllBytes(path));if data is error then return false end if;return decodeRcd(cache,data) end function
