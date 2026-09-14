import mq3.botlib.aas_routing_tables as tables
import mq3.botlib.aas_routing_cache as routeCache
import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_runtime as runtime
import mq3.format.aas as aas
import std.fs as fs

function require(ok,label) if not ok then return error(7539,"AAS routing tables: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;map=aas.load(fs.readAllBytes(args[0]));state=runtime.create(map);router=routing.create(state);value=tables.create(router);checks=0
  checks=checks+require(value.totalLinks==4 and value.truncatedSources==0,"one reverse link per outgoing reachability")
  incoming=tables.incoming(value,2);checks=checks+require(len(incoming)==2 and incoming[0].areaNum==1 and incoming[0].linkNum==2 and incoming[1].linkNum==1,"reverse links use original head insertion order")
  checks=checks+require(len(tables.incoming(value,3))==2 and tables.incoming(value,1)==[],"destination buckets")
  checks=checks+require(tables.areaTravelTime(value,2,0,0)==9 and tables.areaTravelTime(value,2,0,1)==3,"incoming ends to first outgoing start")
  checks=checks+require(tables.areaTravelTime(value,2,1,0)==23 and tables.areaTravelTime(value,2,1,1)==29,"full outgoing by incoming matrix")
  checks=checks+require(tables.portalMaxTravelTime(value,1)==29 and tables.portalMaxTravelTime(value,0)==0,"maximum portal-area traversal")
  checks=checks+require(tables.areaTravelTime(value,2,8,0)==0 and tables.portalMaxTravelTime(value,8)==0,"checked table queries")
  cacheValue=importedCache(router);checks=checks+require(cacheValue.staticTables.portalMaxTravelTimes==value.portalMaxTravelTimes,"routing cache owns static original tables")
  print("PASS: "+str(checks)+" AAS reverse/portal table contracts");return 0
end function
function importedCache(router) return routeCache.create(router,4) end function
