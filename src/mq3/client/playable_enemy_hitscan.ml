// SPDX-License-Identifier: GPL-2.0-or-later
// BSP-shielded Machinegun shots for hostile preview players.
package mq3.client.playable_enemy_hitscan

import mq3.collision.world as collision
import mq3.compat.numeric as numeric

const SHOT_MASK=0x6000001

struct Shot attacker start endPoint normal worldHit playerHit damage side at end struct

function fail(message) return error(7630,"preview enemy hitscan: "+message) end function
function validPoint(value) return value!=void and typeof(value)=="array" and len(value)==3 end function
function point(value) return [numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])] end function

function worldPointTrace(context,startPoint,endPoint)
  return collision.boxTrace(context,startPoint,endPoint,[0.0,0.0,0.0],[0.0,0.0,0.0],0,SHOT_MASK,false)
end function

// The AI has already selected its target. This final muzzle-to-player trace is
// repeated after movement so a wall still wins before instantaneous damage.
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

function fire(world,ai,targetState,playerPosition,muzzleOrigins,now)
  if world==void then return fail("collision world is required") end if
  return fireWithTrace(worldPointTrace,world,ai,targetState,playerPosition,muzzleOrigins,now)
end function
