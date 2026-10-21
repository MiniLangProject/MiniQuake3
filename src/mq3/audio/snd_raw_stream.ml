// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 S_RawSamples ring used by cinematics and other streamed PCM sources.
package mq3.audio.snd_raw_stream

import mq3.compat.numeric as numeric

const MAX_RAW_SAMPLES=16384
const RAW_MASK=MAX_RAW_SAMPLES-1

struct State outputRate soundTime rawEnd left right end struct

function fail(message) return error(7712,"S_RawSamples: "+message) end function

function create(outputRate)
  if outputRate<4000 or outputRate>192000 then return fail("invalid output rate") end if
  return State(outputRate,0,0,array(MAX_RAW_SAMPLES,0),array(MAX_RAW_SAMPLES,0))
end function

function signed16(data,offset)
  value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value
end function
function signed8(value) if value>=128 then return value-256 end if;return value end function

function setSoundTime(state,value)
  if state==void or value<0 then return fail("invalid sound time") end if
  state.soundTime=value;if state.rawEnd<value then state.rawEnd=value end if;return value
end function

function store(state,left,right)
  destination=state.rawEnd&RAW_MASK;state.rawEnd=state.rawEnd+1
  state.left[destination]=left;state.right[destination]=right;return void
end function

// This follows the four conversion branches in Baseq3 S_RawSamples. Values
// in the ring retain the original 24.8 paintbuffer scale.
function enqueue(state,samples,rate,width,channels,data,volume)
  if state==void or data==void or typeof(data)!="bytes" then return fail("state and PCM data are required") end if
  if samples<0 or rate<=0 or (width!=1 and width!=2) or (channels!=1 and channels!=2) then return fail("invalid stream format") end if
  needed=samples*width*channels;if needed>len(data) then return fail("truncated PCM stream") end if
  if state.rawEnd<state.soundTime then state.rawEnd=state.soundTime end if
  intVolume=numeric.trunc32(256.0*volume);scale=rate/state.outputRate;produced=0
  if channels==2 and width==2 and scale==1.0 then
    for index=0 to samples-1 store(state,numeric.mul32(signed16(data,index*4),intVolume),numeric.mul32(signed16(data,index*4+2),intVolume));produced=produced+1 end for
    return produced
  end if
  output=0
  while true
    source=numeric.trunc32(output*scale);if source>=samples then break end if
    left=0;right=0
    if width==2 then
      left=signed16(data,source*width*channels);right=left;if channels==2 then right=signed16(data,source*4+2) end if
      left=numeric.mul32(left,intVolume);right=numeric.mul32(right,intVolume)
    else
      scaled=numeric.mul32(intVolume,256)
      if channels==2 then left=numeric.mul32(signed8(data[source*2]),scaled);right=numeric.mul32(signed8(data[source*2+1]),scaled)
      else left=numeric.mul32(data[source]-128,scaled);right=left end if
    end if
    store(state,left,right);produced=produced+1;output=output+1
  end while
  return produced
end function

function paint(state,paint,paintedTime,count)
  if state==void or paint==void or paintedTime<0 or count<0 or len(paint)<count*2 then return fail("invalid paint request") end if
  stop=paintedTime+count;if stop>state.rawEnd then stop=state.rawEnd end if
  if stop<=paintedTime then return 0 end if
  for time=paintedTime to stop-1
    source=time&RAW_MASK;destination=(time-paintedTime)*2
    paint[destination]=state.left[source];paint[destination+1]=state.right[source]
  end for
  return stop-paintedTime
end function
