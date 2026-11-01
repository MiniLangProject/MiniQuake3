// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Listener-relative looping-sound spatialization derived from Baseq3 snd_dma.c.
package mq3.audio.spatial_mixer

import mq3.compat.numeric as numeric
import mq3.shared.math as qmath
import std.ds.list as lists

const SOUND_FULLVOLUME=80.0
const SOUND_ATTENUATE=0.0008
const MAX_SOURCES=64
const MAX_FRAMES=4096

struct Source id key origin sound volume globalSound cursor enabled end struct
struct State outputRate chunkFrames sources end struct
struct Chunk samples frames audibleSources peak limiterGain end struct
struct Spatial left right distance attenuation end struct
struct Group key sound cursor step sourceFrames left right sourceIndexes end struct

function fail(message) return error(7620,"spatial mixer: "+message) end function

function create(outputRate,chunkFrames)
  if outputRate<4000 or outputRate>192000 then return fail("invalid output rate") end if
  if chunkFrames<1 or chunkFrames>MAX_FRAMES then return fail("invalid chunk size") end if
  return State(outputRate,chunkFrames,[])
end function

function addSharedLoop(state,id,key,origin,sound,volume,globalSound)
  if state==void or sound==void or origin==void or len(origin)!=3 then return fail("invalid source") end if
  if typeof(key)!="string" then return fail("invalid source key") end if
  if len(state.sources)>=MAX_SOURCES then return fail("too many loop sources") end if
  if len(sound.samples)<sound.blockAlign or volume<0.0 or volume>1.0 then return fail("invalid source PCM or volume") end if
  for each source in state.sources if source.id==id then return fail("duplicate source id") end if end for
  state.sources=state.sources+[Source(id,key,[origin[0],origin[1],origin[2]],sound,volume,globalSound,0.0,true)]
  return len(state.sources)-1
end function
function addLoop(state,id,origin,sound,volume,globalSound) return addSharedLoop(state,id,"#"+str(id),origin,sound,volume,globalSound) end function

function setEnabled(state,id,enabled)
  for each source in state.sources if source.id==id then source.enabled=enabled;return true end if end for
  return false
end function

function spatialize(origin,listener,right,volume,globalSound)
  if volume<=0.0 then return Spatial(0.0,0.0,0.0,0.0) end if
  if globalSound then return Spatial(volume,volume,0.0,1.0) end if
  delta=[origin[0]-listener[0],origin[1]-listener[1],origin[2]-listener[2]]
  distance=qmath.VectorLength(delta);direction=[0.0,0.0,0.0]
  if distance>0.0 then direction=[delta[0]/distance,delta[1]/distance,delta[2]/distance] end if
  attenuatedDistance=distance-SOUND_FULLVOLUME;if attenuatedDistance<0.0 then attenuatedDistance=0.0 end if
  attenuation=1.0-attenuatedDistance*SOUND_ATTENUATE
  if attenuation<0.0 then attenuation=0.0 end if
  dot=qmath.DotProduct(right,direction);if dot>1.0 then dot=1.0 else if dot< -1.0 then dot=-1.0 end if
  left=volume*attenuation*0.5*(1.0-dot);rightGain=volume*attenuation*0.5*(1.0+dot)
  return Spatial(left,rightGain,distance,attenuation)
end function

function signed16(data,offset)
  value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value
end function

function monoSample(sound,frame)
  frames=len(sound.samples)/sound.blockAlign;if frames<1 then return 0 end if
  index=frame%frames;if index<0 then index=index+frames end if;offset=index*sound.blockAlign
  if sound.bitsPerSample==8 then
    left=(sound.samples[offset]-128)*256
    if sound.channels==1 then return left end if
    right=(sound.samples[offset+1]-128)*256;return (left+right)/2
  end if
  left=signed16(sound.samples,offset)
  if sound.channels==1 then return left end if
  right=signed16(sound.samples,offset+2);return (left+right)/2
end function

function write16(output,offset,value)
  integer=numeric.trunc32(value);if value>=0.0 then integer=numeric.trunc32(value+0.5) else integer=numeric.trunc32(value-0.5) end if
  if integer>32767 then integer=32767 else if integer< -32768 then integer=-32768 end if
  output[offset]=integer&255;output[offset+1]=(integer>>8)&255;return void
end function

function render(state,listener,right)
  if state==void or listener==void or right==void or len(listener)!=3 or len(right)!=3 then return fail("invalid listener") end if
  rightLength=qmath.VectorLength(right);if rightLength<0.99 or rightLength>1.01 then return fail("listener right vector is not normalized") end if
  leftMix=array(state.chunkFrames,0.0);rightMix=array(state.chunkFrames,0.0);audible=0;groups=lists.List.withCapacity(len(state.sources))
  if len(state.sources)>0 then
    for sourceIndex=0 to len(state.sources)-1
      source=state.sources[sourceIndex]
      if source.enabled then
        gains=spatialize(source.origin,listener,right,source.volume,source.globalSound)
        if gains.left>0.0 or gains.right>0.0 then
          audible=audible+1;groupIndex=-1
          if not groups.isEmpty() then for index=0 to groups.len()-1 current=groups.get(index);if current.key==source.key and current.sound==source.sound and current.cursor==source.cursor then groupIndex=index end if end for end if
          if groupIndex<0 then
            step=source.sound.sampleRate/state.outputRate;sourceFrames=len(source.sound.samples)/source.sound.blockAlign
            indexes=lists.List.withCapacity(4);indexes.add(sourceIndex);groups.add(Group(source.key,source.sound,source.cursor,step,sourceFrames,gains.left,gains.right,indexes))
          else
            current=groups.get(groupIndex);current.left=current.left+gains.left;current.right=current.right+gains.right;current.sourceIndexes.add(sourceIndex)
          end if
        end if
      end if
    end for
  end if
  if not groups.isEmpty() then
    for groupIndex=0 to groups.len()-1
      group=groups.get(groupIndex)
      phase=group.cursor
      for frame=0 to state.chunkFrames-1
        sample=monoSample(group.sound,numeric.trunc32(phase))
        leftMix[frame]=leftMix[frame]+sample*group.left;rightMix[frame]=rightMix[frame]+sample*group.right
        phase=phase+group.step;while phase>=group.sourceFrames phase=phase-group.sourceFrames end while
      end for
      for sourceIndexIndex=0 to group.sourceIndexes.len()-1 sourceIndex=group.sourceIndexes.get(sourceIndexIndex);state.sources[sourceIndex].cursor=phase end for
    end for
  end if
  peak=0.0
  for frame=0 to state.chunkFrames-1
    left=leftMix[frame];if left<0.0 then left=0.0-left end if;if left>peak then peak=left end if
    rightValue=rightMix[frame];if rightValue<0.0 then rightValue=0.0-rightValue end if;if rightValue>peak then peak=rightValue end if
  end for
  limiter=1.0;if peak>32767.0 then limiter=32767.0/peak end if
  output=bytes(state.chunkFrames*4,0)
  for frame=0 to state.chunkFrames-1
    write16(output,frame*4,leftMix[frame]*limiter);write16(output,frame*4+2,rightMix[frame]*limiter)
  end for
  return Chunk(output,state.chunkFrames,audible,peak,limiter)
end function
