// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native symbol adapter for code/botlib/be_ai_move.c.
package mq3.botlib.be_ai_move
import mq3.botlib.ai_move_runtime as move
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_avoid_spots as avoid
import mq3.botlib.ai_predict_visible_position as predict
import mq3.botlib.aas_routing as routing
import mq3.botlib.aas_runtime as moveAas
import mq3.compat.numeric as n
import std.string as strings

const MAX_MODELS=256
const MODELTYPE_NONE=0
const MODELTYPE_FUNC_PLAT=1
const MODELTYPE_FUNC_BOB=2
const MODELTYPE_FUNC_DOOR=3
const MODELTYPE_FUNC_STATIC=4
const AVOID_CLEAR=0
const AVOID_ALWAYS=1
const AVOID_DONTBLOCK=2

struct BrushEntity classname modelNum end struct
struct MoverInfo mins maxs origin currentOrigin end struct
struct Adapter runtime modelTypes context visibleTraceFn moverInfoFn onMoverFn onTopFn setupFn shutdownFn end struct

function create(runtime)
  return Adapter(runtime,array(MAX_MODELS,MODELTYPE_NONE),void,void,void,void,void,void,void)
end function

function absFloat(value) if value<0.0 then return 0.0-value end if;return value end function

function AngleDiff(ang1,ang2) return move.angleDiff(ang1,ang2) end function

function BotAllocMoveState(adapter) if adapter==void or adapter.runtime==void then return 0 end if;return pools.allocMoveState(adapter.runtime.pools) end function
function BotFreeMoveState(adapter,handle) if adapter==void or adapter.runtime==void then return 0 end if;return pools.freeMoveState(adapter.runtime.pools,handle) end function
function BotMoveStateFromHandle(adapter,handle) if adapter==void or adapter.runtime==void then return void end if;return pools.moveState(adapter.runtime.pools,handle) end function
function BotInitMoveState(adapter,handle,value) if adapter==void then return 0 end if;return move.initMoveState(adapter.runtime,handle,value) end function
function BotResetAvoidReach(adapter,handle) if adapter==void then return 0 end if;return pools.resetAvoidReach(adapter.runtime.pools,handle) end function
function BotResetLastAvoidReach(adapter,handle) if adapter==void then return 0 end if;return pools.resetLastAvoidReach(adapter.runtime.pools,handle) end function
function BotResetMoveState(adapter,handle) if adapter==void then return 0 end if;return pools.resetMoveState(adapter.runtime.pools,handle) end function

function BotFuzzyPointReachabilityArea(adapter,origin) return move.fuzzyPointReachabilityArea(adapter.runtime,origin) end function
function BotReachabilityArea(adapter,origin,client) return move.reachabilityArea(adapter.runtime,origin,client) end function

function BotAddToAvoidReach(adapter,state,number,avoidTime)
  if adapter==void or state==void then return void end if;now=moveAas.getTime(adapter.runtime.aas)
  for index=0 to pools.MAX_AVOIDREACH-1
    if state.avoidReach[index]==number then if state.avoidReachTimes[index]>now then state.avoidReachTries[index]=state.avoidReachTries[index]+1 else state.avoidReachTries[index]=1 end if;state.avoidReachTimes[index]=n.fadd(now,avoidTime);return void end if
  end for
  for index=0 to pools.MAX_AVOIDREACH-1 if state.avoidReachTimes[index]<now then state.avoidReach[index]=number;state.avoidReachTimes[index]=n.fadd(now,avoidTime);state.avoidReachTries[index]=1;return void end if end for
  return void
end function

function DistanceFromLineSquared(point,start,finish) return move.distanceFromLineSquared(point,start,finish) end function
function VectorDistanceSquared(first,second) return move.vectorDistanceSquared(first,second) end function

function BotAvoidSpots(origin,reach,spots,numSpots)
  checkBetween=true;kind=reach.travelType&routing.TRAVELTYPE_MASK
  if kind==routing.TRAVEL_WALKOFFLEDGE or kind==routing.TRAVEL_JUMP or kind==routing.TRAVEL_TELEPORT or kind==routing.TRAVEL_ELEVATOR or kind==routing.TRAVEL_GRAPPLEHOOK or kind==routing.TRAVEL_ROCKETJUMP or kind==routing.TRAVEL_BFGJUMP or kind==routing.TRAVEL_JUMPPAD or kind==routing.TRAVEL_FUNCBOB then checkBetween=false end if
  result=AVOID_CLEAR;if numSpots>len(spots) then numSpots=len(spots) end if;if numSpots<=0 then return result end if
  for index=0 to numSpots-1
    spot=spots[index];radius=n.fmul(spot.radius,spot.radius);square=DistanceFromLineSquared(spot.origin,origin,reach.start)
    if square<radius and VectorDistanceSquared(spot.origin,origin)>square then result=spot.type
    else if checkBetween then square=DistanceFromLineSquared(spot.origin,reach.start,reach.finish);if square<radius and VectorDistanceSquared(spot.origin,reach.start)>square then result=spot.type end if
    else ignored=VectorDistanceSquared(spot.origin,reach.finish);if square<radius and VectorDistanceSquared(spot.origin,reach.start)>square then result=spot.type end if end if
    if result==AVOID_ALWAYS then return result end if
  end for
  return result
end function

function BotAddAvoidSpot(adapter,handle,origin,radius,type) if adapter==void then return 0 end if;return avoid.add(adapter.runtime.pools,handle,origin,radius,type) end function

function BotValidTravel(adapter,origin,reach,travelFlags)
  if adapter==void or adapter.runtime==void or adapter.runtime.router==void then return false end if
  travelRequired=routing.travelFlagForType(reach.travelType);areaRequired=routing.areaContentsTravelFlags(adapter.runtime.router,reach.areaNum)
  return (travelRequired&(~travelFlags))==0 and (areaRequired&(~travelFlags))==0
end function

function BotGetReachabilityToGoal(adapter,origin,areaNum,lastGoalAreaNum,lastAreaNum,avoidReach,avoidTimes,avoidTries,goal,travelFlags,moveTravelFlags,avoidSpots)
  resultFlags=0;if adapter==void or adapter.runtime.router==void or areaNum<=0 or areaNum>=len(adapter.runtime.router.settings) or goal==void or goal.areaNum<=0 or goal.areaNum>=len(adapter.runtime.router.settings) then return [0,resultFlags] end if
  if (adapter.runtime.router.settings[areaNum].contents&routing.AREACONTENTS_DONOTENTER)!=0 or (adapter.runtime.router.settings[goal.areaNum].contents&routing.AREACONTENTS_DONOTENTER)!=0 then travelFlags=travelFlags|routing.TFL_DONOTENTER;moveTravelFlags=moveTravelFlags|routing.TFL_DONOTENTER end if
  settings=adapter.runtime.router.settings[areaNum];best=0;bestTime=0;now=moveAas.getTime(adapter.runtime.aas)
  if settings.numReachableAreas>0 then for reachNum=settings.firstReachableArea to settings.firstReachableArea+settings.numReachableAreas-1
    reach=adapter.runtime.router.reaches[reachNum];skip=false;limit=len(avoidReach);if len(avoidTimes)<limit then limit=len(avoidTimes) end if;if len(avoidTries)<limit then limit=len(avoidTries) end if
    if limit>0 then for index=0 to limit-1 if avoidReach[index]==reachNum and avoidTimes[index]>=now and avoidTries[index]>move.AVOIDREACH_TRIES then skip=true end if end for end if;if skip then continue end if
    if lastGoalAreaNum==goal.areaNum and reach.areaNum==lastAreaNum then continue end if;if not BotValidTravel(adapter,origin,reach,moveTravelFlags) then continue end if
    travel=routing.areaTravelTimeToGoalArea(adapter.runtime.router,reach.areaNum,reach.finish,goal.areaNum,travelFlags);if travel==0 then continue end if
    if BotAvoidSpots(origin,reach,avoidSpots,len(avoidSpots))!=AVOID_CLEAR then resultFlags=resultFlags|move.MOVERESULT_BLOCKEDBYAVOIDSPOT;continue end if
    total=travel+reach.travelTime;if bestTime==0 or total<bestTime then bestTime=total;best=reachNum end if
  end for end if;return [best,resultFlags]
end function

function BotAddToTarget(start,finish,maxDistance,travelled,target) return move.addToTarget(start,finish,maxDistance,travelled,target) end function
function BotMovementViewTarget(adapter,handle,goal,travelFlags,lookAhead,target) return move.movementViewTarget(adapter.runtime,handle,goal,travelFlags,lookAhead,target) end function

function BotVisible(adapter,entity,eye,target)
  if adapter==void or adapter.visibleTraceFn==void then return false end if
  return adapter.visibleTraceFn(adapter.context,eye,target,entity,move.CONTENTS_SOLID_PLAYERCLIP)>=1.0
end function
function visibleCallback(context,goal,point,entity,contents) return context.visibleTraceFn(context.context,goal,point,entity,contents) end function
function BotPredictVisiblePosition(adapter,origin,areaNum,goal,travelFlags)
  if adapter==void or adapter.visibleTraceFn==void then return predict.Result(false,move.copyVector(origin),0,[]) end if
  runtime=predict.create(adapter.runtime.router,adapter,visibleCallback);return predict.predict(runtime,origin,areaNum,goal,travelFlags)
end function

function MoverBottomCenter(adapter,reach)
  result=[0.0,0.0,reach.start[2]];if adapter==void or adapter.moverInfoFn==void then return result end if;value=adapter.moverInfoFn(adapter.context,reach.faceNum&0xffff);if value==void or value is error then return result end if
  result[0]=n.fadd(value.currentOrigin[0],n.fmul(0.5,n.fadd(value.mins[0],value.maxs[0])));result[1]=n.fadd(value.currentOrigin[1],n.fmul(0.5,n.fadd(value.mins[1],value.maxs[1])));return result
end function
function MoverDown(adapter,reach)
  if adapter==void or adapter.moverInfoFn==void then return false end if;value=adapter.moverInfoFn(adapter.context,reach.faceNum&0xffff);if value==void or value is error then return false end if;return n.fadd(value.currentOrigin[2],value.maxs[2])<reach.start[2]
end function
function BotOnMover(adapter,origin,entityNum,reach) if adapter==void or adapter.onMoverFn==void then return false end if;return adapter.onMoverFn(adapter.context,origin,entityNum,reach) end function
function BotOnTopOfEntity(adapter,state) if adapter==void or adapter.onTopFn==void then return -1 end if;return adapter.onTopFn(adapter.context,state) end function

function BotSetBrushModelTypes(adapter,entities)
  adapter.modelTypes=array(MAX_MODELS,MODELTYPE_NONE)
  for each entity in entities model=entity.modelNum;if model<0 or model>=MAX_MODELS then continue end if;name=strings.toLowerAscii(entity.classname);if name=="func_bobbing" then adapter.modelTypes[model]=MODELTYPE_FUNC_BOB else if name=="func_plat" then adapter.modelTypes[model]=MODELTYPE_FUNC_PLAT else if name=="func_door" then adapter.modelTypes[model]=MODELTYPE_FUNC_DOOR else if name=="func_static" then adapter.modelTypes[model]=MODELTYPE_FUNC_STATIC end if end for
  return void
end function

function BotGapDistance(adapter,origin,horizontalDirection,entityNum)
  if adapter==void or adapter.runtime.services==void or adapter.runtime.services.gapDistanceFn==void then return 0.0 end if;return adapter.runtime.services.gapDistanceFn(adapter.runtime.services.context,origin,horizontalDirection,entityNum)
end function
function BotCheckBarrierJump(adapter,state,direction,speed) return move.checkBarrierJump(adapter.runtime,state,direction,speed) end function
function BotSwimInDirection(adapter,state,direction,speed,type) normalized=move.normalize(direction)[1];return move.emitMovement(adapter.runtime,state,normalized,speed) end function
function BotWalkInDirection(adapter,state,direction,speed,type) if adapter.runtime.services==void or adapter.runtime.services.walkDirectionFn==void then return false end if;return adapter.runtime.services.walkDirectionFn(adapter.runtime.services.context,state,direction,speed,type) end function
function BotMoveInDirection(adapter,handle,direction,speed,type) return move.moveInDirection(adapter.runtime,handle,direction,speed,type) end function

function Intersection(firstStart,firstEnd,secondStart,secondEnd,target)
  dx1=n.fsub(firstEnd[0],firstStart[0]);dy1=n.fsub(firstEnd[1],firstStart[1]);dx2=n.fsub(secondEnd[0],secondStart[0]);dy2=n.fsub(secondEnd[1],secondStart[1]);denominator=n.fsub(n.fmul(dy1,dx2),n.fmul(dx1,dy2));if denominator==0.0 then return false end if
  first=n.fsub(n.fmul(firstStart[1],dx1),n.fmul(firstStart[0],dy1));second=n.fsub(n.fmul(secondStart[1],dx2),n.fmul(secondStart[0],dy2));target[0]=n.trunc32(n.fdiv(n.fsub(n.fmul(dx1,second),n.fmul(dx2,first)),denominator));target[1]=n.trunc32(n.fdiv(n.fsub(n.fmul(dy1,second),n.fmul(dy2,first)),denominator));return true
end function

function BotCheckBlocked(adapter,state,direction,checkBottom,result) return move.checkBlocked(adapter.runtime,state,direction,checkBottom,result) end function
function BotClearMoveResult(result) result.failure=false;result.type=0;result.blocked=false;result.blockEntity=0;result.travelType=0;result.flags=0;return void end function

function BotTravel_Walk(adapter,state,reach) return move.travelWalk(adapter.runtime,state,reach) end function
function BotFinishTravel_Walk(adapter,state,reach)
  result=move.emptyMoveResult();direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];normal=move.normalize(direction);distance=normal[0];direction=normal[1];if distance>100.0 then distance=100.0 end if;if not move.emitMovement(adapter.runtime,state,direction,n.fmul(3.0,distance)) then result.failure=true else result.moveDir=move.copyVector(direction) end if;return result
end function
function BotTravel_Crouch(adapter,state,reach) return move.travelCrouch(adapter.runtime,state,reach) end function
function BotTravel_BarrierJump(adapter,state,reach) return move.travelBarrierJump(adapter.runtime,state,reach) end function
function BotFinishTravel_BarrierJump(adapter,state,reach) return move.finishTravelBarrierJump(adapter.runtime,state,reach) end function
function BotTravel_Swim(adapter,state,reach) return move.travelSwim(adapter.runtime,state,reach) end function
function BotTravel_WaterJump(adapter,state,reach) return move.travelWaterJump(adapter.runtime,state,reach) end function
function BotFinishTravel_WaterJump(adapter,state,reach) return move.finishTravelWaterJump(adapter.runtime,state,reach) end function
function BotTravel_WalkOffLedge(adapter,state,reach) return move.travelWalkOffLedge(adapter.runtime,state,reach) end function
function BotAirControl(adapter,origin,velocity,goal) return move.airControl(adapter.runtime,origin,velocity,goal) end function
function BotFinishTravel_WalkOffLedge(adapter,state,reach) return move.finishTravelWalkOffLedge(adapter.runtime,state,reach) end function
function BotTravel_Jump(adapter,state,reach) return move.travelJump(adapter.runtime,state,reach) end function
function BotFinishTravel_Jump(adapter,state,reach) return move.finishTravelJump(adapter.runtime,state,reach) end function
function BotTravel_Ladder(adapter,state,reach) return move.travelLadder(adapter.runtime,state,reach) end function
function BotTravel_Teleport(adapter,state,reach) return move.travelTeleport(adapter.runtime,state,reach) end function
function BotTravel_Elevator(adapter,state,reach) return move.travelElevator(adapter.runtime,state,reach) end function
function BotFinishTravel_Elevator(adapter,state,reach) return move.finishTravelElevator(adapter.runtime,state,reach) end function

function signed16(value) value=value&0xffff;if value>0x7fff then value=value|0xffff0000 end if;return value end function
function BotFuncBobStartEnd(adapter,reach)
  zero=[0.0,0.0,0.0];if adapter==void or adapter.moverInfoFn==void then return [zero,zero,zero] end if;value=adapter.moverInfoFn(adapter.context,reach.faceNum&0xffff);if value==void or value is error then return [zero,zero,zero] end if
  middle=[n.fmul(0.5,n.fadd(value.mins[0],value.maxs[0])),n.fmul(0.5,n.fadd(value.mins[1],value.maxs[1])),n.fmul(0.5,n.fadd(value.mins[2],value.maxs[2]))];start=move.copyVector(middle);finish=move.copyVector(middle);origin=move.copyVector(value.currentOrigin);flags=(reach.faceNum>>16);first=signed16(reach.edgeNum>>16);second=signed16(reach.edgeNum)
  if (flags&1)!=0 then start[0]=first;finish[0]=second;origin[0]=n.fadd(origin[0],middle[0]);origin[1]=middle[1];origin[2]=middle[2] else if (flags&2)!=0 then start[1]=first;finish[1]=second;origin[0]=middle[0];origin[1]=n.fadd(origin[1],middle[1]);origin[2]=middle[2] else start[2]=first;finish[2]=second;origin[0]=middle[0];origin[1]=middle[1];origin[2]=n.fadd(origin[2],middle[2]) end if;return [start,finish,origin]
end function
function BotTravel_FuncBobbing(adapter,state,reach) return move.travelFuncBob(adapter.runtime,state,reach) end function
function BotFinishTravel_FuncBobbing(adapter,state,reach) return move.finishTravelFuncBob(adapter.runtime,state,reach) end function
function GrappleState(adapter,state,reach) return move.grappleState(adapter.runtime,state,reach) end function
function BotResetGrapple(adapter,state) return move.resetGrapple(adapter.runtime,state) end function
function BotTravel_Grapple(adapter,state,reach) return move.travelGrapple(adapter.runtime,state,reach) end function
function BotTravel_RocketJump(adapter,state,reach) return move.travelWeaponJump(adapter.runtime,state,reach,move.WEAPON_ROCKET_LAUNCHER) end function
function BotTravel_BFGJump(adapter,state,reach) return move.travelWeaponJump(adapter.runtime,state,reach,move.WEAPON_BFG) end function
function BotFinishTravel_WeaponJump(adapter,state,reach) return move.finishTravelWeaponJump(adapter.runtime,state,reach) end function
function BotTravel_JumpPad(adapter,state,reach) return move.travelJumpPad(adapter.runtime,state,reach) end function
function BotFinishTravel_JumpPad(adapter,state,reach) return move.finishTravelJumpPad(adapter.runtime,state,reach) end function
function BotReachabilityTime(reach) return move.reachabilityTime(reach) end function
function BotMoveInGoalArea(adapter,state,goal) return move.moveInGoalArea(adapter.runtime,state,goal) end function
function BotMoveToGoal(adapter,handle,goal,travelFlags) return move.moveToGoal(adapter.runtime,handle,goal,travelFlags) end function

function BotSetupMoveAI(adapter,entities)
  BotSetBrushModelTypes(adapter,entities);if adapter.setupFn!=void then adapter.setupFn(adapter.context) end if;return 0
end function
function BotShutdownMoveAI(adapter)
  if adapter==void then return 0 end if;if adapter.shutdownFn!=void then adapter.shutdownFn(adapter.context) end if
  for handle=1 to pools.MAX_CLIENTS if pools.moveState(adapter.runtime.pools,handle)!=void then pools.freeMoveState(adapter.runtime.pools,handle) end if end for;return 0
end function
