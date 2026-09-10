// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CPU-side paintbuffer transfer from client/snd_mix.c.
package mq3.audio.mixer_transfer
import mq3.compat.numeric as n

function fail(message)
  return error(7240,"audio mixer transfer: "+message)
end function

function powerOfTwo(value)
  return value>0 and (value&(value-1))==0
end function

function clamp16(value)
  if value>32767 then return 32767 end if
  if value<(-32768) then return -32768 end if
  return value
end function

// The paint array is interleaved [left,right,...], in the original 24.8 mix scale.
// output contains logical DMA samples: signed integers for 16-bit and bytes 0..255
// for 8-bit. It is modified in place, matching the DMA ring buffer.
function transfer(paint,paintedTime,endTime,sampleBits,channels,dmaSamples,output)
  if sampleBits!=8 and sampleBits!=16 then return fail("sample width must be 8 or 16") end if
  if channels!=1 and channels!=2 then return fail("channel count must be 1 or 2") end if
  if not powerOfTwo(dmaSamples) then return fail("DMA sample count must be a power of two") end if
  if paintedTime<0 or endTime<paintedTime then return fail("invalid paint interval") end if
  frames=endTime-paintedTime
  if len(paint)<frames*2 then return fail("truncated paintbuffer") end if
  if len(output)<dmaSamples then return fail("truncated DMA buffer") end if
  if frames==0 then return output end if
  outIndex=(paintedTime*channels)&(dmaSamples-1)
  source=0
  for frame=0 to frames-1
    value=clamp16(n.sar32(n.i32(paint[source]),8))
    if sampleBits==8 then value=(n.sar32(value,8)+128)&255 end if
    output[outIndex]=value;outIndex=(outIndex+1)&(dmaSamples-1)
    if channels==2 then
      value=clamp16(n.sar32(n.i32(paint[source+1]),8))
      if sampleBits==8 then value=(n.sar32(value,8)+128)&255 end if
      output[outIndex]=value;outIndex=(outIndex+1)&(dmaSamples-1)
    end if
    source=source+2
  end for
  return output
end function
