import mq3.format.pk3 as pk3
import mq3.format.aas as formatAas
import mq3.botlib.aas_runtime as runtimeAas
import mq3.botlib.aas_routing as routing
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_move_runtime as move
import mq3.botlib.be_ai_move as port

function req(ok,label) if not ok then return error(7550,"be_ai_move retail: "+label) end if;return 1 end function
function center(map,areaNum) return formatAas.area(map,areaNum).center end function
function main(args)
 if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;data=pk3.read(archive,"maps/q3dm1.aas");map=formatAas.load(data);if map is error then return map end if;aasState=runtimeAas.create(map);router=routing.create(aasState);pool=pools.create();movement=move.create(pool,aasState,router,move.services(void));adapter=port.create(movement);checks=0
 handle=port.BotAllocMoveState(adapter);state=port.BotMoveStateFromHandle(adapter,handle);state.origin=center(map,2);state.areaNum=2;goal=pools.Goal(center(map,10),10,[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0,0);selected=port.BotGetReachabilityToGoal(adapter,state.origin,2,0,0,[0],[0.0],[0],goal,routing.TFL_DEFAULT,routing.TFL_DEFAULT,[])
 checks=checks+req(selected[0]==2,"retail q3dm1 2-to-10 first reach");reach=router.reaches[selected[0]];checks=checks+req(port.BotValidTravel(adapter,state.origin,reach,routing.TFL_DEFAULT),"retail reach travel flags");checks=checks+req(port.BotReachabilityTime(reach)==5,"retail walk timeout")
 predicted=port.BotMovementViewTarget(adapter,handle,goal,routing.TFL_DEFAULT,64.0,[0.0,0.0,0.0]);checks=checks+req(not predicted.found,"view target requires established last reach")
 state.lastReachNum=selected[0];state.lastAreaNum=2;state.lastGoalAreaNum=10;predicted=port.BotMovementViewTarget(adapter,handle,goal,routing.TFL_DEFAULT,64.0,[0.0,0.0,0.0]);checks=checks+req(predicted.found and predicted.target!=state.origin,"retail route lookahead")
 print("PASS: "+str(checks)+" retail q3dm1 movement contracts bytes="+str(len(data))+" reach="+str(selected[0])+" target="+str(predicted.target));return 0
end function
