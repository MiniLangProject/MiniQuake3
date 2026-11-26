// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 S_RawSamples ring used by cinematics and other streamed PCM sources.
package mq3.audio.snd_raw_stream

import mq3.compat.numeric as numeric

/// Number of mono sample positions in each raw-stream ring buffer.
const MAX_RAW_SAMPLES=16384
/// Bit mask that wraps absolute raw-stream sample positions into the ring buffer.
const RAW_MASK=MAX_RAW_SAMPLES-1

/// State record for audio.snd_raw_stream, containing `outputRate`, `soundTime`, `rawEnd`, `left`, `right`.
struct State
  /// Output sample rate in hertz.
  outputRate
  /// Absolute sample position currently consumed by playback.
  soundTime
  /// Exclusive absolute sample position through which raw input has been buffered.
  rawEnd
  /// Ring buffer of left-channel raw sample values.
  left
  /// Ring buffer of right-channel raw sample values.
  right
end struct

/// Create the audio.snd_raw_stream error for `fail` with 7712 and the supplied diagnostic text.
/// @param message Message used in `("S_RawSamples: " + message)` and `error(7712, ("S_RawSamples: " + message))`.
function fail(message) return error(7712,"S_RawSamples: "+message) end function

/// Create snd raw stream in audio.snd_raw_stream; the normal completion returns `State(outputRate, 0, 0, array(MAX_RAW_SAMPLES, 0), array(MAX_RAW_SAMPLES, 0))`.
/// @param outputRate Initial `outputRate` field stored in the returned or constructed `mq3.audio.snd_raw_stream.State` record.
function create(outputRate)
  if outputRate<4000 or outputRate>192000 then return fail("invalid output rate") end if
  return State(outputRate,0,0,array(MAX_RAW_SAMPLES,0),array(MAX_RAW_SAMPLES,0))
end function

/// Decode a signed 16-bit little-endian PCM sample for audio.snd_raw_stream.
/// @param data Data used in `data[offset]` and `data[(offset + 1)]`.
/// @param offset Zero-based index into `data`.
function signed16(data,offset)
  value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value
end function
/// Decode a signed 8-bit PCM sample for audio.snd_raw_stream.
/// @param value Value used in `(value - 256)` and `(value >= 128)`.
function signed8(value) if value>=128 then return value-256 end if;return value end function

/// Set sound time in audio.snd_raw_stream; the normal completion returns `value`.
///
/// Direct state writes: `state.soundTime`, `state.rawEnd`.
/// @param state Record exposing `rawEnd`. Updated in place: `soundTime`, `rawEnd`.
/// @param value Value used in `(value < 0)` and `(state.rawEnd < value)`.
function setSoundTime(state,value)
  if state==void or value<0 then return fail("invalid sound time") end if
  state.soundTime=value;if state.rawEnd<value then state.rawEnd=value end if;return value
end function

/// Store snd raw stream in audio.snd_raw_stream; updates `state.rawEnd`.
///
/// Direct state writes: `state.rawEnd`.
/// @param state Record exposing `rawEnd`, `left`, `right`. Updated in place: `rawEnd`.
/// @param left Left operand used by `store`; its reads are shown in the implementation.
/// @param right Right operand used by `store`; its reads are shown in the implementation.
function store(state,left,right)
  destination=state.rawEnd&RAW_MASK;state.rawEnd=state.rawEnd+1
  state.left[destination]=left;state.right[destination]=right;return void
end function

// This follows the four conversion branches in Baseq3 S_RawSamples. Values
// in the ring retain the original 24.8 paintbuffer scale.
/// @param state Record exposing `rawEnd`, `soundTime`, `outputRate`. Updated in place: `rawEnd`.
/// @param samples Samples used in `(samples < 0)` and `(samples - 1)`.
/// @param rate Rate used in `(rate <= 0)` and `(rate / state.outputRate)`.
/// @param width Width used in `(width != 1)` and `(width != 2)`.
/// @param channels Channels used in `(channels != 1)` and `(channels != 2)`.
/// @param data Data passed as `data` to `mq3.audio.snd_raw_stream.signed16`.
/// @param volume Volume used in `(256.0 * volume)` and `numeric.trunc32((256.0 * volume))`.
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

/// Paint snd raw stream in audio.snd_raw_stream; the normal completion returns `(stop - paintedTime)`.
///
/// Direct state writes: `paint elements`.
/// @param state Record exposing `rawEnd`, `left`, `right`.
/// @param paint Mutable sequence written at `destination`, `(destination + 1)`.
/// @param paintedTime Painted time used in `(paintedTime < 0)` and `(time - paintedTime)`.
/// @param count Count used in `(count < 0)` and `(count * 2)`.
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
