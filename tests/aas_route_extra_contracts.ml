import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_route_extras as extras
import mq3.botlib.aas_route_extra_syscalls as traps
import mq3.compat.numeric as n
import std.fs as fs

struct Machine data mask end struct
function require(ok,label) if not ok then return error(7538,"AAS route-extra contract: "+label) end if;return 1 end function
function setRouteArg(vm,base,index,value) n.writeU32(vm.data,base+index*4,value);return void end function
function putRouteVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function readRouteU16(data,address) return data[address]|(data[address+1]<<8) end function

function main(args)
  if len(args)!=1 then return 2 end if;map=aas.load(fs.readAllBytes(args[0]));if map is error then return map end if;state=runtime.create(map);router=routing.create(state);if router is error then return router end if;count=0;origin=[1.0,0.0,0.0]
  predicted=extras.PredictRoute([9.0,9.0,9.0],99,99,99,99,77,99)
  debugPredict=extras.predictRoute(router,predicted,1,origin,4,routing.TFL_DEFAULT,0,0,0,0,0,0)
  count=count+require(debugPredict==1,"predict route reaches weighted goal")
  count=count+require(predicted.endArea==4 and predicted.endPos==[30.0,0.0,0.0] and predicted.time==69,"predict route accumulates released original-area travel costs")
  count=count+require(predicted.stopEvent==extras.RSE_NONE and predicted.endTravelFlags==routing.TFL_WALK and predicted.numAreas==77,"prediction preserves untouched numareas field")
  stopped=extras.PredictRoute([0.0,0.0,0.0],0,0,0,0,5,0);count=count+require(extras.predictRoute(router,stopped,1,origin,4,routing.TFL_DEFAULT,0,0,extras.RSE_USETRAVELTYPE,0,routing.TFL_WALK,0)==1 and stopped.stopEvent==extras.RSE_USETRAVELTYPE and stopped.endArea==1 and stopped.time==0,"travel-type stop occurs before taking reachability")
  stopped=extras.PredictRoute([0.0,0.0,0.0],0,0,0,0,0,0);count=count+require(extras.predictRoute(router,stopped,1,origin,4,routing.TFL_DEFAULT,0,0,extras.RSE_ENTERCONTENTS,1,0,0)==1 and stopped.stopEvent==extras.RSE_ENTERCONTENTS and stopped.endArea==3 and stopped.time==33,"contents stop includes reach travel time")
  stopped=extras.PredictRoute([0.0,0.0,0.0],0,0,0,0,0,0);count=count+require(extras.predictRoute(router,stopped,1,origin,4,routing.TFL_DEFAULT,0,0,extras.RSE_ENTERAREA,0,0,3)==1 and stopped.stopEvent==extras.RSE_ENTERAREA and stopped.endPos==[10.0,0.0,0.0] and stopped.time==11,"enter-area stop uses reach start without current leg time")
  limited=extras.PredictRoute([0.0,0.0,0.0],0,0,0,0,12,0);count=count+require(extras.predictRoute(router,limited,1,origin,4,routing.TFL_DEFAULT,1,0,0,0,0,0)==0 and limited.stopEvent==extras.RSE_NONE and limited.endArea==2 and limited.time==11,"maxareas returns partial route without synthetic event")
  missing=extras.PredictRoute([0.0,0.0,0.0],0,0,0,0,0,0);count=count+require(extras.predictRoute(router,missing,5,origin,4,routing.TFL_DEFAULT,0,0,0,0,0,0)==0 and missing.stopEvent==extras.RSE_NOROUTE,"missing route reports RSE_NOROUTE")

  alternatives=extras.alternativeRouteGoals(router,origin,1,[30.0,0.0,0.0],4,routing.TFL_DEFAULT,4,extras.ALTROUTEGOAL_ALL)
  count=count+require(len(alternatives)==1 and alternatives[0].areaNum==3 and alternatives[0].origin==[30.0,0.0,0.0],"alternative routing selects middle-range cluster center")
  count=count+require(alternatives[0].startTravelTime==33 and alternatives[0].goalTravelTime==31 and alternatives[0].extraTravelTime==0,"alternative travel times use unsigned-short ABI values")
  count=count+require(len(extras.alternativeRouteGoals(router,origin,1,[30.0,0.0,0.0],4,routing.TFL_DEFAULT,4,extras.ALTROUTEGOAL_CLUSTERPORTALS))==0,"alternative type filters non-portal areas")
  altState=extras.initAlternativeRouting(router);count=count+require(altState.initialized and len(altState.valid)==6 and len(altState.clusterAreas)==6 and altState.numClusterAreas==0,"alternative routing allocates one work slot per AAS area")
  altState.valid[3]=true;extras.altRoutingFloodCluster(router,altState,3);count=count+require(altState.numClusterAreas==1 and altState.clusterAreas[0]==3 and not altState.valid[3],"alternative cluster flood records and consumes the starting area")
  extras.altRoutingFloodCluster(router,altState,3);count=count+require(altState.numClusterAreas==1,"alternative cluster flood ignores consumed areas")
  extras.shutdownAlternativeRouting(altState);count=count+require(not altState.initialized and len(altState.valid)==0 and len(altState.clusterAreas)==0 and altState.numClusterAreas==0,"alternative routing shutdown releases both work arrays")
  emptyState=extras.initAlternativeRouting(void);count=count+require(emptyState.initialized and len(emptyState.valid)==0,"alternative routing tolerates initialization before a map is loaded")
  count=count+require(extras.pointReachabilityAreaIndex(state,void)==30,"null reachability point returns total cluster reachability count")
  count=count+require(extras.pointReachabilityAreaIndex(state,origin)==12 and extras.pointReachabilityAreaIndex(state,[-1.0,0.0,0.0])==0,"point index combines preceding clusters and cluster-area index")

  vm=Machine(bytes(4096,0),4095);base=3800;routeAddress=100;originAddress=200;putRouteVector(vm.data,originAddress,origin);n.writeU32(vm.data,routeAddress+28,123)
  setRouteArg(vm,base,1,routeAddress);setRouteArg(vm,base,2,1);setRouteArg(vm,base,3,originAddress);setRouteArg(vm,base,4,4);setRouteArg(vm,base,5,routing.TFL_DEFAULT);setRouteArg(vm,base,6,0);setRouteArg(vm,base,7,0);setRouteArg(vm,base,8,0);setRouteArg(vm,base,9,0);setRouteArg(vm,base,10,0);setRouteArg(vm,base,11,0)
  count=count+require(traps.dispatch(state,router,vm,base,extras.OP_PREDICT_ROUTE)==1 and n.readI32(vm.data,routeAddress+12)==4 and n.readI32(vm.data,routeAddress+32)==69 and n.readI32(vm.data,routeAddress+28)==123,"PredictRoute syscall writes exact 36-byte ABI")
  goalAddress=240;alternativeAddress=300;putRouteVector(vm.data,goalAddress,[30.0,0.0,0.0]);setRouteArg(vm,base,1,originAddress);setRouteArg(vm,base,2,1);setRouteArg(vm,base,3,goalAddress);setRouteArg(vm,base,4,4);setRouteArg(vm,base,5,routing.TFL_DEFAULT);setRouteArg(vm,base,6,alternativeAddress);setRouteArg(vm,base,7,4);setRouteArg(vm,base,8,extras.ALTROUTEGOAL_ALL)
  count=count+require(traps.dispatch(state,router,vm,base,extras.OP_ALTERNATIVE_ROUTE_GOAL)==1 and n.readI32(vm.data,alternativeAddress+12)==3 and readRouteU16(vm.data,alternativeAddress+16)==33 and readRouteU16(vm.data,alternativeAddress+20)==0,"AlternativeRouteGoals syscall writes padded 24-byte records")
  setRouteArg(vm,base,1,0);count=count+require(traps.dispatch(state,router,vm,base,extras.OP_POINT_REACHABILITY_AREA_INDEX)==30,"PointReachabilityAreaIndex accepts canonical null pointer")
  setRouteArg(vm,base,1,originAddress);count=count+require(traps.dispatch(state,router,vm,base,extras.OP_POINT_REACHABILITY_AREA_INDEX)==12,"PointReachabilityAreaIndex syscall decodes vec3")
  count=count+require(extras.supportsTrap(575) and extras.supportsTrap(577) and not extras.supportsTrap(574),"extended route trap coverage is explicit")
  print("PASS: "+str(count)+" AAS route-extra contracts opcodes=575-577 lifecycle=4");return 0
end function
