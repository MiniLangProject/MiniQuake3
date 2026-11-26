// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Full AAS_ClientMovementPrediction port from code/botlib/be_aas_move.c.
package mq3.botlib.aas_client_movement

import mq3.compat.numeric as n
import mq3.botlib.aas_runtime as aasRuntime

/// An eye is never valid in a solid.
const CONTENTS_SOLID=1
/// Collision contents bit marking lava.
const CONTENTS_LAVA=8
/// Collision contents bit marking slime.
const CONTENTS_SLIME=16
/// Collision contents bit marking water.
const CONTENTS_WATER=32
/// AAS area-contents bit marking water.
const AREACONTENTS_WATER=1
/// AAS area-contents bit marking lava.
const AREACONTENTS_LAVA=2
/// AAS area-contents bit marking slime.
const AREACONTENTS_SLIME=4
/// AAS area-contents bit marking cluster portal.
const AREACONTENTS_CLUSTERPORTAL=8
/// AAS area-contents bit marking teleporter.
const AREACONTENTS_TELEPORTER=64
/// AAS area-contents bit marking jump pad.
const AREACONTENTS_JUMPPAD=128

/// Zero movement-prediction event mask, requesting no event-specific stop.
const SE_NONE=0
/// The ground is hit.
const SE_HITGROUND=1
/// There's no ground.
const SE_LEAVEGROUND=2
/// Water is entered.
const SE_ENTERWATER=4
/// Slime is entered.
const SE_ENTERSLIME=8
/// Lava is entered.
const SE_ENTERLAVA=16
/// The ground is hit with damage.
const SE_HITGROUNDDAMAGE=32
/// There's a gap.
const SE_GAP=64
/// Touching a jump pad area.
const SE_TOUCHJUMPPAD=128
/// Movement-prediction stop-event bit for touching a teleporter.
const SE_TOUCHTELEPORTER=256
/// The given stoparea is entered.
const SE_ENTERAREA=512
/// A ground face in the area is hit.
const SE_HITGROUNDAREA=1024
/// Touching a cluster portal.
const SE_TOUCHCLUSTERPORTAL=4096
/// Hit the specified bounding box.
const SE_HITBOUNDINGBOX=2048

/// `Settings` record for aas client movement, containing `friction`, `stopspeed`, `gravity`, `waterfriction` and `watergravity` and related fields.
struct Settings
  /// Ground-friction coefficient used by movement prediction.
  friction
  /// Minimum speed used when calculating ground-friction deceleration.
  stopspeed
  /// Gravity magnitude used when predicting movement.
  gravity
  /// Friction coefficient applied while the bot is swimming.
  waterfriction
  /// Gravity magnitude used while the bot is submerged.
  watergravity
  /// Maximum walking speed allowed by movement prediction.
  maxwalkvelocity
  /// Maximum crouched movement speed allowed by movement prediction.
  maxcrouchvelocity
  /// Maximum swimming speed allowed by movement prediction.
  maxswimvelocity
  /// Acceleration coefficient applied to grounded walking input.
  walkaccelerate
  /// Acceleration coefficient applied while the bot is airborne.
  airaccelerate
  /// Acceleration coefficient applied to swimming input.
  swimaccelerate
  /// Maximum obstacle height that can be crossed by stepping.
  maxstep
  /// Steepness threshold separating walkable ground from an impassable slope.
  maxsteepness
  /// Maximum obstacle height accepted by a barrier-jump prediction.
  maxbarrier
  /// Initial upward velocity applied when beginning a jump.
  jumpvel
end struct
/// `Trace` record for aas client movement, containing `startsolid`, `fraction`, `endpos`, `ent` and `lastarea` and related fields.
struct Trace
  /// True when the initial trace position lies inside solid geometry.
  startsolid
  /// Fraction of the requested trace segment completed before the first collision.
  fraction
  /// End position reached by the collision trace.
  endpos
  /// Entity blocking the trace.
  ent
  /// Last area the trace was in (zero if none).
  lastarea
  /// Area blocking the trace (zero if none).
  area
  /// Navigation plane identifier returned by the collision query used in movement prediction.
  planenum
  /// Collision-plane normal returned to the client movement predictor.
  normal
end struct
/// `AreaTrace` record for aas client movement, containing `areas` and `points`.
struct AreaTrace
  /// Area records or area assignments used by navigation and visibility queries.
  areas
  /// XYZ points defining the debug shape, polygon, or winding.
  points
end struct
/// `Movement` record for aas client movement, containing `success`, `endpos`, `endarea`, `velocity` and `trace` and related fields.
struct Movement
  /// True when movement prediction reached its requested stopping condition.
  success
  /// End position reached by the collision trace.
  endpos
  /// Area at end of movement prediction.
  endarea
  /// World-space linear velocity associated with the moving entity.
  velocity
  /// Collision trace result or active trace state for this operation.
  trace
  /// Presence-type mask describing the bot hull or stance allowed here.
  presencetype
  /// Event that made the prediction stop.
  stopevent
  /// Contents at the end of movement prediction.
  endcontents
  /// Total time simulated by this movement prediction.
  time
  /// Number of frames predicted ahead.
  frames
end struct
/// `Services` record for aas client movement, containing `context`, `traceFn`, `pointContentsFn`, `pointAreaFn` and `pointPresenceFn` and related fields.
struct Services
  /// Caller-supplied data associated with collision, contents, presence, and area queries during
  /// movement prediction.
  context
  /// Host callback that performs a collision sweep through the host world.
  traceFn
  /// Host callback that queries world contents at a supplied point.
  pointContentsFn
  /// Host callback that returns the AAS area containing a point.
  pointAreaFn
  /// Host callback that returns the presence types allowed at a position.
  pointPresenceFn
  /// Host callback that returns the contents flags for an AAS area.
  areaContentsFn
  /// Host callback that finds AAS areas crossed by a line segment.
  traceAreasFn
  /// Area or runtime settings controlling navigation behavior.
  settings
end struct

/// Create a `mq3.botlib.aas_client_movement.Settings` record, initializing `friction` as `6.0`, `stopspeed` as `100.0` and `gravity` as `800.0`.
function settings() return Settings(6.0,100.0,800.0,1.0,400.0,320.0,100.0,150.0,10.0,1.0,4.0,19.0,0.7,33.0,270.0) end function
/// Create a `mq3.botlib.aas_client_movement.Services` record, initializing `context` from `context` and `settings` as `settings()`.
/// @param context Context forwarded to the configured host callbacks.
function services(context) return Services(context,void,void,void,void,void,void,settings()) end function
/// Construct error `7540` with diagnostic text `"AAS client movement: "+message`.
/// @param message Message text supplied to the diagnostic or chat operation.
function fail(message) return error(7540,"AAS client movement: "+message) end function
/// Copy `v[0]`, `v[1]` and `v[2]` into a new ordered array for aas client movement.
/// @param v Three-component array; components 0, 1 and 2 are used in their stored order.
function copy(v) return [v[0],v[1],v[2]] end function
/// Create a `mq3.botlib.aas_client_movement.Trace` record, initializing `endpos` as `[0.0,0.0,0.0]` and `normal` as `[0.0,0.0,0.0]`.
function zeroTrace() return Trace(false,0.0,[0.0,0.0,0.0],0,0,0,0,[0.0,0.0,0.0]) end function
/// Return the result of `n.fadd(n.fadd(n.fmul(a[0],b[0]),n.fmul(a[1],b[1])),n.fmul(a[2],b[2]))` for `dot`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function dot(a,b) return n.fadd(n.fadd(n.fmul(a[0],b[0]),n.fmul(a[1],b[1])),n.fmul(a[2],b[2])) end function
/// Return a new array `[n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])]` for `add`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function add(a,b) return [n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])] end function
/// Return a new array `[n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])]` for `sub`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function sub(a,b) return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])] end function
/// Return a new array `[n.fmul(a[0],value),n.fmul(a[1],value),n.fmul(a[2],value)]` for `scale`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param value Value passed as argument 2 to `mq3.compat.numeric.fmul`.
function scale(a,value) return [n.fmul(a[0],value),n.fmul(a[1],value),n.fmul(a[2],value)] end function
/// Forward `ma` to `mq3.botlib.aas_client_movement.add` and return the delegated result.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param value Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function ma(a,value,b) return add(a,scale(b,value)) end function
/// Forward `length` to `mq3.compat.numeric.fsqrt` and return the delegated result.
/// @param v Three-component array; components 0, 1 and 2 are used in their stored order.
function length(v) return n.fsqrt(dot(v,v)) end function
/// Apply `mq3.botlib.aas_client_movement.length` and `mq3.botlib.aas_client_movement.scale` while evaluating `normalize`. Return paths include `[magnitude,scale(v,n.fdiv(1.0,magnitude))]`.
/// @param v Three-component array; components 0, 1 and 2 are used in their stored order.
function normalize(v)
  magnitude=length(v);if magnitude==0.0 then return [0.0,[0.0,0.0,0.0]] end if;return [magnitude,scale(v,n.fdiv(1.0,magnitude))]
end function
/// Use `s.traceFn` to perform `callTrace`. Return paths include `s.traceFn(s.context,start,finish,presence,passEntity)`.
/// @param s S record; accesses `traceFn` and `context`.
/// @param start Value passed as argument 2 to `s.traceFn`.
/// @param finish Value passed as argument 3 to `s.traceFn`.
/// @param presence Value passed as argument 4 to `s.traceFn`.
/// @param passEntity Value passed as argument 5 to `s.traceFn`.
function callTrace(s,start,finish,presence,passEntity) if s==void or s.traceFn==void then return fail("trace callback missing") end if;return s.traceFn(s.context,start,finish,presence,passEntity) end function
/// Use `s.pointContentsFn` to perform `pointContents`. Return paths include `s.pointContentsFn(s.context,point)`.
/// @param s S record; accesses `pointContentsFn` and `context`.
/// @param point Three-component point used by the geometric query.
function pointContents(s,point) if s.pointContentsFn==void then return 0 end if;return s.pointContentsFn(s.context,point) end function
/// Use `s.pointAreaFn` to perform `pointArea`. Return paths include `s.pointAreaFn(s.context,point)`.
/// @param s S record; accesses `pointAreaFn` and `context`.
/// @param point Three-component point used by the geometric query.
function pointArea(s,point) if s.pointAreaFn==void then return 0 end if;return s.pointAreaFn(s.context,point) end function
/// Use `s.pointPresenceFn` to perform `pointPresence`. Return paths include `s.pointPresenceFn(s.context,point)`.
/// @param s S record; accesses `pointPresenceFn` and `context`.
/// @param point Three-component point used by the geometric query.
function pointPresence(s,point) if s.pointPresenceFn==void then return 0 end if;return s.pointPresenceFn(s.context,point) end function
/// Use `s.areaContentsFn` to perform `callAreaContents`. Return paths include `s.areaContentsFn(s.context,area)`.
/// @param s S record; accesses `areaContentsFn` and `context`.
/// @param area Value passed as argument 2 to `s.areaContentsFn`.
function callAreaContents(s,area) if s.areaContentsFn==void then return 0 end if;return s.areaContentsFn(s.context,area) end function
/// Use `s.traceAreasFn` to perform `callTraceAreas`. Return paths include `s.traceAreasFn(s.context,start,finish,20)`.
/// @param s S record; accesses `traceAreasFn` and `context`.
/// @param start Value passed as argument 2 to `s.traceAreasFn`.
/// @param finish Value passed as argument 3 to `s.traceAreasFn`.
function callTraceAreas(s,start,finish) if s.traceAreasFn==void then return AreaTrace([],[]) end if;return s.traceAreasFn(s.context,start,finish,20) end function

/// Apply `mq3.botlib.aas_client_movement.copy` and `mq3.botlib.aas_client_movement.pointContents` while evaluating `swimming`. Return paths include `(pointContents(s,test)&(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))!=0`.
/// @param s S record; accesses `pointContentsFn` and `context`.
/// @param origin World-space position as three coordinates.
function swimming(s,origin)
  test=copy(origin);test[2]=n.fsub(test[2],2.0);return (pointContents(s,test)&(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))!=0
end function
/// Set `velocity[axis]` to `n.fadd(velocity[axis],n.fmul(amount,wishdir[axis]))` in `mq3.botlib.aas_client_movement.accelerate`. Return paths include `velocity`.
/// @param velocity Three-component movement velocity. Entries may be updated in place.
/// @param frametime Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param wishdir Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param wishspeed Value passed as argument 1 to `mq3.compat.numeric.fsub`.
/// @param acceleration Value passed as argument 1 to `mq3.compat.numeric.fmul`.
function accelerate(velocity,frametime,wishdir,wishspeed,acceleration)
  current=dot(velocity,wishdir);additional=n.fsub(wishspeed,current);if additional<=0.0 then return velocity end if
  amount=n.fmul(n.fmul(acceleration,frametime),wishspeed);if amount>additional then amount=additional end if
  for axis=0 to 2 velocity[axis]=n.fadd(velocity[axis],n.fmul(amount,wishdir[axis])) end for;return velocity
end function
/// Set `velocity[0]` to `n.fmul(velocity[0],ratio)` and `velocity[1]` to `n.fmul(velocity[1],ratio)` in `mq3.botlib.aas_client_movement.applyFriction`. Return paths include `velocity`.
/// @param velocity Three-component movement velocity. Entries may be updated in place.
/// @param friction Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param stopspeed Value used by `applyFriction` in `if control<stopspeed then control=stopspeed end if`.
/// @param frametime Value passed as argument 1 to `mq3.compat.numeric.fmul`.
function applyFriction(velocity,friction,stopspeed,frametime)
  speed=n.fsqrt(n.fadd(n.fmul(velocity[0],velocity[0]),n.fmul(velocity[1],velocity[1])));if speed==0.0 then return velocity end if
  control=speed;if control<stopspeed then control=stopspeed end if;newspeed=n.fsub(speed,n.fmul(n.fmul(frametime,control),friction));if newspeed<0.0 then newspeed=0.0 end if;ratio=n.fdiv(newspeed,speed)
  velocity[0]=n.fmul(velocity[0],ratio);velocity[1]=n.fmul(velocity[1],ratio);return velocity
end function
/// Apply `mq3.botlib.aas_client_movement.copy` and `mq3.botlib.aas_client_movement.callTrace` while evaluating `onGround`. Return paths include `trace.normal[2]>=maxSteepness`.
/// @param s S record; accesses `traceFn` and `context`.
/// @param origin World-space position as three coordinates.
/// @param presence Value passed as argument 4 to `s.traceFn`.
/// @param passEntity Value passed as argument 5 to `s.traceFn`.
/// @param maxSteepness Operand used to evaluate the returned expression `trace.normal[2]>=maxSteepness`.
function onGround(s,origin,presence,passEntity,maxSteepness)
  finish=copy(origin);finish[2]=n.fsub(finish[2],10.0);trace=callTrace(s,origin,finish,presence,passEntity);if trace is error or trace.startsolid or trace.fraction>=1.0 then return false end if
  if n.fsub(origin[2],trace.endpos[2])>10.0 then return false end if;return trace.normal[2]>=maxSteepness
end function
/// Build the `mq3.botlib.aas_client_movement.Trace` result for `clipToBBox`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param presence AAS presence type selecting the movement bounds.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
function clipToBBox(start,finish,presence,mins,maxs)
  if mins==void or maxs==void then return void end if;bounds=aasRuntime.presenceTypeBoundingBox(presence);if bounds is error then return void end if
  absmins=sub(mins,bounds[1]);absmaxs=sub(maxs,bounds[0]);direction=sub(finish,start)
  for axis=0 to 2 if start[axis]<absmins[axis] and finish[axis]<absmins[axis] or start[axis]>absmaxs[axis] and finish[axis]>absmaxs[axis] then return void end if end for
  for axis=0 to 2
    plane=absmaxs[axis];if direction[axis]>0.0 then plane=absmins[axis] end if
    front=n.fsub(start[axis],plane);back=n.fsub(finish[axis],plane);denominator=n.fsub(front,back);if denominator==0.0 then continue end if;fraction=n.fdiv(front,denominator)
    first=(axis+1)%3;second=(first+1)%3;firstValue=n.fadd(start[first],n.fmul(direction[first],fraction));secondValue=n.fadd(start[second],n.fmul(direction[second],fraction))
    if firstValue>absmins[first] and firstValue<absmaxs[first] and secondValue>absmins[second] and secondValue<absmaxs[second] then
      endpos=ma(start,fraction,direction);return Trace(false,fraction,endpos,0,0,0,0,[0.0,0.0,0.0])
    end if
  end for;return void
end function
/// Build the `mq3.botlib.aas_client_movement.Movement` result for `result`.
/// @param success Initial value stored in `mq3.botlib.aas_client_movement.Movement.success`.
/// @param origin World-space position as three coordinates.
/// @param velocity Three-component movement velocity.
/// @param frametime Value passed as argument 2 to `mq3.compat.numeric.fdiv`.
/// @param presence Initial value stored in `mq3.botlib.aas_client_movement.Movement.presencetype`.
/// @param event Player or entity event identifier.
/// @param contents Initial value stored in `mq3.botlib.aas_client_movement.Movement.endcontents`.
/// @param frames Initial value stored in `mq3.botlib.aas_client_movement.Movement.frames`.
/// @param trace Initial value stored in `mq3.botlib.aas_client_movement.Movement.trace`.
/// @param s S record; accesses `pointAreaFn` and `context`.
function result(success,origin,velocity,frametime,presence,event,contents,frames,trace,s)
  outputVelocity=copy(velocity);if frametime!=0.0 then outputVelocity=scale(velocity,n.fdiv(1.0,frametime)) end if
  return Movement(success,copy(origin),pointArea(s,origin),outputVelocity,trace,presence,event,contents,n.fmul(frames,frametime),frames)
end function
/// Apply `mq3.botlib.aas_client_movement.result` while evaluating `stopped`.
/// @param s S record; accesses `pointAreaFn` and `context`.
/// @param origin World-space position as three coordinates.
/// @param velocity Three-component movement velocity.
/// @param frametime Value passed as argument 2 to `mq3.compat.numeric.fdiv`.
/// @param presence Initial value stored in `mq3.botlib.aas_client_movement.Movement.presencetype`.
/// @param event Player or entity event identifier.
/// @param contents Initial value stored in `mq3.botlib.aas_client_movement.Movement.endcontents`.
/// @param frame Initial value stored in `mq3.botlib.aas_client_movement.Movement.frames`.
/// @param trace Initial value stored in `mq3.botlib.aas_client_movement.Movement.trace`.
/// @param area Value used by `stopped` in `if area>=0 then value.endarea=area end if`.
function stopped(s,origin,velocity,frametime,presence,event,contents,frame,trace,area)
  value=result(true,origin,velocity,frametime,presence,event,contents,frame,trace,s);if area>=0 then value.endarea=area end if;return value
end function

/// Build the `mq3.botlib.aas_client_movement.Movement` result for `predictWithBBox`. Return paths include `result(true,org,frameVelocity,frametime,presence,SE_NONE,0,frame,zeroTrace(),s)`.
/// @param s S record; accesses `settings`.
/// @param entnum Entity number in the game or AAS entity table.
/// @param origin World-space position as three coordinates.
/// @param presence Value passed as argument 4 to `s.traceFn`.
/// @param onground Value used by `predictWithBBox` in `if onground or inWater then friction=cfg.waterfriction`.
/// @param velocity Three-component movement velocity.
/// @param cmdmove Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param cmdframes Value used by `predictWithBBox` in `if frame<cmdframes then`.
/// @param maxframes Value used by `predictWithBBox` in `while frame<maxframes`.
/// @param frametime Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param stopevents Operand used to evaluate the returned expression `stopped(s,org,frameVelocity,frametime,presence,event&stopevents,contents,frame,zeroTrace(),area)`.
/// @param stoparea Value used by `stopped` in `if area>=0 then value.endarea=area end if`.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param visualize Not read by this implementation; retained in the `predictWithBBox` signature.
function predictWithBBox(s,entnum,origin,presence,onground,velocity,cmdmove,cmdframes,maxframes,frametime,stopevents,stoparea,mins,maxs,visualize)
  if s==void or origin==void or velocity==void or cmdmove==void or len(origin)!=3 or len(velocity)!=3 or len(cmdmove)!=3 then return fail("invalid prediction input") end if
  if frametime<=0.0 then frametime=0.1 end if;frametime=n.f32(frametime);cfg=s.settings;if cfg==void then cfg=settings() end if
  org=copy(origin);org[2]=n.fadd(org[2],0.25);frameVelocity=scale(velocity,frametime);jumpFrame=-1;lastTrace=zeroTrace();frame=0
  while frame<maxframes
    inWater=swimming(s,org);gravity=cfg.gravity;if inWater then gravity=cfg.watergravity end if
    frameVelocity[2]=n.fsub(frameVelocity[2],n.fmul(n.fmul(gravity,0.1),frametime))
    if onground or inWater then friction=cfg.waterfriction;if inWater then friction=cfg.friction end if;frameVelocity=scale(frameVelocity,n.fdiv(1.0,frametime));applyFriction(frameVelocity,friction,cfg.stopspeed,frametime);frameVelocity=scale(frameVelocity,frametime) end if
    crouch=false
    if frame<cmdframes then
      maxVelocity=cfg.maxwalkvelocity;acceleration=cfg.airaccelerate;wishdir=copy(cmdmove)
      if onground then
        if cmdmove[2]<-300.0 then crouch=true;maxVelocity=cfg.maxcrouchvelocity end if
        if not inWater and cmdmove[2]>1.0 then frameVelocity[2]=n.fadd(n.fsub(n.fmul(cfg.jumpvel,frametime),n.fmul(n.fmul(gravity,0.1),frametime)),5.0);jumpFrame=frame;acceleration=cfg.airaccelerate else acceleration=cfg.walkaccelerate end if
      end if
      if inWater then maxVelocity=cfg.maxswimvelocity;acceleration=cfg.swimaccelerate else wishdir[2]=0.0 end if
      normalized=normalize(wishdir);wishspeed=normalized[0];wishdir=normalized[1];if wishspeed>maxVelocity then wishspeed=maxVelocity end if
      frameVelocity=scale(frameVelocity,n.fdiv(1.0,frametime));accelerate(frameVelocity,frametime,wishdir,wishspeed,acceleration);frameVelocity=scale(frameVelocity,frametime)
    end if
    if crouch then presence=aasRuntime.PRESENCE_CROUCH else if presence==aasRuntime.PRESENCE_CROUCH and (pointPresence(s,org)&aasRuntime.PRESENCE_NORMAL)!=0 then presence=aasRuntime.PRESENCE_NORMAL end if
    lastorg=copy(org);leftVelocity=copy(frameVelocity);slides=0
    while true
      finish=add(org,leftVelocity);trace=callTrace(s,org,finish,presence,entnum);if trace is error then return trace end if;lastTrace=trace
      if (stopevents&(SE_ENTERAREA|SE_TOUCHJUMPPAD|SE_TOUCHTELEPORTER|SE_TOUCHCLUSTERPORTAL))!=0 then
        crossed=callTraceAreas(s,org,trace.endpos);if crossed is error then return crossed end if
        for index=0 to len(crossed.areas)-1 area=crossed.areas[index];event=0
          if (stopevents&SE_ENTERAREA)!=0 and area==stoparea then event=SE_ENTERAREA
          else if (stopevents&SE_TOUCHJUMPPAD)!=0 and frame!=0 and (callAreaContents(s,area)&AREACONTENTS_JUMPPAD)!=0 then event=SE_TOUCHJUMPPAD
          else if (stopevents&SE_TOUCHTELEPORTER)!=0 and (callAreaContents(s,area)&AREACONTENTS_TELEPORTER)!=0 then event=SE_TOUCHTELEPORTER
          else if (stopevents&SE_TOUCHCLUSTERPORTAL)!=0 and (callAreaContents(s,area)&AREACONTENTS_CLUSTERPORTAL)!=0 then event=SE_TOUCHCLUSTERPORTAL end if
          if event!=0 then return stopped(s,crossed.points[index],frameVelocity,frametime,presence,event,0,frame,trace,area) end if
        end for
      end if
      if (stopevents&SE_HITBOUNDINGBOX)!=0 then bboxTrace=clipToBBox(org,trace.endpos,presence,mins,maxs);if bboxTrace!=void then return stopped(s,bboxTrace.endpos,frameVelocity,frametime,presence,SE_HITBOUNDINGBOX,0,frame,bboxTrace,-1) end if end if
      org=copy(trace.endpos)
      if trace.fraction<1.0 then
        if (stopevents&SE_HITGROUNDAREA)!=0 and trace.normal[2]>cfg.maxsteepness then test=copy(org);test[2]=n.fadd(test[2],0.5);if pointArea(s,test)==stoparea then return stopped(s,test,frameVelocity,frametime,presence,SE_HITGROUNDAREA,0,frame,trace,stoparea) end if end if
        stepped=false
        if trace.normal[2]==0.0 and (jumpFrame<0 or frame-jumpFrame>2) then
          start=ma(org,-0.25,trace.normal);stepend=copy(start);start[2]=n.fadd(start[2],cfg.maxstep);steptrace=callTrace(s,start,stepend,presence,entnum);if steptrace is error then return steptrace end if
          if not steptrace.startsolid and steptrace.normal[2]>cfg.maxsteepness then leftVelocity=sub(finish,steptrace.endpos);leftVelocity[2]=0.0;frameVelocity[2]=0.0;org[2]=steptrace.endpos[2];stepped=true end if
        end if
        if not stepped then
          leftVelocity=ma(leftVelocity,0.0-dot(leftVelocity,trace.normal),trace.normal);oldVelocity=copy(frameVelocity);frameVelocity=ma(frameVelocity,0.0-dot(frameVelocity,trace.normal),trace.normal)
          landed=trace.normal[2]>cfg.maxsteepness;if landed then onground=true end if
          if (stopevents&SE_HITGROUNDDAMAGE)!=0 then delta=0.0;if oldVelocity[2]<0.0 and frameVelocity[2]>oldVelocity[2] and not onground then delta=oldVelocity[2] else if onground then delta=n.fsub(frameVelocity[2],oldVelocity[2]) end if
            if delta!=0.0 then delta=n.fmul(delta,10.0);delta=n.fmul(n.fmul(delta,delta),0.0001);if inWater then delta=0.0 end if;if delta>40.0 then value=stopped(s,org,frameVelocity,1.0,presence,SE_HITGROUNDDAMAGE,0,frame,trace,-1);value.time=n.fmul(frame,frametime);return value end if end if
          end if
        end if
      end if
      slides=slides+1;if slides>20 then return Movement(false,copy(org),0,[0.0,0.0,0.0],zeroTrace(),presence,0,0,0.0,0) end if
      if trace.fraction>=1.0 then break end if
    end while
    if frameVelocity[2]<=10.0 then
      feet=copy(org);feet[2]=n.fsub(feet[2],22.0);contents=pointContents(s,feet);event=0;if (contents&CONTENTS_LAVA)!=0 then event=event|SE_ENTERLAVA end if;if (contents&CONTENTS_SLIME)!=0 then event=event|SE_ENTERSLIME end if;if (contents&CONTENTS_WATER)!=0 then event=event|SE_ENTERWATER end if
      area=pointArea(s,org);areaFlags=callAreaContents(s,area);if (areaFlags&AREACONTENTS_LAVA)!=0 then event=event|SE_ENTERLAVA end if;if (areaFlags&AREACONTENTS_SLIME)!=0 then event=event|SE_ENTERSLIME end if;if (areaFlags&AREACONTENTS_WATER)!=0 then event=event|SE_ENTERWATER end if
      if (event&stopevents)!=0 then return stopped(s,org,frameVelocity,frametime,presence,event&stopevents,contents,frame,zeroTrace(),area) end if
    end if
    onground=onGround(s,org,presence,entnum,cfg.maxsteepness)
    if onground and (stopevents&SE_HITGROUND)!=0 then return stopped(s,org,frameVelocity,frametime,presence,SE_HITGROUND,0,frame,lastTrace,-1)
    else if not onground and (stopevents&SE_LEAVEGROUND)!=0 then return stopped(s,org,frameVelocity,frametime,presence,SE_LEAVEGROUND,0,frame,lastTrace,-1)
    else if not onground and (stopevents&SE_GAP)!=0 then
      finish=copy(org);finish[2]=n.fsub(finish[2],n.fadd(48.0,cfg.maxbarrier));gaptrace=callTrace(s,org,finish,aasRuntime.PRESENCE_CROUCH,-1);if gaptrace is error then return gaptrace end if
      if not gaptrace.startsolid and gaptrace.endpos[2]<n.fsub(n.fsub(org[2],cfg.maxstep),1.0) and (pointContents(s,finish)&CONTENTS_WATER)==0 then return stopped(s,lastorg,frameVelocity,frametime,presence,SE_GAP,0,frame,lastTrace,-1) end if
    end if
    frame=frame+1
  end while
  return result(true,org,frameVelocity,frametime,presence,SE_NONE,0,frame,zeroTrace(),s)
end function

/// Forward `predict` to `mq3.botlib.aas_client_movement.predictWithBBox` and return the delegated result.
/// @param s S record; accesses `settings`.
/// @param entnum Entity number in the game or AAS entity table.
/// @param origin World-space position as three coordinates.
/// @param presence Value passed as argument 4 to `s.traceFn`.
/// @param onground Value used by `predictWithBBox` in `if onground or inWater then friction=cfg.waterfriction`.
/// @param velocity Three-component movement velocity.
/// @param cmdmove Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param cmdframes Value used by `predictWithBBox` in `if frame<cmdframes then`.
/// @param maxframes Value used by `predictWithBBox` in `while frame<maxframes`.
/// @param frametime Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param stopevents Operand used to evaluate the returned expression `stopped(s,org,frameVelocity,frametime,presence,event&stopevents,contents,frame,zeroTrace(),area)`.
/// @param stoparea Value used by `stopped` in `if area>=0 then value.endarea=area end if`.
/// @param visualize Value passed as argument 15 to `mq3.botlib.aas_client_movement.predictWithBBox`.
function predict(s,entnum,origin,presence,onground,velocity,cmdmove,cmdframes,maxframes,frametime,stopevents,stoparea,visualize)
  return predictWithBBox(s,entnum,origin,presence,onground,velocity,cmdmove,cmdframes,maxframes,frametime,stopevents,stoparea,void,void,visualize)
end function
