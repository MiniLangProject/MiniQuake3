// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// baseq3 bg_pmove.c command cycle. The caller supplies collision and contents.
package mq3.game.pmove
import mq3.compat.numeric as n
import mq3.compat.transcendental as crt
import mq3.shared.math as q
import mq3.game.movement as kernel
import mq3.game.constants as c
import mq3.collision.brush as brush

const ALL_TIMES = 352
const OVERCLIP = 1.001
struct Command
  serverTime
  angles
  buttons
  weapon
  forwardmove
  rightmove
  upmove
end struct
struct Pmove
  ps
  cmd
  k
  noFootsteps
  gauntletHit
  fixed
  fixedMsec
  watertype
  xyspeed
  forward
  right
  up
  msec
  groundTrace
  previousOrigin
  previousVelocity
  previousWaterlevel
  traceFn
  pointFn
  context
end struct

function kernelTrace(k,start,finish)
  p = k.context
  return p.traceFn(p,start,finish)
end function

function create(ps,traceFn,pointFn,context)
  k = kernel.create(kernelTrace,void)
  p = Pmove(ps,Command(0,[0,0,0],0,0,0,0,0),k,false,false,false,8,0,0.0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,kernel.Collision(brush.emptyTrace(),[0.0,0.0,0.0],0),[0.0,0.0,0.0],[0.0,0.0,0.0],0,traceFn,pointFn,context)
  k.context = p
  return p
end function

function syncKernel(p)
  s = p.ps; k = p.k
  k.origin = s.origin; k.velocity = s.velocity
  k.gravity = s.gravity; k.pmTime = s.pm_time; k.pmFlags = s.pm_flags
  k.pmType = s.pm_type; k.speed = s.speed; k.flight = s.powerups[c.PW_FLIGHT] != 0
  k.clientNum = s.clientNum
  k.events = s.events; k.eventParms = s.eventParms; k.eventSequence = s.eventSequence
  return void
end function

function syncPlayer(p)
  p.ps.origin = p.k.origin; p.ps.velocity = p.k.velocity
  p.ps.eventSequence = p.k.eventSequence
  return void
end function

function friction(p)
  syncKernel(p); kernel.friction(p.k); syncPlayer(p)
  return void
end function
function accelerate(p,dir,speed,accel)
  syncKernel(p); kernel.accelerate(p.k,dir,speed,accel); syncPlayer(p)
  return void
end function
function slide(p,gravity,step)
  syncKernel(p)
  if step then kernel.stepSlideMove(p.k,gravity) else kernel.slideMove(p.k,gravity) end if
  syncPlayer(p)
  return void
end function
function scale(p)
  p.k.speed = p.ps.speed
  return kernel.cmdScale(p.k,p.cmd.forwardmove,p.cmd.rightmove,p.cmd.upmove)
end function
function addEvent(p,event)
  slot = p.ps.eventSequence & 1
  p.ps.events[slot] = event; p.ps.eventParms[slot] = 0
  p.ps.eventSequence = n.add32(p.ps.eventSequence,1)
  return void
end function

function startTorso(p,anim)
  if p.ps.pm_type >= c.PM_DEAD then return void end if
  p.ps.torsoAnim = ((p.ps.torsoAnim & 128)^128)|anim
  return void
end function
function startLegs(p,anim)
  if p.ps.pm_type >= c.PM_DEAD or p.ps.legsTimer > 0 then return void end if
  p.ps.legsAnim = ((p.ps.legsAnim & 128)^128)|anim
  return void
end function
function continueLegs(p,anim)
  if (p.ps.legsAnim & ~128) == anim or p.ps.legsTimer > 0 then return void end if
  startLegs(p,anim)
  return void
end function
function continueTorso(p,anim)
  if (p.ps.torsoAnim & ~128) == anim or p.ps.torsoTimer > 0 then return void end if
  startTorso(p,anim)
  return void
end function
function forceLegs(p,anim)
  p.ps.legsTimer = 0
  startLegs(p,anim)
  return void
end function

function movementDir(p)
  f = p.cmd.forwardmove; r = p.cmd.rightmove
  if f != 0 or r != 0 then
    if r == 0 and f > 0 then p.ps.movementDir = 0
    else if r < 0 and f > 0 then p.ps.movementDir = 1
    else if r < 0 and f == 0 then p.ps.movementDir = 2
    else if r < 0 and f < 0 then p.ps.movementDir = 3
    else if r == 0 and f < 0 then p.ps.movementDir = 4
    else if r > 0 and f < 0 then p.ps.movementDir = 5
    else if r > 0 and f == 0 then p.ps.movementDir = 6
    else if r > 0 and f > 0 then p.ps.movementDir = 7
    end if
  else
    if p.ps.movementDir == 2 then p.ps.movementDir = 1
    else if p.ps.movementDir == 6 then p.ps.movementDir = 7 end if
  end if
  return void
end function

function jumpAnimation(p)
  if p.cmd.forwardmove >= 0 then
    forceLegs(p,c.LEGS_JUMP); p.ps.pm_flags = p.ps.pm_flags & ~8
  else
    forceLegs(p,c.LEGS_JUMPB); p.ps.pm_flags = p.ps.pm_flags | 8
  end if
  return void
end function

function checkJump(p)
  if (p.ps.pm_flags & 512) != 0 or p.cmd.upmove < 10 then return false end if
  if (p.ps.pm_flags & 2) != 0 then p.cmd.upmove = 0; return false end if
  p.k.groundPlane = false; p.k.walking = false
  p.ps.pm_flags = p.ps.pm_flags | 2; p.ps.groundEntityNum = 1023
  p.ps.velocity[2] = 270.0
  addEvent(p,c.EV_JUMP); jumpAnimation(p)
  return true
end function

function checkWaterJump(p)
  if p.ps.pm_time != 0 or p.k.waterlevel != 2 then return false end if
  flat = kernel.copy(p.forward); flat[2] = 0.0; q.VectorNormalize(flat)
  spot = q.VectorMA(p.ps.origin,30.0,flat); spot[2] = n.fadd(spot[2],4.0)
  if (p.pointFn(p,spot) & 1) == 0 then return false end if
  spot[2] = n.fadd(spot[2],16.0)
  if p.pointFn(p,spot) != 0 then return false end if
  p.ps.velocity = q.VectorScale(p.forward,200.0); p.ps.velocity[2] = 350.0
  p.ps.pm_flags = p.ps.pm_flags | 256; p.ps.pm_time = 2000
  return true
end function
function waterJumpMove(p)
  slide(p,true,true)
  p.ps.velocity[2] = n.fsub(p.ps.velocity[2],n.fmul(p.ps.gravity,p.k.frametime))
  if p.ps.velocity[2] < 0 then p.ps.pm_flags = p.ps.pm_flags & ~ALL_TIMES; p.ps.pm_time = 0 end if
  return void
end function

function swimmingWish(p,cmdscale,sink)
  wish = [0.0,0.0,0.0]
  if cmdscale == 0 then
    if sink then wish[2] = -60.0 end if
  else
    for axis = 0 to 2
      wish[axis] = n.fadd(n.fmul(n.fmul(cmdscale,p.forward[axis]),p.cmd.forwardmove),n.fmul(n.fmul(cmdscale,p.right[axis]),p.cmd.rightmove))
    end for
    wish[2] = n.fadd(wish[2],n.fmul(cmdscale,p.cmd.upmove))
  end if
  return wish
end function
function waterMove(p)
  if checkWaterJump(p) then waterJumpMove(p); return void end if
  friction(p)
  wish = swimmingWish(p,scale(p),true); wishspeed = q.VectorNormalize(wish)
  cap = n.fmul(p.ps.speed,0.5)
  if wishspeed > cap then wishspeed = cap end if
  accelerate(p,wish,wishspeed,4.0)
  if p.k.groundPlane and q.DotProduct(p.ps.velocity,p.k.groundNormal) < 0 then
    speed = q.VectorLength(p.ps.velocity)
    p.ps.velocity = kernel.clipVelocity(p.ps.velocity,p.k.groundNormal,OVERCLIP)
    q.VectorNormalize(p.ps.velocity); p.ps.velocity = q.VectorScale(p.ps.velocity,speed)
  end if
  slide(p,false,false)
  return void
end function
function flyMove(p)
  friction(p)
  wish = swimmingWish(p,scale(p),false); wishspeed = q.VectorNormalize(wish)
  accelerate(p,wish,wishspeed,8.0); slide(p,false,true)
  return void
end function
function airMove(p)
  friction(p); cmdscale = scale(p); movementDir(p)
  p.forward[2] = 0.0; p.right[2] = 0.0
  q.VectorNormalize(p.forward); q.VectorNormalize(p.right)
  wish = [0.0,0.0,0.0]
  for axis = 0 to 1
    wish[axis] = n.fadd(n.fmul(p.forward[axis],p.cmd.forwardmove),n.fmul(p.right[axis],p.cmd.rightmove))
  end for
  wishspeed = n.fmul(q.VectorNormalize(wish),cmdscale)
  accelerate(p,wish,wishspeed,1.0)
  if p.k.groundPlane then p.ps.velocity = kernel.clipVelocity(p.ps.velocity,p.k.groundNormal,OVERCLIP) end if
  slide(p,true,true)
  return void
end function
function grappleMove(p)
  wish = q.VectorMA(p.ps.grapplePoint,-16.0,p.forward)
  for axis = 0 to 2
    wish[axis] = n.fsub(wish[axis],p.ps.origin[axis])
  end for
  distance = q.VectorNormalize(wish)
  speed = 800.0
  if distance <= 100 then speed = n.fmul(10.0,distance) end if
  p.ps.velocity = q.VectorScale(wish,speed); p.k.groundPlane = false
  return void
end function
function walkMove(p)
  if p.k.waterlevel > 2 and q.DotProduct(p.forward,p.k.groundNormal) > 0 then waterMove(p); return void end if
  if checkJump(p) then
    if p.k.waterlevel > 1 then waterMove(p) else airMove(p) end if
    return void
  end if
  friction(p); cmdscale = scale(p); movementDir(p)
  p.forward[2] = 0.0; p.right[2] = 0.0
  p.forward = kernel.clipVelocity(p.forward,p.k.groundNormal,OVERCLIP)
  p.right = kernel.clipVelocity(p.right,p.k.groundNormal,OVERCLIP)
  q.VectorNormalize(p.forward); q.VectorNormalize(p.right)
  wish = [0.0,0.0,0.0]
  for axis = 0 to 2
    wish[axis] = n.fadd(n.fmul(p.forward[axis],p.cmd.forwardmove),n.fmul(p.right[axis],p.cmd.rightmove))
  end for
  wishspeed = n.fmul(q.VectorNormalize(wish),cmdscale)
  cap = n.fmul(p.ps.speed,0.25)
  if (p.ps.pm_flags & 1) != 0 and wishspeed > cap then wishspeed = cap end if
  if p.k.waterlevel != 0 then
    waterScale = n.f32(p.k.waterlevel/3.0)
    waterScale = n.f32(1.0-(1.0-0.5)*waterScale)
    cap = n.fmul(p.ps.speed,waterScale)
    if wishspeed > cap then wishspeed = cap end if
  end if
  slick = (p.k.groundFlags & 2) != 0 or (p.ps.pm_flags & 64) != 0
  accel = 10.0
  if slick then accel = 1.0 end if
  accelerate(p,wish,wishspeed,accel)
  if slick then p.ps.velocity[2] = n.fsub(p.ps.velocity[2],n.fmul(p.ps.gravity,p.k.frametime)) end if
  speed = q.VectorLength(p.ps.velocity)
  p.ps.velocity = kernel.clipVelocity(p.ps.velocity,p.k.groundNormal,OVERCLIP)
  q.VectorNormalize(p.ps.velocity); p.ps.velocity = q.VectorScale(p.ps.velocity,speed)
  if p.ps.velocity[0] == 0 and p.ps.velocity[1] == 0 then return void end if
  slide(p,false,true)
  return void
end function
function deadMove(p)
  if not p.k.walking then return void end if
  speed = n.fsub(q.VectorLength(p.ps.velocity),20.0)
  if speed <= 0 then p.ps.velocity = [0.0,0.0,0.0]
  else
    q.VectorNormalize(p.ps.velocity); p.ps.velocity = q.VectorScale(p.ps.velocity,speed)
  end if
  return void
end function
function noclipMove(p)
  p.ps.viewheight = 26
  speed = q.VectorLength(p.ps.velocity)
  if speed < 1 then p.ps.velocity = [0.0,0.0,0.0]
  else
    control = speed
    if speed < 100 then control = 100.0 end if
    newspeed = n.fsub(speed,n.fmul(n.fmul(control,9.0),p.k.frametime))
    if newspeed < 0 then newspeed = 0.0 end if
    p.ps.velocity = q.VectorScale(p.ps.velocity,n.fdiv(newspeed,speed))
  end if
  cmdscale = scale(p); wish = [0.0,0.0,0.0]
  for axis = 0 to 2
    wish[axis] = n.fadd(n.fmul(p.forward[axis],p.cmd.forwardmove),n.fmul(p.right[axis],p.cmd.rightmove))
  end for
  wish[2] = n.fadd(wish[2],p.cmd.upmove)
  wishspeed = n.fmul(q.VectorNormalize(wish),cmdscale)
  accelerate(p,wish,wishspeed,10.0)
  p.ps.origin = q.VectorMA(p.ps.origin,p.k.frametime,p.ps.velocity)
  return void
end function

function footstepForSurface(p)
  if (p.k.groundFlags & 0x2000) != 0 then return 0 end if
  if (p.k.groundFlags & 0x1000) != 0 then return c.EV_FOOTSTEP_METAL end if
  return c.EV_FOOTSTEP
end function
function crashLand(p)
  anim = c.LEGS_LAND
  if (p.ps.pm_flags & 8) != 0 then anim = c.LEGS_LANDB end if
  forceLegs(p,anim); p.ps.legsTimer = 130
  distance = n.fsub(p.ps.origin[2],p.previousOrigin[2])
  velocity = p.previousVelocity[2]; acceleration = n.f32(-p.ps.gravity)
  a = n.fdiv(acceleration,2.0); b = velocity; cc = n.fneg(distance)
  den = n.fsub(n.fmul(b,b),n.fmul(n.fmul(4.0,a),cc))
  if den < 0 then return void end if
  // sqrt and the rest of this expression are double until the t store.
  t = n.f32((n.fneg(b)-crt.sqrt(den))/n.fmul(2.0,a))
  delta = n.fadd(velocity,n.fmul(t,acceleration))
  delta = n.f32(n.fmul(delta,delta)*0.0001)
  if (p.ps.pm_flags & 1) != 0 then delta = n.fmul(delta,2.0) end if
  if p.k.waterlevel == 3 then return void end if
  if p.k.waterlevel == 2 then delta = n.fmul(delta,0.25) end if
  if p.k.waterlevel == 1 then delta = n.fmul(delta,0.5) end if
  if delta < 1 then return void end if
  if (p.k.groundFlags & 1) == 0 then
    if delta > 60 then addEvent(p,c.EV_FALL_FAR)
    else if delta > 40 then
      if p.ps.stats[c.STAT_HEALTH] > 0 then addEvent(p,c.EV_FALL_MEDIUM) end if
    else if delta > 7 then addEvent(p,c.EV_FALL_SHORT)
    else addEvent(p,footstepForSurface(p))
    end if
  end if
  p.ps.bobCycle = 0
  return void
end function
function setGroundTrace(p,hit)
  p.groundTrace = hit
  p.k.groundNormal = hit.trace.normal; p.k.groundFlags = hit.trace.surfaceFlags
  return void
end function
function clearGround(p)
  p.ps.groundEntityNum = 1023; p.k.groundPlane = false; p.k.walking = false
  return void
end function
function correctAllSolid(p)
  for x = -1 to 1
    for y = -1 to 1
      for z = -1 to 1
        point = [n.fadd(p.ps.origin[0],x),n.fadd(p.ps.origin[1],y),n.fadd(p.ps.origin[2],z)]
        hit = p.traceFn(p,point,point)
        if not hit.trace.allsolid then
          point = kernel.copy(p.ps.origin); point[2] = n.fsub(point[2],0.25)
          setGroundTrace(p,p.traceFn(p,p.ps.origin,point))
          return true
        end if
      end for
    end for
  end for
  clearGround(p)
  return false
end function
function groundTraceMissed(p)
  if p.ps.groundEntityNum != 1023 then
    point = kernel.copy(p.ps.origin); point[2] = n.fsub(point[2],64.0)
    hit = p.traceFn(p,p.ps.origin,point)
    if hit.trace.fraction == 1 then jumpAnimation(p) end if
  end if
  clearGround(p)
  return void
end function
function groundTrace(p)
  point = kernel.copy(p.ps.origin); point[2] = n.fsub(point[2],0.25)
  setGroundTrace(p,p.traceFn(p,p.ps.origin,point))
  if p.groundTrace.trace.allsolid then
    if not correctAllSolid(p) then return void end if
  end if
  if p.groundTrace.trace.fraction == 1 then groundTraceMissed(p); return void end if
  if p.ps.velocity[2] > 0 and q.DotProduct(p.ps.velocity,p.k.groundNormal) > 10 then
    jumpAnimation(p); clearGround(p); return void
  end if
  if p.k.groundNormal[2] < n.f32(0.7) then
    p.ps.groundEntityNum = 1023; p.k.groundPlane = true; p.k.walking = false
    return void
  end if
  p.k.groundPlane = true; p.k.walking = true
  if (p.ps.pm_flags & 256) != 0 then
    p.ps.pm_flags = p.ps.pm_flags & ~(256|32); p.ps.pm_time = 0
  end if
  if p.ps.groundEntityNum == 1023 then
    crashLand(p)
    if p.previousVelocity[2] < -200 then p.ps.pm_flags = p.ps.pm_flags | 32; p.ps.pm_time = 250 end if
  end if
  p.ps.groundEntityNum = p.groundTrace.entityNum
  kernel.addTouchEnt(p.k,p.groundTrace.entityNum)
  return void
end function
function setWaterLevel(p)
  p.k.waterlevel = 0; p.watertype = 0
  point = kernel.copy(p.ps.origin); point[2] = n.fadd(n.fadd(p.ps.origin[2],-24.0),1.0)
  contents = p.pointFn(p,point)
  if (contents & 0x38) != 0 then
    sample2 = p.ps.viewheight+24; sample1 = n.quotient(sample2,2)
    p.watertype = contents; p.k.waterlevel = 1
    point[2] = n.fadd(n.fadd(p.ps.origin[2],-24.0),sample1)
    if (p.pointFn(p,point) & 0x38) != 0 then
      p.k.waterlevel = 2
      point[2] = n.fadd(n.fadd(p.ps.origin[2],-24.0),sample2)
      if (p.pointFn(p,point) & 0x38) != 0 then p.k.waterlevel = 3 end if
    end if
  end if
  return void
end function
function checkDuck(p)
  if p.ps.powerups[c.PW_INVULNERABILITY] != 0 then
    if (p.ps.pm_flags & 16384) != 0 then
      p.k.mins = [-42.0,-42.0,-42.0]; p.k.maxs = [42.0,42.0,42.0]
    else
      p.k.mins = [-15.0,-15.0,-24.0]; p.k.maxs = [15.0,15.0,16.0]
    end if
    p.ps.pm_flags = p.ps.pm_flags | 1; p.ps.viewheight = 12
    return void
  end if
  p.ps.pm_flags = p.ps.pm_flags & ~16384
  p.k.mins = [-15.0,-15.0,-24.0]
  p.k.maxs[0] = 15.0; p.k.maxs[1] = 15.0
  if p.ps.pm_type == c.PM_DEAD then p.k.maxs[2] = -8.0; p.ps.viewheight = -16; return void end if
  if p.cmd.upmove < 0 then p.ps.pm_flags = p.ps.pm_flags | 1
  else if (p.ps.pm_flags & 1) != 0 then
    p.k.maxs[2] = 32.0
    hit = p.traceFn(p,p.ps.origin,p.ps.origin)
    if not hit.trace.allsolid then p.ps.pm_flags = p.ps.pm_flags & ~1 end if
  end if
  if (p.ps.pm_flags & 1) != 0 then p.k.maxs[2] = 16.0; p.ps.viewheight = 12
  else p.k.maxs[2] = 32.0; p.ps.viewheight = 26 end if
  return void
end function

function footsteps(p)
  p.xyspeed = n.fsqrt(n.fadd(n.fmul(p.ps.velocity[0],p.ps.velocity[0]),n.fmul(p.ps.velocity[1],p.ps.velocity[1])))
  if p.ps.groundEntityNum == 1023 then
    if p.ps.powerups[c.PW_INVULNERABILITY] != 0 then continueLegs(p,c.LEGS_IDLECR) end if
    if p.k.waterlevel > 1 then continueLegs(p,c.LEGS_SWIM) end if
    return void
  end if
  if p.cmd.forwardmove == 0 and p.cmd.rightmove == 0 then
    if p.xyspeed < 5 then
      p.ps.bobCycle = 0
      if (p.ps.pm_flags & 1) != 0 then continueLegs(p,c.LEGS_IDLECR) else continueLegs(p,c.LEGS_IDLE) end if
    end if
    return void
  end if
  footstep = false; bobmove = 0.0
  if (p.ps.pm_flags & 1) != 0 then
    bobmove = 0.5
    if (p.ps.pm_flags & 16) != 0 then continueLegs(p,c.LEGS_BACKCR) else continueLegs(p,c.LEGS_WALKCR) end if
  else if (p.cmd.buttons & 16) == 0 then
    bobmove = n.f32(0.4)
    if (p.ps.pm_flags & 16) != 0 then continueLegs(p,c.LEGS_BACK) else continueLegs(p,c.LEGS_RUN) end if
    footstep = true
  else
    bobmove = n.f32(0.3)
    if (p.ps.pm_flags & 16) != 0 then continueLegs(p,c.LEGS_BACKWALK) else continueLegs(p,c.LEGS_WALK) end if
  end if
  old = p.ps.bobCycle
  p.ps.bobCycle = n.trunc32(n.fadd(old,n.fmul(bobmove,p.msec))) & 255
  if (((old+64)^(p.ps.bobCycle+64)) & 128) != 0 then
    if p.k.waterlevel == 0 then
      if footstep and not p.noFootsteps then addEvent(p,footstepForSurface(p)) end if
    else if p.k.waterlevel == 1 then addEvent(p,c.EV_FOOTSPLASH)
    else if p.k.waterlevel == 2 then addEvent(p,c.EV_SWIM)
    end if
  end if
  return void
end function
function waterEvents(p)
  previous = p.previousWaterlevel; current = p.k.waterlevel
  if previous == 0 and current != 0 then addEvent(p,c.EV_WATER_TOUCH) end if
  if previous != 0 and current == 0 then addEvent(p,c.EV_WATER_LEAVE) end if
  if previous != 3 and current == 3 then addEvent(p,c.EV_WATER_UNDER) end if
  if previous == 3 and current != 3 then addEvent(p,c.EV_WATER_CLEAR) end if
  return void
end function

function beginWeaponChange(p,weapon)
  if weapon <= c.WP_NONE or weapon >= c.WP_NUM_WEAPONS then return void end if
  if (p.ps.stats[c.STAT_WEAPONS] & (1 << weapon)) == 0 or p.ps.weaponstate == c.WEAPON_DROPPING then return void end if
  addEvent(p,c.EV_CHANGE_WEAPON); p.ps.weaponstate = c.WEAPON_DROPPING
  p.ps.weaponTime = p.ps.weaponTime+200; startTorso(p,c.TORSO_DROP)
  return void
end function
function finishWeaponChange(p)
  weapon = p.cmd.weapon
  if weapon < c.WP_NONE or weapon >= c.WP_NUM_WEAPONS then weapon = c.WP_NONE end if
  if (p.ps.stats[c.STAT_WEAPONS] & (1 << weapon)) == 0 then weapon = c.WP_NONE end if
  p.ps.weapon = weapon; p.ps.weaponstate = c.WEAPON_RAISING; p.ps.weaponTime = p.ps.weaponTime+250
  startTorso(p,c.TORSO_RAISE)
  return void
end function
function standTorso(p,continuing)
  anim = c.TORSO_STAND
  if p.ps.weapon == c.WP_GAUNTLET then anim = c.TORSO_STAND2 end if
  if continuing then continueTorso(p,anim) else startTorso(p,anim) end if
  return void
end function
function weapon(p)
  s = p.ps
  if (s.pm_flags & 512) != 0 or s.persistant[c.PERS_TEAM] == c.TEAM_SPECTATOR then return void end if
  if s.stats[c.STAT_HEALTH] <= 0 then s.weapon = c.WP_NONE; return void end if
  if (p.cmd.buttons & 4) != 0 then
    if (s.pm_flags & 1024) == 0 then
      tag = c.itemTag(s.stats[c.STAT_HOLDABLE_ITEM])
      if tag == c.HI_MEDKIT and s.stats[c.STAT_HEALTH] >= s.stats[c.STAT_MAX_HEALTH]+25 then return void end if
      s.pm_flags = s.pm_flags | 1024
      addEvent(p,c.EV_USE_ITEM0+tag); s.stats[c.STAT_HOLDABLE_ITEM] = 0
      return void
    end if
  else s.pm_flags = s.pm_flags & ~1024 end if
  if s.weaponTime > 0 then s.weaponTime = s.weaponTime-p.msec end if
  if s.weaponTime <= 0 or s.weaponstate != c.WEAPON_FIRING then
    if s.weapon != p.cmd.weapon then beginWeaponChange(p,p.cmd.weapon) end if
  end if
  if s.weaponTime > 0 then return void end if
  if s.weaponstate == c.WEAPON_DROPPING then finishWeaponChange(p); return void end if
  if s.weaponstate == c.WEAPON_RAISING then s.weaponstate = c.WEAPON_READY; standTorso(p,false); return void end if
  if (p.cmd.buttons & 1) == 0 then s.weaponTime = 0; s.weaponstate = c.WEAPON_READY; return void end if
  if s.weapon == c.WP_GAUNTLET then
    if not p.gauntletHit then s.weaponTime = 0; s.weaponstate = c.WEAPON_READY; return void end if
    startTorso(p,c.TORSO_ATTACK2)
  else startTorso(p,c.TORSO_ATTACK) end if
  s.weaponstate = c.WEAPON_FIRING
  if s.ammo[s.weapon] == 0 then addEvent(p,c.EV_NOAMMO); s.weaponTime = s.weaponTime+500; return void end if
  if s.ammo[s.weapon] != -1 then s.ammo[s.weapon] = s.ammo[s.weapon]-1 end if
  addEvent(p,c.EV_FIRE_WEAPON)
  delays = [0,400,100,1000,800,800,50,1500,100,200,400]
  addTime = delays[s.weapon]
  // All baseq3 delays are <=1500; binary32 conversion cannot cross an integer here.
  if s.powerups[c.PW_HASTE] != 0 then addTime = n.trunc32(n.f32(addTime/1.3)) end if
  s.weaponTime = s.weaponTime+addTime
  return void
end function
function animate(p)
  if (p.cmd.buttons & 8) != 0 and p.ps.torsoTimer == 0 then
    startTorso(p,c.TORSO_GESTURE); p.ps.torsoTimer = 2294; addEvent(p,c.EV_TAUNT)
  end if
  return void
end function
function dropTimers(p)
  s = p.ps
  if s.pm_time != 0 then
    if p.msec >= s.pm_time then s.pm_flags = s.pm_flags & ~ALL_TIMES; s.pm_time = 0
    else s.pm_time = s.pm_time-p.msec end if
  end if
  if s.legsTimer > 0 then s.legsTimer = s.legsTimer-p.msec; if s.legsTimer < 0 then s.legsTimer = 0 end if end if
  if s.torsoTimer > 0 then s.torsoTimer = s.torsoTimer-p.msec; if s.torsoTimer < 0 then s.torsoTimer = 0 end if end if
  return void
end function

function updateViewAngles(ps,cmd)
  if ps.pm_type == c.PM_INTERMISSION or ps.pm_type == c.PM_SPINTERMISSION then return void end if
  if ps.pm_type != c.PM_SPECTATOR and ps.stats[c.STAT_HEALTH] <= 0 then return void end if
  for axis = 0 to 2
    temp = n.i16(cmd.angles[axis]+ps.delta_angles[axis])
    if axis == 0 then
      if temp > 16000 then ps.delta_angles[axis] = n.i32(16000-cmd.angles[axis]); temp = 16000
      else if temp < -16000 then ps.delta_angles[axis] = n.i32(-16000-cmd.angles[axis]); temp = -16000 end if
    end if
    ps.viewangles[axis] = n.f32(temp*(360.0/65536))
  end for
  return void
end function

function single(p)
  s = p.ps; cmd = p.cmd; k = p.k
  k.touches = []; p.watertype = 0; k.waterlevel = 0
  if s.stats[c.STAT_HEALTH] <= 0 then k.mask = k.mask & ~0x2000000 end if
  if cmd.forwardmove > 64 or cmd.forwardmove < -64 or cmd.rightmove > 64 or cmd.rightmove < -64 then cmd.buttons = cmd.buttons & ~16 end if
  if (cmd.buttons & 2) != 0 then s.eFlags = s.eFlags | 0x1000 else s.eFlags = s.eFlags & ~0x1000 end if
  if (s.pm_flags & 512) == 0 and s.pm_type != c.PM_INTERMISSION and (cmd.buttons & 1) != 0 and s.ammo[s.weapon] != 0 then
    s.eFlags = s.eFlags | 0x100
  else s.eFlags = s.eFlags & ~0x100 end if
  if s.stats[c.STAT_HEALTH] > 0 and (cmd.buttons & (1|4)) == 0 then s.pm_flags = s.pm_flags & ~512 end if
  if (cmd.buttons & 2) != 0 then cmd.buttons = 2; cmd.forwardmove = 0; cmd.rightmove = 0; cmd.upmove = 0 end if
  k.walking = false; k.groundPlane = false; k.impactSpeed = 0.0
  setGroundTrace(p,kernel.Collision(brush.Trace(0.0,[0.0,0.0,0.0],0.0,0,0,false,false,0),[0.0,0.0,0.0],0))
  p.previousWaterlevel = 0
  p.msec = n.i32(cmd.serverTime-s.commandTime)
  if p.msec < 1 then p.msec = 1 else if p.msec > 200 then p.msec = 200 end if
  s.commandTime = cmd.serverTime
  p.previousOrigin = kernel.copy(s.origin); p.previousVelocity = kernel.copy(s.velocity)
  k.frametime = n.f32(p.msec*0.001)
  updateViewAngles(s,cmd)
  axes = q.AngleVectors(s.viewangles); p.forward = axes[0]; p.right = axes[1]; p.up = axes[2]
  if cmd.upmove < 10 then s.pm_flags = s.pm_flags & ~2 end if
  if cmd.forwardmove < 0 then s.pm_flags = s.pm_flags | 16
  else if cmd.forwardmove > 0 or (cmd.forwardmove == 0 and cmd.rightmove != 0) then s.pm_flags = s.pm_flags & ~16 end if
  if s.pm_type >= c.PM_DEAD then cmd.forwardmove = 0; cmd.rightmove = 0; cmd.upmove = 0 end if
  if s.pm_type == c.PM_SPECTATOR then checkDuck(p); flyMove(p); dropTimers(p); return void end if
  if s.pm_type == c.PM_NOCLIP then noclipMove(p); dropTimers(p); return void end if
  if s.pm_type == c.PM_FREEZE or s.pm_type == c.PM_INTERMISSION or s.pm_type == c.PM_SPINTERMISSION then return void end if
  setWaterLevel(p); p.previousWaterlevel = k.waterlevel
  checkDuck(p); groundTrace(p)
  if s.pm_type == c.PM_DEAD then deadMove(p) end if
  dropTimers(p)
  if s.powerups[c.PW_FLIGHT] != 0 then flyMove(p)
  else if (s.pm_flags & 2048) != 0 then grappleMove(p); airMove(p)
  else if (s.pm_flags & 256) != 0 then waterJumpMove(p)
  else if k.waterlevel > 1 then waterMove(p)
  else if k.walking then walkMove(p)
  else airMove(p) end if
  animate(p); groundTrace(p); setWaterLevel(p); weapon(p)
  if s.weaponstate == c.WEAPON_READY then standTorso(p,true) end if
  footsteps(p); waterEvents(p); q.SnapVector(s.velocity)
  return void
end function

function move(p)
  if p.fixed and (p.fixedMsec < 1 or p.fixedMsec > 200) then return error(472,"Invalid fixed Pmove interval") end if
  // Reject out-of-bounds engine state; commands retain the original byte widths.
  if p.ps.weapon < 0 or p.ps.weapon >= c.WP_NUM_WEAPONS then return error(473,"Invalid baseq3 player weapon") end if
  p.cmd.weapon = p.cmd.weapon & 255
  p.cmd.forwardmove = n.i8(p.cmd.forwardmove); p.cmd.rightmove = n.i8(p.cmd.rightmove); p.cmd.upmove = n.i8(p.cmd.upmove)
  finalTime = p.cmd.serverTime
  if finalTime < p.ps.commandTime then return void end if
  if finalTime > p.ps.commandTime+1000 then p.ps.commandTime = finalTime-1000 end if
  p.ps.pmove_framecount = (p.ps.pmove_framecount+1) & 63
  while p.ps.commandTime != finalTime
    msec = finalTime-p.ps.commandTime
    if p.fixed then
      if msec > p.fixedMsec then msec = p.fixedMsec end if
    else if msec > 66 then msec = 66 end if
    p.cmd.serverTime = p.ps.commandTime+msec
    single(p)
    if (p.ps.pm_flags & 2) != 0 then p.cmd.upmove = 20 end if
  end while
  return void
end function
