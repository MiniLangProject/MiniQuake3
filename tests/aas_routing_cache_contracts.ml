import mq3.botlib.aas_routing_cache as cache
import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_runtime as runtime
import mq3.format.aas as aas
import mq3.compat.numeric as numeric
import std.fs as fs

function require(ok,label) if not ok then return error(7539,"AAS routing cache: "+label) end if;return 1 end function
function main(args)
  if len(args)!=2 then return 2 end if;map=aas.load(fs.readAllBytes(args[0]));if map is error then return map end if;state=runtime.create(map);router=routing.create(state);store=cache.create(router,2);checks=0
  checks=checks+require(cache.clusterAreaNum(store,1,1)==0 and cache.clusterAreaNum(store,1,2)==1 and cache.clusterAreaNum(store,2,2)==0,"normal and two-sided portal cluster indices")
  checks=checks+require(cache.routeType(store,3,4)==[cache.CACHE_AREA,2] and cache.routeType(store,1,4)==[cache.CACHE_PORTAL,2],"same-cluster and cross-portal classification")
  checks=checks+require(cache.routeType(store,2,4)==[cache.CACHE_AREA,2] and cache.routeType(store,1,2)==[cache.CACHE_AREA,1],"portal endpoint adopts adjacent cluster")
  origin=[0.0,0.0,0.0];first=cache.query(store,1,origin,4,routing.TFL_DEFAULT);checks=checks+require(first.travelTime>0 and first.reachNum==1 and store.misses==1 and store.hits==0,"first query computes weighted route")
  second=cache.query(store,1,origin,4,routing.TFL_DEFAULT);checks=checks+require(second.travelTime==first.travelTime and second.reachNum==first.reachNum and store.hits==1 and store.misses==1,"identical query hits cache")
  cache.query(store,1,void,4,routing.TFL_DEFAULT);checks=checks+require(store.misses==2 and len(store.entries)==2,"null origin has distinct original correction semantics")
  cache.query(store,3,[0.0,0.0,0.0],4,routing.TFL_DEFAULT);checks=checks+require(store.evictions==1 and len(store.entries)==2,"bounded LRU evicts oldest entry")
  cache.query(store,1,origin,4,routing.TFL_DEFAULT);checks=checks+require(store.misses==4 and store.evictions==2,"recent hit protected newer entry from eviction")
  before=state.cacheInvalidations;runtime.enableRoutingArea(state,2,0);blocked=cache.query(store,1,origin,4,routing.TFL_DEFAULT);checks=checks+require(state.cacheInvalidations==before+1 and store.invalidations==1 and blocked.travelTime==0 and len(store.entries)==1,"routing-area change invalidates cached paths")
  runtime.enableRoutingArea(state,2,1);restored=cache.query(store,1,origin,4,routing.TFL_DEFAULT);checks=checks+require(restored.travelTime==first.travelTime and store.invalidations==2,"re-enable rebuilds route generation")
  cache.clear(store);checks=checks+require(len(store.entries)==0 and len(store.areaCaches)==0 and len(store.portalCaches)==0 and store.hits==0 and store.misses==0 and store.evictions==0 and store.portalUpdates==0,"explicit cache reset")
  sameGoalA=cache.query(store,3,[0.0,0.0,0.0],4,routing.TFL_DEFAULT);sameGoalB=cache.query(store,3,[10.0,0.0,0.0],4,routing.TFL_DEFAULT);directA=routing.areaRouteToGoalArea(router,3,[0.0,0.0,0.0],4,routing.TFL_DEFAULT);directB=routing.areaRouteToGoalArea(router,3,[10.0,0.0,0.0],4,routing.TFL_DEFAULT)
  checks=checks+require(sameGoalA.travelTime==directA.travelTime and sameGoalA.reachNum==directA.reachNum and sameGoalB.travelTime==directB.travelTime and sameGoalB.reachNum==directB.reachNum,"goal-centric propagation preserves weighted same-cluster routes")
  checks=checks+require(store.areaMisses==1 and store.areaHits==1 and store.areaUpdates==1 and len(store.areaCaches)==1,"different origins share one original-style area propagation")
  goalRoute=cache.query(store,4,[0.0,0.0,0.0],4,routing.TFL_DEFAULT);checks=checks+require(goalRoute.travelTime==1 and goalRoute.reachNum==0,"goal area keeps original immediate route result")
  invalid=cache.query(store,99,void,4,routing.TFL_DEFAULT);checks=checks+require(invalid.travelTime==0 and invalid.reachNum==0,"invalid area is rejected before portal lookup")
  chainMap=aas.load(fs.readAllBytes(args[1]));if chainMap is error then return chainMap end if;chainState=runtime.create(chainMap);chainRouter=routing.create(chainState);chain=cache.create(chainRouter,8)
  portalValue=cache.getPortalCache(chain,3,6,routing.TFL_DEFAULT);checks=checks+require(portalValue.travelTimes[1]==14 and portalValue.travelTimes[2]==7,"two-portal propagation matches original accumulated cluster times")
  cache.getPortalCache(chain,3,6,routing.TFL_DEFAULT);checks=checks+require(chain.portalMisses==1 and chain.portalHits==1 and chain.portalUpdates==1 and len(chain.portalCaches)==1,"goal-centered portal propagation is cached once")
  cross=cache.query(chain,1,void,6,routing.TFL_DEFAULT);checks=checks+require(cross.travelTime==18 and cross.reachNum==1,"cross-cluster query composes portal, area, and portal-maximum times")
  corrected=cache.query(chain,1,[0.0,0.0,0.0],6,routing.TFL_DEFAULT);checks=checks+require(corrected.travelTime==19 and corrected.reachNum==1 and chain.portalUpdates==1,"origin correction reuses the portal graph cache")
  remotePortal=cache.query(chain,2,void,6,routing.TFL_DEFAULT);checks=checks+require(remotePortal.travelTime==14 and remotePortal.reachNum==2,"remote source portal reads its propagated time directly")
  generation=chainState.cacheInvalidations;runtime.enableRoutingArea(chainState,4,0);blocked=cache.query(chain,1,void,6,routing.TFL_DEFAULT);checks=checks+require(chainState.cacheInvalidations==generation+1 and chain.invalidations==1 and blocked.travelTime==0 and chain.portalUpdates==2,"routing-area disable invalidates and rebuilds portal propagation")
  runtime.enableRoutingArea(chainState,4,1);restoredChain=cache.query(chain,1,void,6,routing.TFL_DEFAULT);checks=checks+require(restoredChain.travelTime==18 and chain.invalidations==2 and chain.portalUpdates==3,"re-enabled portal route is rebuilt exactly")
  bounded=cache.create(chainRouter,1);cache.getPortalCache(bounded,3,6,routing.TFL_DEFAULT);cache.getPortalCache(bounded,3,5,routing.TFL_DEFAULT);cache.getPortalCache(bounded,3,6,routing.TFL_DEFAULT);checks=checks+require(len(bounded.portalCaches)==1 and bounded.portalMisses==3 and bounded.portalUpdates==3 and bounded.portalEvictions==2,"bounded portal LRU evicts the oldest goal cache")
  dump=cache.encodeRcd(chain);checks=checks+require(not (dump is error) and len(dump)>40 and numeric.readU32(dump,0)==cache.RCD_IDENT and numeric.readI32(dump,4)==cache.RCD_VERSION,"RCD v2 header uses original identity and version")
  checks=checks+require(cache.crc16Span(bytes("123456789"),0,9)==0x29b1,"CRC-16/CCITT matches original l_crc.c reference vector")
  restoredStore=cache.create(chainRouter,8);checks=checks+require(cache.decodeRcd(restoredStore,dump) and len(restoredStore.portalCaches)==len(chain.portalCaches) and len(restoredStore.areaCaches)==len(chain.areaCaches),"pointer-free RCD payload restores area and portal caches")
  restoredRoute=cache.query(restoredStore,1,void,6,routing.TFL_DEFAULT);checks=checks+require(restoredRoute.travelTime==18 and restoredRoute.reachNum==1 and restoredStore.portalHits>0,"restored propagation is used by the live route query")
  damaged=slice(dump,0,len(dump));damaged[16]=damaged[16]^1;beforePortals=len(restoredStore.portalCaches);checks=checks+require(not cache.decodeRcd(restoredStore,damaged) and len(restoredStore.portalCaches)==beforePortals,"map CRC mismatch rejects file without destroying live cache")
  truncated=slice(dump,0,len(dump)-1);checks=checks+require(not cache.decodeRcd(restoredStore,truncated),"truncated RCD record is rejected")
  cache.clear(chain);checks=checks+require(len(chain.portalCaches)==0 and chain.portalHits==0 and chain.portalMisses==0 and chain.portalUpdates==0 and chain.portalEvictions==0,"portal cache reset clears storage and counters")
  print("PASS: "+str(checks)+" AAS cluster/portal cache contracts");return 0
end function
