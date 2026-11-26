// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Portable Unix/Linux platform ownership facade.
package mq3.platform.unix_runtime

import mq3.compat.numeric as n
import mq3.vm.jit_compat as jit
import std.string as strings

/// Lists the 4 declared names for `mq3.platform.unix_runtime.linuxCommonSymbols`, including `Com_Memcpy`, `Com_Memset`, `Com_Prefetch`, `_copyDWord`.
function linuxCommonSymbols() return ["Com_Memcpy","Com_Memset","Com_Prefetch","_copyDWord"] end function
/// Lists the 35 declared names for `mq3.platform.unix_runtime.linuxGlimpSymbols`, including `CreateNullCursor`, `GLW_InitExtensions`, `GLW_InitGamma`, `GLW_LoadOpenGL`.
function linuxGlimpSymbols() return ["CreateNullCursor","GLW_InitExtensions","GLW_InitGamma","GLW_LoadOpenGL","GLW_SetMode","GLW_StartDriverAndSetMode","GLimp_EndFrame","GLimp_FrontEndSleep","GLimp_Init","GLimp_LogComment","GLimp_RenderThreadWrapper","GLimp_RendererSleep","GLimp_SetGamma","GLimp_Shutdown","GLimp_SpawnRenderThread","GLimp_WakeRenderer","HandleEvents","IN_Activate","IN_ActivateMouse","IN_DeactivateMouse","IN_Frame","IN_Init","IN_JoyMove","IN_Shutdown","IN_StartupJoystick","KBD_Close","KBD_Init","Q_stristr","Sys_SendKeyEvents","X11_PendingInput","XLateKey","install_grabs","qXErrorHandler","repeated_press","uninstall_grabs"] end function
/// Lists the 2 declared names for `mq3.platform.unix_runtime.linuxJoystickSymbols`, including `IN_JoyMove`, `IN_StartupJoystick`.
function linuxJoystickSymbols() return ["IN_JoyMove","IN_StartupJoystick"] end function
/// Returns `[]` for the `mq3.platform.unix_runtime.linuxLocalSymbols` compatibility entry point.
function linuxLocalSymbols() return [] end function
/// Lists the 341 declared names for `mq3.platform.unix_runtime.linuxQglSymbols`, including `GLimp_LogNewFrame`, `QGL_EnableLogging`, `QGL_Init`, `QGL_Shutdown`.
function linuxQglSymbols() return ["GLimp_LogNewFrame","QGL_EnableLogging","QGL_Init","QGL_Shutdown","logAccum","logAlphaFunc","logAreTexturesResident","logArrayElement","logBegin","logBindTexture","logBitmap","logBlendFunc","logCallList","logCallLists","logClear","logClearAccum","logClearColor","logClearDepth","logClearIndex","logClearStencil","logClipPlane","logColor3b","logColor3bv","logColor3d","logColor3dv","logColor3f","logColor3fv","logColor3i","logColor3iv","logColor3s","logColor3sv","logColor3ub","logColor3ubv","logColor3ui","logColor3uiv","logColor3us","logColor3usv","logColor4b","logColor4bv","logColor4d","logColor4dv","logColor4f","logColor4fv","logColor4i","logColor4iv","logColor4s","logColor4sv","logColor4ub","logColor4ubv","logColor4ui","logColor4uiv","logColor4us","logColor4usv","logColorMask","logColorMaterial","logColorPointer","logCopyPixels","logCopyTexImage1D","logCopyTexImage2D","logCopyTexSubImage1D","logCopyTexSubImage2D","logCullFace","logDeleteLists","logDeleteTextures","logDepthFunc","logDepthMask","logDepthRange","logDisable","logDisableClientState","logDrawArrays","logDrawBuffer","logDrawElements","logDrawPixels","logEdgeFlag","logEdgeFlagPointer","logEdgeFlagv","logEnable","logEnableClientState","logEnd","logEndList","logEvalCoord1d","logEvalCoord1dv","logEvalCoord1f","logEvalCoord1fv","logEvalCoord2d","logEvalCoord2dv","logEvalCoord2f","logEvalCoord2fv","logEvalMesh1","logEvalMesh2","logEvalPoint1","logEvalPoint2","logFeedbackBuffer","logFinish","logFlush","logFogf","logFogfv","logFogi","logFogiv","logFrontFace","logFrustum","logGenLists","logGenTextures","logGetBooleanv","logGetClipPlane","logGetDoublev","logGetError","logGetFloatv","logGetIntegerv","logGetLightfv","logGetLightiv","logGetMapdv","logGetMapfv","logGetMapiv","logGetMaterialfv","logGetMaterialiv","logGetPixelMapfv","logGetPixelMapuiv","logGetPixelMapusv","logGetPointerv","logGetPolygonStipple","logGetString","logGetTexEnvfv","logGetTexEnviv","logGetTexGendv","logGetTexGenfv","logGetTexGeniv","logGetTexImage","logGetTexLevelParameterfv","logGetTexLevelParameteriv","logGetTexParameterfv","logGetTexParameteriv","logHint","logIndexMask","logIndexPointer","logIndexd","logIndexdv","logIndexf","logIndexfv","logIndexi","logIndexiv","logIndexs","logIndexsv","logIndexub","logIndexubv","logInitNames","logInterleavedArrays","logIsEnabled","logIsList","logIsTexture","logLightModelf","logLightModelfv","logLightModeli","logLightModeliv","logLightf","logLightfv","logLighti","logLightiv","logLineStipple","logLineWidth","logListBase","logLoadIdentity","logLoadMatrixd","logLoadMatrixf","logLoadName","logLogicOp","logMap1d","logMap1f","logMap2d","logMap2f","logMapGrid1d","logMapGrid1f","logMapGrid2d","logMapGrid2f","logMaterialf","logMaterialfv","logMateriali","logMaterialiv","logMatrixMode","logMultMatrixd","logMultMatrixf","logNewList","logNormal3b","logNormal3bv","logNormal3d","logNormal3dv","logNormal3f","logNormal3fv","logNormal3i","logNormal3iv","logNormal3s","logNormal3sv","logNormalPointer","logOrtho","logPassThrough","logPixelMapfv","logPixelMapuiv","logPixelMapusv","logPixelStoref","logPixelStorei","logPixelTransferf","logPixelTransferi","logPixelZoom","logPointSize","logPolygonMode","logPolygonOffset","logPolygonStipple","logPopAttrib","logPopClientAttrib","logPopMatrix","logPopName","logPrioritizeTextures","logPushAttrib","logPushClientAttrib","logPushMatrix","logPushName","logRasterPos2d","logRasterPos2dv","logRasterPos2f","logRasterPos2fv","logRasterPos2i","logRasterPos2iv","logRasterPos2s","logRasterPos2sv","logRasterPos3d","logRasterPos3dv","logRasterPos3f","logRasterPos3fv","logRasterPos3i","logRasterPos3iv","logRasterPos3s","logRasterPos3sv","logRasterPos4d","logRasterPos4dv","logRasterPos4f","logRasterPos4fv","logRasterPos4i","logRasterPos4iv","logRasterPos4s","logRasterPos4sv","logReadBuffer","logReadPixels","logRectd","logRectdv","logRectf","logRectfv","logRecti","logRectiv","logRects","logRectsv","logRenderMode","logRotated","logRotatef","logScaled","logScalef","logScissor","logSelectBuffer","logShadeModel","logStencilFunc","logStencilMask","logStencilOp","logTexCoord1d","logTexCoord1dv","logTexCoord1f","logTexCoord1fv","logTexCoord1i","logTexCoord1iv","logTexCoord1s","logTexCoord1sv","logTexCoord2d","logTexCoord2dv","logTexCoord2f","logTexCoord2fv","logTexCoord2i","logTexCoord2iv","logTexCoord2s","logTexCoord2sv","logTexCoord3d","logTexCoord3dv","logTexCoord3f","logTexCoord3fv","logTexCoord3i","logTexCoord3iv","logTexCoord3s","logTexCoord3sv","logTexCoord4d","logTexCoord4dv","logTexCoord4f","logTexCoord4fv","logTexCoord4i","logTexCoord4iv","logTexCoord4s","logTexCoord4sv","logTexCoordPointer","logTexEnvf","logTexEnvfv","logTexEnvi","logTexEnviv","logTexGend","logTexGendv","logTexGenf","logTexGenfv","logTexGeni","logTexGeniv","logTexImage1D","logTexImage2D","logTexParameterf","logTexParameterfv","logTexParameteri","logTexParameteriv","logTexSubImage1D","logTexSubImage2D","logTranslated","logTranslatef","logVertex2d","logVertex2dv","logVertex2f","logVertex2fv","logVertex2i","logVertex2iv","logVertex2s","logVertex2sv","logVertex3d","logVertex3dv","logVertex3f","logVertex3fv","logVertex3i","logVertex3iv","logVertex3s","logVertex3sv","logVertex4d","logVertex4dv","logVertex4f","logVertex4fv","logVertex4i","logVertex4iv","logVertex4s","logVertex4sv","logVertexPointer","logViewport","qwglGetProcAddress"] end function
/// Lists the 2 declared names for `mq3.platform.unix_runtime.linuxSignalsSymbols`, including `InitSig`, `signal_handler`.
function linuxSignalsSymbols() return ["InitSig","signal_handler"] end function
/// Lists the 6 declared names for `mq3.platform.unix_runtime.linuxSoundSymbols`, including `SNDDMA_BeginPainting`, `SNDDMA_GetDMAPos`, `SNDDMA_Init`, `SNDDMA_Shutdown`.
function linuxSoundSymbols() return ["SNDDMA_BeginPainting","SNDDMA_GetDMAPos","SNDDMA_Init","SNDDMA_Shutdown","SNDDMA_Submit","Snd_Memset"] end function
/// Returns `[]` for the `mq3.platform.unix_runtime.qasmSymbols` compatibility entry point.
function qasmSymbols() return [] end function
/// Returns `[]` for the `mq3.platform.unix_runtime.unixGlwSymbols` compatibility entry point.
function unixGlwSymbols() return [] end function
/// Lists the 43 declared names for `mq3.platform.unix_runtime.unixMainSymbols`, including `Hist_Add`, `Hist_Next`, `Hist_Prev`, `Sys_AppActivate`.
function unixMainSymbols() return ["Hist_Add","Hist_Next","Hist_Prev","Sys_AppActivate","Sys_BeginProfiling","Sys_BeginStreamedFile","Sys_CheckCD","Sys_ConfigureFPU","Sys_ConsoleInput","Sys_ConsoleInputInit","Sys_ConsoleInputShutdown","Sys_EndStreamedFile","Sys_Error","Sys_Exit","Sys_FileTime","Sys_FunctionCheckSum","Sys_FunctionCmp","Sys_GetClipboardData","Sys_GetEvent","Sys_In_Restart_f","Sys_Init","Sys_InitStreamThread","Sys_LoadDll","Sys_LowPhysicalMemory","Sys_MonkeyShouldBeSpanked","Sys_ParseArgs","Sys_Print","Sys_PrintBinVersion","Sys_Printf","Sys_QueEvent","Sys_Quit","Sys_ShutdownStreamThread","Sys_StreamSeek","Sys_StreamThread","Sys_StreamedRead","Sys_UnloadDll","Sys_Warn","floating_point_exception_handler","main","tty_Back","tty_FlushIn","tty_Hide","tty_Show"] end function
/// Lists the 16 declared names for `mq3.platform.unix_runtime.unixNetSymbols`, including `NET_BaseAdrToString`, `NET_ErrorString`, `NET_GetLocalAddress`, `NET_IPSocket`.
function unixNetSymbols() return ["NET_BaseAdrToString","NET_ErrorString","NET_GetLocalAddress","NET_IPSocket","NET_Init","NET_OpenIP","NET_Shutdown","NET_Sleep","NetadrToSockadr","SockadrToNetadr","Sys_GetPacket","Sys_IsLANAddress","Sys_SendPacket","Sys_ShowIP","Sys_StringToAdr","Sys_StringToSockaddr"] end function
/// Lists the 20 declared names for `mq3.platform.unix_runtime.unixSharedSymbols`, including `Sys_Cwd`, `Sys_DefaultCDPath`, `Sys_DefaultHomePath`, `Sys_DefaultInstallPath`.
function unixSharedSymbols() return ["Sys_Cwd","Sys_DefaultCDPath","Sys_DefaultHomePath","Sys_DefaultInstallPath","Sys_FreeFileList","Sys_GetCurrentUser","Sys_GetProcessorId","Sys_ListFiles","Sys_ListFilteredFiles","Sys_Milliseconds","Sys_Mkdir","Sys_ProcessorCount","Sys_SetDefaultCDPath","Sys_SetDefaultHomePath","Sys_SetDefaultInstallPath","Sys_ShowConsole","Sys_SnapVector","Sys_XTimeToSysTime","fastftol","strlwr"] end function
/// Lists the 2 declared names for `mq3.platform.unix_runtime.unixVmX86Symbols`, including `VM_CallCompiled`, `VM_Compile`.
function unixVmX86Symbols() return ["VM_CallCompiled","VM_Compile"] end function

/// Data record for `mq3.platform.unix_runtime.Address`; groups `type`, `host`, `port`.
struct Address type host port end struct
/// Data record for `mq3.platform.unix_runtime.Event`; groups `kind`, `value1`, `value2`, `time`.
struct Event kind value1 value2 time end struct
/// Data record for `mq3.platform.unix_runtime.State`; groups `glInitialized`, `inputInitialized`, `joystickInitialized`, `soundInitialized`, `logging`, `gamma`, and 13 further fields.
struct State glInitialized inputInitialized joystickInitialized soundInitialized logging gamma active signals currentTime paths user events systemEvents packets history historyCursor warnings errors quitRequested end struct

const NA_BAD=1
const NA_LOOPBACK=2
const NA_IP=4

/// Constructs `mq3.platform.unix_runtime.State` with `glInitialized` = `false`, `inputInitialized` = `false`, `joystickInitialized` = `false`, `soundInitialized` = `false` and the supplied remaining values.
function create() return State(false,false,false,false,false,[],true,false,0,["","","",""],"",[],[],[],[],-1,[],[],false) end function

/// Returns `destination` from `mq3.platform.unix_runtime.Com_Memcpy`.
/// @param destination Argument 1 supplied to `copyBytes`.
/// @param destinationOffset Argument 2 supplied to `copyBytes`.
/// @param source Argument 3 supplied to `copyBytes`.
/// @param sourceOffset Argument 4 supplied to `copyBytes`.
/// @param count Argument 5 supplied to `copyBytes`.
function Com_Memcpy(destination,destinationOffset,source,sourceOffset,count) if count>0 then copyBytes(destination,destinationOffset,source,sourceOffset,count) end if;return destination end function
/// Updates `destination[offset+index]` in `mq3.platform.unix_runtime.Com_Memset`; returns `destination`.
/// @param destination Mutable record or buffer; this call updates `destination[offset+index]`.
/// @param offset Input used by `for index=0 to count-1 destination[offset+index]=value&255`.
/// @param value Input used by `for index=0 to count-1 destination[offset+index]=value&255`.
/// @param count Input used by `for index=0 to count-1 destination[offset+index]=value&255`.
function Com_Memset(destination,offset,value,count) for index=0 to count-1 destination[offset+index]=value&255 end for;return destination end function
/// Computes `count` for `mq3.platform.unix_runtime.Com_Prefetch`.
/// @param memory Unused compatibility argument retained by this entry point.
/// @param count Input used in the result expression `count`.
function Com_Prefetch(memory,count) return count end function
/// Calls `mq3.platform.unix_runtime.Com_Memcpy` with `(destination,destinationOffset,source,sourceOffset,count*4)` and returns its result.
/// @param destination Value forwarded as `destination` to `mq3.platform.unix_runtime.Com_Memcpy`.
/// @param destinationOffset Value forwarded as `destinationOffset` to `mq3.platform.unix_runtime.Com_Memcpy`.
/// @param source Value forwarded as `source` to `mq3.platform.unix_runtime.Com_Memcpy`.
/// @param sourceOffset Value forwarded as `sourceOffset` to `mq3.platform.unix_runtime.Com_Memcpy`.
/// @param count Input used in the result expression `Com_Memcpy(destination,destinationOffset,source,sourceOffset,count*4)`.
function _copyDWord(destination,destinationOffset,source,sourceOffset,count) return Com_Memcpy(destination,destinationOffset,source,sourceOffset,count*4) end function

/// Calls `std.string.indexOf` with `(strings.toLowerAscii(text),strings.toLowerAscii(needle),0)` and returns its result.
/// @param text Argument 1 supplied to `std.string.toLowerAscii`.
/// @param needle Argument 1 supplied to `std.string.toLowerAscii`.
function Q_stristr(text,needle) return strings.indexOf(strings.toLowerAscii(text),strings.toLowerAscii(needle),0) end function
/// Updates `state.glInitialized`, `state.active` in `mq3.platform.unix_runtime.GLimp_Init`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.glInitialized`, `state.active`.
function GLimp_Init(state) state.glInitialized=true;state.active=true;return true end function
/// Updates `state.glInitialized`, `state.active` in `mq3.platform.unix_runtime.GLimp_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.glInitialized`, `state.active`.
function GLimp_Shutdown(state) state.glInitialized=false;state.active=false;return void end function
/// Computes `state.glInitialized` for `mq3.platform.unix_runtime.GLimp_EndFrame`.
/// @param state Record providing `state.glInitialized`.
function GLimp_EndFrame(state) return state.glInitialized end function
/// Updates `state.gamma` in `mq3.platform.unix_runtime.GLimp_SetGamma`.
/// @param state Mutable record or buffer; this call updates `state.gamma`.
/// @param red Input used by `state.gamma=[red,green,blue]`.
/// @param green Input used by `state.gamma=[red,green,blue]`.
/// @param blue Input used by `state.gamma=[red,green,blue]`.
function GLimp_SetGamma(state,red,green,blue) state.gamma=[red,green,blue];return void end function
/// Updates `state.events` in `mq3.platform.unix_runtime.GLimp_LogComment`.
/// @param state Mutable record or buffer; this call updates `state.events`.
/// @param text Input tested by `state.logging`.
function GLimp_LogComment(state,text) if state.logging then state.events=state.events+[["gl-log",text]] end if;return void end function
/// Updates `state.events` in `mq3.platform.unix_runtime.GLW_SetMode`; returns `0`.
/// @param state Mutable record or buffer; this call updates `state.events`.
/// @param mode Input used by `state.events=state.events+[["mode",mode,fullscreen]]`.
/// @param fullscreen Input used by `state.events=state.events+[["mode",mode,fullscreen]]`.
function GLW_SetMode(state,mode,fullscreen) state.events=state.events+[["mode",mode,fullscreen]];return 0 end function
/// Returns `true` from `mq3.platform.unix_runtime.GLW_StartDriverAndSetMode`; earlier branches return `false`.
/// @param state Value forwarded as `state` to `mq3.platform.unix_runtime.GLimp_Init`.
/// @param driver Input tested by `driver==""`.
/// @param mode Value forwarded as `mode` to `mq3.platform.unix_runtime.GLW_SetMode`.
/// @param fullscreen Value forwarded as `fullscreen` to `mq3.platform.unix_runtime.GLW_SetMode`.
function GLW_StartDriverAndSetMode(state,driver,mode,fullscreen) if driver=="" then return false end if;GLimp_Init(state);GLW_SetMode(state,mode,fullscreen);return true end function
/// Calls `mq3.platform.unix_runtime.GLW_StartDriverAndSetMode` with `(state,driver,3,false)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.platform.unix_runtime.GLW_StartDriverAndSetMode`.
/// @param driver Value forwarded as `driver` to `mq3.platform.unix_runtime.GLW_StartDriverAndSetMode`.
function GLW_LoadOpenGL(state,driver) return GLW_StartDriverAndSetMode(state,driver,3,false) end function
/// Updates `state.events` in `mq3.platform.unix_runtime.GLW_InitExtensions`.
/// @param state Mutable record or buffer; this call updates `state.events`.
/// @param text Input used by `state.events=state.events+[["extensions",text]]`.
function GLW_InitExtensions(state,text) state.events=state.events+[["extensions",text]];return void end function
/// Updates `state.gamma` in `mq3.platform.unix_runtime.GLW_InitGamma`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.gamma`.
function GLW_InitGamma(state) state.gamma=[[],[],[]];return true end function
/// Returns `1` for the `mq3.platform.unix_runtime.CreateNullCursor` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function CreateNullCursor(state) return 1 end function
/// Calls `len` with `(state.events)` and returns its result.
/// @param state Record providing `state.events`.
function HandleEvents(state) return len(state.events) end function
/// Updates `state.active` in `mq3.platform.unix_runtime.install_grabs`.
/// @param state Mutable record or buffer; this call updates `state.active`.
function install_grabs(state) state.active=true;return void end function
/// Updates `state.active` in `mq3.platform.unix_runtime.uninstall_grabs`.
/// @param state Mutable record or buffer; this call updates `state.active`.
function uninstall_grabs(state) state.active=false;return void end function
/// Updates `state.active` in `mq3.platform.unix_runtime.IN_Activate`.
/// @param state Mutable record or buffer; this call updates `state.active`.
/// @param active Value assigned to `state.active`.
function IN_Activate(state,active) state.active=active;return void end function
/// Updates `state.active` in `mq3.platform.unix_runtime.IN_ActivateMouse`.
/// @param state Mutable record or buffer; this call updates `state.active`.
function IN_ActivateMouse(state) state.active=true;return void end function
/// Updates `state.active` in `mq3.platform.unix_runtime.IN_DeactivateMouse`.
/// @param state Mutable record or buffer; this call updates `state.active`.
function IN_DeactivateMouse(state) state.active=false;return void end function
/// Updates `state.inputInitialized` in `mq3.platform.unix_runtime.IN_Init`.
/// @param state Mutable record or buffer; this call updates `state.inputInitialized`.
function IN_Init(state) state.inputInitialized=true;return void end function
/// Updates `state.inputInitialized` in `mq3.platform.unix_runtime.IN_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.inputInitialized`.
function IN_Shutdown(state) state.inputInitialized=false;return void end function
/// Computes `state.inputInitialized` for `mq3.platform.unix_runtime.IN_Frame`.
/// @param state Record providing `state.inputInitialized`.
function IN_Frame(state) return state.inputInitialized end function
/// Updates `state.joystickInitialized` in `mq3.platform.unix_runtime.IN_StartupJoystick`.
/// @param state Mutable record or buffer; this call updates `state.joystickInitialized`.
function IN_StartupJoystick(state) state.joystickInitialized=true;return void end function
/// Updates `state.events` in `mq3.platform.unix_runtime.IN_JoyMove`.
/// @param state Mutable record or buffer; this call updates `state.events`.
/// @param axes Input tested by `state.joystickInitialized`.
function IN_JoyMove(state,axes) if state.joystickInitialized then state.events=state.events+[["joystick",axes]] end if;return void end function
/// Calls `mq3.platform.unix_runtime.IN_Init` with `(state)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.platform.unix_runtime.IN_Init`.
function KBD_Init(state) return IN_Init(state) end function
/// Calls `mq3.platform.unix_runtime.IN_Shutdown` with `(state)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.platform.unix_runtime.IN_Shutdown`.
function KBD_Close(state) return IN_Shutdown(state) end function
/// Calls `mq3.platform.unix_runtime.HandleEvents` with `(state)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.platform.unix_runtime.HandleEvents`.
function Sys_SendKeyEvents(state) return HandleEvents(state) end function
/// Computes `len(state.events)>0` for `mq3.platform.unix_runtime.X11_PendingInput`.
/// @param state Record providing `state.events`.
function X11_PendingInput(state) return len(state.events)>0 end function
/// Computes `key` for `mq3.platform.unix_runtime.XLateKey`.
/// @param state Unused compatibility argument retained by this entry point.
/// @param key Input used in the result expression `key`.
function XLateKey(state,key) return key end function
/// Returns `false` for the `mq3.platform.unix_runtime.repeated_press` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param key Unused compatibility argument retained by this entry point.
/// @param time Unused compatibility argument retained by this entry point.
function repeated_press(state,key,time) return false end function
/// Updates `state.warnings` in `mq3.platform.unix_runtime.qXErrorHandler`; returns `0`.
/// @param state Mutable record or buffer; this call updates `state.warnings`.
/// @param code Input used by `state.warnings=state.warnings+["X11 error "+str(code)]`.
function qXErrorHandler(state,code) state.warnings=state.warnings+["X11 error "+str(code)];return 0 end function
/// Computes `callback!=void` for `mq3.platform.unix_runtime.GLimp_SpawnRenderThread`.
/// @param state Unused compatibility argument retained by this entry point.
/// @param callback Input used in the result expression `callback!=void`.
function GLimp_SpawnRenderThread(state,callback) return callback!=void end function
/// Returns `void` from `mq3.platform.unix_runtime.GLimp_RenderThreadWrapper`.
/// @param state Unused compatibility argument retained by this entry point.
/// @param callback Input tested by `callback!=void`.
/// @param context Argument 1 supplied to `callback`.
function GLimp_RenderThreadWrapper(state,callback,context) if callback!=void then callback(context) end if;return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.GLimp_RendererSleep` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function GLimp_RendererSleep(state) return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.GLimp_FrontEndSleep` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function GLimp_FrontEndSleep(state) return void end function
/// Computes `data` for `mq3.platform.unix_runtime.GLimp_WakeRenderer`.
/// @param state Unused compatibility argument retained by this entry point.
/// @param data Input used in the result expression `data`.
function GLimp_WakeRenderer(state,data) return data end function

/// Updates `state.glInitialized`, `state.events` in `mq3.platform.unix_runtime.QGL_Init`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.glInitialized`, `state.events`.
/// @param driver Input tested by `driver==""`.
function QGL_Init(state,driver) if driver=="" then return false end if;state.glInitialized=true;state.events=state.events+[["qgl-init",driver]];return true end function
/// Updates `state.glInitialized`, `state.logging` in `mq3.platform.unix_runtime.QGL_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.glInitialized`, `state.logging`.
function QGL_Shutdown(state) state.glInitialized=false;state.logging=false;return void end function
/// Updates `state.logging` in `mq3.platform.unix_runtime.QGL_EnableLogging`; returns `enabled`.
/// @param state Mutable record or buffer; this call updates `state.logging`.
/// @param enabled Value assigned to `state.logging`.
function QGL_EnableLogging(state,enabled) state.logging=enabled;return enabled end function
/// Updates `state.events` in `mq3.platform.unix_runtime.GLimp_LogNewFrame`.
/// @param state Mutable record or buffer; this call updates `state.events`.
function GLimp_LogNewFrame(state) if state.logging then state.events=state.events+[["gl-frame"]] end if;return void end function
/// Updates `state.events` in `mq3.platform.unix_runtime.qglDispatch`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.events`.
/// @param name Input used by `state.events=state.events+[[name,arguments]]`.
/// @param arguments Input used by `state.events=state.events+[[name,arguments]]`.
function qglDispatch(state,name,arguments) if not state.glInitialized then return false end if;state.events=state.events+[[name,arguments]];return true end function
/// Returns `1` from `mq3.platform.unix_runtime.qwglGetProcAddress`; earlier branches return `0`.
/// @param state Record providing `state.glInitialized`.
/// @param name Unused compatibility argument retained by this entry point.
function qwglGetProcAddress(state,name) if not state.glInitialized then return 0 end if;return 1 end function

/// Updates `state.signals` in `mq3.platform.unix_runtime.InitSig`.
/// @param state Mutable record or buffer; this call updates `state.signals`.
function InitSig(state) state.signals=true;return void end function
/// Updates `state.errors` in `mq3.platform.unix_runtime.signal_handler`; returns `error(7981,"Unix signal "+str(signal))`.
/// @param state Mutable record or buffer; this call updates `state.errors`.
/// @param signal Input used by `state.errors=state.errors+["signal "+str(signal)]`.
function signal_handler(state,signal) state.errors=state.errors+["signal "+str(signal)];return error(7981,"Unix signal "+str(signal)) end function
/// Updates `state.soundInitialized` in `mq3.platform.unix_runtime.SNDDMA_Init`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.soundInitialized`.
function SNDDMA_Init(state) state.soundInitialized=true;return true end function
/// Returns `0` for the `mq3.platform.unix_runtime.SNDDMA_GetDMAPos` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function SNDDMA_GetDMAPos(state) return 0 end function
/// Computes `state.soundInitialized` for `mq3.platform.unix_runtime.SNDDMA_BeginPainting`.
/// @param state Record providing `state.soundInitialized`.
function SNDDMA_BeginPainting(state) return state.soundInitialized end function
/// Computes `state.soundInitialized` for `mq3.platform.unix_runtime.SNDDMA_Submit`.
/// @param state Record providing `state.soundInitialized`.
function SNDDMA_Submit(state) return state.soundInitialized end function
/// Updates `state.soundInitialized` in `mq3.platform.unix_runtime.SNDDMA_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.soundInitialized`.
function SNDDMA_Shutdown(state) state.soundInitialized=false;return void end function
/// Calls `mq3.platform.unix_runtime.Com_Memset` with `(destination,0,value,count)` and returns its result.
/// @param destination Value forwarded as `destination` to `mq3.platform.unix_runtime.Com_Memset`.
/// @param value Value forwarded as `value` to `mq3.platform.unix_runtime.Com_Memset`.
/// @param count Value forwarded as `count` to `mq3.platform.unix_runtime.Com_Memset`.
function Snd_Memset(destination,value,count) return Com_Memset(destination,0,value,count) end function

/// Updates `state.history`, `state.historyCursor` in `mq3.platform.unix_runtime.Hist_Add`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.history`, `state.historyCursor`.
/// @param text Input tested by `text==""`.
function Hist_Add(state,text) if text=="" then return false end if;state.history=state.history+[text];state.historyCursor=len(state.history);return true end function
/// Updates `state.historyCursor` in `mq3.platform.unix_runtime.Hist_Prev`; returns `state.history[state.historyCursor]`.
/// @param state Mutable record or buffer; this call updates `state.historyCursor`.
function Hist_Prev(state) if len(state.history)==0 then return "" end if;if state.historyCursor>0 then state.historyCursor=state.historyCursor-1 end if;return state.history[state.historyCursor] end function
/// Updates `state.historyCursor` in `mq3.platform.unix_runtime.Hist_Next`; returns `""`.
/// @param state Mutable record or buffer; this call updates `state.historyCursor`.
function Hist_Next(state) if len(state.history)==0 then return "" end if;if state.historyCursor<len(state.history)-1 then state.historyCursor=state.historyCursor+1;return state.history[state.historyCursor] end if;state.historyCursor=len(state.history);return "" end function
/// Calls `mq3.platform.unix_runtime.Hist_Prev` with `(state)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.platform.unix_runtime.Hist_Prev`.
function tty_Back(state) return Hist_Prev(state) end function
/// Updates `state.historyCursor` in `mq3.platform.unix_runtime.tty_FlushIn`.
/// @param state Mutable record or buffer; this call updates `state.historyCursor`.
function tty_FlushIn(state) state.historyCursor=len(state.history);return void end function
/// Updates `state.active` in `mq3.platform.unix_runtime.tty_Hide`.
/// @param state Mutable record or buffer; this call updates `state.active`.
function tty_Hide(state) state.active=false;return void end function
/// Updates `state.active` in `mq3.platform.unix_runtime.tty_Show`.
/// @param state Mutable record or buffer; this call updates `state.active`.
function tty_Show(state) state.active=true;return void end function
/// Returns `true` for the `mq3.platform.unix_runtime.Sys_ConsoleInputInit` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_ConsoleInputInit(state) return true end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_ConsoleInputShutdown` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_ConsoleInputShutdown(state) return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_ConsoleInput` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_ConsoleInput(state) return void end function
/// Updates `state.events` in `mq3.platform.unix_runtime.Sys_Print`.
/// @param state Mutable record or buffer; this call updates `state.events`.
/// @param text Input used by `state.events=state.events+[["print",text]]`.
function Sys_Print(state,text) state.events=state.events+[["print",text]];return void end function
/// Calls `mq3.platform.unix_runtime.Sys_Print` with `(state,text)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.platform.unix_runtime.Sys_Print`.
/// @param text Value forwarded as `text` to `mq3.platform.unix_runtime.Sys_Print`.
function Sys_Printf(state,text) return Sys_Print(state,text) end function
/// Updates `state.warnings` in `mq3.platform.unix_runtime.Sys_Warn`.
/// @param state Mutable record or buffer; this call updates `state.warnings`.
/// @param text Input used by `state.warnings=state.warnings+[text]`.
function Sys_Warn(state,text) state.warnings=state.warnings+[text];return void end function
/// Updates `state.errors` in `mq3.platform.unix_runtime.Sys_Error`; returns `error(7981,text)`.
/// @param state Mutable record or buffer; this call updates `state.errors`.
/// @param text Argument 2 supplied to `error`.
function Sys_Error(state,text) state.errors=state.errors+[text];return error(7981,text) end function
/// Updates `state.quitRequested` in `mq3.platform.unix_runtime.Sys_Quit`.
/// @param state Mutable record or buffer; this call updates `state.quitRequested`.
function Sys_Quit(state) state.quitRequested=true;return void end function
/// Updates `state.quitRequested` in `mq3.platform.unix_runtime.Sys_Exit`; returns `code`.
/// @param state Mutable record or buffer; this call updates `state.quitRequested`.
/// @param code Input used in the result expression `code`.
function Sys_Exit(state,code) state.quitRequested=true;return code end function
/// Computes `state` for `mq3.platform.unix_runtime.Sys_Init`.
/// @param state Input used in the result expression `state`.
function Sys_Init(state) return state end function
/// Returns `true` for the `mq3.platform.unix_runtime.Sys_ConfigureFPU` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_ConfigureFPU(state) return true end function
/// Returns `void` for the `mq3.platform.unix_runtime.floating_point_exception_handler` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function floating_point_exception_handler(state) return void end function
/// Returns `false` for the `mq3.platform.unix_runtime.Sys_LowPhysicalMemory` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_LowPhysicalMemory(state) return false end function
/// Returns `false` for the `mq3.platform.unix_runtime.Sys_MonkeyShouldBeSpanked` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_MonkeyShouldBeSpanked(state) return false end function
/// Returns `true` for the `mq3.platform.unix_runtime.Sys_CheckCD` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_CheckCD(state) return true end function
/// Updates `state.active` in `mq3.platform.unix_runtime.Sys_AppActivate`.
/// @param state Mutable record or buffer; this call updates `state.active`.
function Sys_AppActivate(state) state.active=true;return void end function
/// Updates `state.inputInitialized` in `mq3.platform.unix_runtime.Sys_In_Restart_f`.
/// @param state Mutable record or buffer; this call updates `state.inputInitialized`.
function Sys_In_Restart_f(state) state.inputInitialized=false;state.inputInitialized=true;return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_BeginProfiling` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_BeginProfiling(state) return void end function
/// Computes `"MiniQuake3"` for `mq3.platform.unix_runtime.Sys_PrintBinVersion`.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_PrintBinVersion(state) return "MiniQuake3" end function
/// Computes `args` for `mq3.platform.unix_runtime.Sys_ParseArgs`.
/// @param state Unused compatibility argument retained by this entry point.
/// @param args Input used in the result expression `args`.
function Sys_ParseArgs(state,args) return args end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_GetClipboardData` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_GetClipboardData(state) return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_LoadDll` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param name Unused compatibility argument retained by this entry point.
function Sys_LoadDll(state,name) return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_UnloadDll` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param handle Unused compatibility argument retained by this entry point.
function Sys_UnloadDll(state,handle) return void end function
/// Computes `left==right` for `mq3.platform.unix_runtime.Sys_FunctionCmp`.
/// @param left Input used in the result expression `left==right`.
/// @param right Input used in the result expression `left==right`.
function Sys_FunctionCmp(left,right) return left==right end function
/// Computes `value` for `mq3.platform.unix_runtime.Sys_FunctionCheckSum`.
/// @param value Input used in the result expression `value`.
function Sys_FunctionCheckSum(value) return value end function
/// Returns `-1` for the `mq3.platform.unix_runtime.Sys_FileTime` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param path Unused compatibility argument retained by this entry point.
function Sys_FileTime(state,path) return -1 end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_BeginStreamedFile` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param file Unused compatibility argument retained by this entry point.
/// @param readAhead Unused compatibility argument retained by this entry point.
function Sys_BeginStreamedFile(state,file,readAhead) return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_EndStreamedFile` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param file Unused compatibility argument retained by this entry point.
function Sys_EndStreamedFile(state,file) return void end function
/// Returns `0` for the `mq3.platform.unix_runtime.Sys_StreamedRead` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param buffer Unused compatibility argument retained by this entry point.
/// @param size Unused compatibility argument retained by this entry point.
/// @param count Unused compatibility argument retained by this entry point.
/// @param file Unused compatibility argument retained by this entry point.
function Sys_StreamedRead(state,buffer,size,count,file) return 0 end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_StreamSeek` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param file Unused compatibility argument retained by this entry point.
/// @param offset Unused compatibility argument retained by this entry point.
/// @param origin Unused compatibility argument retained by this entry point.
function Sys_StreamSeek(state,file,offset,origin) return void end function
/// Returns `true` for the `mq3.platform.unix_runtime.Sys_InitStreamThread` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_InitStreamThread(state) return true end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_ShutdownStreamThread` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_ShutdownStreamThread(state) return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_StreamThread` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_StreamThread(state) return void end function
/// Updates `state.systemEvents` in `mq3.platform.unix_runtime.Sys_QueEvent`.
/// @param state Mutable record or buffer; this call updates `state.systemEvents`.
/// @param time Value used for `mq3.platform.unix_runtime.Event.time`.
/// @param kind Value used for `mq3.platform.unix_runtime.Event.kind`.
/// @param value1 Value used for `mq3.platform.unix_runtime.Event.value1`.
/// @param value2 Value used for `mq3.platform.unix_runtime.Event.value2`.
function Sys_QueEvent(state,time,kind,value1,value2) state.systemEvents=state.systemEvents+[Event(kind,value1,value2,time)];return void end function
/// Updates `state.systemEvents` in `mq3.platform.unix_runtime.Sys_GetEvent`; returns `value`.
/// @param state Mutable record or buffer; this call updates `state.systemEvents`.
function Sys_GetEvent(state) if len(state.systemEvents)==0 then return Event(0,0,0,state.currentTime) end if;value=state.systemEvents[0];kept=[];if len(state.systemEvents)>1 then for index=1 to len(state.systemEvents)-1 kept=kept+[state.systemEvents[index]] end for end if;state.systemEvents=kept;return value end function

/// Builds `mq3.platform.unix_runtime.Address` for `mq3.platform.unix_runtime.Sys_StringToSockaddr`.
/// @param text Argument 1 supplied to `std.string.split`.
/// @param defaultPort Input used by `port=defaultPort`.
function Sys_StringToSockaddr(text,defaultPort)
  parts=strings.split(text,":");host=parts[0];port=defaultPort;if len(parts)>1 then port=toNumber(parts[1]) end if
  if host=="localhost" then return Address(NA_LOOPBACK,host,port) end if
  octets=strings.split(host,".");if len(octets)!=4 then return void end if;return Address(NA_IP,host,port)
end function
/// Calls `mq3.platform.unix_runtime.Sys_StringToSockaddr` with `(text,27960)` and returns its result.
/// @param text Value forwarded as `text` to `mq3.platform.unix_runtime.Sys_StringToSockaddr`.
function Sys_StringToAdr(text) return Sys_StringToSockaddr(text,27960) end function
/// Computes `address` for `mq3.platform.unix_runtime.NetadrToSockadr`.
/// @param address Input used in the result expression `address`.
function NetadrToSockadr(address) return address end function
/// Computes `address` for `mq3.platform.unix_runtime.SockadrToNetadr`.
/// @param address Input used in the result expression `address`.
function SockadrToNetadr(address) return address end function
/// Computes `address.host` for `mq3.platform.unix_runtime.NET_BaseAdrToString`.
/// @param address Record providing `address.host`.
function NET_BaseAdrToString(address) return address.host end function
/// Computes `"network error "+str(code)` for `mq3.platform.unix_runtime.NET_ErrorString`.
/// @param code Input used in the result expression `"network error "+str(code)`.
function NET_ErrorString(code) return "network error "+str(code) end function
/// Returns `1` from `mq3.platform.unix_runtime.NET_IPSocket`; earlier branches return `-1`.
/// @param interfaceName Unused compatibility argument retained by this entry point.
/// @param port Input tested by `port<0 or port>65535`.
function NET_IPSocket(interfaceName,port) if port<0 or port>65535 then return -1 end if;return 1 end function
/// Returns `true` for the `mq3.platform.unix_runtime.NET_Init` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function NET_Init(state) return true end function
/// Returns `true` for the `mq3.platform.unix_runtime.NET_OpenIP` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function NET_OpenIP(state) return true end function
/// Updates `state.packets` in `mq3.platform.unix_runtime.NET_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.packets`.
function NET_Shutdown(state) state.packets=[];return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.NET_Sleep` compatibility entry point.
/// @param msec Unused compatibility argument retained by this entry point.
function NET_Sleep(msec) return void end function
/// Constructs `mq3.platform.unix_runtime.Address` with `type` = `NA_LOOPBACK`, `host` = `"localhost"`, `port` = `0`.
/// @param state Unused compatibility argument retained by this entry point.
function NET_GetLocalAddress(state) return Address(NA_LOOPBACK,"localhost",0) end function
/// Computes `address!=void and (address.type==NA_LOOPBACK or strings.indexOf(address.host,"192.168.",0)==0 or strings.indexOf(address.host,"10.",0)==0)` for `mq3.platform.unix_runtime.Sys_IsLANAddress`.
/// @param address Record providing `address.type`, `address.host`.
function Sys_IsLANAddress(address) return address!=void and (address.type==NA_LOOPBACK or strings.indexOf(address.host,"192.168.",0)==0 or strings.indexOf(address.host,"10.",0)==0) end function
/// Updates `state.packets` in `mq3.platform.unix_runtime.Sys_SendPacket`.
/// @param state Mutable record or buffer; this call updates `state.packets`.
/// @param length Input used by `count=length`.
/// @param data Argument 1 supplied to `slice`.
/// @param address Input used by `state.packets=state.packets+[[address,slice(data,0,count)]]`.
function Sys_SendPacket(state,length,data,address) count=length;if count>len(data) then count=len(data) end if;state.packets=state.packets+[[address,slice(data,0,count)]];return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_GetPacket` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_GetPacket(state) return void end function
/// Lists the 1 declared names for `mq3.platform.unix_runtime.Sys_ShowIP`, including `127.0.0.1`.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_ShowIP(state) return ["127.0.0.1"] end function

/// Computes `state.paths[0]` for `mq3.platform.unix_runtime.Sys_Cwd`.
/// @param state Record providing `state.paths`.
function Sys_Cwd(state) return state.paths[0] end function
/// Computes `state.paths[1]` for `mq3.platform.unix_runtime.Sys_DefaultCDPath`.
/// @param state Record providing `state.paths`.
function Sys_DefaultCDPath(state) return state.paths[1] end function
/// Computes `state.paths[2]` for `mq3.platform.unix_runtime.Sys_DefaultHomePath`.
/// @param state Record providing `state.paths`.
function Sys_DefaultHomePath(state) return state.paths[2] end function
/// Computes `state.paths[3]` for `mq3.platform.unix_runtime.Sys_DefaultInstallPath`.
/// @param state Record providing `state.paths`.
function Sys_DefaultInstallPath(state) return state.paths[3] end function
/// Updates `state.paths[1]` in `mq3.platform.unix_runtime.Sys_SetDefaultCDPath`.
/// @param state Mutable record or buffer; this call updates `state.paths[1]`.
/// @param value Value assigned to `state.paths[1]`.
function Sys_SetDefaultCDPath(state,value) state.paths[1]=value;return void end function
/// Updates `state.paths[2]` in `mq3.platform.unix_runtime.Sys_SetDefaultHomePath`.
/// @param state Mutable record or buffer; this call updates `state.paths[2]`.
/// @param value Value assigned to `state.paths[2]`.
function Sys_SetDefaultHomePath(state,value) state.paths[2]=value;return void end function
/// Updates `state.paths[3]` in `mq3.platform.unix_runtime.Sys_SetDefaultInstallPath`.
/// @param state Mutable record or buffer; this call updates `state.paths[3]`.
/// @param value Value assigned to `state.paths[3]`.
function Sys_SetDefaultInstallPath(state,value) state.paths[3]=value;return void end function
/// Computes `state.user` for `mq3.platform.unix_runtime.Sys_GetCurrentUser`.
/// @param state Record providing `state.user`.
function Sys_GetCurrentUser(state) return state.user end function
/// Returns `1` for the `mq3.platform.unix_runtime.Sys_ProcessorCount` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_ProcessorCount(state) return 1 end function
/// Computes `state.currentTime` for `mq3.platform.unix_runtime.Sys_Milliseconds`.
/// @param state Record providing `state.currentTime`.
function Sys_Milliseconds(state) return state.currentTime end function
/// Computes `time` for `mq3.platform.unix_runtime.Sys_XTimeToSysTime`.
/// @param state Unused compatibility argument retained by this entry point.
/// @param time Input used in the result expression `time`.
function Sys_XTimeToSysTime(state,time) return time end function
/// Returns `true` for the `mq3.platform.unix_runtime.Sys_Mkdir` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param path Unused compatibility argument retained by this entry point.
function Sys_Mkdir(state,path) return true end function
/// Returns `[]` for the `mq3.platform.unix_runtime.Sys_ListFiles` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param directory Unused compatibility argument retained by this entry point.
/// @param extension Unused compatibility argument retained by this entry point.
function Sys_ListFiles(state,directory,extension) return [] end function
/// Returns `[]` for the `mq3.platform.unix_runtime.Sys_ListFilteredFiles` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param directory Unused compatibility argument retained by this entry point.
/// @param extension Unused compatibility argument retained by this entry point.
/// @param filter Unused compatibility argument retained by this entry point.
function Sys_ListFilteredFiles(state,directory,extension,filter) return [] end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_FreeFileList` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param list Unused compatibility argument retained by this entry point.
function Sys_FreeFileList(state,list) return void end function
/// Returns `void` for the `mq3.platform.unix_runtime.Sys_ShowConsole` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
/// @param level Unused compatibility argument retained by this entry point.
/// @param quitOnClose Unused compatibility argument retained by this entry point.
function Sys_ShowConsole(state,level,quitOnClose) return void end function
/// Returns `0` for the `mq3.platform.unix_runtime.Sys_GetProcessorId` compatibility entry point.
/// @param state Unused compatibility argument retained by this entry point.
function Sys_GetProcessorId(state) return 0 end function
/// Returns `[n.trunc32(value[0]),n.trunc32(value[1]),n.trunc32(value[2])]` for `mq3.platform.unix_runtime.Sys_SnapVector`.
/// @param value Three-component vector read at indices 0, 1, and 2.
function Sys_SnapVector(value) return [n.trunc32(value[0]),n.trunc32(value[1]),n.trunc32(value[2])] end function
/// Calls `mq3.compat.numeric.trunc32` with `(value)` and returns its result.
/// @param value Argument 1 supplied to `mq3.compat.numeric.trunc32`.
function fastftol(value) return n.trunc32(value) end function
/// Calls `std.string.toLowerAscii` with `(value)` and returns its result.
/// @param value Argument 1 supplied to `std.string.toLowerAscii`.
function strlwr(value) return strings.toLowerAscii(value) end function

/// Calls `mq3.vm.jit_compat.VM_Compile` with `(image,callback,"x86")` and returns its result.
/// @param image Argument 1 supplied to `mq3.vm.jit_compat.VM_Compile`.
/// @param callback Argument 2 supplied to `mq3.vm.jit_compat.VM_Compile`.
function VM_Compile(image,callback) return jit.VM_Compile(image,callback,"x86") end function
/// Calls `mq3.vm.jit_compat.VM_CallCompiled` with `(compiled,args)` and returns its result.
/// @param compiled Argument 1 supplied to `mq3.vm.jit_compat.VM_CallCompiled`.
/// @param args Argument 2 supplied to `mq3.vm.jit_compat.VM_CallCompiled`.
function VM_CallCompiled(compiled,args) return jit.VM_CallCompiled(compiled,args) end function

/// Returns `state` from `mq3.platform.unix_runtime.unixMain`.
/// @param state Record providing `state.quitRequested`.
/// @param frameCount Input used by `for index=0 to frameCount-1 if state.quitRequested then break`.
/// @param frameFn Input used by `frameFn(context)`.
/// @param context Argument 1 supplied to `frameFn`.
function unixMain(state,frameCount,frameFn,context) for index=0 to frameCount-1 if state.quitRequested then break end if;frameFn(context) end for;return state end function

