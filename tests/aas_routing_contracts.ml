import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_routing as routing
import std.fs as fs
import mq3.compat.numeric as n

function require(ok,label) if not ok then return error(7539,"AAS routing contract: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if
  map=aas.load(fs.readAllBytes(args[0]));if map is error then return map end if
  state=runtime.create(map);router=routing.create(state);if router is error then return router end if;checks=0;origin=[0.0,0.0,0.0]
  checks=checks+require(routing.travelFlagForType(routing.TRAVEL_WALK)==routing.TFL_WALK and routing.travelFlagForType(31)==routing.TFL_INVALID,"travel type lookup")
  checks=checks+require(routing.areaContentsTravelFlags(router,1)==routing.TFL_AIR,"air area contents")
  checks=checks+require(routing.areaTravelTime(router,1,origin,[30.0,0.0,0.0])==9 and routing.areaTravelTime(router,1,origin,origin)==1,"original area distance factors")
  checks=checks+require(routing.areaTravelTimeToGoalArea(router,0,origin,4,routing.TFL_DEFAULT)==0 and routing.areaTravelTimeToGoalArea(router,1,origin,6,routing.TFL_DEFAULT)==0,"start and goal validation")
  checks=checks+require(routing.areaTravelTimeToGoalArea(router,1,origin,1,routing.TFL_DEFAULT)==1 and routing.areaReachabilityToGoalArea(router,1,origin,1,routing.TFL_DEFAULT)==0,"same area sentinel")
  route=routing.areaRouteToGoalArea(router,1,origin,4,routing.TFL_DEFAULT);checks=checks+require(route.travelTime==15 and route.reachNum==1,"weighted default route")
  flags=routing.TFL_DEFAULT|routing.TFL_ROCKETJUMP;route=routing.areaRouteToGoalArea(router,1,origin,4,flags);checks=checks+require(route.travelTime==6 and route.reachNum==2,"travel flag enables lower cost route")
  checks=checks+require(routing.areaTravelTimeToGoalArea(router,1,void,4,routing.TFL_DEFAULT)==14,"null origin omits initial area time")
  checks=checks+require(routing.areaTravelTimeToGoalArea(router,1,origin,4,routing.TFL_WALK)==0,"destination contents filter")
  runtime.enableRoutingArea(state,3,0);route=routing.areaRouteToGoalArea(router,1,origin,4,flags);checks=checks+require(route.travelTime==15 and route.reachNum==1,"disabled intermediate area avoided")
  runtime.enableRoutingArea(state,4,0);checks=checks+require(routing.areaTravelTimeToGoalArea(router,1,origin,4,flags)==0,"disabled goal is unreachable")
  runtime.enableRoutingArea(state,3,1);runtime.enableRoutingArea(state,4,1);checks=checks+require(routing.areaTravelTimeToGoalArea(router,1,origin,5,flags)==0 and routing.areaReachabilityToGoalArea(router,1,origin,5,flags)==0,"unreachable pair returns zero")
  for each scale in [0.33,1.0,1.3]
    for index=0 to 127
      ax=(index%17-8)*18.33337;ay=(index%59-26)*0.667;bz=(index%23-11)*37.55
      dx=n.fsub(ax,0.75);dy=n.fsub(ay,-0.125);dz=n.fsub(-3.0,bz)
      squared=n.fadd(n.fadd(n.fmul(dx,dx),n.fmul(dy,dy)),n.fmul(dz,dz))
      expected=n.trunc32(n.fmul(n.fsqrt(squared),scale))
      actual=routing.scaledDistanceNative(ax,ay,-3.0,0.75,-0.125,bz,scale)
      if actual!=expected then return error(7539,"binary32 route leg distance mismatch") end if
    end for
  end for
  checks=checks+1
  print("PASS: "+str(checks)+" AAS weighted routing contracts");return 0
end function
