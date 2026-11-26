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

/// These are sent over the net as 8 bits.
const MAX_MODELS=256
/// Bot mover-model classification for none.
const MODELTYPE_NONE=0
/// Bot mover-model classification for func plat.
const MODELTYPE_FUNC_PLAT=1
/// Bot mover-model classification for func bob.
const MODELTYPE_FUNC_BOB=2
/// Bot mover-model classification for func door.
const MODELTYPE_FUNC_DOOR=3
/// Bot mover-model classification for func static.
const MODELTYPE_FUNC_STATIC=4
/// Avoidance-spot mode that removes the previously registered spots.
const AVOID_CLEAR=0
/// Avoidance-spot mode that always rejects paths through the spot.
const AVOID_ALWAYS=1
/// Avoidance-spot mode that influences path choice without blocking all movement.
const AVOID_DONTBLOCK=2

/// `BrushEntity` record for be ai move, containing `classname` and `modelNum`.
struct BrushEntity
  /// Classname of the item.
  classname
  /// Brush-model number associated with the mover or collision entity.
  modelNum
end struct
/// `MoverInfo` record for be ai move, containing `mins`, `maxs`, `origin` and `currentOrigin`.
struct MoverInfo
  /// Minimum XYZ corner of the moving brush model in its local coordinate system.
  mins
  /// Maximum XYZ corner of the moving brush model in its local coordinate system.
  maxs
  /// Reference origin supplied with the moving brush model geometry.
  origin
  /// Current world-space position used for collision and mover queries.
  currentOrigin
end struct
/// `Adapter` record for be ai move, containing `runtime`, `modelTypes`, `context`, `visibleTraceFn` and `moverInfoFn` and related fields.
struct Adapter
  /// Bot movement runtime delegated to by the native-compatible movement API.
  runtime
  /// Movement classifications assigned to brush models.
  modelTypes
  /// Caller-supplied data associated with host mover inspection, visibility checks, and movement-AI
  /// setup.
  context
  /// Host callback that traces visibility to a potential movement target.
  visibleTraceFn
  /// Host callback that retrieves the position and behavior of a moving platform.
  moverInfoFn
  /// Host callback that tests whether the bot is standing on a moving entity.
  onMoverFn
  /// Host callback that tests whether the bot is above the specified obstacle.
  onTopFn
  /// Host callback that initializes the supplied bot-library adapter.
  setupFn
  /// Host callback that shuts down the host subsystem and releases its resources.
  shutdownFn
end struct

/// Create a `mq3.botlib.be_ai_move.Adapter` record, initializing `runtime` from `runtime` and `modelTypes` as `array(MAX_MODELS,MODELTYPE_NONE)`.
/// @param runtime Initial value stored in `mq3.botlib.be_ai_move.Adapter.runtime`.
function create(runtime)
  return Adapter(runtime,array(MAX_MODELS,MODELTYPE_NONE),void,void,void,void,void,void,void)
end function

/// Return the absolute value of the numeric argument for be ai move.
/// @param value Operand used to evaluate the returned expression `0.0-value`.
function absFloat(value) if value<0.0 then return 0.0-value end if;return value end function

/// Forward `AngleDiff` to `mq3.botlib.ai_move_runtime.angleDiff` and return the delegated result.
/// @param ang1 Value passed as argument 1 to `mq3.compat.numeric.fsub`.
/// @param ang2 Value passed as argument 2 to `mq3.compat.numeric.fsub`.
function AngleDiff(ang1,ang2) return move.angleDiff(ang1,ang2) end function

/// Apply `mq3.botlib.ai_resource_pools.allocMoveState` while evaluating `BotAllocMoveState`. Return paths include `pools.allocMoveState(adapter.runtime.pools)`.
/// @param adapter Adapter record; accesses `runtime`.
function BotAllocMoveState(adapter) if adapter==void or adapter.runtime==void then return 0 end if;return pools.allocMoveState(adapter.runtime.pools) end function
/// Apply `mq3.botlib.ai_resource_pools.freeMoveState` while evaluating `BotFreeMoveState`. Return paths include `pools.freeMoveState(adapter.runtime.pools,handle)`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param handle Handle identifying the allocated bot movement state.
function BotFreeMoveState(adapter,handle) if adapter==void or adapter.runtime==void then return 0 end if;return pools.freeMoveState(adapter.runtime.pools,handle) end function
/// Apply `mq3.botlib.ai_resource_pools.moveState` while evaluating `BotMoveStateFromHandle`. Return paths include `pools.moveState(adapter.runtime.pools,handle)`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param handle Handle identifying the allocated bot movement state.
function BotMoveStateFromHandle(adapter,handle) if adapter==void or adapter.runtime==void then return void end if;return pools.moveState(adapter.runtime.pools,handle) end function
/// Apply `mq3.botlib.ai_move_runtime.initMoveState` while evaluating `BotInitMoveState`. Return paths include `move.initMoveState(adapter.runtime,handle,value)`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param handle Handle identifying the allocated bot movement state.
/// @param value Movement initialization record; accesses `origin`, `velocity`, `viewOffset`, `entityNum` and `client` and related fields.
function BotInitMoveState(adapter,handle,value) if adapter==void then return 0 end if;return move.initMoveState(adapter.runtime,handle,value) end function
/// Apply `mq3.botlib.ai_resource_pools.resetAvoidReach` while evaluating `BotResetAvoidReach`. Return paths include `pools.resetAvoidReach(adapter.runtime.pools,handle)`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param handle Resource handle resolved by the owning pool or host service.
function BotResetAvoidReach(adapter,handle) if adapter==void then return 0 end if;return pools.resetAvoidReach(adapter.runtime.pools,handle) end function
/// Apply `mq3.botlib.ai_resource_pools.resetLastAvoidReach` while evaluating `BotResetLastAvoidReach`. Return paths include `pools.resetLastAvoidReach(adapter.runtime.pools,handle)`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param handle Resource handle resolved by the owning pool or host service.
function BotResetLastAvoidReach(adapter,handle) if adapter==void then return 0 end if;return pools.resetLastAvoidReach(adapter.runtime.pools,handle) end function
/// Apply `mq3.botlib.ai_resource_pools.resetMoveState` while evaluating `BotResetMoveState`. Return paths include `pools.resetMoveState(adapter.runtime.pools,handle)`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param handle Handle identifying the allocated bot movement state.
function BotResetMoveState(adapter,handle) if adapter==void then return 0 end if;return pools.resetMoveState(adapter.runtime.pools,handle) end function

/// Forward `BotFuzzyPointReachabilityArea` to `mq3.botlib.ai_move_runtime.fuzzyPointReachabilityArea` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param origin World-space position as three coordinates.
function BotFuzzyPointReachabilityArea(adapter,origin) return move.fuzzyPointReachabilityArea(adapter.runtime,origin) end function
/// Forward `BotReachabilityArea` to `mq3.botlib.ai_move_runtime.reachabilityArea` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param origin World-space position as three coordinates.
/// @param client Value passed as argument 6 to `runtime.services.groundTraceFn`.
function BotReachabilityArea(adapter,origin,client) return move.reachabilityArea(adapter.runtime,origin,client) end function

/// Update `state.avoidReachTries[index]`, `state.avoidReachTimes[index]` and `state.avoidReach[index]` during `BotAddToAvoidReach`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state Be AI move state; accesses `avoidReach`, `avoidReachTimes` and `avoidReachTries`. May update `state.avoidReachTries[index]`, `state.avoidReachTimes[index]` and `state.avoidReach[index]` in place.
/// @param number Value used by `BotAddToAvoidReach` in `if state.avoidReach[index]==number then if state.avoidReachTimes[index]>now then state.avoidReachTries[index]=st...`.
/// @param avoidTime Value passed as argument 2 to `mq3.compat.numeric.fadd`.
function BotAddToAvoidReach(adapter,state,number,avoidTime)
  if adapter==void or state==void then return void end if;now=moveAas.getTime(adapter.runtime.aas)
  for index=0 to pools.MAX_AVOIDREACH-1
    if state.avoidReach[index]==number then if state.avoidReachTimes[index]>now then state.avoidReachTries[index]=state.avoidReachTries[index]+1 else state.avoidReachTries[index]=1 end if;state.avoidReachTimes[index]=n.fadd(now,avoidTime);return void end if
  end for
  for index=0 to pools.MAX_AVOIDREACH-1 if state.avoidReachTimes[index]<now then state.avoidReach[index]=number;state.avoidReachTimes[index]=n.fadd(now,avoidTime);state.avoidReachTries[index]=1;return void end if end for
  return void
end function

/// Forward `DistanceFromLineSquared` to `mq3.botlib.ai_move_runtime.distanceFromLineSquared` and return the delegated result.
/// @param point Three-component point used by the geometric query.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
function DistanceFromLineSquared(point,start,finish) return move.distanceFromLineSquared(point,start,finish) end function
/// Forward `VectorDistanceSquared` to `mq3.botlib.ai_move_runtime.vectorDistanceSquared` and return the delegated result.
/// @param first Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param second Three-component array; components 0, 1 and 2 are used in their stored order.
function VectorDistanceSquared(first,second) return move.vectorDistanceSquared(first,second) end function

/// Apply `mq3.botlib.be_ai_move.DistanceFromLineSquared` and `mq3.botlib.be_ai_move.VectorDistanceSquared` while evaluating `BotAvoidSpots`.
/// @param origin World-space position as three coordinates.
/// @param reach AAS reachability record; accesses `travelType`, `start` and `finish`.
/// @param spots Array or byte sequence accessed at `index`.
/// @param numSpots Value used by `BotAvoidSpots` in `if numSpots>len(spots) then numSpots=len(spots) end if`.
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

/// Apply `mq3.botlib.ai_avoid_spots.add` while evaluating `BotAddAvoidSpot`. Return paths include `avoid.add(adapter.runtime.pools,handle,origin,radius,type)`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param origin World-space position as three coordinates.
/// @param radius Radius used by the spatial or damage query.
/// @param type Value used by `add` in `if type==AVOID_CLEAR then state.numAvoidSpots=0`.
function BotAddAvoidSpot(adapter,handle,origin,radius,type) if adapter==void then return 0 end if;return avoid.add(adapter.runtime.pools,handle,origin,radius,type) end function

/// Apply `mq3.botlib.aas_routing.travelFlagForType` and `mq3.botlib.aas_routing.areaContentsTravelFlags` while evaluating `BotValidTravel`. Return paths include `(travelRequired&(~travelFlags))==0 and (areaRequired&(~travelFlags))==0`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param origin Not read by this implementation; retained in the `BotValidTravel` signature.
/// @param reach AAS reachability record; accesses `travelType` and `areaNum`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function BotValidTravel(adapter,origin,reach,travelFlags)
  if adapter==void or adapter.runtime==void or adapter.runtime.router==void then return false end if
  travelRequired=routing.travelFlagForType(reach.travelType);areaRequired=routing.areaContentsTravelFlags(adapter.runtime.router,reach.areaNum)
  return (travelRequired&(~travelFlags))==0 and (areaRequired&(~travelFlags))==0
end function

/// Apply `mq3.botlib.aas_runtime.getTime`, `mq3.botlib.be_ai_move.BotValidTravel` and `mq3.botlib.aas_routing.areaTravelTimeToGoalArea` while evaluating `BotGetReachabilityToGoal`. Return paths include `[best,resultFlags]`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param origin World-space position as three coordinates.
/// @param areaNum AAS area number; zero denotes no area.
/// @param lastGoalAreaNum Value used by `BotGetReachabilityToGoal` in `if lastGoalAreaNum==goal.areaNum and reach.areaNum==lastAreaNum then continue end if`.
/// @param lastAreaNum Previously visited AAS area number.
/// @param avoidReach Array or byte sequence accessed at `index`.
/// @param avoidTimes Array or byte sequence accessed at `index`.
/// @param avoidTries Array or byte sequence accessed at `index`.
/// @param goal Bot navigation goal; accesses `areaNum`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param moveTravelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param avoidSpots Array or byte sequence accessed at `index`.
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

/// Forward `BotAddToTarget` to `mq3.botlib.ai_move_runtime.addToTarget` and return the delegated result.
/// @param start World-space start of the current path segment.
/// @param finish World-space end of the current path segment.
/// @param maxDistance Maximum distance to advance along the path.
/// @param travelled Distance already accumulated before this segment.
/// @param target Mutable three-component look-ahead target written when the requested distance falls on this segment.
function BotAddToTarget(start,finish,maxDistance,travelled,target) return move.addToTarget(start,finish,maxDistance,travelled,target) end function
/// Forward `BotMovementViewTarget` to `mq3.botlib.ai_move_runtime.movementViewTarget` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param goal Bot navigation goal; accesses `areaNum` and `origin`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param lookAhead Distance to follow along the route when selecting the view target.
/// @param target Three-component array; components 0, 1 and 2 are used in their stored order.
function BotMovementViewTarget(adapter,handle,goal,travelFlags,lookAhead,target) return move.movementViewTarget(adapter.runtime,handle,goal,travelFlags,lookAhead,target) end function

/// Use `adapter.visibleTraceFn` to perform `BotVisible`.
/// @param adapter Adapter record; accesses `visibleTraceFn` and `context`.
/// @param entity Value passed as argument 4 to `adapter.visibleTraceFn`.
/// @param eye Value passed as argument 2 to `adapter.visibleTraceFn`.
/// @param target Value passed as argument 3 to `adapter.visibleTraceFn`.
function BotVisible(adapter,entity,eye,target)
  if adapter==void or adapter.visibleTraceFn==void then return false end if
  return adapter.visibleTraceFn(adapter.context,eye,target,entity,move.CONTENTS_SOLID_PLAYERCLIP)>=1.0
end function
/// Return the result of `context.visibleTraceFn(context.context,goal,point,entity,contents)` for `visibleCallback`.
/// @param context Context record; accesses `visibleTraceFn` and `context`.
/// @param goal Value passed as argument 2 to `context.visibleTraceFn`.
/// @param point Three-component point used by the geometric query.
/// @param entity Value passed as argument 4 to `context.visibleTraceFn`.
/// @param contents Value passed as argument 5 to `context.visibleTraceFn`.
function visibleCallback(context,goal,point,entity,contents) return context.visibleTraceFn(context.context,goal,point,entity,contents) end function
/// Build the `mq3.botlib.ai_predict_visible_position.Result` result for `BotPredictVisiblePosition`. Return paths include `predict.predict(runtime,origin,areaNum,goal,travelFlags)`.
/// @param adapter Adapter record; accesses `visibleTraceFn` and `runtime`.
/// @param origin World-space position as three coordinates.
/// @param areaNum AAS area number; zero denotes no area.
/// @param goal Bot navigation goal; accesses `areaNum`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function BotPredictVisiblePosition(adapter,origin,areaNum,goal,travelFlags)
  if adapter==void or adapter.visibleTraceFn==void then return predict.Result(false,move.copyVector(origin),0,[]) end if
  runtime=predict.create(adapter.runtime.router,adapter,visibleCallback);return predict.predict(runtime,origin,areaNum,goal,travelFlags)
end function

/// Use `adapter.moverInfoFn` to perform `MoverBottomCenter`.
/// @param adapter Adapter record; accesses `moverInfoFn` and `context`.
/// @param reach AAS reachability record; accesses `start` and `faceNum`.
function MoverBottomCenter(adapter,reach)
  result=[0.0,0.0,reach.start[2]];if adapter==void or adapter.moverInfoFn==void then return result end if;value=adapter.moverInfoFn(adapter.context,reach.faceNum&0xffff);if value==void or value is error then return result end if
  result[0]=n.fadd(value.currentOrigin[0],n.fmul(0.5,n.fadd(value.mins[0],value.maxs[0])));result[1]=n.fadd(value.currentOrigin[1],n.fmul(0.5,n.fadd(value.mins[1],value.maxs[1])));return result
end function
/// Use `adapter.moverInfoFn` to perform `MoverDown`. Return paths include `n.fadd(value.currentOrigin[2],value.maxs[2])<reach.start[2]`.
/// @param adapter Adapter record; accesses `moverInfoFn` and `context`.
/// @param reach AAS reachability record; accesses `faceNum` and `start`.
function MoverDown(adapter,reach)
  if adapter==void or adapter.moverInfoFn==void then return false end if;value=adapter.moverInfoFn(adapter.context,reach.faceNum&0xffff);if value==void or value is error then return false end if;return n.fadd(value.currentOrigin[2],value.maxs[2])<reach.start[2]
end function
/// Use `adapter.onMoverFn` to perform `BotOnMover`. Return paths include `adapter.onMoverFn(adapter.context,origin,entityNum,reach)`.
/// @param adapter Adapter record; accesses `onMoverFn` and `context`.
/// @param origin World-space position as three coordinates.
/// @param entityNum Entity number in the game or AAS entity table.
/// @param reach Value passed as argument 4 to `adapter.onMoverFn`.
function BotOnMover(adapter,origin,entityNum,reach) if adapter==void or adapter.onMoverFn==void then return false end if;return adapter.onMoverFn(adapter.context,origin,entityNum,reach) end function
/// Use `adapter.onTopFn` to perform `BotOnTopOfEntity`. Return paths include `adapter.onTopFn(adapter.context,state)`.
/// @param adapter Adapter record; accesses `onTopFn` and `context`.
/// @param state Value passed as argument 2 to `adapter.onTopFn`.
function BotOnTopOfEntity(adapter,state) if adapter==void or adapter.onTopFn==void then return -1 end if;return adapter.onTopFn(adapter.context,state) end function

/// Update `adapter.modelTypes` and `adapter.modelTypes[model]` during `BotSetBrushModelTypes`.
/// @param adapter Adapter record; accesses `modelTypes`. May update `adapter.modelTypes` and `adapter.modelTypes[model]` in place.
/// @param entities Value used by `BotSetBrushModelTypes` in `for each entity in entities model=entity.modelNum`.
function BotSetBrushModelTypes(adapter,entities)
  adapter.modelTypes=array(MAX_MODELS,MODELTYPE_NONE)
  for each entity in entities model=entity.modelNum;if model<0 or model>=MAX_MODELS then continue end if;name=strings.toLowerAscii(entity.classname);if name=="func_bobbing" then adapter.modelTypes[model]=MODELTYPE_FUNC_BOB else if name=="func_plat" then adapter.modelTypes[model]=MODELTYPE_FUNC_PLAT else if name=="func_door" then adapter.modelTypes[model]=MODELTYPE_FUNC_DOOR else if name=="func_static" then adapter.modelTypes[model]=MODELTYPE_FUNC_STATIC end if end for
  return void
end function

/// Use `adapter.runtime.services.gapDistanceFn` to perform `BotGapDistance`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param origin World-space position as three coordinates.
/// @param horizontalDirection Value passed as argument 3 to `adapter.runtime.services.gapDistanceFn`.
/// @param entityNum Entity number in the game or AAS entity table.
function BotGapDistance(adapter,origin,horizontalDirection,entityNum)
  if adapter==void or adapter.runtime.services==void or adapter.runtime.services.gapDistanceFn==void then return 0.0 end if;return adapter.runtime.services.gapDistanceFn(adapter.runtime.services.context,origin,horizontalDirection,entityNum)
end function
/// Forward `BotCheckBarrierJump` to `mq3.botlib.ai_move_runtime.checkBarrierJump` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `moveFlags`. May update `state.moveFlags` in place.
/// @param direction Array or byte sequence accessed at `0` and `1`.
/// @param speed Requested movement speed.
function BotCheckBarrierJump(adapter,state,direction,speed) return move.checkBarrierJump(adapter.runtime,state,direction,speed) end function
/// Apply `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.emitMovement` while evaluating `BotSwimInDirection`. Return paths include `move.emitMovement(adapter.runtime,state,normalized,speed)`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `client`.
/// @param direction Second three-component point.
/// @param speed Requested movement speed.
/// @param type Not read by this implementation; retained in the `BotSwimInDirection` signature.
function BotSwimInDirection(adapter,state,direction,speed,type) normalized=move.normalize(direction)[1];return move.emitMovement(adapter.runtime,state,normalized,speed) end function
/// Use `adapter.runtime.services.walkDirectionFn` to perform `BotWalkInDirection`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state Value passed as argument 2 to `adapter.runtime.services.walkDirectionFn`.
/// @param direction Value passed as argument 3 to `adapter.runtime.services.walkDirectionFn`.
/// @param speed Requested movement speed.
/// @param type Value passed as argument 5 to `adapter.runtime.services.walkDirectionFn`.
function BotWalkInDirection(adapter,state,direction,speed,type) if adapter.runtime.services==void or adapter.runtime.services.walkDirectionFn==void then return false end if;return adapter.runtime.services.walkDirectionFn(adapter.runtime.services.context,state,direction,speed,type) end function
/// Forward `BotMoveInDirection` to `mq3.botlib.ai_move_runtime.moveInDirection` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param direction Second three-component point.
/// @param speed Requested movement speed.
/// @param type Value passed as argument 5 to `runtime.services.walkDirectionFn`.
function BotMoveInDirection(adapter,handle,direction,speed,type) return move.moveInDirection(adapter.runtime,handle,direction,speed,type) end function

/// Update `target[0]` and `target[1]` during `Intersection`.
/// @param firstStart Array or byte sequence accessed at `0` and `1`.
/// @param firstEnd Array or byte sequence accessed at `0` and `1`.
/// @param secondStart Array or byte sequence accessed at `0` and `1`.
/// @param secondEnd Array or byte sequence accessed at `0` and `1`.
/// @param target Array or byte sequence accessed at `0` and `1`. Entries are written in place.
function Intersection(firstStart,firstEnd,secondStart,secondEnd,target)
  dx1=n.fsub(firstEnd[0],firstStart[0]);dy1=n.fsub(firstEnd[1],firstStart[1]);dx2=n.fsub(secondEnd[0],secondStart[0]);dy2=n.fsub(secondEnd[1],secondStart[1]);denominator=n.fsub(n.fmul(dy1,dx2),n.fmul(dx1,dy2));if denominator==0.0 then return false end if
  first=n.fsub(n.fmul(firstStart[1],dx1),n.fmul(firstStart[0],dy1));second=n.fsub(n.fmul(secondStart[1],dx2),n.fmul(secondStart[0],dy2));target[0]=n.trunc32(n.fdiv(n.fsub(n.fmul(dx1,second),n.fmul(dx2,first)),denominator));target[1]=n.trunc32(n.fdiv(n.fsub(n.fmul(dy1,second),n.fmul(dy2,first)),denominator));return true
end function

/// Forward `BotCheckBlocked` to `mq3.botlib.ai_move_runtime.checkBlocked` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state Value passed as argument 2 to `runtime.services.blockTraceFn`.
/// @param direction Value passed as argument 3 to `runtime.services.blockTraceFn`.
/// @param checkBottom Value passed as argument 4 to `runtime.services.blockTraceFn`.
/// @param result Result record; accesses `blocked` and `blockEntity`. May update `result.blocked` and `result.blockEntity` in place.
function BotCheckBlocked(adapter,state,direction,checkBottom,result) return move.checkBlocked(adapter.runtime,state,direction,checkBottom,result) end function
/// Update `result.failure`, `result.type`, `result.blocked` and `result.blockEntity` and related state during `BotClearMoveResult`.
/// @param result Result record; accesses `failure`, `type`, `blocked`, `blockEntity` and `travelType` and related fields. May update `result.failure`, `result.type` and `result.blocked` and additional fields in place.
function BotClearMoveResult(result) result.failure=false;result.type=0;result.blocked=false;result.blockEntity=0;result.travelType=0;result.flags=0;return void end function

/// Forward `BotTravel_Walk` to `mq3.botlib.ai_move_runtime.travelWalk` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin` and `moveFlags`.
/// @param reach AAS reachability record; accesses `start`, `finish` and `areaNum`.
function BotTravel_Walk(adapter,state,reach) return move.travelWalk(adapter.runtime,state,reach) end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.emitMovement` while evaluating `BotFinishTravel_Walk`.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state Be AI move state; accesses `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function BotFinishTravel_Walk(adapter,state,reach)
  result=move.emptyMoveResult();direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];normal=move.normalize(direction);distance=normal[0];direction=normal[1];if distance>100.0 then distance=100.0 end if;if not move.emitMovement(adapter.runtime,state,direction,n.fmul(3.0,distance)) then result.failure=true else result.moveDir=move.copyVector(direction) end if;return result
end function
/// Forward `BotTravel_Crouch` to `mq3.botlib.ai_move_runtime.travelCrouch` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function BotTravel_Crouch(adapter,state,reach) return move.travelCrouch(adapter.runtime,state,reach) end function
/// Forward `BotTravel_BarrierJump` to `mq3.botlib.ai_move_runtime.travelBarrierJump` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `start`.
function BotTravel_BarrierJump(adapter,state,reach) return move.travelBarrierJump(adapter.runtime,state,reach) end function
/// Forward `BotFinishTravel_BarrierJump` to `mq3.botlib.ai_move_runtime.finishTravelBarrierJump` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `velocity` and `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function BotFinishTravel_BarrierJump(adapter,state,reach) return move.finishTravelBarrierJump(adapter.runtime,state,reach) end function
/// Forward `BotTravel_Swim` to `mq3.botlib.ai_move_runtime.travelSwim` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `start`.
function BotTravel_Swim(adapter,state,reach) return move.travelSwim(adapter.runtime,state,reach) end function
/// Forward `BotTravel_WaterJump` to `mq3.botlib.ai_move_runtime.travelWaterJump` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function BotTravel_WaterJump(adapter,state,reach) return move.travelWaterJump(adapter.runtime,state,reach) end function
/// Forward `BotFinishTravel_WaterJump` to `mq3.botlib.ai_move_runtime.finishTravelWaterJump` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `moveFlags` and `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function BotFinishTravel_WaterJump(adapter,state,reach) return move.finishTravelWaterJump(adapter.runtime,state,reach) end function
/// Forward `BotTravel_WalkOffLedge` to `mq3.botlib.ai_move_runtime.travelWalkOffLedge` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `start` and `finish`.
function BotTravel_WalkOffLedge(adapter,state,reach) return move.travelWalkOffLedge(adapter.runtime,state,reach) end function
/// Forward `BotAirControl` to `mq3.botlib.ai_move_runtime.airControl` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param origin World-space position as three coordinates.
/// @param velocity Three-component movement velocity.
/// @param goal Three-component array; components 0, 1 and 2 are used in their stored order.
function BotAirControl(adapter,origin,velocity,goal) return move.airControl(adapter.runtime,origin,velocity,goal) end function
/// Forward `BotFinishTravel_WalkOffLedge` to `mq3.botlib.ai_move_runtime.finishTravelWalkOffLedge` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin` and `velocity`.
/// @param reach AAS reachability record; accesses `finish`.
function BotFinishTravel_WalkOffLedge(adapter,state,reach) return move.finishTravelWalkOffLedge(adapter.runtime,state,reach) end function
/// Forward `BotTravel_Jump` to `mq3.botlib.ai_move_runtime.travelJump` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `reachAreaNum`, `origin`, `jumpReach` and `lastReachNum`. May update `state.jumpReach` in place.
/// @param reach AAS reachability record; accesses `start` and `finish`.
function BotTravel_Jump(adapter,state,reach) return move.travelJump(adapter.runtime,state,reach) end function
/// Forward `BotFinishTravel_Jump` to `mq3.botlib.ai_move_runtime.finishTravelJump` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `jumpReach` and `origin`.
/// @param reach AAS reachability record; accesses `finish` and `start`.
function BotFinishTravel_Jump(adapter,state,reach) return move.finishTravelJump(adapter.runtime,state,reach) end function
/// Forward `BotTravel_Ladder` to `mq3.botlib.ai_move_runtime.travelLadder` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function BotTravel_Ladder(adapter,state,reach) return move.travelLadder(adapter.runtime,state,reach) end function
/// Forward `BotTravel_Teleport` to `mq3.botlib.ai_move_runtime.travelTeleport` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `moveFlags` and `origin`.
/// @param reach AAS reachability record; accesses `start`.
function BotTravel_Teleport(adapter,state,reach) return move.travelTeleport(adapter.runtime,state,reach) end function
/// Forward `BotTravel_Elevator` to `mq3.botlib.ai_move_runtime.travelElevator` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `moveFlags`, `origin` and `reachabilityTime`. May update `state.reachabilityTime` in place.
/// @param reach AAS reachability record; accesses `finish` and `start`.
function BotTravel_Elevator(adapter,state,reach) return move.travelElevator(adapter.runtime,state,reach) end function
/// Forward `BotFinishTravel_Elevator` to `mq3.botlib.ai_move_runtime.finishTravelElevator` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function BotFinishTravel_Elevator(adapter,state,reach) return move.finishTravelElevator(adapter.runtime,state,reach) end function

/// Sign-extend the low sixteen bits into the original 32-bit signed representation.
/// @param value Operand used to evaluate the returned expression `value`.
function signed16(value) value=value&0xffff;if value>0x7fff then value=value|0xffff0000 end if;return value end function
/// Use `adapter.moverInfoFn` to perform `BotFuncBobStartEnd`. Return paths include `[start,finish,origin]`.
/// @param adapter Adapter record; accesses `moverInfoFn` and `context`.
/// @param reach AAS reachability record; accesses `faceNum` and `edgeNum`.
function BotFuncBobStartEnd(adapter,reach)
  zero=[0.0,0.0,0.0];if adapter==void or adapter.moverInfoFn==void then return [zero,zero,zero] end if;value=adapter.moverInfoFn(adapter.context,reach.faceNum&0xffff);if value==void or value is error then return [zero,zero,zero] end if
  middle=[n.fmul(0.5,n.fadd(value.mins[0],value.maxs[0])),n.fmul(0.5,n.fadd(value.mins[1],value.maxs[1])),n.fmul(0.5,n.fadd(value.mins[2],value.maxs[2]))];start=move.copyVector(middle);finish=move.copyVector(middle);origin=move.copyVector(value.currentOrigin);flags=(reach.faceNum>>16);first=signed16(reach.edgeNum>>16);second=signed16(reach.edgeNum)
  if (flags&1)!=0 then start[0]=first;finish[0]=second;origin[0]=n.fadd(origin[0],middle[0]);origin[1]=middle[1];origin[2]=middle[2] else if (flags&2)!=0 then start[1]=first;finish[1]=second;origin[0]=middle[0];origin[1]=n.fadd(origin[1],middle[1]);origin[2]=middle[2] else start[2]=first;finish[2]=second;origin[0]=middle[0];origin[1]=middle[1];origin[2]=n.fadd(origin[2],middle[2]) end if;return [start,finish,origin]
end function
/// Forward `BotTravel_FuncBobbing` to `mq3.botlib.ai_move_runtime.travelFuncBob` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `moveFlags`, `origin` and `reachabilityTime`. May update `state.reachabilityTime` in place.
/// @param reach AAS reachability record; accesses `finish` and `start`.
function BotTravel_FuncBobbing(adapter,state,reach) return move.travelFuncBob(adapter.runtime,state,reach) end function
/// Forward `BotFinishTravel_FuncBobbing` to `mq3.botlib.ai_move_runtime.finishTravelFuncBob` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `moveFlags` and `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function BotFinishTravel_FuncBobbing(adapter,state,reach) return move.finishTravelFuncBob(adapter.runtime,state,reach) end function
/// Forward `GrappleState` to `mq3.botlib.ai_move_runtime.grappleState` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `moveFlags`.
/// @param reach Value passed as argument 3 to `runtime.services.grappleStateFn`.
function GrappleState(adapter,state,reach) return move.grappleState(adapter.runtime,state,reach) end function
/// Forward `BotResetGrapple` to `mq3.botlib.ai_move_runtime.resetGrapple` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `lastReachNum`, `moveFlags` and `grappleVisibleTime`. May update `state.moveFlags` and `state.grappleVisibleTime` in place.
function BotResetGrapple(adapter,state) return move.resetGrapple(adapter.runtime,state) end function
/// Forward `BotTravel_Grapple` to `mq3.botlib.ai_move_runtime.travelGrapple` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `moveFlags`, `origin`, `lastGrappleDist`, `grappleVisibleTime` and `viewOffset` and related fields. May update `state.moveFlags`, `state.grappleVisibleTime` and `state.lastGrappleDist` and additional fields in place.
/// @param reach AAS reachability record; accesses `finish` and `start`.
function BotTravel_Grapple(adapter,state,reach) return move.travelGrapple(adapter.runtime,state,reach) end function
/// Forward `BotTravel_RocketJump` to `mq3.botlib.ai_move_runtime.travelWeaponJump` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin`, `viewAngles`, `jumpReach` and `lastReachNum`. May update `state.jumpReach` in place.
/// @param reach AAS reachability record; accesses `start` and `finish`.
function BotTravel_RocketJump(adapter,state,reach) return move.travelWeaponJump(adapter.runtime,state,reach,move.WEAPON_ROCKET_LAUNCHER) end function
/// Forward `BotTravel_BFGJump` to `mq3.botlib.ai_move_runtime.travelWeaponJump` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin`, `viewAngles`, `jumpReach` and `lastReachNum`. May update `state.jumpReach` in place.
/// @param reach AAS reachability record; accesses `start` and `finish`.
function BotTravel_BFGJump(adapter,state,reach) return move.travelWeaponJump(adapter.runtime,state,reach,move.WEAPON_BFG) end function
/// Forward `BotFinishTravel_WeaponJump` to `mq3.botlib.ai_move_runtime.finishTravelWeaponJump` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `jumpReach`, `origin` and `velocity`.
/// @param reach AAS reachability record; accesses `finish`.
function BotFinishTravel_WeaponJump(adapter,state,reach) return move.finishTravelWeaponJump(adapter.runtime,state,reach) end function
/// Forward `BotTravel_JumpPad` to `mq3.botlib.ai_move_runtime.travelJumpPad` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `start`.
function BotTravel_JumpPad(adapter,state,reach) return move.travelJumpPad(adapter.runtime,state,reach) end function
/// Forward `BotFinishTravel_JumpPad` to `mq3.botlib.ai_move_runtime.finishTravelJumpPad` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `origin` and `velocity`.
/// @param reach AAS reachability record; accesses `finish`.
function BotFinishTravel_JumpPad(adapter,state,reach) return move.finishTravelJumpPad(adapter.runtime,state,reach) end function
/// Forward `BotReachabilityTime` to `mq3.botlib.ai_move_runtime.reachabilityTime` and return the delegated result.
/// @param reach AAS reachability record; accesses `travelType`.
function BotReachabilityTime(reach) return move.reachabilityTime(reach) end function
/// Forward `BotMoveInGoalArea` to `mq3.botlib.ai_move_runtime.moveInGoalArea` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param state AI move runtime state; accesses `moveFlags`, `origin`, `lastReachNum`, `lastAreaNum` and `lastGoalAreaNum` and related fields. May update `state.lastReachNum`, `state.lastAreaNum` and `state.lastGoalAreaNum` and additional fields in place.
/// @param goal Bot navigation goal; accesses `origin` and `areaNum`.
function BotMoveInGoalArea(adapter,state,goal) return move.moveInGoalArea(adapter.runtime,state,goal) end function
/// Forward `BotMoveToGoal` to `mq3.botlib.ai_move_runtime.moveToGoal` and return the delegated result.
/// @param adapter Adapter record; accesses `runtime`.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param goal Bot navigation goal; accesses `areaNum`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function BotMoveToGoal(adapter,handle,goal,travelFlags) return move.moveToGoal(adapter.runtime,handle,goal,travelFlags) end function

/// Use `adapter.setupFn` to perform `BotSetupMoveAI`.
/// @param adapter Adapter record; accesses `setupFn` and `context`.
/// @param entities Value used by `BotSetBrushModelTypes` in `for each entity in entities model=entity.modelNum`.
function BotSetupMoveAI(adapter,entities)
  BotSetBrushModelTypes(adapter,entities);if adapter.setupFn!=void then adapter.setupFn(adapter.context) end if;return 0
end function
/// Use `adapter.shutdownFn` to perform `BotShutdownMoveAI`.
/// @param adapter Adapter record; accesses `shutdownFn`, `context` and `runtime`.
function BotShutdownMoveAI(adapter)
  if adapter==void then return 0 end if;if adapter.shutdownFn!=void then adapter.shutdownFn(adapter.context) end if
  for handle=1 to pools.MAX_CLIENTS if pools.moveState(adapter.runtime.pools,handle)!=void then pools.freeMoveState(adapter.runtime.pools,handle) end if end for;return 0
end function
