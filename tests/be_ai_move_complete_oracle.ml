import mq3.botlib.be_ai_move as port
import mq3.botlib.ai_move_runtime as move
import mq3.botlib.aas_routing as routing
import mq3.format.aas as formatAas
function time(type) reach=formatAas.Reachability(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],type,0);print("time:"+str(type)+"="+str(port.BotReachabilityTime(reach)));return void end function
function bit(value) if value then return 1 end if;return 0 end function
function main(args)
 print("angle="+str(port.AngleDiff(350.0,10.0))+","+str(port.AngleDiff(10.0,350.0)))
 print("line="+str(port.DistanceFromLineSquared([5.0,3.0,0.0],[0.0,0.0,0.0],[10.0,0.0,0.0]))+","+str(port.DistanceFromLineSquared([15.0,4.0,0.0],[0.0,0.0,0.0],[10.0,0.0,0.0])))
 print("vector="+str(port.VectorDistanceSquared([0.0,0.0,0.0],[3.0,4.0,0.0])))
 point=[0.0,0.0];ok=port.Intersection([0.0,0.0],[10.0,10.0],[0.0,10.0],[10.0,0.0],point);print("intersection="+str(bit(ok))+","+str(point[0])+","+str(point[1]))
 value=port.BotAddToTarget([0.0,0.0,0.0],[10.0,0.0,0.0],4.0,0.0,[0.0,0.0,0.0]);print("target="+str(bit(value[0]))+","+str(value[1])+","+str(value[2][0]))
 value=port.BotAddToTarget([0.0,0.0,0.0],[10.0,0.0,0.0],20.0,0.0,[0.0,0.0,0.0]);print("target2="+str(bit(value[0]))+","+str(value[1])+","+str(value[2][0]))
 result=move.MoveResult(true,9,true,9,9,9,9,[7.0,0.0,0.0],[8.0,0.0,0.0]);port.BotClearMoveResult(result);print("clear="+str(bit(result.failure))+","+str(result.type)+","+str(bit(result.blocked))+","+str(result.blockEntity)+","+str(result.travelType)+","+str(result.flags)+","+str(result.moveDir[0]))
 time(routing.TRAVEL_WALK);time(routing.TRAVEL_LADDER);time(routing.TRAVEL_ELEVATOR);time(routing.TRAVEL_GRAPPLEHOOK);time(routing.TRAVEL_ROCKETJUMP);time(routing.TRAVEL_JUMPPAD);return 0
end function
