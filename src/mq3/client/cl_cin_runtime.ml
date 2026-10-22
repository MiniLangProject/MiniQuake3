// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/client/cl_cin.c adapter over the bounded RoQ runtime.
package mq3.client.cl_cin_runtime

import mq3.client.cinematic_runtime as cinematic
import mq3.format.roq as roq
import mq3.video.roq_video as video

struct State runtime currentHandle yuvTable rllTable screenDraws end struct
function create(runtime) return State(runtime,-1,[],RllSetupTable(),[]) end function

function CIN_HandleForVideo(state,name) if state==void then return -1 end if;for handle=0 to cinematic.MAX_HANDLES-1 if state.runtime.handles[handle]!=void and stringEqualsIgnoreCaseAscii(state.runtime.handles[handle].path,cinematic.pathFor(name)) then return handle end if end for;return -1 end function
function CIN_PlayCinematic(state,name,x,y,width,height,bits,now) handle=cinematic.play(state.runtime,name,x,y,width,height,bits,now);if handle>=0 then state.currentHandle=handle end if;return handle end function
function CIN_StopCinematic(state,handle) result=cinematic.stop(state.runtime,handle);if state.currentHandle==handle then state.currentHandle=-1 end if;return result end function
function CIN_RunCinematic(state,handle,now) return cinematic.run(state.runtime,handle,now) end function
function CIN_DrawCinematic(state,handle) return cinematic.draw(state.runtime,handle) end function
function CIN_UploadCinematic(state,handle) return cinematic.upload(state.runtime,handle) end function
function CIN_SetExtents(state,handle,x,y,width,height) return cinematic.setExtents(state.runtime,handle,x,y,width,height) end function
function CIN_SetLooping(state,handle,looping) if not cinematic.validHandle(state.runtime,handle) then return false end if;state.runtime.handles[handle].looping=looping;return true end function
function CIN_CloseAllVideos(state) cinematic.closeAll(state.runtime);state.currentHandle=-1;return true end function
function CL_PlayCinematic_f(state,args,now) if args==void or len(args)<2 then return -1 end if;return CIN_PlayCinematic(state,args[1],0,0,640,480,cinematic.CIN_SYSTEM,now) end function
function SCR_RunCinematic(state,now) if state.currentHandle<0 then return cinematic.FMV_EOF end if;return CIN_RunCinematic(state,state.currentHandle,now) end function
function SCR_DrawCinematic(state) if state.currentHandle<0 then return void end if;draw=CIN_DrawCinematic(state,state.currentHandle);if draw!=void then state.screenDraws=state.screenDraws+[draw] end if;return draw end function
function SCR_StopCinematic(state) if state.currentHandle<0 then return cinematic.FMV_EOF end if;return CIN_StopCinematic(state,state.currentHandle) end function

function ROQ_GenYUVTables(state) table=[];for y=0 to 255 row=[];for u=0 to 255 row=row+[video.yuv(y,u,128)] end for;table=table+[row] end for;state.yuvTable=table;return table end function
function yuv_to_rgb(y,u,v) return video.yuv(y,u,v) end function
function yuv_to_rgb24(y,u,v) rgb=video.yuv(y,u,v);return [rgb[0],rgb[1],rgb[2]] end function
function RllSetupTable() table=[];for i=0 to 255 table=table+[roq.squareDelta(i)] end for;return table end function
function monoSamples(data,previous)
 output=[];for i=0 to len(data)-1 previous=roq.signed16(previous+roq.squareDelta(data[i]));output=output+[previous] end for;return output
end function
function stereoSamples(data,left,right)
 output=[];i=0;while i<len(data) left=roq.signed16(left+roq.squareDelta(data[i]));right=roq.signed16(right+roq.squareDelta(data[i+1]));output=output+[[left,right]];i=i+2 end while;return output
end function
function RllDecodeMonoToMono(data,previous) return monoSamples(data,previous) end function
function RllDecodeMonoToStereo(data,previous) output=[];for each sample in monoSamples(data,previous) output=output+[[sample,sample]] end for;return output end function
function RllDecodeStereoToStereo(data,left,right) return stereoSamples(data,left,right) end function
function RllDecodeStereoToMono(data,left,right) output=[];for each pair in stereoSamples(data,left,right) output=output+[((pair[0]+pair[1])>>1)] end for;return output end function

function initRoQ(data) return roq.parse(data) end function
function RoQ_init(movie) return [movie,video.create(),0] end function
function RoQReset(decoder) decoder.width=0;decoder.height=0;decoder.q2=array(256,void);decoder.q4=array(256,void);decoder.q8=array(256,void);decoder.buffers=[void,void];decoder.frameCount=0;decoder.latest=void;return true end function
function RoQShutdown(state) if state==void then return false end if;state.currentHandle=-1;return true end function
function readQuadInfo(decoder,movie,chunk) return video.setInfo(decoder,movie,chunk) end function
function decodeCodeBook(decoder,movie,chunk) return video.decodeCodebook(decoder,movie,chunk) end function
function RoQInterrupt(decoder,movie,chunk) return video.process(decoder,movie,chunk) end function
function RoQFetchInterlaced(decoder,movie,chunk) return video.process(decoder,movie,chunk) end function
function RoQPrepMcomp(flags) xoff=flags>>8;if xoff>=128 then xoff=xoff-256 end if;yoff=flags&255;if yoff>=128 then yoff=yoff-256 end if;return [xoff,yoff] end function
function setupQuad(width,height) quads=[];y=0;while y<height x=0;while x<width quads=quads+[[x,y,16]];x=x+16 end while;y=y+16 end while;return quads end function
function recurseQuad(quads,x,y,size,minSize) if size<=minSize then return quads+[[x,y,size]] end if;half=size>>1;quads=recurseQuad(quads,x,y,half,minSize);quads=recurseQuad(quads,x+half,y,half,minSize);quads=recurseQuad(quads,x,y+half,half,minSize);return recurseQuad(quads,x+half,y+half,half,minSize) end function
function blit2_32(buffer,width,height,x,y,pixels) return video.writeBlock(buffer,width,height,x,y,2,pixels) end function
function blit4_32(buffer,width,height,x,y,pixels) return video.writeBlock(buffer,width,height,x,y,4,pixels) end function
function blit8_32(buffer,width,height,x,y,pixels) return video.writeBlock(buffer,width,height,x,y,8,pixels) end function
function move4_32(destination,previous,width,height,x,y,vector,xoff,yoff) return video.copyMotion(destination,previous,width,height,x,y,4,vector,xoff,yoff) end function
function move8_32(destination,previous,width,height,x,y,vector,xoff,yoff) return video.copyMotion(destination,previous,width,height,x,y,8,vector,xoff,yoff) end function
function blitVQQuad32fs(decoder,input,destination,previous,x,y,xoff,yoff) return video.decodeSmall(decoder,input,destination,previous,x,y,xoff,yoff) end function
