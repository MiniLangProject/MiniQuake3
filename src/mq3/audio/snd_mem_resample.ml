// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 snd_mem.c PCM cache conversion. Registered effects are mono signed
// 16-bit samples at the DMA rate before the channel mixer sees them.
package mq3.audio.snd_mem_resample

import mq3.audio.wav as wav
import mq3.compat.numeric as numeric

const MIN_RATE=4000
const MAX_RATE=192000
const MAX_OUTPUT_SAMPLES=67108864

/// Create the audio.snd_mem_resample error for `fail` with 7660 and the supplied diagnostic text.
/// @param message Message used in `("S_LoadSound: " + message)` and `error(7660, ("S_LoadSound: " + message))`.
function fail(message) return error(7660,"S_LoadSound: "+message) end function

/// Decode a signed 16-bit little-endian PCM sample for sound-cache resampling.
/// @param data PCM byte buffer with at least two bytes at offset.
/// @param offset Byte offset of the low-order sample byte.
/// @returns The signed sample value from -32768 through 32767.
function signed16(data as bytes,offset as int) returns int
  value=data[offset]|(data[offset+1]<<8)
  if value>=32768 then value=value-65536 end if
  return value
end function

/// Write 16 in audio.snd_mem_resample; updates `data entries`.
///
/// Direct state writes: `data elements`.
/// @param data Mutable sequence written at `offset`, `(offset + 1)`.
/// @param offset Offset used in `(offset + 1)`.
/// @param value Value used in `(value >> 8)` and `(value & 255)`.
function write16(data,offset,value)
  data[offset]=value&255;data[offset+1]=(value>>8)&255
  return void
end function

/// Compute the destination sample count from source and DMA rates using binary32 compatibility arithmetic.
/// @param samples Floating-point value to narrow to binary32.
/// @param inputRate Floating-point value to narrow to binary32.
/// @param outputRate Floating-point value to narrow to binary32.
function outputCount(samples,inputRate,outputRate)
  step=numeric.fdiv(numeric.f32(inputRate),numeric.f32(outputRate))
  return numeric.trunc32(numeric.fdiv(numeric.f32(samples),step))
end function

/// Resample source PCM into the sound-cache format using the original fixed-point stepping.
/// @param data PCM byte buffer with at least two bytes at offset.
/// @param inputRate Floating-point value to narrow to binary32.
/// @param inputWidth Input width used in `(inputWidth != 1)` and `(inputWidth != 2)`.
/// @param samples Floating-point value to narrow to binary32.
/// @param outputRate Floating-point value to narrow to binary32.
function resampleRaw(data,inputRate,inputWidth,samples,outputRate)
  if data==void then return fail("PCM data is required") end if
  if inputRate<MIN_RATE or inputRate>MAX_RATE or outputRate<MIN_RATE or outputRate>MAX_RATE then return fail("invalid sample rate") end if
  if inputWidth!=1 and inputWidth!=2 then return fail("only 8-bit or 16-bit PCM is supported") end if
  if samples<0 or samples>len(data)/inputWidth then return fail("PCM sample count exceeds data") end if
  step=numeric.fdiv(numeric.f32(inputRate),numeric.f32(outputRate))
  count=numeric.trunc32(numeric.fdiv(numeric.f32(samples),step))
  if count<0 or count>MAX_OUTPUT_SAMPLES then return fail("resampled PCM is too large") end if
  fractionStep=numeric.trunc32(numeric.fmul(step,numeric.f32(256.0)))
  if samples>0 and fractionStep<1 then return fail("sample-rate ratio has no fixed-point progress") end if
  output=bytes(count*2,0);sampleFraction=0
  for index=0 to count-1
    sourceSample=sampleFraction>>8;sampleFraction=sampleFraction+fractionStep
    if sourceSample>=samples then return fail("resampler exceeded source PCM") end if
    sample=0
    if inputWidth==2 then sample=signed16(data,sourceSample*2) else sample=(data[sourceSample]-128)<<8 end if
    write16(output,index*2,sample)
  end for
  return output
end function

/// Convert decoded WAV data into the mono 16-bit sound-cache representation.
/// @param sound Record exposing `channels`, `bitsPerSample`, `samples`, `blockAlign`, `sampleRate`.
/// @param outputRate Output rate passed as `outputRate` to `mq3.audio.snd_mem_resample.resampleRaw`.
function convert(sound,outputRate)
  if sound==void then return fail("decoded sound is required") end if
  if sound.channels!=1 then return fail("registered effects must be mono") end if
  width=sound.bitsPerSample/8
  count=len(sound.samples)/sound.blockAlign
  samples=try(resampleRaw(sound.samples,sound.sampleRate,width,count,outputRate));if samples is error then return samples end if
  return wav.Sound(outputRate,1,16,2,outputRate*2,samples)
end function
