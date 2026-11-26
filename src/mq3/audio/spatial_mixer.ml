// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Listener-relative looping-sound spatialization derived from Baseq3 snd_dma.c.
package mq3.audio.spatial_mixer

import mq3.compat.numeric as numeric
import mq3.shared.math as qmath
import std.ds.list as lists

/// Distance in world units within which distance attenuation is not applied.
const SOUND_FULLVOLUME=80.0
/// Linear gain reduction per world unit beyond the full-volume distance.
const SOUND_ATTENUATE=0.0008
/// Maximum number of loop sources registered with the spatial mixer.
const MAX_SOURCES=64
/// Maximum number of stereo output frames produced by one mixer chunk.
const MAX_FRAMES=4096

/// Source record for audio.spatial_mixer, containing `id`, `key`, `origin`, `sound`, `volume`, `globalSound`, and 2 further fields.
struct Source
  /// Caller-supplied identifier used to find or update this sound source.
  id
  /// Candidate loop-sharing key; render also requires the same sound record and playback cursor before grouping.
  key
  /// World-space XYZ position of the sound source.
  origin
  /// Decoded WAVE sound descriptor supplying the source PCM data.
  sound
  /// Source gain before distance attenuation, in the range zero through one.
  volume
  /// True when source gain is independent of listener position.
  globalSound
  /// Current playback position in source sample frames.
  cursor
  /// Whether render considers this source; disabled sources retain their current playback cursor.
  enabled
end struct
/// State record for audio.spatial_mixer, containing `outputRate`, `chunkFrames`, `sources`.
struct State
  /// Output sample rate in hertz.
  outputRate
  /// Number of stereo sample frames produced by one mixing pass.
  chunkFrames
  /// Registered loop sources and their independent enable states.
  sources
end struct
/// Chunk record for audio.spatial_mixer, containing `samples`, `frames`, `audibleSources`, `peak`, `limiterGain`.
struct Chunk
  /// Interleaved little-endian signed 16-bit stereo PCM output bytes.
  samples
  /// Number of stereo sample frames contained in this output chunk.
  frames
  /// Number of enabled sources with a positive left or right gain; counted even when their current PCM samples are silent.
  audibleSources
  /// Largest absolute mixed sample magnitude measured before output clipping.
  peak
  /// Gain applied to keep the mixed output within the supported sample range.
  limiterGain
end struct
/// Spatial record for audio.spatial_mixer, containing `left`, `right`, `distance`, `attenuation`.
struct Spatial
  /// Left-channel floating-point gain after spatialization.
  left
  /// Right-channel floating-point gain after spatialization.
  right
  /// Distance in world units from the source to the listener.
  distance
  /// Distance-dependent gain remaining after the full-volume region.
  attenuation
end struct
/// Group record for audio.spatial_mixer, containing `key`, `sound`, `cursor`, `step`, `sourceFrames`, `left`, and 2 further fields.
struct Group
  /// Shared-loop grouping key for these sources.
  key
  /// Decoded WAVE sound descriptor supplying the source PCM data.
  sound
  /// Current playback position in source sample frames.
  cursor
  /// Fractional source-frame advance for each output frame.
  step
  /// Number of sample frames in the source sound.
  sourceFrames
  /// Sum of the left-channel gains for sources in this shared loop.
  left
  /// Sum of the right-channel gains for sources in this shared loop.
  right
  /// Indexes of registered sources represented by this shared playback group.
  sourceIndexes
end struct

/// Create the audio.spatial_mixer error for `fail` with 7620 and the supplied diagnostic text.
/// @param message Message used in `("spatial mixer: " + message)` and `error(7620, ("spatial mixer: " + message))`.
function fail(message) return error(7620,"spatial mixer: "+message) end function

/// Create an empty loop mixer, or report error 7620 for an unsupported rate or chunk size.
/// @param outputRate Stereo output sample rate in hertz, from 4,000 through 192,000.
/// @param chunkFrames Output frames per render call, from 1 through MAX_FRAMES; each frame occupies four PCM bytes.
function create(outputRate,chunkFrames)
  if outputRate<4000 or outputRate>192000 then return fail("invalid output rate") end if
  if chunkFrames<1 or chunkFrames>MAX_FRAMES then return fail("invalid chunk size") end if
  return State(outputRate,chunkFrames,[])
end function

/// Register an enabled looping source at cursor zero and return its zero-based source index.
/// Copies the origin vector but retains the supplied sound record. Rejects duplicate
/// identifiers, invalid PCM/gain, or registrations beyond MAX_SOURCES with error 7620.
/// @param state Mixer whose sources collection is extended in place.
/// @param id Caller identifier, unique among sources currently registered in this mixer.
/// @param key String used to group sources only when sound and playback cursor also compare equal.
/// @param origin Three-component source position in world units; copied into the source.
/// @param sound Decoded WAVE Sound containing at least one complete sample frame; retained without copying PCM.
/// @param volume Linear source gain from zero through one before distance attenuation and stereo panning.
/// @param globalSound True gives both output channels the full source gain, bypassing spatial attenuation and panning.
function addSharedLoop(state,id,key,origin,sound,volume,globalSound)
  if state==void or sound==void or origin==void or len(origin)!=3 then return fail("invalid source") end if
  if typeof(key)!="string" then return fail("invalid source key") end if
  if len(state.sources)>=MAX_SOURCES then return fail("too many loop sources") end if
  if len(sound.samples)<sound.blockAlign or volume<0.0 or volume>1.0 then return fail("invalid source PCM or volume") end if
  for each source in state.sources if source.id==id then return fail("duplicate source id") end if end for
  state.sources=state.sources+[Source(id,key,[origin[0],origin[1],origin[2]],sound,volume,globalSound,0.0,true)]
  return len(state.sources)-1
end function
/// Return `mq3.audio.spatial_mixer.addSharedLoop(state, id, ("#" + str(id)), origin, sound, volume, globalSound)` from `audio.spatial_mixer.addLoop`.
/// @param state State passed as `state` to `mq3.audio.spatial_mixer.addSharedLoop`.
/// @param id Id passed as `id` to `mq3.audio.spatial_mixer.addSharedLoop`.
/// @param origin Origin passed as `origin` to `mq3.audio.spatial_mixer.addSharedLoop`.
/// @param sound Sound passed as `sound` to `mq3.audio.spatial_mixer.addSharedLoop`.
/// @param volume Volume passed as `volume` to `mq3.audio.spatial_mixer.addSharedLoop`.
/// @param globalSound Global sound passed as `globalSound` to `mq3.audio.spatial_mixer.addSharedLoop`.
function addLoop(state,id,origin,sound,volume,globalSound) return addSharedLoop(state,id,"#"+str(id),origin,sound,volume,globalSound) end function

/// Change a registered source's enabled flag, returning true when found or false for an unknown identifier.
/// Disabling a source preserves its playback cursor until it contributes to a later render call.
/// @param state Mixer containing the source to update.
/// @param id Caller identifier supplied when registering the source.
/// @param enabled Whether subsequent render calls should consider the source.
function setEnabled(state,id,enabled)
  for each source in state.sources if source.id==id then source.enabled=enabled;return true end if end for
  return false
end function

/// Compute stereo gains using linear distance attenuation and the listener's right-axis projection.
/// Local sources have full distance gain through SOUND_FULLVOLUME world units;
/// panning divides that gain between left and right. Global sources receive the
/// full volume in both channels, with reported distance zero and attenuation one.
/// A nonpositive volume returns zero gains, distance, and attenuation.
/// @param origin Source XYZ position in world units.
/// @param listener Listener XYZ position in the same coordinate system.
/// @param right Listener's normalized three-component right vector; positive projection favors the right channel.
/// @param volume Linear source gain before attenuation and panning.
/// @param globalSound Whether to bypass positional attenuation and panning.
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

/// Compute signed 16 in audio.spatial_mixer; the normal completion returns `value`.
/// @param data Data used in `data[offset]` and `data[(offset + 1)]`.
/// @param offset Zero-based index into `data`.
function signed16(data,offset)
  value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value
end function

/// Compute mono sample in audio.spatial_mixer; the normal completion returns `((left + right) / 2)`.
/// @param sound Record exposing `samples`, `blockAlign`, `bitsPerSample`, `channels`.
/// @param frame Frame used in `(frame % frames)`.
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

/// Write 16 in audio.spatial_mixer; updates `output entries`.
///
/// Direct state writes: `output elements`.
/// @param output Mutable sequence written at `offset`, `(offset + 1)`.
/// @param offset Offset used in `(offset + 1)`.
/// @param value Floating-point value to convert to signed 32-bit integer semantics.
function write16(output,offset,value)
  integer=numeric.trunc32(value);if value>=0.0 then integer=numeric.trunc32(value+0.5) else integer=numeric.trunc32(value-0.5) end if
  if integer>32767 then integer=32767 else if integer< -32768 then integer=-32768 end if
  output[offset]=integer&255;output[offset+1]=(integer>>8)&255;return void
end function

/// Mix one stereo PCM chunk, advancing only enabled sources with a positive spatial gain.
/// Matching key, sound, and cursor values share resampling work. Source PCM is
/// downmixed to mono before panning; fractional source positions select the
/// preceding frame. A single chunk-wide limiter scales peaks above 32767 before
/// signed 16-bit output conversion. Disabled and fully attenuated sources keep
/// their cursors. Returns a Chunk or error 7620 for invalid listener data.
/// @param state Mixer supplying chunkFrames and outputRate; audible source cursors are updated in place.
/// @param listener Three-component listener position in world units.
/// @param right Listener's right vector; its length must lie from 0.99 through 1.01.
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
