// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 24.8 integer paintbuffer composition for PCM effects and raw streams.
package mq3.audio.snd_paint_pipeline

import mq3.audio.channel_paint as channelPaint
import mq3.audio.mixer_transfer as paintTransfer
import mq3.audio.snd_compressed_paint as compressedPaint
import mq3.compat.numeric as numeric

const DEFAULT_SND_VOLUME=204

/// Create the audio.snd_paint_pipeline error for `fail` with 7666 and the supplied diagnostic text.
/// @param message Message used in `("S_PaintChannels: " + message)` and `error(7666, ("S_PaintChannels: " + message))`.
function fail(message) return error(7666,"S_PaintChannels: "+message) end function

/// Decode a signed 16-bit little-endian PCM sample for audio.snd_paint_pipeline.
/// @param data Data used in `data[offset]` and `data[(offset + 1)]`.
/// @param offset Zero-based index into `data`.
function signed16(data,offset)
  value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value
end function

/// Compute mono samples in audio.snd_paint_pipeline; the normal completion returns `result`.
/// @param sound Record exposing `channels`, `samples`, `blockAlign`, `bitsPerSample`.
function monoSamples(sound)
  if sound==void or sound.channels<1 or sound.channels>2 then return fail("invalid sound") end if
  frames=len(sound.samples)/sound.blockAlign;if frames<1 then return fail("empty sound") end if
  chunks=(frames+channelPaint.SND_CHUNK_SIZE-1)>>10;result=array(chunks*channelPaint.SND_CHUNK_SIZE,0)
  for frame=0 to frames-1
    offset=frame*sound.blockAlign
    if sound.bitsPerSample==8 then
      left=(sound.samples[offset]-128)<<8;if sound.channels==1 then result[frame]=left else right=(sound.samples[offset+1]-128)<<8;result[frame]=(left+right)/2 end if
    else if sound.bitsPerSample==16 then
      left=signed16(sound.samples,offset);if sound.channels==1 then result[frame]=left else right=signed16(sound.samples,offset+2);result[frame]=(left+right)/2 end if
    else return fail("unsupported sample width") end if
  end for
  return result
end function

/// Paint one shot in audio.snd_paint_pipeline; the normal completion returns `actual`.
/// @param paint Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries.
/// @param sound Record exposing `samples`, `blockAlign`.
/// @param sampleOffset Starting source sample offset before Doppler adjustment.
/// @param count Count used in `(count <= 0)` and `((sampleOffset >= frames) or (count <= 0))`.
/// @param bufferOffset Starting stereo-frame offset in paint.
/// @param leftVolume Left channel gain before sound-volume scaling.
/// @param rightVolume Right channel gain before sound-volume scaling.
/// @param sndVolume Overall sound gain multiplied into both channel gains.
function paintOneShot(paint,sound,sampleOffset,count,bufferOffset,leftVolume,rightVolume,sndVolume)
  frames=len(sound.samples)/sound.blockAlign
  if sampleOffset>=frames or count<=0 then return 0 end if
  actual=count;if sampleOffset+actual>frames then actual=frames-sampleOffset end if
  samples=try(monoSamples(sound));if samples is error then return samples end if
  result=channelPaint.paint16(samples,actual,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,false,1.0,1.0,paint);if result is error then return result end if
  return actual
end function

/// Paint mono one shot in audio.snd_paint_pipeline; the normal completion returns `actual`.
/// @param paint Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries.
/// @param samples Cyclic signed PCM array containing complete 1024-sample chunks.
/// @param frames Frames used in `(frames < 1)` and `(frames - sampleOffset)`.
/// @param sampleOffset Starting source sample offset before Doppler adjustment.
/// @param count Count used in `(count <= 0)` and `((sampleOffset >= frames) or (count <= 0))`.
/// @param bufferOffset Starting stereo-frame offset in paint.
/// @param leftVolume Left channel gain before sound-volume scaling.
/// @param rightVolume Right channel gain before sound-volume scaling.
/// @param sndVolume Overall sound gain multiplied into both channel gains.
function paintMonoOneShot(paint,samples,frames,sampleOffset,count,bufferOffset,leftVolume,rightVolume,sndVolume)
  if samples==void or frames<1 then return fail("invalid cached mono sound") end if
  if sampleOffset>=frames or count<=0 then return 0 end if
  actual=count;if sampleOffset+actual>frames then actual=frames-sampleOffset end if
  result=channelPaint.paint16(samples,actual,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,false,1.0,1.0,paint);if result is error then return result end if
  return actual
end function

/// Paint loop in audio.snd_paint_pipeline; the normal completion returns `done`.
/// @param paint Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries.
/// @param sound Record exposing `samples`, `blockAlign`.
/// @param paintedTime Painted time used in `(paintedTime + done)` and `((paintedTime + done) % frames)`.
/// @param count Count used in `(done < count)` and `(count - done)`.
/// @param bufferOffset Buffer offset used in `(bufferOffset + done)`.
/// @param leftVolume Left channel gain before sound-volume scaling.
/// @param rightVolume Right channel gain before sound-volume scaling.
/// @param sndVolume Overall sound gain multiplied into both channel gains.
function paintLoop(paint,sound,paintedTime,count,bufferOffset,leftVolume,rightVolume,sndVolume)
  frames=len(sound.samples)/sound.blockAlign;if frames<1 then return fail("empty loop") end if
  samples=try(monoSamples(sound));if samples is error then return samples end if
  done=0
  while done<count
    sampleOffset=(paintedTime+done)%frames;part=count-done;if sampleOffset+part>frames then part=frames-sampleOffset end if
    result=channelPaint.paint16(samples,part,sampleOffset,bufferOffset+done,leftVolume,rightVolume,sndVolume,false,1.0,1.0,paint);if result is error then return result end if
    done=done+part
  end while
  return done
end function

/// Compute sound frames in audio.snd_paint_pipeline; the normal completion returns `(len(sound.samples) / sound.blockAlign)`.
/// @param sound Record exposing `samples`, `blockAlign`.
/// @param compressed Record exposing `length`.
function soundFrames(sound,compressed)
  if compressed!=void then return compressed.length end if
  return len(sound.samples)/sound.blockAlign
end function

/// Paint sfx one shot in audio.snd_paint_pipeline.
/// @param paint Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.paintOneShot`.
/// @param sound Sound passed as `sound` to `mq3.audio.snd_paint_pipeline.paintOneShot`.
/// @param compressed Record exposing `length`.
/// @param sampleOffset Sample offset passed as `sampleOffset` to `mq3.audio.snd_paint_pipeline.paintOneShot`.
/// @param count Count passed as `count` to `mq3.audio.snd_paint_pipeline.paintOneShot`.
/// @param bufferOffset Buffer offset passed as `bufferOffset` to `mq3.audio.snd_paint_pipeline.paintOneShot`.
/// @param leftVolume Left volume passed as `leftVolume` to `mq3.audio.snd_paint_pipeline.paintOneShot`.
/// @param rightVolume Right volume passed as `rightVolume` to `mq3.audio.snd_paint_pipeline.paintOneShot`.
/// @param sndVolume Snd volume passed as `sndVolume` to `mq3.audio.snd_paint_pipeline.paintOneShot`.
function paintSfxOneShot(paint,sound,compressed,sampleOffset,count,bufferOffset,leftVolume,rightVolume,sndVolume)
  if compressed==void then return paintOneShot(paint,sound,sampleOffset,count,bufferOffset,leftVolume,rightVolume,sndVolume) end if
  if sampleOffset>=compressed.length or count<=0 then return 0 end if
  actual=count;if sampleOffset+actual>compressed.length then actual=compressed.length-sampleOffset end if
  return compressedPaint.paint(paint,compressed,actual,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,false,1.0,1.0)
end function

/// Paint sfx loop in audio.snd_paint_pipeline; the normal completion returns `done`.
/// @param paint Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.paintLoop`.
/// @param sound Sound passed as `sound` to `mq3.audio.snd_paint_pipeline.paintLoop`.
/// @param compressed Record exposing `length`.
/// @param paintedTime Painted time passed as `paintedTime` to `mq3.audio.snd_paint_pipeline.paintLoop`.
/// @param count Count passed as `count` to `mq3.audio.snd_paint_pipeline.paintLoop`.
/// @param bufferOffset Buffer offset passed as `bufferOffset` to `mq3.audio.snd_paint_pipeline.paintLoop`.
/// @param leftVolume Left volume passed as `leftVolume` to `mq3.audio.snd_paint_pipeline.paintLoop`.
/// @param rightVolume Right volume passed as `rightVolume` to `mq3.audio.snd_paint_pipeline.paintLoop`.
/// @param sndVolume Snd volume passed as `sndVolume` to `mq3.audio.snd_paint_pipeline.paintLoop`.
function paintSfxLoop(paint,sound,compressed,paintedTime,count,bufferOffset,leftVolume,rightVolume,sndVolume)
  if compressed==void then return paintLoop(paint,sound,paintedTime,count,bufferOffset,leftVolume,rightVolume,sndVolume) end if
  if compressed.length<1 then return fail("empty compressed loop") end if
  done=0
  while done<count
    sampleOffset=(paintedTime+done)%compressed.length;part=count-done;if sampleOffset+part>compressed.length then part=compressed.length-sampleOffset end if
    result=compressedPaint.paint(paint,compressed,part,sampleOffset,bufferOffset+done,leftVolume,rightVolume,sndVolume,false,1.0,1.0);if result is error then return result end if
    done=done+part
  end while
  return done
end function

/// Paint sfx loop doppler in audio.snd_paint_pipeline; the normal completion returns `done`.
/// @param paint Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`.
/// @param sound Sound passed as `sound` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`.
/// @param compressed Compressed passed as `compressed` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`.
/// @param paintedTime Painted time passed as `paintedTime` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`.
/// @param count Count passed as `count` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`.
/// @param bufferOffset Buffer offset passed as `bufferOffset` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`.
/// @param leftVolume Left volume passed as `leftVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`.
/// @param rightVolume Right volume passed as `rightVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`.
/// @param sndVolume Snd volume passed as `sndVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`.
/// @param doppler Doppler operand used by `paintSfxLoopDoppler`; its reads are shown in the implementation.
/// @param dopplerScale Doppler scale passed as `dopplerScale` to `mq3.audio.snd_compressed_paint.paint`.
/// @param oldDopplerScale Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_compressed_paint.paint`.
function paintSfxLoopDoppler(paint,sound,compressed,paintedTime,count,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  if not doppler then return paintSfxLoop(paint,sound,compressed,paintedTime,count,bufferOffset,leftVolume,rightVolume,sndVolume) end if
  frames=soundFrames(sound,compressed);if frames<1 then return fail("empty Doppler loop") end if
  if compressed!=void then
    // Compressed paint functions retain their original codec-specific Doppler
    // behavior. Keep each request inside the logical sfx length.
    sampleOffset=paintedTime%frames;actual=count;if sampleOffset+actual>frames then actual=frames-sampleOffset end if
    return compressedPaint.paint(paint,compressed,actual,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,true,dopplerScale,oldDopplerScale)
  end if
  samples=try(monoSamples(sound));if samples is error then return samples end if
  done=0
  while done<count
    sampleOffset=(paintedTime+done)%frames;part=count-done;if sampleOffset+part>frames then part=frames-sampleOffset end if
    result=channelPaint.paint16(samples,part,sampleOffset,bufferOffset+done,leftVolume,rightVolume,sndVolume,true,dopplerScale,oldDopplerScale,paint);if result is error then return result end if
    done=done+part
  end while
  return done
end function

/// Paint mono loop doppler in audio.snd_paint_pipeline; the normal completion returns `done`.
/// @param paint Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries.
/// @param samples Cyclic signed PCM array containing complete 1024-sample chunks.
/// @param frames Frames used in `(frames < 1)` and `(frames - sampleOffset)`.
/// @param paintedTime Painted time used in `(paintedTime + done)` and `((paintedTime + done) % frames)`.
/// @param count Count used in `(done < count)` and `(count - done)`.
/// @param bufferOffset Buffer offset used in `(bufferOffset + done)`.
/// @param leftVolume Left channel gain before sound-volume scaling.
/// @param rightVolume Right channel gain before sound-volume scaling.
/// @param sndVolume Overall sound gain multiplied into both channel gains.
/// @param doppler Whether to resample using Doppler scale changes.
/// @param dopplerScale Positive current source-step scale.
/// @param oldDopplerScale Nonnegative scale used to adjust the starting source offset.
function paintMonoLoopDoppler(paint,samples,frames,paintedTime,count,bufferOffset,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale)
  if samples==void or frames<1 then return fail("invalid cached mono loop") end if
  done=0
  while done<count
    sampleOffset=(paintedTime+done)%frames;part=count-done;if sampleOffset+part>frames then part=frames-sampleOffset end if
    result=channelPaint.paint16(samples,part,sampleOffset,bufferOffset+done,leftVolume,rightVolume,sndVolume,doppler,dopplerScale,oldDopplerScale,paint);if result is error then return result end if
    done=done+part
  end while
  return done
end function

/// Paint raw in audio.snd_paint_pipeline; the normal completion returns `count`.
///
/// Direct state writes: `paint elements`.
/// @param paint Mutable sequence written at `destination`, `(destination + 1)`.
/// @param left Left used in `len(left)` and `left[frame]`.
/// @param right Right used in `len(right)` and `right[frame]`.
/// @param bufferOffset Buffer offset used in `(bufferOffset + frame)` and `((bufferOffset + frame) * 2)`.
/// @param count Count used in `(count - 1)` and `(len(left) < count)`.
/// @param volume Volume used in `(256.0 * volume)` and `numeric.trunc32((256.0 * volume))`.
function paintRaw(paint,left,right,bufferOffset,count,volume)
  if len(left)<count or len(right)<count then return fail("truncated raw stream") end if
  intVolume=numeric.trunc32(256.0*volume)
  for frame=0 to count-1
    destination=(bufferOffset+frame)*2;paint[destination]=numeric.add32(paint[destination],numeric.mul32(left[frame],intVolume));paint[destination+1]=numeric.add32(paint[destination+1],numeric.mul32(right[frame],intVolume))
  end for
  return count
end function

/// Compute next power of two in audio.snd_paint_pipeline; the normal completion returns `result`.
/// @param value Value used in `(result < value)`.
function nextPowerOfTwo(value)
  result=1;while result<value result=result<<1 end while;return result
end function

/// Transfer 16 in audio.snd_paint_pipeline; the normal completion returns `output`.
/// @param paint Paint passed as `paint` to `mq3.audio.mixer_transfer.transfer`.
/// @param frames End time passed as `endTime` to `mq3.audio.mixer_transfer.transfer`.
function transfer16(paint,frames)
  samples=nextPowerOfTwo(frames*2);logical=array(samples,0);result=paintTransfer.transfer(paint,0,frames,16,2,samples,logical);if result is error then return result end if
  output=bytes(frames*4,0)
  for index=0 to frames*2-1 value=logical[index];output[index*2]=value&255;output[index*2+1]=(value>>8)&255 end for
  return output
end function
