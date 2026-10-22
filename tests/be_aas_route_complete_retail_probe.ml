import mq3.format.pk3 as pk3
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_routing as routing
import mq3.botlib.be_aas_route as port

function req(ok,label) if not ok then return error(7554,"retail be_aas_route: "+label) end if;return 1 end function
function center(map,areaNum) return aas.area(map,areaNum).center end function
function main(args)
  if len(args)!=2 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;map=aas.load(pk3.read(archive,"maps/q3dm1.aas"));if map is error then return map end if;state=port.create(runtime.create(map),64,void);checks=0
  forward=port.AAS_AreaRouteToGoalArea(state,2,center(map,2),10,routing.TFL_DEFAULT);checks=checks+req(forward.travelTime==54 and forward.reachNum==2,"forward route")
  reverse=port.AAS_AreaRouteToGoalArea(state,10,center(map,10),2,routing.TFL_DEFAULT);checks=checks+req(reverse.travelTime==51 and reverse.reachNum==21,"reverse route")
  walk=port.AAS_AreaRouteToGoalArea(state,779,center(map,779),1889,routing.TFL_DEFAULT);rocket=port.AAS_AreaRouteToGoalArea(state,779,center(map,779),1889,routing.TFL_ROCKETJUMP|routing.TFL_AIR);checks=checks+req(walk.travelTime==118 and walk.reachNum==1235 and rocket.travelTime==302 and rocket.reachNum==1234,"travel-filtered route selection")
  repeated=port.AAS_AreaRouteToGoalArea(state,2,center(map,2),10,routing.TFL_DEFAULT);checks=checks+req(repeated.travelTime==54 and state.cache.hits>=1,"route cache hit")
  checks=checks+req(state.staticTables.totalLinks>0 and len(state.staticTables.portalMaxTravelTimes)==map.counts[aas.LUMP_PORTALS],"retail reverse/portal tables")
  checks=checks+req(port.AAS_WriteRouteCache(state,args[1]),"retail RCD write");fresh=port.create(runtime.create(map),64,void);checks=checks+req(port.AAS_ReadRouteCache(fresh,args[1]),"retail RCD reload")
  loaded=port.AAS_AreaRouteToGoalArea(fresh,2,center(map,2),10,routing.TFL_DEFAULT);checks=checks+req(loaded.travelTime==54 and loaded.reachNum==2,"route after RCD reload")
  print("PASS: "+str(checks)+" retail be_aas_route checks links="+str(state.staticTables.totalLinks)+" portals="+str(len(state.staticTables.portalMaxTravelTimes)));return 0
end function
