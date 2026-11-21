import mq3.format.aas as aas
import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_routing as aasRouting
import mq3.botlib.ai_resource_pools as resources
import mq3.botlib.ai_move_runtime as movement
import mq3.botlib.ai_move_syscalls as traps
import mq3.botlib.elementary_actions as ea
import mq3.compat.numeric as n
import std.fs as fs

struct Harness groundEntity walks jumpStart gravity ballistic elevator barrierHit randomValue contents funcBob grappleConfig grappleState grappleEnd end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7548,"AI move-runtime contract: "+label) end if;return 1 end function
function moveGround(context,start,mins,maxs,finish,client,contents) return movement.GroundTrace(false,0.5,context.groundEntity,finish) end function
function moveEntityModel(context,entity) return 9 end function
function moveModelType(context,model) return movement.MODELTYPE_FUNC_PLAT end function
function moveModelReachability(context,model) return 2 end function
function moveWalkDirection(context,state,direction,speed,type) context.walks=context.walks+[[direction,speed,type]];return true end function
function moveJumpRunStart(context,state,reach) return context.jumpStart end function
function moveGravity(context) return context.gravity end function
function moveHorizontalVelocity(context,zVelocity,start,finish) return context.ballistic end function
function moveElevatorState(context,state,reach) return context.elevator end function
function moveBarrierJump(context,state,direction,speed) return context.barrierHit end function
function moveRandom(context) return context.randomValue end function
function movePointContents(context,point) return context.contents end function
function moveFuncBobState(context,state,reach) return context.funcBob end function
function moveGrappleConfig(context) return context.grappleConfig end function
function moveGrappleState(context,state,reach) return context.grappleState end function
function moveGrappleTrace(context,start,finish,passEntity) return context.grappleEnd end function
function closeEnough(a,b) difference=a-b;if difference<0 then difference=0-difference end if;return difference<0.01 end function
function setMoveArg(vm,base,index,value) n.writeU32(vm.data,base+index*4,value);return void end function
function putMoveVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function putMoveGoal(vm,address,value)
  putMoveVector(vm.data,address,value.origin);n.writeU32(vm.data,address+12,value.areaNum);putMoveVector(vm.data,address+16,value.mins);putMoveVector(vm.data,address+28,value.maxs);n.writeU32(vm.data,address+40,value.entityNum);n.writeU32(vm.data,address+44,value.number);n.writeU32(vm.data,address+48,value.flags);n.writeU32(vm.data,address+52,value.itemInfo);return void
end function
function putInitMove(vm,address,value)
  putMoveVector(vm.data,address,value.origin);putMoveVector(vm.data,address+12,value.velocity);putMoveVector(vm.data,address+24,value.viewOffset);n.writeU32(vm.data,address+36,value.entityNum);n.writeU32(vm.data,address+40,value.client);n.writeU32(vm.data,address+44,n.floatBits(value.thinkTime));n.writeU32(vm.data,address+48,value.presenceType);putMoveVector(vm.data,address+52,value.viewAngles);n.writeU32(vm.data,address+64,value.orMoveFlags);return void
end function

function main(args)
  if len(args)!=1 then return 2 end if;map=aas.load(fs.readAllBytes(args[0]));if map is error then return map end if;aasState=aasRuntime.create(map);router=aasRouting.create(aasState);if router is error then return router end if
  count=0;pools=resources.create();handle=resources.allocMoveState(pools);host=Harness(movement.ENTITYNUM_WORLD,[],[-40.0,5.0,0.0],600.0,[true,222.0],movement.ElevatorState(false,false,[0.0,0.0,0.0],33.0),false,0.0,0,movement.FuncBobState(false,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],33.0),movement.GrappleConfig(false,movement.WEAPON_GRAPPLE,"grappleon","grappleoff"),0,[0.0,0.0,0.0]);service=movement.services(host);service.elementaryActions=ea.create(8,void,void);runtime=movement.create(pools,aasState,router,service);state=resources.moveState(pools,handle)
  state.moveFlags=movement.MFL_ONGROUND|movement.MFL_WATERJUMP|movement.MFL_TELEPORTED|movement.MFL_GRAPPLEPULL|movement.MFL_WALK|1|4|128
  init=movement.InitMove([1.0,2.0,3.0],[4.0,5.0,6.0],[7.0,8.0,9.0],17,5,0.05,aasRuntime.PRESENCE_NORMAL,[10.0,20.0,30.0],movement.MFL_ONGROUND|movement.MFL_WALK)
  count=count+require(movement.initMoveState(runtime,handle,init)==0 and state.origin==[1.0,2.0,3.0] and state.velocity==[4.0,5.0,6.0] and state.viewOffset==[7.0,8.0,9.0],"InitMoveState copies three input vectors")
  count=count+require(state.entityNum==17 and state.client==5 and state.thinkTime==0.05 and state.presenceType==aasRuntime.PRESENCE_NORMAL and state.viewAngles==[10.0,20.0,30.0],"InitMoveState copies scalar and view inputs")
  count=count+require(state.moveFlags==(1|4|128|movement.MFL_ONGROUND|movement.MFL_WALK),"InitMoveState replaces only five externally owned flags")

  count=count+require(movement.fuzzyPointReachabilityArea(runtime,[1.0,0.0,0.0])==1,"fuzzy reachability returns directly reachable point area")
  count=count+require(movement.reachabilityArea(runtime,[1.0,0.0,0.0],17)==1,"reachability falls back to fuzzy point without host ground trace")
  service.groundTraceFn=moveGround;count=count+require(movement.reachabilityArea(runtime,[1.0,0.0,0.0],17)==1,"world ground trace returns fuzzy point area")
  host.groundEntity=7;service.entityModelFn=moveEntityModel;service.modelTypeFn=moveModelType;service.modelReachabilityFn=moveModelReachability
  platformArea=movement.reachabilityArea(runtime,[1.0,0.0,0.0],17)
  previousTravelType=router.reaches[2].travelType;previousFace=router.reaches[2].faceNum
  router.reaches[2].travelType=aasRouting.TRAVEL_ELEVATOR;router.reaches[2].faceNum=9
  onPlatform=movement.checkStandingOnMover(runtime,state,movement.emptyMoveResult())
  count=count+require(platformArea==3 and not onPlatform.blocked and state.lastReachNum==2,"standing on a platform selects its model reachability")
  router.reaches[2].travelType=previousTravelType;router.reaches[2].faceNum=previousFace
  host.groundEntity=movement.ENTITYNUM_WORLD

  goal=resources.Goal([30.0,0.0,0.0],4,[-1.0,-1.0,-1.0],[1.0,1.0,1.0],0,9,0,0);state.origin=[1.0,0.0,0.0];state.lastReachNum=1;state.lastAreaNum=1;state.lastGoalAreaNum=4
  view=movement.movementViewTarget(runtime,handle,goal,aasRouting.TFL_DEFAULT,5.0,[99.0,99.0,99.0]);count=count+require(view.found and view.target==[4.0,0.0,0.0],"view lookahead interpolates along first reachability")
  view=movement.movementViewTarget(runtime,handle,goal,aasRouting.TFL_DEFAULT,100.0,[0.0,0.0,0.0]);count=count+require(view.found and view.target==[30.0,0.0,0.0],"view target follows weighted reachability chain to goal")
  state.lastReachNum=0;view=movement.movementViewTarget(runtime,handle,goal,aasRouting.TFL_DEFAULT,5.0,[9.0,8.0,7.0]);count=count+require(not view.found and view.target==[9.0,8.0,7.0],"view target preserves caller output without last reachability")

  state.origin=[1.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;state.lastReachNum=0;state.lastAreaNum=0;state.lastGoalAreaNum=0;aasRuntime.setTime(aasState,10.0);ea.resetInput(service.elementaryActions,state.client)
  moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_WALK and moved.moveDir==[1.0,0.0,0.0],"MoveToGoal executes original walk reachability direction")
  count=count+require(input.dir==[1.0,0.0,0.0] and input.speed==400.0 and state.lastReachNum==1 and state.reachabilityTime==15.0,"walk path emits EA_Move and stores five-second reach timeout")
  direct=resources.Goal([6.0,0.0,0.0],1,[-1.0,-1.0,-1.0],[1.0,1.0,1.0],0,10,0,0);ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,direct,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_WALK and input.speed==20.0 and state.lastReachNum==0,"goal-area movement scales speed by remaining distance")
  router.reaches[1].travelType=aasRouting.TRAVEL_CROUCH;state.origin=[1.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;state.lastReachNum=0;state.lastGoalAreaNum=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_CROUCH and moved.moveDir==[1.0,0.0,0.0] and input.speed==400.0 and (input.actionflags&ea.ACTION_CROUCH)!=0,"Crouch uses EA_Crouch and moves at original speed 400")
  state.moveFlags=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_CROUCH and input.speed==0.0 and input.actionflags==0,"airborne Crouch reach performs the original no-op finish path")

  router.reaches[1].travelType=aasRouting.TRAVEL_JUMP;state.origin=[1.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;state.lastReachNum=0;state.lastGoalAreaNum=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_JUMP and input.speed==400.0 and (input.actionflags&ea.ACTION_JUMP)!=0 and state.jumpReach==1,"Jump crosses the start with EA_Jump, requests speed 600 (EA clamps 400) and remembers its reach")
  state.origin=[5.0,0.0,0.0];state.moveFlags=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_JUMP and moved.moveDir==[1.0,0.0,0.0] and input.speed==400.0,"airborne Jump finish requests speed 800 and EA applies its original 400 clamp")
  state.origin=[20.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.finishTravelJump(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[0.0,0.0,0.0] and input.speed==0.0,"Jump finish stops within 24 units after passing the landing")

  state.origin=[-28.0,0.0,0.0];state.reachAreaNum=0;state.lastReachNum=1;state.jumpReach=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelJump(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and input.speed==400.0 and (input.actionflags&ea.ACTION_DELAYEDJUMP)!=0 and (input.actionflags&ea.ACTION_JUMP)==0,"Jump uses EA_DelayedJump from 24 through 31 units")
  state.origin=[-100.0,0.0,0.0];state.reachAreaNum=0;state.jumpReach=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelJump(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and input.speed==100.0 and input.dir==[1.0,0.0,0.0] and input.actionflags==0,"Jump run-up speed is five times distance to the predicted start")
  service.jumpRunStartFn=moveJumpRunStart;count=count+require(movement.jumpReachRunStart(runtime,state,router.reaches[1])==host.jumpStart,"Jump run-start delegates collision-accurate client prediction to the host");service.jumpRunStartFn=void

  router.reaches[1].travelType=aasRouting.TRAVEL_LADDER;router.reaches[1].finish=[10.0,0.0,10.0];state.origin=[0.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.travelLadder(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and (moved.flags&movement.MOVERESULT_MOVEMENTVIEW)!=0 and closeEnough(moved.moveDir[0],0.7071) and closeEnough(moved.moveDir[2],0.7071),"Ladder preserves normalized three-dimensional reach direction")
  count=count+require(closeEnough(moved.idealViewAngles[0],-71.565) and closeEnough(moved.idealViewAngles[1],0.0) and input.speed==0.0 and input.dir==[0.0,0.0,0.0] and (input.actionflags&ea.ACTION_MOVEFORWARD)!=0,"Ladder faces weighted vertical direction and emits zero-speed Move plus MoveForward")
  router.reaches[1].finish=[10.0,0.0,0.0];state.origin=[1.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;state.lastReachNum=0;state.lastGoalAreaNum=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_LADDER and (moved.flags&movement.MOVERESULT_MOVEMENTVIEW)!=0 and (input.actionflags&ea.ACTION_MOVEFORWARD)!=0 and state.reachabilityTime==16.0,"MoveToGoal dispatches Ladder and applies its six-second reach timeout")
  router.reaches[1].travelType=aasRouting.TRAVEL_BARRIERJUMP;state.origin=[1.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;state.lastReachNum=0;state.lastGoalAreaNum=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_BARRIERJUMP and moved.moveDir==[-1.0,0.0,0.0] and (input.actionflags&ea.ACTION_JUMP)!=0 and input.speed==0.0,"BarrierJump jumps inside the original nine-unit threshold")
  state.origin=[-10.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.travelBarrierJump(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[1.0,0.0,0.0] and input.speed==60.0 and (input.actionflags&ea.ACTION_JUMP)==0,"BarrierJump approaches at six times the capped start distance")
  state.origin=[5.0,0.0,5.0];state.velocity=[0.0,0.0,300.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.finishTravelBarrierJump(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[0.0,0.0,0.0] and input.speed==0.0,"BarrierJump finish does nothing while vertical velocity is at least 250")
  state.velocity=[0.0,0.0,200.0];moved=movement.finishTravelBarrierJump(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[1.0,0.0,0.0] and input.speed==400.0,"BarrierJump finish steers to the end near the apex and while descending")

  router.reaches[1].travelType=aasRouting.TRAVEL_WALKOFFLEDGE;state.origin=[1.0,0.0,0.0];state.velocity=[0.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;state.lastReachNum=0;state.lastGoalAreaNum=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_WALKOFFLEDGE and moved.moveDir==[1.0,0.0,0.0] and input.speed==100.0,"WalkOffLedge uses careful speed 100 for a near vertical drop")
  state.origin=[5.0,0.0,10.0];state.velocity=[0.0,0.0,-100.0];state.moveFlags=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_WALKOFFLEDGE and moved.moveDir==[1.0,0.0,0.0] and input.speed==65.0,"WalkOffLedge airborne finish applies original gravity air control")
  state.origin=[-100.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.travelWalkOffLedge(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and input.speed==400.0 and moved.moveDir==[1.0,0.0,0.0],"far vertical WalkOffLedge approach caps its distance-derived speed at 400")
  router.reaches[1].finish=[40.0,0.0,-20.0];state.origin=[-5.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.travelWalkOffLedge(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and closeEnough(input.speed,178.885) and moved.moveDir==[1.0,0.0,0.0],"wide WalkOffLedge uses AAS ballistic horizontal velocity")
  service.gravityFn=moveGravity;count=count+require(movement.gravity(runtime)==600.0,"air control reads live sv_gravity through the host service");service.gravityFn=void
  service.horizontalVelocityForJumpFn=moveHorizontalVelocity;count=count+require(movement.horizontalVelocityForJump(runtime,0.0,router.reaches[1].start,router.reaches[1].finish)==host.ballistic,"WalkOffLedge delegates live AAS physics settings through its ballistic callback");service.horizontalVelocityForJumpFn=void

  router.reaches[1].start=[0.0,0.0,0.0];router.reaches[1].finish=[10.0,0.0,0.0];router.reaches[1].travelType=aasRouting.TRAVEL_TELEPORT;state.origin=[1.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;state.lastReachNum=0;state.lastGoalAreaNum=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_TELEPORT and moved.moveDir==[-1.0,0.0,0.0] and input.speed==200.0,"Teleport approaches its center at speed 200 inside thirty units")
  state.moveFlags=movement.MFL_TELEPORTED;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelTeleport(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[0.0,0.0,0.0] and input.speed==0.0,"Teleport emits no movement while the engine reports MFL_TELEPORTED")
  state.origin=[0.0,0.0,-10.0];state.moveFlags=movement.MFL_SWIMMING;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelTeleport(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[0.0,0.0,1.0] and input.speed==200.0 and (moved.flags&movement.MOVERESULT_SWIMVIEW)!=0,"swimming Teleport retains vertical direction and marks SWIMVIEW")
  state.moveFlags=0;state.lastReachNum=1;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_TELEPORT and input.speed==0.0,"airborne Teleport finish is the original no-op")

  router.reaches[1].travelType=aasRouting.TRAVEL_ELEVATOR;state.origin=[0.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;service.elevatorStateFn=void;moved=movement.travelElevator(runtime,state,router.reaches[1])
  count=count+require(moved.failure and moved.type==aasRouting.TRAVEL_ELEVATOR,"Elevator refuses guessed mover state when its host query is absent")
  service.elevatorStateFn=moveElevatorState;service.barrierJumpFn=moveBarrierJump;host.elevator=movement.ElevatorState(true,true,[20.0,0.0,0.0],33.0);host.barrierHit=false;state.origin=[5.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.travelElevator(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[1.0,0.0,0.0] and input.speed==400.0,"bot on Elevator exits toward the reach end when vertically close")
  host.barrierHit=true;state.moveFlags=movement.MFL_ONGROUND;ea.resetInput(service.elementaryActions,state.client);ea.resetInput(service.elementaryActions,state.client);moved=movement.travelElevator(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and (state.moveFlags&movement.MFL_BARRIERJUMP)!=0 and (input.actionflags&ea.ACTION_JUMP)!=0 and input.speed==100.0,"Elevator barrier callback preserves BotCheckBarrierJump EA effects and state flag")
  host.barrierHit=false;host.elevator=movement.ElevatorState(false,false,[0.0,0.0,0.0],33.0);router.reaches[1].start=[10.0,0.0,0.0];router.reaches[1].finish=[100.0,0.0,0.0];state.origin=[0.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelElevator(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.type==movement.RESULTTYPE_ELEVATORUP and (moved.flags&movement.MOVERESULT_WAITING)!=0 and moved.moveDir==[1.0,0.0,0.0] and input.speed==60.0,"Elevator waits at its start while the platform is up")
  host.elevator=movement.ElevatorState(true,true,[0.0,0.0,0.0],33.0);state.origin=[0.0,0.0,20.0];router.reaches[1].finish=[10.0,0.0,100.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.finishTravelElevator(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[0.0,0.0,0.0] and input.dir==[0.0,0.0,-1.0] and input.speed==300.0,"Elevator airborne finish moves toward the vertically nearer platform center without publishing movedir")

  service.elevatorStateFn=void;service.barrierJumpFn=void;router.reaches[1].start=[0.0,0.0,0.0];router.reaches[1].finish=[10.0,0.0,0.0];router.reaches[1].travelType=aasRouting.TRAVEL_ROCKETJUMP;state.origin=[-10.0,0.0,0.0];state.viewAngles=[0.0,0.0,0.0];state.lastReachNum=1;state.jumpReach=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelWeaponJump(runtime,state,router.reaches[1],movement.WEAPON_ROCKET_LAUNCHER);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.weapon==movement.WEAPON_ROCKET_LAUNCHER and moved.flags==(movement.MOVERESULT_MOVEMENTVIEWSET|movement.MOVERESULT_MOVEMENTWEAPON) and input.speed==50.0 and input.weapon==movement.WEAPON_ROCKET_LAUNCHER and input.viewangles==[90.0,0.0,0.0],"RocketJump approaches while forcing downward view and rocket weapon")
  state.origin=[-1.0,0.0,0.0];state.viewAngles=[90.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);ea.resetInput(service.elementaryActions,state.client);moved=movement.travelWeaponJump(runtime,state,router.reaches[1],movement.WEAPON_ROCKET_LAUNCHER);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and state.jumpReach==1 and input.speed==400.0 and (input.actionflags&ea.ACTION_JUMP)!=0 and (input.actionflags&ea.ACTION_ATTACK)!=0,"aligned RocketJump fires, jumps and requests original speed 800")
  router.reaches[1].travelType=aasRouting.TRAVEL_BFGJUMP;state.origin=[-1.0,0.0,0.0];state.viewAngles=[0.0,0.0,0.0];state.jumpReach=0;ea.resetInput(service.elementaryActions,state.client);ea.resetInput(service.elementaryActions,state.client);moved=movement.travelWeaponJump(runtime,state,router.reaches[1],movement.WEAPON_BFG);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.weapon==movement.WEAPON_BFG and state.jumpReach==1 and (input.actionflags&ea.ACTION_ATTACK)!=0 and input.weapon==movement.WEAPON_BFG,"BFGJump preserves the pinned source's zero-initialized pre-alignment behavior")
  state.origin=[5.0,0.0,10.0];state.velocity=[0.0,0.0,-100.0];state.jumpReach=1;ea.resetInput(service.elementaryActions,state.client);moved=movement.finishTravelWeaponJump(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[1.0,0.0,0.0] and input.speed==65.0,"WeaponJump airborne finish shares original ballistic air control")

  router.reaches[1].travelType=aasRouting.TRAVEL_JUMPPAD;state.origin=[-10.0,0.0,0.0];state.velocity=[0.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.travelJumpPad(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[1.0,0.0,0.0] and input.speed==400.0,"JumpPad ground path walks directly to its reach start")
  state.origin=[5.0,0.0,10.0];state.velocity=[0.0,0.0,-100.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.finishTravelJumpPad(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[1.0,0.0,0.0] and input.speed==65.0,"JumpPad airborne finish applies air control and movement")
  state.origin=[1.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;state.lastReachNum=0;state.lastGoalAreaNum=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT)
  count=count+require(not moved.failure and moved.travelType==aasRouting.TRAVEL_JUMPPAD and state.reachabilityTime==20.0,"MoveToGoal dispatches JumpPad with its ten-second reach timeout")

  router.reaches[1].start=[0.0,0.0,10.0];router.reaches[1].finish=[10.0,0.0,0.0];router.reaches[1].travelType=aasRouting.TRAVEL_SWIM;state.origin=[0.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.travelSwim(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[0.0,0.0,1.0] and moved.idealViewAngles==[-90.0,0.0,0.0] and (moved.flags&movement.MOVERESULT_SWIMVIEW)!=0 and input.speed==400.0,"Swim uses full 3D direction, view and SWIMVIEW in both switch paths")
  service.randomFn=moveRandom;router.reaches[1].travelType=aasRouting.TRAVEL_WATERJUMP;router.reaches[1].finish=[10.0,0.0,0.0];state.moveFlags=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelWaterJump(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and closeEnough(moved.moveDir[0],0.5547) and closeEnough(moved.moveDir[2],0.83205) and (moved.flags&movement.MOVERESULT_MOVEMENTVIEW)!=0 and (input.actionflags&ea.ACTION_MOVEFORWARD)!=0 and (input.actionflags&ea.ACTION_MOVEUP)!=0,"WaterJump adds the original vertical impulse and close-range forward/up actions")
  state.moveFlags=movement.MFL_WATERJUMP;ea.resetInput(service.elementaryActions,state.client);moved=movement.finishTravelWaterJump(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[0.0,0.0,0.0] and input.speed==0.0,"WaterJump finish is idle while MFL_WATERJUMP remains set")
  service.pointContentsFn=movePointContents;host.contents=movement.CONTENTS_WATER;state.moveFlags=0;ea.resetInput(service.elementaryActions,state.client);moved=movement.finishTravelWaterJump(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and closeEnough(moved.moveDir[0],0.14142) and closeEnough(moved.moveDir[2],0.98994) and input.speed==400.0 and (moved.flags&movement.MOVERESULT_MOVEMENTVIEW)!=0,"WaterJump finish verifies liquid below and steers upward with three crandom samples")

  router.reaches[1].travelType=aasRouting.TRAVEL_FUNCBOB;service.funcBobStateFn=void;moved=movement.travelFuncBob(runtime,state,router.reaches[1]);count=count+require(moved.failure and moved.type==aasRouting.TRAVEL_FUNCBOB,"FuncBob refuses missing live brush-model state")
  service.funcBobStateFn=moveFuncBobState;host.funcBob=movement.FuncBobState(true,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[20.0,0.0,0.0],33.0);state.origin=[5.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelFuncBob(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[1.0,0.0,0.0] and input.speed==400.0,"bot on FuncBob exits when the mover is within 24 units of its endpoint")
  router.reaches[1].start=[10.0,0.0,0.0];router.reaches[1].finish=[100.0,0.0,0.0];host.funcBob=movement.FuncBobState(false,[0.0,0.0,0.0],[100.0,0.0,0.0],[30.0,0.0,0.0],[0.0,0.0,0.0],33.0);state.origin=[0.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.travelFuncBob(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.type==movement.RESULTTYPE_WAITFORFUNCBOBBING and (moved.flags&movement.MOVERESULT_WAITING)!=0 and moved.moveDir==[1.0,0.0,0.0] and input.speed==60.0,"FuncBob waits at the reach start while the mover is away")
  router.reaches[1].finish=[10.0,0.0,0.0];host.funcBob=movement.FuncBobState(false,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[20.0,0.0,0.0],33.0);ea.resetInput(service.elementaryActions,state.client);moved=movement.finishTravelFuncBob(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.moveDir==[0.0,0.0,0.0] and input.dir==[0.0,0.0,0.0] and input.speed==60.0,"FuncBob finish preserves Baseq3's bob-direction argument at the endpoint")

  service.grappleConfigFn=moveGrappleConfig;service.grappleStateFn=moveGrappleState;service.grappleTraceFn=moveGrappleTrace;router.reaches[1].start=[0.0,0.0,0.0];router.reaches[1].finish=[10.0,0.0,0.0];router.reaches[1].travelType=aasRouting.TRAVEL_GRAPPLEHOOK;host.grappleEnd=[10.0,0.0,0.0];state.origin=[-10.0,0.0,0.0];state.viewOffset=[0.0,0.0,0.0];state.viewAngles=[20.0,0.0,0.0];state.moveFlags=0;state.reachAreaNum=0;state.lastReachNum=1;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelGrapple(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and moved.weapon==movement.WEAPON_GRAPPLE and moved.flags==(movement.MOVERESULT_MOVEMENTVIEW|movement.MOVERESULT_MOVEMENTWEAPON) and moved.moveDir==[1.0,0.0,0.0] and input.speed==40.0,"inactive Grapple approaches its start while publishing view and movement weapon")
  state.origin=[-1.0,0.0,0.0];state.viewAngles=[0.0,0.0,0.0];ea.resetInput(service.elementaryActions,state.client);moved=movement.travelGrapple(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and (state.moveFlags&movement.MFL_ACTIVEGRAPPLE)!=0 and state.lastGrappleDist==999999.0 and (input.actionflags&ea.ACTION_ATTACK)!=0,"aligned Grapple validates its trace and activates attack mode")
  host.grappleState=1;state.origin=[0.0,0.0,0.0];state.lastGrappleDist=20.0;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelGrapple(runtime,state,router.reaches[1]);input=ea.getInput(service.elementaryActions,state.client,0.05)
  count=count+require(not moved.failure and state.lastGrappleDist==10.0 and (state.moveFlags&movement.MFL_ACTIVEGRAPPLE)!=0 and (input.actionflags&ea.ACTION_ATTACK)!=0,"active visible Grapple keeps attacking and records horizontal distance")
  state.lastGrappleDist=10.5;ea.resetInput(service.elementaryActions,state.client);moved=movement.travelGrapple(runtime,state,router.reaches[1]);count=count+require(not moved.failure and (state.moveFlags&movement.MFL_ACTIVEGRAPPLE)==0 and (state.moveFlags&movement.MFL_GRAPPLERESET)!=0 and state.reachabilityTime==0.0,"Grapple stops when close and no longer gaining one unit")
  state.moveFlags=0;state.origin=[-1.0,0.0,0.0];state.viewAngles=[0.0,0.0,0.0];host.grappleEnd=[100.0,0.0,0.0];moved=movement.travelGrapple(runtime,state,router.reaches[1]);count=count+require(moved.failure and moved.type==0,"Grapple rejects a trace ending more than sixteen units from its target")
  state.moveFlags=movement.MFL_ACTIVEGRAPPLE;state.grappleVisibleTime=2.0;router.reaches[1].travelType=aasRouting.TRAVEL_WALK;count=count+require(movement.resetGrapple(runtime,state) and (state.moveFlags&movement.MFL_ACTIVEGRAPPLE)==0 and state.grappleVisibleTime==0.0,"leaving Grapple reach clears active and visibility state")

  router.reaches[1].finish=[10.0,0.0,0.0];router.reaches[1].travelType=aasRouting.TRAVEL_DOUBLEJUMP;moved=movement.unsupportedTravel(router.reaches[1])
  count=count+require(moved.failure and moved.type==aasRouting.TRAVEL_DOUBLEJUMP and moved.travelType==aasRouting.TRAVEL_DOUBLEJUMP,"remaining unsupported travel type produces explicit failure")
  router.reaches[1].travelType=aasRouting.TRAVEL_WALK
  state.moveFlags=movement.MFL_ONGROUND;service.walkDirectionFn=moveWalkDirection
  count=count+require(movement.moveInDirection(runtime,handle,[3.0,4.0,0.0],250.0,movement.MOVE_WALK) and len(host.walks)==1 and host.walks[0][0]==[3.0,4.0,0.0],"MoveInDirection delegates grounded safety prediction without normalizing input")

  vm=Machine(bytes(4096,0),4095);base=3800;initAddress=100;putInitMove(vm,initAddress,init);state.moveFlags=movement.MFL_TELEPORTED|4;setMoveArg(vm,base,1,handle);setMoveArg(vm,base,2,initAddress)
  count=count+require(traps.dispatch(runtime,vm,base,movement.OP_INIT_MOVE_STATE)==0 and state.origin==init.origin and state.moveFlags==(4|movement.MFL_ONGROUND|movement.MFL_WALK),"InitMoveState syscall decodes exact 68-byte ABI")
  originAddress=200;putMoveVector(vm.data,originAddress,[1.0,0.0,0.0]);host.groundEntity=movement.ENTITYNUM_WORLD;setMoveArg(vm,base,1,originAddress);setMoveArg(vm,base,2,17);count=count+require(traps.dispatch(runtime,vm,base,movement.OP_REACHABILITY_AREA)==1,"ReachabilityArea syscall decodes origin and client")
  state.lastReachNum=1;state.lastAreaNum=1;state.lastGoalAreaNum=4;state.origin=[1.0,0.0,0.0];goalAddress=300;targetAddress=400;putMoveGoal(vm,goalAddress,goal);putMoveVector(vm.data,targetAddress,[0.0,0.0,0.0]);setMoveArg(vm,base,1,handle);setMoveArg(vm,base,2,goalAddress);setMoveArg(vm,base,3,aasRouting.TFL_DEFAULT);setMoveArg(vm,base,4,n.floatBits(5.0));setMoveArg(vm,base,5,targetAddress)
  count=count+require(traps.dispatch(runtime,vm,base,movement.OP_MOVEMENT_VIEW_TARGET)==1 and n.bitsFloat(n.readU32(vm.data,targetAddress))==4.0,"MovementViewTarget syscall marshals goal, float bits and vec3 output")
  resultAddress=500;for index=0 to 63 vm.data[resultAddress+index]=255 end for;state.origin=[1.0,0.0,0.0];state.moveFlags=movement.MFL_ONGROUND;state.lastReachNum=0;state.lastGoalAreaNum=0;putMoveGoal(vm,goalAddress,goal);setMoveArg(vm,base,1,resultAddress);setMoveArg(vm,base,2,handle);setMoveArg(vm,base,3,goalAddress);setMoveArg(vm,base,4,aasRouting.TFL_DEFAULT)
  count=count+require(traps.dispatch(runtime,vm,base,movement.OP_MOVE_TO_GOAL)==0 and n.readI32(vm.data,resultAddress)==0 and n.readI32(vm.data,resultAddress+16)==aasRouting.TRAVEL_WALK and n.bitsFloat(n.readU32(vm.data,resultAddress+28))==1.0,"MoveToGoal syscall writes exact moveresult fields")
  count=count+require(vm.data[resultAddress+51]==0 and vm.data[resultAddress+52]==255,"bot_moveresult_t ABI is exactly 52 bytes")
  directionAddress=600;putMoveVector(vm.data,directionAddress,[3.0,4.0,0.0]);setMoveArg(vm,base,1,handle);setMoveArg(vm,base,2,directionAddress);setMoveArg(vm,base,3,n.floatBits(250.0));setMoveArg(vm,base,4,movement.MOVE_WALK);count=count+require(traps.dispatch(runtime,vm,base,movement.OP_MOVE_IN_DIRECTION)==1 and len(host.walks)==2,"MoveInDirection syscall decodes float speed and movement type")
  count=count+require(movement.supportsTrap(549) and movement.supportsTrap(550) and movement.supportsTrap(557),"move-runtime trap coverage includes walk core")
  print("PASS: "+str(count)+" AI move-runtime contracts opcodes=549,550,553,554,557");return 0
end function
