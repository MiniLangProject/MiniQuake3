// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.botlib.aas_reachability as generation
import mq3.botlib.aas_runtime as runtime
import mq3.format.aas as aas
import mq3.format.pk3 as pk3
function req(ok,label) if not ok then return error(7952,"AAS reach retail: "+label) end if;return 1 end function
function main(args)
  archive=pk3.open(args[0]);map=aas.load(pk3.read(archive,"maps/q3dm17.aas"));world=generation.create(runtime.create(map));checks=0;types=array(20,0);reachable=0
  for areaNum=1 to map.counts[aas.LUMP_AREAS]-1 settings=aas.areaSettings(map,areaNum);if settings.numReachableAreas>0 then reachable=reachable+1 end if;for offset=0 to settings.numReachableAreas-1 reachIndex=settings.firstReachableArea+offset;if reachIndex<0 or reachIndex>=map.counts[aas.LUMP_REACHABILITY] then continue end if;value=aas.reachability(map,reachIndex);kind=value.travelType&0xffffff;if kind>=0 and kind<len(types) then types[kind]=types[kind]+1 end if end for end for
  checks=checks+req(reachable>100 and map.counts[aas.LUMP_REACHABILITY]>1000,"retail precompiled graph")
  checks=checks+req(types[generation.TRAVEL_WALK]>0 and types[generation.TRAVEL_JUMP]>0,"walk and jump links")
  checks=checks+req(types[generation.TRAVEL_BARRIERJUMP]>0 and types[generation.TRAVEL_WALKOFFLEDGE]>0,"barrier and ledge links")
  checks=checks+req(types[generation.TRAVEL_ROCKETJUMP]>0,"weapon-jump links")
  checks=checks+req(types[generation.TRAVEL_TELEPORT]>0,"teleporter links")
  checks=checks+req(types[generation.TRAVEL_JUMPPAD]>0,"jump-pad links")
  checks=checks+req(generation.AAS_InitReachability(world) and world.heapCapacity==0 and world.numReachabilityAreas==len(world.areas)+2,"BSPC graph reuse")
  checks=checks+req(generation.AAS_FallDamageDistance(world)==187 and generation.AAS_MaxJumpDistance(world,270.0)>440.0,"retail physics settings")
  print("PASS: "+str(checks)+" q3dm17 reachability contracts areas="+str(map.counts[aas.LUMP_AREAS])+" reaches="+str(map.counts[aas.LUMP_REACHABILITY])+" reachable="+str(reachable)+"\n");return 0
end function





