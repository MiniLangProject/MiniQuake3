// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.botlib.aas_reachability as reach
import mq3.botlib.aas_runtime as runtime
import mq3.format.aas as aas
import mq3.format.pk3 as pk3

function req(ok,label) if not ok then return error(7951,"AAS reachability contract: "+label) end if;return 1 end function
function near(a,b,e) d=a-b;if d<0 then d=0.0-d end if;return d<=e end function
function baseWorld(path) archive=pk3.open(path);map=aas.load(pk3.read(archive,"maps/q3dm1.aas"));return reach.create(runtime.create(map)) end function
function synthetic(world)
  world.settings=[aas.AreaSettings(0,0,2,0,0,0,0),aas.AreaSettings(0,reach.AREA_GROUNDED,2,0,0,0,0),aas.AreaSettings(0,reach.AREA_GROUNDED,2,0,0,0,0)]
  world.areas=[aas.Area(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]),aas.Area(1,0,0,[0.0,0.0,-8.0],[64.0,64.0,32.0],[32.0,32.0,0.0]),aas.Area(2,0,0,[64.0,0.0,-8.0],[128.0,64.0,32.0],[96.0,32.0,0.0])]
  world.reachesByArea=[[],[],[]];world.stored=[];reach.AAS_SetupReachabilityHeap(world);return world
end function
function clear(world) world.reachesByArea=[[],[],[]];world.heapUsed=0;return void end function
function main(args)
  if len(args)!=1 then return 2 end if;world=baseWorld(args[0]);count=0
  count=count+req(world.loaded and len(world.settings)==world.map.counts[aas.LUMP_AREAS],"retail world projection")
  count=count+req(reach.VectorDistance([0.0,0.0,0.0],[3.0,4.0,0.0])==5.0,"vector distance")
  count=count+req(reach.VectorBetweenVectors([1.5,2.0,0.0],[0.0,0.0,0.0],[3.0,4.0,0.0]) and not reach.VectorBetweenVectors([4.0,5.0,0.0],[0.0,0.0,0.0],[3.0,4.0,0.0]),"between vectors")
  count=count+req(reach.VectorMiddle([0.0,0.0,0.0],[3.0,4.0,0.0])==[1.5,2.0,0.0],"vector middle")
  closest=reach.AAS_ClosestEdgePoints([0.0,0.0,0.0],[2.0,0.0,0.0],[1.0,-1.0,0.0],[1.0,1.0,0.0]);count=count+req(near(closest[0],0.0,0.0001) and near(closest[1][0],1.0,0.0001),"closest edge points")
  count=count+req(reach.AAS_FallDamageDistance(world)==187 and near(reach.AAS_FallDelta(world,100.0),16.0,0.001),"fall physics")
  count=count+req(near(reach.AAS_MaxJumpHeight(world,270.0),45.5625,0.001) and reach.AAS_MaxJumpDistance(world,270.0)>440.0,"jump physics")
  count=count+req(reach.AAS_BarrierJumpTravelTime(world)==3,"barrier travel time")
  value=reach.AAS_AllocReachability(world);count=count+req(value==void,"heap closed before setup")
  reach.AAS_SetupReachabilityHeap(world);value=reach.AAS_AllocReachability(world);count=count+req(value!=void and world.heapUsed==1,"heap allocation");count=count+req(reach.AAS_FreeReachability(world,value) and world.heapUsed==0 and not reach.AAS_FreeReachability(world,value),"heap free ownership")

  synthetic(world);count=count+req(reach.AAS_Reachability_EqualFloorHeight(world,1,2),"equal-floor walk generation")
  count=count+req(reach.AAS_ReachabilityExists(world,1,2) and world.reachesByArea[1][0].travelType==reach.TRAVEL_WALK,"walk record")
  count=count+req(not reach.AAS_Reachability_EqualFloorHeight(world,1,2),"duplicate prevention")
  clear(world);world.settings[1].flags=reach.AREA_LIQUID;world.settings[2].flags=reach.AREA_LIQUID;count=count+req(reach.AAS_Reachability_Swim(world,1,2) and world.reachesByArea[1][0].travelType==reach.TRAVEL_SWIM,"swim generation")
  clear(world);world.settings[1].flags=reach.AREA_GROUNDED;world.settings[2].flags=reach.AREA_GROUNDED;world.areas[2].center[2]=25.0;count=count+req(reach.AAS_Reachability_Step_Barrier_WaterJump_WalkOffLedge(world,1,2) and world.reachesByArea[1][0].travelType==reach.TRAVEL_BARRIERJUMP,"barrier generation")
  clear(world);world.areas[2].center[2]=-40.0;count=count+req(reach.AAS_Reachability_Step_Barrier_WaterJump_WalkOffLedge(world,1,2) and world.reachesByArea[1][0].travelType==reach.TRAVEL_WALKOFFLEDGE,"walk-off-ledge generation")
  clear(world);world.areas[2].center[2]=20.0;world.settings[1].flags=reach.AREA_LIQUID;count=count+req(reach.AAS_Reachability_Step_Barrier_WaterJump_WalkOffLedge(world,1,2) and world.reachesByArea[1][0].travelType==reach.TRAVEL_WATERJUMP,"water-jump generation")
  clear(world);world.settings[1].flags=reach.AREA_LADDER;world.settings[2].flags=0;world.areas[2].center[2]=30.0;count=count+req(reach.AAS_Reachability_Ladder(world,1,2),"ladder generation")
  clear(world);world.settings[1].flags=reach.AREA_GROUNDED;world.areas[2].center[2]=20.0;count=count+req(reach.AAS_Reachability_Jump(world,1,2) and world.reachesByArea[1][0].travelType==reach.TRAVEL_JUMP,"jump generation")
  clear(world);world.calcGrapple=true;world.areas[2].center[2]=80.0;count=count+req(reach.AAS_Reachability_Grapple(world,1,2),"grapple generation")
  clear(world);world.settings[2].flags=reach.AREA_WEAPONJUMP;count=count+req(reach.AAS_Reachability_WeaponJump(world,1,2) and world.reachesByArea[1][0].travelType==reach.TRAVEL_ROCKETJUMP,"weapon jump generation")
  clear(world);world.specials=[reach.Special("teleport",1,2,5,0,[1.0,2.0,3.0],[4.0,5.0,6.0],[0.0,0.0,0.0],0)];count=count+req(reach.AAS_Reachability_Teleport(world)==1 and world.reachesByArea[1][0].travelType==reach.TRAVEL_TELEPORT,"teleport entity generation")
  clear(world);world.specials=[reach.Special("elevator",1,2,6,1,[0.0,0.0,0.0],[0.0,0.0,64.0],[0.0,0.0,0.0],0)];count=count+req(reach.AAS_Reachability_Elevator(world)==1 and world.reachesByArea[1][0].travelType==reach.TRAVEL_ELEVATOR,"elevator generation")
  clear(world);world.specials=[reach.Special("func_bobbing",1,2,7,2,[0.0,0.0,0.0],[64.0,0.0,0.0],[0.0,0.0,0.0],0)];count=count+req(reach.AAS_Reachability_FuncBobbing(world)==1 and world.reachesByArea[1][0].travelType==reach.TRAVEL_FUNCBOB,"bobbing generation")
  clear(world);world.specials=[reach.Special("jumppad",1,2,8,3,[0.0,0.0,0.0],[64.0,0.0,64.0],[100.0,0.0,300.0],0)];count=count+req(reach.AAS_Reachability_JumpPad(world)==1 and world.reachesByArea[1][0].travelType==reach.TRAVEL_JUMPPAD,"jump-pad generation")
  count=count+req(reach.AAS_StoreReachability(world)==2 and world.settings[1].firstReachableArea==1 and world.settings[1].numReachableAreas==1,"stored contiguous reachability")
  reach.AAS_ShutDownReachabilityHeap(world);count=count+req(world.heapCapacity==0 and world.heapUsed==0,"heap shutdown")
  original=baseWorld(args[0]);count=count+req(reach.AAS_InitReachability(original) and original.numReachabilityAreas==len(original.areas)+2,"retail precompiled reachability retained")
  print("PASS: "+str(count)+" AAS reachability native contracts\n");return 0
end function


