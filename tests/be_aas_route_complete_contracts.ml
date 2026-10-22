import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_routing_cache as routingCache
import mq3.botlib.aas_route_extras as extras
import mq3.botlib.be_aas_route as port
import std.fs as fs

struct Host visibility random traced end struct
function req(ok,label) if not ok then return error(7554,"be_aas_route contract: "+label) end if;return 1 end function
function visible(context,source,destination) return context.visibility[destination] end function
function randomValue(context) return context.random end function
function traceAreas(context,start,finish,maximum) context.traced=context.traced+1;return [2,3,4] end function

function main(args)
  if len(args)!=2 then return 2 end if;map=aas.load(fs.readAllBytes(args[0]));if map is error then return map end if;nav=runtime.create(map);host=Host(array(map.counts[aas.LUMP_AREAS],false),0.1,0);services=port.createServices(host);services.visibleFn=visible;services.randomFn=randomValue;services.traceAreasFn=traceAreas;state=port.create(nav,256,services);checks=0
  checks=checks+req(state.initialized and len(state.areaContentTravelFlags)==map.counts[aas.LUMP_AREAS],"routing initialization")
  checks=checks+req(port.AAS_TravelFlagForType(state,routing.TRAVEL_WALK)==routing.TFL_WALK and port.AAS_TravelFlagForType_inline(state,999)==routing.TFL_INVALID,"travel type lookup")
  checks=checks+req(port.AAS_AreaContentsTravelFlags(state,3)==routing.TFL_WATER and port.AAS_GetAreaContentsTravelFlags(state,3)==routing.TFL_WATER,"area contents flags")
  checks=checks+req(port.AAS_CreateReversedReachability(state)==3 and len(state.staticTables.reversed[3])==1,"reversed reachability")
  checks=checks+req(port.AAS_AreaTravelTime(state,1,[0.0,0.0,0.0],[3.0,4.0,0.0])==1,"walk area travel time")
  route=port.AAS_AreaRouteToGoalArea(state,1,[1.0,0.0,0.0],4,routing.TFL_DEFAULT);checks=checks+req(route.travelTime==64 and route.reachNum==1,"cached weighted route")
  checks=checks+req(port.AAS_AreaTravelTimeToGoalArea(state,1,[1.0,0.0,0.0],4,routing.TFL_DEFAULT)==64 and port.AAS_AreaReachabilityToGoalArea(state,1,[1.0,0.0,0.0],4,routing.TFL_DEFAULT)==1,"route convenience API")
  checks=checks+req(port.AAS_ClusterAreaNum(state,1,1)==2,"cluster area mapping")
  enabled=port.AAS_EnableRoutingArea(state,2,-1);port.AAS_EnableRoutingArea(state,2,0);checks=checks+req(enabled and not port.AAS_EnableRoutingArea(state,2,-1),"routing area disable/query");port.AAS_EnableRoutingArea(state,2,1)
  cache=port.AAS_AllocRoutingCache(state,4);checks=checks+req(cache!=void and cache.linked and len(cache.travelTimes)==4 and state.routingCacheSize==60,"cache allocation and LRU link");port.AAS_UnlinkCache(state,cache);checks=checks+req(not cache.linked,"cache unlink");port.AAS_LinkCache(state,cache);checks=checks+req(port.AAS_FreeOldestCache(state)==1 and state.routingCacheSize==0,"oldest cache eviction")
  areaCache=port.AAS_GetAreaRoutingCache(state,1,4,routing.TFL_DEFAULT);checks=checks+req(areaCache!=void and len(areaCache.travelTimes)==20,"cluster cache creation")
  checks=checks+req(port.AAS_UpdateAreaRoutingCache(state,areaCache)!=void and port.AAS_InitPortalMaxTravelTimes(state)==map.counts[aas.LUMP_PORTALS],"area update and portal maxima")
  checks=checks+req(port.AAS_WriteRouteCache(state,args[1]),"RCD write");fresh=port.create(runtime.create(map),256,services);checks=checks+req(port.AAS_ReadRouteCache(fresh,args[1]),"RCD read")
  encoded=routingCache.encodeRcd(state.cache);checks=checks+req(port.AAS_ReadCache(fresh,encoded),"RCD memory read")
  prediction=extras.PredictRoute([0.0,0.0,0.0],0,0,0,0,0,0);checks=checks+req(port.AAS_PredictRoute(state,prediction,1,[1.0,0.0,0.0],4,routing.TFL_DEFAULT,0,0,0,0,0,0)==1 and prediction.endArea==4,"route prediction")
  checks=checks+req(not port.AAS_BridgeWalkable(state,1) and not port.AAS_AreaVisible(state,1,2),"released visibility/bridge stubs")
  checks=checks+req(port.AAS_NextAreaReachability(state,1,0)==1 and port.AAS_ReachabilityFromNum(state,1).areaNum==2,"reachability enumeration")
  modelState=state;checks=checks+req(port.AAS_NextModelReachability(modelState,0,99)==0,"model reachability miss")
  checks=checks+req(port.DistancePointToLine([0.0,0.0,0.0],[10.0,0.0,0.0],[5.0,3.0,0.0])==3.0,"point-line distance")
  randomGoal=port.AAS_RandomGoalArea(state,1,routing.TFL_DEFAULT);checks=checks+req(randomGoal[0] and randomGoal[1]>0,"random reachable goal")
  alternatives=port.AAS_AlternativeRouteGoals(state,[1.0,0.0,0.0],1,[30.0,0.0,0.0],4,routing.TFL_DEFAULT,4,extras.ALTROUTEGOAL_ALL);checks=checks+req(len(alternatives)==1,"alternative route goals")
  checks=checks+req(port.AAS_InitReachabilityAreas(state)==0 and host.traced==0,"pass-area table ignores simple travel")
  info=port.AAS_RoutingInfo(state);checks=checks+req(len(info)==5 and info[4]>0,"routing statistics")
  freed=port.AAS_FreeRoutingCaches(state);checks=checks+req(not state.initialized and len(state.areaContentTravelFlags)==0 and freed>=0,"routing shutdown")
  print("PASS: "+str(checks)+" complete be_aas_route adapter contracts");return 0
end function
