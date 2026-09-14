// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Focused movement-state services from code/botlib/be_ai_move.c.
package mq3.botlib.ai_move_runtime

import mq3.botlib.ai_resource_pools as resources
import mq3.botlib.aas_runtime as moveAas
import mq3.botlib.aas_routing as moveRouting
import mq3.botlib.aas_trace_areas as moveTraceAreas
import mq3.botlib.elementary_actions as moveEa
import mq3.compat.numeric as n

const OP_MOVE_TO_GOAL=549
const OP_MOVE_IN_DIRECTION=550
const OP_REACHABILITY_AREA=553
const OP_MOVEMENT_VIEW_TARGET=554
const OP_INIT_MOVE_STATE=557
const MFL_ONGROUND=2
const MFL_SWIMMING=4
const MFL_AGAINSTLADDER=8
const MFL_WATERJUMP=16
const MFL_TELEPORTED=32
const MFL_GRAPPLEPULL=64
const MFL_WALK=512
const MFL_ACTIVEGRAPPLE=128
const MFL_GRAPPLERESET=256
const EXTERNAL_MOVE_FLAGS=MFL_ONGROUND|MFL_WATERJUMP|MFL_TELEPORTED|MFL_GRAPPLEPULL|MFL_WALK
const MODELTYPE_FUNC_PLAT=1
const MODELTYPE_FUNC_BOB=2
const ENTITYNUM_WORLD=1022
const ENTITYNUM_NONE=1023
const CONTENTS_SOLID_PLAYERCLIP=0x10001
const MOVE_WALK=1
const MOVE_CROUCH=2
const MOVE_JUMP=4
const MOVERESULT_SWIMVIEW=2
const MOVERESULT_ONTOPOFOBSTACLE=32
const MOVERESULT_BLOCKEDBYAVOIDSPOT=256
const RESULTTYPE_INSOLIDAREA=8
const AVOID_ALWAYS=1
const AVOIDREACH_TRIES=4

struct InitMove origin velocity viewOffset entityNum client thinkTime presenceType viewAngles orMoveFlags end struct
struct Services context groundTraceFn entityModelFn modelTypeFn modelReachabilityFn swimmingFn clientTraceFn nextReachabilityFn elementaryActions onGroundFn againstLadderFn gapDistanceFn blockTraceFn walkDirectionFn end struct
struct Runtime pools aas router services end struct
struct GroundTrace startSolid fraction entity endPos end struct
struct ViewTargetResult found target end struct
struct MoveResult failure type blocked blockEntity travelType flags weapon moveDir idealViewAngles end struct

function services(context) return Services(context,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
function create(pools,aas,router,host) return Runtime(pools,aas,router,host) end function
function copyVector(value) return [value[0],value[1],value[2]] end function
function distance(a,b) x=n.fsub(b[0],a[0]);y=n.fsub(b[1],a[1]);z=n.fsub(b[2],a[2]);return n.fsqrt(n.fadd(n.fadd(n.fmul(x,x),n.fmul(y,y)),n.fmul(z,z))) end function

function initMoveState(runtime,handle,init)
  if runtime==void or init==void then return 0 end if;state=resources.moveState(runtime.pools,handle);if state==void then return 0 end if
  state.origin=copyVector(init.origin);state.velocity=copyVector(init.velocity);state.viewOffset=copyVector(init.viewOffset);state.entityNum=init.entityNum;state.client=init.client;state.thinkTime=init.thinkTime;state.presenceType=init.presenceType;state.viewAngles=copyVector(init.viewAngles)
  state.moveFlags=(state.moveFlags&(~EXTERNAL_MOVE_FLAGS))|(init.orMoveFlags&EXTERNAL_MOVE_FLAGS);return 0
end function

function fuzzyPointReachabilityArea(runtime,origin)
  if runtime==void or runtime.aas==void or origin==void or len(origin)!=3 then return 0 end if;firstArea=moveAas.pointAreaNum(runtime.aas,origin)
  if firstArea!=0 and moveAas.areaReachability(runtime.aas,firstArea)!=0 then return firstArea end if
  upward=[origin[0],origin[1],n.fadd(origin[2],4.0)];crossed=moveTraceAreas.trace(runtime.aas,origin,upward,10)
  if not (crossed is error) then for each areaNum in crossed.areas if moveAas.areaReachability(runtime.aas,areaNum)!=0 then return areaNum end if end for end if
  bestArea=0;bestDistance=999999.0
  z=1;while z>=-1
    x=1;while x>=-1
      y=1;while y>=-1
        finish=[n.fadd(origin[0],x*8.0),n.fadd(origin[1],y*8.0),n.fadd(origin[2],z*12.0)];crossed=moveTraceAreas.trace(runtime.aas,origin,finish,10)
        if not (crossed is error) and len(crossed.areas)>0 then for index=0 to len(crossed.areas)-1 areaNum=crossed.areas[index];if moveAas.areaReachability(runtime.aas,areaNum)!=0 then value=distance(origin,crossed.points[index]);if value<bestDistance then bestArea=areaNum;bestDistance=value end if end if;if firstArea==0 then firstArea=areaNum end if end for end if;y=y-1
      end while;x=x-1
    end while
    if bestArea!=0 then return bestArea end if
    z=z-1
  end while;return firstArea
end function

function callGroundTrace(runtime,origin,client)
  if runtime.services==void or runtime.services.groundTraceFn==void then return void end if
  bounds=moveAas.presenceTypeBoundingBox(moveAas.PRESENCE_CROUCH);finish=[origin[0],origin[1],n.fsub(origin[2],3.0)];return runtime.services.groundTraceFn(runtime.services.context,origin,bounds[0],bounds[1],finish,client,CONTENTS_SOLID_PLAYERCLIP)
end function
function reachabilityArea(runtime,origin,client)
  if runtime==void then return 0 end if;ground=callGroundTrace(runtime,origin,client)
  if ground!=void and not (ground is error) and not ground.startSolid and ground.fraction<1.0 and ground.entity!=ENTITYNUM_NONE then
    if ground.entity==ENTITYNUM_WORLD then return fuzzyPointReachabilityArea(runtime,origin) end if
    if runtime.services.entityModelFn!=void and runtime.services.modelTypeFn!=void and runtime.services.modelReachabilityFn!=void then
      model=runtime.services.entityModelFn(runtime.services.context,ground.entity);kind=runtime.services.modelTypeFn(runtime.services.context,model)
      if kind==MODELTYPE_FUNC_PLAT or kind==MODELTYPE_FUNC_BOB then reachNum=runtime.services.modelReachabilityFn(runtime.services.context,model);if runtime.router!=void and reachNum>0 and reachNum<len(runtime.router.reaches) then return runtime.router.reaches[reachNum].areaNum end if end if
    end if
    if runtime.services.swimmingFn!=void and runtime.services.swimmingFn(runtime.services.context,origin) then return fuzzyPointReachabilityArea(runtime,origin) end if
    areaNum=fuzzyPointReachabilityArea(runtime,origin);if areaNum!=0 and moveAas.areaReachability(runtime.aas,areaNum)!=0 then return areaNum end if
    down=[origin[0],origin[1],n.fsub(origin[2],800.0)];groundOrigin=copyVector(origin)
    if runtime.services.clientTraceFn!=void then traced=runtime.services.clientTraceFn(runtime.services.context,origin,down,moveAas.PRESENCE_CROUCH,-1);if not (traced is error) and not traced.startSolid then groundOrigin=copyVector(traced.endPos) end if end if
    return fuzzyPointReachabilityArea(runtime,groundOrigin)
  end if
  return fuzzyPointReachabilityArea(runtime,origin)
end function

function addToTarget(start,finish,maxDistance,travelled,target)
  current=distance(start,finish);direction=[0.0,0.0,0.0];if current>0.0 then for axis=0 to 2 direction[axis]=n.fdiv(n.fsub(finish[axis],start[axis]),current) end for end if
  if n.fadd(travelled,current)<maxDistance then return [false,n.fadd(travelled,current),copyVector(finish)] end if
  remaining=n.fsub(maxDistance,travelled);for axis=0 to 2 target[axis]=n.fadd(start[axis],n.fmul(remaining,direction[axis])) end for;return [true,maxDistance,target]
end function
function nextReachability(runtime,state,origin,areaNum,goal,travelFlags,lastAreaNum)
  if runtime.services!=void and runtime.services.nextReachabilityFn!=void then return runtime.services.nextReachabilityFn(runtime.services.context,origin,areaNum,state.lastGoalAreaNum,lastAreaNum,state.avoidReach,state.avoidReachTimes,state.avoidReachTries,goal,travelFlags) end if
  if runtime.router==void then return 0 end if;return moveRouting.areaReachabilityToGoalArea(runtime.router,areaNum,origin,goal.areaNum,travelFlags)
end function
function movementViewTarget(runtime,handle,goal,travelFlags,lookAhead,target)
  result=ViewTargetResult(false,copyVector(target));if runtime==void or runtime.router==void then return result end if;state=resources.moveState(runtime.pools,handle);if state==void or goal==void or state.lastReachNum==0 then return result end if
  reachNum=state.lastReachNum;finish=copyVector(state.origin);lastArea=state.lastAreaNum;travelled=0.0
  while reachNum!=0 and travelled<lookAhead
    if reachNum<0 or reachNum>=len(runtime.router.reaches) then return result end if;reach=runtime.router.reaches[reachNum]
    added=addToTarget(finish,reach.start,lookAhead,travelled,result.target);travelled=added[1];result.target=added[2];if added[0] then result.found=true;return result end if
    kind=reach.travelType&moveRouting.TRAVELTYPE_MASK;if kind==moveRouting.TRAVEL_TELEPORT or kind==moveRouting.TRAVEL_ROCKETJUMP or kind==moveRouting.TRAVEL_BFGJUMP then result.found=true;return result end if
    if kind!=moveRouting.TRAVEL_JUMPPAD and kind!=moveRouting.TRAVEL_ELEVATOR and kind!=moveRouting.TRAVEL_FUNCBOB then added=addToTarget(reach.start,reach.finish,lookAhead,travelled,result.target);travelled=added[1];result.target=added[2];if added[0] then result.found=true;return result end if end if
    reachNum=nextReachability(runtime,state,reach.finish,reach.areaNum,goal,travelFlags,lastArea);finish=copyVector(reach.finish);lastArea=reach.areaNum
    if lastArea==goal.areaNum then added=addToTarget(reach.finish,goal.origin,lookAhead,travelled,result.target);result.target=added[2];result.found=true;return result end if
  end while;return result
end function

function emptyMoveResult() return MoveResult(false,0,false,0,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
function normalize(value)
  length=distance([0.0,0.0,0.0],value);if length<=0.0 then return [0.0,[0.0,0.0,0.0]] end if;return [length,[n.fdiv(value[0],length),n.fdiv(value[1],length),n.fdiv(value[2],length)]]
end function
function emitMovement(runtime,state,direction,speed)
  if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.move(runtime.services.elementaryActions,state.client,direction,speed);return not (result is error)
end function
function emitWalk(runtime,state) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.walk(runtime.services.elementaryActions,state.client);return not (result is error) end function
function emitCrouch(runtime,state) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.crouch(runtime.services.elementaryActions,state.client);return not (result is error) end function
function onGround(runtime,state)
  if runtime.services!=void and runtime.services.onGroundFn!=void then return runtime.services.onGroundFn(runtime.services.context,state.origin,state.presenceType,state.entityNum) end if;return (state.moveFlags&MFL_ONGROUND)!=0
end function
function isSwimming(runtime,state)
  if runtime.services!=void and runtime.services.swimmingFn!=void then return runtime.services.swimmingFn(runtime.services.context,state.origin) end if;return false
end function
function gapDistance(runtime,state,direction)
  if runtime.services!=void and runtime.services.gapDistanceFn!=void then return runtime.services.gapDistanceFn(runtime.services.context,state.origin,direction,state.entityNum) end if;return 0.0
end function
function checkBlocked(runtime,state,direction,checkBottom,result)
  if runtime.services==void or runtime.services.blockTraceFn==void then return result end if;trace=runtime.services.blockTraceFn(runtime.services.context,state,direction,checkBottom)
  if trace is error or trace==void then return result end if
  if not trace.startSolid and trace.entity!=ENTITYNUM_WORLD and trace.entity!=ENTITYNUM_NONE then result.blocked=true;result.blockEntity=trace.entity end if;return result
end function
function vectorDistanceSquared(a,b) x=n.fsub(b[0],a[0]);y=n.fsub(b[1],a[1]);z=n.fsub(b[2],a[2]);return n.fadd(n.fadd(n.fmul(x,x),n.fmul(y,y)),n.fmul(z,z)) end function
function absFloat(value) if value<0.0 then return 0.0-value end if;return value end function
function distanceFromLineSquared(point,start,finish)
  line=[n.fsub(finish[0],start[0]),n.fsub(finish[1],start[1]),n.fsub(finish[2],start[2])];denom=vectorDistanceSquared(start,finish);scale=0.0;if denom>0.0 then scale=n.fdiv(n.fadd(n.fadd(n.fmul(n.fsub(point[0],start[0]),line[0]),n.fmul(n.fsub(point[1],start[1]),line[1])),n.fmul(n.fsub(point[2],start[2]),line[2])),denom) end if
  projected=[n.fadd(start[0],n.fmul(scale,line[0])),n.fadd(start[1],n.fmul(scale,line[1])),n.fadd(start[2],n.fmul(scale,line[2]))]
  for axis=0 to 2 if (projected[axis]>start[axis] and projected[axis]>finish[axis]) or (projected[axis]<start[axis] and projected[axis]<finish[axis]) then if absFloat(projected[axis]-start[axis])<absFloat(projected[axis]-finish[axis]) then return vectorDistanceSquared(point,start) else return vectorDistanceSquared(point,finish) end if end if end for
  return vectorDistanceSquared(point,projected)
end function
function reachAvoided(state,reach,origin)
  if state.numAvoidSpots<=0 then return false end if;checkBetween=true;kind=reach.travelType&moveRouting.TRAVELTYPE_MASK
  if kind==moveRouting.TRAVEL_WALKOFFLEDGE or kind==moveRouting.TRAVEL_JUMP or kind==moveRouting.TRAVEL_TELEPORT or kind==moveRouting.TRAVEL_ELEVATOR or kind==moveRouting.TRAVEL_GRAPPLEHOOK or kind==moveRouting.TRAVEL_ROCKETJUMP or kind==moveRouting.TRAVEL_BFGJUMP or kind==moveRouting.TRAVEL_JUMPPAD or kind==moveRouting.TRAVEL_FUNCBOB then checkBetween=false end if
  for index=0 to state.numAvoidSpots-1 spot=state.avoidSpots[index];radius=n.fmul(spot.radius,spot.radius);value=distanceFromLineSquared(spot.origin,origin,reach.start)
    hit=value<radius and vectorDistanceSquared(spot.origin,origin)>value
    if not hit and checkBetween then value=distanceFromLineSquared(spot.origin,reach.start,reach.finish);hit=value<radius and vectorDistanceSquared(spot.origin,reach.start)>value end if
    if hit and spot.type==AVOID_ALWAYS then return true end if
  end for;return false
end function
function bestReachability(runtime,state,goal,travelFlags)
  areaNum=state.areaNum;if areaNum<=0 or areaNum>=len(runtime.router.settings) or goal.areaNum<=0 or goal.areaNum>=len(runtime.router.settings) then return [0,0] end if;effectiveFlags=travelFlags
  if (runtime.router.settings[areaNum].contents&moveRouting.AREACONTENTS_DONOTENTER)!=0 or (runtime.router.settings[goal.areaNum].contents&moveRouting.AREACONTENTS_DONOTENTER)!=0 then effectiveFlags=effectiveFlags|moveRouting.TFL_DONOTENTER end if
  settings=runtime.router.settings[areaNum];best=0;bestTime=0;resultFlags=0
  if settings.numReachableAreas>0 then for reachNum=settings.firstReachableArea to settings.firstReachableArea+settings.numReachableAreas-1 reach=runtime.router.reaches[reachNum];skip=false
    for avoidIndex=0 to resources.MAX_AVOIDREACH-1 if state.avoidReach[avoidIndex]==reachNum and state.avoidReachTimes[avoidIndex]>=moveAas.getTime(runtime.aas) and state.avoidReachTries[avoidIndex]>AVOIDREACH_TRIES then skip=true end if end for;if skip then continue end if
    if state.lastGoalAreaNum==goal.areaNum and reach.areaNum==state.lastAreaNum then continue end if;if not moveRouting.edgeAllowed(runtime.router,reach,effectiveFlags) then continue end if
    route=moveRouting.areaRouteToGoalArea(runtime.router,reach.areaNum,reach.finish,goal.areaNum,effectiveFlags);if route.travelTime==0 then continue end if
    if reachAvoided(state,reach,state.origin) then resultFlags=resultFlags|MOVERESULT_BLOCKEDBYAVOIDSPOT;continue end if;total=route.travelTime+reach.travelTime;if bestTime==0 or total<bestTime then bestTime=total;best=reachNum end if
  end for end if;return [best,resultFlags]
end function
function reachabilityTime(reach)
  kind=reach.travelType&moveRouting.TRAVELTYPE_MASK;if kind==moveRouting.TRAVEL_LADDER or kind==moveRouting.TRAVEL_ROCKETJUMP or kind==moveRouting.TRAVEL_BFGJUMP then return 6 end if;if kind==moveRouting.TRAVEL_ELEVATOR or kind==moveRouting.TRAVEL_JUMPPAD or kind==moveRouting.TRAVEL_FUNCBOB then return 10 end if;if kind==moveRouting.TRAVEL_GRAPPLEHOOK then return 8 end if;return 5
end function
function travelWalk(runtime,state,reach)
  result=emptyMoveResult();direction=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),0.0];normal=normalize(direction);dist=normal[0];direction=normal[1];result=checkBlocked(runtime,state,direction,true,result)
  if dist<10.0 then direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];normal=normalize(direction);dist=normal[0];direction=normal[1] end if
  if (runtime.router.settings[reach.areaNum].presenceType&moveAas.PRESENCE_NORMAL)==0 and dist<20.0 then if not emitCrouch(runtime,state) then result.failure=true;return result end if end if
  gap=gapDistance(runtime,state,direction);speed=0.0
  if (state.moveFlags&MFL_WALK)!=0 then
    if gap>0.0 then speed=n.fadd(20.0,gap) else speed=200.0 end if
    if not emitWalk(runtime,state) then result.failure=true;return result end if
  else
    if gap>0.0 then speed=n.fadd(40.0,n.fmul(2.0,gap)) else speed=400.0 end if
  end if
  if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if;result.moveDir=copyVector(direction);return result
end function
function moveInGoalArea(runtime,state,goal)
  result=emptyMoveResult();direction=[n.fsub(goal.origin[0],state.origin[0]),n.fsub(goal.origin[1],state.origin[1]),0.0];normal=normalize(direction);dist=normal[0];direction=normal[1];if dist>100.0 then dist=100.0 end if;speed=n.fmul(4.0,dist);if speed<10.0 then speed=0.0 end if;result=checkBlocked(runtime,state,direction,true,result)
  if not emitMovement(runtime,state,direction,speed) then result.failure=true else result.moveDir=copyVector(direction) end if;result.travelType=moveRouting.TRAVEL_WALK;state.lastReachNum=0;state.lastAreaNum=0;state.lastGoalAreaNum=goal.areaNum;state.lastOrigin=copyVector(state.origin);return result
end function
function unsupportedTravel(reach)
  result=emptyMoveResult();result.failure=true;result.type=reach.travelType&moveRouting.TRAVELTYPE_MASK;result.travelType=reach.travelType;return result
end function
function moveToGoal(runtime,handle,goal,travelFlags)
  result=emptyMoveResult();if runtime==void or runtime.router==void then result.failure=true;return result end if;state=resources.moveState(runtime.pools,handle);if state==void or goal==void then result.failure=true;return result end if
  state.moveFlags=state.moveFlags&(~(MFL_SWIMMING|MFL_AGAINSTLADDER));if onGround(runtime,state) then state.moveFlags=state.moveFlags|MFL_ONGROUND end if;if isSwimming(runtime,state) then state.moveFlags=state.moveFlags|MFL_SWIMMING end if;if runtime.services.againstLadderFn!=void and runtime.services.againstLadderFn(runtime.services.context,state.origin) then state.moveFlags=state.moveFlags|MFL_AGAINSTLADDER end if
  active=(state.moveFlags&(MFL_ONGROUND|MFL_SWIMMING|MFL_AGAINSTLADDER))!=0
  if active then
    state.areaNum=fuzzyPointReachabilityArea(runtime,state.origin);if state.areaNum==0 then result.failure=true;result.blocked=true;result.type=RESULTTYPE_INSOLIDAREA;return result end if;if state.areaNum==goal.areaNum then return moveInGoalArea(runtime,state,goal) end if
    reachNum=state.lastReachNum;if reachNum>0 then reach=runtime.router.reaches[reachNum];kind=reach.travelType&moveRouting.TRAVELTYPE_MASK;if (moveRouting.travelFlagForType(reach.travelType)&travelFlags)==0 or state.lastGoalAreaNum!=goal.areaNum or state.reachabilityTime<moveAas.getTime(runtime.aas) or state.lastAreaNum!=state.areaNum or kind!=moveRouting.TRAVEL_WALK then reachNum=0 end if end if
    resultFlags=0;if reachNum==0 then selected=bestReachability(runtime,state,goal,travelFlags);reachNum=selected[0];resultFlags=selected[1];state.reachAreaNum=state.areaNum;state.jumpReach=0;state.moveFlags=state.moveFlags&(~MFL_GRAPPLERESET);if reachNum>0 then state.reachabilityTime=n.fadd(moveAas.getTime(runtime.aas),reachabilityTime(runtime.router.reaches[reachNum])) end if end if
    state.lastReachNum=reachNum;state.lastGoalAreaNum=goal.areaNum;state.lastAreaNum=state.areaNum;if reachNum==0 then result.failure=true;result.flags=resultFlags;state.lastOrigin=copyVector(state.origin);return result end if;reach=runtime.router.reaches[reachNum]
    if (reach.travelType&moveRouting.TRAVELTYPE_MASK)==moveRouting.TRAVEL_WALK then result=travelWalk(runtime,state,reach) else result=unsupportedTravel(reach) end if;result.travelType=reach.travelType;result.flags=result.flags|resultFlags
  else if state.lastReachNum>0 and state.lastReachNum<len(runtime.router.reaches) then reach=runtime.router.reaches[state.lastReachNum];if (reach.travelType&moveRouting.TRAVELTYPE_MASK)==moveRouting.TRAVEL_WALK then result=travelWalk(runtime,state,reach) else result=unsupportedTravel(reach) end if;result.travelType=reach.travelType else result.failure=true end if
  if result.blocked then state.reachabilityTime=n.fsub(state.reachabilityTime,n.fmul(10.0,state.thinkTime)) end if;state.lastOrigin=copyVector(state.origin);return result
end function
function moveInDirection(runtime,handle,direction,speed,type)
  if runtime==void then return false end if;state=resources.moveState(runtime.pools,handle);if state==void then return false end if;normal=normalize(direction);normalized=normal[1]
  if isSwimming(runtime,state) then return emitMovement(runtime,state,normalized,speed) end if;if not onGround(runtime,state) then if (state.moveFlags&1)!=0 and state.velocity[2]<50.0 then emitMovement(runtime,state,direction,speed) end if;return true end if
  if runtime.services.walkDirectionFn==void then return false end if;return runtime.services.walkDirectionFn(runtime.services.context,state,direction,speed,type)
end function
function supportsTrap(op) return op==OP_MOVE_TO_GOAL or op==OP_MOVE_IN_DIRECTION or op==OP_REACHABILITY_AREA or op==OP_MOVEMENT_VIEW_TARGET or op==OP_INIT_MOVE_STATE end function
