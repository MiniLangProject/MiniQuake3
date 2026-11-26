// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 compressed-sfx decoders and snd_mix.c paint paths.
package mq3.audio.snd_compressed_paint

import mq3.compat.numeric as n

/// Compression-method identifier for four-bit adaptive differential PCM.
const METHOD_ADPCM=1
/// Compression-method identifier for the wavelet sound decoder.
const METHOD_WAVELET=2
/// Compression-method identifier for eight-bit mu-law sound data.
const METHOD_MULAW=3
/// Maximum number of decoded mono samples represented by an ADPCM block.
const ADPCM_BLOCK_SAMPLES=4096
/// Maximum number of samples represented by a byte-coded sound block.
const BYTE_BLOCK_SAMPLES=2048

/// Block record for audio.snd_compressed_paint, containing `data`, `size`, `sample`, `index`.
struct Block
  /// Encoded bytes for this compressed sound block.
  data
  /// Number of logical mono samples represented by the block.
  size
  /// Previous reconstructed sample used as the ADPCM predictor.
  sample
  /// Index into the ADPCM step-size table.
  index
end struct
/// Compressed record for audio.snd_compressed_paint, containing `compression`, `blocks`, `length`.
struct Compressed
  /// Compression-method identifier selecting the block decoder.
  compression
  /// Compressed blocks in playback order.
  blocks
  /// Total logical number of mono samples across all compressed blocks.
  length
end struct

/// Compute audio.snd_compressed_paint.indexTable as `[- 1, - 1, - 1, - 1, 2, 4, 6, 8, - 1, - 1, - 1, - 1, 2, 4, 6, 8]`.
function indexTable() return [-1,-1,-1,-1,2,4,6,8,-1,-1,-1,-1,2,4,6,8] end function
/// Return the fixed IMA ADPCM quantization-step lookup table.
function stepTable() return [7,8,9,10,11,12,13,14,16,17,19,21,23,25,28,31,34,37,41,45,50,55,60,66,73,80,88,97,107,118,130,143,157,173,190,209,230,253,279,307,337,371,408,449,494,544,598,658,724,796,876,963,1060,1166,1282,1411,1552,1707,1878,2066,2272,2499,2749,3024,3327,3660,4026,4428,4871,5358,5894,6484,7132,7845,8630,9493,10442,11487,12635,13899,15289,16818,18500,20350,22385,24623,27086,29794,32767] end function

/// Create the audio.snd_compressed_paint error for `fail` with 7668 and the supplied diagnostic text.
/// @param message Message used in `("compressed sound paint: " + message)` and `error(7668, ("compressed sound paint: " + message))`.
function fail(message) return error(7668,"compressed sound paint: "+message) end function

/// Decode an IMA ADPCM block into signed PCM samples while advancing predictor and step-index state.
/// @param data Data used in `len(data)` and `(data == void)`.
/// @param count Count used in `(count < 0)` and `(count - 1)`.
/// @param predictor Predictor operand used by `adpcmDecode`; its reads are shown in the implementation.
/// @param startIndex Start index used in `(startIndex < 0)` and `(startIndex > 88)`.
function adpcmDecode(data,count,predictor,startIndex)
  if data==void or count<0 or len(data)*2<count then return fail("truncated ADPCM block") end if
  if startIndex<0 or startIndex>88 then return fail("invalid ADPCM index") end if
  indexes=indexTable();steps=stepTable();output=array(count,0);value=predictor;stepIndex=startIndex;step=steps[stepIndex]
  for position=0 to count-1
    packed=data[position>>1];delta=packed&15;if (position&1)==0 then delta=(packed>>4)&15 end if
    stepIndex=stepIndex+indexes[delta];if stepIndex<0 then stepIndex=0 else if stepIndex>88 then stepIndex=88 end if
    sign=delta&8;magnitude=delta&7;difference=step>>3
    if (magnitude&4)!=0 then difference=difference+step end if
    if (magnitude&2)!=0 then difference=difference+(step>>1) end if
    if (magnitude&1)!=0 then difference=difference+(step>>2) end if
    if sign!=0 then value=value-difference else value=value+difference end if
    if value>32767 then value=32767 else if value<(-32768) then value=-32768 end if
    step=steps[stepIndex];output[position]=value
  end for
  return output
end function

/// Expand one mu-law code byte into a signed PCM amplitude.
/// @param value Value used in `(~ value & 255)`.
function muLawDecode(value)
  decoded=(~value)&255;exponent=(decoded>>4)&7;mantissa=(decoded&15)+16
  adjusted=(mantissa<<(exponent+3))-132
  if (decoded&128)!=0 then return adjusted end if
  return 0-adjusted
end function

/// Update `values entries` in audio.snd_compressed_paint; the normal completion returns `values`.
///
/// Direct state writes: `values elements`.
/// @param values Mutable sequence written at `position`.
/// @param size Size used in `(size < 4)` and `(size - 4)`.
/// @param inverse Inverse operand used by `daub4`; its reads are shown in the implementation.
function daub4(values,size,inverse)
  if size<4 then return values end if
  c0=0.4829629131445341;c1=0.8365163037378079;c2=0.2241438680420134;c3=-0.1294095225512604
  work=array(size,0.0);half=size>>1
  if not inverse then
    destination=0;source=0
    while source<=size-4
      work[destination]=n.f32(c0*values[source]+c1*values[source+1]+c2*values[source+2]+c3*values[source+3])
      work[destination+half]=n.f32(c3*values[source]-c2*values[source+1]+c1*values[source+2]-c0*values[source+3])
      destination=destination+1;source=source+2
    end while
    work[destination]=n.f32(c0*values[size-2]+c1*values[size-1]+c2*values[0]+c3*values[1])
    work[destination+half]=n.f32(c3*values[size-2]-c2*values[size-1]+c1*values[0]-c0*values[1])
  else
    work[0]=n.f32(c2*values[half-1]+c1*values[size-1]+c0*values[0]+c3*values[half])
    work[1]=n.f32(c3*values[half-1]-c0*values[size-1]+c1*values[0]-c2*values[half])
    destination=2
    for source=0 to half-2
      work[destination]=n.f32(c2*values[source]+c1*values[source+half]+c0*values[source+1]+c3*values[source+half+1]);destination=destination+1
      work[destination]=n.f32(c3*values[source]-c0*values[source+half]+c1*values[source+1]-c2*values[source+half+1]);destination=destination+1
    end for
  end if
  for position=0 to size-1 values[position]=work[position] end for
  return values
end function

/// Expand compressed wavelet coefficients into the requested PCM sample block.
/// @param data Data used in `len(data)` and `(data == void)`.
/// @param size Size used in `(size < 0)` and `(size - 1)`.
function waveletDecode(data,size)
  if data==void or size<0 or len(data)<size then return fail("truncated wavelet block") end if
  values=array(size,0.0);for position=0 to size-1 values[position]=n.f32(muLawDecode(data[position])) end for
  current=size>>2
  while current<=size and current>0
    daub4(values,current,true);current=current<<1
  end while
  output=array(size,0);for position=0 to size-1 output[position]=n.trunc32(values[position]) end for
  return output
end function

/// Decode block in audio.snd_compressed_paint; the normal completion returns `fail("unknown compression method")`.
/// @param compressed Record exposing `compression`.
/// @param block Record exposing `data`, `size`, `sample`, `index`.
function decodeBlock(compressed,block)
  if compressed.compression==METHOD_ADPCM then return adpcmDecode(block.data,block.size,block.sample,block.index) end if
  if compressed.compression==METHOD_MULAW then
    if block.data==void or block.size<0 or len(block.data)<block.size then return fail("truncated MuLaw block") end if
    result=array(block.size,0);for position=0 to block.size-1 result[position]=muLawDecode(block.data[position]) end for;return result
  end if
  if compressed.compression==METHOD_WAVELET then return waveletDecode(block.data,block.size) end if
  return fail("unknown compression method")
end function

/// Compute decoded samples in audio.snd_compressed_paint; the normal completion returns `output`.
/// @param compressed Record exposing `blocks`, `length`.
function decodedSamples(compressed)
  if compressed==void or compressed.blocks==void or compressed.length<0 then return fail("invalid compressed sound") end if
  output=[]
  for each block in compressed.blocks samples=try(decodeBlock(compressed,block));if samples is error then return samples end if;output=output+samples end for
  if len(output)<compressed.length then return fail("compressed sound shorter than declared length") end if
  if len(output)>compressed.length then result=array(compressed.length,0);for i=0 to compressed.length-1 result[i]=output[i] end for;return result end if
  return output
end function

/// Add sample in audio.snd_compressed_paint; updates `paint entries`.
///
/// Direct state writes: `paint elements`.
/// @param paint Mutable sequence written at `destination`, `(destination + 1)`.
/// @param frame Frame used in `(frame * 2)`.
/// @param data Left integer operand; only its low 32 bits participate.
/// @param leftVolume Right integer operand; only its low 32 bits participate.
/// @param rightVolume Right integer operand; only its low 32 bits participate.
function addSample(paint,frame,data,leftVolume,rightVolume)
  destination=frame*2
  paint[destination]=n.add32(paint[destination],n.sar32(n.mul32(data,leftVolume),8))
  paint[destination+1]=n.add32(paint[destination+1],n.sar32(n.mul32(data,rightVolume),8))
end function

// Mirrors the three compressed S_PaintChannelFrom* entry points. Wavelet and
// ADPCM use decoded scratch blocks; MuLaw retains the original nearest-sample
// Doppler stepping. The caller splits loops at the logical sfx length.
/// @param paintBuffer Paint passed as `paint` to `mq3.audio.snd_compressed_paint.addSample`.
/// @param compressed Record exposing `length`, `compression`.
/// @param count Count used in `(count < 0)` and `(count - 1)`.
/// @param sampleOffset Sample offset used in `(sampleOffset < 0)` and `(sampleOffset + count)`.
/// @param bufferOffset Buffer offset used in `(bufferOffset < 0)` and `(bufferOffset + i)`.
/// @param leftVol Left integer operand; only its low 32 bits participate.
/// @param rightVol Left integer operand; only its low 32 bits participate.
/// @param sndVol Right integer operand; only its low 32 bits participate.
/// @param doppler Doppler used in `((compressed.compression == METHOD_ADPCM) and doppler)` and `((compressed.compression == METHOD_MULAW) and doppler)`.
/// @param dopplerScale Floating-point value to narrow to binary32.
/// @param oldDopplerScale Old doppler scale used in `(oldDopplerScale < 0.0)` and `(sampleOffset * oldDopplerScale)`.
function paint(paintBuffer,compressed,count,sampleOffset,bufferOffset,leftVol,rightVol,sndVol,doppler,dopplerScale,oldDopplerScale)
  if compressed==void then return fail("compressed sound is required") end if
  if count<0 or sampleOffset<0 or bufferOffset<0 or sampleOffset+count>compressed.length then return fail("paint range outside sound") end if
  if len(paintBuffer)<(bufferOffset+count)*2 then return fail("truncated paintbuffer") end if
  if dopplerScale<=0.0 or oldDopplerScale<0.0 then return fail("invalid Doppler scale") end if
  samples=try(decodedSamples(compressed));if samples is error then return samples end if
  leftVolume=n.mul32(leftVol,sndVol);rightVolume=n.mul32(rightVol,sndVol);start=sampleOffset
  if compressed.compression==METHOD_ADPCM and doppler then start=n.trunc32(sampleOffset*oldDopplerScale) end if
  if start<0 or start>=len(samples) then return fail("Doppler offset outside sound") end if
  if compressed.compression==METHOD_MULAW and doppler then
    offset=n.f32(start);scale=n.f32(dopplerScale)
    for i=0 to count-1
      source=n.trunc32(offset);if source>=len(samples) then source=source%len(samples) end if
      addSample(paintBuffer,bufferOffset+i,samples[source],leftVolume,rightVolume);offset=n.fadd(offset,scale)
    end for
  else
    if start+count>len(samples) then return fail("decoded paint range outside sound") end if
    for i=0 to count-1 addSample(paintBuffer,bufferOffset+i,samples[start+i],leftVolume,rightVolume) end for
  end if
  return count
end function
