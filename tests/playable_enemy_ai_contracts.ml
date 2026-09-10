import mq3.client.playable_enemy_ai as enemy
import mq3.client.playable_targets as targets

struct SightTrace fraction end struct
struct Result trace endpos end struct
struct Context fractions index end struct

function require(ok,message) if not ok then return error(7541,message) end if;return 1 end function
function entity(classname,origin) return [["classname",classname],["origin",origin]] end function
function fakeTrace(context,startPoint,endPoint)
  fraction=context.fractions[context.index];context.index=context.index+1
  return Result(SightTrace(fraction),endPoint)
end function

function targetState()
  return targets.fromEntities([entity("info_player_deathmatch","0 0 0"),entity("info_player_deathmatch","1200 0 0"),entity("info_player_deathmatch","100 0 0")],0)
end function

function main(args)
  count=0;combat=targetState();ai=enemy.state(combat,0)
  count=count+require(len(ai.brains)==2 and ai.events==[] and ai.lastTime==0,"state mirrors targets")
  count=count+require(ai.brains[0].strafeSide==1 and ai.brains[1].strafeSide==-1,"spawn parity selects deterministic side")
  clear=Context([1.0,1.0],0);events=enemy.stepWithTrace(fakeTrace,clear,ai,combat,[0.0,0.0,20.0],500,100)
  count=count+require(not (events is error) and len(events)==1,"visible in-range target attacks")
  count=count+require(events[0].damage==7 and events[0].attacker==1 and events[0].side==-1,"damage event identifies attacker and side")
  count=count+require(ai.visibleCount==2,"visibility count")
  count=count+require(ai.brains[0].mode=="chase" and combat.targets[0].origin[0]<1200.0,"distant enemy chases")
  count=count+require(ai.brains[1].mode=="strafe" and combat.targets[1].origin[1]>0.0,"near enemy strafes")
  again=enemy.stepWithTrace(fakeTrace,Context([1.0,1.0],0),ai,combat,[0.0,0.0,20.0],600,100)
  count=count+require(len(again)==0,"attack cooldown suppresses repeat")
  ready=enemy.stepWithTrace(fakeTrace,Context([1.0,1.0],0),ai,combat,[0.0,0.0,20.0],1200,100)
  count=count+require(len(ready)>=1,"attack resumes at cooldown deadline")
  blockedState=targetState();blockedAi=enemy.state(blockedState,0)
  blocked=enemy.stepWithTrace(fakeTrace,Context([0.4,0.2],0),blockedAi,blockedState,[0.0,0.0,20.0],1000,100)
  count=count+require(len(blocked)==0 and blockedAi.visibleCount==0,"world obstruction prevents attacks")
  count=count+require(blockedAi.brains[0].mode=="patrol" and blockedState.targets[0].origin!=blockedState.targets[0].spawnOrigin,"blocked opponents patrol around spawn")
  deadState=targetState();deadState.targets[0].alive=false;deadAi=enemy.state(deadState,0)
  dead=enemy.stepWithTrace(fakeTrace,Context([1.0],0),deadAi,deadState,[0.0,0.0,20.0],1000,16)
  count=count+require(deadAi.brains[0].mode=="dead" and len(dead)==1 and dead[0].attacker==1,"dead target neither traces nor attacks")
  deterministicA=targetState();deterministicB=targetState();a=enemy.state(deterministicA,0);b=enemy.state(deterministicB,0)
  enemy.stepWithTrace(fakeTrace,Context([0.0,0.0],0),a,deterministicA,[0.0,0.0,20.0],1234,16)
  enemy.stepWithTrace(fakeTrace,Context([0.0,0.0],0),b,deterministicB,[0.0,0.0,20.0],1234,16)
  count=count+require(deterministicA.targets[0].origin==deterministicB.targets[0].origin,"same inputs produce same patrol")
  count=count+require(try(enemy.state(void,0)) is error and try(enemy.state(combat,-1)) is error,"invalid state inputs rejected")
  count=count+require(try(enemy.stepWithTrace(fakeTrace,void,void,combat,[0.0,0.0,0.0],0,0)) is error,"missing AI rejected")
  count=count+require(try(enemy.stepWithTrace(fakeTrace,void,ai,combat,[0.0,0.0],0,0)) is error,"invalid player vector rejected")
  count=count+require(try(enemy.stepWithTrace(fakeTrace,void,ai,combat,[0.0,0.0,0.0],-1,0)) is error,"negative absolute time rejected")
  print("PASS: "+str(count)+" playable enemy-AI contracts");return 0
end function
