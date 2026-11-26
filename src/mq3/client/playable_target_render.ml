// SPDX-License-Identifier: GPL-2.0-or-later
// Camera-projected player silhouettes for the local playable preview.
package mq3.client.playable_target_render

import mq3.client.playable_viewer as viewer
import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric

/// Fallback max health setting used when constructing the native client simulation or effect
/// configuration.
const DEFAULT_MAX_HEALTH=100
/// Default respawn duration in milliseconds when the caller supplies no override.
const DEFAULT_RESPAWN_MILLISECONDS=3000
/// Default hit flash duration in milliseconds when the caller supplies no override.
const DEFAULT_HIT_FLASH_MILLISECONDS=120

/// Stores playable target render preview target record, including `origin`, `health`, `maxHealth`, `alive`, `respawnAt`, `hitFlashUntil`.
struct PreviewTarget
  /// World-space location at which the enemy target model is drawn.
  origin
  /// Preview target health used to compute its health fraction and rendered alive state.
  health
  /// When constructing this record, `target` supplies `maxHealth` for this member.
  maxHealth
  /// True while the simulated player or target remains alive and can participate in gameplay.
  alive
  /// Client simulation timestamp at which the entity becomes eligible to respawn.
  respawnAt
  /// When constructing this record, `target` supplies `0` for this member.
  hitFlashUntil
end struct
/// Stores playable target render line command record, including `a`, `b`, `red`, `green`, `blue`.
struct LineCommand
  /// Alpha component controlling opacity or blending.
  a
  /// Blue component of the stored color.
  b
  /// Red color component used by this drawing or effect record.
  red
  /// Green color component used by this drawing or effect record.
  green
  /// Blue color component used by this drawing or effect record.
  blue
end struct

/// Computes `point!=void and len(point)==3` for playable target render `validPoint`.
/// @param point Sequence whose length/content is inspected by `validPoint`.
function validPoint(point) return point!=void and len(point)==3 end function
/// Adapts `mq3.client.playable_viewer.ScreenPoint` to playable target render `point`, returning its result for `x, y, depth`.
/// @param x Argument 1 of `mq3.client.playable_viewer.ScreenPoint`.
/// @param y Argument 2 of `mq3.client.playable_viewer.ScreenPoint`.
/// @param depth Argument 3 of `mq3.client.playable_viewer.ScreenPoint`.
function point(x,y,depth) return viewer.ScreenPoint(x,y,depth) end function
/// Creates a `mq3.client.playable_target_render.LineCommand` record. Assigns `a` from `a`, `b` from `b`.
/// @param a Value used to initialize `LineCommand.a`.
/// @param b Value used to initialize `LineCommand.b`.
/// @param rgb Value used to initialize `LineCommand.red`, `LineCommand.green`, `LineCommand.blue`.
function line(a,b,rgb) return LineCommand(a,b,rgb[0],rgb[1],rgb[2]) end function

/// Calls `mq3.client.playable_target_render.validPoint`, `mq3.client.playable_target_render.PreviewTarget`, `mq3.compat.numeric.f32` from playable target render `target`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param health Value used by `value=health`.
/// @param maxHealth Value used by `if maxHealth<=0 then return error(7531,"preview target maximum health must be positive") end if`.
function target(origin,health,maxHealth)
  if not validPoint(origin) then return error(7530,"preview target needs a three-component origin") end if
  if maxHealth<=0 then return error(7531,"preview target maximum health must be positive") end if
  value=health;if value<0 then value=0 end if;if value>maxHealth then value=maxHealth end if
  return PreviewTarget([numeric.f32(origin[0]),numeric.f32(origin[1]),numeric.f32(origin[2])],value,maxHealth,value>0,0,0)
end function

/// Calls `mq3.compat.numeric.fdiv`, `mq3.compat.numeric.f32` from playable target render `healthFraction`. The final path returns `numeric.fdiv(numeric.f32(value.health),numeric.f32(value.maxHealth))`.
/// @param value Record read through `value.maxHealth`, `value.health`.
function healthFraction(value)
  if value==void or value.maxHealth<=0 or value.health<=0 then return 0.0 end if
  if value.health>=value.maxHealth then return 1.0 end if
  return numeric.fdiv(numeric.f32(value.health),numeric.f32(value.maxHealth))
end function

/// Evaluates playable target render `respawnRemaining` and returns `0`, `value.respawnAt-nowMilliseconds` according to its guard/selection conditions.
/// @param value Record read through `value.alive`, `value.respawnAt`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function respawnRemaining(value,nowMilliseconds)
  if value==void or value.alive or value.respawnAt<=nowMilliseconds then return 0 end if
  return value.respawnAt-nowMilliseconds
end function

/// Updates `value.health`, `value.hitFlashUntil`, `value.alive`, `value.respawnAt` during playable target render `hit`.
/// @param value Mutable playable target render record/storage; this routine assigns `value.health`, `value.hitFlashUntil`, `value.alive`, `value.respawnAt`.
/// @param damage Value used by `if damage<0 then return error(7533,"hit damage cannot be negative") end if`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function hit(value,damage,nowMilliseconds)
  if value==void then return error(7532,"hit needs a preview target") end if
  if damage<0 then return error(7533,"hit damage cannot be negative") end if
  if not value.alive then return false end if
  value.health=value.health-damage
  value.hitFlashUntil=nowMilliseconds+DEFAULT_HIT_FLASH_MILLISECONDS
  if value.health<=0 then
    value.health=0;value.alive=false;value.respawnAt=nowMilliseconds+DEFAULT_RESPAWN_MILLISECONDS
  end if
  return true
end function

/// Updates `value.health`, `value.alive`, `value.respawnAt`, `value.hitFlashUntil` during playable target render `update`.
/// @param value Mutable playable target render record/storage; this routine assigns `value.health`, `value.alive`, `value.respawnAt`, `value.hitFlashUntil`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function update(value,nowMilliseconds)
  if value==void then return error(7534,"update needs a preview target") end if
  if not value.alive and value.respawnAt>0 and nowMilliseconds>=value.respawnAt then
    value.health=value.maxHealth;value.alive=true;value.respawnAt=0;value.hitFlashUntil=0
    return true
  end if
  return false
end function

/// Calls `mq3.client.playable_target_render.healthFraction` from playable target render `bodyColor`. The final path returns `[80,176,255]`.
/// @param value Record read through `value.alive`, `value.respawnAt`, `value.hitFlashUntil`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function bodyColor(value,nowMilliseconds)
  if not value.alive then
    if value.respawnAt>0 and nowMilliseconds>=value.respawnAt then return [96,255,128] end if
    return [96,96,104]
  end if
  if nowMilliseconds<value.hitFlashUntil then return [255,255,255] end if
  fraction=healthFraction(value)
  if fraction<=0.25 then return [255,48,32] end if
  if fraction<=0.5 then return [255,144,40] end if
  return [80,176,255]
end function

/// Calls `mq3.compat.numeric.trunc32` from playable target render `clampWidth`. The final path returns `result`.
/// @param value Value used by `result=numeric.trunc32(value)`.
function clampWidth(value)
  result=numeric.trunc32(value)
  if result<4 then return 4 end if
  if result>24 then return 24 end if
  return result
end function

/// Tests projected head/feet against the viewport with 64-pixel horizontal and 96-pixel vertical margins.
/// @param feet Record read through `feet.x`, `feet.y`.
/// @param head Record read through `head.x`, `head.y`.
/// @param width Width in the coordinate space used by `visibleBounds`.
/// @param height Height in the coordinate space used by `visibleBounds`.
function visibleBounds(feet,head,width,height)
  if feet.x < -64 and head.x < -64 then return false end if
  if feet.x > width+64 and head.x > width+64 then return false end if
  if feet.y < -96 and head.y < -96 then return false end if
  if feet.y > height+96 and head.y > height+96 then return false end if
  return true
end function

/// Calls `mq3.client.playable_target_render.bodyColor`, `mq3.client.playable_target_render.clampWidth`, `mq3.client.playable_target_render.point` and additional helpers from playable target render `deadLines`. The final path returns `result`.
/// @param feet Record read through `feet.x`, `feet.y`, `feet.depth`.
/// @param head Record read through `head.x`, `head.y`.
/// @param value Record read through `value.respawnAt`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function deadLines(feet,head,value,nowMilliseconds)
  rgb=bodyColor(value,nowMilliseconds);cx=(feet.x+head.x)/2;cy=(feet.y+head.y)/2;d=feet.depth
  size=clampWidth((feet.y-head.y)*0.22)
  a=point(cx-size,cy-size,d);b=point(cx+size,cy-size,d);c=point(cx+size,cy+size,d);e=point(cx-size,cy+size,d)
  result=[line(a,c,rgb),line(b,e,rgb)]
  if value.respawnAt>0 then result=result+[line(a,b,rgb),line(b,c,rgb),line(c,e,rgb),line(e,a,rgb)] end if
  return result
end function

/// Calls `mq3.client.playable_target_render.bodyColor`, `mq3.client.playable_target_render.clampWidth`, `mq3.client.playable_target_render.point` and additional helpers from playable target render `aliveLines`. The final path returns `result`.
/// @param feet Record read through `feet.y`, `feet.x`.
/// @param hips Record read through `hips.x`, `hips.y`.
/// @param chest Record read through `chest.depth`, `chest.x`, `chest.y`.
/// @param head Record read through `head.y`, `head.x`.
/// @param value Value tested by `healthFraction(value)<=0.5`, `healthFraction(value)<=0.25` before the calculation continues.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
function aliveLines(feet,hips,chest,head,value,nowMilliseconds)
  rgb=bodyColor(value,nowMilliseconds);d=chest.depth
  bodyHeight=feet.y-head.y;if bodyHeight<0 then bodyHeight=0-bodyHeight end if
  shoulder=clampWidth(bodyHeight*0.22);headRadius=clampWidth(bodyHeight*0.1)
  headTop=point(head.x,head.y-headRadius,d);headRight=point(head.x+headRadius,head.y,d)
  headBottom=point(head.x,head.y+headRadius,d);headLeft=point(head.x-headRadius,head.y,d)
  leftShoulder=point(chest.x-shoulder,chest.y,d);rightShoulder=point(chest.x+shoulder,chest.y,d)
  leftHand=point(hips.x-shoulder,hips.y,d);rightHand=point(hips.x+shoulder,hips.y,d)
  leftFoot=point(feet.x-shoulder/2,feet.y,d);rightFoot=point(feet.x+shoulder/2,feet.y,d)
  result=[line(headTop,headRight,rgb),line(headRight,headBottom,rgb),line(headBottom,headLeft,rgb),line(headLeft,headTop,rgb)]
  result=result+[line(leftShoulder,rightShoulder,rgb),line(leftShoulder,leftHand,rgb),line(rightShoulder,rightHand,rgb)]
  result=result+[line(chest,hips,rgb),line(hips,leftFoot,rgb),line(hips,rightFoot,rgb)]
  barY=head.y-headRadius-5;barLeft=head.x-shoulder;barRight=head.x+shoulder
  dark=[28,28,32];result=result+[line(point(barLeft,barY,d),point(barRight,barY,d),dark)]
  fill=barLeft+(barRight-barLeft)*healthFraction(value)
  healthRgb=[64,255,80];if healthFraction(value)<=0.5 then healthRgb=[255,176,48] end if;if healthFraction(value)<=0.25 then healthRgb=[255,48,32] end if
  result=result+[line(point(barLeft,barY-1,d),point(fill,barY-1,d),healthRgb)]
  return result
end function

/// Calls `mq3.client.playable_target_render.validPoint`, `mq3.client.playable_viewer.projectPoint`, `mq3.client.playable_target_render.visibleBounds` and additional helpers from playable target render `targetLines`. The final path returns `aliveLines(feet,hips,chest,head,value,nowMilliseconds)`.
/// @param camera Camera state used to transform/project the scene.
/// @param value Record read through `value.origin`, `value.alive`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param width Width in the coordinate space used by `targetLines`.
/// @param height Height in the coordinate space used by `targetLines`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
function targetLines(camera,value,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance)
  if value==void or not validPoint(value.origin) then return [] end if
  origin=value.origin
  feet=viewer.projectPoint(camera,[origin[0],origin[1],origin[2]+2.0],width,height,horizontalFovDegrees,nearDistance)
  head=viewer.projectPoint(camera,[origin[0],origin[1],origin[2]+56.0],width,height,horizontalFovDegrees,nearDistance)
  if feet==void or head==void or not visibleBounds(feet,head,width,height) then return [] end if
  if not value.alive then return deadLines(feet,head,value,nowMilliseconds) end if
  hips=viewer.projectPoint(camera,[origin[0],origin[1],origin[2]+22.0],width,height,horizontalFovDegrees,nearDistance)
  chest=viewer.projectPoint(camera,[origin[0],origin[1],origin[2]+42.0],width,height,horizontalFovDegrees,nearDistance)
  if hips==void or chest==void then return [] end if
  return aliveLines(feet,hips,chest,head,value,nowMilliseconds)
end function

/// Calls `mq3.client.playable_target_render.targetLines` from playable target render `frameLines`. The final path returns `result`.
/// @param camera Camera state used to transform/project the scene.
/// @param targets Value used by `for each value in targets result=result+targetLines(camera,value,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for`.
/// @param nowMilliseconds Current monotonic/frame clock in milliseconds.
/// @param width Width in the coordinate space used by `frameLines`.
/// @param height Height in the coordinate space used by `frameLines`.
/// @param horizontalFovDegrees Horizontal camera field of view in degrees.
/// @param nearDistance Distance from the camera to the near clipping plane.
function frameLines(camera,targets,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance)
  result=[]
  for each value in targets result=result+targetLines(camera,value,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for
  return result
end function

/// Calls `mq3.platform.playable_window.drawLine` from playable target render `draw`. The final path returns `len(lines)`.
/// @param lines Sequence whose length/content is inspected by `draw`.
function draw(lines)
  for each entry in lines window.drawLine(entry.a,entry.b,entry.red,entry.green,entry.blue) end for
  return len(lines)
end function
