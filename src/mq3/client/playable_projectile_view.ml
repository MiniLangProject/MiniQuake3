// SPDX-License-Identifier: GPL-2.0-or-later
// Snapshot-driven enemy projectile and impact effects for the software preview.
package mq3.client.playable_projectile_view

import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric

/// Projectile state while the projectile continues moving through the world.
const STATE_FLYING=1
/// Projectile state after collision, while its impact presentation is active.
const STATE_IMPACT=2
/// Projectile presentation style selecting the rocket model, trail, and impact family.
const STYLE_ROCKET=1
/// Projectile presentation style selecting the plasma model, trail, and impact family.
const STYLE_PLASMA=2
/// Projectile presentation style selecting the grenade model, trail, and impact family.
const STYLE_GRENADE=3
/// Projectile presentation style selecting the bfg model, trail, and impact family.
const STYLE_BFG=4
/// Effect command kind selecting the line rendering operation.
const COMMAND_LINE=1
/// Effect command kind selecting the glow rendering operation.
const COMMAND_GLOW=2
/// Effect command kind selecting the cross rendering operation.
const COMMAND_CROSS=3
/// Default impact duration in milliseconds when the caller supplies no override.
const DEFAULT_IMPACT_MILLISECONDS=360
/// Upper duration bound in milliseconds for impact processing.
const MAX_IMPACT_MILLISECONDS=1200

// A gameplay system can create one of these directly from its current entity
// snapshot. Flying snapshots have no deadline; impact snapshots are half-open
// timed events in the interval [eventAt, expiresAt).
struct ProjectileSnapshot
  /// When constructing this record, `snapshot` supplies `entityId` for this member.
  entityId
  /// Projectile style used to choose the fallback effect's color and appearance.
  style
  /// When constructing this record, `snapshot` supplies `copyPoint(previousPosition)` for this member.
  previousPosition
  /// When constructing this record, `snapshot` supplies `copyPoint(position)` for this member.
  position
  /// Direction or impact normal used to orient the fallback projectile effect's short line segment.
  normal
  /// When constructing this record, `snapshot` supplies `state` for this member.
  state
  /// When constructing this record, `snapshot` supplies `eventAt` for this member.
  eventAt
  /// When constructing this record, `snapshot` supplies `expiresAt` for this member.
  expiresAt
end struct
/// Stores playable projectile view effect command record, including `kind`, `a`, `b`, `radius`, `red`, `green` and additional values.
struct EffectCommand
  /// Drawing primitive selector choosing a line, impact cross, or glow for the fallback projectile
  /// effect.
  kind
  /// Alpha component controlling opacity or blending.
  a
  /// Blue component of the stored color.
  b
  /// Screen-space radius in pixels of the projected projectile glow or impact cross.
  radius
  /// Red color component used by this drawing or effect record.
  red
  /// Green color component used by this drawing or effect record.
  green
  /// Blue color component used by this drawing or effect record.
  blue
end struct

/// Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable projectile view `validPoint`.
/// @param value Sequence whose length/content is inspected by `validPoint`.
function validPoint(value) return value!=void and typeof(value)=="array" and len(value)==3 end function
/// Copies three vector components with float32 rounding for playable projectile view.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function copyPoint(value) return [numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])] end function

/// Calls `mq3.client.playable_projectile_view.validPoint`, `mq3.client.playable_projectile_view.ProjectileSnapshot`, `mq3.client.playable_projectile_view.copyPoint` from playable projectile view `snapshot`.
/// @param entityId Value used by `if entityId<0 then return error(7580,"projectile snapshot entity id cannot be negative") end if`.
/// @param style Value used by `return ProjectileSnapshot(entityId,style,copyPoint(previousPosition),copyPoint(position),copyPoint(normal),state,eventAt,expiresAt)`.
/// @param previousPosition Value used by `if not validPoint(previousPosition) or not validPoint(position) or not validPoint(normal) then return error(7581,"projectile snapshot needs th...`.
/// @param position Value used by `if not validPoint(previousPosition) or not validPoint(position) or not validPoint(normal) then return error(7581,"projectile snapshot needs th...`.
/// @param normal Surface-normal vector used to orient or offset the effect.
/// @param state Shared playable projectile view state passed to the helper calls in `snapshot`.
/// @param eventAt Value used by `if state==STATE_IMPACT and expiresAt<=eventAt then return error(7584,"projectile impact needs a positive lifetime") end if`.
/// @param expiresAt Value used by `if state==STATE_FLYING and expiresAt!=0 then return error(7583,"flying projectile snapshot cannot have an expiry") end if`.
function snapshot(entityId,style,previousPosition,position,normal,state,eventAt,expiresAt)
  if entityId<0 then return error(7580,"projectile snapshot entity id cannot be negative") end if
  if not validPoint(previousPosition) or not validPoint(position) or not validPoint(normal) then return error(7581,"projectile snapshot needs three-component points") end if
  if state!=STATE_FLYING and state!=STATE_IMPACT then return error(7582,"projectile snapshot state is invalid") end if
  if state==STATE_FLYING and expiresAt!=0 then return error(7583,"flying projectile snapshot cannot have an expiry") end if
  if state==STATE_IMPACT and expiresAt<=eventAt then return error(7584,"projectile impact needs a positive lifetime") end if
  if state==STATE_IMPACT and expiresAt-eventAt>MAX_IMPACT_MILLISECONDS then return error(7585,"projectile impact lifetime exceeds preview bounds") end if
  return ProjectileSnapshot(entityId,style,copyPoint(previousPosition),copyPoint(position),copyPoint(normal),state,eventAt,expiresAt)
end function

/// Adapts `mq3.client.playable_projectile_view.snapshot` to playable projectile view `flying`, returning its result for `entityId, style, previousPosition, position, [0.0,0.0,0.0], STATE_FLYING, sampledAt, 0`.
/// @param entityId Argument 1 of `mq3.client.playable_projectile_view.snapshot`.
/// @param style Argument 2 of `mq3.client.playable_projectile_view.snapshot`.
/// @param previousPosition Argument 3 of `mq3.client.playable_projectile_view.snapshot`.
/// @param position Argument 4 of `mq3.client.playable_projectile_view.snapshot`.
/// @param sampledAt Argument 7 of `mq3.client.playable_projectile_view.snapshot`.
function flying(entityId,style,previousPosition,position,sampledAt)
  return snapshot(entityId,style,previousPosition,position,[0.0,0.0,0.0],STATE_FLYING,sampledAt,0)
end function

/// Adapts `mq3.client.playable_projectile_view.snapshot` to playable projectile view `impact`, returning its result for `entityId, style, position, position, normal, STATE_IMPACT, eventAt, eventAt+durationMilliseconds`.
/// @param entityId Argument 1 of `mq3.client.playable_projectile_view.snapshot`.
/// @param style Argument 2 of `mq3.client.playable_projectile_view.snapshot`.
/// @param position Argument 3, 4 of `mq3.client.playable_projectile_view.snapshot`.
/// @param normal Surface-normal vector used to orient or offset the effect. Forwarded to `mq3.client.playable_projectile_view.snapshot`.
/// @param eventAt Argument 7, 8 of `mq3.client.playable_projectile_view.snapshot`; passed as `eventAt`, `eventAt+durationMilliseconds`.
/// @param durationMilliseconds Argument 8 of `mq3.client.playable_projectile_view.snapshot`; passed as `eventAt+durationMilliseconds`.
function impact(entityId,style,position,normal,eventAt,durationMilliseconds)
  return snapshot(entityId,style,position,position,normal,STATE_IMPACT,eventAt,eventAt+durationMilliseconds)
end function

/// Adapts `mq3.client.playable_projectile_view.impact` to playable projectile view `defaultImpact`, returning its result for `entityId, style, position, normal, eventAt, DEFAULT_IMPACT_MILLISECONDS`.
/// @param entityId Argument 1 of `mq3.client.playable_projectile_view.impact`.
/// @param style Argument 2 of `mq3.client.playable_projectile_view.impact`.
/// @param position Argument 3 of `mq3.client.playable_projectile_view.impact`.
/// @param normal Surface-normal vector used to orient or offset the effect. Forwarded to `mq3.client.playable_projectile_view.impact`.
/// @param eventAt Argument 5 of `mq3.client.playable_projectile_view.impact`.
function defaultImpact(entityId,style,position,normal,eventAt)
  return impact(entityId,style,position,normal,eventAt,DEFAULT_IMPACT_MILLISECONDS)
end function

// CG_MissileHitWall keeps rocket explosions for 1000 ms and the remaining
// Baseq3 projectile explosions for the default 600 ms.
/// @param entityId Value used by `return impact(entityId,style,position,normal,eventAt,duration)`.
/// @param style Value used by `if style==STYLE_ROCKET then duration=1000 end if`.
/// @param position Value used by `return impact(entityId,style,position,normal,eventAt,duration)`.
/// @param normal Surface-normal vector used to orient or offset the effect.
/// @param eventAt Value used by `return impact(entityId,style,position,normal,eventAt,duration)`.
function retailImpact(entityId,style,position,normal,eventAt)
  duration=600;if style==STYLE_ROCKET then duration=1000 end if
  return impact(entityId,style,position,normal,eventAt,duration)
end function

/// Evaluates playable projectile view `alive` and returns `false`, `value.state==STATE_FLYING or nowMilliseconds<value.expiresAt` according to its guard/selection conditions.
/// @param value Record read through `value.eventAt`, `value.state`, `value.expiresAt`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function alive(value,nowMilliseconds)
  if value==void or nowMilliseconds<value.eventAt then return false end if
  return value.state==STATE_FLYING or nowMilliseconds<value.expiresAt
end function

/// Calls `mq3.client.playable_projectile_view.alive`, `mq3.compat.numeric.fdiv`, `mq3.compat.numeric.f32` from playable projectile view `fadeFraction`.
/// @param value Record read through `value.state`, `value.expiresAt`, `value.eventAt`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function fadeFraction(value,nowMilliseconds)
  if not alive(value,nowMilliseconds) then return 0.0 end if
  if value.state==STATE_FLYING then return 1.0 end if
  return numeric.fdiv(numeric.f32(value.expiresAt-nowMilliseconds),numeric.f32(value.expiresAt-value.eventAt))
end function

/// Evaluates playable projectile view `baseColor` and returns `[255,104,32]`, `[72,208,255]`, `[255,208,64]` and additional values according to its guard/selection conditions.
/// @param style Value used by `if style==STYLE_ROCKET then return [255,104,32] end if`.
function baseColor(style)
  if style==STYLE_ROCKET then return [255,104,32] end if
  if style==STYLE_PLASMA then return [72,208,255] end if
  if style==STYLE_GRENADE then return [255,208,64] end if
  if style==STYLE_BFG then return [96,255,112] end if
  return [255,96,192]
end function

/// Calls `mq3.client.playable_projectile_view.baseColor`, `mq3.compat.numeric.trunc32` from playable projectile view `fadedColor`. The final path returns `[numeric.trunc32(rgb[0]*value),numeric.trunc32(rgb[1]*value),numeric.trunc32(rgb[2]*value)]`.
/// @param style Value used by `rgb=baseColor(style)`.
/// @param fraction Interpolation or blend fraction between the endpoint values.
function fadedColor(style,fraction)
  value=fraction;if value<0.0 then value=0.0 end if;if value>1.0 then value=1.0 end if
  rgb=baseColor(style)
  return [numeric.trunc32(rgb[0]*value),numeric.trunc32(rgb[1]*value),numeric.trunc32(rgb[2]*value)]
end function

/// Creates a `mq3.client.playable_projectile_view.EffectCommand` record. Assigns `kind` from `kind`, `a` from `a`, `b` from `b`, `radius` from `radius`.
/// @param kind Value used to initialize `EffectCommand.kind`.
/// @param a Value used to initialize `EffectCommand.a`.
/// @param b Value used to initialize `EffectCommand.b`.
/// @param radius Value used to initialize `EffectCommand.radius`.
/// @param rgb Value used to initialize `EffectCommand.red`, `EffectCommand.green`, `EffectCommand.blue`.
function command(kind,a,b,radius,rgb) return EffectCommand(kind,a,b,radius,rgb[0],rgb[1],rgb[2]) end function
/// Adapts `mq3.client.playable_projectile_view.command` to playable projectile view `line`, returning its result for `COMMAND_LINE, a, b, 0, rgb`.
/// @param a Argument 2 of `mq3.client.playable_projectile_view.command`.
/// @param b Argument 3 of `mq3.client.playable_projectile_view.command`.
/// @param rgb Argument 5 of `mq3.client.playable_projectile_view.command`.
function line(a,b,rgb) return command(COMMAND_LINE,a,b,0,rgb) end function
/// Adapts `mq3.client.playable_projectile_view.command` to playable projectile view `glow`, returning its result for `COMMAND_GLOW, center, center, radius, rgb`.
/// @param center Argument 2, 3 of `mq3.client.playable_projectile_view.command`.
/// @param radius Radius used by the spatial or visual calculation. Forwarded to `mq3.client.playable_projectile_view.command`.
/// @param rgb Argument 5 of `mq3.client.playable_projectile_view.command`.
function glow(center,radius,rgb) return command(COMMAND_GLOW,center,center,radius,rgb) end function
/// Adapts `mq3.client.playable_projectile_view.command` to playable projectile view `cross`, returning its result for `COMMAND_CROSS, center, center, radius, rgb`.
/// @param center Argument 2, 3 of `mq3.client.playable_projectile_view.command`.
/// @param radius Radius used by the spatial or visual calculation. Forwarded to `mq3.client.playable_projectile_view.command`.
/// @param rgb Argument 5 of `mq3.client.playable_projectile_view.command`.
function cross(center,radius,rgb) return command(COMMAND_CROSS,center,center,radius,rgb) end function

/// Calls `mq3.compat.numeric.trunc32` from playable projectile view `glowRadius`. The final path returns `radius`.
/// @param depth Value used by `radius=numeric.trunc32(180.0/depth)`.
function glowRadius(depth)
  radius=numeric.trunc32(180.0/depth)
  if radius<3 then return 3 end if
  if radius>14 then return 14 end if
  return radius
end function

/// Evaluates playable projectile view `impactTip` and returns `[value.position[0]+value.normal[0]*length,value.position[1]+value.normal[1]*length,value.position[2]+value.normal[2]*length]` according to its guard/selection conditions.
/// @param value Record read through `value.position`, `value.normal`.
function impactTip(value)
  length=8.0
  return [value.position[0]+value.normal[0]*length,value.position[1]+value.normal[1]*length,value.position[2]+value.normal[2]*length]
end function

/// Calls `mq3.client.playable_projectile_view.alive`, `mq3.client.playable_projectile_view.fadedColor`, `mq3.client.playable_projectile_view.fadeFraction` and additional helpers from playable projectile view `snapshotCommands`. The final path returns `result+[glow(center,radius+2,rgb),cross(center,radius+5,rgb)]`.
/// @param camera Camera state used to transform/project the scene.
/// @param value Record read through `value.style`, `value.state`, `value.previousPosition`, `value.position`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param width Width in the coordinate space used by `snapshotCommands`.
/// @param height Height in the coordinate space used by `snapshotCommands`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
function snapshotCommands(camera,value,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance)
  if not alive(value,nowMilliseconds) then return [] end if
  rgb=fadedColor(value.style,fadeFraction(value,nowMilliseconds));result=[]
  if value.state==STATE_FLYING then
    trail=viewer.projectLine(camera,value.previousPosition,value.position,width,height,horizontalFovDegrees,nearDistance)
    if trail.visible then result=result+[line(trail.a,trail.b,rgb)] end if
    center=viewer.projectPoint(camera,value.position,width,height,horizontalFovDegrees,nearDistance)
    if center!=void then result=result+[glow(center,glowRadius(center.depth),rgb)] end if
    return result
  end if
  center=viewer.projectPoint(camera,value.position,width,height,horizontalFovDegrees,nearDistance)
  if center==void then return [] end if
  plume=viewer.projectLine(camera,value.position,impactTip(value),width,height,horizontalFovDegrees,nearDistance)
  if plume.visible then result=result+[line(plume.a,plume.b,rgb)] end if
  radius=glowRadius(center.depth)
  return result+[glow(center,radius+2,rgb),cross(center,radius+5,rgb)]
end function

/// Calls `mq3.client.playable_projectile_view.snapshotCommands` from playable projectile view `frameCommands`. The final path returns `result`.
/// @param camera Camera state used to transform/project the scene.
/// @param snapshots Value used by `for each value in snapshots result=result+snapshotCommands(camera,value,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param width Width in the coordinate space used by `frameCommands`.
/// @param height Height in the coordinate space used by `frameCommands`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
function frameCommands(camera,snapshots,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance)
  result=[]
  for each value in snapshots result=result+snapshotCommands(camera,value,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for
  return result
end function

/// Calls `mq3.client.playable_projectile_view.alive` from playable projectile view `liveSnapshots`. The final path returns `result`.
/// @param snapshots Value used by `for each value in snapshots if alive(value,nowMilliseconds) then result=result+[value] end if end for`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function liveSnapshots(snapshots,nowMilliseconds)
  result=[]
  for each value in snapshots if alive(value,nowMilliseconds) then result=result+[value] end if end for
  return result
end function

/// Adapts `mq3.client.playable_viewer.ScreenPoint` to playable projectile view `screenPoint`, returning its result for `center.x+dx, center.y+dy, center.depth`.
/// @param center Record read through `center.x`, `center.y`, `center.depth`.
/// @param dx Argument 1 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center.x+dx`.
/// @param dy Argument 2 of `mq3.client.playable_viewer.ScreenPoint`; passed as `center.y+dy`.
function screenPoint(center,dx,dy) return viewer.ScreenPoint(center.x+dx,center.y+dy,center.depth) end function

/// Calls `mq3.platform.playable_window.drawLine`, `mq3.client.playable_projectile_view.screenPoint` from playable projectile view `drawCommand`. The final path returns `0`.
/// @param entry Record read through `entry.kind`, `entry.a`, `entry.b`, `entry.red` and additional values.
function drawCommand(entry)
  if entry.kind==COMMAND_LINE then window.drawLine(entry.a,entry.b,entry.red,entry.green,entry.blue);return 1 end if
  c=entry.a;r=entry.radius
  if entry.kind==COMMAND_CROSS then
    window.drawLine(screenPoint(c,0-r,0-r),screenPoint(c,r,r),entry.red,entry.green,entry.blue)
    window.drawLine(screenPoint(c,r,0-r),screenPoint(c,0-r,r),entry.red,entry.green,entry.blue)
    return 2
  end if
  if entry.kind==COMMAND_GLOW then
    window.drawLine(screenPoint(c,0,0-r),screenPoint(c,r,0),entry.red,entry.green,entry.blue)
    window.drawLine(screenPoint(c,r,0),screenPoint(c,0,r),entry.red,entry.green,entry.blue)
    window.drawLine(screenPoint(c,0,r),screenPoint(c,0-r,0),entry.red,entry.green,entry.blue)
    window.drawLine(screenPoint(c,0-r,0),screenPoint(c,0,0-r),entry.red,entry.green,entry.blue)
    return 4
  end if
  return 0
end function

/// Calls `mq3.client.playable_projectile_view.drawCommand` from playable projectile view `draw`. The final path returns `count`.
/// @param commands Value used by `for each entry in commands count=count+drawCommand(entry) end for`.
function draw(commands)
  count=0
  for each entry in commands count=count+drawCommand(entry) end for
  return count
end function
