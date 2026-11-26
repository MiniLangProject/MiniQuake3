// SPDX-License-Identifier: GPL-2.0-or-later
// Windows fast path for the purely numerical inner loops of S_PaintChannels.
// Channel selection, spatialisation, grouping and lifetime remain in MiniLang.
package mq3.audio.native_paint

/// Mix PCM frames into an interleaved signed-int32 stereo paint buffer through playable_ambient_mix_pcm.
/// @param paint Writable native paint-buffer address.
/// @param paintBytes Paint-buffer capacity in bytes; each stereo frame occupies eight bytes.
/// @param samples Read-only PCM byte-buffer address.
/// @param sampleBytes PCM buffer length in bytes.
/// @param channels PCM channel count, one or two.
/// @param bitsPerSample PCM sample width, 8 or 16 bits.
/// @param blockAlign Bytes in one source PCM frame.
/// @param sourceFrames Number of source frames available.
/// @param sampleOffset Starting source-frame offset.
/// @param count Requested output-frame count.
/// @param bufferOffset First destination stereo frame.
/// @param leftVolume Left-channel gain.
/// @param rightVolume Right-channel gain.
/// @param soundVolume Global sound gain.
/// @param looping Nonzero to wrap at the end of the source frames.
/// @param doppler Nonzero to apply Doppler resampling.
/// @param dopplerScale Current Doppler source-step ratio.
/// @param oldDopplerScale Previous Doppler ratio applied to the starting position.
/// @returns The number of mixed frames, or a negative value when the request is invalid.
extern function mixPcmNative(paint as ptr,paintBytes as i32,samples as ptr,sampleBytes as i32,channels as i32,bitsPerSample as i32,blockAlign as i32,sourceFrames as i32,sampleOffset as i32,count as i32,bufferOffset as i32,leftVolume as i32,rightVolume as i32,soundVolume as i32,looping as i32,doppler as i32,dopplerScale as double,oldDopplerScale as double) from "playable_ambient.dll" symbol "playable_ambient_mix_pcm" returns i32
/// Resample streaming PCM into the stereo paint buffer and return the advanced source cursor.
/// @param paint Writable interleaved signed-int32 stereo accumulator.
/// @param paintBytes Paint-buffer byte capacity.
/// @param samples Read-only source PCM bytes.
/// @param sampleBytes Source-buffer byte length.
/// @param channels Source channel count, one or two.
/// @param bitsPerSample Source sample width, 8 or 16 bits.
/// @param blockAlign Bytes per source frame.
/// @param sourceFrames Available source-frame count.
/// @param sampleRate Source sampling rate in Hz.
/// @param outputRate Destination sampling rate in Hz.
/// @param cursor Fractional source-frame cursor.
/// @param count Requested destination stereo-frame count.
/// @param bufferOffset First destination stereo frame.
/// @returns The advanced fractional source-frame cursor, or a negative value for an invalid request.
extern function mixStreamNative(paint as ptr,paintBytes as i32,samples as ptr,sampleBytes as i32,channels as i32,bitsPerSample as i32,blockAlign as i32,sourceFrames as i32,sampleRate as i32,outputRate as i32,cursor as double,count as i32,bufferOffset as i32) from "playable_ambient.dll" symbol "playable_ambient_mix_stream" returns double
/// Clamp the stereo int32 paint buffer to interleaved signed 16-bit PCM.
/// @param paint Read-only interleaved int32 stereo accumulator.
/// @param paintBytes Accumulator capacity in bytes.
/// @param output Writable interleaved signed-16-bit stereo destination.
/// @param outputBytes Output capacity in bytes.
/// @param frames Stereo-frame count; requires eight input bytes and four output bytes per frame.
/// @returns The peak magnitude after the eight-bit mixer shift but before clipping, or -1 if either buffer is too short.
extern function finishNative(paint as ptr,paintBytes as i32,output as ptr,outputBytes as i32,frames as i32) from "playable_ambient.dll" symbol "playable_ambient_finish_mix" returns i32

/// Result record for audio.native_paint, containing `samples`, `peak`.
struct Result
  /// Interleaved little-endian signed 16-bit stereo PCM output bytes.
  samples
  /// Largest absolute mixed sample magnitude measured before output clipping.
  peak
end struct

/// Create the audio.native_paint error for `fail` with 7717 and the supplied diagnostic text.
/// @param message Message used in `("native audio paint: " + message)` and `error(7717, ("native audio paint: " + message))`.
function fail(message) return error(7717,"native audio paint: "+message) end function
/// Mix effect PCM into the stereo accumulator, averaging stereo input to mono before applying left/right spatial gains.
/// @param paint Writable byte buffer containing interleaved signed-int32 left/right accumulators.
/// @param sound Decoded PCM sound record with samples, channels, bitsPerSample, and blockAlign.
/// @param sourceFrames Number of valid source PCM frames.
/// @param sampleOffset Starting source-frame offset.
/// @param count Requested output stereo-frame count.
/// @param bufferOffset First destination stereo frame in paint.
/// @param leftVolume Left spatial gain.
/// @param rightVolume Right spatial gain.
/// @param soundVolume Global sound gain multiplied into both spatial gains.
/// @param looping Whether to wrap source reads at the end of the PCM frames.
/// @param doppler Whether to apply Doppler resampling.
/// @param dopplerScale Current Doppler source-step ratio.
/// @param oldDopplerScale Previous Doppler ratio applied to the starting source position.
function mixPcm(paint,sound,sourceFrames,sampleOffset,count,bufferOffset,leftVolume,rightVolume,soundVolume,looping,doppler,dopplerScale,oldDopplerScale)
  if paint==void or sound==void or typeof(paint)!="bytes" or typeof(sound.samples)!="bytes" then return fail("paint and PCM bytes are required") end if
  loopFlag=0;if looping then loopFlag=1 end if;dopplerFlag=0;if doppler then dopplerFlag=1 end if
  result=mixPcmNative(nativeBytesPtr(paint),len(paint),nativeBytesPtr(sound.samples),len(sound.samples),sound.channels,sound.bitsPerSample,sound.blockAlign,sourceFrames,sampleOffset,count,bufferOffset,leftVolume,rightVolume,soundVolume,loopFlag,dopplerFlag,dopplerScale,oldDopplerScale)
  if result<0 then return fail("PCM painter rejected the mix request") end if;return result
end function
/// Resample streaming PCM into the stereo accumulator while preserving left/right source channels; return the advanced source-frame cursor.
/// @param paint Writable byte buffer containing interleaved signed-int32 stereo accumulators.
/// @param sound Decoded PCM stream with samples, channel/format metadata, and source sample rate.
/// @param sourceFrames Number of available source PCM frames.
/// @param outputRate Destination stereo sample rate in Hz.
/// @param cursor Fractional source-frame position before mixing.
/// @param count Requested destination stereo-frame count.
/// @param bufferOffset First destination stereo frame in paint.
function mixStream(paint,sound,sourceFrames,outputRate,cursor,count,bufferOffset)
  if paint==void or sound==void or typeof(paint)!="bytes" or typeof(sound.samples)!="bytes" then return fail("paint and stream bytes are required") end if
  result=mixStreamNative(nativeBytesPtr(paint),len(paint),nativeBytesPtr(sound.samples),len(sound.samples),sound.channels,sound.bitsPerSample,sound.blockAlign,sourceFrames,sound.sampleRate,outputRate,cursor,count,bufferOffset)
  if result<0.0 then return fail("stream painter rejected the mix request") end if;return result
end function
/// Convert accumulated int32 stereo frames to clipped signed-16-bit PCM and report the peak magnitude.
/// @param paint Mutable-byte representation of the interleaved int32 stereo accumulator.
/// @param frames Number of stereo frames; requires at least frames * 8 paint bytes.
function finish(paint,frames)
  if paint==void or typeof(paint)!="bytes" or frames<0 or len(paint)<frames*8 then return fail("invalid paintbuffer") end if
  output=bytes(frames*4,0);peak=finishNative(nativeBytesPtr(paint),len(paint),nativeBytesPtr(output),len(output),frames)
  if peak<0 then return fail("paintbuffer transfer failed") end if;return Result(output,peak)
end function
