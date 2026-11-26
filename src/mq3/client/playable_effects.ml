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

/// Stores playable effects item marker record, including `classname`, `origin`, `active`.
struct ItemMarker classname origin active end struct
/// Stores playable effects shot effect record, including `startPoint`, `impactPoint`, `bornAt`, `expiresAt`, `key`, `classname` and additional values.
struct ShotEffect startPoint impactPoint bornAt expiresAt key classname normal worldHit end struct
/// Stores playable effects line command record, including `a`, `b`, `red`, `green`, `blue`.
struct LineCommand a b red green blue end struct

/// Computes `point!=void and len(point)==3` for playable effects `validPoint`.
/// @param point Sequence whose length/content is inspected by `validPoint`.
function validPoint(point) return point!=void and len(point)==3 end function

/// Calls `mq3.client.playable_effects.validPoint`, `mq3.client.playable_effects.ItemMarker`, `mq3.compat.numeric.f32` from playable effects `item`. The final path returns `ItemMarker(classname,[numeric.f32(origin[0]),numeric.f32(origin[1]),numeric.f32(origin[2])],true)`.
/// @param classname Sequence whose length/content is inspected by `item`.
/// @param origin World-space origin of the entity, sound or rendered effect.
function item(classname,origin)
  if len(classname)==0 then return error(7500,"item marker needs a classname") end if
  if not validPoint(origin) then return error(7501,"item marker needs a three-component origin") end if
  return ItemMarker(classname,[numeric.f32(origin[0]),numeric.f32(origin[1]),numeric.f32(origin[2])],true)
end function

/// Calls `std.string.toLowerAscii`, `std.string.startsWith` from playable effects `category`. The final path returns `ITEM_UNKNOWN`.
/// @param classname Value used by `lower=strings.toLowerAscii(classname)`.
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

/// Calls `std.string.toLowerAscii`, `std.string.contains` from playable effects `color`. The final path returns `[180,180,180]`.
/// @param itemCategory Value used by `if itemCategory==ITEM_HEALTH then return [72,255,96] end if`.
/// @param classname Value used by `lower=strings.toLowerAscii(classname)`.
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

/// Calls `mq3.client.playable_effects.validPoint`, `mq3.client.playable_effects.ShotEffect` from playable effects `shot`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param impactPoint Value used by `if not validPoint(startPoint) or not validPoint(impactPoint) then return error(7502,"shot effect needs two three-component points") end if`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param durationMilliseconds Value used by `if durationMilliseconds<=0 or durationMilliseconds>MAX_EFFECT_MILLISECONDS then return error(7503,"shot effect duration is outside preview bou...`.
function shot(startPoint,impactPoint,nowMilliseconds,durationMilliseconds)
  if not validPoint(startPoint) or not validPoint(impactPoint) then return error(7502,"shot effect needs two three-component points") end if
  if durationMilliseconds<=0 or durationMilliseconds>MAX_EFFECT_MILLISECONDS then return error(7503,"shot effect duration is outside preview bounds") end if
  return ShotEffect(startPoint,impactPoint,nowMilliseconds,nowMilliseconds+durationMilliseconds,nowMilliseconds,"",[0.0,0.0,0.0],false)
end function

/// Calls `mq3.client.playable_effects.defaultShot` from playable effects `weaponShot`. The final path returns `value`.
/// @param key Value assigned to `value.key`.
/// @param classname Value assigned to `value.classname`.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param impactPoint Value used by `value=defaultShot(startPoint,impactPoint,nowMilliseconds)`.
/// @param normal Surface-normal vector used to orient or offset the effect.
/// @param worldHit Value assigned to `value.worldHit`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function weaponShot(key,classname,startPoint,impactPoint,normal,worldHit,nowMilliseconds)
  value=defaultShot(startPoint,impactPoint,nowMilliseconds);if value is error then return value end if
  value.key=key;value.classname=classname;value.normal=normal;value.worldHit=worldHit;return value
end function

/// Adapts `mq3.client.playable_effects.shot` to playable effects `defaultShot`, returning its result for `startPoint, impactPoint, nowMilliseconds, DEFAULT_EFFECT_MILLISECONDS`.
/// @param startPoint Starting world-space point of the segment or trace. Forwarded to `mq3.client.playable_effects.shot`.
/// @param impactPoint Argument 2 of `mq3.client.playable_effects.shot`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds. Forwarded to `mq3.client.playable_effects.shot`.
function defaultShot(startPoint,impactPoint,nowMilliseconds)
  return shot(startPoint,impactPoint,nowMilliseconds,DEFAULT_EFFECT_MILLISECONDS)
end function

/// Computes `effect!=void and nowMilliseconds>=effect.bornAt and nowMilliseconds<effect.expiresAt` for playable effects `alive`.
/// @param effect Record read through `effect.bornAt`, `effect.expiresAt`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function alive(effect,nowMilliseconds)
  return effect!=void and nowMilliseconds>=effect.bornAt and nowMilliseconds<effect.expiresAt
end function

/// Creates a `mq3.client.playable_effects.LineCommand` record. Assigns `a` from `a`, `b` from `b`.
/// @param a Value used to initialize `LineCommand.a`.
/// @param b Value used to initialize `LineCommand.b`.
/// @param rgb Value used to initialize `LineCommand.red`, `LineCommand.green`, `LineCommand.blue`.
function command(a,b,rgb)
  return LineCommand(a,b,rgb[0],rgb[1],rgb[2])
end function

/// Adapts `mq3.client.playable_viewer.ScreenPoint` to playable effects `screenPoint`, returning its result for `x, y, depth`.
/// @param x Argument 1 of `mq3.client.playable_viewer.ScreenPoint`.
/// @param y Argument 2 of `mq3.client.playable_viewer.ScreenPoint`.
/// @param depth Argument 3 of `mq3.client.playable_viewer.ScreenPoint`.
function screenPoint(x,y,depth) return viewer.ScreenPoint(x,y,depth) end function

/// Calls `mq3.compat.numeric.trunc32` from playable effects `billboardSize`. The final path returns `size`.
/// @param depth Value used by `size=numeric.trunc32(190.0/depth)`.
function billboardSize(depth)
  size=numeric.trunc32(190.0/depth)
  if size<4 then return 4 end if
  if size>18 then return 18 end if
  return size
end function

/// Calls `mq3.client.playable_viewer.projectPoint`, `mq3.client.playable_effects.category`, `mq3.client.playable_effects.color` and additional helpers from playable effects `itemLines`. The final path returns `lines`.
/// @param camera Camera state used to transform/project the scene.
/// @param marker Record read through `marker.active`, `marker.origin`, `marker.classname`.
/// @param width Width in the coordinate space used by `itemLines`.
/// @param height Height in the coordinate space used by `itemLines`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
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

/// Calls `mq3.compat.numeric.trunc32` from playable effects `effectColor`. The final path returns `[255,intensity,numeric.trunc32(intensity/3)]`.
/// @param effect Record read through `effect.expiresAt`, `effect.bornAt`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function effectColor(effect,nowMilliseconds)
  remaining=effect.expiresAt-nowMilliseconds;span=effect.expiresAt-effect.bornAt
  intensity=64+numeric.trunc32(191.0*remaining/span)
  if intensity<64 then intensity=64 end if
  if intensity>255 then intensity=255 end if
  return [255,intensity,numeric.trunc32(intensity/3)]
end function

/// Calls `mq3.client.playable_effects.alive`, `mq3.client.playable_effects.effectColor`, `mq3.client.playable_viewer.projectLine` and additional helpers from playable effects `effectLines`. The final path returns `lines`.
/// @param camera Camera state used to transform/project the scene.
/// @param effect Record read through `effect.startPoint`, `effect.impactPoint`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param width Width in the coordinate space used by `effectLines`.
/// @param height Height in the coordinate space used by `effectLines`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
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

/// Calls `mq3.client.playable_effects.alive` from playable effects `liveEffects`. The final path returns `result`.
/// @param effects Value used by `for each effect in effects if alive(effect,nowMilliseconds) then result=result+[effect] end if end for`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function liveEffects(effects,nowMilliseconds)
  result=[]
  for each effect in effects if alive(effect,nowMilliseconds) then result=result+[effect] end if end for
  return result
end function

/// Calls `mq3.client.playable_effects.itemLines`, `mq3.client.playable_effects.effectLines` from playable effects `frameLines`. The final path returns `result`.
/// @param camera Camera state used to transform/project the scene.
/// @param items Value used by `for each marker in items result=result+itemLines(camera,marker,width,height,horizontalFovDegrees,nearDistance) end for`.
/// @param effects Value used by `for each effect in effects result=result+effectLines(camera,effect,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param width Width in the coordinate space used by `frameLines`.
/// @param height Height in the coordinate space used by `frameLines`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
function frameLines(camera,items,effects,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance)
  result=[]
  for each marker in items result=result+itemLines(camera,marker,width,height,horizontalFovDegrees,nearDistance) end for
  for each effect in effects result=result+effectLines(camera,effect,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for
  return result
end function

// Effects-only pass used when pickups are represented by their retail MD3
// assets. Keeping it separate prevents the old diagnostic item glyphs from
// leaking into the finished scene while preserving the useful shot feedback.
/// @param camera Camera state used to transform/project the scene.
/// @param effects Value used by `for each effect in effects result=result+effectLines(camera,effect,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param width Width in the coordinate space used by `shotFrameLines`.
/// @param height Height in the coordinate space used by `shotFrameLines`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
function shotFrameLines(camera,effects,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance)
  result=[]
  for each effect in effects result=result+effectLines(camera,effect,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for
  return result
end function

/// Calls `mq3.platform.playable_window.drawLine` from playable effects `draw`. The final path returns `len(lines)`.
/// @param lines Sequence whose length/content is inspected by `draw`.
function draw(lines)
  for each entry in lines window.drawLine(entry.a,entry.b,entry.red,entry.green,entry.blue) end for
  return len(lines)
end function
