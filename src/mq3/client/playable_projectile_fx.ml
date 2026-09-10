// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 missile trails and dynamic-light overlays for the software preview.
package mq3.client.playable_projectile_fx

import mq3.client.playable_projectile_view as projectileView
import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric
import std.array as arrays

const TRAIL_STEP_MILLISECONDS=50
const ROCKET_TRAIL_MILLISECONDS=2000
const GRENADE_TRAIL_MILLISECONDS=700
const PLASMA_TRAIL_MILLISECONDS=600
const ROCKET_TRAIL_RADIUS=64.0
const GRENADE_TRAIL_RADIUS=32.0
const PLASMA_TRAIL_RADIUS=4.0
const ROCKET_DLIGHT_RADIUS=200.0
const EXPLOSION_DLIGHT_RADIUS=300.0
const COMMAND_PUFF=1
const COMMAND_LIGHT=2
const MAX_PUFFS=512

struct Profile smoke radius lifetime flyingLight impactLight impactLifetime red green blue end struct
struct Puff entityId style origin bornAt expiresAt radius end struct
struct Tracker entityId style position sampledAt nextPuffAt seenAt end struct
struct State puffs trackers end struct
struct Command kind center radius red green blue end struct

function fail(message) return error(7610,"preview projectile fx: "+message) end function
function valid3(value) return value!=void and typeof(value)=="array" and len(value)==3 end function
function copy3(value) return [numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])] end function

// Values are taken from CG_RegisterWeapon, CG_RocketTrail, CG_PlasmaTrail and
// CG_MissileHitWall. Grenade and plasma intentionally have no flying dlight;
// Baseq3 only assigns missileDlight to the rocket launcher.
function profile(style)
  if style==projectileView.STYLE_ROCKET then return Profile(true,ROCKET_TRAIL_RADIUS,ROCKET_TRAIL_MILLISECONDS,ROCKET_DLIGHT_RADIUS,EXPLOSION_DLIGHT_RADIUS,1000,255,191,0) end if
  if style==projectileView.STYLE_GRENADE then return Profile(true,GRENADE_TRAIL_RADIUS,GRENADE_TRAIL_MILLISECONDS,0.0,EXPLOSION_DLIGHT_RADIUS,600,255,255,0) end if
  if style==projectileView.STYLE_PLASMA then return Profile(true,PLASMA_TRAIL_RADIUS,PLASMA_TRAIL_MILLISECONDS,0.0,0.0,600,128,192,255) end if
  if style==projectileView.STYLE_BFG then return Profile(false,0.0,0,0.0,0.0,600,255,178,255) end if
  return Profile(false,0.0,0,0.0,0,0,255,255,255)
end function

function create() return State([],[]) end function

function trackerIndex(state,entityId)
  if len(state.trackers)==0 then return -1 end if
  for index=0 to len(state.trackers)-1 if state.trackers[index].entityId==entityId then return index end if end for
  return -1
end function

function alignedNext(time)
  return numeric.trunc32((time+TRAIL_STEP_MILLISECONDS)/TRAIL_STEP_MILLISECONDS)*TRAIL_STEP_MILLISECONDS
end function

function interpolate(a,b,fraction)
  return [a[0]+(b[0]-a[0])*fraction,a[1]+(b[1]-a[1])*fraction,a[2]+(b[2]-a[2])*fraction]
end function

function addPuff(state,entityId,style,origin,bornAt,p)
  if len(state.puffs)>=MAX_PUFFS then state.puffs=arrays.slice(state.puffs,len(state.puffs)-MAX_PUFFS+1,MAX_PUFFS-1) end if
  state.puffs=state.puffs+[Puff(entityId,style,copy3(origin),bornAt,bornAt+p.lifetime,p.radius)]
  return void
end function

function sampleFlight(state,snapshot,now)
  p=profile(snapshot.style);if not p.smoke then return void end if
  index=trackerIndex(state,snapshot.entityId)
  if index<0 then
    next=alignedNext(snapshot.eventAt)
    state.trackers=state.trackers+[Tracker(snapshot.entityId,snapshot.style,copy3(snapshot.position),snapshot.eventAt,next,now)]
    // CG_PlasmaTrail allocates one moving particle per rendered missile frame.
    if snapshot.style==projectileView.STYLE_PLASMA then addPuff(state,snapshot.entityId,snapshot.style,snapshot.position,snapshot.eventAt,p) end if
    return void
  end if
  tracker=state.trackers[index]
  startTime=tracker.sampledAt;endTime=snapshot.eventAt
  if endTime>=startTime then
    if snapshot.style==projectileView.STYLE_PLASMA then
      if endTime>startTime then addPuff(state,snapshot.entityId,snapshot.style,snapshot.position,endTime,p) end if
    else
      span=endTime-startTime
      moved=tracker.position[0]!=snapshot.position[0] or tracker.position[1]!=snapshot.position[1] or tracker.position[2]!=snapshot.position[2]
      if moved then
        while tracker.nextPuffAt<=endTime
          fraction=1.0;if span>0 then fraction=(tracker.nextPuffAt-startTime)/span end if
          addPuff(state,snapshot.entityId,snapshot.style,interpolate(tracker.position,snapshot.position,fraction),tracker.nextPuffAt,p)
          tracker.nextPuffAt=tracker.nextPuffAt+TRAIL_STEP_MILLISECONDS
        end while
      else tracker.nextPuffAt=alignedNext(endTime) end if
    end if
    tracker.position=copy3(snapshot.position);tracker.sampledAt=endTime;tracker.style=snapshot.style
  end if
  tracker.seenAt=now
  return void
end function

function update(state,snapshots,now)
  if state==void or snapshots==void or now<0 then return fail("state, snapshots and non-negative time are required") end if
  live=[];for each puff in state.puffs if now>=puff.bornAt and now<puff.expiresAt then live=live+[puff] end if end for;state.puffs=live
  for each snapshot in snapshots
    if snapshot.state==projectileView.STATE_FLYING and projectileView.alive(snapshot,now) then sampleFlight(state,snapshot,now) end if
  end for
  trackers=[];for each tracker in state.trackers if now-tracker.seenAt<=TRAIL_STEP_MILLISECONDS*2 then trackers=trackers+[tracker] end if end for;state.trackers=trackers
  return len(state.puffs)
end function

function puffFraction(puff,now)
  if now<puff.bornAt or now>=puff.expiresAt then return 0.0 end if
  return (puff.expiresAt-now)/(puff.expiresAt-puff.bornAt)
end function

function projectedRadius(worldRadius,depth,width)
  if depth<=0.0 then return 0 end if
  value=numeric.trunc32(worldRadius*(width/2)/depth)
  if value<2 then return 2 end if;if value>72 then return 72 end if;return value
end function

function command(kind,center,radius,red,green,blue) return Command(kind,center,radius,red,green,blue) end function

function frameCommands(state,camera,snapshots,now,width,height,horizontalFovDegrees,nearDistance)
  if state==void or camera==void then return [] end if
  result=[]
  for each puff in state.puffs
    center=viewer.projectPoint(camera,puff.origin,width,height,horizontalFovDegrees,nearDistance)
    if center!=void then
      fade=puffFraction(puff,now);radius=projectedRadius(puff.radius*(1.0-fade*0.5),center.depth,width)
      if puff.style==projectileView.STYLE_PLASMA then result=result+[command(COMMAND_PUFF,center,radius,numeric.trunc32(72*fade),numeric.trunc32(160*fade),numeric.trunc32(255*fade))]
      else shade=32+numeric.trunc32(112*fade);result=result+[command(COMMAND_PUFF,center,radius,shade,shade,shade)] end if
    end if
  end for
  for each snapshot in snapshots
    p=profile(snapshot.style);worldRadius=0.0;fade=1.0
    if snapshot.state==projectileView.STATE_FLYING then worldRadius=p.flyingLight
    else if snapshot.state==projectileView.STATE_IMPACT and now<snapshot.eventAt+p.impactLifetime then
      worldRadius=p.impactLight;elapsed=now-snapshot.eventAt
      if elapsed*2>p.impactLifetime then fade=1.0-(elapsed*2-p.impactLifetime)/p.impactLifetime end if
    end if
    if worldRadius>0.0 and fade>0.0 then
      center=viewer.projectPoint(camera,snapshot.position,width,height,horizontalFovDegrees,nearDistance)
      if center!=void then result=result+[command(COMMAND_LIGHT,center,projectedRadius(worldRadius,center.depth,width),numeric.trunc32(p.red*fade),numeric.trunc32(p.green*fade),numeric.trunc32(p.blue*fade))] end if
    end if
  end for
  return result
end function

function point(center,x,y) return viewer.ScreenPoint(center.x+x,center.y+y,center.depth) end function
function diamond(center,radius,red,green,blue)
  window.drawLine(point(center,0,0-radius),point(center,radius,0),red,green,blue)
  window.drawLine(point(center,radius,0),point(center,0,radius),red,green,blue)
  window.drawLine(point(center,0,radius),point(center,0-radius,0),red,green,blue)
  window.drawLine(point(center,0-radius,0),point(center,0,0-radius),red,green,blue)
end function

// Screen-space rings approximate R_AddLightToScene in the current software
// raster path. Three attenuated rings make the radius readable without a
// framebuffer blend or a BSP shader rewrite.
function draw(commands)
  lines=0
  for each entry in commands
    if entry.kind==COMMAND_PUFF then diamond(entry.center,entry.radius,entry.red,entry.green,entry.blue);lines=lines+4
    else
      diamond(entry.center,entry.radius,entry.red/5,entry.green/5,entry.blue/5)
      diamond(entry.center,numeric.trunc32(entry.radius*0.55),entry.red/3,entry.green/3,entry.blue/3)
      diamond(entry.center,numeric.trunc32(entry.radius*0.22),entry.red,entry.green,entry.blue);lines=lines+12
    end if
  end for
  return lines
end function
