import mq3.botlib.aas_routing_cache as cache
import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_runtime as runtime
import mq3.format.aas as aas
import std.fs as fs

function require(ok,label) if not ok then return error(7539,"AAS routing cache: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;map=aas.load(fs.readAllBytes(args[0]));if map is error then return map end if;state=runtime.create(map);router=routing.create(state);store=cache.create(router,2);checks=0
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
  cache.clear(store);checks=checks+require(len(store.entries)==0 and store.hits==0 and store.misses==0 and store.evictions==0,"explicit cache reset")
  print("PASS: "+str(checks)+" AAS cluster/portal cache contracts");return 0
end function
