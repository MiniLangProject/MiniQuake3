// SPDX-License-Identifier: GPL-2.0-or-later
// BSP-shielded Machinegun shots for hostile preview players.
package mq3.client.playable_enemy_hitscan

import mq3.collision.world as collision
import mq3.compat.numeric as numeric

/// Combined collision-content mask used when tracing a weapon shot.
const SHOT_MASK=0x6000001

/// Stores playable enemy hitscan shot record, including `attacker`, `start`, `endPoint`, `normal`, `worldHit`, `playerHit` and additional values.
struct Shot
  /// When constructing this record, `fireWithTrace` supplies `event.attacker` for this member.
  attacker
  /// When constructing this record, `fireWithTrace` supplies `point(muzzle)` for this member.
  start
  /// World-space endpoint of the trace, beam, or projectile presentation segment.
  endPoint
  /// Surface normal returned when an enemy's hitscan trace strikes the world.
  normal
  /// When constructing this record, `fireWithTrace` supplies `worldHit` for this member.
  worldHit
  /// When constructing this record, `fireWithTrace` supplies `not worldHit` for this member.
  playerHit
  /// Damage amount applied or reported by the weapon, projectile, or hit result.
  damage
  /// When constructing this record, `fireWithTrace` supplies `event.side` for this member.
  side
  /// When constructing this record, `fireWithTrace` supplies `now` for this member.
  at
end struct

/// Creates the playable enemy hitscan error `7630` with diagnostic text `"preview enemy hitscan: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview enemy hitscan: "+message`.
function fail(message) return error(7630,"preview enemy hitscan: "+message) end function
/// Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable enemy hitscan `validPoint`.
/// @param value Sequence whose length/content is inspected by `validPoint`.
function validPoint(value) return value!=void and typeof(value)=="array" and len(value)==3 end function
/// Copies three vector components with float32 rounding for playable enemy hitscan.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function point(value) return [numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])] end function

/// Adapts `mq3.collision.world.boxTrace` to playable enemy hitscan `worldPointTrace`, returning its result for `context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SHOT_MASK, false`.
/// @param context Argument 1 of `mq3.collision.world.boxTrace`.
/// @param startPoint Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
/// @param endPoint Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`.
function worldPointTrace(context,startPoint,endPoint)
  return collision.boxTrace(context,startPoint,endPoint,[0.0,0.0,0.0],[0.0,0.0,0.0],0,SHOT_MASK,false)
end function

// The AI has already selected its target. This final muzzle-to-player trace is
// repeated after movement so a wall still wins before instantaneous damage.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment.
/// @param context context record passed to the playable enemy hitscan helper calls.
/// @param ai Record read through `ai.events`.
/// @param targetState Record read through `targetState.targets`.
/// @param playerPosition Value used by `if traceFn==void or ai==void or targetState==void or not validPoint(playerPosition) then return fail("trace, AI, targets and player position a...`.
/// @param muzzleOrigins Sequence read at `muzzleOrigins[event.attacker]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function fireWithTrace(traceFn,context,ai,targetState,playerPosition,muzzleOrigins,now)
  if traceFn==void or ai==void or targetState==void or not validPoint(playerPosition) then return fail("trace, AI, targets and player position are required") end if
  if muzzleOrigins!=void and len(muzzleOrigins)!=len(targetState.targets) then return fail("muzzle and target counts differ") end if
  if now<0 then return fail("time cannot be negative") end if
  result=[]
  for each event in ai.events
    if event.attacker<0 or event.attacker>=len(targetState.targets) then return fail("attacker is outside targets") end if
    if event.damage<=0 then return fail("damage must be positive") end if
    target=targetState.targets[event.attacker]
    if target.alive then
      muzzle=[target.origin[0],target.origin[1],target.origin[2]+20.0]
      if muzzleOrigins!=void and muzzleOrigins[event.attacker]!=void then
        if not validPoint(muzzleOrigins[event.attacker]) then return fail("muzzle is invalid") end if
        muzzle=muzzleOrigins[event.attacker]
      end if
      traced=traceFn(context,muzzle,playerPosition);if traced is error then return traced end if
      worldHit=traced.trace.fraction<0.9999;normal=[0.0,0.0,0.0]
      if worldHit then normal=point(traced.trace.normal) end if
      result=result+[Shot(event.attacker,point(muzzle),point(traced.endpos),normal,worldHit,not worldHit,event.damage,event.side,now)]
    end if
  end for
  return result
end function

/// Calls `mq3.client.playable_enemy_hitscan.fireWithTrace` from playable enemy hitscan `fire`. The final path returns `fireWithTrace(worldPointTrace,world,ai,targetState,playerPosition,muzzleOrigins,now)`.
/// @param world world record passed to the playable enemy hitscan helper calls.
/// @param ai Value used by `return fireWithTrace(worldPointTrace,world,ai,targetState,playerPosition,muzzleOrigins,now)`.
/// @param targetState targetState record passed to the playable enemy hitscan helper calls.
/// @param playerPosition Value used by `return fireWithTrace(worldPointTrace,world,ai,targetState,playerPosition,muzzleOrigins,now)`.
/// @param muzzleOrigins Value used by `return fireWithTrace(worldPointTrace,world,ai,targetState,playerPosition,muzzleOrigins,now)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function fire(world,ai,targetState,playerPosition,muzzleOrigins,now)
  if world==void then return fail("collision world is required") end if
  return fireWithTrace(worldPointTrace,world,ai,targetState,playerPosition,muzzleOrigins,now)
end function
