import mq3.format.aas as aas
import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_routing as aasRouting
import mq3.botlib.ai_resource_pools as resources
import mq3.botlib.ai_move_runtime as movement
import mq3.botlib.ai_move_syscalls as traps
import mq3.botlib.elementary_actions as ea
import mq3.compat.numeric as n
import std.fs as fs

struct Harness groundEntity walks end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7548,"AI move-runtime contract: "+label) end if;return 1 end function
function moveGround(context,start,mins,maxs,finish,client,contents) return movement.GroundTrace(false,0.5,context.groundEntity,finish) end function
function moveEntityModel(context,entity) return 9 end function
function moveModelType(context,model) return movement.MODELTYPE_FUNC_PLAT end function
function moveModelReachability(context,model) return 2 end function
function moveWalkDirection(context,state,direction,speed,type) context.walks=context.walks+[[direction,speed,type]];return true end function
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
  count=0;pools=resources.create();handle=resources.allocMoveState(pools);host=Harness(movement.ENTITYNUM_WORLD,[]);service=movement.services(host);service.elementaryActions=ea.create(8,void,void);runtime=movement.create(pools,aasState,router,service);state=resources.moveState(pools,handle)
  state.moveFlags=movement.MFL_ONGROUND|movement.MFL_WATERJUMP|movement.MFL_TELEPORTED|movement.MFL_GRAPPLEPULL|movement.MFL_WALK|1|4|128
  init=movement.InitMove([1.0,2.0,3.0],[4.0,5.0,6.0],[7.0,8.0,9.0],17,5,0.05,aasRuntime.PRESENCE_NORMAL,[10.0,20.0,30.0],movement.MFL_ONGROUND|movement.MFL_WALK)
  count=count+require(movement.initMoveState(runtime,handle,init)==0 and state.origin==[1.0,2.0,3.0] and state.velocity==[4.0,5.0,6.0] and state.viewOffset==[7.0,8.0,9.0],"InitMoveState copies three input vectors")
  count=count+require(state.entityNum==17 and state.client==5 and state.thinkTime==0.05 and state.presenceType==aasRuntime.PRESENCE_NORMAL and state.viewAngles==[10.0,20.0,30.0],"InitMoveState copies scalar and view inputs")
  count=count+require(state.moveFlags==(1|4|128|movement.MFL_ONGROUND|movement.MFL_WALK),"InitMoveState replaces only five externally owned flags")

  count=count+require(movement.fuzzyPointReachabilityArea(runtime,[1.0,0.0,0.0])==1,"fuzzy reachability returns directly reachable point area")
  count=count+require(movement.reachabilityArea(runtime,[1.0,0.0,0.0],17)==1,"reachability falls back to fuzzy point without host ground trace")
  service.groundTraceFn=moveGround;count=count+require(movement.reachabilityArea(runtime,[1.0,0.0,0.0],17)==1,"world ground trace returns fuzzy point area")
  host.groundEntity=7;service.entityModelFn=moveEntityModel;service.modelTypeFn=moveModelType;service.modelReachabilityFn=moveModelReachability
  count=count+require(movement.reachabilityArea(runtime,[1.0,0.0,0.0],17)==3,"platform ground resolves its model reachability destination")

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
  router.reaches[1].travelType=aasRouting.TRAVEL_CROUCH;state.lastReachNum=0;state.lastGoalAreaNum=0;moved=movement.moveToGoal(runtime,handle,goal,aasRouting.TFL_DEFAULT)
  count=count+require(moved.failure and moved.type==aasRouting.TRAVEL_CROUCH and moved.travelType==aasRouting.TRAVEL_CROUCH,"unsupported travel type produces explicit failure")
  router.reaches[1].travelType=aasRouting.TRAVEL_WALK;service.walkDirectionFn=moveWalkDirection
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
