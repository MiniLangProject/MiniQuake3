import mq3.format.pk3 as pk3
import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime

function require(ok,label) if not ok then return error(7529,"AAS retail runtime: "+label) end if;return 1 end function
function contains(values,value) if len(values)>0 then for index=0 to len(values)-1 if values[index]==value then return true end if end for end if;return false end function
function main(args)
  if len(args)!=1 then return error(7528,"usage: aas_runtime_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;map=aas.load(pk3.read(archive,"maps/q3dm1.aas"));if map is error then return map end if
  state=runtime.create(map);if state is error then return state end if;checks=0;sampled=0;matched=0;reachable=0
  checks=checks+require(runtime.presenceTypeBoundingBox(runtime.PRESENCE_NORMAL)==[[-15.0,-15.0,-24.0],[15.0,15.0,32.0]],"normal presence bounds")
  checks=checks+require(runtime.presenceTypeBoundingBox(runtime.PRESENCE_CROUCH)==[[-15.0,-15.0,-24.0],[15.0,15.0,8.0]],"crouch presence bounds")
  for areaNum=1 to map.counts[aas.LUMP_AREAS]-1
    settings=aas.areaSettings(map,areaNum);if settings.numReachableAreas>0 then reachable=reachable+1 end if
    if sampled<256 then area=aas.area(map,areaNum);found=runtime.pointAreaNum(state,area.center);if found==areaNum then matched=matched+1 end if;box=runtime.bboxAreas(state,area.mins,area.maxs,128);checks=checks+require(contains(box,areaNum),"area bbox traversal");sampled=sampled+1 end if
  end for
  checks=checks+require(matched>sampled*3/4,"area centers resolve through node one")
  chosen=0;for areaNum=1 to map.counts[aas.LUMP_AREAS]-1 if chosen==0 and runtime.areaReachability(state,areaNum)>1 then chosen=areaNum end if end for
  checks=checks+require(chosen>0,"reachable area exists");first=runtime.nextAreaReachability(state,chosen,0);second=runtime.nextAreaReachability(state,chosen,first);checks=checks+require(first>0 and second==first+1,"reachability iterator")
  link=runtime.reachabilityFromNum(state,first);checks=checks+require(link.areaNum>0 and link.travelTime>=0,"reachability record")
  before=runtime.enableRoutingArea(state,chosen,-1);old=runtime.enableRoutingArea(state,chosen,0);disabled=runtime.enableRoutingArea(state,chosen,-1);oldDisabled=runtime.enableRoutingArea(state,chosen,1);enabled=runtime.enableRoutingArea(state,chosen,-1)
  checks=checks+require(before and old and not disabled and not oldDisabled and enabled and state.cacheInvalidations==2,"routing area state and original return value")
  info=runtime.areaInfo(state,chosen);checks=checks+require(info.numReachableAreas==runtime.areaReachability(state,chosen) and info.presenceType!=0,"area info")
  runtime.setTime(state,7.25);checks=checks+require(runtime.getTime(state)==7.25,"AAS time")
  print("PASS: q3dm1 AAS runtime checks="+str(checks)+" areas="+str(map.counts[aas.LUMP_AREAS])+" reachable="+str(reachable)+" centerMatches="+str(matched)+"/"+str(sampled));return 0
end function
