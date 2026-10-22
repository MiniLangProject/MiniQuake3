// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native Missionpack UI DLL trap veneer from code/ui/ui_syscalls.c.
//
// A native UI module owns pointers rather than QVM offsets.  Consequently this
// layer deliberately keeps pointer-like values opaque and forwards them in the
// exact C argument order.  The callback can be backed by CL_UISystemCalls, or by
// the existing mq3.vm.syscall_ui dispatcher through an embedding adapter.
package mq3.client.ui_syscalls_missionpack

import mq3.compat.numeric as n

const UI_ERROR=0
const UI_PRINT=1
const UI_MILLISECONDS=2
const UI_CVAR_SET=3
const UI_CVAR_VARIABLEVALUE=4
const UI_CVAR_VARIABLESTRINGBUFFER=5
const UI_CVAR_SETVALUE=6
const UI_CVAR_RESET=7
const UI_CVAR_CREATE=8
const UI_CVAR_INFOSTRINGBUFFER=9
const UI_ARGC=10
const UI_ARGV=11
const UI_CMD_EXECUTETEXT=12
const UI_FS_FOPENFILE=13
const UI_FS_READ=14
const UI_FS_WRITE=15
const UI_FS_FCLOSEFILE=16
const UI_FS_GETFILELIST=17
const UI_R_REGISTERMODEL=18
const UI_R_REGISTERSKIN=19
const UI_R_REGISTERSHADERNOMIP=20
const UI_R_CLEARSCENE=21
const UI_R_ADDREFENTITYTOSCENE=22
const UI_R_ADDPOLYTOSCENE=23
const UI_R_ADDLIGHTTOSCENE=24
const UI_R_RENDERSCENE=25
const UI_R_SETCOLOR=26
const UI_R_DRAWSTRETCHPIC=27
const UI_UPDATESCREEN=28
const UI_CM_LERPTAG=29
const UI_S_REGISTERSOUND=31
const UI_S_STARTLOCALSOUND=32
const UI_KEY_KEYNUMTOSTRINGBUF=33
const UI_KEY_GETBINDINGBUF=34
const UI_KEY_SETBINDING=35
const UI_KEY_ISDOWN=36
const UI_KEY_GETOVERSTRIKEMODE=37
const UI_KEY_SETOVERSTRIKEMODE=38
const UI_KEY_CLEARSTATES=39
const UI_KEY_GETCATCHER=40
const UI_KEY_SETCATCHER=41
const UI_GETCLIPBOARDDATA=42
const UI_GETGLCONFIG=43
const UI_GETCLIENTSTATE=44
const UI_GETCONFIGSTRING=45
const UI_LAN_GETPINGQUEUECOUNT=46
const UI_LAN_CLEARPING=47
const UI_LAN_GETPING=48
const UI_LAN_GETPINGINFO=49
const UI_CVAR_REGISTER=50
const UI_CVAR_UPDATE=51
const UI_MEMORY_REMAINING=52
const UI_GET_CDKEY=53
const UI_SET_CDKEY=54
const UI_R_REGISTERFONT=55
const UI_R_MODELBOUNDS=56
const UI_PC_ADD_GLOBAL_DEFINE=57
const UI_PC_LOAD_SOURCE=58
const UI_PC_FREE_SOURCE=59
const UI_PC_READ_TOKEN=60
const UI_PC_SOURCE_FILE_AND_LINE=61
const UI_S_STOPBACKGROUNDTRACK=62
const UI_S_STARTBACKGROUNDTRACK=63
const UI_REAL_TIME=64
const UI_LAN_GETSERVERCOUNT=65
const UI_LAN_GETSERVERADDRESSSTRING=66
const UI_LAN_GETSERVERINFO=67
const UI_LAN_MARKSERVERVISIBLE=68
const UI_LAN_UPDATEVISIBLEPINGS=69
const UI_LAN_RESETPINGS=70
const UI_LAN_LOADCACHEDSERVERS=71
const UI_LAN_SAVECACHEDSERVERS=72
const UI_LAN_ADDSERVER=73
const UI_LAN_REMOVESERVER=74
const UI_CIN_PLAYCINEMATIC=75
const UI_CIN_STOPCINEMATIC=76
const UI_CIN_RUNCINEMATIC=77
const UI_CIN_DRAWCINEMATIC=78
const UI_CIN_SETEXTENTS=79
const UI_R_REMAP_SHADER=80
const UI_VERIFY_CDKEY=81
const UI_LAN_SERVERSTATUS=82
const UI_LAN_GETSERVERPING=83
const UI_LAN_SERVERISVISIBLE=84
const UI_LAN_COMPARESERVERS=85
const UI_FS_SEEK=86
const UI_SET_PBCLSTATUS=87

struct State syscallFn context calls lastOpcode lastArguments end struct

function dllEntry(syscallptr,context)
  if syscallptr==void then return error(7820,"UI syscalls: missing syscall entry") end if
  return State(syscallptr,context,0,-1,[])
end function

function invoke(state,opcode,arguments)
  if state==void or state.syscallFn==void then return error(7820,"UI syscalls: dllEntry was not installed") end if
  state.calls=state.calls+1;state.lastOpcode=opcode;state.lastArguments=arguments
  return state.syscallFn(state.context,opcode,arguments)
end function

function callVoid(state,opcode,arguments) invoke(state,opcode,arguments);return void end function

function PASSFLOAT(x) return n.i32(n.floatBits(x)) end function

function trap_Print(state,string) return callVoid(state,UI_PRINT,[string]) end function
function trap_Error(state,string) return callVoid(state,UI_ERROR,[string]) end function
function trap_Milliseconds(state) return invoke(state,UI_MILLISECONDS,[]) end function

function trap_Cvar_Register(state,cvar,varName,value,flags) return callVoid(state,UI_CVAR_REGISTER,[cvar,varName,value,flags]) end function
function trap_Cvar_Update(state,cvar) return callVoid(state,UI_CVAR_UPDATE,[cvar]) end function
function trap_Cvar_Set(state,varName,value) return callVoid(state,UI_CVAR_SET,[varName,value]) end function
function trap_Cvar_VariableValue(state,varName) return n.bitsFloat(invoke(state,UI_CVAR_VARIABLEVALUE,[varName])) end function
function trap_Cvar_VariableStringBuffer(state,varName,buffer,bufsize) return callVoid(state,UI_CVAR_VARIABLESTRINGBUFFER,[varName,buffer,bufsize]) end function
function trap_Cvar_SetValue(state,varName,value) return callVoid(state,UI_CVAR_SETVALUE,[varName,PASSFLOAT(value)]) end function
function trap_Cvar_Reset(state,name) return callVoid(state,UI_CVAR_RESET,[name]) end function
function trap_Cvar_Create(state,varName,varValue,flags) return callVoid(state,UI_CVAR_CREATE,[varName,varValue,flags]) end function
function trap_Cvar_InfoStringBuffer(state,bit,buffer,bufsize) return callVoid(state,UI_CVAR_INFOSTRINGBUFFER,[bit,buffer,bufsize]) end function

function trap_Argc(state) return invoke(state,UI_ARGC,[]) end function
function trap_Argv(state,index,buffer,bufferLength) return callVoid(state,UI_ARGV,[index,buffer,bufferLength]) end function
function trap_Cmd_ExecuteText(state,execWhen,text) return callVoid(state,UI_CMD_EXECUTETEXT,[execWhen,text]) end function

function trap_FS_FOpenFile(state,qpath,handle,mode) return invoke(state,UI_FS_FOPENFILE,[qpath,handle,mode]) end function
function trap_FS_Read(state,buffer,length,handle) return callVoid(state,UI_FS_READ,[buffer,length,handle]) end function
function trap_FS_Write(state,buffer,length,handle) return callVoid(state,UI_FS_WRITE,[buffer,length,handle]) end function
function trap_FS_FCloseFile(state,handle) return callVoid(state,UI_FS_FCLOSEFILE,[handle]) end function
function trap_FS_GetFileList(state,path,extension,listbuf,bufsize) return invoke(state,UI_FS_GETFILELIST,[path,extension,listbuf,bufsize]) end function
function trap_FS_Seek(state,handle,offset,origin) return invoke(state,UI_FS_SEEK,[handle,offset,origin]) end function

function trap_R_RegisterModel(state,name) return invoke(state,UI_R_REGISTERMODEL,[name]) end function
function trap_R_RegisterSkin(state,name) return invoke(state,UI_R_REGISTERSKIN,[name]) end function
function trap_R_RegisterFont(state,fontName,pointSize,font) return callVoid(state,UI_R_REGISTERFONT,[fontName,pointSize,font]) end function
function trap_R_RegisterShaderNoMip(state,name) return invoke(state,UI_R_REGISTERSHADERNOMIP,[name]) end function
function trap_R_ClearScene(state) return callVoid(state,UI_R_CLEARSCENE,[]) end function
function trap_R_AddRefEntityToScene(state,entity) return callVoid(state,UI_R_ADDREFENTITYTOSCENE,[entity]) end function
function trap_R_AddPolyToScene(state,shader,numVerts,verts) return callVoid(state,UI_R_ADDPOLYTOSCENE,[shader,numVerts,verts]) end function
function trap_R_AddLightToScene(state,origin,intensity,r,g,b) return callVoid(state,UI_R_ADDLIGHTTOSCENE,[origin,PASSFLOAT(intensity),PASSFLOAT(r),PASSFLOAT(g),PASSFLOAT(b)]) end function
function trap_R_RenderScene(state,refdef) return callVoid(state,UI_R_RENDERSCENE,[refdef]) end function
function trap_R_SetColor(state,rgba) return callVoid(state,UI_R_SETCOLOR,[rgba]) end function
function trap_R_DrawStretchPic(state,x,y,w,h,s1,t1,s2,t2,shader) return callVoid(state,UI_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(w),PASSFLOAT(h),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]) end function
function trap_R_ModelBounds(state,model,mins,maxs) return callVoid(state,UI_R_MODELBOUNDS,[model,mins,maxs]) end function
function trap_R_RemapShader(state,oldShader,newShader,timeOffset) return callVoid(state,UI_R_REMAP_SHADER,[oldShader,newShader,timeOffset]) end function
function trap_UpdateScreen(state) return callVoid(state,UI_UPDATESCREEN,[]) end function

function trap_CM_LerpTag(state,tag,model,startFrame,endFrame,frac,tagName) return invoke(state,UI_CM_LERPTAG,[tag,model,startFrame,endFrame,PASSFLOAT(frac),tagName]) end function

function trap_S_StartLocalSound(state,sfx,channelNum) return callVoid(state,UI_S_STARTLOCALSOUND,[sfx,channelNum]) end function
function trap_S_RegisterSound(state,sample,compressed) return invoke(state,UI_S_REGISTERSOUND,[sample,compressed]) end function
function trap_S_StopBackgroundTrack(state) return callVoid(state,UI_S_STOPBACKGROUNDTRACK,[]) end function
function trap_S_StartBackgroundTrack(state,intro,loopName) return callVoid(state,UI_S_STARTBACKGROUNDTRACK,[intro,loopName]) end function

function trap_Key_KeynumToStringBuf(state,keynum,buffer,buflen) return callVoid(state,UI_KEY_KEYNUMTOSTRINGBUF,[keynum,buffer,buflen]) end function
function trap_Key_GetBindingBuf(state,keynum,buffer,buflen) return callVoid(state,UI_KEY_GETBINDINGBUF,[keynum,buffer,buflen]) end function
function trap_Key_SetBinding(state,keynum,binding) return callVoid(state,UI_KEY_SETBINDING,[keynum,binding]) end function
function trap_Key_IsDown(state,keynum) return invoke(state,UI_KEY_ISDOWN,[keynum]) end function
function trap_Key_GetOverstrikeMode(state) return invoke(state,UI_KEY_GETOVERSTRIKEMODE,[]) end function
function trap_Key_SetOverstrikeMode(state,value) return callVoid(state,UI_KEY_SETOVERSTRIKEMODE,[value]) end function
function trap_Key_ClearStates(state) return callVoid(state,UI_KEY_CLEARSTATES,[]) end function
function trap_Key_GetCatcher(state) return invoke(state,UI_KEY_GETCATCHER,[]) end function
function trap_Key_SetCatcher(state,catcher) return callVoid(state,UI_KEY_SETCATCHER,[catcher]) end function

function trap_GetClipboardData(state,buffer,bufsize) return callVoid(state,UI_GETCLIPBOARDDATA,[buffer,bufsize]) end function
function trap_GetClientState(state,clientState) return callVoid(state,UI_GETCLIENTSTATE,[clientState]) end function
function trap_GetGlconfig(state,glconfig) return callVoid(state,UI_GETGLCONFIG,[glconfig]) end function
function trap_GetConfigString(state,index,buffer,bufsize) return invoke(state,UI_GETCONFIGSTRING,[index,buffer,bufsize]) end function

function trap_LAN_GetServerCount(state,source) return invoke(state,UI_LAN_GETSERVERCOUNT,[source]) end function
function trap_LAN_GetServerAddressString(state,source,index,buffer,buflen) return callVoid(state,UI_LAN_GETSERVERADDRESSSTRING,[source,index,buffer,buflen]) end function
function trap_LAN_GetServerInfo(state,source,index,buffer,buflen) return callVoid(state,UI_LAN_GETSERVERINFO,[source,index,buffer,buflen]) end function
function trap_LAN_GetServerPing(state,source,index) return invoke(state,UI_LAN_GETSERVERPING,[source,index]) end function
function trap_LAN_GetPingQueueCount(state) return invoke(state,UI_LAN_GETPINGQUEUECOUNT,[]) end function
function trap_LAN_ServerStatus(state,address,status,maxLen) return invoke(state,UI_LAN_SERVERSTATUS,[address,status,maxLen]) end function
function trap_LAN_SaveCachedServers(state) return callVoid(state,UI_LAN_SAVECACHEDSERVERS,[]) end function
function trap_LAN_LoadCachedServers(state) return callVoid(state,UI_LAN_LOADCACHEDSERVERS,[]) end function
function trap_LAN_ResetPings(state,index) return callVoid(state,UI_LAN_RESETPINGS,[index]) end function
function trap_LAN_ClearPing(state,index) return callVoid(state,UI_LAN_CLEARPING,[index]) end function
function trap_LAN_GetPing(state,index,buffer,buflen,pingtime) return callVoid(state,UI_LAN_GETPING,[index,buffer,buflen,pingtime]) end function
function trap_LAN_GetPingInfo(state,index,buffer,buflen) return callVoid(state,UI_LAN_GETPINGINFO,[index,buffer,buflen]) end function
function trap_LAN_MarkServerVisible(state,source,index,visible) return callVoid(state,UI_LAN_MARKSERVERVISIBLE,[source,index,visible]) end function
function trap_LAN_ServerIsVisible(state,source,index) return invoke(state,UI_LAN_SERVERISVISIBLE,[source,index]) end function
function trap_LAN_UpdateVisiblePings(state,source) return invoke(state,UI_LAN_UPDATEVISIBLEPINGS,[source]) end function
function trap_LAN_AddServer(state,source,name,address) return invoke(state,UI_LAN_ADDSERVER,[source,name,address]) end function
function trap_LAN_RemoveServer(state,source,address) return callVoid(state,UI_LAN_REMOVESERVER,[source,address]) end function
function trap_LAN_CompareServers(state,source,sortKey,sortDir,first,second) return invoke(state,UI_LAN_COMPARESERVERS,[source,sortKey,sortDir,first,second]) end function

function trap_MemoryRemaining(state) return invoke(state,UI_MEMORY_REMAINING,[]) end function
function trap_GetCDKey(state,buffer,buflen) return callVoid(state,UI_GET_CDKEY,[buffer,buflen]) end function
function trap_SetCDKey(state,buffer) return callVoid(state,UI_SET_CDKEY,[buffer]) end function

function trap_PC_AddGlobalDefine(state,define) return invoke(state,UI_PC_ADD_GLOBAL_DEFINE,[define]) end function
function trap_PC_LoadSource(state,filename) return invoke(state,UI_PC_LOAD_SOURCE,[filename]) end function
function trap_PC_FreeSource(state,handle) return invoke(state,UI_PC_FREE_SOURCE,[handle]) end function
function trap_PC_ReadToken(state,handle,token) return invoke(state,UI_PC_READ_TOKEN,[handle,token]) end function
function trap_PC_SourceFileAndLine(state,handle,filename,line) return invoke(state,UI_PC_SOURCE_FILE_AND_LINE,[handle,filename,line]) end function

function trap_RealTime(state,qtime) return invoke(state,UI_REAL_TIME,[qtime]) end function
function trap_CIN_PlayCinematic(state,name,x,y,w,h,bits) return invoke(state,UI_CIN_PLAYCINEMATIC,[name,x,y,w,h,bits]) end function
function trap_CIN_StopCinematic(state,handle) return invoke(state,UI_CIN_STOPCINEMATIC,[handle]) end function
function trap_CIN_RunCinematic(state,handle) return invoke(state,UI_CIN_RUNCINEMATIC,[handle]) end function
function trap_CIN_DrawCinematic(state,handle) return callVoid(state,UI_CIN_DRAWCINEMATIC,[handle]) end function
function trap_CIN_SetExtents(state,handle,x,y,w,h) return callVoid(state,UI_CIN_SETEXTENTS,[handle,x,y,w,h]) end function
function trap_VerifyCDKey(state,key,checksum) return invoke(state,UI_VERIFY_CDKEY,[key,checksum]) end function
function trap_SetPbClStatus(state,status) return callVoid(state,UI_SET_PBCLSTATUS,[status]) end function
