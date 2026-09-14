// SPDX-License-Identifier: GPL-2.0-or-later
// Thin MiniLang boundary for the dependency-free Win32 preview window.
package mq3.platform.playable_window
import mq3.compat.numeric as numeric

extern function create(width as i32,height as i32) from "playable_window.dll" symbol "playable_window_create" returns i32
extern function pollNative() from "playable_window.dll" symbol "playable_window_poll" returns void
extern function shouldCloseNative() from "playable_window.dll" symbol "playable_window_should_close" returns i32
extern function setTitleNative(title as ptr,length as i32) from "playable_window.dll" symbol "playable_window_set_title_utf8" returns i32
extern function keyDownNative(key as i32) from "playable_window.dll" symbol "playable_window_key_down" returns i32
extern function mouseXNative() from "playable_window.dll" symbol "playable_window_consume_mouse_dx" returns i32
extern function mouseYNative() from "playable_window.dll" symbol "playable_window_consume_mouse_dy" returns i32
extern function millisecondsNative() from "playable_window.dll" symbol "playable_window_milliseconds" returns i32
extern function beginNative(red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_begin_frame" returns void
extern function lineNative(x0 as i32,y0 as i32,x1 as i32,y1 as i32,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_line" returns void
extern function presentNative() from "playable_window.dll" symbol "playable_window_present" returns void
extern function shutdownNative() from "playable_window.dll" symbol "playable_window_shutdown" returns void
extern function clearDepthNative(depth as double) from "playable_window.dll" symbol "playable_window_clear_depth" returns void
extern function setDepthRangeNative(scale as double,nearDistance as double) from "playable_window.dll" symbol "playable_window_set_depth_range" returns i32
extern function uploadTextureNative(slot as i32,rgba as ptr,width as i32,height as i32) from "playable_window.dll" symbol "playable_window_upload_texture" returns i32
extern function uploadTextureMipmappedNative(slot as i32,rgba as ptr,width as i32,height as i32,mipmapped as i32) from "playable_window.dll" symbol "playable_window_upload_texture_mipmapped" returns i32
extern function releaseTextureNative(slot as i32) from "playable_window.dll" symbol "playable_window_release_texture" returns void
extern function triangleNative(textureSlot as i32,x0 as double,y0 as double,depth0 as double,u0 as double,v0 as double,light0 as double,x1 as double,y1 as double,depth1 as double,u1 as double,v1 as double,light1 as double,x2 as double,y2 as double,depth2 as double,u2 as double,v2 as double,light2 as double,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle" returns void
extern function triangleColoredNative(textureSlot as i32,x0 as double,y0 as double,depth0 as double,u0 as double,v0 as double,x1 as double,y1 as double,depth1 as double,u1 as double,v1 as double,x2 as double,y2 as double,depth2 as double,u2 as double,v2 as double,red0 as i32,green0 as i32,blue0 as i32,alpha0 as i32,red1 as i32,green1 as i32,blue1 as i32,alpha1 as i32,red2 as i32,green2 as i32,blue2 as i32,alpha2 as i32,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_colored" returns void
extern function triangleBatchNative(records as ptr,byteCount as i32,triangleCount as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_batch" returns i32
extern function worldTriangleBatchNative(records as ptr,byteCount as i32,triangleCount as i32,positionX as double,positionY as double,positionZ as double,rightX as double,rightY as double,rightZ as double,upX as double,upY as double,upZ as double,forwardX as double,forwardY as double,forwardZ as double,halfWidth as double,halfHeight as double,focal as double,nearDistance as double) from "playable_window.dll" symbol "playable_window_draw_world_triangle_batch" returns i32
extern function worldTriangleBatchViewportNative(records as ptr,byteCount as i32,triangleCount as i32,viewportX as i32,viewportY as i32,viewportWidth as i32,viewportHeight as i32,positionX as double,positionY as double,positionZ as double,rightX as double,rightY as double,rightZ as double,upX as double,upY as double,upZ as double,forwardX as double,forwardY as double,forwardZ as double,focal as double,nearDistance as double) from "playable_window.dll" symbol "playable_window_draw_world_triangle_batch_viewport" returns i32

const VK_ESCAPE=27
const VK_LBUTTON=1
const VK_RETURN=13
const VK_SPACE=32
const VK_UP=38
const VK_DOWN=40
const VK_A=65
const VK_D=68
const VK_E=69
const VK_Q=81
const VK_S=83
const VK_W=87
const VK_SHIFT=16
const VK_1=49
const VK_2=50
const VK_3=51
const VK_4=52
const VK_5=53
const VK_6=54
const VK_7=55
const VK_8=56
const VK_9=57
const TRIANGLE_BATCH_RECORD_BYTES=128
const TRIANGLE_BATCH_MAX_COUNT=65536

struct TriangleBatch data capacity count end struct
struct Viewport x y width height end struct

function open(width,height)
  if width<160 or height<120 then return error(7480,"preview window is too small") end if
  if create(width,height)==0 then return error(7481,"could not create preview window") end if
  return true
end function
function poll() pollNative();return void end function
function shouldClose() return shouldCloseNative()!=0 end function
function setTitle(title)
  if typeof(title)!="string" then return error(7489,"preview window title must be a string") end if
  data=bytes(title)
  if len(data)<1 or len(data)>255 then return error(7489,"preview window title must contain 1 to 255 UTF-8 bytes") end if
  return setTitleNative(nativeBytesPtr(data),len(data))!=0
end function
function keyDown(key) return keyDownNative(key)!=0 end function
function mouseDelta() return [mouseXNative(),mouseYNative()] end function
function milliseconds() return millisecondsNative() end function
function beginFrame(red,green,blue) beginNative(red,green,blue);return void end function
function drawLine(a,b,red,green,blue)
  lineNative(numeric.trunc32(a.x),numeric.trunc32(a.y),numeric.trunc32(b.x),numeric.trunc32(b.y),red,green,blue);return void
end function
function present() presentNative();return void end function
function shutdown() shutdownNative();return void end function
function clearDepth(depth) clearDepthNative(depth);return void end function
function setDepthRange(scale,nearDistance) return setDepthRangeNative(scale,nearDistance)!=0 end function
function uploadTexture(slot,rgba,width,height)
  if typeof(rgba)!="bytes" then return error(7483,"preview texture must be RGBA bytes") end if
  return uploadTextureNative(slot,nativeBytesPtr(rgba),width,height)!=0
end function
function uploadTextureMipmapped(slot,rgba,width,height,mipmapped)
  if typeof(rgba)!="bytes" then return error(7483,"preview texture must be RGBA bytes") end if
  value=0;if mipmapped then value=1 end if
  return uploadTextureMipmappedNative(slot,nativeBytesPtr(rgba),width,height,value)!=0
end function
function uploadTextureNoMip(slot,rgba,width,height) return uploadTextureMipmapped(slot,rgba,width,height,false) end function
function releaseTexture(slot) releaseTextureNative(slot);return void end function
function drawTriangle(textureSlot,a,uvA,lightA,b,uvB,lightB,c,uvC,lightC,red,green,blue)
  triangleNative(textureSlot,a.x,a.y,a.depth,uvA[0],uvA[1],lightA,b.x,b.y,b.depth,uvB[0],uvB[1],lightB,c.x,c.y,c.depth,uvC[0],uvC[1],lightC,red,green,blue)
  return void
end function
function drawTriangleColored(textureSlot,a,uvA,colorA,b,uvB,colorB,c,uvC,colorC,red,green,blue)
  triangleColoredNative(textureSlot,a.x,a.y,a.depth,uvA[0],uvA[1],b.x,b.y,b.depth,uvB[0],uvB[1],c.x,c.y,c.depth,uvC[0],uvC[1],colorA[0],colorA[1],colorA[2],colorA[3],colorB[0],colorB[1],colorB[2],colorB[3],colorC[0],colorC[1],colorC[2],colorC[3],red,green,blue)
  return void
end function

function createTriangleBatch(capacity)
  if capacity<1 or capacity>TRIANGLE_BATCH_MAX_COUNT then return error(7486,"invalid triangle batch capacity") end if
  return TriangleBatch(bytes(capacity*TRIANGLE_BATCH_RECORD_BYTES,0),capacity,0)
end function
function resetTriangleBatch(batch) batch.count=0;return batch end function
function writeBatchI32(data,offset,value) numeric.writeU32(data,offset,numeric.i32(value));return void end function
function writeBatchF32(data,offset,value) numeric.writeU32(data,offset,numeric.floatBits(value));return void end function
function writeBatchVertex(data,offset,point,baseUV,lightmapUV,light)
  writeBatchF32(data,offset,point.x);writeBatchF32(data,offset+4,point.y);writeBatchF32(data,offset+8,point.depth)
  writeBatchF32(data,offset+12,baseUV[0]);writeBatchF32(data,offset+16,baseUV[1]);writeBatchF32(data,offset+20,lightmapUV[0]);writeBatchF32(data,offset+24,lightmapUV[1]);writeBatchF32(data,offset+28,light)
  return void
end function
function writeBatchPositionVertex(data,offset,position,baseUV,lightmapUV,light)
  writeBatchF32(data,offset,position[0]);writeBatchF32(data,offset+4,position[1]);writeBatchF32(data,offset+8,position[2])
  writeBatchF32(data,offset+12,baseUV[0]);writeBatchF32(data,offset+16,baseUV[1]);writeBatchF32(data,offset+20,lightmapUV[0]);writeBatchF32(data,offset+24,lightmapUV[1]);writeBatchF32(data,offset+28,light)
  return void
end function
function writeBatchColor(data,offset,color)
  for channel=0 to 3 value=color[channel];if value<0 then value=0 end if;if value>255 then value=255 end if;data[offset+channel]=value end for;return void
end function
function appendTriangleBatchColored(batch,baseSlot,lightmapSlot,a,baseA,lightmapA,lightA,colorA,b,baseB,lightmapB,lightB,colorB,c,baseC,lightmapC,lightC,colorC,red,green,blue)
  if batch.count>=batch.capacity then return error(7487,"triangle batch is full") end if
  offset=batch.count*TRIANGLE_BATCH_RECORD_BYTES
  writeBatchI32(batch.data,offset,baseSlot);writeBatchI32(batch.data,offset+4,lightmapSlot);writeBatchI32(batch.data,offset+8,red);writeBatchI32(batch.data,offset+12,green);writeBatchI32(batch.data,offset+16,blue)
  writeBatchVertex(batch.data,offset+20,a,baseA,lightmapA,lightA);writeBatchVertex(batch.data,offset+52,b,baseB,lightmapB,lightB);writeBatchVertex(batch.data,offset+84,c,baseC,lightmapC,lightC)
  writeBatchColor(batch.data,offset+116,colorA);writeBatchColor(batch.data,offset+120,colorB);writeBatchColor(batch.data,offset+124,colorC)
  batch.count=batch.count+1
  return batch
end function
function appendTriangleBatchPositionColored(batch,baseSlot,lightmapSlot,a,baseA,lightmapA,lightA,colorA,b,baseB,lightmapB,lightB,colorB,c,baseC,lightmapC,lightC,colorC,red,green,blue)
  if batch.count>=batch.capacity then return error(7487,"triangle batch is full") end if
  offset=batch.count*TRIANGLE_BATCH_RECORD_BYTES
  writeBatchI32(batch.data,offset,baseSlot);writeBatchI32(batch.data,offset+4,lightmapSlot);writeBatchI32(batch.data,offset+8,red);writeBatchI32(batch.data,offset+12,green);writeBatchI32(batch.data,offset+16,blue)
  writeBatchPositionVertex(batch.data,offset+20,a,baseA,lightmapA,lightA);writeBatchPositionVertex(batch.data,offset+52,b,baseB,lightmapB,lightB);writeBatchPositionVertex(batch.data,offset+84,c,baseC,lightmapC,lightC)
  writeBatchColor(batch.data,offset+116,colorA);writeBatchColor(batch.data,offset+120,colorB);writeBatchColor(batch.data,offset+124,colorC)
  batch.count=batch.count+1;return batch
end function
function appendTriangleBatch(batch,baseSlot,lightmapSlot,a,baseA,lightmapA,lightA,b,baseB,lightmapB,lightB,c,baseC,lightmapC,lightC,red,green,blue)
  white=[255,255,255,255];return appendTriangleBatchColored(batch,baseSlot,lightmapSlot,a,baseA,lightmapA,lightA,white,b,baseB,lightmapB,lightB,white,c,baseC,lightmapC,lightC,white,red,green,blue)
end function
function appendSingleTextureTriangleColored(batch,textureSlot,a,uvA,lightA,colorA,b,uvB,lightB,colorB,c,uvC,lightC,colorC,red,green,blue)
  zero=[0.0,0.0];return appendTriangleBatchColored(batch,textureSlot,-1,a,uvA,zero,lightA,colorA,b,uvB,zero,lightB,colorB,c,uvC,zero,lightC,colorC,red,green,blue)
end function
function appendSingleTextureTrianglePositionColored(batch,textureSlot,a,uvA,lightA,colorA,b,uvB,lightB,colorB,c,uvC,lightC,colorC,red,green,blue)
  zero=[0.0,0.0];return appendTriangleBatchPositionColored(batch,textureSlot,-1,a,uvA,zero,lightA,colorA,b,uvB,zero,lightB,colorB,c,uvC,zero,lightC,colorC,red,green,blue)
end function
function appendSingleTextureTrianglePosition(batch,textureSlot,a,uvA,lightA,b,uvB,lightB,c,uvC,lightC,red,green,blue)
  white=[255,255,255,255];return appendSingleTextureTrianglePositionColored(batch,textureSlot,a,uvA,lightA,white,b,uvB,lightB,white,c,uvC,lightC,white,red,green,blue)
end function
function appendSingleTextureTriangle(batch,textureSlot,a,uvA,lightA,b,uvB,lightB,c,uvC,lightC,red,green,blue)
  zero=[0.0,0.0]
  return appendTriangleBatch(batch,textureSlot,-1,a,uvA,zero,lightA,b,uvB,zero,lightB,c,uvC,zero,lightC,red,green,blue)
end function
function submitTriangleBatch(batch)
  if batch.count==0 then return 0 end if
  rendered=triangleBatchNative(nativeBytesPtr(batch.data),batch.count*TRIANGLE_BATCH_RECORD_BYTES,batch.count)
  if rendered!=batch.count then return error(7488,"native triangle batch was rejected") end if
  return rendered
end function
function submitWorldTriangleBatch(batch,projection)
  if batch.count==0 then return 0 end if
  if projection==void or projection.position==void or projection.right==void or projection.up==void or projection.forward==void then return error(7488,"invalid world triangle projection") end if
  rendered=worldTriangleBatchNative(nativeBytesPtr(batch.data),batch.count*TRIANGLE_BATCH_RECORD_BYTES,batch.count,projection.position[0],projection.position[1],projection.position[2],projection.right[0],projection.right[1],projection.right[2],projection.up[0],projection.up[1],projection.up[2],projection.forward[0],projection.forward[1],projection.forward[2],projection.halfWidth,projection.halfHeight,projection.focal,projection.nearDistance)
  if rendered!=batch.count then return error(7488,"native world triangle batch was rejected") end if
  return rendered
end function
function viewport(x,y,width,height)
  if x<0 or y<0 or width<1 or height<1 then return error(7490,"invalid world triangle viewport") end if
  return Viewport(x,y,width,height)
end function
function submitWorldTriangleBatchViewport(batch,projection,area)
  if area==void or area.x<0 or area.y<0 or area.width<1 or area.height<1 then return error(7490,"invalid world triangle viewport") end if
  if projection==void or projection.position==void or projection.right==void or projection.up==void or projection.forward==void then return error(7488,"invalid world triangle projection") end if
  if batch.count==0 then return 0 end if
  rendered=worldTriangleBatchViewportNative(nativeBytesPtr(batch.data),batch.count*TRIANGLE_BATCH_RECORD_BYTES,batch.count,area.x,area.y,area.width,area.height,projection.position[0],projection.position[1],projection.position[2],projection.right[0],projection.right[1],projection.right[2],projection.up[0],projection.up[1],projection.up[2],projection.forward[0],projection.forward[1],projection.forward[2],projection.focal,projection.nearDistance)
  if rendered!=batch.count then return error(7488,"native viewport world triangle batch was rejected") end if
  return rendered
end function
