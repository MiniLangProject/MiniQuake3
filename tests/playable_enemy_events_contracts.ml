import mq3.client.playable_enemy_events as events
import mq3.client.playable_enemy_ai as enemy
import mq3.client.playable_targets as targets

function require(ok,message) if not ok then return error(7551,message) end if;return 1 end function
function entity(classname,origin) return [["classname",classname],["origin",origin]] end function
function targetState() return targets.fromEntities([entity("info_player_deathmatch","0 0 0"),entity("info_player_deathmatch","300 0 0")],0) end function

function main(args)
  count=0;combat=targetState();ai=enemy.state(combat,100);state=events.state(combat,100)
  count=count+require(len(state.tracks)==1 and state.events==[] and state.lastTime==100,"state mirrors targets")
  ai.brains[0].mode="chase";combat.targets[0].origin[0]=290.0
  inputs=events.update(state,combat,ai,120)
  count=count+require(len(inputs)==1 and inputs[0].targetIndex==0,"one input per target")
  count=count+require(inputs[0].action=="run" and inputs[0].lowerAnimation==events.LEGS_RUN,"chase selects run")
  count=count+require(inputs[0].upperAnimation==events.TORSO_STAND and inputs[0].elapsedMilliseconds==0,"run begins with standing torso")
  ai.events=[enemy.Event(7,1,0)];inputs=events.update(state,combat,ai,200)
  count=count+require(inputs[0].action=="attack" and inputs[0].upperAnimation==events.TORSO_ATTACK,"attack event selects torso attack")
  count=count+require(len(state.events)==1 and state.events[0].kind=="attack" and state.events[0].targetIndex==0,"attack transition emitted")
  ai.events=[];inputs=events.update(state,combat,ai,400)
  count=count+require(inputs[0].action=="attack" and inputs[0].elapsedMilliseconds==200 and state.events==[],"attack persists without duplicate event")
  combat.targets[0].health=66;inputs=events.update(state,combat,ai,410)
  count=count+require(inputs[0].action=="pain" and inputs[0].upperAnimation==events.TORSO_GESTURE,"damage selects pain")
  count=count+require(state.events[0].kind=="pain" and state.events[0].at==410,"pain event timestamp")
  inputs=events.update(state,combat,ai,700)
  count=count+require(inputs[0].action=="pain" and inputs[0].elapsedMilliseconds==290,"pain duration persists")
  inputs=events.update(state,combat,ai,761)
  count=count+require(inputs[0].action=="run" and inputs[0].elapsedMilliseconds==0,"locomotion resumes after pain")
  combat.targets[0].health=0;combat.targets[0].alive=false;combat.targets[0].respawnAt=4000
  inputs=events.update(state,combat,ai,1000)
  count=count+require(inputs[0].action=="death" and inputs[0].lowerAnimation==events.BOTH_DEATH1 and inputs[0].upperAnimation==events.BOTH_DEATH1,"death drives both model parts")
  count=count+require(len(state.events)==1 and state.events[0].kind=="death","death transition emitted")
  inputs=events.update(state,combat,ai,2500)
  count=count+require(inputs[0].action=="death" and inputs[0].elapsedMilliseconds==1500 and state.events==[],"death pose persists")
  combat.targets[0].alive=true;combat.targets[0].health=100;combat.targets[0].respawnAt=0
  inputs=events.update(state,combat,ai,4000)
  count=count+require(inputs[0].action=="respawn" and inputs[0].lowerAnimation==events.LEGS_IDLE and inputs[0].upperAnimation==events.TORSO_RAISE,"respawn selects raise pose")
  count=count+require(state.events[0].kind=="respawn" and state.events[0].at==4000,"respawn transition emitted")
  ai.brains[0].mode="dead";inputs=events.update(state,combat,ai,4010)
  count=count+require(inputs[0].action=="idle" and inputs[0].upperAnimation==events.TORSO_STAND,"idle input after respawn")
  count=count+require(events.input(state,0).action=="idle","indexed input accessor")
  count=count+require(try(events.state(void,0)) is error and try(events.state(combat,-1)) is error,"invalid state rejected")
  count=count+require(try(events.update(void,combat,ai,0)) is error and try(events.update(state,combat,ai,-1)) is error,"invalid update rejected")
  extra=targetState();extra.targets=extra.targets+extra.targets
  count=count+require(try(events.update(state,extra,void,0)) is error,"target count mismatch rejected")
  count=count+require(try(events.input(state,1)) is error,"input range rejected")
  print("PASS: "+str(count)+" playable enemy-events contracts");return 0
end function
