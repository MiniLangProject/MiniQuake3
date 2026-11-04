// SPDX-License-Identifier: GPL-2.0-or-later
// Windows fast path for the purely numerical inner loops of S_PaintChannels.
// Channel selection, spatialisation, grouping and lifetime remain in MiniLang.
package mq3.audio.native_paint

extern function mixPcmNative(paint as ptr,paintBytes as i32,samples as ptr,sampleBytes as i32,channels as i32,bitsPerSample as i32,blockAlign as i32,sourceFrames as i32,sampleOffset as i32,count as i32,bufferOffset as i32,leftVolume as i32,rightVolume as i32,soundVolume as i32,looping as i32,doppler as i32,dopplerScale as double,oldDopplerScale as double) from "playable_ambient.dll" symbol "playable_ambient_mix_pcm" returns i32
extern function mixStreamNative(paint as ptr,paintBytes as i32,samples as ptr,sampleBytes as i32,channels as i32,bitsPerSample as i32,blockAlign as i32,sourceFrames as i32,sampleRate as i32,outputRate as i32,cursor as double,count as i32,bufferOffset as i32) from "playable_ambient.dll" symbol "playable_ambient_mix_stream" returns double
extern function finishNative(paint as ptr,paintBytes as i32,output as ptr,outputBytes as i32,frames as i32) from "playable_ambient.dll" symbol "playable_ambient_finish_mix" returns i32

struct Result samples peak end struct

function fail(message) return error(7717,"native audio paint: "+message) end function
function mixPcm(paint,sound,sourceFrames,sampleOffset,count,bufferOffset,leftVolume,rightVolume,soundVolume,looping,doppler,dopplerScale,oldDopplerScale)
  if paint==void or sound==void or typeof(paint)!="bytes" or typeof(sound.samples)!="bytes" then return fail("paint and PCM bytes are required") end if
  loopFlag=0;if looping then loopFlag=1 end if;dopplerFlag=0;if doppler then dopplerFlag=1 end if
  result=mixPcmNative(nativeBytesPtr(paint),len(paint),nativeBytesPtr(sound.samples),len(sound.samples),sound.channels,sound.bitsPerSample,sound.blockAlign,sourceFrames,sampleOffset,count,bufferOffset,leftVolume,rightVolume,soundVolume,loopFlag,dopplerFlag,dopplerScale,oldDopplerScale)
  if result<0 then return fail("PCM painter rejected the mix request") end if;return result
end function
function mixStream(paint,sound,sourceFrames,outputRate,cursor,count,bufferOffset)
  if paint==void or sound==void or typeof(paint)!="bytes" or typeof(sound.samples)!="bytes" then return fail("paint and stream bytes are required") end if
  result=mixStreamNative(nativeBytesPtr(paint),len(paint),nativeBytesPtr(sound.samples),len(sound.samples),sound.channels,sound.bitsPerSample,sound.blockAlign,sourceFrames,sound.sampleRate,outputRate,cursor,count,bufferOffset)
  if result<0.0 then return fail("stream painter rejected the mix request") end if;return result
end function
function finish(paint,frames)
  if paint==void or typeof(paint)!="bytes" or frames<0 or len(paint)<frames*8 then return fail("invalid paintbuffer") end if
  output=bytes(frames*4,0);peak=finishNative(nativeBytesPtr(paint),len(paint),nativeBytesPtr(output),len(output),frames)
  if peak<0 then return fail("paintbuffer transfer failed") end if;return Result(output,peak)
end function
