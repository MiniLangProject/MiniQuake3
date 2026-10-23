import mq3.botlib.be_aas_move as complete
import mq3.botlib.aas_client_movement as movement
import mq3.botlib.aas_runtime as aasRuntime

struct World floorZ end struct
struct Reach start finish end struct
function require(ok,label) if not ok then return error(7890,"be_aas_move: "+label) end if;return 1 end function
function close(a,b,tolerance) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<=tolerance end function
function trace(world,start,finish,presence,passEntity)
  fraction=1.0;normal=[0.0,0.0,0.0];bottomStart=start[2]-24.0;bottomFinish=finish[2]-24.0
  if bottomFinish<world.floorZ and bottomStart>=world.floorZ then fraction=(bottomStart-world.floorZ)/(bottomStart-bottomFinish);normal=[0.0,0.0,1.0] end if
  endpos=[start[0]+(finish[0]-start[0])*fraction,start[1]+(finish[1]-start[1])*fraction,start[2]+(finish[2]-start[2])*fraction]
  return movement.Trace(false,fraction,endpos,0,0,1,0,normal)
end function
function pointContents(world,point) if point[0]>=900.0 then return movement.CONTENTS_WATER end if;return 0 end function
function pointArea(world,point) return 1 end function
function pointPresence(world,point) return aasRuntime.PRESENCE_NORMAL|aasRuntime.PRESENCE_CROUCH end function
function areaContents(world,area) return 0 end function
function areas(world,start,finish,maximum) return movement.AreaTrace([1],[start]) end function
function host(world) services=movement.services(world);services.traceFn=trace;services.pointContentsFn=pointContents;services.pointAreaFn=pointArea;services.pointPresenceFn=pointPresence;services.areaContentsFn=areaContents;services.traceAreasFn=areas;return services end function
function against(context,origin) return origin[0]==7.0 end function

function main(args)
  count=0;world=World(0.0);runtime=complete.create(host(world));runtime.context=world;runtime.againstLadderFn=against
  cfg=complete.AAS_InitSettings();count=count+require(cfg.gravity==800.0 and cfg.maxVelocity==320.0 and cfg.rsMaxJumpFallHeight==450.0,"settings")
  origin=[0.0,0.0,80.0];count=count+require(complete.AAS_DropToFloor(runtime,origin,[-15.0,-15.0,-24.0],[15.0,15.0,32.0]) and close(origin[2],24.0,0.001),"drop to floor")
  count=count+require(complete.AAS_AgainstLadder(runtime,[7.0,0.0,0.0]) and not complete.AAS_AgainstLadder(runtime,[0.0,0.0,0.0]),"ladder callback")
  count=count+require(complete.AAS_OnGround(runtime,[0.0,0.0,24.0],aasRuntime.PRESENCE_NORMAL,-1),"ground")
  count=count+require(complete.AAS_Swimming(runtime,[900.0,0.0,24.0]),"swimming")
  count=count+require(complete.AAS_SetMovedir([0.0,-1.0,0.0])==[0.0,0.0,1.0] and complete.AAS_SetMovedir([0.0,-2.0,0.0])==[0.0,0.0,-1.0],"special movedirs")
  direction=complete.AAS_SetMovedir([0.0,90.0,0.0]);count=count+require(close(direction[0],0.0,0.0001) and close(direction[1],1.0,0.0001),"angle movedir")
  velocity=[0.0,0.0,0.0];complete.AAS_Accelerate(velocity,0.1,[1.0,0.0,0.0],320.0,10.0);count=count+require(velocity[0]==320.0,"accelerate")
  velocity=[200.0,0.0,4.0];complete.AAS_ApplyFriction(velocity,6.0,100.0,0.1);count=count+require(velocity[0]==80.0 and velocity[2]==4.0,"friction")
  hit=complete.AAS_ClipToBBox([0.0,0.0,24.0],[60.0,0.0,24.0],aasRuntime.PRESENCE_NORMAL,[55.0,-20.0,0.0],[75.0,20.0,64.0]);count=count+require(hit!=void and close(hit.fraction,0.6666667,0.000001),"bbox")
  jump=complete.AAS_HorizontalVelocityForJump(runtime,270.0,[0.0,0.0,0.0],[100.0,0.0,0.0]);count=count+require(jump[0] and jump[1]>100.0 and jump[1]<200.0,"jump velocity")
  tooHigh=complete.AAS_HorizontalVelocityForJump(runtime,0.0,[0.0,0.0,0.0],[0.0,0.0,1.0]);count=count+require(not tooHigh[0] and tooHigh[1]==320.0,"jump too high")
  complete.AAS_AirControl([0.0,0.0,0.0],[1.0,2.0,3.0],[0.0,0.0,0.0],[0.0,0.0,0.0]);count=count+require(true,"air-control no-op")
  result=complete.AAS_PredictClientMovement(runtime,-1,[0.0,0.0,64.0],aasRuntime.PRESENCE_NORMAL,false,[0.0,0.0,0.0],[0.0,0.0,0.0],0,20,0.1,movement.SE_HITGROUND,0,false);count=count+require(result.stopevent==movement.SE_HITGROUND,"predict wrapper")
  box=complete.AAS_ClientMovementHitBBox(runtime,-1,[0.0,0.0,24.0],aasRuntime.PRESENCE_NORMAL,true,[600.0,0.0,0.0],[0.0,0.0,0.0],0,2,0.1,[55.0,-20.0,0.0],[75.0,20.0,64.0],false);count=count+require(box.stopevent==movement.SE_HITBOUNDINGBOX,"bbox wrapper")
  count=count+require(close(complete.AAS_RocketJumpZVelocity(runtime,[0.0,0.0,24.0]),complete.AAS_BFGJumpZVelocity(runtime,[0.0,0.0,24.0]),0.0001),"baseq3 BFG/rocket radius behavior")
  print("PASS: "+str(count)+" complete be_aas_move contracts");return 0
end function
