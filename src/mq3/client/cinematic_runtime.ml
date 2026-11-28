// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful implementation of CIN_Play/Stop/Run/Draw/SetExtents for RoQ media.
package mq3.client.cinematic_runtime

import mq3.format.pk3 as pk3
import mq3.format.roq as roq
import mq3.video.roq_video as video
import mq3.compat.numeric as numeric
import std.string as strings
import std.ds.list as lists

/// Cinematic decoder state indicating idle.
const FMV_IDLE=0
/// Cinematic decoder state indicating play.
const FMV_PLAY=1
/// Cinematic decoder state indicating eof.
const FMV_EOF=2
/// Cinematic decoder state indicating looped.
const FMV_LOOPED=5
/// Cinematic playback flag selecting system behavior.
const CIN_SYSTEM=1
/// Cinematic playback flag selecting loop behavior.
const CIN_LOOP=2
/// Cinematic playback flag selecting hold behavior.
const CIN_HOLD=4
/// Cinematic playback flag selecting silent behavior.
const CIN_SILENT=8
/// Cinematic playback flag selecting shader behavior.
const CIN_SHADER=16
/// Capacity limit for the handles collection or bounded storage used by this client module.
const MAX_HANDLES=16

/// Stores cinematic runtime extents record, including `x`, `y`, `width`, `height`.
struct Extents
  /// Horizontal coordinate of the requested cinematic rectangle before conversion to target-display
  /// coordinates.
  x
  /// Vertical coordinate of the requested cinematic rectangle before conversion to target-display
  /// coordinates.
  y
  /// Requested cinematic destination width, interpreted in virtual screen units for non-shader
  /// playback.
  width
  /// Requested cinematic destination height, interpreted in virtual screen units for non-shader
  /// playback.
  height
end struct
/// Stores cinematic runtime draw record, including `handle`, `frame`, `extents`, `dirty`, `shader`.
struct Draw
  /// When constructing this record, `draw` supplies `handle` for this member.
  handle
  /// Latest decoded RoQ video frame, including its pixel buffer and dimensions, queued for cinematic
  /// drawing.
  frame
  /// When constructing this record, `draw` supplies `clip.extents` for this member.
  extents
  /// When constructing this record, `draw` supplies `clip.dirty` for this member.
  dirty
  /// True for cinematic texture playback, which preserves the supplied extents without virtual-screen
  /// scaling.
  shader
end struct
/// Stores cinematic runtime upload record, including `handle`, `frame`, `dirty`, `shader`.
struct Upload
  /// When constructing this record, `upload` supplies `handle` for this member.
  handle
  /// Latest decoded RoQ video frame whose pixels and dimensions are supplied to the texture upload.
  frame
  /// When constructing this record, `upload` supplies `clip.dirty` for this member.
  dirty
  /// True when the decoded frame belongs to a cinematic opened for shader-texture playback.
  shader
end struct
/// Stores cinematic runtime presentation record, including `pixels`, `sourceWidth`, `sourceHeight`, `x`, `y`, `width` and additional values.
struct Presentation
  /// When constructing this record, `presentation` supplies `draw.frame.pixels` for this member.
  pixels
  /// When constructing this record, `presentation` supplies `draw.frame.width` for this member.
  sourceWidth
  /// When constructing this record, `presentation` supplies `draw.frame.height` for this member.
  sourceHeight
  /// Horizontal coordinate of the scaled cinematic rectangle in target-display pixels.
  x
  /// Vertical coordinate of the scaled cinematic rectangle in target-display pixels.
  y
  /// Destination width passed to the cinematic presenter after any virtual-to-target scaling.
  width
  /// Destination height passed to the cinematic presenter after any virtual-to-target scaling.
  height
  /// When constructing this record, `presentation` supplies `draw.dirty` for this member.
  dirty
end struct
/// Stores cinematic runtime clip record, including `handle`, `path`, `movie`, `decoder`, `chunkIndex`, `status` and additional values.
struct Clip
  /// When constructing this record, `play` supplies `handle` for this member.
  handle
  /// When constructing this record, `play` supplies `path` for this member.
  path
  /// When constructing this record, `play` supplies `movie` for this member. Used by `run` during
  /// subsequent processing.
  movie
  /// When constructing this record, `play` supplies `video.create()` for this member. Used by
  /// `resetClip` and `run` during subsequent processing.
  decoder
  /// When constructing this record, `play` supplies `0` for this member. Used by `resetClip` and `run`
  /// during subsequent processing.
  chunkIndex
  /// When constructing this record, `play` supplies `FMV_PLAY` for this member. Used by `resetClip` and
  /// `finishClip` during subsequent processing.
  status
  /// When constructing this record, `play` supplies `now` for this member. Used by `resetClip` and
  /// `run` during subsequent processing.
  startTime
  /// When constructing this record, `play` supplies `now` for this member. Used by `resetClip` and
  /// `run` during subsequent processing.
  lastTime
  /// When constructing this record, `play` supplies `Extents(x,y,width,height)` for this member.
  extents
  /// When constructing this record, `play` supplies `(bits&CIN_LOOP)!=0` for this member. Used by
  /// `finishClip` during subsequent processing.
  looping
  /// When constructing this record, `play` supplies `(bits&CIN_HOLD)!=0` for this member. Used by
  /// `finishClip` during subsequent processing.
  hold
  /// When constructing this record, `play` supplies `(bits&CIN_SILENT)!=0` for this member. Used by
  /// `run` during subsequent processing.
  silent
  /// True when CIN_SHADER was enabled for this clip, selecting texture playback and its
  /// intermittent-update timing.
  shader
  /// When constructing this record, `play` supplies `true` for this member.
  dirty
  /// When constructing this record, `play` supplies `lists.List.withCapacity(16)` for this member. Used
  /// by `resetClip` and `run` during subsequent processing.
  audioQueue
end struct
/// Stores cinematic runtime state, including `archive`, `handles`, `drawQueue`.
struct State
  /// When constructing this record, `create` supplies `archive` for this member. Used by `play` during
  /// subsequent processing.
  archive
  /// When constructing this record, `create` supplies `array(MAX_HANDLES,void)` for this member. Used
  /// by `validHandle` and `freeHandle` during subsequent processing.
  handles
  /// When constructing this record, `create` supplies `lists.List.withCapacity(16)` for this member.
  /// Used by `draw` and `takeDraws` during subsequent processing.
  drawQueue
end struct

/// Creates the cinematic runtime error `7692` with diagnostic text `"cinematic runtime: "+message`.
/// @param message Argument 2 of `error`; passed as `"cinematic runtime: "+message`.
function fail(message) return error(7692,"cinematic runtime: "+message) end function
/// Calls `mq3.client.cinematic_runtime.State`, `std.ds.list.List.withCapacity` from cinematic runtime `create`. The final path returns `State(archive,array(MAX_HANDLES,void),lists.List.withCapacity(16))`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
function create(archive) if archive==void then return fail("archive is required") end if;return State(archive,array(MAX_HANDLES,void),lists.List.withCapacity(16)) end function
/// Calls `std.string.replaceAll`, `std.string.indexOf` from cinematic runtime `pathFor`. The final path returns `value`.
/// @param name Name used to select or register the corresponding cinematic runtime resource.
function pathFor(name)
  if name==void or name=="" then return "" end if
  value=strings.replaceAll(name,"\\","/");if strings.indexOf(value,"/",0)<0 then value="video/"+value end if;return value
end function
/// Computes `state!=void and handle>=0 and handle<MAX_HANDLES and state.handles[handle]!=void` for cinematic runtime `validHandle`.
/// @param state Record read through `state.handles`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `validHandle`.
function validHandle(state,handle) return state!=void and handle>=0 and handle<MAX_HANDLES and state.handles[handle]!=void end function
/// Evaluates cinematic runtime `freeHandle` and returns `index`, `-1` according to its guard/selection conditions.
/// @param state Record read through `state.handles`.
function freeHandle(state) for index=0 to MAX_HANDLES-1 if state.handles[index]==void or state.handles[index].status==FMV_EOF then return index end if end for;return -1 end function

/// Updates `state.handles[handle]` during cinematic runtime `play`.
/// @param state Mutable cinematic runtime record/storage; this routine assigns `state.handles[handle]`.
/// @param name Name used to select or register the corresponding cinematic runtime resource.
/// @param x Horizontal coordinate in the coordinate space used by `play`.
/// @param y Vertical coordinate in the coordinate space used by `play`.
/// @param width Width in the coordinate space used by `play`.
/// @param height Height in the coordinate space used by `play`.
/// @param bits Value used by `if (bits&CIN_SYSTEM)==0 then for index=0 to MAX_HANDLES-1 if state.handles[index]!=void and state.handles[index].status!=FMV_EOF and stringEqu...`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function play(state,name,x,y,width,height,bits,now)
  if state==void or now<0 then return fail("state and non-negative time are required") end if
  path=pathFor(name);if path=="" then return -1 end if
  if (bits&CIN_SYSTEM)==0 then for index=0 to MAX_HANDLES-1 if state.handles[index]!=void and state.handles[index].status!=FMV_EOF and stringEqualsIgnoreCaseAscii(state.handles[index].path,path) then return index end if end for end if
  handle=freeHandle(state);if handle<0 then return fail("no free video handles") end if
  data=try(pk3.read(state.archive,path));if data is error then return -1 end if;movie=try(roq.parse(data));if movie is error then return -1 end if
  clip=Clip(handle,path,movie,video.create(),0,FMV_PLAY,now,now,Extents(x,y,width,height),(bits&CIN_LOOP)!=0,(bits&CIN_HOLD)!=0,(bits&CIN_SILENT)!=0,(bits&CIN_SHADER)!=0,true,lists.List.withCapacity(16))
  state.handles[handle]=clip;return handle
end function

/// Updates `clip.decoder`, `clip.chunkIndex`, `clip.startTime`, `clip.lastTime` and additional values during cinematic runtime `resetClip`.
/// @param clip Mutable cinematic runtime record/storage; this routine assigns `clip.decoder`, `clip.chunkIndex`, `clip.startTime`, `clip.lastTime` and additional values.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function resetClip(clip,now)
  clip.decoder=video.create();clip.chunkIndex=0;clip.startTime=now;clip.lastTime=now;clip.status=FMV_LOOPED;clip.dirty=true;clip.audioQueue=lists.List.withCapacity(16);return void
end function
/// Updates `clip.status` during cinematic runtime `finishClip`.
/// @param clip Mutable cinematic runtime record/storage; this routine assigns `clip.status`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function finishClip(clip,now)
  if clip.looping then resetClip(clip,now);return true end if
  if clip.hold then clip.status=FMV_IDLE else clip.status=FMV_EOF end if;return false
end function

/// Calls `mq3.client.cinematic_runtime.validHandle`, `mq3.client.cinematic_runtime.finishClip`, `mq3.format.roq.decodeAudio` and additional helpers from cinematic runtime `run`. The final path returns `clip.status`.
/// @param state Record read through `state.handles`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `run`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function run(state,handle,now)
  if not validHandle(state,handle) then return FMV_EOF end if;clip=state.handles[handle]
  if clip.status==FMV_EOF or clip.status==FMV_IDLE then return clip.status end if
  // Loading the clip and preparing the renderer must not consume video frames.
  if clip.chunkIndex==0 then clip.startTime=now;clip.lastTime=now end if
  if clip.shader and now-clip.lastTime>100 then clip.startTime=clip.startTime+(now-clip.lastTime) end if
  desired=numeric.quotient((now-clip.startTime)*clip.movie.fps,1000)+1;if desired<1 then desired=1 end if
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

/// Updates `state.handles[handle].status` during cinematic runtime `stop`.
/// @param state Mutable cinematic runtime record/storage; this routine assigns `state.handles[handle].status`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `stop`.
function stop(state,handle)
  if not validHandle(state,handle) then return FMV_EOF end if;state.handles[handle].status=FMV_EOF;return FMV_EOF
end function
/// Calls `mq3.client.cinematic_runtime.validHandle`, `mq3.client.cinematic_runtime.Extents` from cinematic runtime `setExtents`.
/// @param state Record read through `state.handles`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `setExtents`.
/// @param x Horizontal coordinate in the coordinate space used by `setExtents`.
/// @param y Vertical coordinate in the coordinate space used by `setExtents`.
/// @param width Width in the coordinate space used by `setExtents`.
/// @param height Height in the coordinate space used by `setExtents`.
function setExtents(state,handle,x,y,width,height)
  if not validHandle(state,handle) then return false end if;clip=state.handles[handle];if clip.status==FMV_EOF then return false end if
  clip.extents=Extents(x,y,width,height);clip.dirty=true;return true
end function
/// Calls `mq3.client.cinematic_runtime.validHandle`, `mq3.client.cinematic_runtime.Draw`, `state.drawQueue.add` from cinematic runtime `draw`. The final path returns `result`.
/// @param state Record read through `state.handles`, `state.drawQueue.add`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `draw`.
function draw(state,handle)
  if not validHandle(state,handle) then return void end if;clip=state.handles[handle];if clip.status==FMV_EOF or clip.decoder.latest==void then return void end if
  result=Draw(handle,clip.decoder.latest,clip.extents,clip.dirty,clip.shader);clip.dirty=false;state.drawQueue.add(result);return result
end function
// CIN_UploadCinematic consumes the same decoded buffer as CIN_DrawCinematic,
// but it must not enqueue a screen quad.  Shader stages call run() first and
// then consume this upload record for their stable scratch texture.
/// @param state Record read through `state.handles`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `upload`.
function upload(state,handle)
  if not validHandle(state,handle) then return void end if;clip=state.handles[handle]
  if clip.status==FMV_EOF or clip.decoder.latest==void then return void end if
  result=Upload(handle,clip.decoder.latest,clip.dirty,clip.shader);clip.dirty=false;return result
end function
/// Calls `mq3.client.cinematic_runtime.Presentation` from cinematic runtime `presentation`. The final path returns `Presentation(draw.frame.pixels,draw.frame.width,draw.frame.height,x,y,width,height,draw.dirty)`.
/// @param draw Record read through `draw.extents.x`, `draw.extents.y`, `draw.extents.width`, `draw.extents.height` and additional values.
/// @param virtualWidth Value used by `if draw==void or virtualWidth<=0 or virtualHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("invalid presentation dimensions")...`.
/// @param virtualHeight Value used by `if draw==void or virtualWidth<=0 or virtualHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("invalid presentation dimensions")...`.
/// @param targetWidth Value used by `if draw==void or virtualWidth<=0 or virtualHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("invalid presentation dimensions")...`.
/// @param targetHeight Value used by `if draw==void or virtualWidth<=0 or virtualHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("invalid presentation dimensions")...`.
function presentation(draw,virtualWidth,virtualHeight,targetWidth,targetHeight)
  if draw==void or virtualWidth<=0 or virtualHeight<=0 or targetWidth<=0 or targetHeight<=0 then return fail("invalid presentation dimensions") end if
  x=draw.extents.x;y=draw.extents.y;width=draw.extents.width;height=draw.extents.height
  if not draw.shader then x=x*targetWidth/virtualWidth;y=y*targetHeight/virtualHeight;width=width*targetWidth/virtualWidth;height=height*targetHeight/virtualHeight end if
  return Presentation(draw.frame.pixels,draw.frame.width,draw.frame.height,x,y,width,height,draw.dirty)
end function
/// Updates `state.drawQueue` during cinematic runtime `takeDraws`.
/// @param state Mutable cinematic runtime record/storage; this routine assigns `state.drawQueue`.
function takeDraws(state) if state==void then return [] end if;result=state.drawQueue.toArray();state.drawQueue=lists.List.withCapacity(16);return result end function
/// Calls `state.drawQueue.clear` from cinematic runtime `discardDraws`.
/// @param state Record read through `state.drawQueue.clear`.
function discardDraws(state) if state!=void then state.drawQueue.clear() end if;return void end function
/// Calls `mq3.client.cinematic_runtime.validHandle`, `clip.audioQueue.toArray`, `std.ds.list.List.withCapacity` from cinematic runtime `takeAudio`. The final path returns `result`.
/// @param state Record read through `state.handles`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `takeAudio`.
function takeAudio(state,handle)
  if not validHandle(state,handle) then return [] end if;clip=state.handles[handle];result=clip.audioQueue.toArray();clip.audioQueue=lists.List.withCapacity(16);return result
end function
/// Updates `state.drawQueue` during cinematic runtime `closeAll`.
/// @param state Mutable cinematic runtime record/storage; this routine assigns `state.drawQueue`.
function closeAll(state) if state!=void then for handle=0 to MAX_HANDLES-1 if state.handles[handle]!=void then stop(state,handle) end if end for;state.drawQueue=lists.List.withCapacity(16) end if;return void end function
