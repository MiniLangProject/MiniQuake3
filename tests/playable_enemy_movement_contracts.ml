import mq3.client.playable_enemy_movement as enemyMove
import mq3.game.movement as movement
import mq3.compat.numeric as numeric

struct MockTrace allsolid fraction normal surfaceFlags end struct
struct Context mode calls end struct
struct Target origin end struct

function hit(startPoint,endPoint,fraction,normal,allsolid)
  endpos=[]
  for axis=0 to 2 endpos=endpos+[startPoint[axis]+(endPoint[axis]-startPoint[axis])*fraction] end for
  return movement.Collision(MockTrace(allsolid,numeric.f32(fraction),normal,0),endpos,1022)
end function
function miss(endPoint) return movement.Collision(MockTrace(false,1.0,[0.0,0.0,0.0],0),[endPoint[0],endPoint[1],endPoint[2]],1023) end function

// 0 floor, 1 floor+wall, 2 floor+12-unit stair, 3 empty, 4 start solid.
function sceneTrace(state,startPoint,endPoint)
  context=state.context;context.calls=context.calls+1
  if context.mode==4 then return hit(startPoint,endPoint,0.0,[0.0,0.0,1.0],true) end if
  if context.mode==3 then return miss(endPoint) end if
  floor=0.0;if context.mode==2 and startPoint[0]>=25.0 then floor=12.0 end if
  standing=floor+24.0
  if endPoint[2]<startPoint[2] and endPoint[2]<=standing then
    fraction=(startPoint[2]-standing)/(startPoint[2]-endPoint[2]);if fraction<0.0 then fraction=0.0 end if
    return hit(startPoint,endPoint,fraction,[0.0,0.0,1.0],false)
  end if
  wallX=85.0;if context.mode==2 then wallX=25.0 end if
  wallTop=10000.0;if context.mode==2 then wallTop=30.0 end if
  if endPoint[0]>startPoint[0] and endPoint[0]>wallX and startPoint[0]<=wallX and startPoint[2]<wallTop then
    return hit(startPoint,endPoint,(wallX-startPoint[0])/(endPoint[0]-startPoint[0]),[-1.0,0.0,0.0],false)
  end if
  return miss(endPoint)
end function

function require(ok,message) if not ok then return error(7559,message) end if;return 1 end function
function close(a,b,tolerance) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<=tolerance end function

function main(args)
  count=0
  count=count+require(enemyMove.PLAYER_MASK==0x2010001,"player-solid contents mask")
  count=count+require(close(enemyMove.STEP_HEIGHT,18.0,0.0) and close(enemyMove.GROUND_PROBE,24.0,0.0),"step and ground distances")
  floor=Context(0,0);result=enemyMove.moveOriginWithTrace(sceneTrace,floor,[0.0,0.0,24.0],[20.0,0.0,0.0])
  count=count+require(close(result.origin[0],20.0,0.02),"clear horizontal displacement")
  count=count+require(close(result.origin[2],24.0,0.02) and result.grounded,"floor binding")
  count=count+require(not result.blocked and not result.stepped,"clear result flags")
  count=count+require(floor.calls>=2,"trace adapter exercised")
  wall=Context(1,0);result=enemyMove.moveOriginWithTrace(sceneTrace,wall,[80.0,0.0,24.0],[20.0,12.0,0.0])
  count=count+require(result.origin[0]<=85.01,"wall blocks crossing")
  count=count+require(result.origin[1]>5.0,"wall slide keeps tangent")
  count=count+require(result.blocked,"wall reports blocked")
  stair=Context(2,0);result=enemyMove.moveOriginWithTrace(sceneTrace,stair,[20.0,0.0,24.0],[20.0,0.0,0.0])
  count=count+require(result.origin[0]>25.0,"low stair crossed")
  count=count+require(result.origin[2]>35.0 and result.stepped,"18-unit step used")
  empty=Context(3,0);result=enemyMove.moveOriginWithTrace(sceneTrace,empty,[0.0,0.0,50.0],[5.0,0.0,0.0])
  count=count+require(not result.grounded and close(result.origin[2],50.0,0.02),"no invented ground")
  solid=Context(4,0);result=enemyMove.moveOriginWithTrace(sceneTrace,solid,[1.0,2.0,3.0],[9.0,0.0,0.0])
  count=count+require(result.origin==[1.0,2.0,3.0] and result.blocked,"all-solid does not tunnel")
  target=Target([0.0,0.0,24.0]);result=enemyMove.moveTargetWithTrace(sceneTrace,Context(0,0),target,[8.0,3.0,0.0])
  count=count+require(target.origin==result.origin,"target adapter commits result")
  count=count+require(close(target.origin[0],8.0,0.02) and close(target.origin[1],3.0,0.02),"target desired delta")
  zero=enemyMove.moveOriginWithTrace(sceneTrace,Context(0,0),[4.0,5.0,24.0],[0.0,0.0,0.0])
  count=count+require(zero.origin==[4.0,5.0,24.0] and zero.grounded,"stationary target remains grounded")
  count=count+require(try(enemyMove.moveOriginWithTrace(void,void,[0.0,0.0,0.0],[0.0,0.0,0.0])) is error,"missing trace rejected")
  count=count+require(try(enemyMove.moveOriginWithTrace(sceneTrace,Context(0,0),[0.0,0.0],[0.0,0.0,0.0])) is error,"short origin rejected")
  count=count+require(try(enemyMove.moveOriginWithTrace(sceneTrace,Context(0,0),[0.0,0.0,0.0],[0.0,0.0])) is error,"short delta rejected")
  count=count+require(try(enemyMove.moveTargetWithTrace(sceneTrace,Context(0,0),void,[0.0,0.0,0.0])) is error,"missing target rejected")
  count=count+require(try(enemyMove.moveOrigin(void,[0.0,0.0,0.0],[0.0,0.0,0.0])) is error,"missing world rejected")
  count=count+require(try(enemyMove.moveTarget(void,target,[0.0,0.0,0.0])) is error,"target world required")
  print("PASS: "+str(count)+" playable enemy-movement contracts");return 0
end function
