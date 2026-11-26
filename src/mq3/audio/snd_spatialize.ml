// SPDX-License-Identifier: GPL-2.0-or-later
// Integer channel-volume calculation from Baseq3 S_SpatializeOrigin.
package mq3.audio.snd_spatialize

import mq3.compat.numeric as numeric
import mq3.shared.math as qmath

/// Distance in world units within which distance attenuation is not applied.
const SOUND_FULLVOLUME=80.0
/// Linear gain reduction per world unit beyond the full-volume distance.
const SOUND_ATTENUATE=0.0008

/// Volumes record for audio.snd_spatialize, containing `left`, `right`, `distance`, `attenuation`, `dot`.
struct Volumes
  /// Left-channel integer volume after distance and direction attenuation.
  left
  /// Right-channel integer volume after distance and direction attenuation.
  right
  /// Distance in world units from the source to the listener.
  distance
  /// Distance-dependent gain remaining after the full-volume region.
  attenuation
  /// Clamped dot product between source direction and the listener's right axis.
  dot
end struct

/// Create the audio.snd_spatialize error for `fail` with 7662 and the supplied diagnostic text.
/// @param message Message used in `("S_SpatializeOrigin: " + message)` and `error(7662, ("S_SpatializeOrigin: " + message))`.
function fail(message) return error(7662,"S_SpatializeOrigin: "+message) end function

/// Compute audio.snd_spatialize.validVector as `((value != void) and (len(value) == 3))`.
/// @param value Value used in `len(value)` and `(value != void)`.
function validVector(value) return value!=void and len(value)==3 end function

/// Calculate left/right gains from listener orientation, source distance, and attenuation.
/// @param origin Value passed as `value` to `mq3.audio.snd_spatialize.validVector`.
/// @param listenerOrigin Value passed as `value` to `mq3.audio.snd_spatialize.validVector`.
/// @param listenerAxis Listener axis used in `listenerAxis[0]` and `listenerAxis[1]`.
/// @param masterVolume Floating-point value to narrow to binary32.
/// @param channels Channels used in `(channels != 1)` and `(channels != 2)`.
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

/// Convert spatialized channel volumes into normalized left/right gains with distance and attenuation metadata.
/// @param origin Origin passed as `origin` to `mq3.audio.snd_spatialize.spatialize`.
/// @param listenerOrigin Listener origin passed as `listenerOrigin` to `mq3.audio.snd_spatialize.spatialize`.
/// @param listenerAxis Listener axis passed as `listenerAxis` to `mq3.audio.snd_spatialize.spatialize`.
/// @param masterVolume Master volume passed as `masterVolume` to `mq3.audio.snd_spatialize.spatialize`.
function gains(origin,listenerOrigin,listenerAxis,masterVolume)
  value=try(spatialize(origin,listenerOrigin,listenerAxis,masterVolume,2));if value is error then return value end if
  if masterVolume==0 then return [0.0,0.0,value.distance,value.attenuation] end if
  return [value.left/masterVolume,value.right/masterVolume,value.distance,value.attenuation]
end function
