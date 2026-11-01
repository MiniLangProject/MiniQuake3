import mq3.format.aas as formatAas
import mq3.botlib.aas_runtime as runtimeAas
import mq3.botlib.aas_routing as routing
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_move_runtime as move
import mq3.botlib.be_ai_move as port
import mq3.botlib.elementary_actions as ea
import std.fs as fs

struct Host walks setup shutdown end struct
function req(ok,label) if not ok then return error(7549,"be_ai_move contract: "+label) end if;return 1 end function
// Keep the host callback name distinct from elementary_actions.walk. The
// frozen compiler's whole-program object emitter resolves duplicate short
// function names before package aliases and would otherwise bind this
// five-argument callback at the two-argument EA call site.
function hostWalkDirection(context,state,direction,speed,type) context.walks=context.walks+[[direction,speed,type]];return true end function
function traceVisible(context,start,finish,entity,contents) if finish[0]>=5.0 then return 1.0 end if;return 0.5 end function
function mover(context,model) return port.MoverInfo([-10.0,-20.0,-5.0],[10.0,20.0,5.0],[0.0,0.0,0.0],[4.0,8.0,-20.0]) end function
function setup(context) context.setup=context.setup+1;return void end function
function shutdown(context) context.shutdown=context.shutdown+1;return void end function
function close(a,b) value=a-b;if value<0.0 then value=0.0-value end if;return value<0.01 end function

function main(args)
 if len(args)!=1 then return 2 end if;map=formatAas.load(fs.readAllBytes(args[0]));if map is error then return map end if;aasState=runtimeAas.create(map);router=routing.create(aasState);pool=pools.create();host=Host([],0,0);services=move.services(host);services.elementaryActions=ea.create(8,void,void);services.walkDirectionFn=hostWalkDirection;movement=move.create(pool,aasState,router,services);adapter=port.create(movement);adapter.context=host;adapter.visibleTraceFn=traceVisible;adapter.moverInfoFn=mover;adapter.setupFn=setup;adapter.shutdownFn=shutdown;checks=0
 handle=port.BotAllocMoveState(adapter);checks=checks+req(handle==1 and port.BotMoveStateFromHandle(adapter,handle)!=void,"move state allocation")
 init=move.InitMove([1.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,24.0],17,2,0.05,runtimeAas.PRESENCE_NORMAL,[0.0,0.0,0.0],move.MFL_ONGROUND);port.BotInitMoveState(adapter,handle,init);state=port.BotMoveStateFromHandle(adapter,handle);checks=checks+req(state.origin==init.origin and state.client==2 and state.moveFlags==move.MFL_ONGROUND,"move state initialization")
 runtimeAas.setTime(aasState,10.0);port.BotAddToAvoidReach(adapter,state,7,5.0);runtimeAas.setTime(aasState,12.0);port.BotAddToAvoidReach(adapter,state,7,5.0);checks=checks+req(state.avoidReach[0]==7 and state.avoidReachTimes[0]==17.0 and state.avoidReachTries[0]==2,"avoid reach retry transition")
 port.BotAddAvoidSpot(adapter,handle,[5.0,0.0,0.0],3.0,port.AVOID_DONTBLOCK);checks=checks+req(state.numAvoidSpots==1 and state.avoidSpots[0].origin==[5.0,0.0,0.0],"avoid spot addition")
 reach=router.reaches[1];spots=[pools.AvoidSpot([3.0,0.0,0.0],2.0,port.AVOID_ALWAYS)];checks=checks+req(port.BotAvoidSpots([0.0,0.0,0.0],reach,spots,1)==port.AVOID_ALWAYS,"avoid spot reach rejection")
 point=[0.0,0.0];checks=checks+req(port.Intersection([0.0,0.0],[10.0,10.0],[0.0,10.0],[10.0,0.0],point) and point==[5.0,5.0],"line intersection")
 entities=[port.BrushEntity("func_plat",3),port.BrushEntity("func_bobbing",4),port.BrushEntity("func_door",5),port.BrushEntity("func_static",6)];port.BotSetBrushModelTypes(adapter,entities);checks=checks+req(adapter.modelTypes[3]==port.MODELTYPE_FUNC_PLAT and adapter.modelTypes[4]==port.MODELTYPE_FUNC_BOB and adapter.modelTypes[5]==port.MODELTYPE_FUNC_DOOR and adapter.modelTypes[6]==port.MODELTYPE_FUNC_STATIC,"brush model classification")
 packed=formatAas.Reachability(2,(1<<16)|3,(10<<16)|30,[0.0,0.0,50.0],[0.0,0.0,0.0],routing.TRAVEL_FUNCBOB,10);points=port.BotFuncBobStartEnd(adapter,packed);checks=checks+req(points[0]==[10.0,0.0,0.0] and points[1]==[30.0,0.0,0.0] and points[2]==[4.0,0.0,0.0],"func bob packed endpoints")
 checks=checks+req(port.MoverBottomCenter(adapter,packed)==[4.0,8.0,50.0] and port.MoverDown(adapter,packed),"mover bottom and down state")
 checks=checks+req(not port.BotVisible(adapter,0,[0.0,0.0,0.0],[4.0,0.0,0.0]) and port.BotVisible(adapter,0,[0.0,0.0,0.0],[5.0,0.0,0.0]),"visibility trace")
 checks=checks+req(port.BotValidTravel(adapter,[0.0,0.0,0.0],reach,routing.TFL_DEFAULT),"travel and destination flags")
 goal=pools.Goal([30.0,0.0,0.0],4,[-1.0,-1.0,-1.0],[1.0,1.0,1.0],0,9,0,0);selected=port.BotGetReachabilityToGoal(adapter,[1.0,0.0,0.0],1,0,0,[0],[0.0],[0],goal,routing.TFL_DEFAULT,routing.TFL_DEFAULT,[]);checks=checks+req(selected[0]==1,"route reachability selection")
 state.origin=[0.0,0.0,0.0];ea.resetInput(services.elementaryActions,state.client);finished=port.BotFinishTravel_Walk(adapter,state,reach);input=ea.getInput(services.elementaryActions,state.client,0.05);checks=checks+req(not finished.failure and close(input.speed,30.0),"walk finish speed")
 ea.resetInput(services.elementaryActions,state.client);checks=checks+req(port.BotSwimInDirection(adapter,state,[3.0,4.0,0.0],200.0,move.MOVE_WALK),"swim movement action");input=ea.getInput(services.elementaryActions,state.client,0.05);checks=checks+req(close(input.dir[0],0.6) and close(input.dir[1],0.8) and input.dir[2]==0.0 and input.speed==200.0,"swim normalized direction")
 state.moveFlags=move.MFL_SWIMMING;state.origin=[0.0,0.0,0.0];swimGoal=pools.Goal([0.0,0.0,10.0],1,[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0,0);ea.resetInput(services.elementaryActions,state.client);result=port.BotMoveInGoalArea(adapter,state,swimGoal);checks=checks+req(result.travelType==routing.TRAVEL_SWIM and result.moveDir==[0.0,0.0,1.0] and (result.flags&move.MOVERESULT_SWIMVIEW)!=0,"swimming goal movement")
 port.BotSetupMoveAI(adapter,entities);checks=checks+req(host.setup==1,"setup lifecycle");chatHandle=pools.allocChatState(pool);port.BotShutdownMoveAI(adapter);checks=checks+req(host.shutdown==1 and port.BotMoveStateFromHandle(adapter,handle)==void and pools.chatState(pool,chatHandle)!=void,"move-only shutdown lifecycle")
 print("PASS: "+str(checks)+" complete be_ai_move adapter contracts");return 0
end function
