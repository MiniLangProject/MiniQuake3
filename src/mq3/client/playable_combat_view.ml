// SPDX-License-Identifier: GPL-2.0-or-later
// First-person weapon silhouette and short-lived combat feedback for the preview.
package mq3.client.playable_combat_view

import mq3.platform.playable_window as window
import mq3.client.playable_hud as hud
import mq3.compat.numeric as numeric

/// Duration or timeout in milliseconds controlling fire flash.
const FIRE_FLASH_MS=90
/// Duration or timeout in milliseconds controlling recoil.
const RECOIL_MS=180
/// Duration or timeout in milliseconds controlling hit mark.
const HIT_MARK_MS=160
/// Duration or timeout in milliseconds controlling damage mark.
const DAMAGE_MARK_MS=350
/// Duration or timeout in milliseconds controlling kill mark.
const KILL_MARK_MS=900

/// Stores playable combat view combat view record, including `weaponName`, `score`, `kills`, `deaths`, `shots`, `hits` and additional values.
struct CombatView
  /// When constructing this record, `state` supplies `weaponName` for this member.
  weaponName
  /// Current combat score exposed to the playable presentation layer.
  score
  /// Recorded kills displayed beside the death count in the combat overlay.
  kills
  /// Recorded player deaths displayed beside the kill count in the combat overlay.
  deaths
  /// Number of firing events recorded by the combat-feedback tracker.
  shots
  /// Number of successful hit notifications recorded by the combat-feedback tracker.
  hits
  /// When constructing this record, `state` supplies `-1000000` for this member.
  lastFire
  /// When constructing this record, `state` supplies `-1000000` for this member.
  lastHit
  /// When constructing this record, `state` supplies `-1000000` for this member.
  lastDamage
  /// When constructing this record, `state` supplies `-1000000` for this member.
  lastKill
  /// Nonnegative damage from the latest damage event, shown by the temporary damage indicator.
  damageAmount
  /// Signed side of the latest incoming damage: negative for left, positive for right, and zero for an
  /// unspecified side.
  damageSide
end struct
/// Stores playable combat view combat pulse record, including `recoil`, `muzzle`, `hit`, `damage`, `kill`.
struct CombatPulse
  /// When constructing this record, `pulse` supplies `remaining(now,view.lastFire,RECOIL_MS)` for this
  /// member.
  recoil
  /// When constructing this record, `pulse` supplies `remaining(now,view.lastFire,FIRE_FLASH_MS)` for
  /// this member.
  muzzle
  /// When constructing this record, `pulse` supplies `remaining(now,view.lastHit,HIT_MARK_MS)` for this
  /// member.
  hit
  /// Damage amount applied or reported by the weapon, projectile, or hit result.
  damage
  /// When constructing this record, `pulse` supplies `remaining(now,view.lastKill,KILL_MARK_MS)` for
  /// this member.
  kill
end struct
/// Stores playable combat view combat layout record, including `centerX`, `centerY`, `weaponX`, `weaponY`, `weaponWidth`, `weaponHeight`.
struct CombatLayout
  /// When constructing this record, `layout` supplies `width/2` for this member.
  centerX
  /// When constructing this record, `layout` supplies `height/2` for this member.
  centerY
  /// When constructing this record, `layout` supplies `width/2-weaponWidth/2` for this member.
  weaponX
  /// When constructing this record, `layout` supplies `height-weaponHeight` for this member.
  weaponY
  /// When constructing this record, `layout` supplies `weaponWidth` for this member.
  weaponWidth
  /// When constructing this record, `layout` supplies `weaponHeight` for this member.
  weaponHeight
end struct

/// Calls `mq3.client.playable_combat_view.CombatView` from playable combat view `state`. The final path returns `CombatView(weaponName,0,0,0,0,0,-1000000,-1000000,-1000000,-1000000,0,0)`.
/// @param weaponName Sequence whose length/content is inspected by `state`.
function state(weaponName)
  if len(weaponName)==0 then weaponName="MACHINEGUN" end if
  return CombatView(weaponName,0,0,0,0,0,-1000000,-1000000,-1000000,-1000000,0,0)
end function

/// Evaluates playable combat view `clampNonnegative` and returns `0`, `value` according to its guard/selection conditions.
/// @param value Value tested by `value<0` before the calculation continues.
function clampNonnegative(value) if value<0 then return 0 end if;return value end function

/// Updates `view.score` during playable combat view `setScore`.
/// @param view Mutable playable combat view record/storage; this routine assigns `view.score`.
/// @param value Value assigned to `view.score`.
function setScore(view,value)
  if view==void then return error(7540,"combat view state is required") end if
  view.score=value;return void
end function

/// Updates `view.lastFire`, `view.shots` during playable combat view `fire`.
/// @param view Mutable playable combat view record/storage; this routine assigns `view.lastFire`, `view.shots`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function fire(view,now)
  if view==void then return error(7541,"combat view state is required") end if
  view.lastFire=now;view.shots=view.shots+1;return void
end function

/// Updates `view.lastHit`, `view.hits` during playable combat view `registerHit`.
/// @param view Mutable playable combat view record/storage; this routine assigns `view.lastHit`, `view.hits`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function registerHit(view,now)
  if view==void then return error(7542,"combat view state is required") end if
  view.lastHit=now;view.hits=view.hits+1;return void
end function

/// Updates `view.lastDamage`, `view.damageAmount`, `view.damageSide` during playable combat view `takeDamage`.
/// @param view Mutable playable combat view record/storage; this routine assigns `view.lastDamage`, `view.damageAmount`, `view.damageSide`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param amount Value used by `view.damageAmount=clampNonnegative(amount)`.
/// @param side Value used by `if side<0 then view.damageSide=-1 end if`.
function takeDamage(view,now,amount,side)
  if view==void then return error(7543,"combat view state is required") end if
  view.lastDamage=now;view.damageAmount=clampNonnegative(amount)
  view.damageSide=0;if side<0 then view.damageSide=-1 end if;if side>0 then view.damageSide=1 end if
  return void
end function

/// Updates `view.lastKill`, `view.kills`, `view.score` during playable combat view `registerKill`.
/// @param view Mutable playable combat view record/storage; this routine assigns `view.lastKill`, `view.kills`, `view.score`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param score Value assigned to `view.score`.
function registerKill(view,now,score)
  if view==void then return error(7544,"combat view state is required") end if
  view.lastKill=now;view.kills=view.kills+1;view.score=score;return void
end function

/// Updates `view.deaths` during playable combat view `registerDeath`.
/// @param view Mutable playable combat view record/storage; this routine assigns `view.deaths`.
function registerDeath(view)
  if view==void then return error(7545,"combat view state is required") end if
  view.deaths=view.deaths+1;return void
end function

/// Evaluates playable combat view `remaining` and returns `0`, `((duration-elapsed)*1000)/duration` according to its guard/selection conditions.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param start Value used by `elapsed=now-start`.
/// @param duration Lifetime or interval in the same units as this operation's clock.
function remaining(now,start,duration)
  elapsed=now-start
  if elapsed<0 or elapsed>=duration then return 0 end if
  return ((duration-elapsed)*1000)/duration
end function

/// Calls `mq3.client.playable_combat_view.CombatPulse`, `mq3.client.playable_combat_view.remaining` from playable combat view `pulse`.
/// @param view Record read through `view.lastFire`, `view.lastHit`, `view.lastDamage`, `view.lastKill`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function pulse(view,now)
  if view==void then return error(7546,"combat view state is required") end if
  return CombatPulse(remaining(now,view.lastFire,RECOIL_MS),remaining(now,view.lastFire,FIRE_FLASH_MS),remaining(now,view.lastHit,HIT_MARK_MS),remaining(now,view.lastDamage,DAMAGE_MARK_MS),remaining(now,view.lastKill,KILL_MARK_MS))
end function

/// Calls `mq3.client.playable_combat_view.CombatLayout` from playable combat view `layout`. The final path returns `CombatLayout(width/2,height/2,width/2-weaponWidth/2,height-weaponHeight,weaponWidth,weaponHeight)`.
/// @param width Width in the coordinate space used by `layout`.
/// @param height Height in the coordinate space used by `layout`.
function layout(width,height)
  if width<320 or height<200 then return error(7547,"combat view surface is too small") end if
  weaponWidth=width/5;if weaponWidth>210 then weaponWidth=210 end if
  weaponHeight=height/3;if weaponHeight>220 then weaponHeight=220 end if
  return CombatLayout(width/2,height/2,width/2-weaponWidth/2,height-weaponHeight,weaponWidth,weaponHeight)
end function

/// Calls `mq3.platform.playable_window.lineNative`, `mq3.compat.numeric.trunc32` from playable combat view `line`.
/// @param x0 Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`.
/// @param y0 Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`.
/// @param x1 Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`.
/// @param y1 Value used by `window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function line(x0,y0,x1,y1,red,green,blue)
  window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)
  return void
end function

/// Calls `mq3.client.playable_combat_view.line` from playable combat view `drawWeapon`.
/// @param placement Record read through `placement.weaponX`, `placement.weaponY`, `placement.weaponWidth`, `placement.weaponHeight`.
/// @param recoil Value used by `y=placement.weaponY+recoil/90`.
/// @param muzzle Value used by `if muzzle>0 then`.
function drawWeapon(placement,recoil,muzzle)
  x=placement.weaponX;y=placement.weaponY+recoil/90;w=placement.weaponWidth;h=placement.weaponHeight
  // Angular machinegun body, barrel, sight and grip. Repeated inner lines give it mass.
  line(x+w*2/10,y+h,x+w/10,y+h*5/10,64,72,78)
  line(x+w/10,y+h*5/10,x+w*3/10,y+h*2/10,112,120,122)
  line(x+w*3/10,y+h*2/10,x+w*7/10,y+h*2/10,155,148,126)
  line(x+w*7/10,y+h*2/10,x+w*9/10,y+h*5/10,112,120,122)
  line(x+w*9/10,y+h*5/10,x+w*8/10,y+h,64,72,78)
  line(x+w*2/10,y+h,x+w*8/10,y+h,45,50,54)
  for stripe=1 to 5
    sy=y+h*3/10+stripe*h/12
    line(x+w*2/10,sy,x+w*8/10,sy,72+stripe*8,76+stripe*8,78+stripe*7)
  end for
  line(x+w*4/10,y+h*2/10,x+w*4/10,y,178,164,126)
  line(x+w*6/10,y+h*2/10,x+w*6/10,y,178,164,126)
  line(x+w*4/10,y,x+w*6/10,y,205,186,138)
  line(x+w*4/10,y+h*7/10,x+w*3/10,y+h,72,62,54)
  line(x+w*6/10,y+h*7/10,x+w*7/10,y+h,72,62,54)
  if muzzle>0 then
    size=10+muzzle/45;mx=x+w/2;my=y-3
    line(mx-size,my,mx+size,my,255,220,96);line(mx,my-size,mx,my+size,255,245,160)
    line(mx-size*2/3,my-size*2/3,mx+size*2/3,my+size*2/3,255,150,48)
    line(mx+size*2/3,my-size*2/3,mx-size*2/3,my+size*2/3,255,150,48)
  end if
  return void
end function

/// Calls `mq3.client.playable_combat_view.line` from playable combat view `drawHitMark`.
/// @param placement Record read through `placement.centerX`, `placement.centerY`.
/// @param intensity Value used by `if intensity<=0 then return void end if`.
function drawHitMark(placement,intensity)
  if intensity<=0 then return void end if
  size=12+intensity/100;gap=6;x=placement.centerX;y=placement.centerY
  line(x-size,y-size,x-gap,y-gap,255,245,205);line(x+size,y-size,x+gap,y-gap,255,245,205)
  line(x-size,y+size,x-gap,y+gap,255,245,205);line(x+size,y+size,x+gap,y+gap,255,245,205)
  return void
end function

/// Calls `mq3.client.playable_combat_view.line` from playable combat view `drawDamageMark`.
/// @param view Record read through `view.damageSide`.
/// @param placement Record read through `placement.centerY`, `placement.weaponHeight`, `placement.centerX`.
/// @param intensity Value used by `if intensity<=0 then return void end if`.
function drawDamageMark(view,placement,intensity)
  if intensity<=0 then return void end if
  inset=12+intensity/80;y=placement.centerY;half=placement.weaponHeight/3
  if view.damageSide<=0 then
    line(inset,y-half,inset,y+half,255,52,36);line(inset,y-half,inset+14,y-half+14,255,100,60);line(inset,y+half,inset+14,y+half-14,255,100,60)
  end if
  if view.damageSide>=0 then
    x=placement.centerX*2-inset;line(x,y-half,x,y+half,255,52,36);line(x,y-half,x-14,y-half+14,255,100,60);line(x,y+half,x-14,y+half-14,255,100,60)
  end if
  return void
end function

/// Calls `mq3.client.playable_combat_view.layout`, `mq3.client.playable_combat_view.pulse`, `mq3.client.playable_combat_view.drawWeapon` and additional helpers from playable combat view `draw`.
/// @param view Record read through `view.weaponName`, `view.score`, `view.kills`, `view.deaths` and additional values.
/// @param width Width in the coordinate space used by `draw`.
/// @param height Height in the coordinate space used by `draw`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function draw(view,width,height,now)
  if view==void then return error(7548,"combat view state is required") end if
  placement=layout(width,height);effect=pulse(view,now)
  drawWeapon(placement,effect.recoil,effect.muzzle)
  drawHitMark(placement,effect.hit);drawDamageMark(view,placement,effect.damage)
  hud.drawText(view.weaponName,18,62,2,190,190,178)
  hud.drawText("SCORE "+str(view.score),width-174,16,2,255,220,96)
  hud.drawText("K "+str(view.kills)+" D "+str(view.deaths),width-174,36,2,190,205,215)
  if effect.kill>0 then
    text="FRAG +1";hud.drawText(text,placement.centerX-hud.textWidth(text,3)/2,placement.centerY-72,3,255,196,48)
  end if
  if effect.damage>0 and view.damageAmount>0 then hud.drawText("-"+str(view.damageAmount),placement.centerX+22,placement.centerY+28,2,255,75,52) end if
  return void
end function

// HUD/feedback pass for callers which draw the actual first-person MD3 weapon.
/// @param view Record read through `view.weaponName`, `view.score`, `view.kills`, `view.deaths` and additional values.
/// @param width Width in the coordinate space used by `drawFeedback`.
/// @param height Height in the coordinate space used by `drawFeedback`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function drawFeedback(view,width,height,now)
  if view==void then return error(7548,"combat view state is required") end if
  placement=layout(width,height);effect=pulse(view,now)
  drawHitMark(placement,effect.hit);drawDamageMark(view,placement,effect.damage)
  hud.drawText(view.weaponName,18,62,2,190,190,178)
  hud.drawText("SCORE "+str(view.score),width-174,16,2,255,220,96)
  hud.drawText("K "+str(view.kills)+" D "+str(view.deaths),width-174,36,2,190,205,215)
  if effect.kill>0 then
    text="FRAG +1";hud.drawText(text,placement.centerX-hud.textWidth(text,3)/2,placement.centerY-72,3,255,196,48)
  end if
  if effect.damage>0 and view.damageAmount>0 then hud.drawText("-"+str(view.damageAmount),placement.centerX+22,placement.centerY+28,2,255,75,52) end if
  return void
end function

// Crosshair hit and damage feedback layered over the retail Baseq3 HUD.
/// @param view Record read through `view.damageAmount`.
/// @param width Width in the coordinate space used by `drawTransientFeedback`.
/// @param height Height in the coordinate space used by `drawTransientFeedback`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function drawTransientFeedback(view,width,height,now)
  if view==void then return error(7548,"combat view state is required") end if
  placement=layout(width,height);effect=pulse(view,now)
  drawHitMark(placement,effect.hit);drawDamageMark(view,placement,effect.damage)
  if effect.damage>0 and view.damageAmount>0 then hud.drawText("-"+str(view.damageAmount),placement.centerX+22,placement.centerY+28,2,255,75,52) end if
  return void
end function
