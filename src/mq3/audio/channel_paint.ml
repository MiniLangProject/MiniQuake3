// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CPU-side 16-bit channel painting from client/snd_mix.c.
package mq3.audio.channel_paint
import mq3.compat.numeric as n

const SND_CHUNK_SIZE=1024

/// Create the audio.channel_paint error for `fail` with 7250 and the supplied diagnostic text.
/// @param message Message used in `("audio channel paint: " + message)` and `error(7250, ("audio channel paint: " + message))`.
function fail(message)
  return error(7250,"audio channel paint: "+message)
end function

/// Check that channel PCM contains a nonempty integral number of 1024-sample chunks.
/// @param samples PCM sample array representing the cyclic sndBuffer chunk chain.
function validSamples(samples)
  return len(samples)>=SND_CHUNK_SIZE and (len(samples)%SND_CHUNK_SIZE)==0
end function

/// Wrap a source sample index into the cyclic PCM array, including negative indices.
/// @param samples Nonempty cyclic sample array.
/// @param index Logical sample index before modulo wrapping.
function sourceIndex(samples,index)
  size=len(samples);result=index%size
  if result<0 then result=result+size end if
  return result
end function

/// Accumulate one PCM sample into adjacent left and right paint entries using signed 32-bit mixer arithmetic.
///
/// Direct state writes: `paint elements`.
/// @param paint Mutable interleaved integer paint buffer.
/// @param index Index of the left paint entry; the right entry is index + 1.
/// @param data Signed source PCM sample.
/// @param leftVolume Left channel scale, shifted right by eight after multiplication.
/// @param rightVolume Right channel scale, shifted right by eight after multiplication.
function addScaled(paint,index,data,leftVolume,rightVolume)
  left=n.sar32(n.mul32(data,leftVolume),8)
  right=n.sar32(n.mul32(data,rightVolume),8)
  paint[index]=n.add32(paint[index],left)
  paint[index+1]=n.add32(paint[index+1],right)
end function

// paint is interleaved [left,right,...]. samples represents the linked 1024
// sample sndBuffer chunks as one cyclic array. The result is modified in place.
/// @param samples Cyclic signed PCM array containing complete 1024-sample chunks.
/// @param count Number of output stereo frames to paint.
/// @param sampleOffset Starting source sample offset before Doppler adjustment.
/// @param bufferOffset Starting stereo-frame offset in paint.
/// @param leftVol Left channel gain before sound-volume scaling.
/// @param rightVol Right channel gain before sound-volume scaling.
/// @param sndVol Overall sound gain multiplied into both channel gains.
/// @param doppler Whether to resample using Doppler scale changes.
/// @param dopplerScale Positive current source-step scale.
/// @param oldDopplerScale Nonnegative scale used to adjust the starting source offset.
/// @param paint Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries.
function paint16(samples,count,sampleOffset,bufferOffset,leftVol,rightVol,sndVol,doppler,dopplerScale,oldDopplerScale,paint)
  if not validSamples(samples) then return fail("sample data must contain complete 1024-sample chunks") end if
  if count<0 or sampleOffset<0 or bufferOffset<0 then return fail("negative range") end if
  if len(paint)<(bufferOffset+count)*2 then return fail("truncated paintbuffer") end if
  if dopplerScale<=0.0 or oldDopplerScale<0.0 then return fail("invalid Doppler scale") end if
  leftVolume=n.mul32(leftVol,sndVol);rightVolume=n.mul32(rightVol,sndVol)
  start=sampleOffset
  if doppler then start=n.trunc32(n.fmul(n.f32(sampleOffset),n.f32(oldDopplerScale))) end if
  if not doppler or dopplerScale==1.0 then
    for i=0 to count-1
      data=samples[sourceIndex(samples,start+i)]
      addScaled(paint,(bufferOffset+i)*2,data,leftVolume,rightVolume)
    end for
    return paint
  end if

  leftFloat=n.f32(leftVolume);rightFloat=n.f32(rightVolume)
  offset=n.f32(start);scale=n.f32(dopplerScale)
  for i=0 to count-1
    first=n.trunc32(offset)
    offset=n.fadd(offset,scale)
    last=n.trunc32(offset)
    total=n.f32(0.0)
    for j=first to last-1
      total=n.fadd(total,n.f32(samples[sourceIndex(samples,j)]))
    end for
    divisor=n.f32(256*(last-first))
    left=n.fdiv(n.fmul(total,leftFloat),divisor)
    right=n.fdiv(n.fmul(total,rightFloat),divisor)
    destination=(bufferOffset+i)*2
    paint[destination]=n.trunc32(n.fadd(n.f32(paint[destination]),left))
    paint[destination+1]=n.trunc32(n.fadd(n.f32(paint[destination+1]),right))
  end for
  return paint
end function
