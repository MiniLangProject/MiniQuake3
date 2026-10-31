// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 24.8 integer paintbuffer composition for PCM effects and raw streams.
package mq3.audio.snd_paint_pipeline

import mq3.audio.channel_paint as channelPaint
import mq3.audio.mixer_transfer as paintTransfer
import mq3.audio.snd_compressed_paint as compressedPaint
import mq3.compat.numeric as numeric

const DEFAULT_SND_VOLUME=204

function fail(message) return error(7666,"S_PaintChannels: "+message) end function

function signed16(data,offset)
  value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value
end function

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

function paintOneShot(paint,sound,sampleOffset,count,bufferOffset,leftVolume,rightVolume,sndVolume)
  frames=len(sound.samples)/sound.blockAlign
  if sampleOffset>=frames or count<=0 then return 0 end if
  actual=count;if sampleOffset+actual>frames then actual=frames-sampleOffset end if
  samples=try(monoSamples(sound));if samples is error then return samples end if
  result=channelPaint.paint16(samples,actual,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,false,1.0,1.0,paint);if result is error then return result end if
  return actual
end function

function paintMonoOneShot(paint,samples,frames,sampleOffset,count,bufferOffset,leftVolume,rightVolume,sndVolume)
  if samples==void or frames<1 then return fail("invalid cached mono sound") end if
  if sampleOffset>=frames or count<=0 then return 0 end if
  actual=count;if sampleOffset+actual>frames then actual=frames-sampleOffset end if
  result=channelPaint.paint16(samples,actual,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,false,1.0,1.0,paint);if result is error then return result end if
  return actual
end function

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

function soundFrames(sound,compressed)
  if compressed!=void then return compressed.length end if
  return len(sound.samples)/sound.blockAlign
end function

function paintSfxOneShot(paint,sound,compressed,sampleOffset,count,bufferOffset,leftVolume,rightVolume,sndVolume)
  if compressed==void then return paintOneShot(paint,sound,sampleOffset,count,bufferOffset,leftVolume,rightVolume,sndVolume) end if
  if sampleOffset>=compressed.length or count<=0 then return 0 end if
  actual=count;if sampleOffset+actual>compressed.length then actual=compressed.length-sampleOffset end if
  return compressedPaint.paint(paint,compressed,actual,sampleOffset,bufferOffset,leftVolume,rightVolume,sndVolume,false,1.0,1.0)
end function

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

function paintRaw(paint,left,right,bufferOffset,count,volume)
  if len(left)<count or len(right)<count then return fail("truncated raw stream") end if
  intVolume=numeric.trunc32(256.0*volume)
  for frame=0 to count-1
    destination=(bufferOffset+frame)*2;paint[destination]=numeric.add32(paint[destination],numeric.mul32(left[frame],intVolume));paint[destination+1]=numeric.add32(paint[destination+1],numeric.mul32(right[frame],intVolume))
  end for
  return count
end function

function nextPowerOfTwo(value)
  result=1;while result<value result=result<<1 end while;return result
end function

function transfer16(paint,frames)
  samples=nextPowerOfTwo(frames*2);logical=array(samples,0);result=paintTransfer.transfer(paint,0,frames,16,2,samples,logical);if result is error then return result end if
  output=bytes(frames*4,0)
  for index=0 to frames*2-1 value=logical[index];output[index*2]=value&255;output[index*2+1]=(value>>8)&255 end for
  return output
end function
