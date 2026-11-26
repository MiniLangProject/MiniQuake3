// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.client.desktop_video

import mq3.platform.playable_window as window
import mq3.qcommon.cvar as cvar
import mq3.renderer.tr_init as renderer

/// Stores desktop video active mode record, including `width`, `height`, `fullscreen`, `picmip`.
struct ActiveMode
  /// Horizontal pixel resolution of the active desktop video mode.
  width
  /// Vertical pixel resolution of the active desktop video mode.
  height
  /// Whether the active native display mode uses a fullscreen window.
  fullscreen
  /// Texture mip-level reduction setting; larger values select lower-resolution texture data.
  picmip
end struct

/// Calls `mq3.qcommon.cvar.get`, `mq3.qcommon.cvar.set2`, `mq3.renderer.tr_init.getModeInfo` and additional helpers from desktop video `requestedMode`. The final path returns `window.DisplayMode(dimensions[0],dimensions[1],fullscreen)`.
/// @param registry Value used by `mode=cvar.get(registry,"r_mode","-1",cvar.ARCHIVE).integer`.
/// @param toggleFullscreen Value used by `if toggleFullscreen then`.
function requestedMode(registry,toggleFullscreen)
  mode=cvar.get(registry,"r_mode","-1",cvar.ARCHIVE).integer
  width=cvar.get(registry,"r_customwidth","1280",cvar.ARCHIVE).integer
  height=cvar.get(registry,"r_customheight","720",cvar.ARCHIVE).integer
  fullscreen=cvar.get(registry,"r_fullscreen","0",cvar.ARCHIVE).integer!=0
  if toggleFullscreen then
    fullscreen=not fullscreen
    value="0";if fullscreen then value="1" end if
    cvar.set2(registry,"r_fullscreen",value,true)
  end if
  dimensions=renderer.getModeInfo(mode,width,height,1.0)
  if dimensions==void or dimensions[0]<160 or dimensions[0]>4096 or dimensions[1]<120 or dimensions[1]>4096 then dimensions=[1280,720,1.0] end if
  return window.DisplayMode(dimensions[0],dimensions[1],fullscreen)
end function

/// Calls `mq3.client.desktop_video.requestedMode`, `mq3.qcommon.cvar.get`, `mq3.platform.playable_window.setMode` and additional helpers from desktop video `apply`. The final path returns `ActiveMode(active.width,active.height,active.fullscreen,picmip)`.
/// @param registry Value used by `mode=requestedMode(registry,toggleFullscreen)`.
/// @param toggleFullscreen Value used by `mode=requestedMode(registry,toggleFullscreen)`.
function apply(registry,toggleFullscreen)
  mode=requestedMode(registry,toggleFullscreen)
  frequency=cvar.get(registry,"r_displayRefresh","0",cvar.ARCHIVE).integer
  if frequency<0 then frequency=0 end if
  active=window.setMode(mode.width,mode.height,mode.fullscreen,frequency)
  if active is error then return active end if
  interval=cvar.get(registry,"r_swapInterval","0",cvar.ARCHIVE).integer
  window.glSetSwapInterval(interval)
  picmip=cvar.get(registry,"r_picmip","1",cvar.ARCHIVE).integer
  if picmip<0 then picmip=0 end if;if picmip>16 then picmip=16 end if
  textureMode=cvar.get(registry,"r_textureMode","GL_LINEAR_MIPMAP_NEAREST",cvar.ARCHIVE).string
  window.setTextureSettings(picmip,textureMode)
  return ActiveMode(active.width,active.height,active.fullscreen,picmip)
end function

/// Calls `mq3.client.desktop_video.requestedMode`, `mq3.platform.playable_window.open`, `mq3.client.desktop_video.apply` from desktop video `open`. The final path returns `apply(registry,false)`.
/// @param registry Value used by `mode=requestedMode(registry,false)`.
function open(registry)
  mode=requestedMode(registry,false)
  opened=window.open(mode.width,mode.height);if opened is error then return opened end if
  return apply(registry,false)
end function
