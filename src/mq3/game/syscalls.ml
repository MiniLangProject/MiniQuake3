// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native ABI-exact wrappers for code/game/g_syscalls.c.
package mq3.game.syscalls

import mq3.compat.numeric as n

struct Call opcode arguments result end struct
struct Binding context invokeFn calls end struct

function dllEntry(syscallFn,context) return Binding(context,syscallFn,[]) end function
function PASSFLOAT(value) return n.i32(n.floatBits(value)) end function
function passFloat(value) return PASSFLOAT(value) end function
// The original trap_BotMutateGoalFuzzyLogic omits PASSFLOAT. On the 32-bit
// DLL ABI its float parameter is promoted to binary64 and the syscall reads
// the low 32-bit word. Preserve that historical ABI quirk exactly.
function promotedFloatLow(value) return n.i32((n.floatBits(value)&7)<<29) end function
function invoke(binding,opcode,arguments)
  if binding==void or binding.invokeFn==void then return error(7860,"qagame syscall entry is not installed") end if
  result=binding.invokeFn(binding.context,opcode,arguments);if result is error then return result end if;binding.calls=binding.calls+[Call(opcode,arguments,result)];return result
end function
function invokeVoid(binding,opcode,arguments) result=invoke(binding,opcode,arguments);if result is error then return result end if;return void end function
function invokeFloat(binding,opcode,arguments) result=invoke(binding,opcode,arguments);if result is error then return result end if;return n.bitsFloat(result) end function

const G_PRINT=0
const G_ERROR=1
const G_MILLISECONDS=2
const G_CVAR_REGISTER=3
const G_CVAR_UPDATE=4
const G_CVAR_SET=5
const G_CVAR_VARIABLE_INTEGER_VALUE=6
const G_CVAR_VARIABLE_STRING_BUFFER=7
const G_ARGC=8
const G_ARGV=9
const G_FS_FOPEN_FILE=10
const G_FS_READ=11
const G_FS_WRITE=12
const G_FS_FCLOSE_FILE=13
const G_SEND_CONSOLE_COMMAND=14
const G_LOCATE_GAME_DATA=15
const G_DROP_CLIENT=16
const G_SEND_SERVER_COMMAND=17
const G_SET_CONFIGSTRING=18
const G_GET_CONFIGSTRING=19
const G_GET_USERINFO=20
const G_SET_USERINFO=21
const G_GET_SERVERINFO=22
const G_SET_BRUSH_MODEL=23
const G_TRACE=24
const G_POINT_CONTENTS=25
const G_IN_PVS=26
const G_IN_PVS_IGNORE_PORTALS=27
const G_ADJUST_AREA_PORTAL_STATE=28
const G_AREAS_CONNECTED=29
const G_LINKENTITY=30
const G_UNLINKENTITY=31
const G_ENTITIES_IN_BOX=32
const G_ENTITY_CONTACT=33
const G_BOT_ALLOCATE_CLIENT=34
const G_BOT_FREE_CLIENT=35
const G_GET_USERCMD=36
const G_GET_ENTITY_TOKEN=37
const G_FS_GETFILELIST=38
const G_DEBUG_POLYGON_CREATE=39
const G_DEBUG_POLYGON_DELETE=40
const G_REAL_TIME=41
const G_SNAPVECTOR=42
const G_TRACECAPSULE=43
const G_ENTITY_CONTACTCAPSULE=44
const G_FS_SEEK=45
const BOTLIB_SETUP=200
const BOTLIB_SHUTDOWN=201
const BOTLIB_LIBVAR_SET=202
const BOTLIB_LIBVAR_GET=203
const BOTLIB_PC_ADD_GLOBAL_DEFINE=204
const BOTLIB_START_FRAME=205
const BOTLIB_LOAD_MAP=206
const BOTLIB_UPDATENTITY=207
const BOTLIB_TEST=208
const BOTLIB_GET_SNAPSHOT_ENTITY=209
const BOTLIB_GET_CONSOLE_MESSAGE=210
const BOTLIB_USER_COMMAND=211
const BOTLIB_AAS_ENABLE_ROUTING_AREA=300
const BOTLIB_AAS_BBOX_AREAS=301
const BOTLIB_AAS_AREA_INFO=302
const BOTLIB_AAS_ENTITY_INFO=303
const BOTLIB_AAS_INITIALIZED=304
const BOTLIB_AAS_PRESENCE_TYPE_BOUNDING_BOX=305
const BOTLIB_AAS_TIME=306
const BOTLIB_AAS_POINT_AREA_NUM=307
const BOTLIB_AAS_TRACE_AREAS=308
const BOTLIB_AAS_POINT_CONTENTS=309
const BOTLIB_AAS_NEXT_BSP_ENTITY=310
const BOTLIB_AAS_VALUE_FOR_BSP_EPAIR_KEY=311
const BOTLIB_AAS_VECTOR_FOR_BSP_EPAIR_KEY=312
const BOTLIB_AAS_FLOAT_FOR_BSP_EPAIR_KEY=313
const BOTLIB_AAS_INT_FOR_BSP_EPAIR_KEY=314
const BOTLIB_AAS_AREA_REACHABILITY=315
const BOTLIB_AAS_AREA_TRAVEL_TIME_TO_GOAL_AREA=316
const BOTLIB_AAS_SWIMMING=317
const BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT=318
const BOTLIB_EA_SAY=400
const BOTLIB_EA_SAY_TEAM=401
const BOTLIB_EA_COMMAND=402
const BOTLIB_EA_ACTION=403
const BOTLIB_EA_GESTURE=404
const BOTLIB_EA_TALK=405
const BOTLIB_EA_ATTACK=406
const BOTLIB_EA_USE=407
const BOTLIB_EA_RESPAWN=408
const BOTLIB_EA_CROUCH=409
const BOTLIB_EA_MOVE_UP=410
const BOTLIB_EA_MOVE_DOWN=411
const BOTLIB_EA_MOVE_FORWARD=412
const BOTLIB_EA_MOVE_BACK=413
const BOTLIB_EA_MOVE_LEFT=414
const BOTLIB_EA_MOVE_RIGHT=415
const BOTLIB_EA_SELECT_WEAPON=416
const BOTLIB_EA_JUMP=417
const BOTLIB_EA_DELAYED_JUMP=418
const BOTLIB_EA_MOVE=419
const BOTLIB_EA_VIEW=420
const BOTLIB_EA_END_REGULAR=421
const BOTLIB_EA_GET_INPUT=422
const BOTLIB_EA_RESET_INPUT=423
const BOTLIB_AI_LOAD_CHARACTER=500
const BOTLIB_AI_FREE_CHARACTER=501
const BOTLIB_AI_CHARACTERISTIC_FLOAT=502
const BOTLIB_AI_CHARACTERISTIC_BFLOAT=503
const BOTLIB_AI_CHARACTERISTIC_INTEGER=504
const BOTLIB_AI_CHARACTERISTIC_BINTEGER=505
const BOTLIB_AI_CHARACTERISTIC_STRING=506
const BOTLIB_AI_ALLOC_CHAT_STATE=507
const BOTLIB_AI_FREE_CHAT_STATE=508
const BOTLIB_AI_QUEUE_CONSOLE_MESSAGE=509
const BOTLIB_AI_REMOVE_CONSOLE_MESSAGE=510
const BOTLIB_AI_NEXT_CONSOLE_MESSAGE=511
const BOTLIB_AI_NUM_CONSOLE_MESSAGE=512
const BOTLIB_AI_INITIAL_CHAT=513
const BOTLIB_AI_REPLY_CHAT=514
const BOTLIB_AI_CHAT_LENGTH=515
const BOTLIB_AI_ENTER_CHAT=516
const BOTLIB_AI_STRING_CONTAINS=517
const BOTLIB_AI_FIND_MATCH=518
const BOTLIB_AI_MATCH_VARIABLE=519
const BOTLIB_AI_UNIFY_WHITE_SPACES=520
const BOTLIB_AI_REPLACE_SYNONYMS=521
const BOTLIB_AI_LOAD_CHAT_FILE=522
const BOTLIB_AI_SET_CHAT_GENDER=523
const BOTLIB_AI_SET_CHAT_NAME=524
const BOTLIB_AI_RESET_GOAL_STATE=525
const BOTLIB_AI_RESET_AVOID_GOALS=526
const BOTLIB_AI_PUSH_GOAL=527
const BOTLIB_AI_POP_GOAL=528
const BOTLIB_AI_EMPTY_GOAL_STACK=529
const BOTLIB_AI_DUMP_AVOID_GOALS=530
const BOTLIB_AI_DUMP_GOAL_STACK=531
const BOTLIB_AI_GOAL_NAME=532
const BOTLIB_AI_GET_TOP_GOAL=533
const BOTLIB_AI_GET_SECOND_GOAL=534
const BOTLIB_AI_CHOOSE_LTG_ITEM=535
const BOTLIB_AI_CHOOSE_NBG_ITEM=536
const BOTLIB_AI_TOUCHING_GOAL=537
const BOTLIB_AI_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE=538
const BOTLIB_AI_GET_LEVEL_ITEM_GOAL=539
const BOTLIB_AI_AVOID_GOAL_TIME=540
const BOTLIB_AI_INIT_LEVEL_ITEMS=541
const BOTLIB_AI_UPDATE_ENTITY_ITEMS=542
const BOTLIB_AI_LOAD_ITEM_WEIGHTS=543
const BOTLIB_AI_FREE_ITEM_WEIGHTS=544
const BOTLIB_AI_SAVE_GOAL_FUZZY_LOGIC=545
const BOTLIB_AI_ALLOC_GOAL_STATE=546
const BOTLIB_AI_FREE_GOAL_STATE=547
const BOTLIB_AI_RESET_MOVE_STATE=548
const BOTLIB_AI_MOVE_TO_GOAL=549
const BOTLIB_AI_MOVE_IN_DIRECTION=550
const BOTLIB_AI_RESET_AVOID_REACH=551
const BOTLIB_AI_RESET_LAST_AVOID_REACH=552
const BOTLIB_AI_REACHABILITY_AREA=553
const BOTLIB_AI_MOVEMENT_VIEW_TARGET=554
const BOTLIB_AI_ALLOC_MOVE_STATE=555
const BOTLIB_AI_FREE_MOVE_STATE=556
const BOTLIB_AI_INIT_MOVE_STATE=557
const BOTLIB_AI_CHOOSE_BEST_FIGHT_WEAPON=558
const BOTLIB_AI_GET_WEAPON_INFO=559
const BOTLIB_AI_LOAD_WEAPON_WEIGHTS=560
const BOTLIB_AI_ALLOC_WEAPON_STATE=561
const BOTLIB_AI_FREE_WEAPON_STATE=562
const BOTLIB_AI_RESET_WEAPON_STATE=563
const BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION=564
const BOTLIB_AI_INTERBREED_GOAL_FUZZY_LOGIC=565
const BOTLIB_AI_MUTATE_GOAL_FUZZY_LOGIC=566
const BOTLIB_AI_GET_NEXT_CAMP_SPOT_GOAL=567
const BOTLIB_AI_GET_MAP_LOCATION_GOAL=568
const BOTLIB_AI_NUM_INITIAL_CHATS=569
const BOTLIB_AI_GET_CHAT_MESSAGE=570
const BOTLIB_AI_REMOVE_FROM_AVOID_GOALS=571
const BOTLIB_AI_PREDICT_VISIBLE_POSITION=572
const BOTLIB_AI_SET_AVOID_GOAL_TIME=573
const BOTLIB_AI_ADD_AVOID_SPOT=574
const BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL=575
const BOTLIB_AAS_PREDICT_ROUTE=576
const BOTLIB_AAS_POINT_REACHABILITY_AREA_INDEX=577
const BOTLIB_PC_LOAD_SOURCE=578
const BOTLIB_PC_FREE_SOURCE=579
const BOTLIB_PC_READ_TOKEN=580
const BOTLIB_PC_SOURCE_FILE_AND_LINE=581

// trap_Printf
function trap_Printf(binding,fmt) return invokeVoid(binding,G_PRINT,[fmt]) end function
// trap_Error
function trap_Error(binding,fmt) return invokeVoid(binding,G_ERROR,[fmt]) end function
// trap_Milliseconds
function trap_Milliseconds(binding) return invoke(binding,G_MILLISECONDS,[]) end function
// trap_Argc
function trap_Argc(binding) return invoke(binding,G_ARGC,[]) end function
// trap_Argv
function trap_Argv(binding,n,buffer,bufferLength) return invokeVoid(binding,G_ARGV,[n,buffer,bufferLength]) end function
// trap_FS_FOpenFile
function trap_FS_FOpenFile(binding,qpath,f,mode) return invoke(binding,G_FS_FOPEN_FILE,[qpath,f,mode]) end function
// trap_FS_Read
function trap_FS_Read(binding,buffer,len,f) return invokeVoid(binding,G_FS_READ,[buffer,len,f]) end function
// trap_FS_Write
function trap_FS_Write(binding,buffer,len,f) return invokeVoid(binding,G_FS_WRITE,[buffer,len,f]) end function
// trap_FS_FCloseFile
function trap_FS_FCloseFile(binding,f) return invokeVoid(binding,G_FS_FCLOSE_FILE,[f]) end function
// trap_FS_GetFileList
function trap_FS_GetFileList(binding,path,extension,listbuf,bufsize) return invoke(binding,G_FS_GETFILELIST,[path,extension,listbuf,bufsize]) end function
// trap_FS_Seek
function trap_FS_Seek(binding,f,offset,origin) return invoke(binding,G_FS_SEEK,[f,offset,origin]) end function
// trap_SendConsoleCommand
function trap_SendConsoleCommand(binding,exec_when,text) return invokeVoid(binding,G_SEND_CONSOLE_COMMAND,[exec_when,text]) end function
// trap_Cvar_Register
function trap_Cvar_Register(binding,cvar,var_name,value,flags) return invokeVoid(binding,G_CVAR_REGISTER,[cvar,var_name,value,flags]) end function
// trap_Cvar_Update
function trap_Cvar_Update(binding,cvar) return invokeVoid(binding,G_CVAR_UPDATE,[cvar]) end function
// trap_Cvar_Set
function trap_Cvar_Set(binding,var_name,value) return invokeVoid(binding,G_CVAR_SET,[var_name,value]) end function
// trap_Cvar_VariableIntegerValue
function trap_Cvar_VariableIntegerValue(binding,var_name) return invoke(binding,G_CVAR_VARIABLE_INTEGER_VALUE,[var_name]) end function
// trap_Cvar_VariableStringBuffer
function trap_Cvar_VariableStringBuffer(binding,var_name,buffer,bufsize) return invokeVoid(binding,G_CVAR_VARIABLE_STRING_BUFFER,[var_name,buffer,bufsize]) end function
// trap_LocateGameData
function trap_LocateGameData(binding,gEnts,numGEntities,sizeofGEntity_t,clients,sizeofGClient) return invokeVoid(binding,G_LOCATE_GAME_DATA,[gEnts,numGEntities,sizeofGEntity_t,clients,sizeofGClient]) end function
// trap_DropClient
function trap_DropClient(binding,clientNum,reason) return invokeVoid(binding,G_DROP_CLIENT,[clientNum,reason]) end function
// trap_SendServerCommand
function trap_SendServerCommand(binding,clientNum,text) return invokeVoid(binding,G_SEND_SERVER_COMMAND,[clientNum,text]) end function
// trap_SetConfigstring
function trap_SetConfigstring(binding,num,string) return invokeVoid(binding,G_SET_CONFIGSTRING,[num,string]) end function
// trap_GetConfigstring
function trap_GetConfigstring(binding,num,buffer,bufferSize) return invokeVoid(binding,G_GET_CONFIGSTRING,[num,buffer,bufferSize]) end function
// trap_GetUserinfo
function trap_GetUserinfo(binding,num,buffer,bufferSize) return invokeVoid(binding,G_GET_USERINFO,[num,buffer,bufferSize]) end function
// trap_SetUserinfo
function trap_SetUserinfo(binding,num,buffer) return invokeVoid(binding,G_SET_USERINFO,[num,buffer]) end function
// trap_GetServerinfo
function trap_GetServerinfo(binding,buffer,bufferSize) return invokeVoid(binding,G_GET_SERVERINFO,[buffer,bufferSize]) end function
// trap_SetBrushModel
function trap_SetBrushModel(binding,ent,name) return invokeVoid(binding,G_SET_BRUSH_MODEL,[ent,name]) end function
// trap_Trace
function trap_Trace(binding,results,start,mins,maxs,finish,passEntityNum,contentmask) return invokeVoid(binding,G_TRACE,[results,start,mins,maxs,finish,passEntityNum,contentmask]) end function
// trap_TraceCapsule
function trap_TraceCapsule(binding,results,start,mins,maxs,finish,passEntityNum,contentmask) return invokeVoid(binding,G_TRACECAPSULE,[results,start,mins,maxs,finish,passEntityNum,contentmask]) end function
// trap_PointContents
function trap_PointContents(binding,point,passEntityNum) return invoke(binding,G_POINT_CONTENTS,[point,passEntityNum]) end function
// trap_InPVS
function trap_InPVS(binding,p1,p2) return invoke(binding,G_IN_PVS,[p1,p2]) end function
// trap_InPVSIgnorePortals
function trap_InPVSIgnorePortals(binding,p1,p2) return invoke(binding,G_IN_PVS_IGNORE_PORTALS,[p1,p2]) end function
// trap_AdjustAreaPortalState
function trap_AdjustAreaPortalState(binding,ent,open) return invokeVoid(binding,G_ADJUST_AREA_PORTAL_STATE,[ent,open]) end function
// trap_AreasConnected
function trap_AreasConnected(binding,area1,area2) return invoke(binding,G_AREAS_CONNECTED,[area1,area2]) end function
// trap_LinkEntity
function trap_LinkEntity(binding,ent) return invokeVoid(binding,G_LINKENTITY,[ent]) end function
// trap_UnlinkEntity
function trap_UnlinkEntity(binding,ent) return invokeVoid(binding,G_UNLINKENTITY,[ent]) end function
// trap_EntitiesInBox
function trap_EntitiesInBox(binding,mins,maxs,list,maxcount) return invoke(binding,G_ENTITIES_IN_BOX,[mins,maxs,list,maxcount]) end function
// trap_EntityContact
function trap_EntityContact(binding,mins,maxs,ent) return invoke(binding,G_ENTITY_CONTACT,[mins,maxs,ent]) end function
// trap_EntityContactCapsule
function trap_EntityContactCapsule(binding,mins,maxs,ent) return invoke(binding,G_ENTITY_CONTACTCAPSULE,[mins,maxs,ent]) end function
// trap_BotAllocateClient
function trap_BotAllocateClient(binding) return invoke(binding,G_BOT_ALLOCATE_CLIENT,[]) end function
// trap_BotFreeClient
function trap_BotFreeClient(binding,clientNum) return invokeVoid(binding,G_BOT_FREE_CLIENT,[clientNum]) end function
// trap_GetUsercmd
function trap_GetUsercmd(binding,clientNum,cmd) return invokeVoid(binding,G_GET_USERCMD,[clientNum,cmd]) end function
// trap_GetEntityToken
function trap_GetEntityToken(binding,buffer,bufferSize) return invoke(binding,G_GET_ENTITY_TOKEN,[buffer,bufferSize]) end function
// trap_DebugPolygonCreate
function trap_DebugPolygonCreate(binding,color,numPoints,points) return invoke(binding,G_DEBUG_POLYGON_CREATE,[color,numPoints,points]) end function
// trap_DebugPolygonDelete
function trap_DebugPolygonDelete(binding,id) return invokeVoid(binding,G_DEBUG_POLYGON_DELETE,[id]) end function
// trap_RealTime
function trap_RealTime(binding,qtime) return invoke(binding,G_REAL_TIME,[qtime]) end function
// trap_SnapVector
function trap_SnapVector(binding,v) return invokeVoid(binding,G_SNAPVECTOR,[v]) end function
// trap_BotLibSetup
function trap_BotLibSetup(binding) return invoke(binding,BOTLIB_SETUP,[]) end function
// trap_BotLibShutdown
function trap_BotLibShutdown(binding) return invoke(binding,BOTLIB_SHUTDOWN,[]) end function
// trap_BotLibVarSet
function trap_BotLibVarSet(binding,var_name,value) return invoke(binding,BOTLIB_LIBVAR_SET,[var_name,value]) end function
// trap_BotLibVarGet
function trap_BotLibVarGet(binding,var_name,value,size) return invoke(binding,BOTLIB_LIBVAR_GET,[var_name,value,size]) end function
// trap_BotLibDefine
function trap_BotLibDefine(binding,string) return invoke(binding,BOTLIB_PC_ADD_GLOBAL_DEFINE,[string]) end function
// trap_BotLibStartFrame
function trap_BotLibStartFrame(binding,time) return invoke(binding,BOTLIB_START_FRAME,[PASSFLOAT(time)]) end function
// trap_BotLibLoadMap
function trap_BotLibLoadMap(binding,mapname) return invoke(binding,BOTLIB_LOAD_MAP,[mapname]) end function
// trap_BotLibUpdateEntity
function trap_BotLibUpdateEntity(binding,ent,bue) return invoke(binding,BOTLIB_UPDATENTITY,[ent,bue]) end function
// trap_BotLibTest
function trap_BotLibTest(binding,parm0,parm1,parm2,parm3) return invoke(binding,BOTLIB_TEST,[parm0,parm1,parm2,parm3]) end function
// trap_BotGetSnapshotEntity
function trap_BotGetSnapshotEntity(binding,clientNum,sequence) return invoke(binding,BOTLIB_GET_SNAPSHOT_ENTITY,[clientNum,sequence]) end function
// trap_BotGetServerCommand
function trap_BotGetServerCommand(binding,clientNum,message,size) return invoke(binding,BOTLIB_GET_CONSOLE_MESSAGE,[clientNum,message,size]) end function
// trap_BotUserCommand
function trap_BotUserCommand(binding,clientNum,ucmd) return invokeVoid(binding,BOTLIB_USER_COMMAND,[clientNum,ucmd]) end function
// trap_AAS_EntityInfo
function trap_AAS_EntityInfo(binding,entnum,info) return invokeVoid(binding,BOTLIB_AAS_ENTITY_INFO,[entnum,info]) end function
// trap_AAS_Initialized
function trap_AAS_Initialized(binding) return invoke(binding,BOTLIB_AAS_INITIALIZED,[]) end function
// trap_AAS_PresenceTypeBoundingBox
function trap_AAS_PresenceTypeBoundingBox(binding,presencetype,mins,maxs) return invokeVoid(binding,BOTLIB_AAS_PRESENCE_TYPE_BOUNDING_BOX,[presencetype,mins,maxs]) end function
// trap_AAS_Time
function trap_AAS_Time(binding) return invokeFloat(binding,BOTLIB_AAS_TIME,[]) end function
// trap_AAS_PointAreaNum
function trap_AAS_PointAreaNum(binding,point) return invoke(binding,BOTLIB_AAS_POINT_AREA_NUM,[point]) end function
// trap_AAS_PointReachabilityAreaIndex
function trap_AAS_PointReachabilityAreaIndex(binding,point) return invoke(binding,BOTLIB_AAS_POINT_REACHABILITY_AREA_INDEX,[point]) end function
// trap_AAS_TraceAreas
function trap_AAS_TraceAreas(binding,start,finish,areas,points,maxareas) return invoke(binding,BOTLIB_AAS_TRACE_AREAS,[start,finish,areas,points,maxareas]) end function
// trap_AAS_BBoxAreas
function trap_AAS_BBoxAreas(binding,absmins,absmaxs,areas,maxareas) return invoke(binding,BOTLIB_AAS_BBOX_AREAS,[absmins,absmaxs,areas,maxareas]) end function
// trap_AAS_AreaInfo
function trap_AAS_AreaInfo(binding,areanum,info) return invoke(binding,BOTLIB_AAS_AREA_INFO,[areanum,info]) end function
// trap_AAS_PointContents
function trap_AAS_PointContents(binding,point) return invoke(binding,BOTLIB_AAS_POINT_CONTENTS,[point]) end function
// trap_AAS_NextBSPEntity
function trap_AAS_NextBSPEntity(binding,ent) return invoke(binding,BOTLIB_AAS_NEXT_BSP_ENTITY,[ent]) end function
// trap_AAS_ValueForBSPEpairKey
function trap_AAS_ValueForBSPEpairKey(binding,ent,key,value,size) return invoke(binding,BOTLIB_AAS_VALUE_FOR_BSP_EPAIR_KEY,[ent,key,value,size]) end function
// trap_AAS_VectorForBSPEpairKey
function trap_AAS_VectorForBSPEpairKey(binding,ent,key,v) return invoke(binding,BOTLIB_AAS_VECTOR_FOR_BSP_EPAIR_KEY,[ent,key,v]) end function
// trap_AAS_FloatForBSPEpairKey
function trap_AAS_FloatForBSPEpairKey(binding,ent,key,value) return invoke(binding,BOTLIB_AAS_FLOAT_FOR_BSP_EPAIR_KEY,[ent,key,value]) end function
// trap_AAS_IntForBSPEpairKey
function trap_AAS_IntForBSPEpairKey(binding,ent,key,value) return invoke(binding,BOTLIB_AAS_INT_FOR_BSP_EPAIR_KEY,[ent,key,value]) end function
// trap_AAS_AreaReachability
function trap_AAS_AreaReachability(binding,areanum) return invoke(binding,BOTLIB_AAS_AREA_REACHABILITY,[areanum]) end function
// trap_AAS_AreaTravelTimeToGoalArea
function trap_AAS_AreaTravelTimeToGoalArea(binding,areanum,origin,goalareanum,travelflags) return invoke(binding,BOTLIB_AAS_AREA_TRAVEL_TIME_TO_GOAL_AREA,[areanum,origin,goalareanum,travelflags]) end function
// trap_AAS_EnableRoutingArea
function trap_AAS_EnableRoutingArea(binding,areanum,enable) return invoke(binding,BOTLIB_AAS_ENABLE_ROUTING_AREA,[areanum,enable]) end function
// trap_AAS_PredictRoute
function trap_AAS_PredictRoute(binding,route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum) return invoke(binding,BOTLIB_AAS_PREDICT_ROUTE,[route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum]) end function
// trap_AAS_AlternativeRouteGoals
function trap_AAS_AlternativeRouteGoals(binding,start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type) return invoke(binding,BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL,[start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type]) end function
// trap_AAS_Swimming
function trap_AAS_Swimming(binding,origin) return invoke(binding,BOTLIB_AAS_SWIMMING,[origin]) end function
// trap_AAS_PredictClientMovement
function trap_AAS_PredictClientMovement(binding,move,entnum,origin,presencetype,onground,velocity,cmdmove,cmdframes,maxframes,frametime,stopevent,stopareanum,visualize) return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdmove,cmdframes,maxframes,PASSFLOAT(frametime),stopevent,stopareanum,visualize]) end function
// trap_EA_Say
function trap_EA_Say(binding,client,str) return invokeVoid(binding,BOTLIB_EA_SAY,[client,str]) end function
// trap_EA_SayTeam
function trap_EA_SayTeam(binding,client,str) return invokeVoid(binding,BOTLIB_EA_SAY_TEAM,[client,str]) end function
// trap_EA_Command
function trap_EA_Command(binding,client,command) return invokeVoid(binding,BOTLIB_EA_COMMAND,[client,command]) end function
// trap_EA_Action
function trap_EA_Action(binding,client,action) return invokeVoid(binding,BOTLIB_EA_ACTION,[client,action]) end function
// trap_EA_Gesture
function trap_EA_Gesture(binding,client) return invokeVoid(binding,BOTLIB_EA_GESTURE,[client]) end function
// trap_EA_Talk
function trap_EA_Talk(binding,client) return invokeVoid(binding,BOTLIB_EA_TALK,[client]) end function
// trap_EA_Attack
function trap_EA_Attack(binding,client) return invokeVoid(binding,BOTLIB_EA_ATTACK,[client]) end function
// trap_EA_Use
function trap_EA_Use(binding,client) return invokeVoid(binding,BOTLIB_EA_USE,[client]) end function
// trap_EA_Respawn
function trap_EA_Respawn(binding,client) return invokeVoid(binding,BOTLIB_EA_RESPAWN,[client]) end function
// trap_EA_Crouch
function trap_EA_Crouch(binding,client) return invokeVoid(binding,BOTLIB_EA_CROUCH,[client]) end function
// trap_EA_MoveUp
function trap_EA_MoveUp(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_UP,[client]) end function
// trap_EA_MoveDown
function trap_EA_MoveDown(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_DOWN,[client]) end function
// trap_EA_MoveForward
function trap_EA_MoveForward(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_FORWARD,[client]) end function
// trap_EA_MoveBack
function trap_EA_MoveBack(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_BACK,[client]) end function
// trap_EA_MoveLeft
function trap_EA_MoveLeft(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_LEFT,[client]) end function
// trap_EA_MoveRight
function trap_EA_MoveRight(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_RIGHT,[client]) end function
// trap_EA_SelectWeapon
function trap_EA_SelectWeapon(binding,client,weapon) return invokeVoid(binding,BOTLIB_EA_SELECT_WEAPON,[client,weapon]) end function
// trap_EA_Jump
function trap_EA_Jump(binding,client) return invokeVoid(binding,BOTLIB_EA_JUMP,[client]) end function
// trap_EA_DelayedJump
function trap_EA_DelayedJump(binding,client) return invokeVoid(binding,BOTLIB_EA_DELAYED_JUMP,[client]) end function
// trap_EA_Move
function trap_EA_Move(binding,client,dir,speed) return invokeVoid(binding,BOTLIB_EA_MOVE,[client,dir,PASSFLOAT(speed)]) end function
// trap_EA_View
function trap_EA_View(binding,client,viewangles) return invokeVoid(binding,BOTLIB_EA_VIEW,[client,viewangles]) end function
// trap_EA_EndRegular
function trap_EA_EndRegular(binding,client,thinktime) return invokeVoid(binding,BOTLIB_EA_END_REGULAR,[client,PASSFLOAT(thinktime)]) end function
// trap_EA_GetInput
function trap_EA_GetInput(binding,client,thinktime,input) return invokeVoid(binding,BOTLIB_EA_GET_INPUT,[client,PASSFLOAT(thinktime),input]) end function
// trap_EA_ResetInput
function trap_EA_ResetInput(binding,client) return invokeVoid(binding,BOTLIB_EA_RESET_INPUT,[client]) end function
// trap_BotLoadCharacter
function trap_BotLoadCharacter(binding,charfile,skill) return invoke(binding,BOTLIB_AI_LOAD_CHARACTER,[charfile,PASSFLOAT(skill)]) end function
// trap_BotFreeCharacter
function trap_BotFreeCharacter(binding,character) return invokeVoid(binding,BOTLIB_AI_FREE_CHARACTER,[character]) end function
// trap_Characteristic_Float
function trap_Characteristic_Float(binding,character,index) return invokeFloat(binding,BOTLIB_AI_CHARACTERISTIC_FLOAT,[character,index]) end function
// trap_Characteristic_BFloat
function trap_Characteristic_BFloat(binding,character,index,min,max) return invokeFloat(binding,BOTLIB_AI_CHARACTERISTIC_BFLOAT,[character,index,PASSFLOAT(min),PASSFLOAT(max)]) end function
// trap_Characteristic_Integer
function trap_Characteristic_Integer(binding,character,index) return invoke(binding,BOTLIB_AI_CHARACTERISTIC_INTEGER,[character,index]) end function
// trap_Characteristic_BInteger
function trap_Characteristic_BInteger(binding,character,index,min,max) return invoke(binding,BOTLIB_AI_CHARACTERISTIC_BINTEGER,[character,index,min,max]) end function
// trap_Characteristic_String
function trap_Characteristic_String(binding,character,index,buf,size) return invokeVoid(binding,BOTLIB_AI_CHARACTERISTIC_STRING,[character,index,buf,size]) end function
// trap_BotAllocChatState
function trap_BotAllocChatState(binding) return invoke(binding,BOTLIB_AI_ALLOC_CHAT_STATE,[]) end function
// trap_BotFreeChatState
function trap_BotFreeChatState(binding,handle) return invokeVoid(binding,BOTLIB_AI_FREE_CHAT_STATE,[handle]) end function
// trap_BotQueueConsoleMessage
function trap_BotQueueConsoleMessage(binding,chatstate,type,message) return invokeVoid(binding,BOTLIB_AI_QUEUE_CONSOLE_MESSAGE,[chatstate,type,message]) end function
// trap_BotRemoveConsoleMessage
function trap_BotRemoveConsoleMessage(binding,chatstate,handle) return invokeVoid(binding,BOTLIB_AI_REMOVE_CONSOLE_MESSAGE,[chatstate,handle]) end function
// trap_BotNextConsoleMessage
function trap_BotNextConsoleMessage(binding,chatstate,cm) return invoke(binding,BOTLIB_AI_NEXT_CONSOLE_MESSAGE,[chatstate,cm]) end function
// trap_BotNumConsoleMessages
function trap_BotNumConsoleMessages(binding,chatstate) return invoke(binding,BOTLIB_AI_NUM_CONSOLE_MESSAGE,[chatstate]) end function
// trap_BotInitialChat
function trap_BotInitialChat(binding,chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7) return invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7]) end function
// trap_BotNumInitialChats
function trap_BotNumInitialChats(binding,chatstate,type) return invoke(binding,BOTLIB_AI_NUM_INITIAL_CHATS,[chatstate,type]) end function
// trap_BotReplyChat
function trap_BotReplyChat(binding,chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7) return invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7]) end function
// trap_BotChatLength
function trap_BotChatLength(binding,chatstate) return invoke(binding,BOTLIB_AI_CHAT_LENGTH,[chatstate]) end function
// trap_BotEnterChat
function trap_BotEnterChat(binding,chatstate,client,sendto) return invokeVoid(binding,BOTLIB_AI_ENTER_CHAT,[chatstate,client,sendto]) end function
// trap_BotGetChatMessage
function trap_BotGetChatMessage(binding,chatstate,buf,size) return invokeVoid(binding,BOTLIB_AI_GET_CHAT_MESSAGE,[chatstate,buf,size]) end function
// trap_StringContains
function trap_StringContains(binding,str1,str2,casesensitive) return invoke(binding,BOTLIB_AI_STRING_CONTAINS,[str1,str2,casesensitive]) end function
// trap_BotFindMatch
function trap_BotFindMatch(binding,str,match,context) return invoke(binding,BOTLIB_AI_FIND_MATCH,[str,match,context]) end function
// trap_BotMatchVariable
function trap_BotMatchVariable(binding,match,variable,buf,size) return invokeVoid(binding,BOTLIB_AI_MATCH_VARIABLE,[match,variable,buf,size]) end function
// trap_UnifyWhiteSpaces
function trap_UnifyWhiteSpaces(binding,string) return invokeVoid(binding,BOTLIB_AI_UNIFY_WHITE_SPACES,[string]) end function
// trap_BotReplaceSynonyms
function trap_BotReplaceSynonyms(binding,string,context) return invokeVoid(binding,BOTLIB_AI_REPLACE_SYNONYMS,[string,context]) end function
// trap_BotLoadChatFile
function trap_BotLoadChatFile(binding,chatstate,chatfile,chatname) return invoke(binding,BOTLIB_AI_LOAD_CHAT_FILE,[chatstate,chatfile,chatname]) end function
// trap_BotSetChatGender
function trap_BotSetChatGender(binding,chatstate,gender) return invokeVoid(binding,BOTLIB_AI_SET_CHAT_GENDER,[chatstate,gender]) end function
// trap_BotSetChatName
function trap_BotSetChatName(binding,chatstate,name,client) return invokeVoid(binding,BOTLIB_AI_SET_CHAT_NAME,[chatstate,name,client]) end function
// trap_BotResetGoalState
function trap_BotResetGoalState(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_RESET_GOAL_STATE,[goalstate]) end function
// trap_BotResetAvoidGoals
function trap_BotResetAvoidGoals(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_RESET_AVOID_GOALS,[goalstate]) end function
// trap_BotRemoveFromAvoidGoals
function trap_BotRemoveFromAvoidGoals(binding,goalstate,number) return invokeVoid(binding,BOTLIB_AI_REMOVE_FROM_AVOID_GOALS,[goalstate,number]) end function
// trap_BotPushGoal
function trap_BotPushGoal(binding,goalstate,goal) return invokeVoid(binding,BOTLIB_AI_PUSH_GOAL,[goalstate,goal]) end function
// trap_BotPopGoal
function trap_BotPopGoal(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_POP_GOAL,[goalstate]) end function
// trap_BotEmptyGoalStack
function trap_BotEmptyGoalStack(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_EMPTY_GOAL_STACK,[goalstate]) end function
// trap_BotDumpAvoidGoals
function trap_BotDumpAvoidGoals(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_DUMP_AVOID_GOALS,[goalstate]) end function
// trap_BotDumpGoalStack
function trap_BotDumpGoalStack(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_DUMP_GOAL_STACK,[goalstate]) end function
// trap_BotGoalName
function trap_BotGoalName(binding,number,name,size) return invokeVoid(binding,BOTLIB_AI_GOAL_NAME,[number,name,size]) end function
// trap_BotGetTopGoal
function trap_BotGetTopGoal(binding,goalstate,goal) return invoke(binding,BOTLIB_AI_GET_TOP_GOAL,[goalstate,goal]) end function
// trap_BotGetSecondGoal
function trap_BotGetSecondGoal(binding,goalstate,goal) return invoke(binding,BOTLIB_AI_GET_SECOND_GOAL,[goalstate,goal]) end function
// trap_BotChooseLTGItem
function trap_BotChooseLTGItem(binding,goalstate,origin,inventory,travelflags) return invoke(binding,BOTLIB_AI_CHOOSE_LTG_ITEM,[goalstate,origin,inventory,travelflags]) end function
// trap_BotChooseNBGItem
function trap_BotChooseNBGItem(binding,goalstate,origin,inventory,travelflags,ltg,maxtime) return invoke(binding,BOTLIB_AI_CHOOSE_NBG_ITEM,[goalstate,origin,inventory,travelflags,ltg,PASSFLOAT(maxtime)]) end function
// trap_BotTouchingGoal
function trap_BotTouchingGoal(binding,origin,goal) return invoke(binding,BOTLIB_AI_TOUCHING_GOAL,[origin,goal]) end function
// trap_BotItemGoalInVisButNotVisible
function trap_BotItemGoalInVisButNotVisible(binding,viewer,eye,viewangles,goal) return invoke(binding,BOTLIB_AI_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE,[viewer,eye,viewangles,goal]) end function
// trap_BotGetLevelItemGoal
function trap_BotGetLevelItemGoal(binding,index,classname,goal) return invoke(binding,BOTLIB_AI_GET_LEVEL_ITEM_GOAL,[index,classname,goal]) end function
// trap_BotGetNextCampSpotGoal
function trap_BotGetNextCampSpotGoal(binding,num,goal) return invoke(binding,BOTLIB_AI_GET_NEXT_CAMP_SPOT_GOAL,[num,goal]) end function
// trap_BotGetMapLocationGoal
function trap_BotGetMapLocationGoal(binding,name,goal) return invoke(binding,BOTLIB_AI_GET_MAP_LOCATION_GOAL,[name,goal]) end function
// trap_BotAvoidGoalTime
function trap_BotAvoidGoalTime(binding,goalstate,number) return invokeFloat(binding,BOTLIB_AI_AVOID_GOAL_TIME,[goalstate,number]) end function
// trap_BotSetAvoidGoalTime
function trap_BotSetAvoidGoalTime(binding,goalstate,number,avoidtime) return invokeVoid(binding,BOTLIB_AI_SET_AVOID_GOAL_TIME,[goalstate,number,PASSFLOAT(avoidtime)]) end function
// trap_BotInitLevelItems
function trap_BotInitLevelItems(binding) return invokeVoid(binding,BOTLIB_AI_INIT_LEVEL_ITEMS,[]) end function
// trap_BotUpdateEntityItems
function trap_BotUpdateEntityItems(binding) return invokeVoid(binding,BOTLIB_AI_UPDATE_ENTITY_ITEMS,[]) end function
// trap_BotLoadItemWeights
function trap_BotLoadItemWeights(binding,goalstate,filename) return invoke(binding,BOTLIB_AI_LOAD_ITEM_WEIGHTS,[goalstate,filename]) end function
// trap_BotFreeItemWeights
function trap_BotFreeItemWeights(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_FREE_ITEM_WEIGHTS,[goalstate]) end function
// trap_BotInterbreedGoalFuzzyLogic
function trap_BotInterbreedGoalFuzzyLogic(binding,parent1,parent2,child) return invokeVoid(binding,BOTLIB_AI_INTERBREED_GOAL_FUZZY_LOGIC,[parent1,parent2,child]) end function
// trap_BotSaveGoalFuzzyLogic
function trap_BotSaveGoalFuzzyLogic(binding,goalstate,filename) return invokeVoid(binding,BOTLIB_AI_SAVE_GOAL_FUZZY_LOGIC,[goalstate,filename]) end function
// trap_BotMutateGoalFuzzyLogic
function trap_BotMutateGoalFuzzyLogic(binding,goalstate,range) return invokeVoid(binding,BOTLIB_AI_MUTATE_GOAL_FUZZY_LOGIC,[goalstate,promotedFloatLow(range)]) end function
// trap_BotAllocGoalState
function trap_BotAllocGoalState(binding,state) return invoke(binding,BOTLIB_AI_ALLOC_GOAL_STATE,[state]) end function
// trap_BotFreeGoalState
function trap_BotFreeGoalState(binding,handle) return invokeVoid(binding,BOTLIB_AI_FREE_GOAL_STATE,[handle]) end function
// trap_BotResetMoveState
function trap_BotResetMoveState(binding,movestate) return invokeVoid(binding,BOTLIB_AI_RESET_MOVE_STATE,[movestate]) end function
// trap_BotAddAvoidSpot
function trap_BotAddAvoidSpot(binding,movestate,origin,radius,type) return invokeVoid(binding,BOTLIB_AI_ADD_AVOID_SPOT,[movestate,origin,PASSFLOAT(radius),type]) end function
// trap_BotMoveToGoal
function trap_BotMoveToGoal(binding,result,movestate,goal,travelflags) return invokeVoid(binding,BOTLIB_AI_MOVE_TO_GOAL,[result,movestate,goal,travelflags]) end function
// trap_BotMoveInDirection
function trap_BotMoveInDirection(binding,movestate,dir,speed,type) return invoke(binding,BOTLIB_AI_MOVE_IN_DIRECTION,[movestate,dir,PASSFLOAT(speed),type]) end function
// trap_BotResetAvoidReach
function trap_BotResetAvoidReach(binding,movestate) return invokeVoid(binding,BOTLIB_AI_RESET_AVOID_REACH,[movestate]) end function
// trap_BotResetLastAvoidReach
function trap_BotResetLastAvoidReach(binding,movestate) return invokeVoid(binding,BOTLIB_AI_RESET_LAST_AVOID_REACH,[movestate]) end function
// trap_BotReachabilityArea
function trap_BotReachabilityArea(binding,origin,testground) return invoke(binding,BOTLIB_AI_REACHABILITY_AREA,[origin,testground]) end function
// trap_BotMovementViewTarget
function trap_BotMovementViewTarget(binding,movestate,goal,travelflags,lookahead,target) return invoke(binding,BOTLIB_AI_MOVEMENT_VIEW_TARGET,[movestate,goal,travelflags,PASSFLOAT(lookahead),target]) end function
// trap_BotPredictVisiblePosition
function trap_BotPredictVisiblePosition(binding,origin,areanum,goal,travelflags,target) return invoke(binding,BOTLIB_AI_PREDICT_VISIBLE_POSITION,[origin,areanum,goal,travelflags,target]) end function
// trap_BotAllocMoveState
function trap_BotAllocMoveState(binding) return invoke(binding,BOTLIB_AI_ALLOC_MOVE_STATE,[]) end function
// trap_BotFreeMoveState
function trap_BotFreeMoveState(binding,handle) return invokeVoid(binding,BOTLIB_AI_FREE_MOVE_STATE,[handle]) end function
// trap_BotInitMoveState
function trap_BotInitMoveState(binding,handle,initmove) return invokeVoid(binding,BOTLIB_AI_INIT_MOVE_STATE,[handle,initmove]) end function
// trap_BotChooseBestFightWeapon
function trap_BotChooseBestFightWeapon(binding,weaponstate,inventory) return invoke(binding,BOTLIB_AI_CHOOSE_BEST_FIGHT_WEAPON,[weaponstate,inventory]) end function
// trap_BotGetWeaponInfo
function trap_BotGetWeaponInfo(binding,weaponstate,weapon,weaponinfo) return invokeVoid(binding,BOTLIB_AI_GET_WEAPON_INFO,[weaponstate,weapon,weaponinfo]) end function
// trap_BotLoadWeaponWeights
function trap_BotLoadWeaponWeights(binding,weaponstate,filename) return invoke(binding,BOTLIB_AI_LOAD_WEAPON_WEIGHTS,[weaponstate,filename]) end function
// trap_BotAllocWeaponState
function trap_BotAllocWeaponState(binding) return invoke(binding,BOTLIB_AI_ALLOC_WEAPON_STATE,[]) end function
// trap_BotFreeWeaponState
function trap_BotFreeWeaponState(binding,weaponstate) return invokeVoid(binding,BOTLIB_AI_FREE_WEAPON_STATE,[weaponstate]) end function
// trap_BotResetWeaponState
function trap_BotResetWeaponState(binding,weaponstate) return invokeVoid(binding,BOTLIB_AI_RESET_WEAPON_STATE,[weaponstate]) end function
// trap_GeneticParentsAndChildSelection
function trap_GeneticParentsAndChildSelection(binding,numranks,ranks,parent1,parent2,child) return invoke(binding,BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION,[numranks,ranks,parent1,parent2,child]) end function
// trap_PC_LoadSource
function trap_PC_LoadSource(binding,filename) return invoke(binding,BOTLIB_PC_LOAD_SOURCE,[filename]) end function
// trap_PC_FreeSource
function trap_PC_FreeSource(binding,handle) return invoke(binding,BOTLIB_PC_FREE_SOURCE,[handle]) end function
// trap_PC_ReadToken
function trap_PC_ReadToken(binding,handle,pc_token) return invoke(binding,BOTLIB_PC_READ_TOKEN,[handle,pc_token]) end function
// trap_PC_SourceFileAndLine
function trap_PC_SourceFileAndLine(binding,handle,filename,line) return invoke(binding,BOTLIB_PC_SOURCE_FILE_AND_LINE,[handle,filename,line]) end function
