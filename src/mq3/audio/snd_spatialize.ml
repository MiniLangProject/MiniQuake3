// SPDX-License-Identifier: GPL-2.0-or-later
// Integer channel-volume calculation from Baseq3 S_SpatializeOrigin.
package mq3.audio.snd_spatialize

import mq3.compat.numeric as numeric
import mq3.shared.math as qmath

const SOUND_FULLVOLUME=80.0
const SOUND_ATTENUATE=0.0008

struct Volumes left right distance attenuation dot end struct

function fail(message) return error(7662,"S_SpatializeOrigin: "+message) end function

function validVector(value) return value!=void and len(value)==3 end function

function spatialize(origin,listenerOrigin,listenerAxis,masterVolume,channels)
  if not validVector(origin) or not validVector(listenerOrigin) then return fail("invalid origin") end if
  if listenerAxis==void or len(listenerAxis)!=3 or not validVector(listenerAxis[0]) or not validVector(listenerAxis[1]) or not validVector(listenerAxis[2]) then return fail("invalid listener axis") end if
  if masterVolume<0 or masterVolume>255 then return fail("invalid master volume") end if
  if channels!=1 and channels!=2 then return fail("invalid output channel count") end if
  source=[numeric.fsub(origin[0],listenerOrigin[0]),numeric.fsub(origin[1],listenerOrigin[1]),numeric.fsub(origin[2],listenerOrigin[2])]
  distance=qmath.VectorNormalize(source)
  attenuatedDistance=numeric.fsub(distance,numeric.f32(SOUND_FULLVOLUME));if attenuatedDistance<0.0 then attenuatedDistance=0.0 end if
  attenuatedDistance=numeric.fmul(attenuatedDistance,numeric.f32(SOUND_ATTENUATE))
  dot=numeric.fneg(qmath.DotProduct(source,listenerAxis[1]))
  leftScale=1.0;rightScale=1.0
  if channels!=1 then
    rightScale=numeric.fmul(0.5,numeric.fadd(1.0,dot));leftScale=numeric.fmul(0.5,numeric.fsub(1.0,dot))
    if rightScale<0.0 then rightScale=0.0 end if;if leftScale<0.0 then leftScale=0.0 end if
  end if
  attenuation=numeric.fsub(1.0,attenuatedDistance)
  right=numeric.trunc32(numeric.fmul(numeric.f32(masterVolume),numeric.fmul(attenuation,rightScale)));if right<0 then right=0 end if
  left=numeric.trunc32(numeric.fmul(numeric.f32(masterVolume),numeric.fmul(attenuation,leftScale)));if left<0 then left=0 end if
  if attenuation<0.0 then attenuation=0.0 end if
  return Volumes(left,right,distance,attenuation,dot)
end function

function gains(origin,listenerOrigin,listenerAxis,masterVolume)
  value=try(spatialize(origin,listenerOrigin,listenerAxis,masterVolume,2));if value is error then return value end if
  if masterVolume==0 then return [0.0,0.0,value.distance,value.attenuation] end if
  return [value.left/masterVolume,value.right/masterVolume,value.distance,value.attenuation]
end function
