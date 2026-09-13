import mq3.client.playable_enemy_hitscan as hitscan
import mq3.client.playable_enemy_ai as enemy
import mq3.client.playable_targets as targets

struct MockPlane fraction normal end struct
struct MockResult trace endpos end struct
struct TraceContext fractions index end struct

function require(ok,message) if not ok then return error(7631,message) end if;return 1 end function
function entity(classname,origin) return [["classname",classname],["origin",origin]] end function
function fakeTrace(context,startPoint,endPoint)
  fraction=context.fractions[context.index];context.index=context.index+1
  finish=[];for axis=0 to 2 finish=finish+[startPoint[axis]+(endPoint[axis]-startPoint[axis])*fraction] end for
  return MockResult(MockPlane(fraction,[-1.0,0.0,0.0]),finish)
end function

function main(args)
  count=0;combat=targets.fromEntities([entity("info_player_deathmatch","0 0 0"),entity("info_player_deathmatch","100 0 0"),entity("info_player_deathmatch","0 200 0")],0)
  ai=enemy.state(combat,100);ai.events=[enemy.Event(7,-1,0),enemy.Event(7,1,1)]
  muzzles=[[110.0,2.0,28.0],void]
  shots=hitscan.fireWithTrace(fakeTrace,TraceContext([1.0,0.25],0),ai,combat,[0.0,0.0,20.0],muzzles,100)
  count=count+require(hitscan.SHOT_MASK==0x6000001 and len(shots)==2,"two Machinegun traces use shot mask")
  count=count+require(shots[0].start==muzzles[0] and shots[0].playerHit and not shots[0].worldHit,"retail muzzle reaches player")
  count=count+require(shots[0].endPoint==[0.0,0.0,20.0] and shots[0].damage==7 and shots[0].side==-1,"player hit payload")
  count=count+require(shots[1].start==[combat.targets[1].origin[0],combat.targets[1].origin[1],combat.targets[1].origin[2]+20.0],"missing tag uses chest fallback")
  count=count+require(shots[1].worldHit and not shots[1].playerHit and shots[1].normal==[-1.0,0.0,0.0],"BSP shields player")
  count=count+require(shots[1].endPoint!=[0.0,0.0,20.0] and shots[1].at==100,"world endpoint and time retained")
  combat.targets[0].alive=false;only=hitscan.fireWithTrace(fakeTrace,TraceContext([1.0],0),ai,combat,[0.0,0.0,20.0],muzzles,101)
  count=count+require(len(only)==1 and only[0].attacker==1,"dead attacker is skipped")
  count=count+require(try(hitscan.fireWithTrace(void,void,ai,combat,[0.0,0.0,20.0],muzzles,1)) is error,"missing trace rejected")
  count=count+require(try(hitscan.fireWithTrace(fakeTrace,TraceContext([],0),ai,combat,[0.0,0.0],muzzles,1)) is error,"invalid player point rejected")
  count=count+require(try(hitscan.fireWithTrace(fakeTrace,TraceContext([],0),ai,combat,[0.0,0.0,20.0],[[0.0,0.0,0.0]],1)) is error,"muzzle count rejected")
  bad=enemy.state(combat,0);bad.events=[enemy.Event(7,1,9)]
  count=count+require(try(hitscan.fireWithTrace(fakeTrace,TraceContext([],0),bad,combat,[0.0,0.0,20.0],muzzles,1)) is error,"attacker range rejected")
  count=count+require(try(hitscan.fireWithTrace(fakeTrace,TraceContext([],0),ai,combat,[0.0,0.0,20.0],muzzles,-1)) is error,"negative time rejected")
  print("PASS: "+str(count)+" playable enemy-hitscan contracts");return 0
end function
