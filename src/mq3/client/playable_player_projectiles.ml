// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic player-fired missiles for the standalone playable preview.
package mq3.client.playable_player_projectiles

import mq3.collision.world as collision
import mq3.client.playable_targets as projectileTargets
import mq3.client.playable_projectile_view as view
import mq3.shared.math as qmath
import mq3.compat.numeric as numeric

const SHOT_MASK=0x6000001
const GRAVITY=800.0
const EF_BOUNCE_HALF=0x10
const BOUNCE_SCALE=0.65
const MAX_BOUNCES_PER_FRAME=8
const ROCKET="weapon_rocketlauncher"
const PLASMA="weapon_plasmagun"
const GRENADE="weapon_grenadelauncher"
const BFG="weapon_bfg"

struct Profile classname style speed lifetime directDamage splashDamage splashRadius gravity eFlags end struct
struct Projectile id profile origin velocity spawnedAt expiresAt stopped end struct
struct Trail projectileId style start endPoint fromTime toTime end struct
struct Damage targetIndex amount direct killed awardedScore end struct
struct Impact id projectileId classname style kind point normal targetIndex damages at end struct
struct State projectiles trails impacts nextProjectileId nextImpactId lastTime end struct

function fail(message) return error(7590,"player projectiles: "+message) end function
function validPoint(value) return value!=void and typeof(value)=="array" and len(value)==3 end function
function copyPoint(value) return [numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])] end function

// Values mirror baseq3's fire_rocket, fire_plasma and fire_grenade.
function profile(classname)
  if classname==ROCKET then return Profile(classname,view.STYLE_ROCKET,900.0,15000,100,100,120.0,false,0) end if
  if classname==PLASMA then return Profile(classname,view.STYLE_PLASMA,2000.0,10000,20,15,20.0,false,0) end if
  if classname==GRENADE then return Profile(classname,view.STYLE_GRENADE,700.0,2500,100,100,150.0,true,EF_BOUNCE_HALF) end if
  if classname==BFG then return Profile(classname,view.STYLE_BFG,2000.0,10000,100,100,120.0,false,0) end if
  return fail("unsupported weapon "+classname)
end function

function create(now)
  if now<0 then return fail("initial time cannot be negative") end if
  return State([],[],[],0,0,now)
end function

function spawnProfile(state,weaponProfile,muzzle,direction,now)
  if state==void or weaponProfile==void or not validPoint(muzzle) or not validPoint(direction) then return fail("state, profile, muzzle and direction are required") end if
  if now<state.lastTime then return fail("spawn time moved backwards") end if
  aim=copyPoint(direction)
  if qmath.VectorNormalize(aim)==0.0 then return fail("shot direction cannot be zero") end if
  velocity=[numeric.fmul(aim[0],weaponProfile.speed),numeric.fmul(aim[1],weaponProfile.speed),numeric.fmul(aim[2],weaponProfile.speed)]
  shot=Projectile(state.nextProjectileId,weaponProfile,copyPoint(muzzle),velocity,now,now+weaponProfile.lifetime,false)
  state.nextProjectileId=state.nextProjectileId+1;state.projectiles=state.projectiles+[shot]
  return shot
end function

function spawn(state,classname,muzzle,direction,now)
  weaponProfile=profile(classname);if weaponProfile is error then return weaponProfile end if
  return spawnProfile(state,weaponProfile,muzzle,direction,now)
end function

function worldPointTrace(context,startPoint,endPoint)
  return collision.boxTrace(context,startPoint,endPoint,[0.0,0.0,0.0],[0.0,0.0,0.0],0,SHOT_MASK,false)
end function

function pointOnSegment(startPoint,endPoint,fraction)
  return [startPoint[0]+(endPoint[0]-startPoint[0])*fraction,startPoint[1]+(endPoint[1]-startPoint[1])*fraction,startPoint[2]+(endPoint[2]-startPoint[2])*fraction]
end function

function targetFraction(targetState,startPoint,endPoint)
  best=-1;fraction=2.0
  if len(targetState.targets)>0 then
    for index=0 to len(targetState.targets)-1
      target=targetState.targets[index]
      if target.alive then
        candidate=projectileTargets.segmentFraction(startPoint,endPoint,target,targetState.radius,targetState.minZ,targetState.maxZ)
        if candidate>=0.0 and candidate<fraction then best=index;fraction=candidate end if
      end if
    end for
  end if
  return [best,fraction]
end function

function applyDamage(targetState,index,requested,direct,now)
  target=targetState.targets[index];amount=requested;if amount>target.health then amount=target.health end if
  target.health=target.health-amount;killed=false;awarded=0
  if target.health<=0 then
    target.health=0;target.alive=false;target.respawnAt=now+targetState.respawnMilliseconds
    killed=true;awarded=target.score;targetState.score=targetState.score+awarded
  end if
  return Damage(index,amount,direct,killed,awarded)
end function

// Quake 3 measures splash distance from the nearest point of the target box.
function distanceToBounds(targetState,target,point)
  square=0.0
  for axis=0 to 2
    low=target.origin[axis]-targetState.radius;high=target.origin[axis]+targetState.radius
    if axis==2 then low=target.origin[2]+targetState.minZ;high=target.origin[2]+targetState.maxZ end if
    delta=0.0
    if point[axis]<low then delta=low-point[axis]
    else if point[axis]>high then delta=point[axis]-high
    end if
    square=square+delta*delta
  end for
  return numeric.fsqrt(square)
end function

function damageAtImpact(targetState,shot,point,directTarget,now)
  result=[]
  if directTarget>=0 and targetState.targets[directTarget].alive then result=result+[applyDamage(targetState,directTarget,shot.profile.directDamage,true,now)] end if
  if len(targetState.targets)>0 then
    for index=0 to len(targetState.targets)-1
      target=targetState.targets[index]
      // Baseq3 excludes the entity that already received direct damage.
      if index!=directTarget and target.alive then
        distance=distanceToBounds(targetState,target,point)
        if distance<shot.profile.splashRadius then
          amount=numeric.trunc32(shot.profile.splashDamage*(1.0-distance/shot.profile.splashRadius))
          if amount>0 then result=result+[applyDamage(targetState,index,amount,false,now)] end if
        end if
      end if
    end for
  end if
  return result
end function

function addImpact(state,shot,kind,point,normal,targetIndex,targetState,now)
  damages=damageAtImpact(targetState,shot,point,targetIndex,now)
  impact=Impact(state.nextImpactId,shot.id,shot.profile.classname,shot.profile.style,kind,copyPoint(point),copyPoint(normal),targetIndex,damages,now)
  state.nextImpactId=state.nextImpactId+1;state.impacts=state.impacts+[impact]
  return impact
end function

function stepEndpoint(shot,milliseconds)
  seconds=milliseconds/1000.0
  z=shot.origin[2]+shot.velocity[2]*seconds
  if shot.profile.gravity then z=z-0.5*GRAVITY*seconds*seconds end if
  return [shot.origin[0]+shot.velocity[0]*seconds,shot.origin[1]+shot.velocity[1]*seconds,z]
end function

function velocityAfter(shot,milliseconds)
  result=copyPoint(shot.velocity)
  if shot.profile.gravity then result[2]=result[2]-GRAVITY*(milliseconds/1000.0) end if
  return result
end function

// Mirrors G_BounceMissile for grenades carrying EF_BOUNCE_HALF: reflect the
// trajectory delta around the collision plane, then retain 65 percent speed.
function bounceHalf(shot,point,normal,impactVelocity)
  dot=impactVelocity[0]*normal[0]+impactVelocity[1]*normal[1]+impactVelocity[2]*normal[2]
  for axis=0 to 2 shot.velocity[axis]=(impactVelocity[axis]-2.0*dot*normal[axis])*BOUNCE_SCALE end for
  shot.origin=[point[0]+normal[0],point[1]+normal[1],point[2]+normal[2]]
  if normal[2]>0.2 and shot.velocity[2]<40.0 then
    shot.origin=copyPoint(point);shot.velocity=[0.0,0.0,0.0];shot.stopped=true
  end if
  return shot.stopped
end function

// traceFn(context,start,end) returns the normal baseq3 trace wrapper. A BSP hit
// wins ties so walls shield targets. Every removed projectile emits one impact.
function updateWithTrace(traceFn,context,state,targetState,now)
  if traceFn==void or state==void or targetState==void then return fail("trace, state and targets are required") end if
  if now<state.lastTime then return fail("update time moved backwards") end if
  state.trails=[];state.impacts=[];survivors=[]
  for each shot in state.projectiles
    kind="";targetIndex=-1
    fromTime=state.lastTime;if shot.spawnedAt>fromTime then fromTime=shot.spawnedAt end if
    toTime=now;if toTime>shot.expiresAt then toTime=shot.expiresAt end if
    remaining=toTime-fromTime;cursorTime=fromTime;bounces=0
    while remaining>0 and kind=="" and not shot.stopped and bounces<MAX_BOUNCES_PER_FRAME
      startPoint=copyPoint(shot.origin);endPoint=stepEndpoint(shot,remaining)
      traced=traceFn(context,startPoint,endPoint);if traced is error then return traced end if
      worldFraction=traced.trace.fraction;targetHit=targetFraction(targetState,startPoint,endPoint);fraction=1.0;segmentKind="";targetIndex=-1
      if worldFraction<1.0 then segmentKind="world";fraction=worldFraction end if
      if targetHit[0]>=0 and targetHit[1]<fraction then segmentKind="target";targetIndex=targetHit[0];fraction=targetHit[1] end if
      finalPoint=pointOnSegment(startPoint,endPoint,fraction);travel=remaining*fraction;hitTime=cursorTime+numeric.trunc32(travel)
      state.trails=state.trails+[Trail(shot.id,shot.profile.style,startPoint,finalPoint,cursorTime,hitTime)]
      if segmentKind=="target" then
        kind=segmentKind;addImpact(state,shot,kind,finalPoint,[0.0,0.0,0.0],targetIndex,targetState,hitTime)
      else if segmentKind=="world" then
        if (shot.profile.eFlags & EF_BOUNCE_HALF)!=0 then
          impactVelocity=velocityAfter(shot,travel);stopped=bounceHalf(shot,finalPoint,traced.trace.normal,impactVelocity)
          remaining=remaining-travel;cursorTime=cursorTime+travel;bounces=bounces+1
          if stopped or remaining<0.001 then remaining=0 end if
        else
          kind=segmentKind;addImpact(state,shot,kind,finalPoint,traced.trace.normal,-1,targetState,hitTime)
        end if
      else
        shot.origin=endPoint;shot.velocity=velocityAfter(shot,remaining);remaining=0
      end if
    end while
    if kind=="" then
      if now>=shot.expiresAt then addImpact(state,shot,"expired",shot.origin,[0.0,0.0,1.0],-1,targetState,shot.expiresAt)
      else survivors=survivors+[shot] end if
    end if
  end for
  state.projectiles=survivors;state.lastTime=now
  return state.impacts
end function

function update(world,state,targetState,now)
  if world==void then return fail("collision world is required") end if
  return updateWithTrace(worldPointTrace,world,state,targetState,now)
end function

function activeCount(state) if state==void then return 0 end if;return len(state.projectiles) end function
