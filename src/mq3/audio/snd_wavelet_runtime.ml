// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete managed surface for code/client/snd_wavelet.c.
package mq3.audio.snd_wavelet_runtime

import mq3.audio.snd_compressed_paint as compressed
import mq3.compat.numeric as n

const BLOCK_SAMPLES=2048
struct Stream data count end struct

function MuLawEncode(sample)
  value=sample;if value<0 then value=0-value end if
  adjusted=value+132;if adjusted>32767 then adjusted=32767 end if
  high=(adjusted>>7)&255;bits=0;while high>0 bits=bits+1;high=high>>1 end while;exponent=bits-1
  mantissa=(adjusted>>(exponent+3))&15;sign=0;if sample>=0 then sign=128 end if
  return (~(sign|(exponent<<4)|mantissa))&255
end function

function MuLawDecode(value) return compressed.muLawDecode(value) end function
function daub4(values,size,isign) return compressed.daub4(values,size,isign<0) end function

function wt1(values,size,isign)
  if values==void or size<0 or size>len(values) then return error(7671,"wt1: invalid extent") end if
  start=size>>2;if start<1 then return values end if
  if isign>=0 then current=size;while current>=start compressed.daub4(values,current,false);current=current>>1 end while
  else current=start;while current<=size compressed.daub4(values,current,true);current=current<<1 end while end if
  return values
end function

function NXPutc(stream,outputByte)
  if stream==void then return error(7671,"NXPutc: stream is required") end if
  stream.data=stream.data+[outputByte&255];stream.count=stream.count+1;return void
end function

function slicePadded(samples,offset,count)
  values=array(count,0.0)
  for index=0 to count-1 if offset+index<len(samples) then values[index]=n.f32(samples[offset+index]) end if end for
  return values
end function

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

function decodeWavelet(block) return compressed.waveletDecode(block.data,block.size) end function

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

function decodeMuLaw(block)
  if block==void or block.data==void or block.size<0 or block.size>len(block.data) then return error(7671,"decodeMuLaw: invalid block") end if
  result=array(block.size,0);for index=0 to block.size-1 result[index]=MuLawDecode(block.data[index]) end for;return result
end function
