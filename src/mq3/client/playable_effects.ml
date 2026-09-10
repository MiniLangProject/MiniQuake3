// SPDX-License-Identifier: GPL-2.0-or-later
// Lightweight item billboards and short-lived weapon effects for the playable preview.
package mq3.client.playable_effects

import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import std.string as strings
import mq3.compat.numeric as numeric

const ITEM_UNKNOWN=0
const ITEM_HEALTH=1
const ITEM_ARMOR=2
const ITEM_WEAPON=3
const ITEM_AMMO=4
const ITEM_POWERUP=5
const ITEM_HOLDABLE=6
const ITEM_TEAM=7
const DEFAULT_EFFECT_MILLISECONDS=180
const MAX_EFFECT_MILLISECONDS=2000

struct ItemMarker classname origin active end struct
struct ShotEffect startPoint impactPoint bornAt expiresAt end struct
struct LineCommand a b red green blue end struct

function validPoint(point) return point!=void and len(point)==3 end function

function item(classname,origin)
  if len(classname)==0 then return error(7500,"item marker needs a classname") end if
  if not validPoint(origin) then return error(7501,"item marker needs a three-component origin") end if
  return ItemMarker(classname,[numeric.f32(origin[0]),numeric.f32(origin[1]),numeric.f32(origin[2])],true)
end function

function category(classname)
  lower=strings.toLowerAscii(classname)
  if strings.startsWith(lower,"item_health") then return ITEM_HEALTH end if
  if strings.startsWith(lower,"item_armor") then return ITEM_ARMOR end if
  if strings.startsWith(lower,"weapon_") then return ITEM_WEAPON end if
  if strings.startsWith(lower,"ammo_") then return ITEM_AMMO end if
  if strings.startsWith(lower,"item_quad") or strings.startsWith(lower,"item_enviro") or strings.startsWith(lower,"item_haste") or strings.startsWith(lower,"item_invis") or strings.startsWith(lower,"item_regen") or strings.startsWith(lower,"item_flight") then return ITEM_POWERUP end if
  if strings.startsWith(lower,"holdable_") then return ITEM_HOLDABLE end if
  if strings.startsWith(lower,"team_") then return ITEM_TEAM end if
  return ITEM_UNKNOWN
end function

function color(itemCategory,classname)
  if itemCategory==ITEM_HEALTH then return [72,255,96] end if
  if itemCategory==ITEM_ARMOR then return [80,180,255] end if
  if itemCategory==ITEM_WEAPON then return [255,132,48] end if
  if itemCategory==ITEM_AMMO then return [255,220,64] end if
  if itemCategory==ITEM_POWERUP then return [220,72,255] end if
  if itemCategory==ITEM_HOLDABLE then return [240,240,240] end if
  if itemCategory==ITEM_TEAM then
    lower=strings.toLowerAscii(classname)
    if strings.contains(lower,"red") then return [255,48,48] end if
    if strings.contains(lower,"blue") then return [48,112,255] end if
    return [255,255,255]
  end if
  return [180,180,180]
end function

function shot(startPoint,impactPoint,nowMilliseconds,durationMilliseconds)
  if not validPoint(startPoint) or not validPoint(impactPoint) then return error(7502,"shot effect needs two three-component points") end if
  if durationMilliseconds<=0 or durationMilliseconds>MAX_EFFECT_MILLISECONDS then return error(7503,"shot effect duration is outside preview bounds") end if
  return ShotEffect(startPoint,impactPoint,nowMilliseconds,nowMilliseconds+durationMilliseconds)
end function

function defaultShot(startPoint,impactPoint,nowMilliseconds)
  return shot(startPoint,impactPoint,nowMilliseconds,DEFAULT_EFFECT_MILLISECONDS)
end function

function alive(effect,nowMilliseconds)
  return effect!=void and nowMilliseconds>=effect.bornAt and nowMilliseconds<effect.expiresAt
end function

function command(a,b,rgb)
  return LineCommand(a,b,rgb[0],rgb[1],rgb[2])
end function

function screenPoint(x,y,depth) return viewer.ScreenPoint(x,y,depth) end function

function billboardSize(depth)
  size=numeric.trunc32(190.0/depth)
  if size<4 then return 4 end if
  if size>18 then return 18 end if
  return size
end function

function itemLines(camera,marker,width,height,horizontalFovDegrees,nearDistance)
  if marker==void or not marker.active then return [] end if
  center=viewer.projectPoint(camera,marker.origin,width,height,horizontalFovDegrees,nearDistance)
  if center==void then return [] end if
  kind=category(marker.classname);rgb=color(kind,marker.classname);size=billboardSize(center.depth)
  x=center.x;y=center.y;d=center.depth
  left=screenPoint(x-size,y,d);right=screenPoint(x+size,y,d);top=screenPoint(x,y-size,d);bottom=screenPoint(x,y+size,d)
  lines=[]
  if kind==ITEM_HEALTH then
    lines=lines+[command(left,right,rgb),command(top,bottom,rgb)]
    lines=lines+[command(screenPoint(x-size/2,y-size/2,d),screenPoint(x+size/2,y-size/2,d),rgb),command(screenPoint(x-size/2,y+size/2,d),screenPoint(x+size/2,y+size/2,d),rgb)]
  else if kind==ITEM_ARMOR or kind==ITEM_POWERUP or kind==ITEM_TEAM then
    lines=lines+[command(top,right,rgb),command(right,bottom,rgb),command(bottom,left,rgb),command(left,top,rgb)]
    if kind==ITEM_POWERUP then lines=lines+[command(left,right,rgb),command(top,bottom,rgb)] end if
  else
    a=screenPoint(x-size,y-size,d);b=screenPoint(x+size,y-size,d);c=screenPoint(x+size,y+size,d);e=screenPoint(x-size,y+size,d)
    lines=lines+[command(a,b,rgb),command(b,c,rgb),command(c,e,rgb),command(e,a,rgb)]
    if kind==ITEM_WEAPON then lines=lines+[command(left,right,rgb)] end if
    if kind==ITEM_AMMO then lines=lines+[command(a,c,rgb),command(b,e,rgb)] end if
  end if
  return lines
end function

function effectColor(effect,nowMilliseconds)
  remaining=effect.expiresAt-nowMilliseconds;span=effect.expiresAt-effect.bornAt
  intensity=64+numeric.trunc32(191.0*remaining/span)
  if intensity<64 then intensity=64 end if
  if intensity>255 then intensity=255 end if
  return [255,intensity,numeric.trunc32(intensity/3)]
end function

function effectLines(camera,effect,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance)
  if not alive(effect,nowMilliseconds) then return [] end if
  rgb=effectColor(effect,nowMilliseconds);lines=[]
  trace=viewer.projectLine(camera,effect.startPoint,effect.impactPoint,width,height,horizontalFovDegrees,nearDistance)
  if trace.visible then lines=lines+[command(trace.a,trace.b,rgb)] end if
  p=effect.impactPoint;radius=4.0
  axes=[[[p[0]-radius,p[1],p[2]],[p[0]+radius,p[1],p[2]]],[[p[0],p[1]-radius,p[2]],[p[0],p[1]+radius,p[2]]],[[p[0],p[1],p[2]-radius],[p[0],p[1],p[2]+radius]]]
  for each axis in axes
    cross=viewer.projectLine(camera,axis[0],axis[1],width,height,horizontalFovDegrees,nearDistance)
    if cross.visible then lines=lines+[command(cross.a,cross.b,rgb)] end if
  end for
  return lines
end function

function liveEffects(effects,nowMilliseconds)
  result=[]
  for each effect in effects if alive(effect,nowMilliseconds) then result=result+[effect] end if end for
  return result
end function

function frameLines(camera,items,effects,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance)
  result=[]
  for each marker in items result=result+itemLines(camera,marker,width,height,horizontalFovDegrees,nearDistance) end for
  for each effect in effects result=result+effectLines(camera,effect,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for
  return result
end function

// Effects-only pass used when pickups are represented by their retail MD3
// assets. Keeping it separate prevents the old diagnostic item glyphs from
// leaking into the finished scene while preserving the useful shot feedback.
function shotFrameLines(camera,effects,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance)
  result=[]
  for each effect in effects result=result+effectLines(camera,effect,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for
  return result
end function

function draw(lines)
  for each entry in lines window.drawLine(entry.a,entry.b,entry.red,entry.green,entry.blue) end for
  return len(lines)
end function
