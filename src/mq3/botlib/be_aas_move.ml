// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete symbol facade for code/botlib/be_aas_move.c.
package mq3.botlib.be_aas_move

import mq3.compat.numeric as n
import mq3.shared.math as qmath
import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_client_movement as movement

/// `Settings` record for be aas move, containing `gravityDirection`, `friction`, `stopSpeed`, `gravity` and `waterFriction` and related fields.
struct Settings
  /// Normalized direction in which gravity accelerates the moving bot.
  gravityDirection
  /// Ground-friction coefficient used by movement prediction.
  friction
  /// Minimum speed used when calculating ground-friction deceleration.
  stopSpeed
  /// Gravity magnitude used when predicting movement.
  gravity
  /// Friction coefficient applied while the bot is swimming.
  waterFriction
  /// Gravity magnitude used while the bot is submerged.
  waterGravity
  /// Upper bound on velocity used by movement prediction.
  maxVelocity
  /// Maximum walking speed allowed by movement prediction.
  maxWalkVelocity
  /// Maximum crouched movement speed allowed by movement prediction.
  maxCrouchVelocity
  /// Maximum swimming speed allowed by movement prediction.
  maxSwimVelocity
  /// Acceleration coefficient applied to grounded walking input.
  walkAccelerate
  /// Acceleration coefficient applied while the bot is airborne.
  airAccelerate
  /// Acceleration coefficient applied to swimming input.
  swimAccelerate
  /// Maximum obstacle height that can be crossed by stepping.
  maxStep
  /// Steepness threshold separating walkable ground from an impassable slope.
  maxSteepness
  /// Maximum obstacle height accepted by a jump out of water.
  maxWaterJump
  /// Maximum obstacle height accepted by a barrier-jump prediction.
  maxBarrier
  /// Initial upward velocity applied when beginning a jump.
  jumpVelocity
  /// Impact-velocity threshold for the lower fall-damage category.
  fallDelta5
  /// Impact-velocity threshold for the higher fall-damage category.
  fallDelta10
  /// Routing-cost setting for water jump.
  rsWaterJump
  /// Routing-cost setting for teleport.
  rsTeleport
  /// Routing-cost setting for barrier jump.
  rsBarrierJump
  /// Routing-cost setting for start crouch.
  rsStartCrouch
  /// Routing-cost setting for start grapple.
  rsStartGrapple
  /// Routing-cost setting for start walk off ledge.
  rsStartWalkOffLedge
  /// Routing-cost setting for start jump.
  rsStartJump
  /// Routing-cost setting for rocket jump.
  rsRocketJump
  /// Routing-cost setting for bfg jump.
  rsBfgJump
  /// Routing-cost setting for jump pad.
  rsJumpPad
  /// Routing-cost setting for air controlled jump pad.
  rsAirControlledJumpPad
  /// Routing-cost setting for func bob.
  rsFuncBob
  /// Routing-cost setting for start elevator.
  rsStartElevator
  /// Routing-cost setting for fall damage5.
  rsFallDamage5
  /// Routing-cost setting for fall damage10.
  rsFallDamage10
  /// Routing-cost setting for max fall height.
  rsMaxFallHeight
  /// Routing-cost setting for max jump fall height.
  rsMaxJumpFallHeight
end struct

/// `Runtime` record for be aas move, containing `services`, `settings`, `againstLadderFn`, `debugClearFn` and `context`.
struct Runtime
  /// Prediction trace and contents services used by the AAS movement facade.
  services
  /// Area or runtime settings controlling navigation behavior.
  settings
  /// Host callback that reports whether the bot hull is against a climbable ladder.
  againstLadderFn
  /// Host callback that removes host-side navigation debug drawings.
  debugClearFn
  /// Caller-supplied data associated with ladder checks and debug cleanup around AAS movement
  /// prediction.
  context
end struct

/// Create a `mq3.botlib.be_aas_move.Settings` record, initializing `gravityDirection` as `[0.0,0.0,-1.0]`, `friction` as `6.0` and `stopSpeed` as `100.0`.
function AAS_InitSettings()
  return Settings([0.0,0.0,-1.0],6.0,100.0,800.0,1.0,400.0,
    320.0,320.0,100.0,150.0,10.0,1.0,4.0,19.0,0.7,18.0,33.0,
    270.0,40.0,60.0,400.0,50.0,100.0,300.0,500.0,70.0,300.0,
    500.0,500.0,250.0,300.0,300.0,50.0,300.0,500.0,0.0,450.0)
end function

/// Create a `mq3.botlib.be_aas_move.Runtime` record, initializing `services` from `services` and `settings` as `AAS_InitSettings()`.
/// @param services Initial value stored in `mq3.botlib.be_aas_move.Runtime.services`.
function create(services)
  return Runtime(services,AAS_InitSettings(),void,void,void)
end function

/// Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for be aas move.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function copy(value) return [value[0],value[1],value[2]] end function
/// Return a new array `[n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])]` for `subtract`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function subtract(a,b) return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])] end function
/// Return a new array `[n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])]` for `add`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function add(a,b) return [n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])] end function
/// Return a new array `[n.fmul(value[0],factor),n.fmul(value[1],factor),n.fmul(value[2],factor)]` for `scale`.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param factor Value passed as argument 2 to `mq3.compat.numeric.fmul`.
function scale(value,factor) return [n.fmul(value[0],factor),n.fmul(value[1],factor),n.fmul(value[2],factor)] end function
/// Forward `length` to `mq3.compat.numeric.fsqrt` and return the delegated result.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function length(value) return n.fsqrt(n.fadd(n.fadd(n.fmul(value[0],value[0]),n.fmul(value[1],value[1])),n.fmul(value[2],value[2]))) end function
/// Apply `mq3.botlib.be_aas_move.length` and `mq3.botlib.be_aas_move.scale` while evaluating `normalize`. Return paths include `scale(value,n.fdiv(1.0,magnitude))`.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function normalize(value)
  magnitude=length(value);if magnitude==0.0 then return [0.0,0.0,0.0] end if
  return scale(value,n.fdiv(1.0,magnitude))
end function

/// Set `origin[axis]` to `trace.endpos[axis]` in `mq3.botlib.be_aas_move.AAS_DropToFloor`.
/// @param runtime Be AAS move runtime; accesses `services`.
/// @param origin World-space position as three coordinates. Entries may be updated in place.
/// @param mins Not read by this implementation; retained in the `AAS_DropToFloor` signature.
/// @param maxs Not read by this implementation; retained in the `AAS_DropToFloor` signature.
function AAS_DropToFloor(runtime,origin,mins,maxs)
  if runtime==void or runtime.services==void or runtime.services.traceFn==void then return false end if
  finish=copy(origin);finish[2]=n.fsub(finish[2],100.0)
  trace=runtime.services.traceFn(runtime.services.context,origin,finish,aasRuntime.PRESENCE_NORMAL,0)
  if trace is error or trace.startsolid then return false end if
  for axis=0 to 2 origin[axis]=trace.endpos[axis] end for;return true
end function

/// Use `runtime.againstLadderFn` to perform `AAS_AgainstLadder`. Return paths include `runtime.againstLadderFn(runtime.context,origin)`.
/// @param runtime Be AAS move runtime; accesses `againstLadderFn` and `context`.
/// @param origin World-space position as three coordinates.
function AAS_AgainstLadder(runtime,origin)
  if runtime==void or runtime.againstLadderFn==void then return false end if
  return runtime.againstLadderFn(runtime.context,origin)
end function

/// Forward `AAS_OnGround` to `mq3.botlib.aas_client_movement.onGround` and return the delegated result.
/// @param runtime Be AAS move runtime; accesses `services` and `settings`.
/// @param origin World-space position as three coordinates.
/// @param presenceType AAS presence type selecting the movement bounds.
/// @param passEntity Value passed as argument 5 to `s.traceFn`.
function AAS_OnGround(runtime,origin,presenceType,passEntity)
  return movement.onGround(runtime.services,origin,presenceType,passEntity,runtime.settings.maxSteepness)
end function

/// Forward `AAS_Swimming` to `mq3.botlib.aas_client_movement.swimming` and return the delegated result.
/// @param runtime Be AAS move runtime; accesses `services`.
/// @param origin World-space position as three coordinates.
function AAS_Swimming(runtime,origin) return movement.swimming(runtime.services,origin) end function

/// Convert angles to a movement direction, recognizing the original straight-up and straight-down angle sentinels.
/// @param angles Pitch, yaw and roll angles in degrees.
function AAS_SetMovedir(angles)
  if angles[0]==0.0 and angles[1]==-1.0 and angles[2]==0.0 then return [0.0,0.0,1.0] end if
  if angles[0]==0.0 and angles[1]==-2.0 and angles[2]==0.0 then return [0.0,0.0,-1.0] end if
  return qmath.AngleVectors(angles)[0]
end function

/// Apply `mq3.botlib.be_aas_move.normalize`, `mq3.botlib.be_aas_move.copy` and `mq3.botlib.be_aas_move.scale` while evaluating `AAS_JumpReachRunStart`. Return paths include `copy(result.endpos)`.
/// @param runtime Be AAS move runtime; accesses `services`.
/// @param reach AAS reachability record; accesses `start` and `finish`.
function AAS_JumpReachRunStart(runtime,reach)
  horizontal=normalize([n.fsub(reach.start[0],reach.finish[0]),n.fsub(reach.start[1],reach.finish[1]),0.0])
  start=copy(reach.start);start[2]=n.fadd(start[2],1.0);command=scale(horizontal,400.0)
  result=movement.predict(runtime.services,-1,start,aasRuntime.PRESENCE_NORMAL,true,[0.0,0.0,0.0],command,1,2,0.1,
    movement.SE_ENTERWATER|movement.SE_ENTERSLIME|movement.SE_ENTERLAVA|movement.SE_HITGROUNDDAMAGE|movement.SE_GAP,0,false)
  if result is error then return start end if
  if (result.stopevent&(movement.SE_ENTERSLIME|movement.SE_ENTERLAVA|movement.SE_HITGROUNDDAMAGE))!=0 then return start end if
  return copy(result.endpos)
end function

/// Use `runtime.services.traceFn` to perform `AAS_WeaponJumpZVelocity`.
/// @param runtime Be AAS move runtime; accesses `services` and `settings`.
/// @param origin World-space position as three coordinates.
/// @param radiusDamage Value passed as argument 1 to `mq3.compat.numeric.fsub`.
function AAS_WeaponJumpZVelocity(runtime,origin,radiusDamage)
  start=[origin[0],origin[1],n.fadd(origin[2],8.0)];vectors=qmath.AngleVectors([90.0,0.0,0.0]);forward=vectors[0];right=vectors[1]
  start[0]=n.fadd(start[0],n.fadd(n.fmul(forward[0],8.0),n.fmul(right[0],8.0)))
  start[1]=n.fadd(start[1],n.fadd(n.fmul(forward[1],8.0),n.fmul(right[1],8.0)))
  start[2]=n.fadd(start[2],n.fadd(n.fadd(n.fmul(forward[2],8.0),n.fmul(right[2],8.0)),-8.0))
  finish=add(start,scale(forward,500.0));impact=finish
  if runtime!=void and runtime.services!=void and runtime.services.traceFn!=void then
    trace=runtime.services.traceFn(runtime.services.context,start,finish,0,1);if not (trace is error) then impact=trace.endpos end if
  end if
  center=[origin[0],origin[1],n.fadd(origin[2],4.0)];offset=subtract(impact,center)
  points=n.fsub(radiusDamage,n.fmul(0.5,length(offset)));if points<0.0 then points=0.0 end if;points=n.fmul(points,0.5)
  direction=normalize(subtract(origin,impact));return n.fadd(n.fmul(direction[2],n.fdiv(n.fmul(1600.0,points),200.0)),runtime.settings.jumpVelocity)
end function

/// Forward `AAS_RocketJumpZVelocity` to `mq3.botlib.be_aas_move.AAS_WeaponJumpZVelocity` and return the delegated result.
/// @param runtime Be AAS move runtime; accesses `services` and `settings`.
/// @param origin World-space position as three coordinates.
function AAS_RocketJumpZVelocity(runtime,origin) return AAS_WeaponJumpZVelocity(runtime,origin,120.0) end function
/// Forward `AAS_BFGJumpZVelocity` to `mq3.botlib.be_aas_move.AAS_WeaponJumpZVelocity` and return the delegated result.
/// @param runtime Be AAS move runtime; accesses `services` and `settings`.
/// @param origin World-space position as three coordinates.
function AAS_BFGJumpZVelocity(runtime,origin) return AAS_WeaponJumpZVelocity(runtime,origin,120.0) end function

/// Forward `AAS_Accelerate` to `mq3.botlib.aas_client_movement.accelerate` and return the delegated result.
/// @param velocity Three-component movement velocity.
/// @param frameTime Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param wishDirection Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param wishSpeed Value passed as argument 1 to `mq3.compat.numeric.fsub`.
/// @param acceleration Value passed as argument 1 to `mq3.compat.numeric.fmul`.
function AAS_Accelerate(velocity,frameTime,wishDirection,wishSpeed,acceleration)
  return movement.accelerate(velocity,frameTime,wishDirection,wishSpeed,acceleration)
end function
/// Apply `mq3.botlib.be_aas_move.subtract` while evaluating `AAS_AirControl`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param velocity Not read by this implementation; retained in the `AAS_AirControl` signature.
/// @param commandMove Not read by this implementation; retained in the `AAS_AirControl` signature.
function AAS_AirControl(start,finish,velocity,commandMove)
  // The original routine only computes this local and has no observable side effect.
  direction=subtract(finish,start);return void
end function
/// Forward `AAS_ApplyFriction` to `mq3.botlib.aas_client_movement.applyFriction` and return the delegated result.
/// @param velocity Three-component movement velocity.
/// @param friction Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param stopSpeed Value used by `applyFriction` in `if control<stopspeed then control=stopspeed end if`.
/// @param frameTime Value passed as argument 1 to `mq3.compat.numeric.fmul`.
function AAS_ApplyFriction(velocity,friction,stopSpeed,frameTime)
  return movement.applyFriction(velocity,friction,stopSpeed,frameTime)
end function
/// Forward `AAS_ClipToBBox` to `mq3.botlib.aas_client_movement.clipToBBox` and return the delegated result.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param presenceType AAS presence type selecting the movement bounds.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
function AAS_ClipToBBox(start,finish,presenceType,mins,maxs)
  return movement.clipToBBox(start,finish,presenceType,mins,maxs)
end function
/// Forward `AAS_ClientMovementPrediction` to `mq3.botlib.aas_client_movement.predictWithBBox` and return the delegated result.
/// @param runtime Be AAS move runtime; accesses `services`.
/// @param entityNum Entity number in the game or AAS entity table.
/// @param origin World-space position as three coordinates.
/// @param presenceType AAS presence type selecting the movement bounds.
/// @param onGround Value used by `predictWithBBox` in `if onground or inWater then friction=cfg.waterfriction`.
/// @param velocity Three-component movement velocity.
/// @param commandMove Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param commandFrames Value used by `predictWithBBox` in `if frame<cmdframes then`.
/// @param maxFrames Value used by `predictWithBBox` in `while frame<maxframes`.
/// @param frameTime Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param stopEvent Operand used to evaluate the returned expression `stopped(s,org,frameVelocity,frametime,presence,event&stopevents,contents,frame,zeroTrace(),area)`.
/// @param stopAreaNum Value used by `stopped` in `if area>=0 then value.endarea=area end if`.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param visualize Value passed as argument 15 to `mq3.botlib.aas_client_movement.predictWithBBox`.
function AAS_ClientMovementPrediction(runtime,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,stopEvent,stopAreaNum,mins,maxs,visualize)
  return movement.predictWithBBox(runtime.services,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,stopEvent,stopAreaNum,mins,maxs,visualize)
end function
/// Forward `AAS_PredictClientMovement` to `mq3.botlib.aas_client_movement.predict` and return the delegated result.
/// @param runtime Be AAS move runtime; accesses `services`.
/// @param entityNum Entity number in the game or AAS entity table.
/// @param origin World-space position as three coordinates.
/// @param presenceType AAS presence type selecting the movement bounds.
/// @param onGround Value used by `predictWithBBox` in `if onground or inWater then friction=cfg.waterfriction`.
/// @param velocity Three-component movement velocity.
/// @param commandMove Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param commandFrames Value used by `predictWithBBox` in `if frame<cmdframes then`.
/// @param maxFrames Value used by `predictWithBBox` in `while frame<maxframes`.
/// @param frameTime Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param stopEvent Operand used to evaluate the returned expression `stopped(s,org,frameVelocity,frametime,presence,event&stopevents,contents,frame,zeroTrace(),area)`.
/// @param stopAreaNum Value used by `stopped` in `if area>=0 then value.endarea=area end if`.
/// @param visualize Value passed as argument 15 to `mq3.botlib.aas_client_movement.predictWithBBox`.
function AAS_PredictClientMovement(runtime,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,stopEvent,stopAreaNum,visualize)
  return movement.predict(runtime.services,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,stopEvent,stopAreaNum,visualize)
end function
/// Forward `AAS_ClientMovementHitBBox` to `mq3.botlib.be_aas_move.AAS_ClientMovementPrediction` and return the delegated result.
/// @param runtime Be AAS move runtime; accesses `services`.
/// @param entityNum Entity number in the game or AAS entity table.
/// @param origin World-space position as three coordinates.
/// @param presenceType AAS presence type selecting the movement bounds.
/// @param onGround Value used by `predictWithBBox` in `if onground or inWater then friction=cfg.waterfriction`.
/// @param velocity Three-component movement velocity.
/// @param commandMove Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param commandFrames Value used by `predictWithBBox` in `if frame<cmdframes then`.
/// @param maxFrames Value used by `predictWithBBox` in `while frame<maxframes`.
/// @param frameTime Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param visualize Value passed as argument 15 to `mq3.botlib.aas_client_movement.predictWithBBox`.
function AAS_ClientMovementHitBBox(runtime,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,mins,maxs,visualize)
  return AAS_ClientMovementPrediction(runtime,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,movement.SE_HITBOUNDINGBOX,0,mins,maxs,visualize)
end function
/// Use `runtime.debugClearFn` to perform `AAS_TestMovementPrediction`.
/// @param runtime Be AAS move runtime; accesses `debugClearFn` and `context`.
/// @param entityNum Entity number in the game or AAS entity table.
/// @param origin World-space position as three coordinates.
/// @param direction Three-component array; components 0, 1 and 2 are used in their stored order.
function AAS_TestMovementPrediction(runtime,entityNum,origin,direction)
  if runtime.debugClearFn!=void then runtime.debugClearFn(runtime.context) end if
  command=copy(direction);if not AAS_Swimming(runtime,origin) then command[2]=0.0 end if;command=scale(normalize(command),400.0);command[2]=224.0
  return AAS_PredictClientMovement(runtime,entityNum,origin,aasRuntime.PRESENCE_NORMAL,true,[0.0,0.0,0.0],command,13,13,0.1,movement.SE_HITGROUND,0,true)
end function
/// Apply `mq3.botlib.be_aas_move.subtract` while evaluating `AAS_HorizontalVelocityForJump`. Return paths include `[true,speed]`.
/// @param runtime Be AAS move runtime; accesses `settings`.
/// @param zVelocity Value passed as argument 1 to `mq3.compat.numeric.fdiv`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
function AAS_HorizontalVelocityForJump(runtime,zVelocity,start,finish)
  gravity=runtime.settings.gravity;maximum=runtime.settings.maxVelocity
  maximumJump=n.fmul(n.fmul(0.5,gravity),n.fmul(n.fdiv(zVelocity,gravity),n.fdiv(zVelocity,gravity)))
  height=n.fsub(n.fadd(start[2],maximumJump),finish[2]);if height<0.0 then return [false,maximum] end if
  time=n.fsqrt(n.fdiv(height,n.fmul(0.5,gravity)));denominator=n.fadd(time,n.fdiv(zVelocity,gravity));if denominator==0.0 then return [false,maximum] end if
  direction=subtract(finish,start);speed=n.fdiv(n.fsqrt(n.fadd(n.fmul(direction[0],direction[0]),n.fmul(direction[1],direction[1]))),denominator)
  if speed>maximum then return [false,maximum] end if;return [true,speed]
end function
