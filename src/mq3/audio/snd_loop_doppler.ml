// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Velocity-to-pitch state from Baseq3 S_AddLoopingSound.
package mq3.audio.snd_loop_doppler

import mq3.compat.numeric as n

struct Doppler active scale oldScale end struct

function validVector(value) return value!=void and len(value)==3 end function
function distanceSquared(left,right)
  x=n.fsub(n.f32(left[0]),n.f32(right[0]));y=n.fsub(n.f32(left[1]),n.f32(right[1]));z=n.fsub(n.f32(left[2]),n.f32(right[2]))
  return n.fadd(n.fadd(n.fmul(x,x),n.fmul(y,y)),n.fmul(z,z))
end function

function update(listenerOrigin,origin,velocity,previousScale,consecutive,enabled)
  if not validVector(listenerOrigin) or not validVector(origin) or not validVector(velocity) then return error(7670,"loop Doppler: invalid vector") end if
  if not enabled or distanceSquared(velocity,[0.0,0.0,0.0])<=0.0 then return Doppler(false,1.0,1.0) end if
  destination=[n.fadd(n.f32(origin[0]),n.f32(velocity[0])),n.fadd(n.f32(origin[1]),n.f32(velocity[1])),n.fadd(n.f32(origin[2]),n.f32(velocity[2]))]
  fromDistance=distanceSquared(listenerOrigin,origin);toDistance=distanceSquared(listenerOrigin,destination)
  if fromDistance<=0.0 then return Doppler(false,1.0,1.0) end if
  // S_AddLoopingSound resets both scales immediately before its frame test;
  // consequently oldDopplerScale remains 1 even on consecutive frames.
  scale=n.fdiv(toDistance,n.fmul(fromDistance,n.f32(100.0)));old=1.0
  if scale<=1.0 then return Doppler(false,scale,old) end if
  return Doppler(true,scale,old)
end function
