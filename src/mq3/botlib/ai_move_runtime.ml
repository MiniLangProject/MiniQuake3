// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Focused movement-state services from code/botlib/be_ai_move.c.
package mq3.botlib.ai_move_runtime

import mq3.botlib.public_headers as publicHeaders
import mq3.botlib.ai_resource_pools as resources
import mq3.botlib.aas_runtime as moveAas
import mq3.botlib.aas_routing as moveRouting
import mq3.botlib.aas_trace_areas as moveTraceAreas
import mq3.botlib.elementary_actions as moveEa
import mq3.compat.numeric as n
import mq3.shared.math as moveQMath

/// Bot-library syscall identifier for move to goal.
const OP_MOVE_TO_GOAL=549
/// Bot-library syscall identifier for move in direction.
const OP_MOVE_IN_DIRECTION=550
/// Bot-library syscall identifier for area reachability area.
const OP_REACHABILITY_AREA=553
/// Bot-library syscall identifier for movement view target.
const OP_MOVEMENT_VIEW_TARGET=554
/// Bot-library syscall identifier for init move state.
const OP_INIT_MOVE_STATE=557
/// Bot is performing a barrier jump.
const MFL_BARRIERJUMP=publicHeaders.MFL_BARRIERJUMP
/// Bot is in the ground.
const MFL_ONGROUND=publicHeaders.MFL_ONGROUND
/// Bot is swimming.
const MFL_SWIMMING=publicHeaders.MFL_SWIMMING
/// Bot is against a ladder.
const MFL_AGAINSTLADDER=publicHeaders.MFL_AGAINSTLADDER
/// Bot is waterjumping.
const MFL_WATERJUMP=publicHeaders.MFL_WATERJUMP
/// Bot is being teleported.
const MFL_TELEPORTED=publicHeaders.MFL_TELEPORTED
/// Bot is being pulled by the grapple.
const MFL_GRAPPLEPULL=publicHeaders.MFL_GRAPPLEPULL
/// Bot should walk slowly.
const MFL_WALK=publicHeaders.MFL_WALK
/// Bot is using the grapple hook.
const MFL_ACTIVEGRAPPLE=publicHeaders.MFL_ACTIVEGRAPPLE
/// Bot has reset the grapple.
const MFL_GRAPPLERESET=publicHeaders.MFL_GRAPPLERESET
/// Combined mask of movement-state flags that callers may supply externally.
const EXTERNAL_MOVE_FLAGS=MFL_ONGROUND|MFL_WATERJUMP|MFL_TELEPORTED|MFL_GRAPPLEPULL|MFL_WALK
/// Bot mover-model classification for func plat.
const MODELTYPE_FUNC_PLAT=1
/// Bot mover-model classification for func bob.
const MODELTYPE_FUNC_BOB=2
/// Bot mover-model classification for func door.
const MODELTYPE_FUNC_DOOR=3
/// Bot mover-model classification for func static.
const MODELTYPE_FUNC_STATIC=4
/// Reserved entity number identifying world geometry.
const ENTITYNUM_WORLD=1022
/// Reserved entity number indicating that no game entity is selected.
const ENTITYNUM_NONE=1023
/// Combined collision mask for solid geometry and player-only clipping volumes.
const CONTENTS_SOLID_PLAYERCLIP=0x10001
/// Collision contents bit marking lava.
const CONTENTS_LAVA=8
/// Collision contents bit marking slime.
const CONTENTS_SLIME=16
/// Collision contents bit marking water.
const CONTENTS_WATER=32
/// Bot movement-mode identifier for walk.
const MOVE_WALK=publicHeaders.MOVE_WALK
/// Bot movement-mode identifier for crouch.
const MOVE_CROUCH=publicHeaders.MOVE_CROUCH
/// Bot movement-mode identifier for jump.
const MOVE_JUMP=publicHeaders.MOVE_JUMP
/// Bot uses view for movement.
const MOVERESULT_MOVEMENTVIEW=publicHeaders.MOVERESULT_MOVEMENTVIEW
/// Bot uses view for swimming.
const MOVERESULT_SWIMVIEW=publicHeaders.MOVERESULT_SWIMVIEW
/// Bot is waiting for something.
const MOVERESULT_WAITING=publicHeaders.MOVERESULT_WAITING
/// Bot has set the view in movement code.
const MOVERESULT_MOVEMENTVIEWSET=publicHeaders.MOVERESULT_MOVEMENTVIEWSET
/// Bot uses weapon for movement.
const MOVERESULT_MOVEMENTWEAPON=publicHeaders.MOVERESULT_MOVEMENTWEAPON
/// Bot is ontop of obstacle.
const MOVERESULT_ONTOPOFOBSTACLE=publicHeaders.MOVERESULT_ONTOPOFOBSTACLE
/// Bot is blocked by an avoid spot.
const MOVERESULT_BLOCKEDBYAVOIDSPOT=publicHeaders.MOVERESULT_BLOCKEDBYAVOIDSPOT
/// Elevator is up.
const RESULTTYPE_ELEVATORUP=publicHeaders.RESULTTYPE_ELEVATORUP
/// Waiting for func bobbing to arrive.
const RESULTTYPE_WAITFORFUNCBOBBING=publicHeaders.RESULTTYPE_WAITFORFUNCBOBBING
/// Grapple path is obstructed.
const RESULTTYPE_BADGRAPPLEPATH=publicHeaders.RESULTTYPE_BADGRAPPLEPATH
/// Stuck in solid area, this is bad.
const RESULTTYPE_INSOLIDAREA=publicHeaders.RESULTTYPE_INSOLIDAREA
/// Avoidance-spot mode that always rejects paths through the spot.
const AVOID_ALWAYS=publicHeaders.AVOID_ALWAYS
/// Number of failed attempts before a reachability is temporarily avoided.
const AVOIDREACH_TRIES=4

/// `InitMove` record for ai move runtime, containing `origin`, `velocity`, `viewOffset`, `entityNum` and `client` and related fields.
struct InitMove
  /// Initial bot position copied into the movement state for this think cycle.
  origin
  /// World-space linear velocity associated with the moving entity.
  velocity
  /// Offset from the entity origin to the viewing position.
  viewOffset
  /// Number of the game entity associated with this result.
  entityNum
  /// Client number of the bot.
  client
  /// Time the bot thinks.
  thinkTime
  /// Presence-type mask describing the bot hull or stance allowed here.
  presenceType
  /// Pitch, yaw, and roll angles describing the current view direction.
  viewAngles
  /// Values ored to the movement flags.
  orMoveFlags
end struct
/// Weapon identifier used when planning a rocket-assisted jump.
const WEAPON_ROCKET_LAUNCHER=5
/// Weapon identifier used when planning a BFG-assisted jump.
const WEAPON_BFG=9
/// Weapon identifier used to fire the grappling hook.
const WEAPON_GRAPPLE=10

/// `Services` record for ai move runtime, containing `context`, `groundTraceFn`, `entityModelFn`, `modelTypeFn` and `modelReachabilityFn` and related fields.
struct Services
  /// Caller-supplied data associated with bot movement traces, mover queries, route choices, and
  /// movement settings.
  context
  /// Host callback that tests the ground below the moving bot.
  groundTraceFn
  /// Host callback that returns the collision model associated with an entity.
  entityModelFn
  /// Host callback that classifies the movement behavior of a model.
  modelTypeFn
  /// Host callback that finds reachabilities associated with a mover model.
  modelReachabilityFn
  /// Host callback that tests whether the bot is currently swimming.
  swimmingFn
  /// Host callback that traces a bot or client hull through the collision world.
  clientTraceFn
  /// Host callback that iterates outgoing reachabilities of an AAS area.
  nextReachabilityFn
  /// Elementary-action interface used to emit movement and view input.
  elementaryActions
  /// Host callback that tests whether the bot hull is resting on the ground.
  onGroundFn
  /// Host callback that reports whether the bot hull is against a climbable ladder.
  againstLadderFn
  /// Host callback that measures a gap along a proposed movement direction.
  gapDistanceFn
  /// Host callback that tests movement against blocking geometry.
  blockTraceFn
  /// Host callback that tests walking along a proposed direction.
  walkDirectionFn
  /// Host callback that finds a run-up position for a planned jump.
  jumpRunStartFn
  /// Host callback that returns the gravity used for movement prediction.
  gravityFn
  /// Host callback that computes horizontal speed needed to reach a jump destination.
  horizontalVelocityForJumpFn
  /// Host callback that queries the current movement state of an elevator.
  elevatorStateFn
  /// Host callback that evaluates a jump over a low movement barrier.
  barrierJumpFn
  /// Host callback that selects a reachability along the requested route.
  routeReachabilityFn
  /// Host callback that supplies the random values used by bot selection and fuzzy logic.
  randomFn
  /// Host callback that queries world contents at a supplied point.
  pointContentsFn
  /// Host callback that queries a bobbing mover's endpoints and current position.
  funcBobStateFn
  /// Host callback that returns grappling-hook movement settings.
  grappleConfigFn
  /// Host callback that reports the current grappling-hook movement state.
  grappleStateFn
  /// Host callback that tests the path of a proposed grappling-hook movement.
  grappleTraceFn
  /// Host callback that returns estimated AAS travel time between route positions.
  routeTravelTimeFn
end struct
/// `Runtime` record for ai move runtime, containing `pools`, `aas`, `router` and `services`.
struct Runtime
  /// Managed pools containing bot chat, goal, movement, and weapon resources.
  pools
  /// AAS navigation runtime used for area and route queries.
  aas
  /// AAS navigation state supplying area settings and reachabilities for route searches.
  router
  /// Movement host operations for traces, movers, route selection, and action execution.
  services
end struct
/// `GroundTrace` record for ai move runtime, containing `startSolid`, `fraction`, `entity` and `endPos`.
struct GroundTrace
  /// True when the initial trace position lies inside solid geometry.
  startSolid
  /// Fraction of the requested trace segment completed before the first collision.
  fraction
  /// Entity number of the ground or obstacle reported by the trace.
  entity
  /// End position reached by the collision trace.
  endPos
end struct
/// `ElevatorState` record for ai move runtime, containing `onMover`, `down`, `bottomCenter` and `maxBarrier`.
struct ElevatorState
  /// True when the bot is standing on the queried moving platform.
  onMover
  /// True when the elevator is at or moving toward its lower position.
  down
  /// Center of the mover's lower support surface.
  bottomCenter
  /// Maximum obstacle height accepted by a barrier-jump prediction.
  maxBarrier
end struct
/// `FuncBobState` record for ai move runtime, containing `onMover`, `start`, `finish`, `origin` and `bottomCenter` and related fields.
struct FuncBobState
  /// True when the bot is standing on the queried moving platform.
  onMover
  /// Boarding endpoint of the bobbing platform trajectory.
  start
  /// Destination endpoint of the bobbing platform trajectory.
  finish
  /// Current world-space center of the bobbing platform used to decide boarding and departure.
  origin
  /// Center of the mover's lower support surface.
  bottomCenter
  /// Maximum obstacle height accepted by a barrier-jump prediction.
  maxBarrier
end struct
/// `GrappleConfig` record for ai move runtime, containing `offhand`, `weaponIndex`, `onCommand` and `offCommand`.
struct GrappleConfig
  /// True when the grappling hook uses an off-hand command instead of a selected weapon.
  offhand
  /// Inventory or weapon-table index associated with the weapon.
  weaponIndex
  /// Console command used to activate the grappling hook.
  onCommand
  /// Console command used to release the grappling hook.
  offCommand
end struct
/// `ViewTargetResult` record for ai move runtime, containing `found` and `target`.
struct ViewTargetResult
  /// True when the requested lookup produced a matching entry.
  found
  /// World-space point the bot should look toward while moving.
  target
end struct
/// `MoveResult` record for ai move runtime, containing `failure`, `type`, `blocked`, `blockEntity` and `travelType` and related fields.
struct MoveResult
  /// Failure indicator returned by the movement or navigation operation.
  failure
  /// Failure or blocked type.
  type
  /// True when an obstacle prevents the requested movement.
  blocked
  /// Entity blocking the bot.
  blockEntity
  /// Encoded AAS movement type required to traverse this link.
  travelType
  /// Movement-result flags requesting view, weapon, or waiting behavior.
  flags
  /// Weapon identifier selected by the bot or user command.
  weapon
  /// Direction requested by the bot movement result.
  moveDir
  /// Ideal viewangles for the movement.
  idealViewAngles
end struct

/// Create a `mq3.botlib.ai_move_runtime.Services` record, initializing `context` from `context`.
/// @param context Context forwarded to the configured host callbacks.
function services(context) return Services(context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
/// Create a `mq3.botlib.ai_move_runtime.Runtime` record, initializing `pools` from `pools`, `aas` from `aas` and `router` from `router`.
/// @param pools Initial value stored in `mq3.botlib.ai_move_runtime.Runtime.pools`.
/// @param aas Initial value stored in `mq3.botlib.ai_move_runtime.Runtime.aas`.
/// @param router Initial value stored in `mq3.botlib.ai_move_runtime.Runtime.router`.
/// @param host Initial value stored in `mq3.botlib.ai_move_runtime.Runtime.services`.
function create(pools,aas,router,host) return Runtime(pools,aas,router,host) end function
/// Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for ai move runtime.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function copyVector(value) return [value[0],value[1],value[2]] end function
/// Calculate Euclidean distance between two 3D points using the original single-precision arithmetic sequence.
/// @param a First three-component point.
/// @param b Second three-component point.
function distance(a,b) x=n.fsub(b[0],a[0]);y=n.fsub(b[1],a[1]);z=n.fsub(b[2],a[2]);return n.fsqrt(n.fadd(n.fadd(n.fmul(x,x),n.fmul(y,y)),n.fmul(z,z))) end function

/// Initialize a pooled bot movement state, copy its vectors, and replace only the externally supplied movement flags.
/// @param runtime AI move runtime; accesses `pools`.
/// @param handle Handle identifying the allocated bot movement state.
/// @param init Movement initialization record; accesses `origin`, `velocity`, `viewOffset`, `entityNum` and `client` and related fields.
function initMoveState(runtime,handle,init)
  if runtime==void or init==void then return 0 end if;state=resources.moveState(runtime.pools,handle);if state==void then return 0 end if
  state.origin=copyVector(init.origin);state.velocity=copyVector(init.velocity);state.viewOffset=copyVector(init.viewOffset);state.entityNum=init.entityNum;state.client=init.client;state.thinkTime=init.thinkTime;state.presenceType=init.presenceType;state.viewAngles=copyVector(init.viewAngles)
  state.moveFlags=(state.moveFlags&(~EXTERNAL_MOVE_FLAGS))|(init.orMoveFlags&EXTERNAL_MOVE_FLAGS);return 0
end function

/// Find a reachable AAS area at or near an origin using upward and neighboring traces, with the containing area as fallback.
/// @param runtime AI move runtime; accesses `aas`.
/// @param origin World-space position as three coordinates.
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

/// Trace three units downward with crouching bounds through the host ground-trace callback; return void when unavailable.
/// @param runtime AI move runtime; accesses `services`.
/// @param origin World-space position as three coordinates.
/// @param client Value passed as argument 6 to `runtime.services.groundTraceFn`.
function callGroundTrace(runtime,origin,client)
  if runtime.services==void or runtime.services.groundTraceFn==void then return void end if
  bounds=moveAas.presenceTypeBoundingBox(moveAas.PRESENCE_CROUCH);finish=[origin[0],origin[1],n.fsub(origin[2],3.0)];return runtime.services.groundTraceFn(runtime.services.context,origin,bounds[0],bounds[1],finish,client,CONTENTS_SOLID_PLAYERCLIP)
end function
/// Resolve the movement area beneath a bot, including elevators, bobbing movers, swimming and a downward-trace fallback.
/// @param runtime AI move runtime; accesses `services`, `router` and `aas`.
/// @param origin World-space position as three coordinates.
/// @param client Value passed as argument 6 to `runtime.services.groundTraceFn`.
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

/// Advance a look-ahead target along a path segment and return whether the requested distance has been reached.
/// @param start World-space start of the current path segment.
/// @param finish World-space end of the current path segment.
/// @param maxDistance Maximum distance to advance along the path.
/// @param travelled Distance already accumulated before this segment.
/// @param target Mutable three-component look-ahead target written when the requested distance falls on this segment.
function addToTarget(start,finish,maxDistance,travelled,target)
  current=distance(start,finish);direction=[0.0,0.0,0.0];if current>0.0 then for axis=0 to 2 direction[axis]=n.fdiv(n.fsub(finish[axis],start[axis]),current) end for end if
  if n.fadd(travelled,current)<maxDistance then return [false,n.fadd(travelled,current),copyVector(finish)] end if
  remaining=n.fsub(maxDistance,travelled);for axis=0 to 2 target[axis]=n.fadd(start[axis],n.fmul(remaining,direction[axis])) end for;return [true,maxDistance,target]
end function
/// Choose the next route edge through host callbacks or the local AAS router, preserving avoided-reachability state.
/// @param runtime AI move runtime; accesses `services` and `router`.
/// @param state AI move runtime state; accesses `lastGoalAreaNum`, `avoidReach`, `avoidReachTimes` and `avoidReachTries`.
/// @param origin World-space position as three coordinates.
/// @param areaNum AAS area number; zero denotes no area.
/// @param goal Bot navigation goal; accesses `areaNum`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param lastAreaNum Previously visited AAS area number.
function nextReachability(runtime,state,origin,areaNum,goal,travelFlags,lastAreaNum)
  if runtime.services!=void and runtime.services.nextReachabilityFn!=void then return runtime.services.nextReachabilityFn(runtime.services.context,origin,areaNum,state.lastGoalAreaNum,lastAreaNum,state.avoidReach,state.avoidReachTimes,state.avoidReachTries,goal,travelFlags) end if
  if runtime.services!=void and runtime.services.routeReachabilityFn!=void then return runtime.services.routeReachabilityFn(runtime.services.context,areaNum,origin,goal.areaNum,travelFlags) end if
  if runtime.router==void then return 0 end if;return moveRouting.areaReachabilityToGoalArea(runtime.router,areaNum,origin,goal.areaNum,travelFlags)
end function
/// Follow route reachabilities to find a look-ahead view target, stopping at special traversal edges or the goal.
/// @param runtime AI move runtime; accesses `router` and `pools`.
/// @param handle Handle identifying the allocated bot movement state.
/// @param goal Bot navigation goal; accesses `areaNum` and `origin`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param lookAhead Distance to follow along the route when selecting the view target.
/// @param target Three-component array; components 0, 1 and 2 are used in their stored order.
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

/// Create a `mq3.botlib.ai_move_runtime.MoveResult` record, initializing `moveDir` as `[0.0,0.0,0.0]` and `idealViewAngles` as `[0.0,0.0,0.0]`.
function emptyMoveResult() return MoveResult(false,0,false,0,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
/// Return a vector's length and normalized components, using a zero vector when the input length is nonpositive.
/// @param value Second three-component point.
function normalize(value)
  length=distance([0.0,0.0,0.0],value);if length<=0.0 then return [0.0,[0.0,0.0,0.0]] end if;return [length,[n.fdiv(value[0],length),n.fdiv(value[1],length),n.fdiv(value[2],length)]]
end function
/// Send movement direction and speed to elementary actions and report whether the host action succeeded.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
/// @param direction Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param speed Requested movement speed.
function emitMovement(runtime,state,direction,speed)
  if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.move(runtime.services.elementaryActions,state.client,direction,speed);return not (result is error)
end function
/// Apply `mq3.botlib.elementary_actions.walk` while evaluating `emitWalk`. Return paths include `not (result is error)`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
function emitWalk(runtime,state) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.walk(runtime.services.elementaryActions,state.client);return not (result is error) end function
/// Apply `mq3.botlib.elementary_actions.crouch` while evaluating `emitCrouch`. Return paths include `not (result is error)`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
function emitCrouch(runtime,state) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.crouch(runtime.services.elementaryActions,state.client);return not (result is error) end function
/// Apply `mq3.botlib.elementary_actions.jump` while evaluating `emitJump`. Return paths include `not (result is error)`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
function emitJump(runtime,state) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.jump(runtime.services.elementaryActions,state.client);return not (result is error) end function
/// Apply `mq3.botlib.elementary_actions.delayedJump` while evaluating `emitDelayedJump`. Return paths include `not (result is error)`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
function emitDelayedJump(runtime,state) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.delayedJump(runtime.services.elementaryActions,state.client);return not (result is error) end function
/// Apply `mq3.botlib.elementary_actions.moveForward` while evaluating `emitMoveForward`. Return paths include `not (result is error)`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
function emitMoveForward(runtime,state) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.moveForward(runtime.services.elementaryActions,state.client);return not (result is error) end function
/// Apply `mq3.botlib.elementary_actions.attack` while evaluating `emitAttack`. Return paths include `not (result is error)`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
function emitAttack(runtime,state) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.attack(runtime.services.elementaryActions,state.client);return not (result is error) end function
/// Apply `mq3.botlib.elementary_actions.view` while evaluating `emitView`. Return paths include `not (result is error)`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
/// @param angles Pitch, yaw and roll angles in degrees.
function emitView(runtime,state,angles) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.view(runtime.services.elementaryActions,state.client,angles);return not (result is error) end function
/// Apply `mq3.botlib.elementary_actions.selectWeapon` while evaluating `emitSelectWeapon`. Return paths include `not (result is error)`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function emitSelectWeapon(runtime,state,weapon) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.selectWeapon(runtime.services.elementaryActions,state.client,weapon);return not (result is error) end function
/// Apply `mq3.botlib.elementary_actions.moveUp` while evaluating `emitMoveUp`. Return paths include `not (result is error)`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
function emitMoveUp(runtime,state) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.moveUp(runtime.services.elementaryActions,state.client);return not (result is error) end function
/// Apply `mq3.botlib.elementary_actions.command` while evaluating `emitCommand`. Return paths include `not (result is error)`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `client`.
/// @param text Text to parse, format or deliver.
function emitCommand(runtime,state,text) if runtime.services==void or runtime.services.elementaryActions==void then return false end if;result=moveEa.command(runtime.services.elementaryActions,state.client,text);return not (result is error) end function
/// Use `runtime.services.onGroundFn` to perform `onGround`. Return paths include `(state.moveFlags&MFL_ONGROUND)!=0`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`, `presenceType`, `entityNum` and `moveFlags`.
function onGround(runtime,state)
  if runtime.services!=void and runtime.services.onGroundFn!=void then return runtime.services.onGroundFn(runtime.services.context,state.origin,state.presenceType,state.entityNum) end if;return (state.moveFlags&MFL_ONGROUND)!=0
end function
/// Use `runtime.services.swimmingFn` to perform `isSwimming`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`.
function isSwimming(runtime,state)
  if runtime.services!=void and runtime.services.swimmingFn!=void then return runtime.services.swimmingFn(runtime.services.context,state.origin) end if;return false
end function
/// Use `runtime.services.gapDistanceFn` to perform `gapDistance`. Return paths include `0.0`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin` and `entityNum`.
/// @param direction Value passed as argument 3 to `runtime.services.gapDistanceFn`.
function gapDistance(runtime,state,direction)
  if runtime.services!=void and runtime.services.gapDistanceFn!=void then return runtime.services.gapDistanceFn(runtime.services.context,state.origin,direction,state.entityNum) end if;return 0.0
end function
/// Set `result.blocked` to `true` and `result.blockEntity` to `trace.entity` in `mq3.botlib.ai_move_runtime.checkBlocked`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state Value passed as argument 2 to `runtime.services.blockTraceFn`.
/// @param direction Value passed as argument 3 to `runtime.services.blockTraceFn`.
/// @param checkBottom Value passed as argument 4 to `runtime.services.blockTraceFn`.
/// @param result Result record; accesses `blocked` and `blockEntity`. May update `result.blocked` and `result.blockEntity` in place.
function checkBlocked(runtime,state,direction,checkBottom,result)
  if runtime.services==void or runtime.services.blockTraceFn==void then return result end if;trace=runtime.services.blockTraceFn(runtime.services.context,state,direction,checkBottom)
  if trace is error or trace==void then return result end if
  if not trace.startSolid and trace.entity!=ENTITYNUM_WORLD and trace.entity!=ENTITYNUM_NONE then result.blocked=true;result.blockEntity=trace.entity end if;return result
end function
/// Calculate squared Euclidean distance between two three-component points for ai move runtime.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function vectorDistanceSquared(a,b) x=n.fsub(b[0],a[0]);y=n.fsub(b[1],a[1]);z=n.fsub(b[2],a[2]);return n.fadd(n.fadd(n.fmul(x,x),n.fmul(y,y)),n.fmul(z,z)) end function
/// Return the absolute value of the numeric argument for ai move runtime.
/// @param value Operand used to evaluate the returned expression `0.0-value`.
function absFloat(value) if value<0.0 then return 0.0-value end if;return value end function
/// Apply `mq3.botlib.ai_move_runtime.vectorDistanceSquared` and `mq3.botlib.ai_move_runtime.absFloat` while evaluating `distanceFromLineSquared`. Return paths include `vectorDistanceSquared(point,projected)`.
/// @param point Three-component point used by the geometric query.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
function distanceFromLineSquared(point,start,finish)
  line=[n.fsub(finish[0],start[0]),n.fsub(finish[1],start[1]),n.fsub(finish[2],start[2])];denom=vectorDistanceSquared(start,finish);scale=0.0;if denom>0.0 then scale=n.fdiv(n.fadd(n.fadd(n.fmul(n.fsub(point[0],start[0]),line[0]),n.fmul(n.fsub(point[1],start[1]),line[1])),n.fmul(n.fsub(point[2],start[2]),line[2])),denom) end if
  projected=[n.fadd(start[0],n.fmul(scale,line[0])),n.fadd(start[1],n.fmul(scale,line[1])),n.fadd(start[2],n.fmul(scale,line[2]))]
  for axis=0 to 2 if (projected[axis]>start[axis] and projected[axis]>finish[axis]) or (projected[axis]<start[axis] and projected[axis]<finish[axis]) then if absFloat(projected[axis]-start[axis])<absFloat(projected[axis]-finish[axis]) then return vectorDistanceSquared(point,start) else return vectorDistanceSquared(point,finish) end if end if end for
  return vectorDistanceSquared(point,projected)
end function
/// Apply `mq3.botlib.ai_move_runtime.distanceFromLineSquared` and `mq3.botlib.ai_move_runtime.vectorDistanceSquared` while evaluating `reachAvoided`.
/// @param state AI move runtime state; accesses `numAvoidSpots` and `avoidSpots`.
/// @param reach AAS reachability record; accesses `travelType`, `start` and `finish`.
/// @param origin World-space position as three coordinates.
function reachAvoided(state,reach,origin)
  if state.numAvoidSpots<=0 then return false end if;checkBetween=true;kind=reach.travelType&moveRouting.TRAVELTYPE_MASK
  if kind==moveRouting.TRAVEL_WALKOFFLEDGE or kind==moveRouting.TRAVEL_JUMP or kind==moveRouting.TRAVEL_TELEPORT or kind==moveRouting.TRAVEL_ELEVATOR or kind==moveRouting.TRAVEL_GRAPPLEHOOK or kind==moveRouting.TRAVEL_ROCKETJUMP or kind==moveRouting.TRAVEL_BFGJUMP or kind==moveRouting.TRAVEL_JUMPPAD or kind==moveRouting.TRAVEL_FUNCBOB then checkBetween=false end if
  for index=0 to state.numAvoidSpots-1 spot=state.avoidSpots[index];radius=n.fmul(spot.radius,spot.radius);value=distanceFromLineSquared(spot.origin,origin,reach.start)
    hit=value<radius and vectorDistanceSquared(spot.origin,origin)>value
    if not hit and checkBetween then value=distanceFromLineSquared(spot.origin,reach.start,reach.finish);hit=value<radius and vectorDistanceSquared(spot.origin,reach.start)>value end if
    if hit and spot.type==AVOID_ALWAYS then return true end if
  end for;return false
end function
/// Use `runtime.services.routeTravelTimeFn` to perform `bestReachability`. Return paths include `[best,resultFlags]`.
/// @param runtime AI move runtime; accesses `router`, `aas` and `services`.
/// @param state AI move runtime state; accesses `areaNum`, `avoidReach`, `avoidReachTimes`, `avoidReachTries` and `lastGoalAreaNum` and related fields.
/// @param goal Bot navigation goal; accesses `areaNum`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function bestReachability(runtime,state,goal,travelFlags)
  areaNum=state.areaNum;if areaNum<=0 or areaNum>=len(runtime.router.settings) or goal.areaNum<=0 or goal.areaNum>=len(runtime.router.settings) then return [0,0] end if;effectiveFlags=travelFlags
  if (runtime.router.settings[areaNum].contents&moveRouting.AREACONTENTS_DONOTENTER)!=0 or (runtime.router.settings[goal.areaNum].contents&moveRouting.AREACONTENTS_DONOTENTER)!=0 then effectiveFlags=effectiveFlags|moveRouting.TFL_DONOTENTER end if
  settings=runtime.router.settings[areaNum];best=0;bestTime=0;resultFlags=0;now=moveAas.getTime(runtime.aas)
  if settings.numReachableAreas>0 then for reachNum=settings.firstReachableArea to settings.firstReachableArea+settings.numReachableAreas-1 reach=runtime.router.reaches[reachNum];skip=false
    for avoidIndex=0 to resources.MAX_AVOIDREACH-1 if state.avoidReach[avoidIndex]==reachNum and state.avoidReachTimes[avoidIndex]>=now and state.avoidReachTries[avoidIndex]>AVOIDREACH_TRIES then skip=true;break end if end for;if skip then continue end if
    if state.lastGoalAreaNum==goal.areaNum and reach.areaNum==state.lastAreaNum then continue end if;if not moveRouting.edgeAllowed(runtime.router,reach,effectiveFlags) then continue end if
    routeTime=0
    if runtime.services!=void and runtime.services.routeTravelTimeFn!=void then routeTime=runtime.services.routeTravelTimeFn(runtime.services.context,reach.areaNum,reach.finish,goal.areaNum,effectiveFlags)
    else routeTime=moveRouting.areaTravelTimeToGoalArea(runtime.router,reach.areaNum,reach.finish,goal.areaNum,effectiveFlags) end if
    if routeTime==0 then continue end if
    if reachAvoided(state,reach,state.origin) then resultFlags=resultFlags|MOVERESULT_BLOCKEDBYAVOIDSPOT;continue end if;total=routeTime+reach.travelTime;if bestTime==0 or total<bestTime then bestTime=total;best=reachNum end if
  end for end if;return [best,resultFlags]
end function
/// Choose the movement timeout for the reachability travel type, including special ladder, jump, mover and grapple durations.
/// @param reach AAS reachability record; accesses `travelType`.
function reachabilityTime(reach)
  kind=reach.travelType&moveRouting.TRAVELTYPE_MASK;if kind==moveRouting.TRAVEL_LADDER or kind==moveRouting.TRAVEL_ROCKETJUMP or kind==moveRouting.TRAVEL_BFGJUMP then return 6 end if;if kind==moveRouting.TRAVEL_ELEVATOR or kind==moveRouting.TRAVEL_JUMPPAD or kind==moveRouting.TRAVEL_FUNCBOB then return 10 end if;if kind==moveRouting.TRAVEL_GRAPPLEHOOK then return 8 end if;return 5
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.checkBlocked` while evaluating `travelWalk`.
/// @param runtime AI move runtime; accesses `router`.
/// @param state AI move runtime state; accesses `origin` and `moveFlags`.
/// @param reach AAS reachability record; accesses `start`, `finish` and `areaNum`.
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
// BotTravel_Crouch: always crouch and move horizontally towards the reach end.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function travelCrouch(runtime,state,reach)
  result=emptyMoveResult();direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];direction=normalize(direction)[1];result=checkBlocked(runtime,state,direction,true,result)
  if not emitCrouch(runtime,state) then result.failure=true;return result end if;if not emitMovement(runtime,state,direction,400.0) then result.failure=true;return result end if;result.moveDir=copyVector(direction);return result
end function
/// Return the result of `n.fadd(n.fadd(n.fmul(a[0],b[0]),n.fmul(a[1],b[1])),n.fmul(a[2],b[2]))` for `dot`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function dot(a,b) return n.fadd(n.fadd(n.fmul(a[0],b[0]),n.fmul(a[1],b[1])),n.fmul(a[2],b[2])) end function
// AAS_HorizontalVelocityForJump with Baseq3 default physics. A host callback
// can supply the live aassettings values and returns [success, velocity].
/// @param runtime AI move runtime; accesses `services`.
/// @param zVelocity Value passed as argument 2 to `runtime.services.horizontalVelocityForJumpFn`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
function horizontalVelocityForJump(runtime,zVelocity,start,finish)
  if runtime.services!=void and runtime.services.horizontalVelocityForJumpFn!=void then value=runtime.services.horizontalVelocityForJumpFn(runtime.services.context,zVelocity,start,finish);if value!=void and not (value is error) and len(value)==2 then return value end if end if
  gravity=800.0;maxVelocity=320.0;maxJump=n.fmul(n.fmul(0.5,gravity),n.fmul(n.fdiv(zVelocity,gravity),n.fdiv(zVelocity,gravity)));top=n.fadd(start[2],maxJump);heightToFall=n.fsub(top,finish[2])
  if heightToFall<0.0 then return [false,maxVelocity] end if;time=n.fsqrt(n.fdiv(heightToFall,n.fmul(0.5,gravity)));denominator=n.fadd(time,n.fdiv(zVelocity,gravity));if denominator==0.0 then return [false,maxVelocity] end if
  dx=n.fsub(finish[0],start[0]);dy=n.fsub(finish[1],start[1]);velocity=n.fdiv(n.fsqrt(n.fadd(n.fmul(dx,dx),n.fmul(dy,dy))),denominator);if velocity>maxVelocity then return [false,maxVelocity] end if;return [true,velocity]
end function
/// Use `runtime.services.gravityFn` to perform `gravity`. Return paths include `800.0`.
/// @param runtime AI move runtime; accesses `services`.
function gravity(runtime) if runtime.services!=void and runtime.services.gravityFn!=void then return runtime.services.gravityFn(runtime.services.context) end if;return 800.0 end function
// AAS_JumpReachRunStart predicts two 0.1 second frames at speed 400 away
// from the jump. The callback supplies the collision-accurate predicted end.
// The fallback preserves its unobstructed direction; BotTravel_Jump normalizes
// that direction and constructs the actual 80-unit run start immediately after.
/// @param runtime AI move runtime; accesses `services`.
/// @param state Value passed as argument 2 to `runtime.services.jumpRunStartFn`.
/// @param reach AAS reachability record; accesses `start` and `finish`.
function jumpReachRunStart(runtime,state,reach)
  if runtime.services!=void and runtime.services.jumpRunStartFn!=void then predicted=runtime.services.jumpRunStartFn(runtime.services.context,state,reach);if predicted!=void and not (predicted is error) and len(predicted)==3 then return copyVector(predicted) end if end if
  backwards=[n.fsub(reach.start[0],reach.finish[0]),n.fsub(reach.start[1],reach.finish[1]),0.0];backwards=normalize(backwards)[1];return [n.fadd(reach.start[0],n.fmul(80.0,backwards[0])),n.fadd(reach.start[1],n.fmul(80.0,backwards[1])),reach.start[2]]
end function
// BotTravel_Jump, including its ten-unit gap scan and jump/delayed-jump thresholds.
/// @param runtime AI move runtime; accesses `aas`.
/// @param state AI move runtime state; accesses `reachAreaNum`, `origin`, `jumpReach` and `lastReachNum`. May update `state.jumpReach` in place.
/// @param reach AAS reachability record; accesses `start` and `finish`.
function travelJump(runtime,state,reach)
  result=emptyMoveResult();direction=[0.0,0.0,0.0];runStart=jumpReachRunStart(runtime,state,reach);runDirection=[n.fsub(runStart[0],reach.start[0]),n.fsub(runStart[1],reach.start[1]),0.0];runDirection=normalize(runDirection)[1]
  start=[reach.start[0],reach.start[1],n.fadd(reach.start[2],1.0)];runStart=[n.fadd(reach.start[0],n.fmul(80.0,runDirection[0])),n.fadd(reach.start[1],n.fmul(80.0,runDirection[1])),reach.start[2]]
  scanDistance=0.0
  while scanDistance<80.0
    endPoint=[n.fadd(start[0],n.fmul(n.fadd(scanDistance,10.0),runDirection[0])),n.fadd(start[1],n.fmul(n.fadd(scanDistance,10.0),runDirection[1])),n.fadd(start[2],1.0)]
    if moveAas.pointAreaNum(runtime.aas,endPoint)!=state.reachAreaNum then break end if;scanDistance=n.fadd(scanDistance,10.0)
  end while
  if scanDistance<80.0 then runStart=[n.fadd(reach.start[0],n.fmul(scanDistance,runDirection[0])),n.fadd(reach.start[1],n.fmul(scanDistance,runDirection[1])),reach.start[2]] end if
  dir1=[n.fsub(state.origin[0],reach.start[0]),n.fsub(state.origin[1],reach.start[1]),0.0];normal=normalize(dir1);dist1=normal[0];dir1=normal[1]
  dir2=[n.fsub(state.origin[0],runStart[0]),n.fsub(state.origin[1],runStart[1]),0.0];normal=normalize(dir2);dist2=normal[0];dir2=normal[1]
  if dot(dir1,dir2)<-0.8 or dist2<5.0 then
    direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];direction=normalize(direction)[1]
    if dist1<24.0 then if not emitJump(runtime,state) then result.failure=true;return result end if else if dist1<32.0 then if not emitDelayedJump(runtime,state) then result.failure=true;return result end if end if
    if not emitMovement(runtime,state,direction,600.0) then result.failure=true;return result end if;state.jumpReach=state.lastReachNum
  else
    direction=[n.fsub(runStart[0],state.origin[0]),n.fsub(runStart[1],state.origin[1]),0.0];direction=normalize(direction)[1];if dist2>80.0 then dist2=80.0 end if
    if not emitMovement(runtime,state,direction,n.fmul(5.0,dist2)) then result.failure=true;return result end if
  end if
  result.moveDir=copyVector(direction);return result
end function
// BotFinishTravel_Jump: retain maximum in-air speed until just past the landing.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `jumpReach` and `origin`.
/// @param reach AAS reachability record; accesses `finish` and `start`.
function finishTravelJump(runtime,state,reach)
  result=emptyMoveResult();if state.jumpReach==0 then return result end if
  direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];normal=normalize(direction);dist=normal[0];direction=normal[1]
  reachDirection=[n.fsub(reach.finish[0],reach.start[0]),n.fsub(reach.finish[1],reach.start[1]),0.0];reachDirection=normalize(reachDirection)[1]
  if dot(direction,reachDirection)<-0.5 and dist<24.0 then return result end if
  if not emitMovement(runtime,state,direction,800.0) then result.failure=true;return result end if;result.moveDir=copyVector(direction);return result
end function
// BotTravel_Ladder: face along the vertically weighted ladder direction and
// use the forward action; EA_Move intentionally carries zero speed.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function travelLadder(runtime,state,reach)
  result=emptyMoveResult();direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),n.fsub(reach.finish[2],state.origin[2])];direction=normalize(direction)[1]
  result.idealViewAngles=moveQMath.vectoangles([direction[0],direction[1],n.fmul(3.0,direction[2])])
  if not emitMovement(runtime,state,[0.0,0.0,0.0],0.0) then result.failure=true;return result end if;if not emitMoveForward(runtime,state) then result.failure=true;return result end if
  result.flags=result.flags|MOVERESULT_MOVEMENTVIEW;result.moveDir=copyVector(direction);return result
end function
// BotTravel_BarrierJump and its airborne finish path.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `start`.
function travelBarrierJump(runtime,state,reach)
  result=emptyMoveResult();direction=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),0.0];normal=normalize(direction);dist=normal[0];direction=normal[1];result=checkBlocked(runtime,state,direction,true,result)
  if dist<9.0 then if not emitJump(runtime,state) then result.failure=true;return result end if
  else
    if dist>60.0 then dist=60.0 end if;if not emitMovement(runtime,state,direction,n.fmul(6.0,dist)) then result.failure=true;return result end if
  end if
  result.moveDir=copyVector(direction);return result
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.checkBlocked` while evaluating `finishTravelBarrierJump`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `velocity` and `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function finishTravelBarrierJump(runtime,state,reach)
  result=emptyMoveResult();if state.velocity[2]>=250.0 then return result end if
  direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];direction=normalize(direction)[1];result=checkBlocked(runtime,state,direction,true,result)
  if not emitMovement(runtime,state,direction,400.0) then result.failure=true;return result end if;result.moveDir=copyVector(direction);return result
end function
// BotTravel_WalkOffLedge selects a careful vertical drop speed or the
// ballistic horizontal speed calculated by AAS_HorizontalVelocityForJump.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `start` and `finish`.
function travelWalkOffLedge(runtime,state,reach)
  result=emptyMoveResult();blockDirection=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),n.fsub(reach.start[2],state.origin[2])];blockDirection=normalize(blockDirection)[1];result=checkBlocked(runtime,state,blockDirection,true,result)
  reachHorizontal=[n.fsub(reach.finish[0],reach.start[0]),n.fsub(reach.finish[1],reach.start[1]),0.0];reachHorizontalDistance=normalize(reachHorizontal)[0]
  direction=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),0.0];normal=normalize(direction);dist=normal[0];direction=normal[1];speed=400.0
  if dist<48.0 then
    direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];direction=normalize(direction)[1]
    if reachHorizontalDistance<20.0 then speed=100.0 else velocity=horizontalVelocityForJump(runtime,0.0,reach.start,reach.finish);if velocity[0] then speed=velocity[1] else speed=400.0 end if end if
  else if reachHorizontalDistance<20.0 then if dist>64.0 then dist=64.0 end if;speed=n.fadd(144.0,n.fmul(4.0,dist)) else speed=400.0 end if
  result=checkBlocked(runtime,state,direction,true,result);if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if;result.moveDir=copyVector(direction);return result
end function
// BotAirControl integrates the original 0.1-second velocity units for up to
// 50 frames and computes the horizontal correction at the goal height.
/// @param runtime AI move runtime; accesses `services`.
/// @param origin World-space position as three coordinates.
/// @param velocity Three-component movement velocity.
/// @param goal Three-component array; components 0, 1 and 2 are used in their stored order.
function airControl(runtime,origin,velocity,goal)
  position=copyVector(origin);frameVelocity=[n.fmul(velocity[0],0.1),n.fmul(velocity[1],0.1),n.fmul(velocity[2],0.1)];frames=0
  while frames<50
    frameVelocity[2]=n.fsub(frameVelocity[2],n.fmul(gravity(runtime),0.01))
    if frameVelocity[2]<0.0 and n.fadd(position[2],frameVelocity[2])<goal[2] then
      scale=n.fdiv(n.fsub(goal[2],position[2]),frameVelocity[2]);for axis=0 to 2 frameVelocity[axis]=n.fmul(frameVelocity[axis],scale);position[axis]=n.fadd(position[axis],frameVelocity[axis]) end for
      direction=[n.fsub(goal[0],position[0]),n.fsub(goal[1],position[1]),n.fsub(goal[2],position[2])];normal=normalize(direction);dist=normal[0];direction=normal[1];if dist>32.0 then dist=32.0 end if;return [true,direction,n.fmul(13.0,dist)]
    end if
    for axis=0 to 2 position[axis]=n.fadd(position[axis],frameVelocity[axis]) end for;frames=frames+1
  end while;return [false,[0.0,0.0,0.0],400.0]
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.checkBlocked` and `mq3.botlib.ai_move_runtime.normalize` while evaluating `finishTravelWalkOffLedge`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin` and `velocity`.
/// @param reach AAS reachability record; accesses `finish`.
function finishTravelWalkOffLedge(runtime,state,reach)
  result=emptyMoveResult();fullDirection=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),n.fsub(reach.finish[2],state.origin[2])];result=checkBlocked(runtime,state,fullDirection,true,result)
  horizontal=[fullDirection[0],fullDirection[1],0.0];normal=normalize(horizontal);dist=normal[0];horizontal=normal[1]
  target=copyVector(reach.finish);if dist>16.0 then target=[n.fadd(reach.finish[0],n.fmul(16.0,horizontal[0])),n.fadd(reach.finish[1],n.fmul(16.0,horizontal[1])),n.fadd(reach.finish[2],n.fmul(16.0,horizontal[2]))] end if
  controlled=airControl(runtime,state.origin,state.velocity,target);direction=controlled[1];speed=controlled[2]
  if not controlled[0] then direction=[fullDirection[0],fullDirection[1],0.0];direction=normalize(direction)[1];speed=400.0 end if
  if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if;result.moveDir=copyVector(direction);return result
end function
/// Compute the signed difference between two angles and wrap it into the shortest-turn range.
/// @param first Value passed as argument 1 to `mq3.compat.numeric.fsub`.
/// @param second Value passed as argument 2 to `mq3.compat.numeric.fsub`.
function angleDiff(first,second)
  difference=n.fsub(first,second)
  if first>second then if difference>180.0 then difference=n.fsub(difference,360.0) end if
  else if difference<-180.0 then difference=n.fadd(difference,360.0) end if
  return difference
end function
/// Use `runtime.services.elevatorStateFn` to perform `elevatorState`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state Value passed as argument 2 to `runtime.services.elevatorStateFn`.
/// @param reach Value passed as argument 3 to `runtime.services.elevatorStateFn`.
function elevatorState(runtime,state,reach)
  if runtime.services==void or runtime.services.elevatorStateFn==void then return void end if;value=runtime.services.elevatorStateFn(runtime.services.context,state,reach)
  if value==void or value is error or value.bottomCenter==void or len(value.bottomCenter)!=3 then return void end if;return value
end function
// BotCheckBarrierJump's callback reports only collision geometry. The runtime
// owns the original EA side effects and MFL_BARRIERJUMP state transition.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `moveFlags`. May update `state.moveFlags` in place.
/// @param direction Array or byte sequence accessed at `0` and `1`.
/// @param speed Requested movement speed.
function checkBarrierJump(runtime,state,direction,speed)
  if runtime.services==void or runtime.services.barrierJumpFn==void then return [false,true] end if;hit=runtime.services.barrierJumpFn(runtime.services.context,state,direction,speed);if hit is error then return [false,false] end if;if not hit then return [false,true] end if
  horizontal=normalize([direction[0],direction[1],0.0])[1];if not emitJump(runtime,state) then return [true,false] end if;if not emitMovement(runtime,state,horizontal,speed) then return [true,false] end if;state.moveFlags=state.moveFlags|MFL_BARRIERJUMP;return [true,true]
end function
// BotTravel_Teleport. The airborne finish case is an intentional no-op in
// BotMoveToGoal and is handled in the dispatcher below.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `moveFlags` and `origin`.
/// @param reach AAS reachability record; accesses `start`.
function travelTeleport(runtime,state,reach)
  result=emptyMoveResult();if (state.moveFlags&MFL_TELEPORTED)!=0 then return result end if
  direction=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),n.fsub(reach.start[2],state.origin[2])];if (state.moveFlags&MFL_SWIMMING)==0 then direction[2]=0.0 end if;normal=normalize(direction);dist=normal[0];direction=normal[1];result=checkBlocked(runtime,state,direction,true,result);speed=400.0;if dist<30.0 then speed=200.0 end if
  if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if;if (state.moveFlags&MFL_SWIMMING)!=0 then result.flags=result.flags|MOVERESULT_SWIMVIEW end if;result.moveDir=copyVector(direction);return result
end function
// BotTravel_Elevator depends on live mover bounds/origin and entity tracing.
// Missing mover state is an explicit failure instead of guessed success.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `moveFlags`, `origin` and `reachabilityTime`. May update `state.reachabilityTime` in place.
/// @param reach AAS reachability record; accesses `finish` and `start`.
function travelElevator(runtime,state,reach)
  result=emptyMoveResult();mover=elevatorState(runtime,state,reach);if mover==void then result.failure=true;result.type=moveRouting.TRAVEL_ELEVATOR;return result end if
  swimming=(state.moveFlags&MFL_SWIMMING)!=0
  if mover.onMover then
    vertical=n.fsub(state.origin[2],reach.finish[2]);if vertical<0.0 then vertical=0.0-vertical end if
    if vertical<mover.maxBarrier then
      direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];direction=normalize(direction)[1];barrier=checkBarrierJump(runtime,state,direction,100.0);if not barrier[1] then result.failure=true;return result end if;if not barrier[0] and not emitMovement(runtime,state,direction,400.0) then result.failure=true;return result end if;result.moveDir=copyVector(direction)
    else
      direction=[n.fsub(mover.bottomCenter[0],state.origin[0]),n.fsub(mover.bottomCenter[1],state.origin[1]),0.0];normal=normalize(direction);dist=normal[0];direction=normal[1]
      if dist>10.0 then if dist>100.0 then dist=100.0 end if;if not emitMovement(runtime,state,direction,n.fmul(4.0,dist)) then result.failure=true;return result end if;result.moveDir=copyVector(direction) end if
    end if;return result
  end if
  direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),n.fsub(reach.finish[2],state.origin[2])];dist=normalize(direction)[0]
  if dist<64.0 then
    if dist>60.0 then dist=60.0 end if;speed=n.fmul(6.0,dist);barrier=[false,true];if not swimming then barrier=checkBarrierJump(runtime,state,direction,50.0) end if
    if not barrier[1] then result.failure=true;return result end if;if (swimming or not barrier[0]) and speed>5.0 then if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if end if
    result.moveDir=copyVector(direction);if swimming then result.flags=result.flags|MOVERESULT_SWIMVIEW end if;state.reachabilityTime=0.0;return result
  end if
  directionToStart=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),n.fsub(reach.start[2],state.origin[2])];if not swimming then directionToStart[2]=0.0 end if;normal=normalize(directionToStart);distanceToStart=normal[0];directionToStart=normal[1]
  if not mover.down then
    direction=copyVector(directionToStart);result=checkBlocked(runtime,state,direction,false,result);if distanceToStart>60.0 then distanceToStart=60.0 end if;speed=n.fmul(6.0,distanceToStart)
    if not swimming then barrier=checkBarrierJump(runtime,state,direction,50.0);if not barrier[1] then result.failure=true;return result end if;if not barrier[0] and speed>5.0 then if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if end if end if
    result.moveDir=copyVector(direction);if swimming then result.flags=result.flags|MOVERESULT_SWIMVIEW end if;result.type=RESULTTYPE_ELEVATORUP;result.flags=result.flags|MOVERESULT_WAITING;return result
  end if
  directionToCenter=[n.fsub(mover.bottomCenter[0],state.origin[0]),n.fsub(mover.bottomCenter[1],state.origin[1]),n.fsub(mover.bottomCenter[2],state.origin[2])];if not swimming then directionToCenter[2]=0.0 end if;normal=normalize(directionToCenter);distanceToCenter=normal[0];directionToCenter=normal[1]
  direction=copyVector(directionToStart);dist=distanceToStart;if distanceToStart<20.0 or distanceToCenter<distanceToStart or dot(directionToStart,directionToCenter)<0.0 then direction=copyVector(directionToCenter);dist=distanceToCenter end if
  result=checkBlocked(runtime,state,direction,false,result);if dist>60.0 then dist=60.0 end if;speed=n.fmul(6.0,dist)
  if not swimming then barrier=checkBarrierJump(runtime,state,direction,50.0);if not barrier[1] then result.failure=true;return result end if;if not barrier[0] then if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if end if end if
  result.moveDir=copyVector(direction);if swimming then result.flags=result.flags|MOVERESULT_SWIMVIEW end if;return result
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.elevatorState` and `mq3.botlib.ai_move_runtime.normalize` while evaluating `finishTravelElevator`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function finishTravelElevator(runtime,state,reach)
  result=emptyMoveResult();direction=[0.0,0.0,0.0];mover=elevatorState(runtime,state,reach);if mover==void then result.failure=true;result.type=moveRouting.TRAVEL_ELEVATOR;return result end if
  bottomDirection=[n.fsub(mover.bottomCenter[0],state.origin[0]),n.fsub(mover.bottomCenter[1],state.origin[1]),n.fsub(mover.bottomCenter[2],state.origin[2])];topDirection=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),n.fsub(reach.finish[2],state.origin[2])]
  bottomHeight=bottomDirection[2];if bottomHeight<0.0 then bottomHeight=0.0-bottomHeight end if;topHeight=topDirection[2];if topHeight<0.0 then topHeight=0.0-topHeight end if;if bottomHeight<topHeight then direction=normalize(bottomDirection)[1] else direction=normalize(topDirection)[1] end if
  if not emitMovement(runtime,state,direction,300.0) then result.failure=true end if;return result
end function
// Shared source body for BotTravel_RocketJump and BotTravel_BFGJump.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`, `viewAngles`, `jumpReach` and `lastReachNum`. May update `state.jumpReach` in place.
/// @param reach AAS reachability record; accesses `start` and `finish`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function travelWeaponJump(runtime,state,reach,weapon)
  result=emptyMoveResult();direction=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),0.0];normal=normalize(direction);dist=normal[0];direction=normal[1]
  // RocketJump initializes this view before the alignment test. The pinned
  // BFGJump source reads the uncleared result vector; MiniLang's deterministic
  // zero result preserves the source branch without propagating C stack data.
  initialAngles=[0.0,0.0,0.0];if weapon==WEAPON_ROCKET_LAUNCHER then initialAngles=moveQMath.vectoangles(direction);initialAngles[0]=90.0 end if
  aligned=absFloat(angleDiff(initialAngles[0],state.viewAngles[0]))<5.0 and absFloat(angleDiff(initialAngles[1],state.viewAngles[1]))<5.0
  if dist<5.0 and aligned then
    direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];direction=normalize(direction)[1]
    if not emitJump(runtime,state) or not emitAttack(runtime,state) or not emitMovement(runtime,state,direction,800.0) then result.failure=true;return result end if;state.jumpReach=state.lastReachNum
  else
    if dist>80.0 then dist=80.0 end if;if not emitMovement(runtime,state,direction,n.fmul(5.0,dist)) then result.failure=true;return result end if
  end if
  result.idealViewAngles=moveQMath.vectoangles(direction);result.idealViewAngles[0]=90.0;if not emitView(runtime,state,result.idealViewAngles) then result.failure=true;return result end if;result.flags=result.flags|MOVERESULT_MOVEMENTVIEWSET
  if not emitSelectWeapon(runtime,state,weapon) then result.failure=true;return result end if;result.weapon=weapon;result.flags=result.flags|MOVERESULT_MOVEMENTWEAPON;result.moveDir=copyVector(direction);return result
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.airControl` and `mq3.botlib.ai_move_runtime.normalize` while evaluating `finishTravelWeaponJump`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `jumpReach`, `origin` and `velocity`.
/// @param reach AAS reachability record; accesses `finish`.
function finishTravelWeaponJump(runtime,state,reach)
  result=emptyMoveResult();if state.jumpReach==0 then return result end if;controlled=airControl(runtime,state.origin,state.velocity,reach.finish);direction=controlled[1];speed=controlled[2]
  if not controlled[0] then direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];direction=normalize(direction)[1];speed=400.0 end if
  if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if;result.moveDir=copyVector(direction);return result
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.checkBlocked` while evaluating `travelJumpPad`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `start`.
function travelJumpPad(runtime,state,reach)
  result=emptyMoveResult();direction=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),0.0];direction=normalize(direction)[1];result=checkBlocked(runtime,state,direction,true,result)
  if not emitMovement(runtime,state,direction,400.0) then result.failure=true;return result end if;result.moveDir=copyVector(direction);return result
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.airControl` and `mq3.botlib.ai_move_runtime.normalize` while evaluating `finishTravelJumpPad`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin` and `velocity`.
/// @param reach AAS reachability record; accesses `finish`.
function finishTravelJumpPad(runtime,state,reach)
  result=emptyMoveResult();controlled=airControl(runtime,state.origin,state.velocity,reach.finish);direction=controlled[1];speed=controlled[2]
  if not controlled[0] then direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];direction=normalize(direction)[1];speed=400.0 end if;result=checkBlocked(runtime,state,direction,true,result)
  if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if;result.moveDir=copyVector(direction);return result
end function
/// Use `runtime.services.randomFn` to perform `signedRandom`. Return paths include `0.0`.
/// @param runtime AI move runtime; accesses `services`.
function signedRandom(runtime) if runtime.services!=void and runtime.services.randomFn!=void then return runtime.services.randomFn(runtime.services.context) end if;return 0.0 end function
/// Use `runtime.services.pointContentsFn` to perform `pointContents`.
/// @param runtime AI move runtime; accesses `services`.
/// @param point Three-component point used by the geometric query.
function pointContents(runtime,point) if runtime.services!=void and runtime.services.pointContentsFn!=void then return runtime.services.pointContentsFn(runtime.services.context,point) end if;return 0 end function
// BotTravel_Swim is shared by the grounded and airborne switches.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `start`.
function travelSwim(runtime,state,reach)
  result=emptyMoveResult();direction=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),n.fsub(reach.start[2],state.origin[2])];direction=normalize(direction)[1];result=checkBlocked(runtime,state,direction,true,result)
  if not emitMovement(runtime,state,direction,400.0) then result.failure=true;return result end if;result.moveDir=copyVector(direction);result.idealViewAngles=moveQMath.vectoangles(direction);result.flags=result.flags|MOVERESULT_SWIMVIEW;return result
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.signedRandom` while evaluating `travelWaterJump`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function travelWaterJump(runtime,state,reach)
  result=emptyMoveResult();direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),n.fsub(reach.finish[2],state.origin[2])];horizontal=[direction[0],direction[1],0.0];horizontalDistance=normalize(horizontal)[0];direction[2]=n.fadd(direction[2],n.fadd(15.0,n.fmul(signedRandom(runtime),40.0)));direction=normalize(direction)[1]
  if not emitMoveForward(runtime,state) then result.failure=true;return result end if;if horizontalDistance<40.0 and not emitMoveUp(runtime,state) then result.failure=true;return result end if
  result.idealViewAngles=moveQMath.vectoangles(direction);result.flags=result.flags|MOVERESULT_MOVEMENTVIEW;result.moveDir=copyVector(direction);return result
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.copyVector` and `mq3.botlib.ai_move_runtime.pointContents` while evaluating `finishTravelWaterJump`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `moveFlags` and `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function finishTravelWaterJump(runtime,state,reach)
  result=emptyMoveResult();if (state.moveFlags&MFL_WATERJUMP)!=0 then return result end if;test=copyVector(state.origin);test[2]=n.fsub(test[2],32.0);if (pointContents(runtime,test)&(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))==0 then return result end if
  direction=[n.fadd(n.fsub(reach.finish[0],state.origin[0]),n.fmul(signedRandom(runtime),10.0)),n.fadd(n.fsub(reach.finish[1],state.origin[1]),n.fmul(signedRandom(runtime),10.0)),n.fadd(n.fsub(reach.finish[2],state.origin[2]),n.fadd(70.0,n.fmul(signedRandom(runtime),10.0)))];direction=normalize(direction)[1]
  if not emitMovement(runtime,state,direction,400.0) then result.failure=true;return result end if;result.idealViewAngles=moveQMath.vectoangles(direction);result.flags=result.flags|MOVERESULT_MOVEMENTVIEW;result.moveDir=copyVector(direction);return result
end function
/// Use `runtime.services.funcBobStateFn` to perform `funcBobState`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state Value passed as argument 2 to `runtime.services.funcBobStateFn`.
/// @param reach Value passed as argument 3 to `runtime.services.funcBobStateFn`.
function funcBobState(runtime,state,reach)
  if runtime.services==void or runtime.services.funcBobStateFn==void then return void end if;value=runtime.services.funcBobStateFn(runtime.services.context,state,reach)
  if value==void or value is error or value.start==void or value.finish==void or value.origin==void or value.bottomCenter==void or len(value.start)!=3 or len(value.finish)!=3 or len(value.origin)!=3 or len(value.bottomCenter)!=3 then return void end if;return value
end function
/// Set `state.reachabilityTime` to `0.0` in `mq3.botlib.ai_move_runtime.travelFuncBob`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `moveFlags`, `origin` and `reachabilityTime`. May update `state.reachabilityTime` in place.
/// @param reach AAS reachability record; accesses `finish` and `start`.
function travelFuncBob(runtime,state,reach)
  result=emptyMoveResult();bob=funcBobState(runtime,state,reach);if bob==void then result.failure=true;result.type=moveRouting.TRAVEL_FUNCBOB;return result end if;swimming=(state.moveFlags&MFL_SWIMMING)!=0
  bobToEnd=[n.fsub(bob.origin[0],bob.finish[0]),n.fsub(bob.origin[1],bob.finish[1]),n.fsub(bob.origin[2],bob.finish[2])]
  if bob.onMover then
    if normalize(bobToEnd)[0]<24.0 then direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];direction=normalize(direction)[1];barrier=checkBarrierJump(runtime,state,direction,100.0);if not barrier[1] then result.failure=true;return result end if;if not barrier[0] and not emitMovement(runtime,state,direction,400.0) then result.failure=true;return result end if;result.moveDir=copyVector(direction)
    else direction=[n.fsub(bob.bottomCenter[0],state.origin[0]),n.fsub(bob.bottomCenter[1],state.origin[1]),0.0];normal=normalize(direction);dist=normal[0];direction=normal[1];if dist>10.0 then if dist>100.0 then dist=100.0 end if;if not emitMovement(runtime,state,direction,n.fmul(4.0,dist)) then result.failure=true;return result end if;result.moveDir=copyVector(direction) end if end if;return result
  end if
  direction=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),n.fsub(reach.finish[2],state.origin[2])];dist=normalize(direction)[0]
  if dist<64.0 then if dist>60.0 then dist=60.0 end if;speed=n.fmul(6.0,dist);barrier=[false,true];if not swimming then barrier=checkBarrierJump(runtime,state,direction,50.0) end if;if not barrier[1] then result.failure=true;return result end if;if (swimming or not barrier[0]) and speed>5.0 then if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if end if;result.moveDir=copyVector(direction);if swimming then result.flags=result.flags|MOVERESULT_SWIMVIEW end if;state.reachabilityTime=0.0;return result end if
  directionToStart=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),n.fsub(reach.start[2],state.origin[2])];if not swimming then directionToStart[2]=0.0 end if;normal=normalize(directionToStart);distanceToStart=normal[0];directionToStart=normal[1]
  if normalize([n.fsub(bob.origin[0],bob.start[0]),n.fsub(bob.origin[1],bob.start[1]),n.fsub(bob.origin[2],bob.start[2])])[0]>16.0 then
    direction=copyVector(directionToStart);result=checkBlocked(runtime,state,direction,false,result);if distanceToStart>60.0 then distanceToStart=60.0 end if;speed=n.fmul(6.0,distanceToStart)
    if not swimming then barrier=checkBarrierJump(runtime,state,direction,50.0);if not barrier[1] then result.failure=true;return result end if;if not barrier[0] and speed>5.0 then if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if end if end if
    result.moveDir=copyVector(direction);if swimming then result.flags=result.flags|MOVERESULT_SWIMVIEW end if;result.type=RESULTTYPE_WAITFORFUNCBOBBING;result.flags=result.flags|MOVERESULT_WAITING;return result
  end if
  directionToCenter=[n.fsub(bob.bottomCenter[0],state.origin[0]),n.fsub(bob.bottomCenter[1],state.origin[1]),n.fsub(bob.bottomCenter[2],state.origin[2])];if not swimming then directionToCenter[2]=0.0 end if;normal=normalize(directionToCenter);distanceToCenter=normal[0];directionToCenter=normal[1]
  direction=copyVector(directionToStart);dist=distanceToStart;if distanceToStart<20.0 or distanceToCenter<distanceToStart or dot(directionToStart,directionToCenter)<0.0 then direction=copyVector(directionToCenter);dist=distanceToCenter end if;result=checkBlocked(runtime,state,direction,false,result);if dist>60.0 then dist=60.0 end if;speed=n.fmul(6.0,dist)
  if not swimming then barrier=checkBarrierJump(runtime,state,direction,50.0);if not barrier[1] then result.failure=true;return result end if;if not barrier[0] and not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if end if;result.moveDir=copyVector(direction);if swimming then result.flags=result.flags|MOVERESULT_SWIMVIEW end if;return result
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.funcBobState` and `mq3.botlib.ai_move_runtime.normalize` while evaluating `finishTravelFuncBob`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `moveFlags` and `origin`.
/// @param reach AAS reachability record; accesses `finish`.
function finishTravelFuncBob(runtime,state,reach)
  result=emptyMoveResult();bob=funcBobState(runtime,state,reach);if bob==void then result.failure=true;result.type=moveRouting.TRAVEL_FUNCBOB;return result end if;swimming=(state.moveFlags&MFL_SWIMMING)!=0
  bobDirection=[n.fsub(bob.origin[0],bob.finish[0]),n.fsub(bob.origin[1],bob.finish[1]),n.fsub(bob.origin[2],bob.finish[2])];bobDistance=normalize(bobDirection)[0]
  if bobDistance<16.0 then
    horizontal=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),n.fsub(reach.finish[2],state.origin[2])];if not swimming then horizontal[2]=0.0 end if;normal=normalize(horizontal);dist=normal[0];if dist>60.0 then dist=60.0 end if;speed=n.fmul(6.0,dist)
    // Pinned Baseq3 passes bob_origin-bob_end here, not the computed hordir.
    if speed>5.0 and not emitMovement(runtime,state,bobDirection,speed) then result.failure=true;return result end if;result.moveDir=copyVector(bobDirection);if swimming then result.flags=result.flags|MOVERESULT_SWIMVIEW end if;return result
  end if
  direction=[n.fsub(bob.bottomCenter[0],state.origin[0]),n.fsub(bob.bottomCenter[1],state.origin[1]),n.fsub(bob.bottomCenter[2],state.origin[2])];if not swimming then direction[2]=0.0 end if;normal=normalize(direction);dist=normal[0];direction=normal[1]
  if dist>5.0 then if dist>100.0 then dist=100.0 end if;if not emitMovement(runtime,state,direction,n.fmul(4.0,dist)) then result.failure=true;return result end if;result.moveDir=copyVector(direction) end if;return result
end function
/// Use `runtime.services.grappleConfigFn` to perform `grappleConfig`. Return paths include `GrappleConfig(false,WEAPON_GRAPPLE,"grappleon","grappleoff")`.
/// @param runtime AI move runtime; accesses `services`.
function grappleConfig(runtime)
  if runtime.services!=void and runtime.services.grappleConfigFn!=void then value=runtime.services.grappleConfigFn(runtime.services.context);if value!=void and not (value is error) then return value end if end if;return GrappleConfig(false,WEAPON_GRAPPLE,"grappleon","grappleoff")
end function
/// Use `runtime.services.grappleStateFn` to perform `grappleState`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `moveFlags`.
/// @param reach Value passed as argument 3 to `runtime.services.grappleStateFn`.
function grappleState(runtime,state,reach)
  if (state.moveFlags&MFL_GRAPPLEPULL)!=0 then return 2 end if;if runtime.services!=void and runtime.services.grappleStateFn!=void then return runtime.services.grappleStateFn(runtime.services.context,state,reach) end if;return 0
end function
/// Set `state.moveFlags` to `state.moveFlags&(~MFL_ACTIVEGRAPPLE)` and `state.grappleVisibleTime` to `0.0` in `mq3.botlib.ai_move_runtime.resetGrapple`.
/// @param runtime AI move runtime; accesses `router`.
/// @param state AI move runtime state; accesses `lastReachNum`, `moveFlags` and `grappleVisibleTime`. May update `state.moveFlags` and `state.grappleVisibleTime` in place.
function resetGrapple(runtime,state)
  kind=0;if runtime.router!=void and state.lastReachNum>0 and state.lastReachNum<len(runtime.router.reaches) then kind=runtime.router.reaches[state.lastReachNum].travelType&moveRouting.TRAVELTYPE_MASK end if
  if kind!=moveRouting.TRAVEL_GRAPPLEHOOK and ((state.moveFlags&MFL_ACTIVEGRAPPLE)!=0 or state.grappleVisibleTime!=0.0) then config=grappleConfig(runtime);if config.offhand and not emitCommand(runtime,state,config.offCommand) then return false end if;state.moveFlags=state.moveFlags&(~MFL_ACTIVEGRAPPLE);state.grappleVisibleTime=0.0 end if;return true
end function
/// Set `state.moveFlags` to `(state.moveFlags&(~MFL_ACTIVEGRAPPLE))|MFL_GRAPPLERESET` and `state.reachabilityTime` to `0.0` in `mq3.botlib.ai_move_runtime.stopGrapple`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `moveFlags` and `reachabilityTime`. May update `state.moveFlags` and `state.reachabilityTime` in place.
/// @param config Configuration record; accesses `offhand` and `offCommand`.
function stopGrapple(runtime,state,config)
  if config.offhand and not emitCommand(runtime,state,config.offCommand) then return false end if;state.moveFlags=(state.moveFlags&(~MFL_ACTIVEGRAPPLE))|MFL_GRAPPLERESET;state.reachabilityTime=0.0;return true
end function
/// Update `state.moveFlags`, `state.grappleVisibleTime`, `state.lastGrappleDist` and `state.reachabilityTime` during `travelGrapple`.
/// @param runtime AI move runtime; accesses `aas` and `services`.
/// @param state AI move runtime state; accesses `moveFlags`, `origin`, `lastGrappleDist`, `grappleVisibleTime` and `viewOffset` and related fields. May update `state.moveFlags`, `state.grappleVisibleTime` and `state.lastGrappleDist` and additional fields in place.
/// @param reach AAS reachability record; accesses `finish` and `start`.
function travelGrapple(runtime,state,reach)
  result=emptyMoveResult();config=grappleConfig(runtime)
  if (state.moveFlags&MFL_GRAPPLERESET)!=0 then if config.offhand and not emitCommand(runtime,state,config.offCommand) then result.failure=true;return result end if;state.moveFlags=state.moveFlags&(~MFL_ACTIVEGRAPPLE);return result end if
  if not config.offhand then result.weapon=config.weaponIndex;result.flags=result.flags|MOVERESULT_MOVEMENTWEAPON end if
  if (state.moveFlags&MFL_ACTIVEGRAPPLE)!=0 then
    hookState=grappleState(runtime,state,reach);delta=[n.fsub(reach.finish[0],state.origin[0]),n.fsub(reach.finish[1],state.origin[1]),0.0];dist=distance([0.0,0.0,0.0],delta)
    if hookState!=0 and dist<48.0 then if n.fsub(state.lastGrappleDist,dist)<1.0 then if not stopGrapple(runtime,state,config) then result.failure=true end if;return result end if
    else if hookState==0 or (hookState==2 and dist>n.fsub(state.lastGrappleDist,2.0)) then if state.grappleVisibleTime<n.fsub(moveAas.getTime(runtime.aas),0.4) then if not stopGrapple(runtime,state,config) then result.failure=true end if;return result end if
    else state.grappleVisibleTime=moveAas.getTime(runtime.aas) end if
    if not config.offhand and not emitAttack(runtime,state) then result.failure=true;return result end if;state.lastGrappleDist=dist;return result
  end if
  state.grappleVisibleTime=moveAas.getTime(runtime.aas);direction=[n.fsub(reach.start[0],state.origin[0]),n.fsub(reach.start[1],state.origin[1]),n.fsub(reach.start[2],state.origin[2])];if (state.moveFlags&MFL_SWIMMING)==0 then direction[2]=0.0 end if;normal=normalize(direction);dist=normal[0];direction=normal[1]
  eye=[n.fadd(state.origin[0],state.viewOffset[0]),n.fadd(state.origin[1],state.viewOffset[1]),n.fadd(state.origin[2],state.viewOffset[2])];viewDirection=[n.fsub(reach.finish[0],eye[0]),n.fsub(reach.finish[1],eye[1]),n.fsub(reach.finish[2],eye[2])];result.idealViewAngles=moveQMath.vectoangles(viewDirection);result.flags=result.flags|MOVERESULT_MOVEMENTVIEW
  if dist<5.0 and absFloat(angleDiff(result.idealViewAngles[0],state.viewAngles[0]))<2.0 and absFloat(angleDiff(result.idealViewAngles[1],state.viewAngles[1]))<2.0 then
    if runtime.services==void or runtime.services.grappleTraceFn==void then result.failure=true;return result end if;traceEnd=runtime.services.grappleTraceFn(runtime.services.context,eye,reach.finish,state.entityNum);if traceEnd is error or traceEnd==void or len(traceEnd)!=3 or distance(traceEnd,reach.finish)>16.0 then result.failure=true;return result end if
    if config.offhand then if not emitCommand(runtime,state,config.onCommand) then result.failure=true;return result end if else if not emitAttack(runtime,state) then result.failure=true;return result end if;state.moveFlags=state.moveFlags|MFL_ACTIVEGRAPPLE;state.lastGrappleDist=999999.0
  else speed=400.0;if dist<70.0 then speed=n.fmul(4.0,dist) end if;result=checkBlocked(runtime,state,direction,true,result);if not emitMovement(runtime,state,direction,speed) then result.failure=true;return result end if;result.moveDir=copyVector(direction) end if
  areaNum=moveAas.pointAreaNum(runtime.aas,state.origin);if areaNum!=0 and areaNum!=state.reachAreaNum then state.reachabilityTime=0.0 end if;return result
end function
/// Update `state.lastReachNum`, `state.lastAreaNum`, `state.lastGoalAreaNum` and `state.lastOrigin` during `moveInGoalArea`.
/// @param runtime AI move runtime; accesses `services`.
/// @param state AI move runtime state; accesses `moveFlags`, `origin`, `lastReachNum`, `lastAreaNum` and `lastGoalAreaNum` and related fields. May update `state.lastReachNum`, `state.lastAreaNum` and `state.lastGoalAreaNum` and additional fields in place.
/// @param goal Bot navigation goal; accesses `origin` and `areaNum`.
function moveInGoalArea(runtime,state,goal)
  swimming=(state.moveFlags&MFL_SWIMMING)!=0;z=0.0;if swimming then z=n.fsub(goal.origin[2],state.origin[2]) end if
  result=emptyMoveResult();direction=[n.fsub(goal.origin[0],state.origin[0]),n.fsub(goal.origin[1],state.origin[1]),z];normal=normalize(direction);dist=normal[0];direction=normal[1];if dist>100.0 then dist=100.0 end if;speed=n.fmul(4.0,dist);if speed<10.0 then speed=0.0 end if;result=checkBlocked(runtime,state,direction,true,result)
  if not emitMovement(runtime,state,direction,speed) then result.failure=true else result.moveDir=copyVector(direction) end if
  if swimming then result.travelType=moveRouting.TRAVEL_SWIM;result.idealViewAngles=moveQMath.vectoangles(direction);result.flags=result.flags|MOVERESULT_SWIMVIEW else result.travelType=moveRouting.TRAVEL_WALK end if
  state.lastReachNum=0;state.lastAreaNum=0;state.lastGoalAreaNum=goal.areaNum;state.lastOrigin=copyVector(state.origin);return result
end function
/// Apply `mq3.botlib.ai_move_runtime.emptyMoveResult` while evaluating `unsupportedTravel`.
/// @param reach AAS reachability record; accesses `travelType`.
function unsupportedTravel(reach)
  result=emptyMoveResult();result.failure=true;result.type=reach.travelType&moveRouting.TRAVELTYPE_MASK;result.travelType=reach.travelType;return result
end function
/// Update `state.lastReachNum`, `state.reachabilityTime`, `result.flags` and `result.blocked` and related state during `checkStandingOnMover`.
/// @param runtime AI move runtime; accesses `services`, `router` and `aas`.
/// @param state AI move runtime state; accesses `presenceType`, `origin`, `entityNum`, `lastReachNum` and `reachabilityTime`. May update `state.lastReachNum` and `state.reachabilityTime` in place.
/// @param result Result record; accesses `flags`, `blocked` and `blockEntity`. May update `result.flags`, `result.blocked` and `result.blockEntity` in place.
function checkStandingOnMover(runtime,state,result)
  host=runtime.services
  if host==void or host.groundTraceFn==void or host.entityModelFn==void or host.modelTypeFn==void or host.modelReachabilityFn==void then return result end if
  bounds=moveAas.presenceTypeBoundingBox(state.presenceType)
  if bounds is error then return result end if
  finish=[state.origin[0],state.origin[1],state.origin[2]-3.0]
  ground=host.groundTraceFn(host.context,state.origin,bounds[0],bounds[1],finish,state.entityNum,CONTENTS_SOLID_PLAYERCLIP)
  if ground==void or ground is error or ground.startSolid or ground.fraction>=1.0 or ground.entity==ENTITYNUM_WORLD or ground.entity==ENTITYNUM_NONE then return result end if
  model=host.entityModelFn(host.context,ground.entity)
  kind=host.modelTypeFn(host.context,model)
  if kind==MODELTYPE_FUNC_PLAT or kind==MODELTYPE_FUNC_BOB then
    travelKind=moveRouting.TRAVEL_ELEVATOR
    topFlag=publicHeaders.MOVERESULT_ONTOPOF_ELEVATOR
    if kind==MODELTYPE_FUNC_BOB then travelKind=moveRouting.TRAVEL_FUNCBOB;topFlag=publicHeaders.MOVERESULT_ONTOPOF_FUNCBOB end if
    selected=state.lastReachNum
    if selected<1 or selected>=len(runtime.router.reaches) or (runtime.router.reaches[selected].travelType&moveRouting.TRAVELTYPE_MASK)!=travelKind or (runtime.router.reaches[selected].faceNum&65535)!=model then
      selected=host.modelReachabilityFn(host.context,model)
      if selected>0 and selected<len(runtime.router.reaches) then
        state.lastReachNum=selected
        state.reachabilityTime=n.fadd(moveAas.getTime(runtime.aas),reachabilityTime(runtime.router.reaches[selected]))
      end if
    end if
    if selected>0 and selected<len(runtime.router.reaches) then result.flags=result.flags|topFlag;return result end if
  else if kind==MODELTYPE_FUNC_STATIC or kind==MODELTYPE_FUNC_DOOR then
    if moveAas.areaReachability(runtime.aas,fuzzyPointReachabilityArea(runtime,state.origin))!=0 then return result end if
  end if
  result.blocked=true
  result.blockEntity=ground.entity
  result.flags=result.flags|MOVERESULT_ONTOPOFOBSTACLE
  return result
end function
/// Use `runtime.services.againstLadderFn` to perform `moveToGoal`.
/// @param runtime AI move runtime; accesses `router`, `pools`, `services` and `aas`.
/// @param handle Handle identifying the allocated bot movement state.
/// @param goal Bot navigation goal; accesses `areaNum`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function moveToGoal(runtime,handle,goal,travelFlags)
  result=emptyMoveResult();if runtime==void or runtime.router==void then result.failure=true;return result end if;state=resources.moveState(runtime.pools,handle);if state==void or goal==void then result.failure=true;return result end if
  if not resetGrapple(runtime,state) then result.failure=true;return result end if
  state.moveFlags=state.moveFlags&(~(MFL_SWIMMING|MFL_AGAINSTLADDER))
  if onGround(runtime,state) then state.moveFlags=state.moveFlags|MFL_ONGROUND end if
  if (state.moveFlags&MFL_ONGROUND)!=0 then
    result=checkStandingOnMover(runtime,state,result)
    if result.blocked then return result end if
  end if
  if isSwimming(runtime,state) then state.moveFlags=state.moveFlags|MFL_SWIMMING end if
  if runtime.services!=void and runtime.services.againstLadderFn!=void and runtime.services.againstLadderFn(runtime.services.context,state.origin) then state.moveFlags=state.moveFlags|MFL_AGAINSTLADDER end if
  active=(state.moveFlags&(MFL_ONGROUND|MFL_SWIMMING|MFL_AGAINSTLADDER))!=0
  if active then
    state.areaNum=fuzzyPointReachabilityArea(runtime,state.origin);if state.areaNum==0 then result.failure=true;result.blocked=true;result.type=RESULTTYPE_INSOLIDAREA;return result end if;if state.areaNum==goal.areaNum then return moveInGoalArea(runtime,state,goal) end if
    reachNum=state.lastReachNum
    if reachNum>0 and reachNum<len(runtime.router.reaches) then
      reach=runtime.router.reaches[reachNum];kind=reach.travelType&moveRouting.TRAVELTYPE_MASK
      if (moveRouting.travelFlagForType(reach.travelType)&travelFlags)==0 then reachNum=0
      else if kind==moveRouting.TRAVEL_GRAPPLEHOOK then if state.reachabilityTime<moveAas.getTime(runtime.aas) or (state.moveFlags&MFL_GRAPPLERESET)!=0 then reachNum=0 end if
      else if kind==moveRouting.TRAVEL_ELEVATOR or kind==moveRouting.TRAVEL_FUNCBOB then
        if (result.flags&publicHeaders.MOVERESULT_ONTOPOF_FUNCBOB)!=0 then state.reachabilityTime=n.fadd(moveAas.getTime(runtime.aas),5.0) end if
        if state.areaNum==reach.areaNum or state.reachabilityTime<moveAas.getTime(runtime.aas) then reachNum=0 end if
      else if state.lastGoalAreaNum!=goal.areaNum or state.reachabilityTime<moveAas.getTime(runtime.aas) or state.lastAreaNum!=state.areaNum then reachNum=0 end if
    else reachNum=0 end if
    resultFlags=0;if reachNum==0 then selected=bestReachability(runtime,state,goal,travelFlags);reachNum=selected[0];resultFlags=selected[1];state.reachAreaNum=state.areaNum;state.jumpReach=0;state.moveFlags=state.moveFlags&(~MFL_GRAPPLERESET);if reachNum>0 then state.reachabilityTime=n.fadd(moveAas.getTime(runtime.aas),reachabilityTime(runtime.router.reaches[reachNum])) end if end if
    state.lastReachNum=reachNum;state.lastGoalAreaNum=goal.areaNum;state.lastAreaNum=state.areaNum;if reachNum==0 then result.failure=true;result.flags=resultFlags;state.lastOrigin=copyVector(state.origin);return result end if;reach=runtime.router.reaches[reachNum]
    kind=reach.travelType&moveRouting.TRAVELTYPE_MASK
    if kind==moveRouting.TRAVEL_WALK then result=travelWalk(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_CROUCH then result=travelCrouch(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_BARRIERJUMP then result=travelBarrierJump(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_JUMP then result=travelJump(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_LADDER then result=travelLadder(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_WALKOFFLEDGE then result=travelWalkOffLedge(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_SWIM then result=travelSwim(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_WATERJUMP then result=travelWaterJump(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_TELEPORT then result=travelTeleport(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_ELEVATOR then result=travelElevator(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_ROCKETJUMP then result=travelWeaponJump(runtime,state,reach,WEAPON_ROCKET_LAUNCHER)
    else if kind==moveRouting.TRAVEL_BFGJUMP then result=travelWeaponJump(runtime,state,reach,WEAPON_BFG)
    else if kind==moveRouting.TRAVEL_JUMPPAD then result=travelJumpPad(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_GRAPPLEHOOK then result=travelGrapple(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_FUNCBOB then result=travelFuncBob(runtime,state,reach)
    else result=unsupportedTravel(reach) end if;result.travelType=reach.travelType;result.flags=result.flags|resultFlags
  else if state.lastReachNum>0 and state.lastReachNum<len(runtime.router.reaches) then
    reach=runtime.router.reaches[state.lastReachNum];kind=reach.travelType&moveRouting.TRAVELTYPE_MASK
    if kind==moveRouting.TRAVEL_WALK then result=travelWalk(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_CROUCH then result=emptyMoveResult()
    else if kind==moveRouting.TRAVEL_BARRIERJUMP then result=finishTravelBarrierJump(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_JUMP then result=finishTravelJump(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_LADDER then result=travelLadder(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_WALKOFFLEDGE then result=finishTravelWalkOffLedge(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_SWIM then result=travelSwim(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_WATERJUMP then result=finishTravelWaterJump(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_TELEPORT then result=emptyMoveResult()
    else if kind==moveRouting.TRAVEL_ELEVATOR then result=finishTravelElevator(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_ROCKETJUMP or kind==moveRouting.TRAVEL_BFGJUMP then result=finishTravelWeaponJump(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_JUMPPAD then result=finishTravelJumpPad(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_GRAPPLEHOOK then result=travelGrapple(runtime,state,reach)
    else if kind==moveRouting.TRAVEL_FUNCBOB then result=finishTravelFuncBob(runtime,state,reach)
    else result=unsupportedTravel(reach) end if;result.travelType=reach.travelType
  else result.failure=true end if
  if result.blocked then state.reachabilityTime=n.fsub(state.reachabilityTime,n.fmul(10.0,state.thinkTime)) end if;state.lastOrigin=copyVector(state.origin);return result
end function
/// Use `runtime.services.walkDirectionFn` to perform `moveInDirection`. Return paths include `runtime.services.walkDirectionFn(runtime.services.context,state,direction,speed,type)`.
/// @param runtime AI move runtime; accesses `pools` and `services`.
/// @param handle Handle identifying the allocated bot movement state.
/// @param direction Second three-component point.
/// @param speed Requested movement speed.
/// @param type Value passed as argument 5 to `runtime.services.walkDirectionFn`.
function moveInDirection(runtime,handle,direction,speed,type)
  if runtime==void then return false end if;state=resources.moveState(runtime.pools,handle);if state==void then return false end if;normal=normalize(direction);normalized=normal[1]
  if isSwimming(runtime,state) then return emitMovement(runtime,state,normalized,speed) end if
  if onGround(runtime,state) then state.moveFlags=state.moveFlags|MFL_ONGROUND end if
  if (state.moveFlags&MFL_ONGROUND)==0 then
    if (state.moveFlags&MFL_BARRIERJUMP)!=0 and state.velocity[2]<50.0 then emitMovement(runtime,state,direction,speed) end if
    return true
  end if
  if runtime.services==void or runtime.services.walkDirectionFn==void then return false end if
  return runtime.services.walkDirectionFn(runtime.services.context,state,direction,speed,type)
end function
/// Test `op==OP_MOVE_TO_GOAL or op==OP_MOVE_IN_DIRECTION or op==OP_REACHABILITY_AREA or op==OP_MOVEMENT_VIEW_TARGET or op==OP_INIT_MOVE_STATE` as the condition for `supportsTrap`.
/// @param op Numeric syscall operation identifier.
function supportsTrap(op) return op==OP_MOVE_TO_GOAL or op==OP_MOVE_IN_DIRECTION or op==OP_REACHABILITY_AREA or op==OP_MOVEMENT_VIEW_TARGET or op==OP_INIT_MOVE_STATE end function
