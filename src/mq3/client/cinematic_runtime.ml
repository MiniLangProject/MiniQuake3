// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful implementation of CIN_Play/Stop/Run/Draw/SetExtents for RoQ media.
package mq3.client.cinematic_runtime

import mq3.format.pk3 as pk3
import mq3.format.roq as roq
import mq3.video.roq_video as video
import std.string as strings
import std.ds.list as lists

const FMV_IDLE=0
const FMV_PLAY=1
const FMV_EOF=2
const FMV_LOOPED=5
const CIN_SYSTEM=1
const CIN_LOOP=2
const CIN_HOLD=4
const CIN_SILENT=8
const CIN_SHADER=16
const MAX_HANDLES=16

struct Extents x y width height end struct
struct Draw handle frame extents dirty shader end struct
struct Upload handle frame dirty shader end struct
struct Presentation pixels sourceWidth sourceHeight x y width height dirty end struct
struct Clip handle path movie decoder chunkIndex status startTime lastTime extents looping hold silent shader dirty audioQueue end struct
struct State archive handles drawQueue end struct

function fail(message) return error(7692,"cinematic runtime: "+message) end function
function create(archive) if archive==void then return fail("archive is required") end if;return State(archive,array(MAX_HANDLES,void),lists.List.withCapacity(16)) end function
function pathFor(name)
  if name==void or name=="" then return "" end if
  value=strings.replaceAll(name,"\\","/");if strings.indexOf(value,"/",0)<0 then value="video/"+value end if;return value
end function
function validHandle(state,handle) return state!=void and handle>=0 and handle<MAX_HANDLES and state.handles[handle]!=void end function
function freeHandle(state) for index=0 to MAX_HANDLES-1 if state.handles[index]==void or state.handles[index].status==FMV_EOF then return index end if end for;return -1 end function

function play(state,name,x,y,width,height,bits,now)
  if state==void or now<0 then return fail("state and non-negative time are required") end if
  path=pathFor(name);if path=="" then return -1 end if
  if (bits&CIN_SYSTEM)==0 then for index=0 to MAX_HANDLES-1 if state.handles[index]!=void and state.handles[index].status!=FMV_EOF and stringEqualsIgnoreCaseAscii(state.handles[index].path,path) then return index end if end for end if
  handle=freeHandle(state);if handle<0 then return fail("no free video handles") end if
  data=try(pk3.read(state.archive,path));if data is error then return -1 end if;movie=try(roq.parse(data));if movie is error then return -1 end if
  clip=Clip(handle,path,movie,video.create(),0,FMV_PLAY,now,now,Extents(x,y,width,height),(bits&CIN_LOOP)!=0,(bits&CIN_HOLD)!=0,(bits&CIN_SILENT)!=0,(bits&CIN_SHADER)!=0,true,lists.List.withCapacity(16))
  state.handles[handle]=clip;return handle
end function

function resetClip(clip,now)
  clip.decoder=video.create();clip.chunkIndex=0;clip.startTime=now;clip.lastTime=now;clip.status=FMV_LOOPED;clip.dirty=true;clip.audioQueue=lists.List.withCapacity(16);return void
end function
function finishClip(clip,now)
  if clip.looping then resetClip(clip,now);return true end if
  if clip.hold then clip.status=FMV_IDLE else clip.status=FMV_EOF end if;return false
end function

function run(state,handle,now)
  if not validHandle(state,handle) then return FMV_EOF end if;clip=state.handles[handle]
  if clip.status==FMV_EOF or clip.status==FMV_IDLE then return clip.status end if
  if clip.shader and now-clip.lastTime>100 then clip.startTime=clip.startTime+(now-clip.lastTime) end if
  desired=((now-clip.startTime)*clip.movie.fps)/1000+1;if desired<1 then desired=1 end if
  while clip.decoder.frameCount<desired and clip.status==FMV_PLAY
    if clip.chunkIndex>=len(clip.movie.chunks) then if not finishClip(clip,now) then break end if;clip.status=FMV_PLAY;desired=1 end if
    if clip.chunkIndex<len(clip.movie.chunks) then
      chunk=clip.movie.chunks[clip.chunkIndex];clip.chunkIndex=clip.chunkIndex+1
      if chunk.id==roq.SOUND_MONO or chunk.id==roq.SOUND_STEREO then
        if not clip.silent then decoded=roq.decodeAudio(clip.movie,chunk);if decoded is error then clip.status=FMV_EOF;return clip.status end if;clip.audioQueue.add(decoded) end if
      else processed=video.process(clip.decoder,clip.movie,chunk);if processed is error then clip.status=FMV_EOF;return clip.status end if;if chunk.id==roq.QUAD_VQ then clip.dirty=true end if
      end if
    end if
  end while
  clip.lastTime=now;if clip.status==FMV_LOOPED then clip.status=FMV_PLAY end if;return clip.status
end function

function stop(state,handle)
  if not validHandle(state,handle) then return FMV_EOF end if;state.handles[handle].status=FMV_EOF;return FMV_EOF
end function
function setExtents(state,handle,x,y,width,height)
  if not validHandle(state,handle) then return false end if;clip=state.handles[handle];if clip.status==FMV_EOF then return false end if
  clip.extents=Extents(x,y,width,height);clip.dirty=true;return true
end function
function draw(state,handle)
  if not validHandle(state,handle) then return void end if;clip=state.handles[handle];if clip.status==FMV_EOF or clip.decoder.latest==void then return void end if
  result=Draw(handle,clip.decoder.latest,clip.extents,clip.dirty,clip.shader);clip.dirty=false;state.drawQueue.add(result);return result
end function
// CIN_UploadCinematic consumes the same decoded buffer as CIN_DrawCinematic,
// but it must not enqueue a screen quad.  Shader stages call run() first and
// then consume this upload record for their stable scratch texture.
function upload(state,handle)
  if not validHandle(state,handle) then return void end if;clip=state.handles[handle]
  if clip.status==FMV_EOF or clip.decoder.latest==void then return void end if
  result=Upload(handle,clip.decoder.latest,clip.dirty,clip.shader);clip.dirty=false;return result
end function
function presentation(draw,virtualWidth,virtualHeight,targetWidth,targetHeight)
  if draw==void or virtualWidth<=0 or virtualHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("invalid presentation dimensions") end if
  x=draw.extents.x;y=draw.extents.y;width=draw.extents.width;height=draw.extents.height
  if not draw.shader then x=x*targetWidth/virtualWidth;y=y*targetHeight/virtualHeight;width=width*targetWidth/virtualWidth;height=height*targetHeight/virtualHeight end if
  return Presentation(draw.frame.pixels,draw.frame.width,draw.frame.height,x,y,width,height,draw.dirty)
end function
function takeDraws(state) if state==void then return [] end if;result=state.drawQueue.toArray();state.drawQueue=lists.List.withCapacity(16);return result end function
function discardDraws(state) if state!=void then state.drawQueue.clear() end if;return void end function
function takeAudio(state,handle)
  if not validHandle(state,handle) then return [] end if;clip=state.handles[handle];result=clip.audioQueue.toArray();clip.audioQueue=lists.List.withCapacity(16);return result
end function
function closeAll(state) if state!=void then for handle=0 to MAX_HANDLES-1 if state.handles[handle]!=void then stop(state,handle) end if end for;state.drawQueue=lists.List.withCapacity(16) end if;return void end function
