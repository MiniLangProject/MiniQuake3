import mq3.format.pk3 as pk3
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_routing as routing

function require(ok,label) if not ok then return error(7538,"q3dm1 routing: "+label) end if;return 1 end function
function center(map,areaNum) return aas.area(map,areaNum).center end function
function main(args)
  if len(args)!=1 then return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;map=aas.load(pk3.read(archive,"maps/q3dm1.aas"));if map is error then return map end if
  state=runtime.create(map);router=routing.create(state);if router is error then return router end if;checks=0
  forward=routing.areaRouteToGoalArea(router,2,center(map,2),10,routing.TFL_DEFAULT);checks=checks+require(forward.travelTime==54 and forward.reachNum==2,"real 2 to 10 route")
  reverse=routing.areaRouteToGoalArea(router,10,center(map,10),2,routing.TFL_DEFAULT);checks=checks+require(reverse.travelTime==51 and reverse.reachNum==21,"real 10 to 2 route")
  walk=routing.areaRouteToGoalArea(router,779,center(map,779),1889,routing.TFL_DEFAULT);checks=checks+require(walk.travelTime==118 and walk.reachNum==1235,"weighted route beats rocket jump")
  rocket=routing.areaRouteToGoalArea(router,779,center(map,779),1889,routing.TFL_ROCKETJUMP|routing.TFL_AIR);checks=checks+require(rocket.travelTime==302 and rocket.reachNum==1234,"rocket-only travel filter")
  checks=checks+require(routing.areaTravelTimeToGoalArea(router,2,center(map,2),100,routing.TFL_DEFAULT)==0 and routing.areaReachabilityToGoalArea(router,2,center(map,2),100,routing.TFL_DEFAULT)==0,"real unreachable pair")
  checks=checks+require(routing.areaTravelTimeToGoalArea(router,2,center(map,2),2,routing.TFL_DEFAULT)==1,"real same-area route")
  print("PASS: q3dm1 weighted routes checks="+str(checks)+" forward="+str(forward.travelTime)+"/"+str(forward.reachNum)+" reverse="+str(reverse.travelTime)+"/"+str(reverse.reachNum)+" walk="+str(walk.travelTime)+" rocket="+str(rocket.travelTime));return 0
end function
