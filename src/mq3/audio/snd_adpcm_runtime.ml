// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete managed IMA-ADPCM surface for code/client/snd_adpcm.c.
package mq3.audio.snd_adpcm_runtime

import mq3.audio.snd_compressed_paint as compressed
import mq3.compat.numeric as n

/// Maximum number of mono samples encoded in one ADPCM block.
const BLOCK_SAMPLES=4096
/// Bytes of predictor and step-index overhead reserved for each ADPCM block.
const HEADER_BYTES=8
/// State record for audio.snd_adpcm_runtime, containing `sample`, `index`.
struct State
  /// Previous reconstructed sample used as the ADPCM predictor.
  sample
  /// Index into the ADPCM step-size table.
  index
end struct
/// Encoded record for audio.snd_adpcm_runtime, containing `data`, `state`.
struct Encoded
  /// Packed four-bit ADPCM codes, with two codes stored in each byte.
  data
  /// Final predictor sample and step index needed to continue encoding.
  state
end struct

/// Clamp index in audio.snd_adpcm_runtime; the normal completion returns `value`.
/// @param value Value used in `(value < 0)` and `(value > 88)`.
function clampIndex(value) if value<0 then return 0 end if;if value>88 then return 88 end if;return value end function
/// Clamp sample in audio.snd_adpcm_runtime; the normal completion returns `value`.
/// @param value Value used in `(value > 32767)` and `(value < - 32768)`.
function clampSample(value) if value>32767 then return 32767 end if;if value<(-32768) then return -32768 end if;return value end function

/// Update `state.sample`, `state.index` in audio.snd_adpcm_runtime; the normal completion returns `Encoded(output, state)`.
///
/// Validation failures include `S_AdpcmEncode: invalid input`.
/// Direct state writes: `state.sample`, `state.index`.
/// @param samples Samples used in `len(samples)` and `(samples == void)`.
/// @param state Record exposing `index`, `sample`. Updated in place: `sample`, `index`.
function S_AdpcmEncode(samples,state)
  if samples==void or state==void or state.index<0 or state.index>88 then return error(7670,"S_AdpcmEncode: invalid input") end if
  indexes=compressed.indexTable();steps=compressed.stepTable();output=bytes((len(samples)+1)>>1,0);predicted=state.sample;stepIndex=state.index;step=steps[stepIndex]
  for position=0 to len(samples)-1
    difference=samples[position]-predicted;sign=0;if difference<0 then sign=8;difference=0-difference end if
    delta=0;change=step>>3
    if difference>=step then delta=4;difference=difference-step;change=change+step end if
    half=step>>1;if difference>=half then delta=delta|2;difference=difference-half;change=change+half end if
    quarter=half>>1;if difference>=quarter then delta=delta|1;change=change+quarter end if
    if sign!=0 then predicted=predicted-change else predicted=predicted+change end if;predicted=clampSample(predicted)
    delta=delta|sign;stepIndex=clampIndex(stepIndex+indexes[delta]);step=steps[stepIndex]
    byteIndex=position>>1;if (position&1)==0 then output[byteIndex]=(delta<<4)&240 else output[byteIndex]=output[byteIndex]|(delta&15) end if
  end for
  state.sample=predicted;state.index=stepIndex
  return Encoded(output,state)
end function

/// Update `state.sample`, `state.index` in audio.snd_adpcm_runtime; the normal completion returns `samples`.
///
/// Validation failures include `S_AdpcmDecode: state is required`.
/// Direct state writes: `state.sample`, `state.index`.
/// @param data Data passed as `data` to `mq3.audio.snd_compressed_paint.adpcmDecode`.
/// @param count Count passed as `count` to `mq3.audio.snd_compressed_paint.adpcmDecode`.
/// @param state Record exposing `sample`, `index`. Updated in place: `sample`, `index`.
function S_AdpcmDecode(data,count,state)
  if state==void then return error(7670,"S_AdpcmDecode: state is required") end if
  samples=try(compressed.adpcmDecode(data,count,state.sample,state.index));if samples is error then return samples end if
  indexes=compressed.indexTable();steps=compressed.stepTable();predicted=state.sample;stepIndex=state.index;step=steps[stepIndex]
  for position=0 to count-1
    packed=data[position>>1];delta=packed&15;if (position&1)==0 then delta=(packed>>4)&15 end if
    stepIndex=clampIndex(stepIndex+indexes[delta]);change=step>>3;if (delta&4)!=0 then change=change+step end if;if (delta&2)!=0 then change=change+(step>>1) end if;if (delta&1)!=0 then change=change+(step>>2) end if
    if (delta&8)!=0 then predicted=predicted-change else predicted=predicted+change end if;predicted=clampSample(predicted);step=steps[stepIndex]
  end for
  state.sample=predicted;state.index=stepIndex;return samples
end function

/// Compute adpcm get samples in audio.snd_adpcm_runtime; the normal completion returns `S_AdpcmDecode(block.data, block.size, state)`.
/// @param block Record exposing `sample`, `index`, `data`, `size`.
function S_AdpcmGetSamples(block)
  state=State(block.sample,block.index)
  return S_AdpcmDecode(block.data,block.size,state)
end function

/// Compute adpcm encode sound in audio.snd_adpcm_runtime; the normal completion returns `compressed.Compressed(compressed.METHOD_ADPCM, blocks, len(samples))`.
///
/// Validation failures include `S_AdpcmEncodeSound: samples are required`.
/// @param samples Samples used in `samples[0]` and `len(samples)`.
function S_AdpcmEncodeSound(samples)
  if samples==void or len(samples)==0 then return error(7670,"S_AdpcmEncodeSound: samples are required") end if
  state=State(samples[0],0);blocks=[];offset=0
  while offset<len(samples)
    count=len(samples)-offset;if count>BLOCK_SAMPLES then count=BLOCK_SAMPLES end if
    part=array(count,0);for index=0 to count-1 part[index]=samples[offset+index] end for
    startSample=state.sample;startIndex=state.index;encoded=try(S_AdpcmEncode(part,state));if encoded is error then return encoded end if
    blocks=blocks+[compressed.Block(encoded.data,count,startSample,startIndex)];offset=offset+count
  end while
  return compressed.Compressed(compressed.METHOD_ADPCM,blocks,len(samples))
end function

/// Compute adpcm memory needed in audio.snd_adpcm_runtime; the normal completion returns `((scaled / 2) + (blocks * HEADER_BYTES))`.
///
/// Validation failures include `S_AdpcmMemoryNeeded: invalid format`.
/// @param rate Floating-point value to narrow to binary32.
/// @param samples Floating-point value to narrow to binary32.
/// @param dmaSpeed Floating-point value to narrow to binary32.
function S_AdpcmMemoryNeeded(rate,samples,dmaSpeed)
  if rate<=0 or samples<0 or dmaSpeed<=0 then return error(7670,"S_AdpcmMemoryNeeded: invalid format") end if
  scale=n.fdiv(n.f32(rate),n.f32(dmaSpeed));scaled=n.trunc32(n.fdiv(n.f32(samples),scale));blocks=scaled/BLOCK_SAMPLES;if (scaled%BLOCK_SAMPLES)!=0 then blocks=blocks+1 end if
  return scaled/2+blocks*HEADER_BYTES
end function

/// Return `mq3.audio.snd_adpcm_runtime.S_AdpcmMemoryNeeded(rate, samples, dmaSpeed)` from `audio.snd_adpcm_runtime.memory`.
/// @param rate Rate passed as `rate` to `mq3.audio.snd_adpcm_runtime.S_AdpcmMemoryNeeded`.
/// @param samples Samples passed as `samples` to `mq3.audio.snd_adpcm_runtime.S_AdpcmMemoryNeeded`.
/// @param dmaSpeed Dma speed passed as `dmaSpeed` to `mq3.audio.snd_adpcm_runtime.S_AdpcmMemoryNeeded`.
function memory(rate,samples,dmaSpeed) return S_AdpcmMemoryNeeded(rate,samples,dmaSpeed) end function
