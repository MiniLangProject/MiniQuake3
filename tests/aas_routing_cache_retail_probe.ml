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
  // Sweep distinct origins across actual AAS reachability transitions. The
  // original weighted search remains the comparison oracle.
  sweep=cache.create(router,64);batchSweep=cache.create(router,8)
  for each goal in [2,10,779,1889]
    for each flags in [routing.TFL_DEFAULT,routing.TFL_WALK|routing.TFL_AIR,routing.TFL_ROCKETJUMP|routing.TFL_AIR]
      for index=1 to 24
        source=1+(index*79)%(len(router.settings)-1)
        origin=center(map,source);origin[0]=origin[0]+index*1.25
        expected=routing.areaRouteToGoalArea(router,source,origin,goal,flags)
        actual=cache.weightedQuery(sweep,source,origin,goal,flags,false)
        equal=require(expected.travelTime==actual.travelTime and expected.reachNum==actual.reachNum,"weighted prediction to "+str(goal)+" from "+str(source)+" differs")
        if equal is error then return equal end if
        expectedItem=cache.areaTravelTimeToGoalArea(sweep,source,origin,goal,flags)
        equal=require(cache.itemTravelTime(sweep,source,origin,goal,flags)==expectedItem,"item scores retain exact travel time and portal behavior")
        if equal is error then return equal end if
        query=cache.itemQuery(batchSweep,source,origin,flags)
        equal=require(cache.itemQueryTravelTime(query,goal)==expectedItem,"cold item query retains exact travel time and portal behavior")
        if equal is error then return equal end if
      end for
    end for
  end for
  print("PASS: "+str(checks)+" retail q3dm1 cluster/portal cache checks hits="+str(store.hits)+" misses="+str(store.misses));return 0
end function
