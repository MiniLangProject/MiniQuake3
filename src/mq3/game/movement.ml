// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Shared movement kernels from bg_pmove.c and bg_slidemove.c.
// The full playerState/Pmove cycle in pmove.ml reuses this kernel context.
package mq3.game.movement
import mq3.compat.numeric as n
import mq3.shared.math as q
import mq3.game.game_internal_headers as internal

/// `Collision` record for movement, containing `trace`, `endpos` and `entityNum`.
struct Collision
  /// Collision trace result or callback used by the movement calculation.
  trace
  /// Final position reached by the collision trace.
  endpos
  /// Entity number returned by or associated with this operation.
  entityNum
end struct
/// `Movement` record for movement, containing `origin`, `velocity`, `mins`, `maxs` and `clientNum` and related fields.
struct Movement
  /// Working player position updated by collision-aware movement integration.
  origin
  /// Velocity vector used to advance movement or predict a position.
  velocity
  /// Lower player collision-box corner relative to the working movement origin.
  mins
  /// Upper player collision-box corner relative to the working movement origin.
  maxs
  /// Client slot number represented by this player state.
  clientNum
  /// Mask selecting the collision or filter categories used by the operation.
  mask
  /// Downward acceleration used by the player or entity movement simulation.
  gravity
  /// Remaining movement timer supplied to the bot or movement adapter.
  pmTime
  /// Player movement flags supplied to the bot or movement adapter.
  pmFlags
  /// Player movement mode supplied to the bot or movement adapter.
  pmType
  /// Movement or travel speed used by this game object.
  speed
  /// Nonzero while the flight powerup changes player movement behavior.
  flight
  /// Depth classification of the player immersion in liquid.
  waterlevel
  /// Duration of the current movement or simulation step.
  frametime
  /// Nonzero when the movement controller established walkable ground contact.
  walking
  /// Nonzero when a usable ground plane has been detected.
  groundPlane
  /// Surface normal of the detected supporting ground.
  groundNormal
  /// Flags associated with the supporting surface or ground contact.
  groundFlags
  /// Speed projected onto a collision normal for impact handling.
  impactSpeed
  /// Entity contacts collected during the movement step.
  touches
  /// Event identifiers retained by this player or game-state record.
  events
  /// Parameters paired with the predictable event identifiers.
  eventParms
  /// Sequence number used to distinguish new predictable player events.
  eventSequence
  /// Injected callback for trace; invoked through the Movement service/state record.
  traceFn
  /// Opaque caller-supplied context available to the movement collision-trace callback.
  context
end struct

/// Create a `mq3.game.movement.Movement` record, initializing `origin` as `[0.0,0.0,0.0]`, `velocity` as `[0.0,0.0,0.0]` and `mins` as `[-15.0,-15.0,-24.0]`.
/// @param traceFn Initial value stored in `mq3.game.movement.Movement.traceFn`.
/// @param context Context forwarded to the configured host callbacks.
function create(traceFn, context)
  return Movement([0.0,0.0,0.0],[0.0,0.0,0.0],[-15.0,-15.0,-24.0],[15.0,15.0,32.0],0,0x2010001,800,0,0,0,320,false,0,0.0,false,false,[0.0,0.0,1.0],0,0.0,[],[0,0],[0,0],0,traceFn,context)
end function

/// Copy the three components of a movement vector into an independent array.
/// @param v Three-component array; components 0, 1 and 2 are used in their stored order.
function copy(v)
  return [v[0],v[1],v[2]]
end function

/// Set `state.touches` to `state.touches+[entity]` in `mq3.game.movement.addTouchEnt`.
/// @param state Movement state; accesses `touches`. May update `state.touches` in place.
/// @param entity Value used by `addTouchEnt` in `if entity == 1022 or len(state.touches) == 32 then return void end if`.
function addTouchEnt(state, entity)
  if entity == 1022 or len(state.touches) == 32 then return void end if
  for each previous in state.touches
    if previous == entity then return void end if
  end for
  state.touches = state.touches+[entity]
  return void
end function

/// Update `state.events[slot]`, `state.eventParms[slot]` and `state.eventSequence` during `addEvent`.
/// @param state Movement state; accesses `eventSequence`, `events` and `eventParms`. May update `state.events[slot]`, `state.eventParms[slot]` and `state.eventSequence` in place.
/// @param event Player or entity event identifier.
function addEvent(state, event)
  slot = state.eventSequence & 1
  state.events[slot] = event
  state.eventParms[slot] = 0
  state.eventSequence = n.add32(state.eventSequence,1)
  return void
end function

/// Project velocity along a collision plane using the supplied overbounce factor.
/// @param velocity Three-component movement velocity.
/// @param normal Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param overbounce Value passed as argument 2 to `mq3.compat.numeric.fmul`.
function clipVelocity(velocity, normal, overbounce)
  backoff = q.DotProduct(velocity,normal)
  if backoff < 0 then backoff = n.fmul(backoff,overbounce) else backoff = n.fdiv(backoff,overbounce) end if
  return [n.fsub(velocity[0],n.fmul(normal[0],backoff)),n.fsub(velocity[1],n.fmul(normal[1],backoff)),n.fsub(velocity[2],n.fmul(normal[2],backoff))]
end function

/// Apply ground or water friction to the movement velocity while preserving the movement-state representation.
/// @param state Movement state; accesses `velocity`, `walking`, `waterlevel`, `groundFlags` and `pmFlags` and related fields. May update `state.velocity[0]`, `state.velocity[1]` and `state.velocity` in place.
function friction(state)
  vec = copy(state.velocity)
  if state.walking then vec[2] = 0.0 end if
  speed = q.VectorLength(vec)
  if speed < 1 then
    state.velocity[0] = 0.0; state.velocity[1] = 0.0
    return void
  end if
  drop = n.f32(0)
  if state.waterlevel <= 1 and state.walking and (state.groundFlags & 2) == 0 and (state.pmFlags & 64) == 0 then
    control = speed
    if speed < 100.0 then control = n.f32(100) end if
    drop = n.fadd(drop,n.fmul(n.fmul(control,6.0),state.frametime))
  end if
  if state.waterlevel != 0 then
    drop = n.fadd(drop,n.fmul(n.fmul(n.fmul(speed,1.0),state.waterlevel),state.frametime))
  end if
  if state.flight then drop = n.fadd(drop,n.fmul(n.fmul(speed,3.0),state.frametime)) end if
  if state.pmType == 2 then drop = n.fadd(drop,n.fmul(n.fmul(speed,5.0),state.frametime)) end if
  newspeed = n.fsub(speed,drop)
  if newspeed < 0 then newspeed = n.f32(0) end if
  newspeed = n.fdiv(newspeed,speed)
  state.velocity = q.VectorScale(state.velocity,newspeed)
  return void
end function

/// Accelerate toward the requested movement direction, limiting the added speed to the remaining target speed.
/// @param state Movement state; accesses `velocity` and `frametime`. May update `state.velocity` in place.
/// @param wishdir Value passed as argument 2 to `mq3.shared.math.DotProduct`.
/// @param wishspeed Value passed as argument 1 to `mq3.compat.numeric.fsub`.
/// @param accel Value passed as argument 1 to `mq3.compat.numeric.fmul`.
function accelerate(state, wishdir, wishspeed, accel)
  currentspeed = q.DotProduct(state.velocity,wishdir)
  addspeed = n.fsub(wishspeed,currentspeed)
  if addspeed <= 0 then return void end if
  accelspeed = n.fmul(n.fmul(accel,state.frametime),wishspeed)
  if accelspeed > addspeed then accelspeed = addspeed end if
  state.velocity = q.VectorMA(state.velocity,accelspeed,wishdir)
  return void
end function

/// Normalize signed movement command axes to preserve the player speed limit during diagonal movement.
/// @param state Movement state; accesses `speed`.
/// @param forward Value used by `cmdScale` in `for each input in [forward,right,up]`.
/// @param right Value used by `cmdScale` in `for each input in [forward,right,up]`.
/// @param up Value used by `cmdScale` in `for each input in [forward,right,up]`.
function cmdScale(state, forward, right, up)
  largest = 0
  total = 0
  for each input in [forward,right,up]
    value = n.i8(input)
    total = total+value*value
    if value < 0 then value = -value end if
    if value > largest then largest = value end if
  end for
  if largest == 0 then return n.f32(0) end if
  length = n.fsqrt(total)
  // The denominator contains the double literal 127.0 in the original.
  return n.f32(n.fmul(state.speed,largest)/(127.0*length))
end function

/// Update `state.velocity[2]`, `state.velocity`, `state.origin` and `state.velocity[axis]` and related state during `slideMove`. Return paths include `bumpcount != 0`.
/// @param state Movement state; accesses `velocity`, `gravity`, `frametime`, `groundPlane` and `groundNormal` and related fields. May update `state.velocity[2]`, `state.velocity` and `state.origin` and additional fields in place.
/// @param gravity Value used by `slideMove` in `if gravity then`.
function slideMove(state, gravity)
  primalVelocity = copy(state.velocity)
  // C leaves this unused result uninitialized without gravity. Zeroing it
  // avoids undefined data in the port; it cannot change the returned motion.
  endVelocity = [0.0,0.0,0.0]
  overclip = n.f32(internal.OVERCLIP)
  if gravity then
    endVelocity = copy(state.velocity)
    endVelocity[2] = n.fsub(endVelocity[2],n.fmul(state.gravity,state.frametime))
    state.velocity[2] = n.fmul(n.fadd(state.velocity[2],endVelocity[2]),0.5)
    primalVelocity[2] = endVelocity[2]
    if state.groundPlane then state.velocity = clipVelocity(state.velocity,state.groundNormal,overclip) end if
  end if
  timeLeft = state.frametime
  planes = []
  if state.groundPlane then planes = planes+[copy(state.groundNormal)] end if
  planes = planes+[q.VectorNormalize2(state.velocity)]
  bumpcount = 0
  while bumpcount < 4
    finish = q.VectorMA(state.origin,timeLeft,state.velocity)
    hit = state.traceFn(state,state.origin,finish)
    trace = hit.trace
    if trace.allsolid then state.velocity[2] = 0.0; return true end if
    if trace.fraction > 0 then state.origin = copy(hit.endpos) end if
    if trace.fraction == 1 then break end if
    addTouchEnt(state,hit.entityNum)
    timeLeft = n.fsub(timeLeft,n.fmul(timeLeft,trace.fraction))
    if len(planes) >= 5 then state.velocity = [0.0,0.0,0.0]; return true end if
    repeated = false
    for each plane in planes
      if q.DotProduct(trace.normal,plane) > 0.99 then
        for axis = 0 to 2
          state.velocity[axis] = n.fadd(trace.normal[axis],state.velocity[axis])
        end for
        repeated = true
        break
      end if
    end for
    if repeated then bumpcount = bumpcount+1; continue end if
    planes = planes+[copy(trace.normal)]
    i = 0
    while i < len(planes)
      into = q.DotProduct(state.velocity,planes[i])
      if into >= 0.1 then i = i+1; continue end if
      if -into > state.impactSpeed then state.impactSpeed = -into end if
      clipped = clipVelocity(state.velocity,planes[i],overclip)
      endClipped = clipVelocity(endVelocity,planes[i],overclip)
      j = 0
      while j < len(planes)
        if j == i or q.DotProduct(clipped,planes[j]) >= 0.1 then j = j+1; continue end if
        clipped = clipVelocity(clipped,planes[j],overclip)
        endClipped = clipVelocity(endClipped,planes[j],overclip)
        if q.DotProduct(clipped,planes[i]) >= 0 then j = j+1; continue end if
        direction = q.CrossProduct(planes[i],planes[j])
        q.VectorNormalize(direction)
        clipped = q.VectorScale(direction,q.DotProduct(direction,state.velocity))
        direction = q.CrossProduct(planes[i],planes[j])
        q.VectorNormalize(direction)
        endClipped = q.VectorScale(direction,q.DotProduct(direction,endVelocity))
        k = 0
        while k < len(planes)
          if k != i and k != j and q.DotProduct(clipped,planes[k]) < 0.1 then
            state.velocity = [0.0,0.0,0.0]
            return true
          end if
          k = k+1
        end while
        j = j+1
      end while
      state.velocity = copy(clipped)
      endVelocity = copy(endClipped)
      break
    end while
    bumpcount = bumpcount+1
  end while
  if gravity then state.velocity = copy(endVelocity) end if
  if state.pmTime != 0 then state.velocity = copy(primalVelocity) end if
  return bumpcount != 0
end function

/// Update `state.origin` and `state.velocity` during `stepSlideMove`.
/// @param state Movement state; accesses `origin`, `velocity` and `traceFn`. May update `state.origin` and `state.velocity` in place.
/// @param gravity Value used by `slideMove` in `if gravity then`.
function stepSlideMove(state, gravity)
  startOrigin = copy(state.origin)
  startVelocity = copy(state.velocity)
  if not slideMove(state,gravity) then return void end if
  down = copy(startOrigin)
  down[2] = n.fsub(down[2],internal.STEPSIZE)
  hit = state.traceFn(state,startOrigin,down)
  if state.velocity[2] > 0 and (hit.trace.fraction == 1 or q.DotProduct(hit.trace.normal,[0.0,0.0,1.0]) < internal.MIN_WALK_NORMAL) then return void end if
  up = copy(startOrigin)
  up[2] = n.fadd(up[2],internal.STEPSIZE)
  hit = state.traceFn(state,startOrigin,up)
  if hit.trace.allsolid then return void end if
  stepSize = n.fsub(hit.endpos[2],startOrigin[2])
  state.origin = copy(hit.endpos)
  state.velocity = copy(startVelocity)
  slideMove(state,gravity)
  down = copy(state.origin)
  down[2] = n.fsub(down[2],stepSize)
  hit = state.traceFn(state,state.origin,down)
  if not hit.trace.allsolid then state.origin = copy(hit.endpos) end if
  if hit.trace.fraction < 1 then state.velocity = clipVelocity(state.velocity,hit.trace.normal,n.f32(internal.OVERCLIP)) end if
  delta = n.fsub(state.origin[2],startOrigin[2])
  if delta > 2 then
    if delta < 7 then
      addEvent(state,6)
    else if delta < 11 then
      addEvent(state,7)
    else if delta < 15 then
      addEvent(state,8)
    else
      addEvent(state,9)
    end if
  end if
  return void
end function
