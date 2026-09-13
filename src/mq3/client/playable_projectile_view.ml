// SPDX-License-Identifier: GPL-2.0-or-later
// Snapshot-driven enemy projectile and impact effects for the software preview.
package mq3.client.playable_projectile_view

import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric

const STATE_FLYING=1
const STATE_IMPACT=2
const STYLE_ROCKET=1
const STYLE_PLASMA=2
const STYLE_GRENADE=3
const STYLE_BFG=4
const COMMAND_LINE=1
const COMMAND_GLOW=2
const COMMAND_CROSS=3
const DEFAULT_IMPACT_MILLISECONDS=360
const MAX_IMPACT_MILLISECONDS=1200

// A gameplay system can create one of these directly from its current entity
// snapshot. Flying snapshots have no deadline; impact snapshots are half-open
// timed events in the interval [eventAt, expiresAt).
struct ProjectileSnapshot entityId style previousPosition position normal state eventAt expiresAt end struct
struct EffectCommand kind a b radius red green blue end struct

function validPoint(value) return value!=void and typeof(value)=="array" and len(value)==3 end function
function copyPoint(value) return [numeric.f32(value[0]),numeric.f32(value[1]),numeric.f32(value[2])] end function

function snapshot(entityId,style,previousPosition,position,normal,state,eventAt,expiresAt)
  if entityId<0 then return error(7580,"projectile snapshot entity id cannot be negative") end if
  if not validPoint(previousPosition) or not validPoint(position) or not validPoint(normal) then return error(7581,"projectile snapshot needs three-component points") end if
  if state!=STATE_FLYING and state!=STATE_IMPACT then return error(7582,"projectile snapshot state is invalid") end if
  if state==STATE_FLYING and expiresAt!=0 then return error(7583,"flying projectile snapshot cannot have an expiry") end if
  if state==STATE_IMPACT and expiresAt<=eventAt then return error(7584,"projectile impact needs a positive lifetime") end if
  if state==STATE_IMPACT and expiresAt-eventAt>MAX_IMPACT_MILLISECONDS then return error(7585,"projectile impact lifetime exceeds preview bounds") end if
  return ProjectileSnapshot(entityId,style,copyPoint(previousPosition),copyPoint(position),copyPoint(normal),state,eventAt,expiresAt)
end function

function flying(entityId,style,previousPosition,position,sampledAt)
  return snapshot(entityId,style,previousPosition,position,[0.0,0.0,0.0],STATE_FLYING,sampledAt,0)
end function

function impact(entityId,style,position,normal,eventAt,durationMilliseconds)
  return snapshot(entityId,style,position,position,normal,STATE_IMPACT,eventAt,eventAt+durationMilliseconds)
end function

function defaultImpact(entityId,style,position,normal,eventAt)
  return impact(entityId,style,position,normal,eventAt,DEFAULT_IMPACT_MILLISECONDS)
end function

// CG_MissileHitWall keeps rocket explosions for 1000 ms and the remaining
// Baseq3 projectile explosions for the default 600 ms.
function retailImpact(entityId,style,position,normal,eventAt)
  duration=600;if style==STYLE_ROCKET then duration=1000 end if
  return impact(entityId,style,position,normal,eventAt,duration)
end function

function alive(value,nowMilliseconds)
  if value==void or nowMilliseconds<value.eventAt then return false end if
  return value.state==STATE_FLYING or nowMilliseconds<value.expiresAt
end function

function fadeFraction(value,nowMilliseconds)
  if not alive(value,nowMilliseconds) then return 0.0 end if
  if value.state==STATE_FLYING then return 1.0 end if
  return numeric.fdiv(numeric.f32(value.expiresAt-nowMilliseconds),numeric.f32(value.expiresAt-value.eventAt))
end function

function baseColor(style)
  if style==STYLE_ROCKET then return [255,104,32] end if
  if style==STYLE_PLASMA then return [72,208,255] end if
  if style==STYLE_GRENADE then return [255,208,64] end if
  if style==STYLE_BFG then return [96,255,112] end if
  return [255,96,192]
end function

function fadedColor(style,fraction)
  value=fraction;if value<0.0 then value=0.0 end if;if value>1.0 then value=1.0 end if
  rgb=baseColor(style)
  return [numeric.trunc32(rgb[0]*value),numeric.trunc32(rgb[1]*value),numeric.trunc32(rgb[2]*value)]
end function

function command(kind,a,b,radius,rgb) return EffectCommand(kind,a,b,radius,rgb[0],rgb[1],rgb[2]) end function
function line(a,b,rgb) return command(COMMAND_LINE,a,b,0,rgb) end function
function glow(center,radius,rgb) return command(COMMAND_GLOW,center,center,radius,rgb) end function
function cross(center,radius,rgb) return command(COMMAND_CROSS,center,center,radius,rgb) end function

function glowRadius(depth)
  radius=numeric.trunc32(180.0/depth)
  if radius<3 then return 3 end if
  if radius>14 then return 14 end if
  return radius
end function

function impactTip(value)
  length=8.0
  return [value.position[0]+value.normal[0]*length,value.position[1]+value.normal[1]*length,value.position[2]+value.normal[2]*length]
end function

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

function frameCommands(camera,snapshots,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance)
  result=[]
  for each value in snapshots result=result+snapshotCommands(camera,value,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for
  return result
end function

function liveSnapshots(snapshots,nowMilliseconds)
  result=[]
  for each value in snapshots if alive(value,nowMilliseconds) then result=result+[value] end if end for
  return result
end function

function screenPoint(center,dx,dy) return viewer.ScreenPoint(center.x+dx,center.y+dy,center.depth) end function

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

function draw(commands)
  count=0
  for each entry in commands count=count+drawCommand(entry) end for
  return count
end function
