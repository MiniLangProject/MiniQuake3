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

/// Data record for `mq3.platform.win_glimp_runtime.PFD`; groups `flags`, `pixelType`, `colorBits`, `depthBits`, `stencilBits`, `layerType`, and 1 further field.
struct PFD flags pixelType colorBits depthBits stencilBits layerType index end struct
/// Data record for `mq3.platform.win_glimp_runtime.Mode`; groups `width`, `height`, `aspect`, `frequency`, `fullscreen`.
struct Mode width height aspect frequency fullscreen end struct
/// Data record for `mq3.platform.win_glimp_runtime.Extensions`; groups `textureCompression`, `textureEnvAdd`, `multitexture`, `compiledVertexArray`, `maxActiveTextures`, `swapControl`.
struct Extensions textureCompression textureEnvAdd multitexture compiledVertexArray maxActiveTextures swapControl end struct
/// Data record for `mq3.platform.win_glimp_runtime.Runtime`; groups `osSupported`, `driverLoaded`, `windowCreated`, `contextCreated`, `active`, `fullscreen`, and 16 further fields.
struct Runtime osSupported driverLoaded windowCreated contextCreated active fullscreen displayChanged mode pfd extensions vendor renderer version extensionText swaps logs rendererThread renderCommands renderCompleted qglRegistry qglState glwState end struct

/// Constructs `mq3.platform.win_glimp_runtime.Runtime` with `osSupported` = `true`, `driverLoaded` = `false`, `windowCreated` = `false`, `contextCreated` = `false` and the supplied remaining values.
function create()
  return Runtime(true,false,false,false,false,false,false,Mode(0,0,1.0,0,false),void,Extensions(false,false,false,false,1,false),"","","","",0,[],false,[],true,qgl.createRegistry(),winQgl.create(),winHeaders.createGLWState())
end function
/// Builds `mq3.platform.win_glimp_runtime.PFD` for `mq3.platform.win_glimp_runtime.GLW_CreatePFD`.
/// @param colorbits Initial value for `mq3.platform.win_glimp_runtime.PFD.colorBits`.
/// @param depthbits Initial value for `mq3.platform.win_glimp_runtime.PFD.depthBits`.
/// @param stencilbits Initial value for `mq3.platform.win_glimp_runtime.PFD.stencilBits`.
/// @param stereo Input tested by `stereo`.
function GLW_CreatePFD(colorbits,depthbits,stencilbits,stereo)
  flags=PFD_DRAW_TO_WINDOW|PFD_SUPPORT_OPENGL|PFD_DOUBLEBUFFER;if stereo then flags=flags|PFD_STEREO end if
  return PFD(flags,PFD_TYPE_RGBA,colorbits,depthbits,stencilbits,0,0)
end function
/// Checks pixel type, required flags, depth/stencil precision, and software-renderer policy for a pixel-format candidate.
/// @param value Record providing `value.flags`, `value.pixelType`, `value.depthBits`, `value.stencilBits`.
/// @param desired Record providing `desired.flags`, `desired.stencilBits`.
/// @param allowSoftware Input tested by `not allowSoftware and (value.flags&PFD_GENERIC_FORMAT)!=0`.
function pfdUsable(value,desired,allowSoftware)
  if not allowSoftware and (value.flags&PFD_GENERIC_FORMAT)!=0 then return false end if
  if value.pixelType!=PFD_TYPE_RGBA or (value.flags&desired.flags)!=desired.flags then return false end if
  if value.depthBits<15 or (desired.stencilBits>0 and value.stencilBits<4) then return false end if;return true
end function
/// Computes `GLW_ChoosePFD` from `best.index` using `mq3.platform.win_glimp_runtime.pfdUsable`, `if`, `and`.
/// @param candidates Sequence traversed as `value` while producing this result.
/// @param desired Record providing `desired.flags`, `desired.colorBits`, `desired.depthBits`, `desired.stencilBits`.
/// @param allowSoftware Value forwarded as `allowSoftware` to `mq3.platform.win_glimp_runtime.pfdUsable`.
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
/// Updates `state.pfd`, `state.contextCreated` in `mq3.platform.win_glimp_runtime.GLW_MakeContext`; returns `TRY_PFD_SUCCESS`.
/// @param state Mutable record or buffer; this call updates `state.pfd`, `state.contextCreated`.
/// @param pfd Value assigned to `state.pfd`.
/// @param chooseSucceeded Input tested by `not chooseSucceeded`.
/// @param setSucceeded Input tested by `not setSucceeded`.
/// @param createSucceeded Input tested by `not createSucceeded`.
/// @param makeCurrentSucceeded Input tested by `not makeCurrentSucceeded`.
function GLW_MakeContext(state,pfd,chooseSucceeded,setSucceeded,createSucceeded,makeCurrentSucceeded)
  if not chooseSucceeded then return TRY_PFD_FAIL_SOFT end if
  if not setSucceeded then return TRY_PFD_FAIL_SOFT end if
  state.pfd=pfd;if not createSucceeded then return TRY_PFD_FAIL_HARD end if
  if not makeCurrentSucceeded then state.contextCreated=false;return TRY_PFD_FAIL_HARD end if
  state.contextCreated=true;return TRY_PFD_SUCCESS
end function
/// Computes `GLW_InitDriver` from `result==TRY_PFD_SUCCESS` using `mq3.platform.win_glimp_runtime.GLW_CreatePFD`, `mq3.platform.win_glimp_runtime.GLW_MakeContext`.
/// @param state Value forwarded as `state` to `mq3.platform.win_glimp_runtime.GLW_MakeContext`.
/// @param driver Unused compatibility argument retained by this entry point.
/// @param colorbits Value forwarded as `colorbits` to `mq3.platform.win_glimp_runtime.GLW_CreatePFD`.
/// @param depthbits Value forwarded as `depthbits` to `mq3.platform.win_glimp_runtime.GLW_CreatePFD`.
/// @param stencilbits Value forwarded as `stencilbits` to `mq3.platform.win_glimp_runtime.GLW_CreatePFD`.
/// @param stereo Value forwarded as `stereo` to `mq3.platform.win_glimp_runtime.GLW_CreatePFD`.
/// @param hostOk Input tested by `not hostOk`.
function GLW_InitDriver(state,driver,colorbits,depthbits,stencilbits,stereo,hostOk)
  if not hostOk then return false end if;pfd=GLW_CreatePFD(colorbits,depthbits,stencilbits,stereo);result=GLW_MakeContext(state,pfd,true,true,true,true)
  if result!=TRY_PFD_SUCCESS and stencilbits>0 then pfd=GLW_CreatePFD(colorbits,depthbits,0,stereo);result=GLW_MakeContext(state,pfd,true,true,true,true) end if
  return result==TRY_PFD_SUCCESS
end function
/// Updates `state.windowCreated`, `state.fullscreen`, `state.mode.width`, `state.mode.height`, `state.mode.fullscreen` in `mq3.platform.win_glimp_runtime.GLW_CreateWindow`; returns `GLW_InitDriver(state,driver,colorbits,24,8,false,true)`.
/// @param state Mutable record or buffer; this call updates `state.windowCreated`, `state.fullscreen`, `state.mode.width`, `state.mode.height`, `state.mode.fullscreen`.
/// @param driver Value forwarded as `driver` to `mq3.platform.win_glimp_runtime.GLW_InitDriver`.
/// @param width Value assigned to `state.mode.width`.
/// @param height Value assigned to `state.mode.height`.
/// @param colorbits Value forwarded as `colorbits` to `mq3.platform.win_glimp_runtime.GLW_InitDriver`.
/// @param fullscreen Value assigned to `state.fullscreen`, `state.mode.fullscreen`.
function GLW_CreateWindow(state,driver,width,height,colorbits,fullscreen)
  if width<1 or height<1 then return false end if;state.windowCreated=true;state.fullscreen=fullscreen;state.mode.width=width;state.mode.height=height;state.mode.fullscreen=fullscreen
  return GLW_InitDriver(state,driver,colorbits,24,8,false,true)
end function
/// Computes `PrintCDSError` from `"unknown error"`.
/// @param value Input tested by `value==0`.
function PrintCDSError(value)
  if value==0 then return "DISP_CHANGE_SUCCESSFUL" end if;if value==-1 then return "DISP_CHANGE_RESTART" end if;if value==-2 then return "DISP_CHANGE_BADFLAGS" end if
  if value==-3 then return "DISP_CHANGE_BADPARAM" end if;if value==-4 then return "DISP_CHANGE_FAILED" end if;if value==-5 then return "DISP_CHANGE_BADMODE" end if;if value==-6 then return "DISP_CHANGE_NOTUPDATED" end if;return "unknown error"
end function
/// Updates `state.mode`, `state.displayChanged` in `mq3.platform.win_glimp_runtime.GLW_SetMode`; returns `RSERR_OK`.
/// @param state Mutable record or buffer; this call updates `state.mode`, `state.displayChanged`.
/// @param driver Value forwarded as `driver` to `mq3.platform.win_glimp_runtime.GLW_CreateWindow`.
/// @param mode Input tested by `mode<0 or mode>=len(modes)`.
/// @param colorbits Value forwarded as `colorbits` to `mq3.platform.win_glimp_runtime.GLW_CreateWindow`.
/// @param fullscreen Value assigned to `state.displayChanged`.
/// @param modes Indexed input read at `mode`.
/// @param displayAccepted Input tested by `fullscreen and not displayAccepted`.
function GLW_SetMode(state,driver,mode,colorbits,fullscreen,modes,displayAccepted)
  if mode<0 or mode>=len(modes) then return RSERR_INVALID_MODE end if;selected=modes[mode]
  if fullscreen and not displayAccepted then return RSERR_INVALID_FULLSCREEN end if
  state.mode=Mode(selected[0],selected[1],selected[0]/(selected[1]*1.0),selected[2],fullscreen);state.displayChanged=fullscreen
  if not GLW_CreateWindow(state,driver,selected[0],selected[1],colorbits,fullscreen) then return RSERR_UNKNOWN end if;return RSERR_OK
end function
/// Computes `GLW_SetMode(state,driver,mode,colorbits,fullscreen,modes,displayAccepted)==RSERR_OK` for `mq3.platform.win_glimp_runtime.GLW_StartDriverAndSetMode`.
/// @param state Value forwarded as `state` to `mq3.platform.win_glimp_runtime.GLW_SetMode`.
/// @param driver Value forwarded as `driver` to `mq3.platform.win_glimp_runtime.GLW_SetMode`.
/// @param mode Value forwarded as `mode` to `mq3.platform.win_glimp_runtime.GLW_SetMode`.
/// @param colorbits Value forwarded as `colorbits` to `mq3.platform.win_glimp_runtime.GLW_SetMode`.
/// @param fullscreen Value forwarded as `fullscreen` to `mq3.platform.win_glimp_runtime.GLW_SetMode`.
/// @param modes Value forwarded as `modes` to `mq3.platform.win_glimp_runtime.GLW_SetMode`.
/// @param displayAccepted Value forwarded as `displayAccepted` to `mq3.platform.win_glimp_runtime.GLW_SetMode`.
function GLW_StartDriverAndSetMode(state,driver,mode,colorbits,fullscreen,modes,displayAccepted) return GLW_SetMode(state,driver,mode,colorbits,fullscreen,modes,displayAccepted)==RSERR_OK end function
/// Returns `strings.contains(padded," "+name+" ")` from `mq3.platform.win_glimp_runtime.hasExtension`.
/// @param text Input used by `padded=" "+text+" "`.
/// @param name Input used in the result expression `strings.contains(padded," "+name+" ")`.
function hasExtension(text,name) padded=" "+text+" ";return strings.contains(padded," "+name+" ") end function
/// Updates `state.extensionText`, `state.extensions.textureCompression`, `state.extensions.textureEnvAdd`, `state.extensions.multitexture`, `state.extensions.compiledVertexArray` in `mq3.platform.win_glimp_runtime.GLW_InitExtensions`; returns `state.extensions`.
/// @param state Mutable record or buffer; this call updates `state.extensionText`, `state.extensions.textureCompression`, `state.extensions.textureEnvAdd`, `state.extensions.multitexture`, `state.extensions.compiledVertexArray`.
/// @param text Value assigned to `state.extensionText`.
/// @param allowExtensions Input tested by `not allowExtensions`.
function GLW_InitExtensions(state,text,allowExtensions)
  state.extensionText=text;if not allowExtensions then return state.extensions end if
  state.extensions.textureCompression=hasExtension(text,"GL_EXT_texture_compression_s3tc") or hasExtension(text,"GL_S3_s3tc")
  state.extensions.textureEnvAdd=hasExtension(text,"GL_EXT_texture_env_add")
  state.extensions.multitexture=hasExtension(text,"GL_ARB_multitexture")
  state.extensions.compiledVertexArray=hasExtension(text,"GL_EXT_compiled_vertex_array")
  state.extensions.swapControl=hasExtension(text,"WGL_EXT_swap_control");if state.extensions.multitexture then state.extensions.maxActiveTextures=2 end if;return state.extensions
end function
/// Computes `platform==2 and major>=4` for `mq3.platform.win_glimp_runtime.GLW_CheckOSVersion`.
/// @param platform Input used in the result expression `platform==2 and major>=4`.
/// @param major Input used in the result expression `platform==2 and major>=4`.
function GLW_CheckOSVersion(platform,major) return platform==2 and major>=4 end function
/// Updates `state.driverLoaded`, `state.glwState.hinstOpenGL` in `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL`; returns `GLW_StartDriverAndSetMode(state,driver,mode,colorbits,fullscreen,modes,true)`.
/// @param state Mutable record or buffer; this call updates `state.driverLoaded`, `state.glwState.hinstOpenGL`.
/// @param driver Value assigned to `state.glwState.hinstOpenGL`.
/// @param loadSucceeded Value assigned to `state.driverLoaded`.
/// @param modes Value forwarded as `modes` to `mq3.platform.win_glimp_runtime.GLW_StartDriverAndSetMode`.
/// @param mode Value forwarded as `mode` to `mq3.platform.win_glimp_runtime.GLW_StartDriverAndSetMode`.
/// @param colorbits Value forwarded as `colorbits` to `mq3.platform.win_glimp_runtime.GLW_StartDriverAndSetMode`.
/// @param fullscreen Value forwarded as `fullscreen` to `mq3.platform.win_glimp_runtime.GLW_StartDriverAndSetMode`.
function GLW_LoadOpenGL(state,driver,loadSucceeded,modes,mode,colorbits,fullscreen)
  state.driverLoaded=loadSucceeded;if not loadSucceeded then return false end if
  if not winQgl.QGL_Init(state.qglState,state.qglRegistry,driver,loadSucceeded) then state.driverLoaded=false;return false end if
  state.glwState.hinstOpenGL=driver
  return GLW_StartDriverAndSetMode(state,driver,mode,colorbits,fullscreen,modes,true)
end function
/// Calls `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL` with `(state,driver,true,modes,mode,24,false)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL`.
/// @param driver Value forwarded as `driver` to `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL`.
/// @param modes Value forwarded as `modes` to `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL`.
/// @param mode Value forwarded as `mode` to `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL`.
function GLW_StartOpenGL(state,driver,modes,mode) return GLW_LoadOpenGL(state,driver,true,modes,mode,24,false) end function
/// Updates `state.osSupported`, `state.active` in `mq3.platform.win_glimp_runtime.GLimp_Init`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.osSupported`, `state.active`.
/// @param platform Value forwarded as `platform` to `mq3.platform.win_glimp_runtime.GLW_CheckOSVersion`.
/// @param major Value forwarded as `major` to `mq3.platform.win_glimp_runtime.GLW_CheckOSVersion`.
/// @param driver Value forwarded as `driver` to `mq3.platform.win_glimp_runtime.GLW_StartOpenGL`.
/// @param modes Value forwarded as `modes` to `mq3.platform.win_glimp_runtime.GLW_StartOpenGL`.
/// @param mode Value forwarded as `mode` to `mq3.platform.win_glimp_runtime.GLW_StartOpenGL`.
/// @param extensionText Value forwarded as `text` to `mq3.platform.win_glimp_runtime.GLW_InitExtensions`.
function GLimp_Init(state,platform,major,driver,modes,mode,extensionText)
  state.osSupported=GLW_CheckOSVersion(platform,major);if not state.osSupported then return false end if
  if not GLW_StartOpenGL(state,driver,modes,mode) then return false end if;GLW_InitExtensions(state,extensionText,true);state.active=true;return true
end function
/// Updates `state.swaps` in `mq3.platform.win_glimp_runtime.GLimp_EndFrame`; returns `false`.
/// @param state Mutable record or buffer; this call updates `state.swaps`.
/// @param drawBuffer Input tested by `state.active and drawBuffer!="GL_FRONT"`.
function GLimp_EndFrame(state,drawBuffer) if state.active and drawBuffer!="GL_FRONT" then state.swaps=state.swaps+1;return true end if;return false end function
/// Updates `state.contextCreated`, `state.windowCreated`, `state.driverLoaded`, `state.active`, `state.displayChanged` in `mq3.platform.win_glimp_runtime.GLimp_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.contextCreated`, `state.windowCreated`, `state.driverLoaded`, `state.active`, `state.displayChanged`.
function GLimp_Shutdown(state) state.contextCreated=false;state.windowCreated=false;state.driverLoaded=false;state.active=false;state.displayChanged=false;state.fullscreen=false;state.rendererThread=false;state.glwState.hinstOpenGL=void;state.glwState.log_fp=void;winQgl.QGL_Shutdown(state.qglState,state.qglRegistry);return void end function
/// Updates `state.logs` in `mq3.platform.win_glimp_runtime.GLimp_LogComment`.
/// @param state Mutable record or buffer; this call updates `state.logs`.
/// @param comment Input used by `state.logs=state.logs+[comment]`.
function GLimp_LogComment(state,comment) state.logs=state.logs+[comment];return void end function
/// Updates `state.renderCommands`, `state.renderCompleted` in `mq3.platform.win_glimp_runtime.GLimp_RenderThreadWrapper`.
/// @param state Mutable record or buffer; this call updates `state.renderCommands`, `state.renderCompleted`.
function GLimp_RenderThreadWrapper(state) if len(state.renderCommands)>1 then state.renderCommands=arrays.slice(state.renderCommands,1,len(state.renderCommands)-1) else state.renderCommands=[] end if;state.renderCompleted=true;return void end function
/// Updates `state.rendererThread`, `state.renderCompleted` in `mq3.platform.win_glimp_runtime.GLimp_SpawnRenderThread`; returns `enabled`.
/// @param state Mutable record or buffer; this call updates `state.rendererThread`, `state.renderCompleted`.
/// @param enabled Value assigned to `state.rendererThread`.
function GLimp_SpawnRenderThread(state,enabled) state.rendererThread=enabled;state.renderCompleted=true;return enabled end function
/// Updates `state.renderCompleted`, `state.renderCommands` in `mq3.platform.win_glimp_runtime.GLimp_RendererSleep`; returns `command`.
/// @param state Mutable record or buffer; this call updates `state.renderCompleted`, `state.renderCommands`.
function GLimp_RendererSleep(state) state.renderCompleted=true;if len(state.renderCommands)==0 then return void end if;command=state.renderCommands[0];if len(state.renderCommands)>1 then state.renderCommands=arrays.slice(state.renderCommands,1,len(state.renderCommands)-1) else state.renderCommands=[] end if;return command end function
/// Computes `state.renderCompleted` for `mq3.platform.win_glimp_runtime.GLimp_FrontEndSleep`.
/// @param state Record providing `state.renderCompleted`.
function GLimp_FrontEndSleep(state) return state.renderCompleted end function
/// Updates `state.renderCommands`, `state.renderCompleted` in `mq3.platform.win_glimp_runtime.GLimp_WakeRenderer`.
/// @param state Mutable record or buffer; this call updates `state.renderCommands`, `state.renderCompleted`.
/// @param data Input used by `state.renderCommands=state.renderCommands+[data]`.
function GLimp_WakeRenderer(state,data) state.renderCommands=state.renderCommands+[data];state.renderCompleted=false;return void end function
