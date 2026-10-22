import mq3.game.bg_slidemove_runtime as bg
import mq3.game.movement as movement
import mq3.collision.brush as brush

struct Context
  mode
  traces
end struct

function trace(state,start,finish)
  state.context.traces=state.context.traces+1;value=brush.emptyTrace();endpos=finish
  if state.context.mode==1 then value.allsolid=true;value.startsolid=true;value.fraction=0.0;endpos=start end if
  return movement.Collision(value,endpos,1023)
end function
function require(value,message) if not value then print "FAIL "+message;return 1 end if return 0 end function

function main(args)
  failures=0;checks=0;context=Context(0,0);state=movement.create(trace,context);state.frametime=0.125;state.velocity=[80.0,0.0,0.0]
  failures=failures+require(not bg.PM_SlideMove(state,false),"unobstructed move result");checks=checks+1
  failures=failures+require(state.origin==[10.0,0.0,0.0] and context.traces==1,"unobstructed displacement");checks=checks+1
  context.mode=1;state.origin=[0.0,0.0,0.0];state.velocity=[3.0,4.0,-10.0]
  failures=failures+require(bg.PM_SlideMove(state,true),"allsolid reports clipping");checks=checks+1
  failures=failures+require(state.velocity[2]==0.0,"allsolid clears falling velocity");checks=checks+1
  context.mode=0;state.origin=[0.0,0.0,0.0];state.velocity=[16.0,0.0,0.0]
  bg.PM_StepSlideMove(state,false)
  failures=failures+require(state.origin==[2.0,0.0,0.0],"step facade unobstructed fast path");checks=checks+1
  if failures!=0 then return 1 end if
  print "PASS: "+str(checks)+" complete bg_slidemove contracts"
  return 0
end function
