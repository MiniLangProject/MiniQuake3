// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete managed surface for code/client/snd_mix.c. The global C mixer
// state is passed explicitly so the productive QVM and Windows hosts can use
// the same deterministic integer paint pipeline.
package mq3.audio.snd_mix_runtime

import mq3.audio.channel_paint as channelPaint
import mq3.audio.mixer_transfer as transfer
import mq3.audio.snd_compressed_paint as compressedPaint
import mq3.audio.snd_paint_pipeline as pipeline

/// Create the audio.snd_mix_runtime error for `compressionError` with 7669 and the supplied diagnostic text.
/// @param name Name used in `(name + ": incompatible compressed sound")` and `error(7669, (name + ": incompatible compressed sound"))`.
function compressionError(name) return error(7669,name+": incompatible compressed sound") end function

/// Return `mq3.audio.snd_paint_pipeline.transfer16(paint, frames)` from `audio.snd_mix_runtime.S_WriteLinearBlastStereo16`.
/// @param paint Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.transfer16`.
/// @param frames Frames passed as `frames` to `mq3.audio.snd_paint_pipeline.transfer16`.
function S_WriteLinearBlastStereo16(paint,frames)
  return pipeline.transfer16(paint,frames)
end function

/// Return `mq3.audio.mixer_transfer.transfer(paint, paintedTime, endTime, 16, 2, dmaSamples, output)` from `audio.snd_mix_runtime.S_TransferStereo16`.
/// @param paint Paint passed as `paint` to `mq3.audio.mixer_transfer.transfer`.
/// @param paintedTime Painted time passed as `paintedTime` to `mq3.audio.mixer_transfer.transfer`.
/// @param endTime End time passed as `endTime` to `mq3.audio.mixer_transfer.transfer`.
/// @param dmaSamples Dma samples passed as `dmaSamples` to `mq3.audio.mixer_transfer.transfer`.
/// @param output Output passed as `output` to `mq3.audio.mixer_transfer.transfer`.
function S_TransferStereo16(paint,paintedTime,endTime,dmaSamples,output)
  return transfer.transfer(paint,paintedTime,endTime,16,2,dmaSamples,output)
end function

/// Return `mq3.audio.mixer_transfer.transfer(paint, paintedTime, endTime, sampleBits, channels, dmaSamples, output)` from `audio.snd_mix_runtime.S_TransferPaintBuffer`.
/// @param paint Paint passed as `paint` to `mq3.audio.mixer_transfer.transfer`.
/// @param paintedTime Painted time passed as `paintedTime` to `mq3.audio.mixer_transfer.transfer`.
/// @param endTime End time passed as `endTime` to `mq3.audio.mixer_transfer.transfer`.
/// @param sampleBits Sample bits passed as `sampleBits` to `mq3.audio.mixer_transfer.transfer`.
/// @param channels Channels passed as `channels` to `mq3.audio.mixer_transfer.transfer`.
/// @param dmaSamples Dma samples passed as `dmaSamples` to `mq3.audio.mixer_transfer.transfer`.
/// @param output Output passed as `output` to `mq3.audio.mixer_transfer.transfer`.
function S_TransferPaintBuffer(paint,paintedTime,endTime,sampleBits,channels,dmaSamples,output)
  return transfer.transfer(paint,paintedTime,endTime,sampleBits,channels,dmaSamples,output)
end function

/// Return `mq3.audio.channel_paint.paint16(samples, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale, paint)` from `audio.snd_mix_runtime.S_PaintChannelFrom16`.
/// @param paint Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries.
/// @param samples Cyclic signed PCM array containing complete 1024-sample chunks.
/// @param count Number of output stereo frames to paint.
/// @param sampleOffset Starting source sample offset before Doppler adjustment.
/// @param bufferOffset Starting stereo-frame offset in paint.
/// @param leftVolume Left channel gain before sound-volume scaling.
/// @param rightVolume Right channel gain before sound-volume scaling.
/// @param sndVolume Overall sound gain multiplied into both channel gains.
/// @param doppler Whether to resample using Doppler scale changes.
/// @param dopplerScale Positive current source-step scale.
/// @param oldDopplerScale Nonnegative scale used to adjust the starting source offset.
function S_PaintChannelFrom16(paint,samples,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  return channelPaint.paint16(samples,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale,paint)
end function

/// Paint compressed in audio.snd_mix_runtime.
/// @param name Name passed as `name` to `mq3.audio.snd_mix_runtime.compressionError`.
/// @param method Method used in `(sound.compression != method)` and `((sound == void) or (sound.compression != method))`.
/// @param paint Paint buffer passed as `paintBuffer` to `mq3.audio.snd_compressed_paint.paint`.
/// @param sound Record exposing `compression`.
/// @param count Count passed as `count` to `mq3.audio.snd_compressed_paint.paint`.
/// @param sampleOffset Sample offset passed as `sampleOffset` to `mq3.audio.snd_compressed_paint.paint`.
/// @param bufferOffset Buffer offset passed as `bufferOffset` to `mq3.audio.snd_compressed_paint.paint`.
/// @param leftVolume Left vol passed as `leftVol` to `mq3.audio.snd_compressed_paint.paint`.
/// @param rightVolume Right vol passed as `rightVol` to `mq3.audio.snd_compressed_paint.paint`.
/// @param sndVolume Snd vol passed as `sndVol` to `mq3.audio.snd_compressed_paint.paint`.
/// @param doppler Doppler passed as `doppler` to `mq3.audio.snd_compressed_paint.paint`.
/// @param dopplerScale Doppler scale passed as `dopplerScale` to `mq3.audio.snd_compressed_paint.paint`.
/// @param oldDopplerScale Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_compressed_paint.paint`.
function paintCompressed(name,method,paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  if sound==void or sound.compression!=method then return compressionError(name) end if
  return compressedPaint.paint(paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
end function

/// Delegate `S_PaintChannelFromWavelet` to `mq3.audio.snd_mix_runtime.paintCompressed` and return its result.
/// @param paint Paint passed as `paint` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param sound Sound passed as `sound` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param count Count passed as `count` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param sampleOffset Sample offset passed as `sampleOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param bufferOffset Buffer offset passed as `bufferOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param leftVolume Left volume passed as `leftVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param rightVolume Right volume passed as `rightVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param sndVolume Snd volume passed as `sndVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param doppler Doppler passed as `doppler` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param dopplerScale Doppler scale passed as `dopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param oldDopplerScale Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`.
function S_PaintChannelFromWavelet(paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  return paintCompressed("S_PaintChannelFromWavelet",compressedPaint.METHOD_WAVELET,paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
end function

/// Delegate `S_PaintChannelFromADPCM` to `mq3.audio.snd_mix_runtime.paintCompressed` and return its result.
/// @param paint Paint passed as `paint` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param sound Sound passed as `sound` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param count Count passed as `count` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param sampleOffset Sample offset passed as `sampleOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param bufferOffset Buffer offset passed as `bufferOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param leftVolume Left volume passed as `leftVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param rightVolume Right volume passed as `rightVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param sndVolume Snd volume passed as `sndVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param doppler Doppler passed as `doppler` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param dopplerScale Doppler scale passed as `dopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param oldDopplerScale Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`.
function S_PaintChannelFromADPCM(paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  return paintCompressed("S_PaintChannelFromADPCM",compressedPaint.METHOD_ADPCM,paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
end function

/// Delegate `S_PaintChannelFromMuLaw` to `mq3.audio.snd_mix_runtime.paintCompressed` and return its result.
/// @param paint Paint passed as `paint` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param sound Sound passed as `sound` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param count Count passed as `count` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param sampleOffset Sample offset passed as `sampleOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param bufferOffset Buffer offset passed as `bufferOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param leftVolume Left volume passed as `leftVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param rightVolume Right volume passed as `rightVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param sndVolume Snd volume passed as `sndVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param doppler Doppler passed as `doppler` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param dopplerScale Doppler scale passed as `dopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`.
/// @param oldDopplerScale Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`.
function S_PaintChannelFromMuLaw(paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  return paintCompressed("S_PaintChannelFromMuLaw",compressedPaint.METHOD_MULAW,paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
end function

// One managed call represents the original global-channel loop for one
// channel. Hosts call it for every active one-shot and loop channel before the
// common transfer, matching S_PaintChannels' ordering and 24.8 accumulation.
/// @param paint Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`.
/// @param sound Sound passed as `sound` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`.
/// @param compressed Compressed passed as `compressed` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`.
/// @param paintedTime Painted time passed as `paintedTime` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`.
/// @param endTime End time used in `(endTime - paintedTime)`.
/// @param startSample Start sample used in `(paintedTime - startSample)`.
/// @param leftVolume Left volume passed as `leftVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`.
/// @param rightVolume Right volume passed as `rightVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`.
/// @param sndVolume Snd volume passed as `sndVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`.
/// @param looping Looping operand used by `S_PaintChannels`; its reads are shown in the implementation.
/// @param doppler Doppler passed as `doppler` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`.
/// @param dopplerScale Doppler scale passed as `dopplerScale` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`.
/// @param oldDopplerScale Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`.
function S_PaintChannels(paint,sound,compressed,paintedTime,endTime,startSample,leftVolume,rightVolume,sndVolume,looping,doppler,dopplerScale,oldDopplerScale)
  count=endTime-paintedTime
  if count<0 then return error(7669,"S_PaintChannels: end time precedes painted time") end if
  if looping then return pipeline.paintSfxLoopDoppler(paint,sound,compressed,paintedTime,count,0,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale) end if
  sampleOffset=paintedTime-startSample
  if sampleOffset<0 then return 0 end if
  return pipeline.paintSfxOneShot(paint,sound,compressed,sampleOffset,count,0,leftVolume,rightVolume,sndVolume)
end function
