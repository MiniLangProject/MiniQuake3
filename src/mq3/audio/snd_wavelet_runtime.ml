// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete managed surface for code/client/snd_wavelet.c.
package mq3.audio.snd_wavelet_runtime

import mq3.audio.snd_compressed_paint as compressed
import mq3.compat.numeric as n

/// Maximum number of mono samples encoded in one wavelet or mu-law block.
const BLOCK_SAMPLES=2048
/// Stream record for audio.snd_wavelet_runtime, containing `data`, `count`.
struct Stream
  /// Encoded byte stream supplied to the wavelet or mu-law decoder.
  data
  /// Number of logical source samples represented by the encoded stream.
  count
end struct

/// Compute mu law encode in audio.snd_wavelet_runtime; the normal completion returns `(~ ((sign | (exponent << 4)) | mantissa) & 255)`.
/// @param sample Sample used in `(sample >= 0)`.
function MuLawEncode(sample)
  value=sample;if value<0 then value=0-value end if
  adjusted=value+132;if adjusted>32767 then adjusted=32767 end if
  high=(adjusted>>7)&255;bits=0;while high>0 bits=bits+1;high=high>>1 end while;exponent=bits-1
  mantissa=(adjusted>>(exponent+3))&15;sign=0;if sample>=0 then sign=128 end if
  return (~(sign|(exponent<<4)|mantissa))&255
end function

/// Return `mq3.audio.snd_compressed_paint.muLawDecode(value)` from `audio.snd_wavelet_runtime.MuLawDecode`.
/// @param value Value passed as `value` to `mq3.audio.snd_compressed_paint.muLawDecode`.
function MuLawDecode(value) return compressed.muLawDecode(value) end function
/// Return `mq3.audio.snd_compressed_paint.daub4(values, size, (isign < 0))` from `audio.snd_wavelet_runtime.daub4`.
/// @param values Values passed as `values` to `mq3.audio.snd_compressed_paint.daub4`.
/// @param size Size passed as `size` to `mq3.audio.snd_compressed_paint.daub4`.
/// @param isign Isign used in `(isign < 0)` and `compressed.daub4(values, size, (isign < 0))`.
function daub4(values,size,isign) return compressed.daub4(values,size,isign<0) end function

/// Compute wt 1 in audio.snd_wavelet_runtime; the normal completion returns `values`.
///
/// Validation failures include `wt1: invalid extent`.
/// @param values Values passed as `values` to `mq3.audio.snd_compressed_paint.daub4`.
/// @param size Size used in `(size < 0)` and `(size >> 2)`.
/// @param isign Isign used in `(isign >= 0)`.
function wt1(values,size,isign)
  if values==void or size<0 or size>len(values) then return error(7671,"wt1: invalid extent") end if
  start=size>>2;if start<1 then return values end if
  if isign>=0 then current=size;while current>=start compressed.daub4(values,current,false);current=current>>1 end while
  else current=start;while current<=size compressed.daub4(values,current,true);current=current<<1 end while end if
  return values
end function

/// Update `stream.data`, `stream.count` in audio.snd_wavelet_runtime.
///
/// Validation failures include `NXPutc: stream is required`.
/// Direct state writes: `stream.data`, `stream.count`.
/// @param stream Record exposing `data`, `count`. Updated in place: `data`, `count`.
/// @param outputByte Output byte used in `(outputByte & 255)` and `(stream.data + [(outputByte & 255)])`.
function NXPutc(stream,outputByte)
  if stream==void then return error(7671,"NXPutc: stream is required") end if
  stream.data=stream.data+[outputByte&255];stream.count=stream.count+1;return void
end function

/// Compute slice padded in audio.snd_wavelet_runtime; the normal completion returns `values`.
/// @param samples Samples used in `len(samples)` and `samples[(offset + index)]`.
/// @param offset Offset used in `(offset + index)` and `samples[(offset + index)]`.
/// @param count Count used in `(count - 1)` and `array(count, 0.0)`.
function slicePadded(samples,offset,count)
  values=array(count,0.0)
  for index=0 to count-1 if offset+index<len(samples) then values[index]=n.f32(samples[offset+index]) end if end for
  return values
end function

/// Encode wavelet in audio.snd_wavelet_runtime; the normal completion returns `compressed.Compressed(compressed.METHOD_WAVELET, blocks, len(samples))`.
///
/// Validation failures include `encodeWavelet: samples are required`.
/// @param samples Samples passed as `samples` to `mq3.audio.snd_wavelet_runtime.slicePadded`.
function encodeWavelet(samples)
  if samples==void or len(samples)==0 then return error(7671,"encodeWavelet: samples are required") end if
  blocks=[];offset=0
  while offset<len(samples)
    logical=len(samples)-offset;size=logical;if size>BLOCK_SAMPLES then size=BLOCK_SAMPLES end if;if size<4 then size=4 end if
    work=slicePadded(samples,offset,size);wt1(work,size,1);data=bytes(size,0)
    for index=0 to size-1 value=n.trunc32(work[index]);if value>32767 then value=32767 else if value<(-32768) then value=-32768 end if;data[index]=MuLawEncode(value) end for
    blocks=blocks+[compressed.Block(data,size,0,0)];offset=offset+logical
  end while
  return compressed.Compressed(compressed.METHOD_WAVELET,blocks,len(samples))
end function

/// Return `mq3.audio.snd_compressed_paint.waveletDecode(block.data, block.size)` from `audio.snd_wavelet_runtime.decodeWavelet`.
/// @param block Record exposing `data`, `size`.
function decodeWavelet(block) return compressed.waveletDecode(block.data,block.size) end function

/// Encode mu law in audio.snd_wavelet_runtime; the normal completion returns `compressed.Compressed(compressed.METHOD_MULAW, blocks, len(samples))`.
///
/// Validation failures include `encodeMuLaw: samples are required`.
/// @param samples Samples used in `len(samples)` and `(samples == void)`.
function encodeMuLaw(samples)
  if samples==void or len(samples)==0 then return error(7671,"encodeMuLaw: samples are required") end if
  blocks=[];offset=0;grade=0
  while offset<len(samples)
    size=len(samples)-offset;if size>BLOCK_SAMPLES then size=BLOCK_SAMPLES end if;data=bytes(size,0)
    for index=0 to size-1 value=samples[offset+index]+grade;if value>32767 then value=32767 else if value<(-32768) then value=-32768 end if;encoded=MuLawEncode(value);data[index]=encoded;grade=value-MuLawDecode(encoded) end for
    blocks=blocks+[compressed.Block(data,size,0,0)];offset=offset+size
  end while
  return compressed.Compressed(compressed.METHOD_MULAW,blocks,len(samples))
end function

/// Decode mu law in audio.snd_wavelet_runtime; the normal completion returns `result`.
///
/// Validation failures include `decodeMuLaw: invalid block`.
/// @param block Record exposing `data`, `size`.
function decodeMuLaw(block)
  if block==void or block.data==void or block.size<0 or block.size>len(block.data) then return error(7671,"decodeMuLaw: invalid block") end if
  result=array(block.size,0);for index=0 to block.size-1 result[index]=MuLawDecode(block.data[index]) end for;return result
end function
