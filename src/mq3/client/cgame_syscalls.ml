// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang wrapper ABI for code/cgame/cg_syscalls.c.
package mq3.client.cgame_syscalls

import mq3.compat.numeric as numeric
import mq3.vm.syscall_cgame as syscallCgame

const CG_PRINT=0
const CG_ERROR=1
const CG_MILLISECONDS=2
const CG_CVAR_REGISTER=3
const CG_CVAR_UPDATE=4
const CG_CVAR_SET=5
const CG_CVAR_VARIABLESTRINGBUFFER=6
const CG_ARGC=7
const CG_ARGV=8
const CG_ARGS=9
const CG_FS_FOPENFILE=10
const CG_FS_READ=11
const CG_FS_WRITE=12
const CG_FS_FCLOSEFILE=13
const CG_SENDCONSOLECOMMAND=14
const CG_ADDCOMMAND=15
const CG_SENDCLIENTCOMMAND=16
const CG_UPDATESCREEN=17
const CG_CM_LOADMAP=18
const CG_CM_NUMINLINEMODELS=19
const CG_CM_INLINEMODEL=20
const CG_CM_LOADMODEL=21
const CG_CM_TEMPBOXMODEL=22
const CG_CM_POINTCONTENTS=23
const CG_CM_TRANSFORMEDPOINTCONTENTS=24
const CG_CM_BOXTRACE=25
const CG_CM_TRANSFORMEDBOXTRACE=26
const CG_CM_MARKFRAGMENTS=27
const CG_S_STARTSOUND=28
const CG_S_STARTLOCALSOUND=29
const CG_S_CLEARLOOPINGSOUNDS=30
const CG_S_ADDLOOPINGSOUND=31
const CG_S_UPDATEENTITYPOSITION=32
const CG_S_RESPATIALIZE=33
const CG_S_REGISTERSOUND=34
const CG_S_STARTBACKGROUNDTRACK=35
const CG_R_LOADWORLDMAP=36
const CG_R_REGISTERMODEL=37
const CG_R_REGISTERSKIN=38
const CG_R_REGISTERSHADER=39
const CG_R_CLEARSCENE=40
const CG_R_ADDREFENTITYTOSCENE=41
const CG_R_ADDPOLYTOSCENE=42
const CG_R_ADDLIGHTTOSCENE=43
const CG_R_RENDERSCENE=44
const CG_R_SETCOLOR=45
const CG_R_DRAWSTRETCHPIC=46
const CG_R_MODELBOUNDS=47
const CG_R_LERPTAG=48
const CG_GETGLCONFIG=49
const CG_GETGAMESTATE=50
const CG_GETCURRENTSNAPSHOTNUMBER=51
const CG_GETSNAPSHOT=52
const CG_GETSERVERCOMMAND=53
const CG_GETCURRENTCMDNUMBER=54
const CG_GETUSERCMD=55
const CG_SETUSERCMDVALUE=56
const CG_R_REGISTERSHADERNOMIP=57
const CG_MEMORY_REMAINING=58
const CG_R_REGISTERFONT=59
const CG_KEY_ISDOWN=60
const CG_KEY_GETCATCHER=61
const CG_KEY_SETCATCHER=62
const CG_KEY_GETKEY=63
const CG_PC_ADD_GLOBAL_DEFINE=64
const CG_PC_LOAD_SOURCE=65
const CG_PC_FREE_SOURCE=66
const CG_PC_READ_TOKEN=67
const CG_PC_SOURCE_FILE_AND_LINE=68
const CG_S_STOPBACKGROUNDTRACK=69
const CG_REAL_TIME=70
const CG_SNAPVECTOR=71
const CG_REMOVECOMMAND=72
const CG_R_LIGHTFORPOINT=73
const CG_CIN_PLAYCINEMATIC=74
const CG_CIN_STOPCINEMATIC=75
const CG_CIN_RUNCINEMATIC=76
const CG_CIN_DRAWCINEMATIC=77
const CG_CIN_SETEXTENTS=78
const CG_R_REMAP_SHADER=79
const CG_S_ADDREALLOOPINGSOUND=80
const CG_S_STOPLOOPINGSOUND=81
const CG_CM_TEMPCAPSULEMODEL=82
const CG_CM_CAPSULETRACE=83
const CG_CM_TRANSFORMEDCAPSULETRACE=84
const CG_R_ADDADDITIVELIGHTTOSCENE=85
const CG_GET_ENTITY_TOKEN=86
const CG_R_ADDPOLYSTOSCENE=87
const CG_R_INPVS=88
const CG_FS_SEEK=89
// These three were shipped commented out in both cg_public.h and cg_syscalls.c.
// Their dormant sequential ABI slots are kept so the Ledger candidates remain callable.
const CG_LOADCAMERA=90
const CG_STARTCAMERA=91
const CG_GETCAMERAINFO=92
const CG_TESTPRINTINT=109
const CG_TESTPRINTFLOAT=110

struct Invocation opcode arguments result dispatched end struct
struct Gateway context syscallFn retailActive calls end struct
struct DispatcherContext host vm base end struct

function fail(message) return error(7904,"cgame syscalls: "+message) end function

// dllEntry
function dllEntry(context,syscallFn,retailActive)
  if syscallFn==void then return fail("missing syscall entry") end if
  return Gateway(context,syscallFn,retailActive,[])
end function

function invoke(gateway,opcode,arguments)
  if gateway==void or gateway.syscallFn==void then return fail("uninitialized syscall entry") end if
  if arguments==void then arguments=[] end if
  if gateway.retailActive then gateway.calls=gateway.calls+[Invocation(opcode,arguments,0,false)];return 0 end if
  result=gateway.syscallFn(gateway.context,[opcode]+arguments);if result is error then return result end if
  gateway.calls=gateway.calls+[Invocation(opcode,arguments,result,true)];return result
end function

function dispatchExisting(context,words)
  if context==void or context.vm==void or context.host==void then return fail("invalid existing dispatcher context") end if
  if context.base<0 or context.base+len(words)*4>len(context.vm.data) then return fail("argument vector outside VM memory") end if
  if len(words)>0 then for index=0 to len(words)-1 numeric.writeU32(context.vm.data,context.base+index*4,words[index]) end for end if
  return syscallCgame.dispatch(context.host,context.vm,context.base)
end function
function qvmGateway(host,vm,base,retailActive) return dllEntry(DispatcherContext(host,vm,base),dispatchExisting,retailActive) end function

// PASSFLOAT
function PASSFLOAT(value) return numeric.i32(numeric.floatBits(numeric.f32(value))) end function

// trap_Print
function trap_Print(gateway,fmt) invoke(gateway,CG_PRINT,[fmt]);return void end function
// trap_Error
function trap_Error(gateway,fmt) invoke(gateway,CG_ERROR,[fmt]);return void end function
// trap_Milliseconds
function trap_Milliseconds(gateway) return invoke(gateway,CG_MILLISECONDS,[]) end function
// trap_Cvar_Register
function trap_Cvar_Register(gateway,vmCvar,varName,defaultValue,flags) invoke(gateway,CG_CVAR_REGISTER,[vmCvar,varName,defaultValue,flags]);return void end function
// trap_Cvar_Update
function trap_Cvar_Update(gateway,vmCvar) invoke(gateway,CG_CVAR_UPDATE,[vmCvar]);return void end function
// trap_Cvar_Set
function trap_Cvar_Set(gateway,varName,value) invoke(gateway,CG_CVAR_SET,[varName,value]);return void end function
// trap_Cvar_VariableStringBuffer
function trap_Cvar_VariableStringBuffer(gateway,varName,buffer,bufsize) invoke(gateway,CG_CVAR_VARIABLESTRINGBUFFER,[varName,buffer,bufsize]);return void end function
// trap_Argc
function trap_Argc(gateway) return invoke(gateway,CG_ARGC,[]) end function
// trap_Argv
function trap_Argv(gateway,index,buffer,bufferLength) invoke(gateway,CG_ARGV,[index,buffer,bufferLength]);return void end function
// trap_Args
function trap_Args(gateway,buffer,bufferLength) invoke(gateway,CG_ARGS,[buffer,bufferLength]);return void end function
// trap_FS_FOpenFile
function trap_FS_FOpenFile(gateway,qpath,fileHandle,mode) return invoke(gateway,CG_FS_FOPENFILE,[qpath,fileHandle,mode]) end function
// trap_FS_Read
function trap_FS_Read(gateway,buffer,length,fileHandle) invoke(gateway,CG_FS_READ,[buffer,length,fileHandle]);return void end function
// trap_FS_Write
function trap_FS_Write(gateway,buffer,length,fileHandle) invoke(gateway,CG_FS_WRITE,[buffer,length,fileHandle]);return void end function
// trap_FS_FCloseFile
function trap_FS_FCloseFile(gateway,fileHandle) invoke(gateway,CG_FS_FCLOSEFILE,[fileHandle]);return void end function
// trap_FS_Seek
function trap_FS_Seek(gateway,fileHandle,offset,origin) return invoke(gateway,CG_FS_SEEK,[fileHandle,offset,origin]) end function
// trap_SendConsoleCommand
function trap_SendConsoleCommand(gateway,text) invoke(gateway,CG_SENDCONSOLECOMMAND,[text]);return void end function
// trap_AddCommand
function trap_AddCommand(gateway,cmdName) invoke(gateway,CG_ADDCOMMAND,[cmdName]);return void end function
// trap_RemoveCommand
function trap_RemoveCommand(gateway,cmdName) invoke(gateway,CG_REMOVECOMMAND,[cmdName]);return void end function
// trap_SendClientCommand
function trap_SendClientCommand(gateway,text) invoke(gateway,CG_SENDCLIENTCOMMAND,[text]);return void end function
// trap_UpdateScreen
function trap_UpdateScreen(gateway) invoke(gateway,CG_UPDATESCREEN,[]);return void end function
// trap_CM_LoadMap
function trap_CM_LoadMap(gateway,mapname) invoke(gateway,CG_CM_LOADMAP,[mapname]);return void end function
// trap_CM_NumInlineModels
function trap_CM_NumInlineModels(gateway) return invoke(gateway,CG_CM_NUMINLINEMODELS,[]) end function
// trap_CM_InlineModel
function trap_CM_InlineModel(gateway,index) return invoke(gateway,CG_CM_INLINEMODEL,[index]) end function
// trap_CM_TempBoxModel
function trap_CM_TempBoxModel(gateway,mins,maxs) return invoke(gateway,CG_CM_TEMPBOXMODEL,[mins,maxs]) end function
// trap_CM_TempCapsuleModel
function trap_CM_TempCapsuleModel(gateway,mins,maxs) return invoke(gateway,CG_CM_TEMPCAPSULEMODEL,[mins,maxs]) end function
// trap_CM_PointContents
function trap_CM_PointContents(gateway,point,model) return invoke(gateway,CG_CM_POINTCONTENTS,[point,model]) end function
// trap_CM_TransformedPointContents
function trap_CM_TransformedPointContents(gateway,point,model,origin,angles) return invoke(gateway,CG_CM_TRANSFORMEDPOINTCONTENTS,[point,model,origin,angles]) end function
// trap_CM_BoxTrace
function trap_CM_BoxTrace(gateway,results,start,endPoint,mins,maxs,model,brushmask) invoke(gateway,CG_CM_BOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask]);return void end function
// trap_CM_CapsuleTrace
function trap_CM_CapsuleTrace(gateway,results,start,endPoint,mins,maxs,model,brushmask) invoke(gateway,CG_CM_CAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask]);return void end function
// trap_CM_TransformedBoxTrace
function trap_CM_TransformedBoxTrace(gateway,results,start,endPoint,mins,maxs,model,brushmask,origin,angles) invoke(gateway,CG_CM_TRANSFORMEDBOXTRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles]);return void end function
// trap_CM_TransformedCapsuleTrace
function trap_CM_TransformedCapsuleTrace(gateway,results,start,endPoint,mins,maxs,model,brushmask,origin,angles) invoke(gateway,CG_CM_TRANSFORMEDCAPSULETRACE,[results,start,endPoint,mins,maxs,model,brushmask,origin,angles]);return void end function
// trap_CM_MarkFragments
function trap_CM_MarkFragments(gateway,numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer) return invoke(gateway,CG_CM_MARKFRAGMENTS,[numPoints,points,projection,maxPoints,pointBuffer,maxFragments,fragmentBuffer]) end function
// trap_S_StartSound
function trap_S_StartSound(gateway,origin,entityNum,entityChannel,sfx) invoke(gateway,CG_S_STARTSOUND,[origin,entityNum,entityChannel,sfx]);return void end function
// trap_S_StartLocalSound
function trap_S_StartLocalSound(gateway,sfx,channelNum) invoke(gateway,CG_S_STARTLOCALSOUND,[sfx,channelNum]);return void end function
// trap_S_ClearLoopingSounds
function trap_S_ClearLoopingSounds(gateway,killAll) invoke(gateway,CG_S_CLEARLOOPINGSOUNDS,[killAll]);return void end function
// trap_S_AddLoopingSound
function trap_S_AddLoopingSound(gateway,entityNum,origin,velocity,sfx) invoke(gateway,CG_S_ADDLOOPINGSOUND,[entityNum,origin,velocity,sfx]);return void end function
// trap_S_AddRealLoopingSound
function trap_S_AddRealLoopingSound(gateway,entityNum,origin,velocity,sfx) invoke(gateway,CG_S_ADDREALLOOPINGSOUND,[entityNum,origin,velocity,sfx]);return void end function
// trap_S_StopLoopingSound
function trap_S_StopLoopingSound(gateway,entityNum) invoke(gateway,CG_S_STOPLOOPINGSOUND,[entityNum]);return void end function
// trap_S_UpdateEntityPosition
function trap_S_UpdateEntityPosition(gateway,entityNum,origin) invoke(gateway,CG_S_UPDATEENTITYPOSITION,[entityNum,origin]);return void end function
// trap_S_Respatialize
function trap_S_Respatialize(gateway,entityNum,origin,axis,inWater) invoke(gateway,CG_S_RESPATIALIZE,[entityNum,origin,axis,inWater]);return void end function
// trap_S_RegisterSound
function trap_S_RegisterSound(gateway,sample,compressed) return invoke(gateway,CG_S_REGISTERSOUND,[sample,compressed]) end function
// trap_S_StartBackgroundTrack
function trap_S_StartBackgroundTrack(gateway,intro,loopName) invoke(gateway,CG_S_STARTBACKGROUNDTRACK,[intro,loopName]);return void end function
// trap_S_StopBackgroundTrack
function trap_S_StopBackgroundTrack(gateway) invoke(gateway,CG_S_STOPBACKGROUNDTRACK,[]);return void end function
// trap_R_LoadWorldMap
function trap_R_LoadWorldMap(gateway,mapname) invoke(gateway,CG_R_LOADWORLDMAP,[mapname]);return void end function
// trap_R_RegisterModel
function trap_R_RegisterModel(gateway,name) return invoke(gateway,CG_R_REGISTERMODEL,[name]) end function
// trap_R_RegisterSkin
function trap_R_RegisterSkin(gateway,name) return invoke(gateway,CG_R_REGISTERSKIN,[name]) end function
// trap_R_RegisterShader
function trap_R_RegisterShader(gateway,name) return invoke(gateway,CG_R_REGISTERSHADER,[name]) end function
// trap_R_RegisterShaderNoMip
function trap_R_RegisterShaderNoMip(gateway,name) return invoke(gateway,CG_R_REGISTERSHADERNOMIP,[name]) end function
// trap_R_RegisterFont
function trap_R_RegisterFont(gateway,fontName,pointSize,font) invoke(gateway,CG_R_REGISTERFONT,[fontName,pointSize,font]);return void end function
// trap_R_ClearScene
function trap_R_ClearScene(gateway) invoke(gateway,CG_R_CLEARSCENE,[]);return void end function
// trap_R_AddRefEntityToScene
function trap_R_AddRefEntityToScene(gateway,refEntity) invoke(gateway,CG_R_ADDREFENTITYTOSCENE,[refEntity]);return void end function
// trap_R_AddPolyToScene
function trap_R_AddPolyToScene(gateway,shader,numVerts,verts) invoke(gateway,CG_R_ADDPOLYTOSCENE,[shader,numVerts,verts]);return void end function
// trap_R_AddPolysToScene
function trap_R_AddPolysToScene(gateway,shader,numVerts,verts,num) invoke(gateway,CG_R_ADDPOLYSTOSCENE,[shader,numVerts,verts,num]);return void end function
// trap_R_LightForPoint
function trap_R_LightForPoint(gateway,point,ambientLight,directedLight,lightDir) return invoke(gateway,CG_R_LIGHTFORPOINT,[point,ambientLight,directedLight,lightDir]) end function
// trap_R_AddLightToScene
function trap_R_AddLightToScene(gateway,origin,intensity,red,green,blue) invoke(gateway,CG_R_ADDLIGHTTOSCENE,[origin,PASSFLOAT(intensity),PASSFLOAT(red),PASSFLOAT(green),PASSFLOAT(blue)]);return void end function
// trap_R_AddAdditiveLightToScene
function trap_R_AddAdditiveLightToScene(gateway,origin,intensity,red,green,blue) invoke(gateway,CG_R_ADDADDITIVELIGHTTOSCENE,[origin,PASSFLOAT(intensity),PASSFLOAT(red),PASSFLOAT(green),PASSFLOAT(blue)]);return void end function
// trap_R_RenderScene
function trap_R_RenderScene(gateway,refdef) invoke(gateway,CG_R_RENDERSCENE,[refdef]);return void end function
// trap_R_SetColor
function trap_R_SetColor(gateway,rgba) invoke(gateway,CG_R_SETCOLOR,[rgba]);return void end function
// trap_R_DrawStretchPic
function trap_R_DrawStretchPic(gateway,x,y,width,height,s1,t1,s2,t2,shader) invoke(gateway,CG_R_DRAWSTRETCHPIC,[PASSFLOAT(x),PASSFLOAT(y),PASSFLOAT(width),PASSFLOAT(height),PASSFLOAT(s1),PASSFLOAT(t1),PASSFLOAT(s2),PASSFLOAT(t2),shader]);return void end function
// trap_R_ModelBounds
function trap_R_ModelBounds(gateway,model,mins,maxs) invoke(gateway,CG_R_MODELBOUNDS,[model,mins,maxs]);return void end function
// trap_R_LerpTag
function trap_R_LerpTag(gateway,tag,model,startFrame,endFrame,fraction,tagName) return invoke(gateway,CG_R_LERPTAG,[tag,model,startFrame,endFrame,PASSFLOAT(fraction),tagName]) end function
// trap_R_RemapShader
function trap_R_RemapShader(gateway,oldShader,newShader,timeOffset) invoke(gateway,CG_R_REMAP_SHADER,[oldShader,newShader,timeOffset]);return void end function
// trap_GetGlconfig
function trap_GetGlconfig(gateway,glconfig) invoke(gateway,CG_GETGLCONFIG,[glconfig]);return void end function
// trap_GetGameState
function trap_GetGameState(gateway,gameState) invoke(gateway,CG_GETGAMESTATE,[gameState]);return void end function
// trap_GetCurrentSnapshotNumber
function trap_GetCurrentSnapshotNumber(gateway,snapshotNumber,serverTime) invoke(gateway,CG_GETCURRENTSNAPSHOTNUMBER,[snapshotNumber,serverTime]);return void end function
// trap_GetSnapshot
function trap_GetSnapshot(gateway,snapshotNumber,snapshot) return invoke(gateway,CG_GETSNAPSHOT,[snapshotNumber,snapshot]) end function
// trap_GetServerCommand
function trap_GetServerCommand(gateway,serverCommandNumber) return invoke(gateway,CG_GETSERVERCOMMAND,[serverCommandNumber]) end function
// trap_GetCurrentCmdNumber
function trap_GetCurrentCmdNumber(gateway) return invoke(gateway,CG_GETCURRENTCMDNUMBER,[]) end function
// trap_GetUserCmd
function trap_GetUserCmd(gateway,cmdNumber,usercmd) return invoke(gateway,CG_GETUSERCMD,[cmdNumber,usercmd]) end function
// trap_SetUserCmdValue
function trap_SetUserCmdValue(gateway,stateValue,sensitivityScale) invoke(gateway,CG_SETUSERCMDVALUE,[stateValue,PASSFLOAT(sensitivityScale)]);return void end function
// testPrintInt
function testPrintInt(gateway,text,value) invoke(gateway,CG_TESTPRINTINT,[text,value]);return void end function
// testPrintFloat
function testPrintFloat(gateway,text,value) invoke(gateway,CG_TESTPRINTFLOAT,[text,PASSFLOAT(value)]);return void end function
// trap_MemoryRemaining
function trap_MemoryRemaining(gateway) return invoke(gateway,CG_MEMORY_REMAINING,[]) end function
// trap_Key_IsDown
function trap_Key_IsDown(gateway,keynum) return invoke(gateway,CG_KEY_ISDOWN,[keynum]) end function
// trap_Key_GetCatcher
function trap_Key_GetCatcher(gateway) return invoke(gateway,CG_KEY_GETCATCHER,[]) end function
// trap_Key_SetCatcher
function trap_Key_SetCatcher(gateway,catcher) invoke(gateway,CG_KEY_SETCATCHER,[catcher]);return void end function
// trap_Key_GetKey
function trap_Key_GetKey(gateway,binding) return invoke(gateway,CG_KEY_GETKEY,[binding]) end function
// trap_PC_AddGlobalDefine
function trap_PC_AddGlobalDefine(gateway,defineText) return invoke(gateway,CG_PC_ADD_GLOBAL_DEFINE,[defineText]) end function
// trap_PC_LoadSource
function trap_PC_LoadSource(gateway,filename) return invoke(gateway,CG_PC_LOAD_SOURCE,[filename]) end function
// trap_PC_FreeSource
function trap_PC_FreeSource(gateway,handle) return invoke(gateway,CG_PC_FREE_SOURCE,[handle]) end function
// trap_PC_ReadToken
function trap_PC_ReadToken(gateway,handle,token) return invoke(gateway,CG_PC_READ_TOKEN,[handle,token]) end function
// trap_PC_SourceFileAndLine
function trap_PC_SourceFileAndLine(gateway,handle,filename,line) return invoke(gateway,CG_PC_SOURCE_FILE_AND_LINE,[handle,filename,line]) end function
// trap_RealTime
function trap_RealTime(gateway,qtime) return invoke(gateway,CG_REAL_TIME,[qtime]) end function
// trap_SnapVector
function trap_SnapVector(gateway,vector) invoke(gateway,CG_SNAPVECTOR,[vector]);return void end function
// trap_CIN_PlayCinematic
function trap_CIN_PlayCinematic(gateway,name,x,y,width,height,bits) return invoke(gateway,CG_CIN_PLAYCINEMATIC,[name,x,y,width,height,bits]) end function
// trap_CIN_StopCinematic
function trap_CIN_StopCinematic(gateway,handle) return invoke(gateway,CG_CIN_STOPCINEMATIC,[handle]) end function
// trap_CIN_RunCinematic
function trap_CIN_RunCinematic(gateway,handle) return invoke(gateway,CG_CIN_RUNCINEMATIC,[handle]) end function
// trap_CIN_DrawCinematic
function trap_CIN_DrawCinematic(gateway,handle) invoke(gateway,CG_CIN_DRAWCINEMATIC,[handle]);return void end function
// trap_CIN_SetExtents
function trap_CIN_SetExtents(gateway,handle,x,y,width,height) invoke(gateway,CG_CIN_SETEXTENTS,[handle,x,y,width,height]);return void end function
// trap_GetEntityToken
function trap_GetEntityToken(gateway,buffer,bufferSize) return invoke(gateway,CG_GET_ENTITY_TOKEN,[buffer,bufferSize]) end function
// trap_R_inPVS
function trap_R_inPVS(gateway,p1,p2) return invoke(gateway,CG_R_INPVS,[p1,p2]) end function

// trap_loadCamera -- dormant in the shipped source, ordinal preserved.
function trap_loadCamera(gateway,name) return invoke(gateway,CG_LOADCAMERA,[name]) end function
// trap_startCamera -- dormant in the shipped source, ordinal preserved.
function trap_startCamera(gateway,time) invoke(gateway,CG_STARTCAMERA,[time]);return void end function
// trap_getCameraInfo -- dormant in the shipped source, ordinal preserved.
function trap_getCameraInfo(gateway,time,origin,angles) return invoke(gateway,CG_GETCAMERAINFO,[time,origin,angles]) end function
