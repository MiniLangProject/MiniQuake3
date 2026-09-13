// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful software playback for the sound commands produced by the original
// cgame/ui QVMs. Output is signed 16-bit stereo PCM suitable for WinMM.
package mq3.audio.qvm_playback

import mq3.audio.qvm_sound_assets as assets
import mq3.audio.spatial_mixer as spatial
import mq3.compat.numeric as numeric
import mq3.shared.math as qmath
import std.array as arrays

const MAX_ENTITIES=1024
const MAX_VOICES=96
const MAX_LOOPS=1024

struct Listener entity origin axis inWater end struct
struct Voice id entity channel handle origin fixedOrigin localSound sound cursor active end struct
struct LoopSource entity handle origin velocity realLoop sound cursor active end struct
struct State outputRate chunkFrames catalog listener entityOrigins voices loops nextVoice music commandCursor end struct
struct ApplyResult applied missing ignored end struct
struct Chunk samples frames audibleVoices audibleLoops peak limiterGain end struct

function fail(message) return error(7651,"QVM playback: "+message) end function
function defaultAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function

function create(catalog,outputRate,chunkFrames)
  if catalog==void then return fail("sound catalog is required") end if
  if outputRate<4000 or outputRate>192000 then return fail("invalid output rate") end if
  if chunkFrames<1 or chunkFrames>4096 then return fail("invalid chunk size") end if
  return State(outputRate,chunkFrames,catalog,Listener(0,[0.0,0.0,0.0],defaultAxis(),false),array(MAX_ENTITIES,void),[],[],1,void,0)
end function

function validOrigin(origin) return origin!=void and len(origin)==3 end function
function copyOrigin(origin) return [origin[0],origin[1],origin[2]] end function

function entityOrigin(state,entity)
  if entity>=0 and entity<MAX_ENTITIES and state.entityOrigins[entity]!=void then return state.entityOrigins[entity] end if
  return [0.0,0.0,0.0]
end function

function addVoice(state,command,localSound)
  clip=assets.clipForHandle(state.catalog,command.handle);if clip==void then return false end if
  if command.channel!=0 then
    for each voice in state.voices if voice.entity==command.entity and voice.channel==command.channel then voice.active=false end if end for
  end if
  fixed=validOrigin(command.origin);origin=command.origin;if not fixed then origin=entityOrigin(state,command.entity) end if
  voice=Voice(state.nextVoice,command.entity,command.channel,command.handle,copyOrigin(origin),fixed,localSound,clip.sound,0.0,true);state.nextVoice=state.nextVoice+1
  active=[];for each old in state.voices if old.active then active=active+[old] end if end for
  while len(active)>=MAX_VOICES active[0].active=false;active=arrays.slice(active,1,len(active)-1) end while
  state.voices=active+[voice];return true
end function

function addLoop(state,command)
  if command.entity<0 or command.entity>=MAX_ENTITIES then return false end if
  clip=assets.clipForHandle(state.catalog,command.handle);if clip==void then return false end if
  existing=void
  for each sourceLoop in state.loops if sourceLoop.entity==command.entity then existing=sourceLoop end if end for
  origin=command.origin;if not validOrigin(origin) then origin=entityOrigin(state,command.entity) end if
  velocity=command.velocity;if not validOrigin(velocity) then velocity=[0.0,0.0,0.0] end if
  if existing!=void then
    if existing.handle!=command.handle then existing.cursor=0.0 end if
    existing.handle=command.handle;existing.origin=copyOrigin(origin);existing.velocity=copyOrigin(velocity);existing.realLoop=command.flag;existing.sound=clip.sound;existing.active=true
  else
    if len(state.loops)>=MAX_LOOPS then return false end if
    state.loops=state.loops+[LoopSource(command.entity,command.handle,copyOrigin(origin),copyOrigin(velocity),command.flag,clip.sound,0.0,true)]
  end if
  return true
end function

function clearLoops(state,killAll)
  kept=[]
  if not killAll then for each sourceLoop in state.loops if sourceLoop.realLoop and sourceLoop.active then kept=kept+[sourceLoop] end if end for end if
  state.loops=kept;return void
end function

function stopLoop(state,entity)
  kept=[];found=false
  for each sourceLoop in state.loops if sourceLoop.entity==entity then found=true else kept=kept+[sourceLoop] end if end for
  state.loops=kept;return found
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
  state.listener=Listener(command.entity,copyOrigin(command.origin),[copyOrigin(command.axis[0]),copyOrigin(command.axis[1]),copyOrigin(command.axis[2])],command.flag);return true
end function

function startMusic(state,intro,trackLoop)
  path=trackLoop;if path=="" then path=intro end if
  if path=="" then state.music=void;return true end if
  clip=try(assets.ensurePath(state.catalog,path));if clip is error then return false end if
  state.music=LoopSource(-1,clip.handle,[0.0,0.0,0.0],[0.0,0.0,0.0],true,clip.sound,0.0,true);return true
end function

function apply(state,commands)
  if state==void then return fail("state is required") end if
  if commands==void then return ApplyResult(0,0,0) end if
  applied=0;missing=0;ignored=0
  for each command in commands
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

function consume(state,commands)
  if state==void then return fail("state is required") end if
  if commands==void then state.commandCursor=0;return ApplyResult(0,0,0) end if
  if state.commandCursor<0 or state.commandCursor>len(commands) then state.commandCursor=0 end if
  if state.commandCursor==len(commands) then return ApplyResult(0,0,0) end if
  pending=[];if state.commandCursor<len(commands) then pending=arrays.slice(commands,state.commandCursor,len(commands)-state.commandCursor) end if
  result=apply(state,pending);if result is error then return result end if
  state.commandCursor=len(commands);return result
end function

function sourceGains(state,entity,origin,localSound)
  if localSound or entity==state.listener.entity then return spatial.Spatial(1.0,1.0,0.0,1.0) end if
  return spatial.spatialize(origin,state.listener.origin,state.listener.axis[1],1.0,false)
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

function render(state)
  if state==void then return fail("state is required") end if
  leftMix=array(state.chunkFrames,0.0);rightMix=array(state.chunkFrames,0.0);voiceCount=0;loopCount=0
  for each voice in state.voices
    if voice.active then
      origin=voice.origin;if not voice.fixedOrigin then origin=entityOrigin(state,voice.entity) end if;gains=sourceGains(state,voice.entity,origin,voice.localSound)
      if gains.left>0.0 or gains.right>0.0 then result=mixSource(state,voice.sound,voice.cursor,false,gains,leftMix,rightMix);voice.cursor=result[0];voice.active=result[1];voiceCount=voiceCount+1 end if
    end if
  end for
  for each sourceLoop in state.loops
    if sourceLoop.active then gains=sourceGains(state,sourceLoop.entity,sourceLoop.origin,false);if gains.left>0.0 or gains.right>0.0 then result=mixSource(state,sourceLoop.sound,sourceLoop.cursor,true,gains,leftMix,rightMix);sourceLoop.cursor=result[0];loopCount=loopCount+1 end if end if
  end for
  if state.music!=void and state.music.active then
    gains=spatial.Spatial(1.0,1.0,0.0,1.0);result=mixSource(state,state.music.sound,state.music.cursor,true,gains,leftMix,rightMix);state.music.cursor=result[0];loopCount=loopCount+1
  end if
  peak=0.0
  for frame=0 to state.chunkFrames-1
    left=leftMix[frame];if left<0.0 then left=0.0-left end if;if left>peak then peak=left end if
    right=rightMix[frame];if right<0.0 then right=0.0-right end if;if right>peak then peak=right end if
  end for
  limiter=1.0;if peak>32767.0 then limiter=32767.0/peak end if
  output=bytes(state.chunkFrames*4,0);for frame=0 to state.chunkFrames-1 spatial.write16(output,frame*4,leftMix[frame]*limiter);spatial.write16(output,frame*4+2,rightMix[frame]*limiter) end for
  active=[];for each voice in state.voices if voice.active then active=active+[voice] end if end for;state.voices=active
  return Chunk(output,state.chunkFrames,voiceCount,loopCount,peak,limiter)
end function
