// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful software playback for the sound commands produced by the original
// cgame/ui QVMs. Output is signed 16-bit stereo PCM suitable for WinMM.
package mq3.audio.qvm_playback

import mq3.audio.qvm_sound_assets as assets
import mq3.audio.spatial_mixer as spatial
import mq3.audio.snd_spatialize as sndSpatial
import mq3.audio.snd_channels as sndChannels
import mq3.audio.snd_loop_channels as sndLoops
import mq3.audio.snd_loop_doppler as sndDoppler
import mq3.audio.snd_paint_pipeline as sndPaint
import mq3.audio.snd_raw_stream as sndRaw
import mq3.audio.snd_public as sndPublic
import mq3.audio.native_paint as nativePaint
import mq3.compat.numeric as numeric
import mq3.shared.math as qmath
import std.ds.list as lists

const MAX_ENTITIES=1024
const MAX_VOICES=96
const MAX_LOOPS=1024

struct Listener entity origin axis inWater end struct
struct Voice id slot entity channel handle origin fixedOrigin localSound sound compressed mono cursor active end struct
struct LoopSource entity handle origin velocity realLoop sound compressed mono cursor active doppler dopplerScale oldDopplerScale end struct
struct Music introSound loopSound cursor inIntro active end struct
struct State outputRate chunkFrames catalog listener entityOrigins voices loops nextVoice music commandCursor channels loopPaintedFrames rawStream monoCache clipHandles end struct
struct ApplyResult applied missing ignored end struct
struct Chunk samples frames audibleVoices audibleLoops peak limiterGain end struct

function fail(message) return error(7651,"QVM playback: "+message) end function
function defaultAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function

function create(catalog,outputRate,chunkFrames)
  if catalog==void then return fail("sound catalog is required") end if
  if outputRate<4000 or outputRate>192000 then return fail("invalid output rate") end if
  if chunkFrames<1 or chunkFrames>4096 then return fail("invalid chunk size") end if
  rawStream=sndRaw.create(outputRate);if rawStream is error then return rawStream end if
  maxHandle=0;for each clip in catalog.clips if clip.handle>maxHandle then maxHandle=clip.handle end if end for
  clipHandles=array(maxHandle+1,void);for each clip in catalog.clips if clip.handle>0 then clipHandles[clip.handle]=clip end if end for
  return State(outputRate,chunkFrames,catalog,Listener(0,[0.0,0.0,0.0],defaultAxis(),false),array(MAX_ENTITIES,void),[],[],1,void,0,sndChannels.create(),0,rawStream,lists.List.withCapacity(64),clipHandles)
end function

function clipForHandle(state,handle)
  if handle<=0 then return void end if
  if handle<len(state.clipHandles) and state.clipHandles[handle]!=void then return state.clipHandles[handle] end if
  // Sound registration can continue after playback starts. Populate the
  // direct table lazily for those handles while retaining the catalog as the
  // authoritative source.
  clip=assets.clipForHandle(state.catalog,handle);if clip==void then return void end if
  if handle>=len(state.clipHandles) then expanded=array(handle+1,void);if len(state.clipHandles)>0 then copyArray(expanded,0,state.clipHandles,0,len(state.clipHandles)) end if;state.clipHandles=expanded end if
  state.clipHandles[handle]=clip;return clip
end function

function queueRaw(state,audio,volume)
  if state==void or audio==void then return fail("state and raw audio are required") end if
  synced=sndRaw.setSoundTime(state.rawStream,state.loopPaintedFrames);if synced is error then return synced end if
  return sndRaw.enqueue(state.rawStream,audio.frames,audio.sampleRate,audio.bitsPerSample/8,audio.channels,audio.samples,volume)
end function

function validOrigin(origin) return origin!=void and len(origin)==3 end function
function validSoundEntity(entity) return sndPublic.validEntity(entity) end function
function copyOrigin(origin) return [origin[0],origin[1],origin[2]] end function

function cachedMono(state,clip)
  if clip.compressed!=void then return void end if
  for each entry in state.monoCache if entry[0]==clip.handle then return entry[1] end if end for
  samples=sndPaint.monoSamples(clip.sound);if samples is error then return samples end if
  state.monoCache.add([clip.handle,samples]);return samples
end function

function entityOrigin(state,entity)
  if entity>=0 and entity<MAX_ENTITIES and state.entityOrigins[entity]!=void then return state.entityOrigins[entity] end if
  return [0.0,0.0,0.0]
end function

function addVoice(state,command,localSound)
  clip=clipForHandle(state,command.handle);if clip==void then return false end if
  entity=command.entity;if localSound then entity=state.listener.entity end if
  selected=sndChannels.start(state.channels,entity,command.handle,command.channel);if not selected.accepted then return true end if
  if selected.replaced then for each voice in state.voices if voice.slot==selected.slot then voice.active=false end if end for end if
  fixed=validOrigin(command.origin);origin=command.origin;if not fixed then origin=entityOrigin(state,command.entity) end if
  mono=cachedMono(state,clip);if mono is error then return false end if
  voice=Voice(state.nextVoice,selected.slot,entity,command.channel,command.handle,copyOrigin(origin),fixed,localSound,clip.sound,clip.compressed,mono,0.0,true);state.nextVoice=state.nextVoice+1
  active=lists.List.withCapacity(len(state.voices)+1);for each old in state.voices if old.active then active.add(old) end if end for
  active.add(voice);state.voices=active.toArray();return true
end function

function addLoop(state,command)
  if command.entity<0 or command.entity>=MAX_ENTITIES then return false end if
  clip=clipForHandle(state,command.handle);if clip==void then return false end if
  existing=void
  for each sourceLoop in state.loops if sourceLoop.entity==command.entity then existing=sourceLoop end if end for
  origin=command.origin;if not validOrigin(origin) then origin=entityOrigin(state,command.entity) end if
  velocity=command.velocity;if not validOrigin(velocity) then velocity=[0.0,0.0,0.0] end if
  previousScale=1.0;consecutive=false;if existing!=void then previousScale=existing.dopplerScale;consecutive=existing.active end if
  doppler=sndDoppler.update(state.listener.origin,origin,velocity,previousScale,consecutive,not command.flag);if doppler is error then return false end if
  if existing!=void then
    if existing.handle!=command.handle then existing.cursor=0.0 end if
    mono=cachedMono(state,clip);if mono is error then return false end if
    existing.handle=command.handle;existing.origin=copyOrigin(origin);existing.velocity=copyOrigin(velocity);existing.realLoop=command.flag;existing.sound=clip.sound;existing.compressed=clip.compressed;existing.mono=mono;existing.active=true;existing.doppler=doppler.active;existing.dopplerScale=doppler.scale;existing.oldDopplerScale=doppler.oldScale
  else
    if len(state.loops)>=MAX_LOOPS then return false end if
    mono=cachedMono(state,clip);if mono is error then return false end if
    expanded=array(len(state.loops)+1,void);if len(state.loops)>0 then copyArray(expanded,0,state.loops,0,len(state.loops)) end if;expanded[len(state.loops)]=LoopSource(command.entity,command.handle,copyOrigin(origin),copyOrigin(velocity),command.flag,clip.sound,clip.compressed,mono,0.0,true,doppler.active,doppler.scale,doppler.oldScale);state.loops=expanded
  end if
  return true
end function

function clearLoops(state,killAll)
  kept=lists.List.withCapacity(len(state.loops))
  if not killAll then for each sourceLoop in state.loops if sourceLoop.realLoop and sourceLoop.active then kept.add(sourceLoop) end if end for end if
  state.loops=kept.toArray();return void
end function

function stopLoop(state,entity)
  kept=lists.List.withCapacity(len(state.loops));found=false
  for each sourceLoop in state.loops if sourceLoop.entity==entity then found=true else kept.add(sourceLoop) end if end for
  state.loops=kept.toArray();return found
end function

function setPosition(state,entity,origin)
  if entity<0 or entity>=MAX_ENTITIES or not validOrigin(origin) then return false end if
  copied=copyOrigin(origin);state.entityOrigins[entity]=copied
  for each sourceLoop in state.loops if sourceLoop.entity==entity then sourceLoop.origin=copyOrigin(copied) end if end for
  return true
end function

function setListener(state,command)
  if not validOrigin(command.origin) or command.axis==void or len(command.axis)!=3 then return false end if
  for each row in command.axis if not validOrigin(row) then return false end if end for
  rightLength=qmath.VectorLength(command.axis[1]);if rightLength<0.99 or rightLength>1.01 then return false end if
  state.listener=Listener(command.entity,copyOrigin(command.origin),[copyOrigin(command.axis[0]),copyOrigin(command.axis[1]),copyOrigin(command.axis[2])],command.flag);sndChannels.setListener(state.channels,command.entity);return true
end function

function startMusic(state,intro,trackLoop)
  // Baseq3 streams the intro once and only then starts the loop track.  An
  // empty intro is a no-op in S_StartBackgroundTrack; stopping has its own
  // syscall and must remain explicit.
  if intro=="" then return true end if
  introClip=try(assets.ensurePath(state.catalog,intro));if introClip is error then return false end if
  path=trackLoop;if path=="" then path=intro end if
  loopClip=try(assets.ensurePath(state.catalog,path));if loopClip is error then return false end if
  state.music=Music(introClip.sound,loopClip.sound,0.0,true,true);return true
end function

function applyFrom(state,commands,start)
  if state==void then return fail("state is required") end if
  if commands==void then return ApplyResult(0,0,0) end if
  if start<0 or start>len(commands) then return fail("command start is outside the queue") end if
  if start==len(commands) then return ApplyResult(0,0,0) end if
  applied=0;missing=0;ignored=0
  for commandIndex=start to len(commands)-1
    command=commands[commandIndex]
    handled=false
    if command.kind=="start" then handled=addVoice(state,command,false);if not handled then missing=missing+1 end if
    else if command.kind=="local" then handled=addVoice(state,command,true);if not handled then missing=missing+1 end if
    else if command.kind=="clearLoops" then clearLoops(state,command.flag);handled=true
    else if command.kind=="loop" then handled=addLoop(state,command);if not handled then missing=missing+1 end if
    else if command.kind=="stopLoop" then stopLoop(state,command.entity);handled=true
    else if command.kind=="position" then handled=setPosition(state,command.entity,command.origin)
    else if command.kind=="listener" then handled=setListener(state,command)
    else if command.kind=="music" then handled=startMusic(state,command.text,command.text2);if not handled then missing=missing+1 end if
    else if command.kind=="stopMusic" then state.music=void;handled=true
    else ignored=ignored+1 end if
    if handled then
      applied=applied+1
    else
      if command.kind=="position" or command.kind=="listener" then ignored=ignored+1 end if
    end if
  end for
  return ApplyResult(applied,missing,ignored)
end function

function apply(state,commands) return applyFrom(state,commands,0) end function

function consume(state,commands)
  if state==void then return fail("state is required") end if
  if commands==void then state.commandCursor=0;return ApplyResult(0,0,0) end if
  if state.commandCursor<0 or state.commandCursor>len(commands) then state.commandCursor=0 end if
  if state.commandCursor==len(commands) then return ApplyResult(0,0,0) end if
  result=applyFrom(state,commands,state.commandCursor);if result is error then return result end if
  state.commandCursor=len(commands);return result
end function

function sourceGains(state,entity,origin,localSound)
  if localSound or entity==state.listener.entity then return spatial.Spatial(1.0,1.0,0.0,1.0) end if
  value=sndSpatial.gains(origin,state.listener.origin,state.listener.axis,127);if value is error then return value end if
  return spatial.Spatial(value[0],value[1],value[2],value[3])
end function

function sourceVolumes(state,entity,origin,localSound)
  if localSound or entity==state.listener.entity then return [127,127] end if
  value=sndSpatial.spatialize(origin,state.listener.origin,state.listener.axis,127,2);if value is error then return value end if
  return [value.left,value.right]
end function

function loopByEntity(state,entity)
  for each sourceLoop in state.loops if sourceLoop.entity==entity then return sourceLoop end if end for
  return void
end function

function mixSource(state,sound,cursor,looping,gains,leftMix,rightMix)
  frames=len(sound.samples)/sound.blockAlign;if frames<1 then return [cursor,false] end if
  phase=cursor;step=sound.sampleRate/state.outputRate;active=true
  for frame=0 to state.chunkFrames-1
    if active then
      sample=spatial.monoSample(sound,numeric.trunc32(phase));leftMix[frame]=leftMix[frame]+sample*gains.left;rightMix[frame]=rightMix[frame]+sample*gains.right;phase=phase+step
      if looping then while phase>=frames phase=phase-frames end while else if phase>=frames then active=false end if
    end if
  end for
  return [phase,active]
end function

function musicSample(sound,frame,channel)
  frames=len(sound.samples)/sound.blockAlign;if frames<1 then return 0 end if
  index=frame%frames;if index<0 then index=index+frames end if;offset=index*sound.blockAlign
  if sound.bitsPerSample==8 then
    if sound.channels==2 then offset=offset+channel end if
    return (sound.samples[offset]-128)*256
  end if
  if sound.channels==2 then offset=offset+channel*2 end if
  return spatial.signed16(sound.samples,offset)
end function

function mixMusic(state,music,leftMix,rightMix)
  phase=music.cursor;inIntro=music.inIntro;active=music.active
  for frame=0 to state.chunkFrames-1
    if active then
      sound=music.loopSound;if inIntro then sound=music.introSound end if
      sourceFrames=len(sound.samples)/sound.blockAlign
      if sourceFrames<1 then
        active=false
      else
        sourceFrame=numeric.trunc32(phase)
        leftMix[frame]=leftMix[frame]+musicSample(sound,sourceFrame,0)
        rightChannel=0;if sound.channels==2 then rightChannel=1 end if
        rightMix[frame]=rightMix[frame]+musicSample(sound,sourceFrame,rightChannel)
        phase=phase+sound.sampleRate/state.outputRate
        if phase>=sourceFrames then
          overflowSeconds=(phase-sourceFrames)/sound.sampleRate
          if inIntro then
            inIntro=false;phase=overflowSeconds*music.loopSound.sampleRate
            loopFrames=len(music.loopSound.samples)/music.loopSound.blockAlign
            if loopFrames<1 then active=false else while phase>=loopFrames phase=phase-loopFrames end while end if
          else
            while phase>=sourceFrames phase=phase-sourceFrames end while
          end if
        end if
      end if
    end if
  end for
  music.cursor=phase;music.inIntro=inIntro;music.active=active;return active
end function

function paintMusic(state,music,paint)
  phase=music.cursor;inIntro=music.inIntro;active=music.active;left=array(state.chunkFrames,0);right=array(state.chunkFrames,0)
  for frame=0 to state.chunkFrames-1
    leftSample=0;rightSample=0
    if active then
      sound=music.loopSound;if inIntro then sound=music.introSound end if
      sourceFrames=len(sound.samples)/sound.blockAlign
      if sourceFrames<1 then active=false
      else
        sourceFrame=numeric.trunc32(phase);leftSample=musicSample(sound,sourceFrame,0);rightChannel=0;if sound.channels==2 then rightChannel=1 end if;rightSample=musicSample(sound,sourceFrame,rightChannel)
        phase=phase+sound.sampleRate/state.outputRate
        if phase>=sourceFrames then
          overflowSeconds=(phase-sourceFrames)/sound.sampleRate
          if inIntro then
            inIntro=false;phase=overflowSeconds*music.loopSound.sampleRate;loopFrames=len(music.loopSound.samples)/music.loopSound.blockAlign
            if loopFrames<1 then active=false else while phase>=loopFrames phase=phase-loopFrames end while end if
          else while phase>=sourceFrames phase=phase-sourceFrames end while end if
        end if
      end if
    end if
    left[frame]=leftSample;right[frame]=rightSample
  end for
  sndPaint.paintRaw(paint,left,right,0,state.chunkFrames,1.0)
  music.cursor=phase;music.inIntro=inIntro;music.active=active;return active
end function

function render(state)
  if state==void then return fail("state is required") end if
  paint=array(state.chunkFrames*2,0);voiceCount=0;loopCount=0
  rawFrames=sndRaw.paint(state.rawStream,paint,state.loopPaintedFrames,state.chunkFrames);if rawFrames is error then return rawFrames end if
  if state.music!=void and state.music.active then if paintMusic(state,state.music,paint) then loopCount=loopCount+1 end if end if
  for each voice in state.voices
    if voice.active then
      origin=voice.origin;if not voice.fixedOrigin then origin=entityOrigin(state,voice.entity) end if;volumes=sourceVolumes(state,voice.entity,origin,voice.localSound);painted=0
      if voice.compressed!=void then painted=sndPaint.paintSfxOneShot(paint,voice.sound,voice.compressed,numeric.trunc32(voice.cursor),state.chunkFrames,0,volumes[0],volumes[1],sndPaint.DEFAULT_SND_VOLUME)
      else painted=sndPaint.paintMonoOneShot(paint,voice.mono,len(voice.sound.samples)/voice.sound.blockAlign,numeric.trunc32(voice.cursor),state.chunkFrames,0,volumes[0],volumes[1],sndPaint.DEFAULT_SND_VOLUME) end if;if painted is error then return painted end if
      voice.cursor=voice.cursor+painted;sourceFrames=sndPaint.soundFrames(voice.sound,voice.compressed);if voice.cursor>=sourceFrames then voice.active=false end if
      if painted>0 and (volumes[0]>0 or volumes[1]>0) then voiceCount=voiceCount+1 end if
    end if
  end for
  loopEntries=array(len(state.loops),void);loopIndex=0;for each sourceLoop in state.loops loopEntries[loopIndex]=sndLoops.Entry(sourceLoop.entity,sourceLoop.handle,sourceLoop.origin,sourceLoop.realLoop,sourceLoop.doppler,sourceLoop.dopplerScale,sourceLoop.oldDopplerScale,sourceLoop.active);loopIndex=loopIndex+1 end for
  loopGroups=sndLoops.build(loopEntries,state.listener.origin,state.listener.axis);if loopGroups is error then return loopGroups end if
  for each group in loopGroups
    sourceLoop=loopByEntity(state,group.primary)
    if sourceLoop!=void then
      painted=0
      if sourceLoop.compressed!=void then painted=sndPaint.paintSfxLoopDoppler(paint,sourceLoop.sound,sourceLoop.compressed,state.loopPaintedFrames,state.chunkFrames,0,group.left,group.right,sndPaint.DEFAULT_SND_VOLUME,group.doppler,group.dopplerScale,group.oldDopplerScale)
      else painted=sndPaint.paintMonoLoopDoppler(paint,sourceLoop.mono,len(sourceLoop.sound.samples)/sourceLoop.sound.blockAlign,state.loopPaintedFrames,state.chunkFrames,0,group.left,group.right,sndPaint.DEFAULT_SND_VOLUME,group.doppler,group.dopplerScale,group.oldDopplerScale) end if;if painted is error then return painted end if
      frames=sndPaint.soundFrames(sourceLoop.sound,sourceLoop.compressed);phase=0;if frames>0 then phase=(state.loopPaintedFrames+painted)%frames end if
      for each entity in group.ids member=loopByEntity(state,entity);if member!=void then member.cursor=phase end if end for
      loopCount=loopCount+1
    end if
  end for
  state.loopPaintedFrames=state.loopPaintedFrames+state.chunkFrames
  peak=0.0
  for frame=0 to state.chunkFrames-1
    left=paint[frame*2]/256.0;if left<0.0 then left=0.0-left end if;if left>peak then peak=left end if
    right=paint[frame*2+1]/256.0;if right<0.0 then right=0.0-right end if;if right>peak then peak=right end if
  end for
  limiter=1.0;if peak>32767.0 then limiter=32767.0/peak end if
  output=sndPaint.transfer16(paint,state.chunkFrames);if output is error then return output end if
  active=lists.List.withCapacity(len(state.voices));for each voice in state.voices if voice.active then active.add(voice) else sndChannels.release(state.channels,voice.slot) end if end for;state.voices=active.toArray()
  elapsed=numeric.trunc32(state.chunkFrames*1000.0/state.outputRate);if elapsed<1 then elapsed=1 end if;sndChannels.advance(state.channels,elapsed)
  return Chunk(output,state.chunkFrames,voiceCount,loopCount,peak,limiter)
end function

function hasCompressedSources(state)
  for each voice in state.voices if voice.active and voice.compressed!=void then return true end if end for
  for each sourceLoop in state.loops if sourceLoop.active and sourceLoop.compressed!=void then return true end if end for
  return false
end function

function paintMusicFast(state,music,paint)
  phase=music.cursor;inIntro=music.inIntro;active=music.active;done=0
  while done<state.chunkFrames and active
    sound=music.loopSound;if inIntro then sound=music.introSound end if
    sourceFrames=len(sound.samples)/sound.blockAlign
    if sourceFrames<1 then active=false
    else
      step=sound.sampleRate/state.outputRate;remaining=sourceFrames-phase;part=numeric.trunc32(remaining/step)
      if part*step<remaining then part=part+1 end if;if part<1 then part=1 end if;if done+part>state.chunkFrames then part=state.chunkFrames-done end if
      phase=nativePaint.mixStream(paint,sound,sourceFrames,state.outputRate,phase,part,done);if phase is error then return phase end if;done=done+part
      if phase>=sourceFrames then
        overflowSeconds=(phase-sourceFrames)/sound.sampleRate
        if inIntro then inIntro=false;phase=overflowSeconds*music.loopSound.sampleRate;loopFrames=len(music.loopSound.samples)/music.loopSound.blockAlign;if loopFrames<1 then active=false else while phase>=loopFrames phase=phase-loopFrames end while end if
        else while phase>=sourceFrames phase=phase-sourceFrames end while end if
      end if
    end if
  end while
  music.cursor=phase;music.inIntro=inIntro;music.active=active;return active
end function

// Production Windows fast path. It is deliberately additive: the exact,
// reference-tested MiniLang painter above remains the fallback for compressed
// effects and queued cinematic raw audio.
function renderFast(state)
  if state==void then return fail("state is required") end if
  if hasCompressedSources(state) or state.rawStream.rawEnd>state.loopPaintedFrames then return render(state) end if
  paint=bytes(state.chunkFrames*8,0);voiceCount=0;loopCount=0
  if state.music!=void and state.music.active then paintedMusic=paintMusicFast(state,state.music,paint);if paintedMusic is error then return paintedMusic end if;if paintedMusic then loopCount=loopCount+1 end if end if
  for each voice in state.voices
    if voice.active then
      origin=voice.origin;if not voice.fixedOrigin then origin=entityOrigin(state,voice.entity) end if;volumes=sourceVolumes(state,voice.entity,origin,voice.localSound);sourceFrames=len(voice.sound.samples)/voice.sound.blockAlign
      painted=nativePaint.mixPcm(paint,voice.sound,sourceFrames,numeric.trunc32(voice.cursor),state.chunkFrames,0,volumes[0],volumes[1],sndPaint.DEFAULT_SND_VOLUME,false,false,1.0,1.0);if painted is error then return painted end if
      voice.cursor=voice.cursor+painted;if voice.cursor>=sourceFrames then voice.active=false end if
      if painted>0 and (volumes[0]>0 or volumes[1]>0) then voiceCount=voiceCount+1 end if
    end if
  end for
  loopEntries=array(len(state.loops),void);loopIndex=0;for each sourceLoop in state.loops loopEntries[loopIndex]=sndLoops.Entry(sourceLoop.entity,sourceLoop.handle,sourceLoop.origin,sourceLoop.realLoop,sourceLoop.doppler,sourceLoop.dopplerScale,sourceLoop.oldDopplerScale,sourceLoop.active);loopIndex=loopIndex+1 end for
  loopGroups=sndLoops.build(loopEntries,state.listener.origin,state.listener.axis);if loopGroups is error then return loopGroups end if
  for each group in loopGroups
    sourceLoop=loopByEntity(state,group.primary)
    if sourceLoop!=void then
      sourceFrames=len(sourceLoop.sound.samples)/sourceLoop.sound.blockAlign
      painted=nativePaint.mixPcm(paint,sourceLoop.sound,sourceFrames,state.loopPaintedFrames,state.chunkFrames,0,group.left,group.right,sndPaint.DEFAULT_SND_VOLUME,true,group.doppler,group.dopplerScale,group.oldDopplerScale);if painted is error then return painted end if
      phase=0;if sourceFrames>0 then phase=(state.loopPaintedFrames+painted)%sourceFrames end if
      for each entity in group.ids member=loopByEntity(state,entity);if member!=void then member.cursor=phase end if end for;loopCount=loopCount+1
    end if
  end for
  state.loopPaintedFrames=state.loopPaintedFrames+state.chunkFrames
  transferred=nativePaint.finish(paint,state.chunkFrames);if transferred is error then return transferred end if;peak=transferred.peak;limiter=1.0;if peak>32767 then limiter=32767.0/peak end if
  active=lists.List.withCapacity(len(state.voices));for each voice in state.voices if voice.active then active.add(voice) else sndChannels.release(state.channels,voice.slot) end if end for;state.voices=active.toArray()
  elapsed=numeric.trunc32(state.chunkFrames*1000.0/state.outputRate);if elapsed<1 then elapsed=1 end if;sndChannels.advance(state.channels,elapsed)
  return Chunk(transferred.samples,state.chunkFrames,voiceCount,loopCount,peak,limiter)
end function
