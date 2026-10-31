// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic MiniLang model of code/win32/win_glimp.c.
package mq3.platform.win_glimp_runtime

import std.string as strings
import std.array as arrays
import mq3.renderer.qgl as qgl
import mq3.platform.win_headers as winHeaders
import mq3.platform.win_qgl_runtime as winQgl

const RSERR_OK=0
const RSERR_INVALID_FULLSCREEN=1
const RSERR_INVALID_MODE=2
const RSERR_UNKNOWN=3
const TRY_PFD_SUCCESS=0
const TRY_PFD_FAIL_SOFT=1
const TRY_PFD_FAIL_HARD=2
const PFD_DOUBLEBUFFER=1
const PFD_STEREO=2
const PFD_DRAW_TO_WINDOW=4
const PFD_SUPPORT_OPENGL=32
const PFD_GENERIC_FORMAT=64
const PFD_TYPE_RGBA=0

struct PFD flags pixelType colorBits depthBits stencilBits layerType index end struct
struct Mode width height aspect frequency fullscreen end struct
struct Extensions textureCompression textureEnvAdd multitexture compiledVertexArray maxActiveTextures swapControl end struct
struct Runtime osSupported driverLoaded windowCreated contextCreated active fullscreen displayChanged mode pfd extensions vendor renderer version extensionText swaps logs rendererThread renderCommands renderCompleted qglRegistry qglState glwState end struct

function create()
  return Runtime(true,false,false,false,false,false,false,Mode(0,0,1.0,0,false),void,Extensions(false,false,false,false,1,false),"","","","",0,[],false,[],true,qgl.createRegistry(),winQgl.create(),winHeaders.createGLWState())
end function
function GLW_CreatePFD(colorbits,depthbits,stencilbits,stereo)
  flags=PFD_DRAW_TO_WINDOW|PFD_SUPPORT_OPENGL|PFD_DOUBLEBUFFER;if stereo then flags=flags|PFD_STEREO end if
  return PFD(flags,PFD_TYPE_RGBA,colorbits,depthbits,stencilbits,0,0)
end function
function pfdUsable(value,desired,allowSoftware)
  if not allowSoftware and (value.flags&PFD_GENERIC_FORMAT)!=0 then return false end if
  if value.pixelType!=PFD_TYPE_RGBA or (value.flags&desired.flags)!=desired.flags then return false end if
  if value.depthBits<15 or (desired.stencilBits>0 and value.stencilBits<4) then return false end if;return true
end function
function GLW_ChoosePFD(candidates,desired,allowSoftware)
  best=void
  for each value in candidates
    if not pfdUsable(value,desired,allowSoftware) then continue end if
    if best==void then best=value;continue end if
    if (value.flags&PFD_STEREO)!=0 and (best.flags&PFD_STEREO)==0 and (desired.flags&PFD_STEREO)!=0 then best=value;continue end if
    if (value.flags&PFD_STEREO)==0 and (best.flags&PFD_STEREO)!=0 and (desired.flags&PFD_STEREO)!=0 then best=value;continue end if
    if best.colorBits!=desired.colorBits then if value.colorBits==desired.colorBits or value.colorBits>best.colorBits then best=value;continue end if end if
    if best.depthBits!=desired.depthBits then if value.depthBits==desired.depthBits or value.depthBits>best.depthBits then best=value;continue end if end if
    if best.stencilBits!=desired.stencilBits then if value.stencilBits==desired.stencilBits or value.stencilBits>best.stencilBits then best=value;continue end if end if
  end for
  if best==void then return 0 end if;return best.index
end function
function GLW_MakeContext(state,pfd,chooseSucceeded,setSucceeded,createSucceeded,makeCurrentSucceeded)
  if not chooseSucceeded then return TRY_PFD_FAIL_SOFT end if
  if not setSucceeded then return TRY_PFD_FAIL_SOFT end if
  state.pfd=pfd;if not createSucceeded then return TRY_PFD_FAIL_HARD end if
  if not makeCurrentSucceeded then state.contextCreated=false;return TRY_PFD_FAIL_HARD end if
  state.contextCreated=true;return TRY_PFD_SUCCESS
end function
function GLW_InitDriver(state,driver,colorbits,depthbits,stencilbits,stereo,hostOk)
  if not hostOk then return false end if;pfd=GLW_CreatePFD(colorbits,depthbits,stencilbits,stereo);result=GLW_MakeContext(state,pfd,true,true,true,true)
  if result!=TRY_PFD_SUCCESS and stencilbits>0 then pfd=GLW_CreatePFD(colorbits,depthbits,0,stereo);result=GLW_MakeContext(state,pfd,true,true,true,true) end if
  return result==TRY_PFD_SUCCESS
end function
function GLW_CreateWindow(state,driver,width,height,colorbits,fullscreen)
  if width<1 or height<1 then return false end if;state.windowCreated=true;state.fullscreen=fullscreen;state.mode.width=width;state.mode.height=height;state.mode.fullscreen=fullscreen
  return GLW_InitDriver(state,driver,colorbits,24,8,false,true)
end function
function PrintCDSError(value)
  if value==0 then return "DISP_CHANGE_SUCCESSFUL" end if;if value==-1 then return "DISP_CHANGE_RESTART" end if;if value==-2 then return "DISP_CHANGE_BADFLAGS" end if
  if value==-3 then return "DISP_CHANGE_BADPARAM" end if;if value==-4 then return "DISP_CHANGE_FAILED" end if;if value==-5 then return "DISP_CHANGE_BADMODE" end if;if value==-6 then return "DISP_CHANGE_NOTUPDATED" end if;return "unknown error"
end function
function GLW_SetMode(state,driver,mode,colorbits,fullscreen,modes,displayAccepted)
  if mode<0 or mode>=len(modes) then return RSERR_INVALID_MODE end if;selected=modes[mode]
  if fullscreen and not displayAccepted then return RSERR_INVALID_FULLSCREEN end if
  state.mode=Mode(selected[0],selected[1],selected[0]/(selected[1]*1.0),selected[2],fullscreen);state.displayChanged=fullscreen
  if not GLW_CreateWindow(state,driver,selected[0],selected[1],colorbits,fullscreen) then return RSERR_UNKNOWN end if;return RSERR_OK
end function
function GLW_StartDriverAndSetMode(state,driver,mode,colorbits,fullscreen,modes,displayAccepted) return GLW_SetMode(state,driver,mode,colorbits,fullscreen,modes,displayAccepted)==RSERR_OK end function
function hasExtension(text,name) padded=" "+text+" ";return strings.contains(padded," "+name+" ") end function
function GLW_InitExtensions(state,text,allowExtensions)
  state.extensionText=text;if not allowExtensions then return state.extensions end if
  state.extensions.textureCompression=hasExtension(text,"GL_EXT_texture_compression_s3tc") or hasExtension(text,"GL_S3_s3tc")
  state.extensions.textureEnvAdd=hasExtension(text,"GL_EXT_texture_env_add")
  state.extensions.multitexture=hasExtension(text,"GL_ARB_multitexture")
  state.extensions.compiledVertexArray=hasExtension(text,"GL_EXT_compiled_vertex_array")
  state.extensions.swapControl=hasExtension(text,"WGL_EXT_swap_control");if state.extensions.multitexture then state.extensions.maxActiveTextures=2 end if;return state.extensions
end function
function GLW_CheckOSVersion(platform,major) return platform==2 and major>=4 end function
function GLW_LoadOpenGL(state,driver,loadSucceeded,modes,mode,colorbits,fullscreen)
  state.driverLoaded=loadSucceeded;if not loadSucceeded then return false end if
  if not winQgl.QGL_Init(state.qglState,state.qglRegistry,driver,loadSucceeded) then state.driverLoaded=false;return false end if
  state.glwState.hinstOpenGL=driver
  return GLW_StartDriverAndSetMode(state,driver,mode,colorbits,fullscreen,modes,true)
end function
function GLW_StartOpenGL(state,driver,modes,mode) return GLW_LoadOpenGL(state,driver,true,modes,mode,24,false) end function
function GLimp_Init(state,platform,major,driver,modes,mode,extensionText)
  state.osSupported=GLW_CheckOSVersion(platform,major);if not state.osSupported then return false end if
  if not GLW_StartOpenGL(state,driver,modes,mode) then return false end if;GLW_InitExtensions(state,extensionText,true);state.active=true;return true
end function
function GLimp_EndFrame(state,drawBuffer) if state.active and drawBuffer!="GL_FRONT" then state.swaps=state.swaps+1;return true end if;return false end function
function GLimp_Shutdown(state) state.contextCreated=false;state.windowCreated=false;state.driverLoaded=false;state.active=false;state.displayChanged=false;state.fullscreen=false;state.rendererThread=false;state.glwState.hinstOpenGL=void;state.glwState.log_fp=void;winQgl.QGL_Shutdown(state.qglState,state.qglRegistry);return void end function
function GLimp_LogComment(state,comment) state.logs=state.logs+[comment];return void end function
function GLimp_RenderThreadWrapper(state) if len(state.renderCommands)>1 then state.renderCommands=arrays.slice(state.renderCommands,1,len(state.renderCommands)-1) else state.renderCommands=[] end if;state.renderCompleted=true;return void end function
function GLimp_SpawnRenderThread(state,enabled) state.rendererThread=enabled;state.renderCompleted=true;return enabled end function
function GLimp_RendererSleep(state) state.renderCompleted=true;if len(state.renderCommands)==0 then return void end if;command=state.renderCommands[0];if len(state.renderCommands)>1 then state.renderCommands=arrays.slice(state.renderCommands,1,len(state.renderCommands)-1) else state.renderCommands=[] end if;return command end function
function GLimp_FrontEndSleep(state) return state.renderCompleted end function
function GLimp_WakeRenderer(state,data) state.renderCommands=state.renderCommands+[data];state.renderCompleted=false;return void end function
