// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Portable Unix/Linux platform ownership facade.
package mq3.platform.unix_runtime

import mq3.compat.numeric as n
import mq3.vm.jit_compat as jit
import std.string as strings

function linuxCommonSymbols() return ["Com_Memcpy","Com_Memset","Com_Prefetch","_copyDWord"] end function
function linuxGlimpSymbols() return ["CreateNullCursor","GLW_InitExtensions","GLW_InitGamma","GLW_LoadOpenGL","GLW_SetMode","GLW_StartDriverAndSetMode","GLimp_EndFrame","GLimp_FrontEndSleep","GLimp_Init","GLimp_LogComment","GLimp_RenderThreadWrapper","GLimp_RendererSleep","GLimp_SetGamma","GLimp_Shutdown","GLimp_SpawnRenderThread","GLimp_WakeRenderer","HandleEvents","IN_Activate","IN_ActivateMouse","IN_DeactivateMouse","IN_Frame","IN_Init","IN_JoyMove","IN_Shutdown","IN_StartupJoystick","KBD_Close","KBD_Init","Q_stristr","Sys_SendKeyEvents","X11_PendingInput","XLateKey","install_grabs","qXErrorHandler","repeated_press","uninstall_grabs"] end function
function linuxJoystickSymbols() return ["IN_JoyMove","IN_StartupJoystick"] end function
function linuxLocalSymbols() return [] end function
function linuxQglSymbols() return ["GLimp_LogNewFrame","QGL_EnableLogging","QGL_Init","QGL_Shutdown","logAccum","logAlphaFunc","logAreTexturesResident","logArrayElement","logBegin","logBindTexture","logBitmap","logBlendFunc","logCallList","logCallLists","logClear","logClearAccum","logClearColor","logClearDepth","logClearIndex","logClearStencil","logClipPlane","logColor3b","logColor3bv","logColor3d","logColor3dv","logColor3f","logColor3fv","logColor3i","logColor3iv","logColor3s","logColor3sv","logColor3ub","logColor3ubv","logColor3ui","logColor3uiv","logColor3us","logColor3usv","logColor4b","logColor4bv","logColor4d","logColor4dv","logColor4f","logColor4fv","logColor4i","logColor4iv","logColor4s","logColor4sv","logColor4ub","logColor4ubv","logColor4ui","logColor4uiv","logColor4us","logColor4usv","logColorMask","logColorMaterial","logColorPointer","logCopyPixels","logCopyTexImage1D","logCopyTexImage2D","logCopyTexSubImage1D","logCopyTexSubImage2D","logCullFace","logDeleteLists","logDeleteTextures","logDepthFunc","logDepthMask","logDepthRange","logDisable","logDisableClientState","logDrawArrays","logDrawBuffer","logDrawElements","logDrawPixels","logEdgeFlag","logEdgeFlagPointer","logEdgeFlagv","logEnable","logEnableClientState","logEnd","logEndList","logEvalCoord1d","logEvalCoord1dv","logEvalCoord1f","logEvalCoord1fv","logEvalCoord2d","logEvalCoord2dv","logEvalCoord2f","logEvalCoord2fv","logEvalMesh1","logEvalMesh2","logEvalPoint1","logEvalPoint2","logFeedbackBuffer","logFinish","logFlush","logFogf","logFogfv","logFogi","logFogiv","logFrontFace","logFrustum","logGenLists","logGenTextures","logGetBooleanv","logGetClipPlane","logGetDoublev","logGetError","logGetFloatv","logGetIntegerv","logGetLightfv","logGetLightiv","logGetMapdv","logGetMapfv","logGetMapiv","logGetMaterialfv","logGetMaterialiv","logGetPixelMapfv","logGetPixelMapuiv","logGetPixelMapusv","logGetPointerv","logGetPolygonStipple","logGetString","logGetTexEnvfv","logGetTexEnviv","logGetTexGendv","logGetTexGenfv","logGetTexGeniv","logGetTexImage","logGetTexLevelParameterfv","logGetTexLevelParameteriv","logGetTexParameterfv","logGetTexParameteriv","logHint","logIndexMask","logIndexPointer","logIndexd","logIndexdv","logIndexf","logIndexfv","logIndexi","logIndexiv","logIndexs","logIndexsv","logIndexub","logIndexubv","logInitNames","logInterleavedArrays","logIsEnabled","logIsList","logIsTexture","logLightModelf","logLightModelfv","logLightModeli","logLightModeliv","logLightf","logLightfv","logLighti","logLightiv","logLineStipple","logLineWidth","logListBase","logLoadIdentity","logLoadMatrixd","logLoadMatrixf","logLoadName","logLogicOp","logMap1d","logMap1f","logMap2d","logMap2f","logMapGrid1d","logMapGrid1f","logMapGrid2d","logMapGrid2f","logMaterialf","logMaterialfv","logMateriali","logMaterialiv","logMatrixMode","logMultMatrixd","logMultMatrixf","logNewList","logNormal3b","logNormal3bv","logNormal3d","logNormal3dv","logNormal3f","logNormal3fv","logNormal3i","logNormal3iv","logNormal3s","logNormal3sv","logNormalPointer","logOrtho","logPassThrough","logPixelMapfv","logPixelMapuiv","logPixelMapusv","logPixelStoref","logPixelStorei","logPixelTransferf","logPixelTransferi","logPixelZoom","logPointSize","logPolygonMode","logPolygonOffset","logPolygonStipple","logPopAttrib","logPopClientAttrib","logPopMatrix","logPopName","logPrioritizeTextures","logPushAttrib","logPushClientAttrib","logPushMatrix","logPushName","logRasterPos2d","logRasterPos2dv","logRasterPos2f","logRasterPos2fv","logRasterPos2i","logRasterPos2iv","logRasterPos2s","logRasterPos2sv","logRasterPos3d","logRasterPos3dv","logRasterPos3f","logRasterPos3fv","logRasterPos3i","logRasterPos3iv","logRasterPos3s","logRasterPos3sv","logRasterPos4d","logRasterPos4dv","logRasterPos4f","logRasterPos4fv","logRasterPos4i","logRasterPos4iv","logRasterPos4s","logRasterPos4sv","logReadBuffer","logReadPixels","logRectd","logRectdv","logRectf","logRectfv","logRecti","logRectiv","logRects","logRectsv","logRenderMode","logRotated","logRotatef","logScaled","logScalef","logScissor","logSelectBuffer","logShadeModel","logStencilFunc","logStencilMask","logStencilOp","logTexCoord1d","logTexCoord1dv","logTexCoord1f","logTexCoord1fv","logTexCoord1i","logTexCoord1iv","logTexCoord1s","logTexCoord1sv","logTexCoord2d","logTexCoord2dv","logTexCoord2f","logTexCoord2fv","logTexCoord2i","logTexCoord2iv","logTexCoord2s","logTexCoord2sv","logTexCoord3d","logTexCoord3dv","logTexCoord3f","logTexCoord3fv","logTexCoord3i","logTexCoord3iv","logTexCoord3s","logTexCoord3sv","logTexCoord4d","logTexCoord4dv","logTexCoord4f","logTexCoord4fv","logTexCoord4i","logTexCoord4iv","logTexCoord4s","logTexCoord4sv","logTexCoordPointer","logTexEnvf","logTexEnvfv","logTexEnvi","logTexEnviv","logTexGend","logTexGendv","logTexGenf","logTexGenfv","logTexGeni","logTexGeniv","logTexImage1D","logTexImage2D","logTexParameterf","logTexParameterfv","logTexParameteri","logTexParameteriv","logTexSubImage1D","logTexSubImage2D","logTranslated","logTranslatef","logVertex2d","logVertex2dv","logVertex2f","logVertex2fv","logVertex2i","logVertex2iv","logVertex2s","logVertex2sv","logVertex3d","logVertex3dv","logVertex3f","logVertex3fv","logVertex3i","logVertex3iv","logVertex3s","logVertex3sv","logVertex4d","logVertex4dv","logVertex4f","logVertex4fv","logVertex4i","logVertex4iv","logVertex4s","logVertex4sv","logVertexPointer","logViewport","qwglGetProcAddress"] end function
function linuxSignalsSymbols() return ["InitSig","signal_handler"] end function
function linuxSoundSymbols() return ["SNDDMA_BeginPainting","SNDDMA_GetDMAPos","SNDDMA_Init","SNDDMA_Shutdown","SNDDMA_Submit","Snd_Memset"] end function
function qasmSymbols() return [] end function
function unixGlwSymbols() return [] end function
function unixMainSymbols() return ["Hist_Add","Hist_Next","Hist_Prev","Sys_AppActivate","Sys_BeginProfiling","Sys_BeginStreamedFile","Sys_CheckCD","Sys_ConfigureFPU","Sys_ConsoleInput","Sys_ConsoleInputInit","Sys_ConsoleInputShutdown","Sys_EndStreamedFile","Sys_Error","Sys_Exit","Sys_FileTime","Sys_FunctionCheckSum","Sys_FunctionCmp","Sys_GetClipboardData","Sys_GetEvent","Sys_In_Restart_f","Sys_Init","Sys_InitStreamThread","Sys_LoadDll","Sys_LowPhysicalMemory","Sys_MonkeyShouldBeSpanked","Sys_ParseArgs","Sys_Print","Sys_PrintBinVersion","Sys_Printf","Sys_QueEvent","Sys_Quit","Sys_ShutdownStreamThread","Sys_StreamSeek","Sys_StreamThread","Sys_StreamedRead","Sys_UnloadDll","Sys_Warn","floating_point_exception_handler","main","tty_Back","tty_FlushIn","tty_Hide","tty_Show"] end function
function unixNetSymbols() return ["NET_BaseAdrToString","NET_ErrorString","NET_GetLocalAddress","NET_IPSocket","NET_Init","NET_OpenIP","NET_Shutdown","NET_Sleep","NetadrToSockadr","SockadrToNetadr","Sys_GetPacket","Sys_IsLANAddress","Sys_SendPacket","Sys_ShowIP","Sys_StringToAdr","Sys_StringToSockaddr"] end function
function unixSharedSymbols() return ["Sys_Cwd","Sys_DefaultCDPath","Sys_DefaultHomePath","Sys_DefaultInstallPath","Sys_FreeFileList","Sys_GetCurrentUser","Sys_GetProcessorId","Sys_ListFiles","Sys_ListFilteredFiles","Sys_Milliseconds","Sys_Mkdir","Sys_ProcessorCount","Sys_SetDefaultCDPath","Sys_SetDefaultHomePath","Sys_SetDefaultInstallPath","Sys_ShowConsole","Sys_SnapVector","Sys_XTimeToSysTime","fastftol","strlwr"] end function
function unixVmX86Symbols() return ["VM_CallCompiled","VM_Compile"] end function

struct Address type host port end struct
struct Event kind value1 value2 time end struct
struct State glInitialized inputInitialized joystickInitialized soundInitialized logging gamma active signals currentTime paths user events systemEvents packets history historyCursor warnings errors quitRequested end struct

const NA_BAD=1
const NA_LOOPBACK=2
const NA_IP=4

function create() return State(false,false,false,false,false,[],true,false,0,["","","",""],"",[],[],[],[],-1,[],[],false) end function

function Com_Memcpy(destination,destinationOffset,source,sourceOffset,count) if count>0 then copyBytes(destination,destinationOffset,source,sourceOffset,count) end if;return destination end function
function Com_Memset(destination,offset,value,count) for index=0 to count-1 destination[offset+index]=value&255 end for;return destination end function
function Com_Prefetch(memory,count) return count end function
function _copyDWord(destination,destinationOffset,source,sourceOffset,count) return Com_Memcpy(destination,destinationOffset,source,sourceOffset,count*4) end function

function Q_stristr(text,needle) return strings.indexOf(strings.toLowerAscii(text),strings.toLowerAscii(needle),0) end function
function GLimp_Init(state) state.glInitialized=true;state.active=true;return true end function
function GLimp_Shutdown(state) state.glInitialized=false;state.active=false;return void end function
function GLimp_EndFrame(state) return state.glInitialized end function
function GLimp_SetGamma(state,red,green,blue) state.gamma=[red,green,blue];return void end function
function GLimp_LogComment(state,text) if state.logging then state.events=state.events+[["gl-log",text]] end if;return void end function
function GLW_SetMode(state,mode,fullscreen) state.events=state.events+[["mode",mode,fullscreen]];return 0 end function
function GLW_StartDriverAndSetMode(state,driver,mode,fullscreen) if driver=="" then return false end if;GLimp_Init(state);GLW_SetMode(state,mode,fullscreen);return true end function
function GLW_LoadOpenGL(state,driver) return GLW_StartDriverAndSetMode(state,driver,3,false) end function
function GLW_InitExtensions(state,text) state.events=state.events+[["extensions",text]];return void end function
function GLW_InitGamma(state) state.gamma=[[],[],[]];return true end function
function CreateNullCursor(state) return 1 end function
function HandleEvents(state) return len(state.events) end function
function install_grabs(state) state.active=true;return void end function
function uninstall_grabs(state) state.active=false;return void end function
function IN_Activate(state,active) state.active=active;return void end function
function IN_ActivateMouse(state) state.active=true;return void end function
function IN_DeactivateMouse(state) state.active=false;return void end function
function IN_Init(state) state.inputInitialized=true;return void end function
function IN_Shutdown(state) state.inputInitialized=false;return void end function
function IN_Frame(state) return state.inputInitialized end function
function IN_StartupJoystick(state) state.joystickInitialized=true;return void end function
function IN_JoyMove(state,axes) if state.joystickInitialized then state.events=state.events+[["joystick",axes]] end if;return void end function
function KBD_Init(state) return IN_Init(state) end function
function KBD_Close(state) return IN_Shutdown(state) end function
function Sys_SendKeyEvents(state) return HandleEvents(state) end function
function X11_PendingInput(state) return len(state.events)>0 end function
function XLateKey(state,key) return key end function
function repeated_press(state,key,time) return false end function
function qXErrorHandler(state,code) state.warnings=state.warnings+["X11 error "+str(code)];return 0 end function
function GLimp_SpawnRenderThread(state,callback) return callback!=void end function
function GLimp_RenderThreadWrapper(state,callback,context) if callback!=void then callback(context) end if;return void end function
function GLimp_RendererSleep(state) return void end function
function GLimp_FrontEndSleep(state) return void end function
function GLimp_WakeRenderer(state,data) return data end function

function QGL_Init(state,driver) if driver=="" then return false end if;state.glInitialized=true;state.events=state.events+[["qgl-init",driver]];return true end function
function QGL_Shutdown(state) state.glInitialized=false;state.logging=false;return void end function
function QGL_EnableLogging(state,enabled) state.logging=enabled;return enabled end function
function GLimp_LogNewFrame(state) if state.logging then state.events=state.events+[["gl-frame"]] end if;return void end function
function qglDispatch(state,name,arguments) if not state.glInitialized then return false end if;state.events=state.events+[[name,arguments]];return true end function
function qwglGetProcAddress(state,name) if not state.glInitialized then return 0 end if;return 1 end function

function InitSig(state) state.signals=true;return void end function
function signal_handler(state,signal) state.errors=state.errors+["signal "+str(signal)];return error(7981,"Unix signal "+str(signal)) end function
function SNDDMA_Init(state) state.soundInitialized=true;return true end function
function SNDDMA_GetDMAPos(state) return 0 end function
function SNDDMA_BeginPainting(state) return state.soundInitialized end function
function SNDDMA_Submit(state) return state.soundInitialized end function
function SNDDMA_Shutdown(state) state.soundInitialized=false;return void end function
function Snd_Memset(destination,value,count) return Com_Memset(destination,0,value,count) end function

function Hist_Add(state,text) if text=="" then return false end if;state.history=state.history+[text];state.historyCursor=len(state.history);return true end function
function Hist_Prev(state) if len(state.history)==0 then return "" end if;if state.historyCursor>0 then state.historyCursor=state.historyCursor-1 end if;return state.history[state.historyCursor] end function
function Hist_Next(state) if len(state.history)==0 then return "" end if;if state.historyCursor<len(state.history)-1 then state.historyCursor=state.historyCursor+1;return state.history[state.historyCursor] end if;state.historyCursor=len(state.history);return "" end function
function tty_Back(state) return Hist_Prev(state) end function
function tty_FlushIn(state) state.historyCursor=len(state.history);return void end function
function tty_Hide(state) state.active=false;return void end function
function tty_Show(state) state.active=true;return void end function
function Sys_ConsoleInputInit(state) return true end function
function Sys_ConsoleInputShutdown(state) return void end function
function Sys_ConsoleInput(state) return void end function
function Sys_Print(state,text) state.events=state.events+[["print",text]];return void end function
function Sys_Printf(state,text) return Sys_Print(state,text) end function
function Sys_Warn(state,text) state.warnings=state.warnings+[text];return void end function
function Sys_Error(state,text) state.errors=state.errors+[text];return error(7981,text) end function
function Sys_Quit(state) state.quitRequested=true;return void end function
function Sys_Exit(state,code) state.quitRequested=true;return code end function
function Sys_Init(state) return state end function
function Sys_ConfigureFPU(state) return true end function
function floating_point_exception_handler(state) return void end function
function Sys_LowPhysicalMemory(state) return false end function
function Sys_MonkeyShouldBeSpanked(state) return false end function
function Sys_CheckCD(state) return true end function
function Sys_AppActivate(state) state.active=true;return void end function
function Sys_In_Restart_f(state) state.inputInitialized=false;state.inputInitialized=true;return void end function
function Sys_BeginProfiling(state) return void end function
function Sys_PrintBinVersion(state) return "MiniQuake3" end function
function Sys_ParseArgs(state,args) return args end function
function Sys_GetClipboardData(state) return void end function
function Sys_LoadDll(state,name) return void end function
function Sys_UnloadDll(state,handle) return void end function
function Sys_FunctionCmp(left,right) return left==right end function
function Sys_FunctionCheckSum(value) return value end function
function Sys_FileTime(state,path) return -1 end function
function Sys_BeginStreamedFile(state,file,readAhead) return void end function
function Sys_EndStreamedFile(state,file) return void end function
function Sys_StreamedRead(state,buffer,size,count,file) return 0 end function
function Sys_StreamSeek(state,file,offset,origin) return void end function
function Sys_InitStreamThread(state) return true end function
function Sys_ShutdownStreamThread(state) return void end function
function Sys_StreamThread(state) return void end function
function Sys_QueEvent(state,time,kind,value1,value2) state.systemEvents=state.systemEvents+[Event(kind,value1,value2,time)];return void end function
function Sys_GetEvent(state) if len(state.systemEvents)==0 then return Event(0,0,0,state.currentTime) end if;value=state.systemEvents[0];kept=[];if len(state.systemEvents)>1 then for index=1 to len(state.systemEvents)-1 kept=kept+[state.systemEvents[index]] end for end if;state.systemEvents=kept;return value end function

function Sys_StringToSockaddr(text,defaultPort)
  parts=strings.split(text,":");host=parts[0];port=defaultPort;if len(parts)>1 then port=toNumber(parts[1]) end if
  if host=="localhost" then return Address(NA_LOOPBACK,host,port) end if
  octets=strings.split(host,".");if len(octets)!=4 then return void end if;return Address(NA_IP,host,port)
end function
function Sys_StringToAdr(text) return Sys_StringToSockaddr(text,27960) end function
function NetadrToSockadr(address) return address end function
function SockadrToNetadr(address) return address end function
function NET_BaseAdrToString(address) return address.host end function
function NET_ErrorString(code) return "network error "+str(code) end function
function NET_IPSocket(interfaceName,port) if port<0 or port>65535 then return -1 end if;return 1 end function
function NET_Init(state) return true end function
function NET_OpenIP(state) return true end function
function NET_Shutdown(state) state.packets=[];return void end function
function NET_Sleep(msec) return void end function
function NET_GetLocalAddress(state) return Address(NA_LOOPBACK,"localhost",0) end function
function Sys_IsLANAddress(address) return address!=void and (address.type==NA_LOOPBACK or strings.indexOf(address.host,"192.168.",0)==0 or strings.indexOf(address.host,"10.",0)==0) end function
function Sys_SendPacket(state,length,data,address) count=length;if count>len(data) then count=len(data) end if;state.packets=state.packets+[[address,slice(data,0,count)]];return void end function
function Sys_GetPacket(state) return void end function
function Sys_ShowIP(state) return ["127.0.0.1"] end function

function Sys_Cwd(state) return state.paths[0] end function
function Sys_DefaultCDPath(state) return state.paths[1] end function
function Sys_DefaultHomePath(state) return state.paths[2] end function
function Sys_DefaultInstallPath(state) return state.paths[3] end function
function Sys_SetDefaultCDPath(state,value) state.paths[1]=value;return void end function
function Sys_SetDefaultHomePath(state,value) state.paths[2]=value;return void end function
function Sys_SetDefaultInstallPath(state,value) state.paths[3]=value;return void end function
function Sys_GetCurrentUser(state) return state.user end function
function Sys_ProcessorCount(state) return 1 end function
function Sys_Milliseconds(state) return state.currentTime end function
function Sys_XTimeToSysTime(state,time) return time end function
function Sys_Mkdir(state,path) return true end function
function Sys_ListFiles(state,directory,extension) return [] end function
function Sys_ListFilteredFiles(state,directory,extension,filter) return [] end function
function Sys_FreeFileList(state,list) return void end function
function Sys_ShowConsole(state,level,quitOnClose) return void end function
function Sys_GetProcessorId(state) return 0 end function
function Sys_SnapVector(value) return [n.trunc32(value[0]),n.trunc32(value[1]),n.trunc32(value[2])] end function
function fastftol(value) return n.trunc32(value) end function
function strlwr(value) return strings.toLowerAscii(value) end function

function VM_Compile(image,callback) return jit.VM_Compile(image,callback,"x86") end function
function VM_CallCompiled(compiled,args) return jit.VM_CallCompiled(compiled,args) end function

function unixMain(state,frameCount,frameFn,context) for index=0 to frameCount-1 if state.quitRequested then break end if;frameFn(context) end for;return state end function

