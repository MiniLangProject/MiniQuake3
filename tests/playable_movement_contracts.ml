import mq3.client.playable_movement as playable
import mq3.game.movement as movement
import mq3.compat.numeric as numeric

struct MockTrace
  allsolid
  fraction
  normal
  surfaceFlags
end struct
struct TraceCount calls end struct

function hit(startPoint,endPoint,fraction,normal)
  endpos=[]
  for axis=0 to 2 endpos=endpos+[startPoint[axis]+(endPoint[axis]-startPoint[axis])*fraction] end for
  return movement.Collision(MockTrace(false,numeric.f32(fraction),normal,0),endpos,1022)
end function
function miss(endPoint) return movement.Collision(MockTrace(false,1.0,[0.0,0.0,0.0],0),[endPoint[0],endPoint[1],endPoint[2]],1023) end function

// context: 0 floor, 1 floor+wall, 2 floor+12-unit step, 3 empty space.
function sceneTrace(state,startPoint,endPoint)
  mode=state.context
  if mode==3 then return miss(endPoint) end if
  floorHeight=0.0
  if mode==2 and startPoint[0]>=25.0 then floorHeight=12.0 end if
  standing=floorHeight+48.0
  if endPoint[2]<startPoint[2] and endPoint[2]<=standing then
    fraction=(startPoint[2]-standing)/(startPoint[2]-endPoint[2]);if fraction<0.0 then fraction=0.0 end if
    return hit(startPoint,endPoint,fraction,[0.0,0.0,1.0])
  end if
  wallX=85.0
  if mode==2 then wallX=25.0 end if
  wallTop=10000.0;if mode==2 then wallTop=60.0 end if
  if endPoint[0]>startPoint[0] and endPoint[0]>wallX and startPoint[0]<=wallX and startPoint[2]<wallTop then
    fraction=(wallX-startPoint[0])/(endPoint[0]-startPoint[0])
    return hit(startPoint,endPoint,fraction,[-1.0,0.0,0.0])
  end if
  return miss(endPoint)
end function

function countingFloorTrace(state,startPoint,endPoint)
  state.context.calls=state.context.calls+1
  if endPoint[2]<startPoint[2] and endPoint[2]<=48.0 then
    fraction=(startPoint[2]-48.0)/(startPoint[2]-endPoint[2]);if fraction<0.0 then fraction=0.0 end if
    return hit(startPoint,endPoint,fraction,[0.0,0.0,1.0])
  end if
  return miss(endPoint)
end function

function require(ok,message) if not ok then return error(7499,message) end if;return 1 end function
function close(a,b,tolerance) difference=a-b;if difference<0 then difference=0-difference end if;return difference<=tolerance end function

function main(args)
  count=0
  count=count+require(playable.PLAYER_MASK==0x2010001,"player contents mask")
  count=count+require(playable.GRAVITY==800 and playable.SPEED==320,"Quake gravity and speed")
  count=count+require(close(playable.JUMP_VELOCITY,270.0,0.0),"Quake jump velocity")
  count=count+require(playable.MAX_FRAME_MILLISECONDS==100 and playable.SUBSTEP_MILLISECONDS==8,"bounded frame integration")
  count=count+require(playable.clampDelta(-2)==0 and playable.clampDelta(101)==100,"frame clamp")
  count=count+require(try(playable.createWithTrace(void,0,[0.0,0.0,0.0])) is error,"missing trace rejected")
  count=count+require(try(playable.createWithTrace(sceneTrace,0,[0.0,0.0])) is error,"short position rejected")
  controller=playable.createWithTrace(sceneTrace,0,[0.0,0.0,48.0])
  count=count+require(close(playable.position(controller)[2],48.0,0.0),"initial eye position")
  playable.step(controller,0.0,0.0,0.0,false,16)
  count=count+require(playable.isGrounded(controller),"floor establishes ground contact")
  count=count+require(close(playable.position(controller)[2],48.0,0.02),"standing height remains stable")
  traceCount=TraceCount(0);idle=playable.createWithTrace(countingFloorTrace,traceCount,[0.0,0.0,48.0]);playable.step(idle,0.0,0.0,0.0,false,8);traceCount.calls=0
  playable.step(idle,0.0,0.0,0.0,false,100)
  count=count+require(traceCount.calls==1 and playable.isGrounded(idle) and close(playable.position(idle)[2],48.0,0.001),"grounded idle frame performs one support trace")
  playable.step(controller,0.0,1.0,0.0,false,100)
  count=count+require(playable.position(controller)[0]>0.0,"forward ground acceleration")
  count=count+require(close(playable.position(controller)[1],0.0,0.03),"forward movement stays axial")
  speed=playable.velocity(controller)[0]
  playable.step(controller,0.0,0.0,0.0,false,100)
  count=count+require(playable.velocity(controller)[0]<speed,"ground friction slows player")
  diagonal=playable.createWithTrace(sceneTrace,0,[0.0,0.0,48.0]);playable.step(diagonal,0.0,1.0,1.0,false,100)
  count=count+require(close(playable.position(diagonal)[0],0.0-playable.position(diagonal)[1],0.05),"diagonal wish direction normalized")
  turned=playable.createWithTrace(sceneTrace,0,[0.0,0.0,48.0]);playable.step(turned,90.0,1.0,0.0,false,100)
  count=count+require(playable.position(turned)[1]>0.0 and close(playable.position(turned)[0],0.0,0.03),"yaw rotates ground movement")
  jumper=playable.createWithTrace(sceneTrace,0,[0.0,0.0,48.0]);playable.step(jumper,0.0,0.0,0.0,false,8)
  jumped=playable.step(jumper,0.0,0.0,0.0,true,8)
  count=count+require(jumped,"jump edge accepted")
  count=count+require(playable.position(jumper)[2]>48.0 and playable.velocity(jumper)[2]>0.0,"jump leaves floor upward")
  again=playable.step(jumper,0.0,0.0,0.0,true,8)
  count=count+require(not again,"held jump does not retrigger")
  airborne=playable.createWithTrace(sceneTrace,3,[0.0,0.0,100.0]);playable.step(airborne,0.0,0.0,0.0,false,100)
  count=count+require(not playable.isGrounded(airborne),"empty space stays airborne")
  count=count+require(playable.velocity(airborne)[2]<-79.0 and playable.position(airborne)[2]<100.0,"gravity accelerates fall")
  wall=playable.createWithTrace(sceneTrace,1,[80.0,0.0,48.0]);wall.motion.velocity=[100.0,100.0,0.0]
  playable.step(wall,0.0,0.0,0.0,false,100)
  count=count+require(playable.position(wall)[0]<=85.01,"wall blocks forward component")
  count=count+require(playable.position(wall)[1]>0.0,"collision slide preserves tangential movement")
  stepper=playable.createWithTrace(sceneTrace,2,[20.0,0.0,48.0]);stepper.motion.velocity=[100.0,0.0,0.0]
  playable.step(stepper,0.0,0.0,0.0,false,100)
  count=count+require(playable.position(stepper)[0]>25.0,"step-up crosses low obstacle")
  count=count+require(playable.position(stepper)[2]>57.0,"step-up raises player onto obstacle")
  clamped=playable.createWithTrace(sceneTrace,3,[0.0,0.0,100.0]);playable.step(clamped,0.0,4.0,-4.0,false,100)
  count=count+require(playable.velocity(clamped)[0]>0.0 and playable.velocity(clamped)[1]>0.0,"analog inputs clamp to valid range")
  count=count+require(try(playable.step(void,0.0,0.0,0.0,false,8)) is error,"missing controller rejected")
  print("PASS: "+str(count)+" playable-movement contracts");return 0
end function
