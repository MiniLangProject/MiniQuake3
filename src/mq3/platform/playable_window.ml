// SPDX-License-Identifier: GPL-2.0-or-later
// Thin MiniLang boundary for the dependency-free Win32 preview window.
package mq3.platform.playable_window
import mq3.compat.numeric as numeric
import std.ds.list as lists

extern function create(width as i32,height as i32) from "playable_window.dll" symbol "playable_window_create" returns i32
extern function glConfigureNative(driver as ptr,driverLength as i32,colorBits as i32,depthBits as i32,stencilBits as i32,stereo as i32,fullscreen as i32,frequency as i32,swapInterval as i32) from "playable_window.dll" symbol "playable_window_gl_configure" returns i32
extern function glConfigureDriverNative(driver as ptr,driverLength as i32) from "playable_window.dll" symbol "playable_window_gl_configure_driver" returns i32
extern function glConfigurePixelFormatNative(colorBits as i32,depthBits as i32,stencilBits as i32,stereo as i32) from "playable_window.dll" symbol "playable_window_gl_configure_pixel_format" returns i32
extern function glConfigureDisplayNative(fullscreen as i32,frequency as i32,swapInterval as i32) from "playable_window.dll" symbol "playable_window_gl_configure_display" returns i32
extern function glAvailableNative() from "playable_window.dll" symbol "playable_window_gl_available" returns i32
extern function glPixelFormatNative() from "playable_window.dll" symbol "playable_window_gl_pixel_format" returns i32
extern function glColorBitsNative() from "playable_window.dll" symbol "playable_window_gl_color_bits" returns i32
extern function glDepthBitsNative() from "playable_window.dll" symbol "playable_window_gl_depth_bits" returns i32
extern function glStencilBitsNative() from "playable_window.dll" symbol "playable_window_gl_stencil_bits" returns i32
extern function glStereoNative() from "playable_window.dll" symbol "playable_window_gl_stereo" returns i32
extern function glFullscreenNative() from "playable_window.dll" symbol "playable_window_gl_fullscreen" returns i32
extern function glInfoNative(which as i32,output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_window_gl_info" returns i32
extern function glHasExtensionNative(name as ptr,length as i32) from "playable_window.dll" symbol "playable_window_gl_has_extension" returns i32
extern function glSwapIntervalNative(interval as i32) from "playable_window.dll" symbol "playable_window_gl_set_swap_interval" returns i32
extern function glSetGammaNative(red as ptr,green as ptr,blue as ptr,count as i32) from "playable_window.dll" symbol "playable_window_gl_set_gamma" returns i32
extern function glRestoreGammaNative() from "playable_window.dll" symbol "playable_window_gl_restore_gamma" returns void
extern function glActivateNative(active as i32) from "playable_window.dll" symbol "playable_window_gl_activate" returns void
extern function glEndFrameNative() from "playable_window.dll" symbol "playable_window_gl_end_frame" returns void
extern function glLogCommentNative(comment as ptr,length as i32) from "playable_window.dll" symbol "playable_window_gl_log_comment" returns void
extern function pollNative() from "playable_window.dll" symbol "playable_window_poll" returns void
extern function shouldCloseNative() from "playable_window.dll" symbol "playable_window_should_close" returns i32
extern function setTitleNative(title as ptr,length as i32) from "playable_window.dll" symbol "playable_window_set_title_utf8" returns i32
extern function keyDownNative(key as i32) from "playable_window.dll" symbol "playable_window_key_down" returns i32
extern function inputKeyDownNative(key as i32) from "playable_window.dll" symbol "playable_window_input_key_down" returns i32
extern function nextInputEventNative(output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_window_next_input_event" returns i32
extern function mouseXNative() from "playable_window.dll" symbol "playable_window_consume_mouse_dx" returns i32
extern function mouseYNative() from "playable_window.dll" symbol "playable_window_consume_mouse_dy" returns i32
extern function millisecondsNative() from "playable_window.dll" symbol "playable_window_milliseconds" returns i32
extern function hardwareRendererNative() from "playable_window.dll" symbol "playable_window_hardware_renderer" returns i32
extern function hardwareTrianglesNative() from "playable_window.dll" symbol "playable_window_hardware_triangles" returns u32
extern function hardwareDrawCallsNative() from "playable_window.dll" symbol "playable_window_hardware_draw_calls" returns u32
extern function writeBatchVertexNative(data as ptr,count as i32,offset as i32,x as double,y as double,z as double,u as double,v as double,lu as double,lv as double,light as double) from "playable_window.dll" symbol "playable_window_write_batch_vertex" returns i32
extern function updateStageVertexNative(data as ptr,count as i32,triangle as i32,vertex as i32,x as double,y as double,z as double,u as double,v as double,red as i32,green as i32,blue as i32,alpha as i32) from "playable_window.dll" symbol "playable_window_update_stage_vertex" returns i32
extern function takeVideoRestartNative() from "playable_window.dll" symbol "playable_window_take_video_restart" returns i32
extern function windowStateNative(output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_window_window_state" returns i32
extern function currentUserNative(output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_system_current_user" returns i32
extern function currentDirectoryNative(output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_system_current_directory" returns i32
extern function executableDirectoryNative(output as bytes,capacity as i32) from "playable_window.dll" symbol "playable_system_executable_directory" returns i32
extern function processorIdNative() from "playable_window.dll" symbol "playable_system_processor_id" returns i32
extern function inputInitNative() from "playable_window.dll" symbol "playable_window_input_init" returns i32
extern function inputActivateNative(active as i32) from "playable_window.dll" symbol "playable_window_input_activate" returns void
extern function inputFrameNative() from "playable_window.dll" symbol "playable_window_input_frame" returns void
extern function inputClearNative() from "playable_window.dll" symbol "playable_window_input_clear_states" returns void
extern function joystickConfigureNative(enabled as i32,threshold as double,ballScale as double) from "playable_window.dll" symbol "playable_window_input_configure_joystick" returns i32
extern function midiConfigureNative(enabled as i32,device as i32,channel as i32) from "playable_window.dll" symbol "playable_window_input_configure_midi" returns i32
extern function joystickAvailableNative() from "playable_window.dll" symbol "playable_window_input_joystick_available" returns i32
extern function midiDeviceCountNative() from "playable_window.dll" symbol "playable_window_input_midi_device_count" returns i32
extern function beginNative(red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_begin_frame" returns void
extern function lineNative(x0 as i32,y0 as i32,x1 as i32,y1 as i32,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_line" returns void
extern function presentNative() from "playable_window.dll" symbol "playable_window_present" returns void
extern function presentedNonBlackNative() from "playable_window.dll" symbol "playable_window_presented_non_black" returns i32
extern function shutdownNative() from "playable_window.dll" symbol "playable_window_shutdown" returns void
extern function clearDepthNative(depth as double) from "playable_window.dll" symbol "playable_window_clear_depth" returns void
extern function sampleDepthNative(x as i32,y as i32) from "playable_window.dll" symbol "playable_window_sample_depth" returns double
extern function setDepthRangeNative(scale as double,nearDistance as double) from "playable_window.dll" symbol "playable_window_set_depth_range" returns i32
extern function clearStencilNative(x as i32,y as i32,width as i32,height as i32) from "playable_window.dll" symbol "playable_window_clear_stencil" returns i32
extern function setStencilPassNative(pass as i32) from "playable_window.dll" symbol "playable_window_set_stencil_pass" returns i32
extern function finishStencilShadowNative(x as i32,y as i32,width as i32,height as i32) from "playable_window.dll" symbol "playable_window_finish_stencil_shadow" returns i32
extern function uploadTextureNative(slot as i32,rgba as ptr,width as i32,height as i32) from "playable_window.dll" symbol "playable_window_upload_texture" returns i32
extern function uploadTextureMipmappedNative(slot as i32,rgba as ptr,width as i32,height as i32,mipmapped as i32) from "playable_window.dll" symbol "playable_window_upload_texture_mipmapped" returns i32
extern function releaseTextureNative(slot as i32) from "playable_window.dll" symbol "playable_window_release_texture" returns void
extern function triangleNative(textureSlot as i32,x0 as double,y0 as double,depth0 as double,u0 as double,v0 as double,light0 as double,x1 as double,y1 as double,depth1 as double,u1 as double,v1 as double,light1 as double,x2 as double,y2 as double,depth2 as double,u2 as double,v2 as double,light2 as double,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle" returns void
extern function triangleColoredNative(textureSlot as i32,x0 as double,y0 as double,depth0 as double,u0 as double,v0 as double,x1 as double,y1 as double,depth1 as double,u1 as double,v1 as double,x2 as double,y2 as double,depth2 as double,u2 as double,v2 as double,red0 as i32,green0 as i32,blue0 as i32,alpha0 as i32,red1 as i32,green1 as i32,blue1 as i32,alpha1 as i32,red2 as i32,green2 as i32,blue2 as i32,alpha2 as i32,red as i32,green as i32,blue as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_colored" returns void
extern function triangleBatchNative(records as ptr,byteCount as i32,triangleCount as i32) from "playable_window.dll" symbol "playable_window_draw_triangle_batch" returns i32
extern function writeScreenQuadNative(records as ptr,byteCount as i32,triangleIndex as i32,textureSlot as i32,x0 as double,y0 as double,d0 as double,u0 as double,v0 as double,x1 as double,y1 as double,d1 as double,u1 as double,v1 as double,x2 as double,y2 as double,d2 as double,u2 as double,v2 as double,x3 as double,y3 as double,d3 as double,u3 as double,v3 as double,red as i32,green as i32,blue as i32,alpha as i32) from "playable_window.dll" symbol "playable_window_write_screen_quad" returns i32
extern function worldTriangleBatchNative(records as ptr,byteCount as i32,triangleCount as i32,positionX as double,positionY as double,positionZ as double,rightX as double,rightY as double,rightZ as double,upX as double,upY as double,upZ as double,forwardX as double,forwardY as double,forwardZ as double,halfWidth as double,halfHeight as double,focal as double,nearDistance as double) from "playable_window.dll" symbol "playable_window_draw_world_triangle_batch" returns i32
extern function worldTriangleBatchViewportNative(records as ptr,byteCount as i32,triangleCount as i32,viewportX as i32,viewportY as i32,viewportWidth as i32,viewportHeight as i32,positionX as double,positionY as double,positionZ as double,rightX as double,rightY as double,rightZ as double,upX as double,upY as double,upZ as double,forwardX as double,forwardY as double,forwardZ as double,focal as double,nearDistance as double) from "playable_window.dll" symbol "playable_window_draw_world_triangle_batch_viewport" returns i32

const VK_ESCAPE=27
const VK_LBUTTON=1
const VK_RBUTTON=2
const VK_MBUTTON=4
const VK_XBUTTON1=5
const VK_XBUTTON2=6
const K_MOUSE1=178
const K_MOUSE2=179
const K_MOUSE3=180
const K_MOUSE4=181
const K_MOUSE5=182
const K_MWHEELDOWN=183
const K_MWHEELUP=184
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
const INPUT_KEY=1
const INPUT_CHAR=2
const INPUT_MOUSE=3
const TRIANGLE_BATCH_RECORD_BYTES=128
const TRIANGLE_BATCH_MAX_COUNT=65536

struct TriangleBatch data capacity count end struct
struct Viewport x y width height end struct
struct LoadingPoint x y end struct
struct InputEvent time type value value2 end struct
struct WindowState active minimized x y fullscreen altTabDisabled soundActivationSerial end struct

function open(width,height)
  if width<160 or height<120 then return error(7480,"preview window is too small") end if
  if create(width,height)==0 then return error(7481,"could not create preview window") end if
  if glAvailableNative()==0 then shutdownNative();return error(7481,"could not initialize Win32 OpenGL") end if
  if inputInitNative()==0 then shutdownNative();return error(7481,"could not initialize native input") end if
  inputActivateNative(1)
  return true
end function
function openConfigured(width,height,driverName,colorBits,depthBits,stencilBits,stereo,fullscreen,frequency,swapInterval)
  if width<160 or height<120 or typeof(driverName)!="string" then return error(7480,"invalid configured preview mode") end if
  driver=bytes(driverName);if len(driver)<1 or len(driver)>=260 then return error(7480,"invalid OpenGL driver name") end if
  stereoValue=0;if stereo then stereoValue=1 end if;fullscreenValue=0;if fullscreen then fullscreenValue=1 end if
  configured=glConfigureDriverNative(nativeBytesPtr(driver),len(driver))
  if configured!=0 then configured=glConfigurePixelFormatNative(colorBits,depthBits,stencilBits,stereoValue) end if
  if configured!=0 then configured=glConfigureDisplayNative(fullscreenValue,frequency,swapInterval) end if
  if configured==0 or create(width,height)==0 then return error(7481,"could not create configured Win32 OpenGL window") end if
  if glAvailableNative()==0 then shutdownNative();return error(7481,"could not initialize configured Win32 OpenGL") end if
  if inputInitNative()==0 then shutdownNative();return error(7481,"could not initialize native input") end if
  inputActivateNative(1);return true
end function
function glAvailable() return glAvailableNative()!=0 end function
function glConfiguration() return [glPixelFormatNative(),glColorBitsNative(),glDepthBitsNative(),glStencilBitsNative(),glStereoNative()!=0,glFullscreenNative()!=0] end function
function glInfo(which)
  data=bytes(4096,0);length=glInfoNative(which,data,len(data));if length<0 then return error(7493,"invalid OpenGL information selector") end if
  return decode(slice(data,0,length))
end function
function glHasExtension(name) data=bytes(name);if len(data)<1 then return false end if;return glHasExtensionNative(nativeBytesPtr(data),len(data))!=0 end function
function glSetSwapInterval(interval) return glSwapIntervalNative(interval)!=0 end function
function glSetGamma(red,green,blue)
  if typeof(red)!="bytes" or typeof(green)!="bytes" or typeof(blue)!="bytes" or len(red)<256 or len(green)<256 or len(blue)<256 then return error(7494,"gamma ramps must contain 256 bytes per channel") end if
  return glSetGammaNative(nativeBytesPtr(red),nativeBytesPtr(green),nativeBytesPtr(blue),256)!=0
end function
function glRestoreGamma() glRestoreGammaNative();return void end function
function glActivate(active) value=0;if active then value=1 end if;glActivateNative(value);return void end function
function glLogComment(comment) data=bytes(comment);if len(data)>0 then glLogCommentNative(nativeBytesPtr(data),len(data)) end if;return void end function
function poll() pollNative();inputFrameNative();return void end function
function shouldClose() return shouldCloseNative()!=0 end function
function setTitle(title)
  if typeof(title)!="string" then return error(7489,"preview window title must be a string") end if
  data=bytes(title)
  if len(data)<1 or len(data)>255 then return error(7489,"preview window title must contain 1 to 255 UTF-8 bytes") end if
  return setTitleNative(nativeBytesPtr(data),len(data))!=0
end function
function loadingTitle(progress,status)
  if progress<0 or progress>100 then return error(7490,"loading progress must be between 0 and 100") end if
  if typeof(status)!="string" or len(bytes(status))<1 then return error(7490,"loading status must be a non-empty string") end if
  title="MiniQuake3 | Loading "+str(progress)+"% | "+status
  if len(bytes(title))>255 then return error(7490,"loading title exceeds the Win32 UTF-8 limit") end if
  return title
end function
function showLoading(progress,status)
  title=loadingTitle(progress,status);if title is error then return title end if
  if shouldClose() then return false end if
  poll()
  if not setTitle(title) then return error(7491,"could not update loading window title") end if
  beginFrame(7,10,18)
  // Keep the startup surface deliberately dependency-free: this is visible
  // while retail textures and fonts are still being decoded.
  left=80;right=560;top=334;bottom=354;filled=left+(right-left)*progress/100
  for y=top to bottom
    drawLine(LoadingPoint(left,y),LoadingPoint(right,y),20,28,44)
    if filled>left then drawLine(LoadingPoint(left,y),LoadingPoint(filled,y),214,142,35) end if
  end for
  drawLine(LoadingPoint(left-1,top-1),LoadingPoint(right+1,top-1),112,124,150)
  drawLine(LoadingPoint(left-1,bottom+1),LoadingPoint(right+1,bottom+1),112,124,150)
  drawLine(LoadingPoint(left-1,top-1),LoadingPoint(left-1,bottom+1),112,124,150)
  drawLine(LoadingPoint(right+1,top-1),LoadingPoint(right+1,bottom+1),112,124,150)
  present();poll();return true
end function
function keyDown(key) return keyDownNative(key)!=0 end function
// The native Sys_QueEvent key-state table uses Quake keynums, including mouse
// and keypad keys. Keep legacy keyDown's Win32 virtual-key API separate.
function inputKeyDown(key) return inputKeyDownNative(key)!=0 end function
function decodeInputEvent(data)
  if typeof(data)!="bytes" or len(data)<16 then return error(7492,"native input event is truncated") end if
  return InputEvent(numeric.readI32(data,0),numeric.readI32(data,4),numeric.readI32(data,8),numeric.readI32(data,12))
end function
function nextInputEvent()
  data=bytes(16,0);if nextInputEventNative(data,16)==0 then return void end if;return decodeInputEvent(data)
end function
function inputEvents(maxEvents)
  if typeof(maxEvents)!="int" or maxEvents<0 or maxEvents>256 then return error(7492,"invalid native input event budget") end if
  result=lists.List.withCapacity(maxEvents);while result.len()<maxEvents event=nextInputEvent();if event==void then break end if;result.add(event) end while;return result.toArray()
end function
function mouseDelta() return [mouseXNative(),mouseYNative()] end function
function inputActivate(active) value=0;if active then value=1 end if;inputActivateNative(value);return void end function
function inputClear() inputClearNative();return void end function
function configureJoystick(enabled,threshold,ballScale)
  if typeof(threshold)!="double" and typeof(threshold)!="int" then return error(7491,"joystick threshold must be numeric") end if
  if threshold<0 or threshold>1 then return error(7491,"joystick threshold must be between zero and one") end if
  value=0;if enabled then value=1 end if
  return joystickConfigureNative(value,threshold,ballScale)!=0
end function
function joystickAvailable() return joystickAvailableNative()!=0 end function
function configureMidi(enabled,device,channel)
  if device<0 or channel<1 or channel>16 then return error(7492,"MIDI device or channel is invalid") end if
  value=0;if enabled then value=1 end if
  return midiConfigureNative(value,device,channel)!=0
end function
function midiDeviceCount() return midiDeviceCountNative() end function
function milliseconds() return millisecondsNative() end function
function hardwareRenderer() return hardwareRendererNative()!=0 end function
function hardwareTriangles() return hardwareTrianglesNative() end function
function hardwareDrawCalls() return hardwareDrawCallsNative() end function
function takeVideoRestart() return takeVideoRestartNative()!=0 end function
function windowState()
  data=bytes(28,0);if windowStateNative(data,7)==0 then return error(7495,"could not read native window state") end if
  return WindowState(numeric.readI32(data,0)!=0,numeric.readI32(data,4)!=0,numeric.readI32(data,8),numeric.readI32(data,12),numeric.readI32(data,16)!=0,numeric.readI32(data,20)!=0,numeric.readI32(data,24))
end function
function currentUser() data=bytes(4096,0);count=currentUserNative(data,len(data));if count<1 then return "player" end if;return decode(slice(data,0,count)) end function
function currentDirectory() data=bytes(4096,0);count=currentDirectoryNative(data,len(data));if count<1 then return "" end if;return decode(slice(data,0,count)) end function
function executableDirectory() data=bytes(32768,0);count=executableDirectoryNative(data,len(data));if count<1 then return "" end if;return decode(slice(data,0,count)) end function
function processorId() return processorIdNative() end function
function beginFrame(red,green,blue) beginNative(red,green,blue);return void end function
function drawLine(a,b,red,green,blue)
  lineNative(numeric.trunc32(a.x),numeric.trunc32(a.y),numeric.trunc32(b.x),numeric.trunc32(b.y),red,green,blue);return void
end function
function present() presentNative();return void end function
function presentedNonBlack() return presentedNonBlackNative() end function
function endFrame() glEndFrameNative();return void end function
function shutdown() shutdownNative();return void end function
function clearDepth(depth) clearDepthNative(depth);return void end function
function sampleDepth(x,y) return sampleDepthNative(numeric.trunc32(x),numeric.trunc32(y)) end function
function setDepthRange(scale,nearDistance) return setDepthRangeNative(scale,nearDistance)!=0 end function
function clearStencil(area) return clearStencilNative(area.x,area.y,area.width,area.height)!=0 end function
function setStencilPass(pass) return setStencilPassNative(pass)!=0 end function
function finishStencilShadow(area) return finishStencilShadowNative(area.x,area.y,area.width,area.height) end function
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
function appendScreenQuad(batch,textureSlot,positions,texCoords,color)
  if batch==void or positions==void or texCoords==void or color==void or len(positions)!=4 or len(texCoords)!=4 or len(color)!=4 then return error(7487,"invalid screen quad") end if
  if batch.count+2>batch.capacity then return error(7487,"triangle batch is full") end if
  a=positions[0];b=positions[1];c=positions[2];d=positions[3];ua=texCoords[0];ub=texCoords[1];uc=texCoords[2];ud=texCoords[3]
  written=writeScreenQuadNative(nativeBytesPtr(batch.data),len(batch.data),batch.count,textureSlot,a.x,a.y,a.depth,ua[0],ua[1],b.x,b.y,b.depth,ub[0],ub[1],c.x,c.y,c.depth,uc[0],uc[1],d.x,d.y,d.depth,ud[0],ud[1],color[0],color[1],color[2],color[3])
  if written!=2 then return error(7487,"native screen quad write failed") end if;batch.count=batch.count+2;return batch
end function
function writeScreenRect(batch,triangleIndex,textureSlot,x,y,width,height,s1,t1,s2,t2,scaleX,scaleY,color)
  if batch==void or color==void or len(color)!=4 or triangleIndex<0 or triangleIndex+2>batch.count then return error(7487,"invalid cached screen rectangle") end if
  left=x*scaleX;top=y*scaleY;right=(x+width)*scaleX;bottom=(y+height)*scaleY;depth=0.001
  written=writeScreenQuadNative(nativeBytesPtr(batch.data),len(batch.data),triangleIndex,textureSlot,left,top,depth,s1,t1,right,top,depth,s2,t1,right,bottom,depth,s2,t2,left,bottom,depth,s1,t2,color[0],color[1],color[2],color[3])
  if written!=2 then return error(7487,"native cached screen rectangle write failed") end if;return batch
end function
function writeBatchI32(data,offset,value) numeric.writeU32(data,offset,numeric.i32(value));return void end function
function writeBatchF32(data,offset,value) numeric.writeU32(data,offset,numeric.floatBits(value));return void end function
function writeBatchVertex(data,offset,point,baseUV,lightmapUV,light)
  if writeBatchVertexNative(nativeBytesPtr(data),len(data),offset,point.x,point.y,point.depth,baseUV[0],baseUV[1],lightmapUV[0],lightmapUV[1],light)!=1 then return error(7487,"native batch vertex rejected") end if
  return void
end function
function writeBatchPositionVertex(data,offset,position,baseUV,lightmapUV,light)
  if writeBatchVertexNative(nativeBytesPtr(data),len(data),offset,position[0],position[1],position[2],baseUV[0],baseUV[1],lightmapUV[0],lightmapUV[1],light)!=1 then return error(7487,"native batch position vertex rejected") end if
  return void
end function
function updateStageVertex(batch,triangle,vertex,position,uv,color)
  if updateStageVertexNative(nativeBytesPtr(batch.data),len(batch.data),triangle,vertex,position[0],position[1],position[2],uv[0],uv[1],color[0],color[1],color[2],color[3])!=1 then return error(7487,"native stage vertex rejected") end if
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
function validViewportRectangle(x,y,width,height)
  return x>= -2147483648 and y>= -2147483648 and x<=2147483647 and y<=2147483647 and width>=1 and height>=1 and width<=2147483647 and height<=2147483647 and x+width<=2147483647 and y+height<=2147483647
end function
function viewport(x,y,width,height)
  if not validViewportRectangle(x,y,width,height) then return error(7490,"invalid world triangle viewport") end if
  return Viewport(x,y,width,height)
end function
function submitWorldTriangleBatchViewport(batch,projection,area)
  if area==void then return error(7490,"invalid world triangle viewport") end if
  if not validViewportRectangle(area.x,area.y,area.width,area.height) then return error(7490,"invalid world triangle viewport") end if
  if projection==void or projection.position==void or projection.right==void or projection.up==void or projection.forward==void then return error(7488,"invalid world triangle projection") end if
  if batch.count==0 then return 0 end if
  rendered=worldTriangleBatchViewportNative(nativeBytesPtr(batch.data),batch.count*TRIANGLE_BATCH_RECORD_BYTES,batch.count,area.x,area.y,area.width,area.height,projection.position[0],projection.position[1],projection.position[2],projection.right[0],projection.right[1],projection.right[2],projection.up[0],projection.up[1],projection.up[2],projection.forward[0],projection.forward[1],projection.forward[2],projection.focal,projection.nearDistance)
  if rendered!=batch.count then return error(7488,"native viewport world triangle batch was rejected") end if
  return rendered
end function
