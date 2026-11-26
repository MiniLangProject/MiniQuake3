// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/client/cl_cin.c adapter over the bounded RoQ runtime.
package mq3.client.cl_cin_runtime

import mq3.client.cinematic_runtime as cinematic
import mq3.format.roq as roq
import mq3.video.roq_video as video

/// Stores engine client cin runtime state, including `runtime`, `currentHandle`, `yuvTable`, `rllTable`, `screenDraws`.
struct State runtime currentHandle yuvTable rllTable screenDraws end struct
/// Creates a `mq3.client.cl_cin_runtime.State` record. Assigns `runtime` from `runtime`.
/// @param runtime Value used to initialize `State.runtime`.
function create(runtime) return State(runtime,-1,[],RllSetupTable(),[]) end function

/// Calls `stringEqualsIgnoreCaseAscii`, `mq3.client.cinematic_runtime.pathFor` from engine client cin runtime `CIN_HandleForVideo`. The final path returns `handle`.
/// @param state Record read through `state.runtime.handles`.
/// @param name Name used to select or register the corresponding engine client cin runtime resource.
function CIN_HandleForVideo(state,name) if state==void then return -1 end if;for handle=0 to cinematic.MAX_HANDLES-1 if state.runtime.handles[handle]!=void and stringEqualsIgnoreCaseAscii(state.runtime.handles[handle].path,cinematic.pathFor(name)) then return handle end if end for;return -1 end function
/// Updates `state.currentHandle` during engine client cin runtime `CIN_PlayCinematic`.
/// @param state Mutable engine client cin runtime record/storage; this routine assigns `state.currentHandle`.
/// @param name Name used to select or register the corresponding engine client cin runtime resource.
/// @param x Horizontal coordinate in the coordinate space used by `CIN_PlayCinematic`.
/// @param y Vertical coordinate in the coordinate space used by `CIN_PlayCinematic`.
/// @param width Width in the coordinate space used by `CIN_PlayCinematic`.
/// @param height Height in the coordinate space used by `CIN_PlayCinematic`.
/// @param bits Value used by `handle=cinematic.play(state.runtime,name,x,y,width,height,bits,now)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function CIN_PlayCinematic(state,name,x,y,width,height,bits,now) handle=cinematic.play(state.runtime,name,x,y,width,height,bits,now);if handle>=0 then state.currentHandle=handle end if;return handle end function
/// Updates `state.currentHandle` during engine client cin runtime `CIN_StopCinematic`.
/// @param state Mutable engine client cin runtime record/storage; this routine assigns `state.currentHandle`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `CIN_StopCinematic`.
function CIN_StopCinematic(state,handle) result=cinematic.stop(state.runtime,handle);if state.currentHandle==handle then state.currentHandle=-1 end if;return result end function
/// Adapts `mq3.client.cinematic_runtime.run` to engine client cin runtime `CIN_RunCinematic`, returning its result for `state.runtime, handle, now`.
/// @param state Record read through `state.runtime`.
/// @param handle Argument 2 of `mq3.client.cinematic_runtime.run`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.cinematic_runtime.run`.
function CIN_RunCinematic(state,handle,now) return cinematic.run(state.runtime,handle,now) end function
/// Adapts `mq3.client.cinematic_runtime.draw` to engine client cin runtime `CIN_DrawCinematic`, returning its result for `state.runtime, handle`.
/// @param state Record read through `state.runtime`.
/// @param handle Argument 2 of `mq3.client.cinematic_runtime.draw`.
function CIN_DrawCinematic(state,handle) return cinematic.draw(state.runtime,handle) end function
/// Adapts `mq3.client.cinematic_runtime.upload` to engine client cin runtime `CIN_UploadCinematic`, returning its result for `state.runtime, handle`.
/// @param state Record read through `state.runtime`.
/// @param handle Argument 2 of `mq3.client.cinematic_runtime.upload`.
function CIN_UploadCinematic(state,handle) return cinematic.upload(state.runtime,handle) end function
/// Adapts `mq3.client.cinematic_runtime.setExtents` to engine client cin runtime `CIN_SetExtents`, returning its result for `state.runtime, handle, x, y, width, height`.
/// @param state Record read through `state.runtime`.
/// @param handle Argument 2 of `mq3.client.cinematic_runtime.setExtents`.
/// @param x Argument 3 of `mq3.client.cinematic_runtime.setExtents`.
/// @param y Argument 4 of `mq3.client.cinematic_runtime.setExtents`.
/// @param width Argument 5 of `mq3.client.cinematic_runtime.setExtents`.
/// @param height Argument 6 of `mq3.client.cinematic_runtime.setExtents`.
function CIN_SetExtents(state,handle,x,y,width,height) return cinematic.setExtents(state.runtime,handle,x,y,width,height) end function
/// Updates `state.runtime.handles[handle].looping` during engine client cin runtime `CIN_SetLooping`.
/// @param state Mutable engine client cin runtime record/storage; this routine assigns `state.runtime.handles[handle].looping`.
/// @param handle Handle identifying the parser, file, media or control resource consumed by `CIN_SetLooping`.
/// @param looping Value used by `state.runtime.handles[handle].looping=looping`.
function CIN_SetLooping(state,handle,looping) if not cinematic.validHandle(state.runtime,handle) then return false end if;state.runtime.handles[handle].looping=looping;return true end function
/// Updates `state.currentHandle` during engine client cin runtime `CIN_CloseAllVideos`.
/// @param state Mutable engine client cin runtime record/storage; this routine assigns `state.currentHandle`.
function CIN_CloseAllVideos(state) cinematic.closeAll(state.runtime);state.currentHandle=-1;return true end function
/// Calls `mq3.client.cl_cin_runtime.CIN_PlayCinematic` from engine client cin runtime `CL_PlayCinematic_f`. The final path returns `CIN_PlayCinematic(state,args[1],0,0,640,480,cinematic.CIN_SYSTEM,now)`.
/// @param state Shared engine client cin runtime state passed to the helper calls in `CL_PlayCinematic_f`.
/// @param args Sequence read at `args[1]`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function CL_PlayCinematic_f(state,args,now) if args==void or len(args)<2 then return -1 end if;return CIN_PlayCinematic(state,args[1],0,0,640,480,cinematic.CIN_SYSTEM,now) end function
/// Calls `mq3.client.cl_cin_runtime.CIN_RunCinematic` from engine client cin runtime `SCR_RunCinematic`. The final path returns `CIN_RunCinematic(state,state.currentHandle,now)`.
/// @param state Record read through `state.currentHandle`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function SCR_RunCinematic(state,now) if state.currentHandle<0 then return cinematic.FMV_EOF end if;return CIN_RunCinematic(state,state.currentHandle,now) end function
/// Updates `state.screenDraws` during engine client cin runtime `SCR_DrawCinematic`.
/// @param state Mutable engine client cin runtime record/storage; this routine assigns `state.screenDraws`.
function SCR_DrawCinematic(state) if state.currentHandle<0 then return void end if;draw=CIN_DrawCinematic(state,state.currentHandle);if draw!=void then state.screenDraws=state.screenDraws+[draw] end if;return draw end function
/// Calls `mq3.client.cl_cin_runtime.CIN_StopCinematic` from engine client cin runtime `SCR_StopCinematic`. The final path returns `CIN_StopCinematic(state,state.currentHandle)`.
/// @param state Record read through `state.currentHandle`.
function SCR_StopCinematic(state) if state.currentHandle<0 then return cinematic.FMV_EOF end if;return CIN_StopCinematic(state,state.currentHandle) end function

/// Updates `state.yuvTable` during engine client cin runtime `ROQ_GenYUVTables`.
/// @param state Mutable engine client cin runtime record/storage; this routine assigns `state.yuvTable`.
function ROQ_GenYUVTables(state) table=[];for y=0 to 255 row=[];for u=0 to 255 row=row+[video.yuv(y,u,128)] end for;table=table+[row] end for;state.yuvTable=table;return table end function
/// Adapts `mq3.video.roq_video.yuv` to engine client cin runtime `yuv_to_rgb`, returning its result for `y, u, v`.
/// @param y Argument 1 of `mq3.video.roq_video.yuv`.
/// @param u Argument 2 of `mq3.video.roq_video.yuv`.
/// @param v Argument 3 of `mq3.video.roq_video.yuv`.
function yuv_to_rgb(y,u,v) return video.yuv(y,u,v) end function
/// Calls `mq3.video.roq_video.yuv` from engine client cin runtime `yuv_to_rgb24`. The final path returns `[rgb[0],rgb[1],rgb[2]]`.
/// @param y Vertical coordinate in the coordinate space used by `yuv_to_rgb24`.
/// @param u Value used by `rgb=video.yuv(y,u,v)`.
/// @param v Value used by `rgb=video.yuv(y,u,v)`.
function yuv_to_rgb24(y,u,v) rgb=video.yuv(y,u,v);return [rgb[0],rgb[1],rgb[2]] end function
/// Calls `mq3.format.roq.squareDelta` from engine client cin runtime `RllSetupTable`. The final path returns `table`.
function RllSetupTable() table=[];for i=0 to 255 table=table+[roq.squareDelta(i)] end for;return table end function
/// Calls `mq3.format.roq.signed16`, `mq3.format.roq.squareDelta` from engine client cin runtime `monoSamples`. The final path returns `output`.
/// @param data Sequence read at `data[i]`.
/// @param previous Value used by `for i=0 to len(data)-1 previous=roq.signed16(previous+roq.squareDelta(data[i]))`.
function monoSamples(data,previous)
 output=[];for i=0 to len(data)-1 previous=roq.signed16(previous+roq.squareDelta(data[i]));output=output+[previous] end for;return output
end function
/// Calls `mq3.format.roq.signed16`, `mq3.format.roq.squareDelta` from engine client cin runtime `stereoSamples`. The final path returns `output`.
/// @param data Sequence read at `data[i]`, `data[i+1]`.
/// @param left Value used by `while i<len(data) left=roq.signed16(left+roq.squareDelta(data[i]))`.
/// @param right Value used by `right=roq.signed16(right+roq.squareDelta(data[i+1]))`.
function stereoSamples(data,left,right)
 output=[];i=0;while i<len(data) left=roq.signed16(left+roq.squareDelta(data[i]));right=roq.signed16(right+roq.squareDelta(data[i+1]));output=output+[[left,right]];i=i+2 end while;return output
end function
/// Adapts `mq3.client.cl_cin_runtime.monoSamples` to engine client cin runtime `RllDecodeMonoToMono`, returning its result for `data, previous`.
/// @param data Argument 1 of `mq3.client.cl_cin_runtime.monoSamples`.
/// @param previous Argument 2 of `mq3.client.cl_cin_runtime.monoSamples`.
function RllDecodeMonoToMono(data,previous) return monoSamples(data,previous) end function
/// Calls `mq3.client.cl_cin_runtime.monoSamples` from engine client cin runtime `RllDecodeMonoToStereo`. The final path returns `output`.
/// @param data Value used by `for each sample in monoSamples(data,previous) output=output+[[sample,sample]] end for`.
/// @param previous Value used by `for each sample in monoSamples(data,previous) output=output+[[sample,sample]] end for`.
function RllDecodeMonoToStereo(data,previous) output=[];for each sample in monoSamples(data,previous) output=output+[[sample,sample]] end for;return output end function
/// Adapts `mq3.client.cl_cin_runtime.stereoSamples` to engine client cin runtime `RllDecodeStereoToStereo`, returning its result for `data, left, right`.
/// @param data Argument 1 of `mq3.client.cl_cin_runtime.stereoSamples`.
/// @param left Argument 2 of `mq3.client.cl_cin_runtime.stereoSamples`.
/// @param right Argument 3 of `mq3.client.cl_cin_runtime.stereoSamples`.
function RllDecodeStereoToStereo(data,left,right) return stereoSamples(data,left,right) end function
/// Calls `mq3.client.cl_cin_runtime.stereoSamples` from engine client cin runtime `RllDecodeStereoToMono`. The final path returns `output`.
/// @param data Value used by `for each pair in stereoSamples(data,left,right) output=output+[((pair[0]+pair[1])>>1)] end for`.
/// @param left Value used by `for each pair in stereoSamples(data,left,right) output=output+[((pair[0]+pair[1])>>1)] end for`.
/// @param right Value used by `for each pair in stereoSamples(data,left,right) output=output+[((pair[0]+pair[1])>>1)] end for`.
function RllDecodeStereoToMono(data,left,right) output=[];for each pair in stereoSamples(data,left,right) output=output+[((pair[0]+pair[1])>>1)] end for;return output end function

/// Adapts `mq3.format.roq.parse` to engine client cin runtime `initRoQ`, returning its result for `data`.
/// @param data Argument 1 of `mq3.format.roq.parse`.
function initRoQ(data) return roq.parse(data) end function
/// Builds the engine client cin runtime `RoQ_init` sequence from `[movie,video.create(),0]`.
/// @param movie Value used by `return [movie,video.create(),0]`.
function RoQ_init(movie) return [movie,video.create(),0] end function
/// Updates `decoder.width`, `decoder.height`, `decoder.q2`, `decoder.q4` and additional values during engine client cin runtime `RoQReset`.
/// @param decoder Mutable engine client cin runtime record/storage; this routine assigns `decoder.width`, `decoder.height`, `decoder.q2`, `decoder.q4` and additional values.
function RoQReset(decoder) decoder.width=0;decoder.height=0;decoder.q2=array(256,void);decoder.q4=array(256,void);decoder.q8=array(256,void);decoder.buffers=[void,void];decoder.frameCount=0;decoder.latest=void;return true end function
/// Updates `state.currentHandle` during engine client cin runtime `RoQShutdown`.
/// @param state Mutable engine client cin runtime record/storage; this routine assigns `state.currentHandle`.
function RoQShutdown(state) if state==void then return false end if;state.currentHandle=-1;return true end function
/// Adapts `mq3.video.roq_video.setInfo` to engine client cin runtime `readQuadInfo`, returning its result for `decoder, movie, chunk`.
/// @param decoder Argument 1 of `mq3.video.roq_video.setInfo`.
/// @param movie Argument 2 of `mq3.video.roq_video.setInfo`.
/// @param chunk Argument 3 of `mq3.video.roq_video.setInfo`.
function readQuadInfo(decoder,movie,chunk) return video.setInfo(decoder,movie,chunk) end function
/// Adapts `mq3.video.roq_video.decodeCodebook` to engine client cin runtime `decodeCodeBook`, returning its result for `decoder, movie, chunk`.
/// @param decoder Argument 1 of `mq3.video.roq_video.decodeCodebook`.
/// @param movie Argument 2 of `mq3.video.roq_video.decodeCodebook`.
/// @param chunk Argument 3 of `mq3.video.roq_video.decodeCodebook`.
function decodeCodeBook(decoder,movie,chunk) return video.decodeCodebook(decoder,movie,chunk) end function
/// Adapts `mq3.video.roq_video.process` to engine client cin runtime `RoQInterrupt`, returning its result for `decoder, movie, chunk`.
/// @param decoder Argument 1 of `mq3.video.roq_video.process`.
/// @param movie Argument 2 of `mq3.video.roq_video.process`.
/// @param chunk Argument 3 of `mq3.video.roq_video.process`.
function RoQInterrupt(decoder,movie,chunk) return video.process(decoder,movie,chunk) end function
/// Adapts `mq3.video.roq_video.process` to engine client cin runtime `RoQFetchInterlaced`, returning its result for `decoder, movie, chunk`.
/// @param decoder Argument 1 of `mq3.video.roq_video.process`.
/// @param movie Argument 2 of `mq3.video.roq_video.process`.
/// @param chunk Argument 3 of `mq3.video.roq_video.process`.
function RoQFetchInterlaced(decoder,movie,chunk) return video.process(decoder,movie,chunk) end function
/// Evaluates engine client cin runtime `RoQPrepMcomp` and returns `[xoff,yoff]` according to its guard/selection conditions.
/// @param flags Value used by `xoff=flags>>8`.
function RoQPrepMcomp(flags) xoff=flags>>8;if xoff>=128 then xoff=xoff-256 end if;yoff=flags&255;if yoff>=128 then yoff=yoff-256 end if;return [xoff,yoff] end function
/// Evaluates engine client cin runtime `setupQuad` and returns `quads` according to its guard/selection conditions.
/// @param width Width in the coordinate space used by `setupQuad`.
/// @param height Height in the coordinate space used by `setupQuad`.
function setupQuad(width,height) quads=[];y=0;while y<height x=0;while x<width quads=quads+[[x,y,16]];x=x+16 end while;y=y+16 end while;return quads end function
/// Calls `mq3.client.cl_cin_runtime.recurseQuad` from engine client cin runtime `recurseQuad`. The final path returns `recurseQuad(quads,x+half,y+half,half,minSize)`.
/// @param quads Value used by `if size<=minSize then return quads+[[x,y,size]] end if`.
/// @param x Horizontal coordinate in the coordinate space used by `recurseQuad`.
/// @param y Vertical coordinate in the coordinate space used by `recurseQuad`.
/// @param size Value tested by `size<=minSize` before the calculation continues.
/// @param minSize Value used by `if size<=minSize then return quads+[[x,y,size]] end if`.
function recurseQuad(quads,x,y,size,minSize) if size<=minSize then return quads+[[x,y,size]] end if;half=size>>1;quads=recurseQuad(quads,x,y,half,minSize);quads=recurseQuad(quads,x+half,y,half,minSize);quads=recurseQuad(quads,x,y+half,half,minSize);return recurseQuad(quads,x+half,y+half,half,minSize) end function
/// Adapts `mq3.video.roq_video.writeBlock` to engine client cin runtime `blit2_32`, returning its result for `buffer, width, height, x, y, 2, pixels`.
/// @param buffer Argument 1 of `mq3.video.roq_video.writeBlock`.
/// @param width Argument 2 of `mq3.video.roq_video.writeBlock`.
/// @param height Argument 3 of `mq3.video.roq_video.writeBlock`.
/// @param x Argument 4 of `mq3.video.roq_video.writeBlock`.
/// @param y Argument 5 of `mq3.video.roq_video.writeBlock`.
/// @param pixels Argument 7 of `mq3.video.roq_video.writeBlock`.
function blit2_32(buffer,width,height,x,y,pixels) return video.writeBlock(buffer,width,height,x,y,2,pixels) end function
/// Adapts `mq3.video.roq_video.writeBlock` to engine client cin runtime `blit4_32`, returning its result for `buffer, width, height, x, y, 4, pixels`.
/// @param buffer Argument 1 of `mq3.video.roq_video.writeBlock`.
/// @param width Argument 2 of `mq3.video.roq_video.writeBlock`.
/// @param height Argument 3 of `mq3.video.roq_video.writeBlock`.
/// @param x Argument 4 of `mq3.video.roq_video.writeBlock`.
/// @param y Argument 5 of `mq3.video.roq_video.writeBlock`.
/// @param pixels Argument 7 of `mq3.video.roq_video.writeBlock`.
function blit4_32(buffer,width,height,x,y,pixels) return video.writeBlock(buffer,width,height,x,y,4,pixels) end function
/// Adapts `mq3.video.roq_video.writeBlock` to engine client cin runtime `blit8_32`, returning its result for `buffer, width, height, x, y, 8, pixels`.
/// @param buffer Argument 1 of `mq3.video.roq_video.writeBlock`.
/// @param width Argument 2 of `mq3.video.roq_video.writeBlock`.
/// @param height Argument 3 of `mq3.video.roq_video.writeBlock`.
/// @param x Argument 4 of `mq3.video.roq_video.writeBlock`.
/// @param y Argument 5 of `mq3.video.roq_video.writeBlock`.
/// @param pixels Argument 7 of `mq3.video.roq_video.writeBlock`.
function blit8_32(buffer,width,height,x,y,pixels) return video.writeBlock(buffer,width,height,x,y,8,pixels) end function
/// Adapts `mq3.video.roq_video.copyMotion` to engine client cin runtime `move4_32`, returning its result for `destination, previous, width, height, x, y, 4, vector, xoff, yoff`.
/// @param destination Argument 1 of `mq3.video.roq_video.copyMotion`.
/// @param previous Argument 2 of `mq3.video.roq_video.copyMotion`.
/// @param width Argument 3 of `mq3.video.roq_video.copyMotion`.
/// @param height Argument 4 of `mq3.video.roq_video.copyMotion`.
/// @param x Argument 5 of `mq3.video.roq_video.copyMotion`.
/// @param y Argument 6 of `mq3.video.roq_video.copyMotion`.
/// @param vector Argument 8 of `mq3.video.roq_video.copyMotion`.
/// @param xoff Argument 9 of `mq3.video.roq_video.copyMotion`.
/// @param yoff Argument 10 of `mq3.video.roq_video.copyMotion`.
function move4_32(destination,previous,width,height,x,y,vector,xoff,yoff) return video.copyMotion(destination,previous,width,height,x,y,4,vector,xoff,yoff) end function
/// Adapts `mq3.video.roq_video.copyMotion` to engine client cin runtime `move8_32`, returning its result for `destination, previous, width, height, x, y, 8, vector, xoff, yoff`.
/// @param destination Argument 1 of `mq3.video.roq_video.copyMotion`.
/// @param previous Argument 2 of `mq3.video.roq_video.copyMotion`.
/// @param width Argument 3 of `mq3.video.roq_video.copyMotion`.
/// @param height Argument 4 of `mq3.video.roq_video.copyMotion`.
/// @param x Argument 5 of `mq3.video.roq_video.copyMotion`.
/// @param y Argument 6 of `mq3.video.roq_video.copyMotion`.
/// @param vector Argument 8 of `mq3.video.roq_video.copyMotion`.
/// @param xoff Argument 9 of `mq3.video.roq_video.copyMotion`.
/// @param yoff Argument 10 of `mq3.video.roq_video.copyMotion`.
function move8_32(destination,previous,width,height,x,y,vector,xoff,yoff) return video.copyMotion(destination,previous,width,height,x,y,8,vector,xoff,yoff) end function
/// Adapts `mq3.video.roq_video.decodeSmall` to engine client cin runtime `blitVQQuad32fs`, returning its result for `decoder, input, destination, previous, x, y, xoff, yoff`.
/// @param decoder Argument 1 of `mq3.video.roq_video.decodeSmall`.
/// @param input Argument 2 of `mq3.video.roq_video.decodeSmall`.
/// @param destination Argument 3 of `mq3.video.roq_video.decodeSmall`.
/// @param previous Argument 4 of `mq3.video.roq_video.decodeSmall`.
/// @param x Argument 5 of `mq3.video.roq_video.decodeSmall`.
/// @param y Argument 6 of `mq3.video.roq_video.decodeSmall`.
/// @param xoff Argument 7 of `mq3.video.roq_video.decodeSmall`.
/// @param yoff Argument 8 of `mq3.video.roq_video.decodeSmall`.
function blitVQQuad32fs(decoder,input,destination,previous,x,y,xoff,yoff) return video.decodeSmall(decoder,input,destination,previous,x,y,xoff,yoff) end function
