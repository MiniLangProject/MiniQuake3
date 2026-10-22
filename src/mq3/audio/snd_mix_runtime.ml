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

function compressionError(name) return error(7669,name+": incompatible compressed sound") end function

function S_WriteLinearBlastStereo16(paint,frames)
  return pipeline.transfer16(paint,frames)
end function

function S_TransferStereo16(paint,paintedTime,endTime,dmaSamples,output)
  return transfer.transfer(paint,paintedTime,endTime,16,2,dmaSamples,output)
end function

function S_TransferPaintBuffer(paint,paintedTime,endTime,sampleBits,channels,dmaSamples,output)
  return transfer.transfer(paint,paintedTime,endTime,sampleBits,channels,dmaSamples,output)
end function

function S_PaintChannelFrom16(paint,samples,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  return channelPaint.paint16(samples,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale,paint)
end function

function paintCompressed(name,method,paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  if sound==void or sound.compression!=method then return compressionError(name) end if
  return compressedPaint.paint(paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
end function

function S_PaintChannelFromWavelet(paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  return paintCompressed("S_PaintChannelFromWavelet",compressedPaint.METHOD_WAVELET,paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
end function

function S_PaintChannelFromADPCM(paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  return paintCompressed("S_PaintChannelFromADPCM",compressedPaint.METHOD_ADPCM,paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
end function

function S_PaintChannelFromMuLaw(paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  return paintCompressed("S_PaintChannelFromMuLaw",compressedPaint.METHOD_MULAW,paint,sound,count,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
end function

// One managed call represents the original global-channel loop for one
// channel. Hosts call it for every active one-shot and loop channel before the
// common transfer, matching S_PaintChannels' ordering and 24.8 accumulation.
function S_PaintChannels(paint,sound,compressed,paintedTime,endTime,startSample,leftVolume,rightVolume,sndVolume,looping,doppler,dopplerScale,oldDopplerScale)
  count=endTime-paintedTime
  if count<0 then return error(7669,"S_PaintChannels: end time precedes painted time") end if
  if looping then return pipeline.paintSfxLoopDoppler(paint,sound,compressed,paintedTime,count,0,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale) end if
  sampleOffset=paintedTime-startSample
  if sampleOffset<0 then return 0 end if
  return pipeline.paintSfxOneShot(paint,sound,compressed,sampleOffset,count,0,leftVolume,rightVolume,sndVolume)
end function
