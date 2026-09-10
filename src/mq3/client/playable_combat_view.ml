// SPDX-License-Identifier: GPL-2.0-or-later
// First-person weapon silhouette and short-lived combat feedback for the preview.
package mq3.client.playable_combat_view

import mq3.platform.playable_window as window
import mq3.client.playable_hud as hud
import mq3.compat.numeric as numeric

const FIRE_FLASH_MS=90
const RECOIL_MS=180
const HIT_MARK_MS=160
const DAMAGE_MARK_MS=350
const KILL_MARK_MS=900

struct CombatView weaponName score kills deaths shots hits lastFire lastHit lastDamage lastKill damageAmount damageSide end struct
struct CombatPulse recoil muzzle hit damage kill end struct
struct CombatLayout centerX centerY weaponX weaponY weaponWidth weaponHeight end struct

function state(weaponName)
  if len(weaponName)==0 then weaponName="MACHINEGUN" end if
  return CombatView(weaponName,0,0,0,0,0,-1000000,-1000000,-1000000,-1000000,0,0)
end function

function clampNonnegative(value) if value<0 then return 0 end if;return value end function

function setScore(view,value)
  if view==void then return error(7540,"combat view state is required") end if
  view.score=value;return void
end function

function fire(view,now)
  if view==void then return error(7541,"combat view state is required") end if
  view.lastFire=now;view.shots=view.shots+1;return void
end function

function registerHit(view,now)
  if view==void then return error(7542,"combat view state is required") end if
  view.lastHit=now;view.hits=view.hits+1;return void
end function

function takeDamage(view,now,amount,side)
  if view==void then return error(7543,"combat view state is required") end if
  view.lastDamage=now;view.damageAmount=clampNonnegative(amount)
  view.damageSide=0;if side<0 then view.damageSide=-1 end if;if side>0 then view.damageSide=1 end if
  return void
end function

function registerKill(view,now,score)
  if view==void then return error(7544,"combat view state is required") end if
  view.lastKill=now;view.kills=view.kills+1;view.score=score;return void
end function

function registerDeath(view)
  if view==void then return error(7545,"combat view state is required") end if
  view.deaths=view.deaths+1;return void
end function

function remaining(now,start,duration)
  elapsed=now-start
  if elapsed<0 or elapsed>=duration then return 0 end if
  return ((duration-elapsed)*1000)/duration
end function

function pulse(view,now)
  if view==void then return error(7546,"combat view state is required") end if
  return CombatPulse(remaining(now,view.lastFire,RECOIL_MS),remaining(now,view.lastFire,FIRE_FLASH_MS),remaining(now,view.lastHit,HIT_MARK_MS),remaining(now,view.lastDamage,DAMAGE_MARK_MS),remaining(now,view.lastKill,KILL_MARK_MS))
end function

function layout(width,height)
  if width<320 or height<200 then return error(7547,"combat view surface is too small") end if
  weaponWidth=width/5;if weaponWidth>210 then weaponWidth=210 end if
  weaponHeight=height/3;if weaponHeight>220 then weaponHeight=220 end if
  return CombatLayout(width/2,height/2,width/2-weaponWidth/2,height-weaponHeight,weaponWidth,weaponHeight)
end function

function line(x0,y0,x1,y1,red,green,blue)
  window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)
  return void
end function

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

function drawHitMark(placement,intensity)
  if intensity<=0 then return void end if
  size=12+intensity/100;gap=6;x=placement.centerX;y=placement.centerY
  line(x-size,y-size,x-gap,y-gap,255,245,205);line(x+size,y-size,x+gap,y-gap,255,245,205)
  line(x-size,y+size,x-gap,y+gap,255,245,205);line(x+size,y+size,x+gap,y+gap,255,245,205)
  return void
end function

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
function drawTransientFeedback(view,width,height,now)
  if view==void then return error(7548,"combat view state is required") end if
  placement=layout(width,height);effect=pulse(view,now)
  drawHitMark(placement,effect.hit);drawDamageMark(view,placement,effect.damage)
  if effect.damage>0 and view.damageAmount>0 then hud.drawText("-"+str(view.damageAmount),placement.centerX+22,placement.centerY+28,2,255,75,52) end if
  return void
end function
