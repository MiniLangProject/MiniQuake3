import mq3.botlib.aas_routing_cache as cache
import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_runtime as runtime
import mq3.format.aas as aas
import mq3.format.pk3 as pk3

function require(ok,label) if not ok then return error(7538,"q3dm1 routing cache: "+label) end if;return 1 end function
function center(map,areaNum) return aas.area(map,areaNum).center end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);map=aas.load(pk3.read(archive,"maps/q3dm1.aas"));state=runtime.create(map);router=routing.create(state);store=cache.create(router,8);checks=0
  forward=cache.query(store,2,center(map,2),10,routing.TFL_DEFAULT);again=cache.query(store,2,center(map,2),10,routing.TFL_DEFAULT);checks=checks+require(forward.travelTime==54 and forward.reachNum==2 and again.travelTime==54 and store.hits==1 and store.misses==1,"retail cached forward route")
  reverse=cache.query(store,10,center(map,10),2,routing.TFL_DEFAULT);checks=checks+require(reverse.travelTime==51 and reverse.reachNum==21,"retail reverse route")
  walk=cache.query(store,779,center(map,779),1889,routing.TFL_DEFAULT);rocket=cache.query(store,779,center(map,779),1889,routing.TFL_ROCKETJUMP|routing.TFL_AIR);checks=checks+require(walk.travelTime==118 and walk.reachNum==1235 and rocket.travelTime==302 and rocket.reachNum==1234,"travel flags remain separate cache keys")
  miss=cache.query(store,2,center(map,2),100,routing.TFL_DEFAULT);checks=checks+require(miss.travelTime==0 and miss.reachNum==0,"unreachable result is cached")
  missAgain=cache.query(store,2,center(map,2),100,routing.TFL_DEFAULT);checks=checks+require(missAgain.travelTime==0 and store.hits==2 and store.misses==5,"cached unreachable query")
  print("PASS: "+str(checks)+" retail q3dm1 cluster/portal cache checks hits="+str(store.hits)+" misses="+str(store.misses));return 0
end function
