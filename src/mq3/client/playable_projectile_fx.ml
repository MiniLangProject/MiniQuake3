// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 missile trails and dynamic-light overlays for the software preview.
package mq3.client.playable_projectile_fx

import mq3.client.playable_projectile_view as projectileView
import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric
import std.array as arrays
import mq3.renderer.playable_dynamic_lights as dynamicLights

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

/// Stores playable projectile fx profile record, including `smoke`, `radius`, `lifetime`, `flyingLight`, `impactLight`, `impactLifetime` and additional values.
struct Profile smoke radius lifetime flyingLight impactLight impactLifetime red green blue end struct
/// Stores playable projectile fx puff record, including `entityId`, `style`, `origin`, `bornAt`, `expiresAt`, `radius`.
struct Puff entityId style origin bornAt expiresAt radius end struct
/// Stores playable projectile fx tracker record, including `entityId`, `style`, `position`, `sampledAt`, `nextPuffAt`, `seenAt`.
struct Tracker entityId style position sampledAt nextPuffAt seenAt end struct
/// Stores playable projectile fx state, including `puffs`, `trackers`.
struct State puffs trackers end struct
/// Stores playable projectile fx command data, including `kind`, `center`, `radius`, `red`, `green`, `blue`.
struct Command kind center radius red green blue end struct

/// Creates the playable projectile fx error `7610` with diagnostic text `"preview projectile fx: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview projectile fx: "+message`.
function fail(message) return error(7610,"preview projectile fx: "+message) end function
/// Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable projectile fx `valid3`.
/// @param value Sequence whose length/content is inspected by `valid3`.
function valid3(value) return value!=void and typeof(value)=="array" and len(value)==3 end function
/// Copies three vector components with float32 rounding for playable projectile fx.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function copy3(value) return [numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])] end function

// Values are taken from CG_RegisterWeapon, CG_RocketTrail, CG_PlasmaTrail and
// CG_MissileHitWall. Grenade and plasma intentionally have no flying dlight;
// Baseq3 only assigns missileDlight to the rocket launcher.
/// @param style Value used by `if style==projectileView.STYLE_ROCKET then return Profile(true,ROCKET_TRAIL_RADIUS,ROCKET_TRAIL_MILLISECONDS,ROCKET_DLIGHT_RADIUS,EXPLOSION_DL...`.
function profile(style)
  if style==projectileView.STYLE_ROCKET then return Profile(true,ROCKET_TRAIL_RADIUS,ROCKET_TRAIL_MILLISECONDS,ROCKET_DLIGHT_RADIUS,EXPLOSION_DLIGHT_RADIUS,1000,255,191,0) end if
  if style==projectileView.STYLE_GRENADE then return Profile(true,GRENADE_TRAIL_RADIUS,GRENADE_TRAIL_MILLISECONDS,0.0,EXPLOSION_DLIGHT_RADIUS,600,255,255,0) end if
  if style==projectileView.STYLE_PLASMA then return Profile(true,PLASMA_TRAIL_RADIUS,PLASMA_TRAIL_MILLISECONDS,0.0,0.0,600,128,192,255) end if
  if style==projectileView.STYLE_BFG then return Profile(false,0.0,0,0.0,0.0,600,255,178,255) end if
  return Profile(false,0.0,0,0.0,0,0,255,255,255)
end function

/// Creates a `mq3.client.playable_projectile_fx.State` record. Initializes the record with the defaults written in this constructor.
function create() return State([],[]) end function

/// Evaluates playable projectile fx `trackerIndex` and returns `-1`, `index` according to its guard/selection conditions.
/// @param state Record read through `state.trackers`.
/// @param entityId Value used by `for index=0 to len(state.trackers)-1 if state.trackers[index].entityId==entityId then return index end if end for`.
function trackerIndex(state,entityId)
  if len(state.trackers)==0 then return -1 end if
  for index=0 to len(state.trackers)-1 if state.trackers[index].entityId==entityId then return index end if end for
  return -1
end function

/// Computes `numeric.trunc32((time+TRAIL_STEP_MILLISECONDS)/TRAIL_STEP_MILLISECONDS)*TRAIL_STEP_MILLISECONDS` for playable projectile fx `alignedNext`.
/// @param time Value used by `return numeric.trunc32((time+TRAIL_STEP_MILLISECONDS)/TRAIL_STEP_MILLISECONDS)*TRAIL_STEP_MILLISECONDS`.
function alignedNext(time)
  return numeric.trunc32((time+TRAIL_STEP_MILLISECONDS)/TRAIL_STEP_MILLISECONDS)*TRAIL_STEP_MILLISECONDS
end function

/// Builds the playable projectile fx `interpolate` sequence from `[a[0]+(b[0]-a[0])*fraction,a[1]+(b[1]-a[1])*fraction,a[2]+(b[2]-a[2])*fraction]`.
/// @param a Sequence read at `a[0]`, `a[1]`, `a[2]`.
/// @param b Sequence read at `b[0]`, `b[1]`, `b[2]`.
/// @param fraction Interpolation or blend fraction between the endpoint values.
function interpolate(a,b,fraction)
  return [a[0]+(b[0]-a[0])*fraction,a[1]+(b[1]-a[1])*fraction,a[2]+(b[2]-a[2])*fraction]
end function

/// Updates `state.puffs` during playable projectile fx `addPuff`.
/// @param state Mutable playable projectile fx record/storage; this routine assigns `state.puffs`.
/// @param entityId Value used by `state.puffs=state.puffs+[Puff(entityId,style,copy3(origin),bornAt,bornAt+p.lifetime,p.radius)]`.
/// @param style Value used by `state.puffs=state.puffs+[Puff(entityId,style,copy3(origin),bornAt,bornAt+p.lifetime,p.radius)]`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param bornAt Value used by `state.puffs=state.puffs+[Puff(entityId,style,copy3(origin),bornAt,bornAt+p.lifetime,p.radius)]`.
/// @param p Record read through `p.lifetime`, `p.radius`.
function addPuff(state,entityId,style,origin,bornAt,p)
  if len(state.puffs)>=MAX_PUFFS then state.puffs=arrays.slice(state.puffs,len(state.puffs)-MAX_PUFFS+1,MAX_PUFFS-1) end if
  state.puffs=state.puffs+[Puff(entityId,style,copy3(origin),bornAt,bornAt+p.lifetime,p.radius)]
  return void
end function

/// Updates `state.trackers` during playable projectile fx `sampleFlight`.
/// @param state Mutable playable projectile fx record/storage; this routine assigns `state.trackers`.
/// @param snapshot Record read through `snapshot.style`, `snapshot.entityId`, `snapshot.eventAt`, `snapshot.position`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
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

/// Updates `state.puffs`, `state.trackers` during playable projectile fx `update`.
/// @param state Mutable playable projectile fx record/storage; this routine assigns `state.puffs`, `state.trackers`.
/// @param snapshots Value used by `if state==void or snapshots==void or now<0 then return fail("state, snapshots and non-negative time are required") end if`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function update(state,snapshots,now)
  if state==void or snapshots==void or now<0 then return fail("state, snapshots and non-negative time are required") end if
  live=[];for each puff in state.puffs if now>=puff.bornAt and now<puff.expiresAt then live=live+[puff] end if end for;state.puffs=live
  for each snapshot in snapshots
    if snapshot.state==projectileView.STATE_FLYING and projectileView.alive(snapshot,now) then sampleFlight(state,snapshot,now) end if
  end for
  trackers=[];for each tracker in state.trackers if now-tracker.seenAt<=TRAIL_STEP_MILLISECONDS*2 then trackers=trackers+[tracker] end if end for;state.trackers=trackers
  return len(state.puffs)
end function

/// Returns a smoke puff's remaining lifetime fraction, or zero before its birth and after expiration.
/// @param puff Record read through `puff.bornAt`, `puff.expiresAt`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function puffFraction(puff,now)
  if now<puff.bornAt or now>=puff.expiresAt then return 0.0 end if
  return (puff.expiresAt-now)/(puff.expiresAt-puff.bornAt)
end function

/// Calls `mq3.compat.numeric.trunc32` from playable projectile fx `projectedRadius`. The final path returns `value`.
/// @param worldRadius Value used by `value=numeric.trunc32(worldRadius*(width/2)/depth)`.
/// @param depth Value used by `if depth<=0.0 then return 0 end if`.
/// @param width Width in the coordinate space used by `projectedRadius`.
function projectedRadius(worldRadius,depth,width)
  if depth<=0.0 then return 0 end if
  value=numeric.trunc32(worldRadius*(width/2)/depth)
  if value<2 then return 2 end if;if value>72 then return 72 end if;return value
end function

/// Creates a `mq3.client.playable_projectile_fx.Command` record. Assigns `kind` from `kind`, `center` from `center`, `radius` from `radius`, `red` from `red`.
/// @param kind Value used to initialize `Command.kind`.
/// @param center Value used to initialize `Command.center`.
/// @param radius Value used to initialize `Command.radius`.
/// @param red Value used to initialize `Command.red`.
/// @param green Value used to initialize `Command.green`.
/// @param blue Value used to initialize `Command.blue`.
function command(kind,center,radius,red,green,blue) return Command(kind,center,radius,red,green,blue) end function
/// Computes `snapshot.eventAt-(numeric.i32(snapshot.entityId*97+snapshot.eventAt*17) & 63)` for playable projectile fx `impactStart`.
/// @param snapshot Record read through `snapshot.eventAt`, `snapshot.entityId`.
function impactStart(snapshot) return snapshot.eventAt-(numeric.i32(snapshot.entityId*97+snapshot.eventAt*17) & 63) end function

/// Calls `mq3.client.playable_projectile_fx.profile`, `mq3.client.playable_projectile_fx.impactStart`, `mq3.renderer.playable_dynamic_lights.Light` and additional helpers from playable projectile fx `worldLights`. The final path returns `result`.
/// @param snapshots Value used by `for each snapshot in snapshots`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function worldLights(snapshots,now)
  result=[]
  for each snapshot in snapshots
    p=profile(snapshot.style);radius=0.0;fade=1.0
    if snapshot.state==projectileView.STATE_FLYING then radius=p.flyingLight
    else if snapshot.state==projectileView.STATE_IMPACT and now<impactStart(snapshot)+p.impactLifetime then radius=p.impactLight;elapsed=now-impactStart(snapshot);if elapsed*2>p.impactLifetime then fade=1.0-(elapsed*2-p.impactLifetime)/p.impactLifetime end if end if
    if radius>0.0 and fade>0.0 then result=result+[dynamicLights.Light(copy3(snapshot.position),radius,[p.red*fade/255.0,p.green*fade/255.0,p.blue*fade/255.0],false)] end if
  end for
  return result
end function

/// Calls `mq3.client.playable_viewer.projectPoint`, `mq3.client.playable_projectile_fx.puffFraction`, `mq3.client.playable_projectile_fx.projectedRadius` and additional helpers from playable projectile fx `frameCommands`. The final path returns `result`.
/// @param state Record read through `state.puffs`.
/// @param camera Camera state used to transform/project the scene.
/// @param snapshots Value used by `for each snapshot in snapshots`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param width Width in the coordinate space used by `frameCommands`.
/// @param height Height in the coordinate space used by `frameCommands`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
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
    else if snapshot.state==projectileView.STATE_IMPACT and now<impactStart(snapshot)+p.impactLifetime then
      worldRadius=p.impactLight;elapsed=now-impactStart(snapshot)
      if elapsed*2>p.impactLifetime then fade=1.0-(elapsed*2-p.impactLifetime)/p.impactLifetime end if
    end if
    if worldRadius>0.0 and fade>0.0 then
      center=viewer.projectPoint(camera,snapshot.position,width,height,horizontalFovDegrees,nearDistance)
      if center!=void then result=result+[command(COMMAND_LIGHT,center,projectedRadius(worldRadius,center.depth,width),numeric.trunc32(p.red*fade),numeric.trunc32(p.green*fade),numeric.trunc32(p.blue*fade))] end if
    end if
  end for
  return result
end function

/// Adapts `mq3.client.playable_viewer.ScreenPoint` to playable projectile fx `point`, returning its result for `center.x+x, center.y+y, center.depth`.
/// @param center Record read through `center.x`, `center.y`, `center.depth`.
/// @param x Argument 1 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center.x+x`.
/// @param y Argument 2 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center.y+y`.
function point(center,x,y) return viewer.ScreenPoint(center.x+x,center.y+y,center.depth) end function
/// Calls `mq3.platform.playable_window.drawLine`, `mq3.client.playable_projectile_fx.point` from playable projectile fx `diamond`.
/// @param center Value used by `window.drawLine(point(center,0,0-radius),point(center,radius,0),red,green,blue)`.
/// @param radius Radius used by the spatial or visual calculation.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function diamond(center,radius,red,green,blue)
  window.drawLine(point(center,0,0-radius),point(center,radius,0),red,green,blue)
  window.drawLine(point(center,radius,0),point(center,0,radius),red,green,blue)
  window.drawLine(point(center,0,radius),point(center,0-radius,0),red,green,blue)
  window.drawLine(point(center,0-radius,0),point(center,0,0-radius),red,green,blue)
end function

// Screen-space rings approximate R_AddLightToScene in the current software
// raster path. Three attenuated rings make the radius readable without a
// framebuffer blend or a BSP shader rewrite.
/// @param commands Value used by `for each entry in commands`.
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
/// Calls `mq3.client.playable_projectile_fx.diamond` from playable projectile fx `drawPuffs`. The final path returns `lines`.
/// @param commands Value used by `for each entry in commands if entry.kind==COMMAND_PUFF then diamond(entry.center,entry.radius,entry.red,entry.green,entry.blue)`.
function drawPuffs(commands)
  lines=0;for each entry in commands if entry.kind==COMMAND_PUFF then diamond(entry.center,entry.radius,entry.red,entry.green,entry.blue);lines=lines+4 end if end for;return lines
end function
