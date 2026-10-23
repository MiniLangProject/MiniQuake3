// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete symbol facade for code/botlib/be_aas_move.c.
package mq3.botlib.be_aas_move

import mq3.compat.numeric as n
import mq3.shared.math as qmath
import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_client_movement as movement

struct Settings
  gravityDirection friction stopSpeed gravity waterFriction waterGravity
  maxVelocity maxWalkVelocity maxCrouchVelocity maxSwimVelocity
  walkAccelerate airAccelerate swimAccelerate maxStep maxSteepness
  maxWaterJump maxBarrier jumpVelocity fallDelta5 fallDelta10
  rsWaterJump rsTeleport rsBarrierJump rsStartCrouch rsStartGrapple
  rsStartWalkOffLedge rsStartJump rsRocketJump rsBfgJump rsJumpPad
  rsAirControlledJumpPad rsFuncBob rsStartElevator rsFallDamage5
  rsFallDamage10 rsMaxFallHeight rsMaxJumpFallHeight
end struct

struct Runtime services settings againstLadderFn debugClearFn context end struct

function AAS_InitSettings()
  return Settings([0.0,0.0,-1.0],6.0,100.0,800.0,1.0,400.0,
    320.0,320.0,100.0,150.0,10.0,1.0,4.0,19.0,0.7,18.0,33.0,
    270.0,40.0,60.0,400.0,50.0,100.0,300.0,500.0,70.0,300.0,
    500.0,500.0,250.0,300.0,300.0,50.0,300.0,500.0,0.0,450.0)
end function

function create(services)
  return Runtime(services,AAS_InitSettings(),void,void,void)
end function

function copy(value) return [value[0],value[1],value[2]] end function
function subtract(a,b) return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])] end function
function add(a,b) return [n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])] end function
function scale(value,factor) return [n.fmul(value[0],factor),n.fmul(value[1],factor),n.fmul(value[2],factor)] end function
function length(value) return n.fsqrt(n.fadd(n.fadd(n.fmul(value[0],value[0]),n.fmul(value[1],value[1])),n.fmul(value[2],value[2]))) end function
function normalize(value)
  magnitude=length(value);if magnitude==0.0 then return [0.0,0.0,0.0] end if
  return scale(value,n.fdiv(1.0,magnitude))
end function

function AAS_DropToFloor(runtime,origin,mins,maxs)
  if runtime==void or runtime.services==void or runtime.services.traceFn==void then return false end if
  finish=copy(origin);finish[2]=n.fsub(finish[2],100.0)
  trace=runtime.services.traceFn(runtime.services.context,origin,finish,aasRuntime.PRESENCE_NORMAL,0)
  if trace is error or trace.startsolid then return false end if
  for axis=0 to 2 origin[axis]=trace.endpos[axis] end for;return true
end function

function AAS_AgainstLadder(runtime,origin)
  if runtime==void or runtime.againstLadderFn==void then return false end if
  return runtime.againstLadderFn(runtime.context,origin)
end function

function AAS_OnGround(runtime,origin,presenceType,passEntity)
  return movement.onGround(runtime.services,origin,presenceType,passEntity,runtime.settings.maxSteepness)
end function

function AAS_Swimming(runtime,origin) return movement.swimming(runtime.services,origin) end function

function AAS_SetMovedir(angles)
  if angles[0]==0.0 and angles[1]==-1.0 and angles[2]==0.0 then return [0.0,0.0,1.0] end if
  if angles[0]==0.0 and angles[1]==-2.0 and angles[2]==0.0 then return [0.0,0.0,-1.0] end if
  return qmath.AngleVectors(angles)[0]
end function

function AAS_JumpReachRunStart(runtime,reach)
  horizontal=normalize([n.fsub(reach.start[0],reach.finish[0]),n.fsub(reach.start[1],reach.finish[1]),0.0])
  start=copy(reach.start);start[2]=n.fadd(start[2],1.0);command=scale(horizontal,400.0)
  result=movement.predict(runtime.services,-1,start,aasRuntime.PRESENCE_NORMAL,true,[0.0,0.0,0.0],command,1,2,0.1,
    movement.SE_ENTERWATER|movement.SE_ENTERSLIME|movement.SE_ENTERLAVA|movement.SE_HITGROUNDDAMAGE|movement.SE_GAP,0,false)
  if result is error then return start end if
  if (result.stopevent&(movement.SE_ENTERSLIME|movement.SE_ENTERLAVA|movement.SE_HITGROUNDDAMAGE))!=0 then return start end if
  return copy(result.endpos)
end function

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

function AAS_RocketJumpZVelocity(runtime,origin) return AAS_WeaponJumpZVelocity(runtime,origin,120.0) end function
function AAS_BFGJumpZVelocity(runtime,origin) return AAS_WeaponJumpZVelocity(runtime,origin,120.0) end function

function AAS_Accelerate(velocity,frameTime,wishDirection,wishSpeed,acceleration)
  return movement.accelerate(velocity,frameTime,wishDirection,wishSpeed,acceleration)
end function
function AAS_AirControl(start,finish,velocity,commandMove)
  // The original routine only computes this local and has no observable side effect.
  direction=subtract(finish,start);return void
end function
function AAS_ApplyFriction(velocity,friction,stopSpeed,frameTime)
  return movement.applyFriction(velocity,friction,stopSpeed,frameTime)
end function
function AAS_ClipToBBox(start,finish,presenceType,mins,maxs)
  return movement.clipToBBox(start,finish,presenceType,mins,maxs)
end function
function AAS_ClientMovementPrediction(runtime,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,stopEvent,stopAreaNum,mins,maxs,visualize)
  return movement.predictWithBBox(runtime.services,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,stopEvent,stopAreaNum,mins,maxs,visualize)
end function
function AAS_PredictClientMovement(runtime,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,stopEvent,stopAreaNum,visualize)
  return movement.predict(runtime.services,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,stopEvent,stopAreaNum,visualize)
end function
function AAS_ClientMovementHitBBox(runtime,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,mins,maxs,visualize)
  return AAS_ClientMovementPrediction(runtime,entityNum,origin,presenceType,onGround,velocity,commandMove,commandFrames,maxFrames,frameTime,movement.SE_HITBOUNDINGBOX,0,mins,maxs,visualize)
end function
function AAS_TestMovementPrediction(runtime,entityNum,origin,direction)
  if runtime.debugClearFn!=void then runtime.debugClearFn(runtime.context) end if
  command=copy(direction);if not AAS_Swimming(runtime,origin) then command[2]=0.0 end if;command=scale(normalize(command),400.0);command[2]=224.0
  return AAS_PredictClientMovement(runtime,entityNum,origin,aasRuntime.PRESENCE_NORMAL,true,[0.0,0.0,0.0],command,13,13,0.1,movement.SE_HITGROUND,0,true)
end function
function AAS_HorizontalVelocityForJump(runtime,zVelocity,start,finish)
  gravity=runtime.settings.gravity;maximum=runtime.settings.maxVelocity
  maximumJump=n.fmul(n.fmul(0.5,gravity),n.fmul(n.fdiv(zVelocity,gravity),n.fdiv(zVelocity,gravity)))
  height=n.fsub(n.fadd(start[2],maximumJump),finish[2]);if height<0.0 then return [false,maximum] end if
  time=n.fsqrt(n.fdiv(height,n.fmul(0.5,gravity)));denominator=n.fadd(time,n.fdiv(zVelocity,gravity));if denominator==0.0 then return [false,maximum] end if
  direction=subtract(finish,start);speed=n.fdiv(n.fsqrt(n.fadd(n.fmul(direction[0],direction[0]),n.fmul(direction[1],direction[1]))),denominator)
  if speed>maximum then return [false,maximum] end if;return [true,speed]
end function
