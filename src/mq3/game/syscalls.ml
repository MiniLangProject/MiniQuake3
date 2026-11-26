// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native ABI-exact wrappers for code/game/g_syscalls.c.
package mq3.game.syscalls

import mq3.compat.numeric as n

/// `Call` record for syscalls, containing `opcode`, `arguments` and `result`.
struct Call opcode arguments result end struct
/// `Binding` record for syscalls, containing `context`, `invokeFn` and `calls`.
struct Binding context invokeFn calls end struct

/// Create a `mq3.game.syscalls.Binding` record, initializing `context` from `context` and `invokeFn` from `syscallFn`.
/// @param syscallFn Initial value stored in `mq3.game.syscalls.Binding.invokeFn`.
/// @param context Context forwarded to the configured host callbacks.
function dllEntry(syscallFn,context) return Binding(context,syscallFn,[]) end function
/// Reinterpret a float as the signed 32-bit argument word required by the qagame syscall ABI.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
function PASSFLOAT(value) return n.i32(n.floatBits(value)) end function
/// Forward `passFloat` to `mq3.game.syscalls.PASSFLOAT` and return the delegated result.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
function passFloat(value) return PASSFLOAT(value) end function
// The original trap_BotMutateGoalFuzzyLogic omits PASSFLOAT. On the 32-bit
// DLL ABI its float parameter is promoted to binary64 and the syscall reads
// the low 32-bit word. Preserve that historical ABI quirk exactly.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
function promotedFloatLow(value) return n.i32((n.floatBits(value)&7)<<29) end function
/// Invoke the installed qagame syscall callback and record successful calls together with their returned values.
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param opcode Numeric qagame or botlib syscall identifier.
/// @param arguments Ordered syscall argument words passed unchanged to the installed callback.
function invoke(binding,opcode,arguments)
  if binding==void or binding.invokeFn==void then return error(7860,"qagame syscall entry is not installed") end if
  result=binding.invokeFn(binding.context,opcode,arguments);if result is error then return result end if;binding.calls=binding.calls+[Call(opcode,arguments,result)];return result
end function
/// Invoke a qagame syscall, propagate any error, and discard its successful return value.
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param opcode Numeric qagame or botlib syscall identifier.
/// @param arguments Ordered arguments consumed by the call or formatter.
function invokeVoid(binding,opcode,arguments) result=invoke(binding,opcode,arguments);if result is error then return result end if;return void end function
/// Invoke a qagame syscall and reinterpret its successful result word as a floating-point value.
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param opcode Numeric qagame or botlib syscall identifier.
/// @param arguments Ordered arguments consumed by the call or formatter.
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
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param fmt Operand used to evaluate the returned expression `invokeVoid(binding,G_PRINT,[fmt])`.
function trap_Printf(binding,fmt) return invokeVoid(binding,G_PRINT,[fmt]) end function
// trap_Error
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param fmt Operand used to evaluate the returned expression `invokeVoid(binding,G_ERROR,[fmt])`.
function trap_Error(binding,fmt) return invokeVoid(binding,G_ERROR,[fmt]) end function
// trap_Milliseconds
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_Milliseconds(binding) return invoke(binding,G_MILLISECONDS,[]) end function
// trap_Argc
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_Argc(binding) return invoke(binding,G_ARGC,[]) end function
// trap_Argv
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param n Operand used to evaluate the returned expression `invokeVoid(binding,G_ARGV,[n,buffer,bufferLength])`.
/// @param buffer Operand used to evaluate the returned expression `invokeVoid(binding,G_ARGV,[n,buffer,bufferLength])`.
/// @param bufferLength Operand used to evaluate the returned expression `invokeVoid(binding,G_ARGV,[n,buffer,bufferLength])`.
function trap_Argv(binding,n,buffer,bufferLength) return invokeVoid(binding,G_ARGV,[n,buffer,bufferLength]) end function
// trap_FS_FOpenFile
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param qpath Operand used to evaluate the returned expression `invoke(binding,G_FS_FOPEN_FILE,[qpath,f,mode])`.
/// @param f Operand used to evaluate the returned expression `invoke(binding,G_FS_FOPEN_FILE,[qpath,f,mode])`.
/// @param mode Operand used to evaluate the returned expression `invoke(binding,G_FS_FOPEN_FILE,[qpath,f,mode])`.
function trap_FS_FOpenFile(binding,qpath,f,mode) return invoke(binding,G_FS_FOPEN_FILE,[qpath,f,mode]) end function
// trap_FS_Read
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param buffer Operand used to evaluate the returned expression `invokeVoid(binding,G_FS_READ,[buffer,len,f])`.
/// @param len Operand used to evaluate the returned expression `invokeVoid(binding,G_FS_READ,[buffer,len,f])`.
/// @param f Operand used to evaluate the returned expression `invokeVoid(binding,G_FS_READ,[buffer,len,f])`.
function trap_FS_Read(binding,buffer,len,f) return invokeVoid(binding,G_FS_READ,[buffer,len,f]) end function
// trap_FS_Write
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param buffer Operand used to evaluate the returned expression `invokeVoid(binding,G_FS_WRITE,[buffer,len,f])`.
/// @param len Operand used to evaluate the returned expression `invokeVoid(binding,G_FS_WRITE,[buffer,len,f])`.
/// @param f Operand used to evaluate the returned expression `invokeVoid(binding,G_FS_WRITE,[buffer,len,f])`.
function trap_FS_Write(binding,buffer,len,f) return invokeVoid(binding,G_FS_WRITE,[buffer,len,f]) end function
// trap_FS_FCloseFile
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param f Operand used to evaluate the returned expression `invokeVoid(binding,G_FS_FCLOSE_FILE,[f])`.
function trap_FS_FCloseFile(binding,f) return invokeVoid(binding,G_FS_FCLOSE_FILE,[f]) end function
// trap_FS_GetFileList
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param path Resource path supplied to the file or parser operation.
/// @param extension Operand used to evaluate the returned expression `invoke(binding,G_FS_GETFILELIST,[path,extension,listbuf,bufsize])`.
/// @param listbuf Operand used to evaluate the returned expression `invoke(binding,G_FS_GETFILELIST,[path,extension,listbuf,bufsize])`.
/// @param bufsize Operand used to evaluate the returned expression `invoke(binding,G_FS_GETFILELIST,[path,extension,listbuf,bufsize])`.
function trap_FS_GetFileList(binding,path,extension,listbuf,bufsize) return invoke(binding,G_FS_GETFILELIST,[path,extension,listbuf,bufsize]) end function
// trap_FS_Seek
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param f Operand used to evaluate the returned expression `invoke(binding,G_FS_SEEK,[f,offset,origin])`.
/// @param offset Offset into the buffer or sequence used by this operation.
/// @param origin World-space position as three coordinates.
function trap_FS_Seek(binding,f,offset,origin) return invoke(binding,G_FS_SEEK,[f,offset,origin]) end function
// trap_SendConsoleCommand
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param exec_when Operand used to evaluate the returned expression `invokeVoid(binding,G_SEND_CONSOLE_COMMAND,[exec_when,text])`.
/// @param text Text to parse, format or deliver.
function trap_SendConsoleCommand(binding,exec_when,text) return invokeVoid(binding,G_SEND_CONSOLE_COMMAND,[exec_when,text]) end function
// trap_Cvar_Register
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param cvar Operand used to evaluate the returned expression `invokeVoid(binding,G_CVAR_REGISTER,[cvar,var_name,value,flags])`.
/// @param var_name Operand used to evaluate the returned expression `invokeVoid(binding,G_CVAR_REGISTER,[cvar,var_name,value,flags])`.
/// @param value Operand used to evaluate the returned expression `invokeVoid(binding,G_CVAR_REGISTER,[cvar,var_name,value,flags])`.
/// @param flags Operand used to evaluate the returned expression `invokeVoid(binding,G_CVAR_REGISTER,[cvar,var_name,value,flags])`.
function trap_Cvar_Register(binding,cvar,var_name,value,flags) return invokeVoid(binding,G_CVAR_REGISTER,[cvar,var_name,value,flags]) end function
// trap_Cvar_Update
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param cvar Operand used to evaluate the returned expression `invokeVoid(binding,G_CVAR_UPDATE,[cvar])`.
function trap_Cvar_Update(binding,cvar) return invokeVoid(binding,G_CVAR_UPDATE,[cvar]) end function
// trap_Cvar_Set
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param var_name Operand used to evaluate the returned expression `invokeVoid(binding,G_CVAR_SET,[var_name,value])`.
/// @param value Operand used to evaluate the returned expression `invokeVoid(binding,G_CVAR_SET,[var_name,value])`.
function trap_Cvar_Set(binding,var_name,value) return invokeVoid(binding,G_CVAR_SET,[var_name,value]) end function
// trap_Cvar_VariableIntegerValue
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param var_name Operand used to evaluate the returned expression `invoke(binding,G_CVAR_VARIABLE_INTEGER_VALUE,[var_name])`.
function trap_Cvar_VariableIntegerValue(binding,var_name) return invoke(binding,G_CVAR_VARIABLE_INTEGER_VALUE,[var_name]) end function
// trap_Cvar_VariableStringBuffer
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param var_name Operand used to evaluate the returned expression `invokeVoid(binding,G_CVAR_VARIABLE_STRING_BUFFER,[var_name,buffer,bufsize])`.
/// @param buffer Operand used to evaluate the returned expression `invokeVoid(binding,G_CVAR_VARIABLE_STRING_BUFFER,[var_name,buffer,bufsize])`.
/// @param bufsize Operand used to evaluate the returned expression `invokeVoid(binding,G_CVAR_VARIABLE_STRING_BUFFER,[var_name,buffer,bufsize])`.
function trap_Cvar_VariableStringBuffer(binding,var_name,buffer,bufsize) return invokeVoid(binding,G_CVAR_VARIABLE_STRING_BUFFER,[var_name,buffer,bufsize]) end function
// trap_LocateGameData
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param gEnts Operand used to evaluate the returned expression `invokeVoid(binding,G_LOCATE_GAME_DATA,[gEnts,numGEntities,sizeofGEntity_t,clients,sizeofGClient])`.
/// @param numGEntities Operand used to evaluate the returned expression `invokeVoid(binding,G_LOCATE_GAME_DATA,[gEnts,numGEntities,sizeofGEntity_t,clients,sizeofGClient])`.
/// @param sizeofGEntity_t Operand used to evaluate the returned expression `invokeVoid(binding,G_LOCATE_GAME_DATA,[gEnts,numGEntities,sizeofGEntity_t,clients,sizeofGClient])`.
/// @param clients Operand used to evaluate the returned expression `invokeVoid(binding,G_LOCATE_GAME_DATA,[gEnts,numGEntities,sizeofGEntity_t,clients,sizeofGClient])`.
/// @param sizeofGClient Operand used to evaluate the returned expression `invokeVoid(binding,G_LOCATE_GAME_DATA,[gEnts,numGEntities,sizeofGEntity_t,clients,sizeofGClient])`.
function trap_LocateGameData(binding,gEnts,numGEntities,sizeofGEntity_t,clients,sizeofGClient) return invokeVoid(binding,G_LOCATE_GAME_DATA,[gEnts,numGEntities,sizeofGEntity_t,clients,sizeofGClient]) end function
// trap_DropClient
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param clientNum Client slot number.
/// @param reason Reason text recorded with the operation.
function trap_DropClient(binding,clientNum,reason) return invokeVoid(binding,G_DROP_CLIENT,[clientNum,reason]) end function
// trap_SendServerCommand
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param clientNum Client slot number.
/// @param text Text to parse, format or deliver.
function trap_SendServerCommand(binding,clientNum,text) return invokeVoid(binding,G_SEND_SERVER_COMMAND,[clientNum,text]) end function
// trap_SetConfigstring
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param num Operand used to evaluate the returned expression `invokeVoid(binding,G_SET_CONFIGSTRING,[num,string])`.
/// @param string Operand used to evaluate the returned expression `invokeVoid(binding,G_SET_CONFIGSTRING,[num,string])`.
function trap_SetConfigstring(binding,num,string) return invokeVoid(binding,G_SET_CONFIGSTRING,[num,string]) end function
// trap_GetConfigstring
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param num Operand used to evaluate the returned expression `invokeVoid(binding,G_GET_CONFIGSTRING,[num,buffer,bufferSize])`.
/// @param buffer Operand used to evaluate the returned expression `invokeVoid(binding,G_GET_CONFIGSTRING,[num,buffer,bufferSize])`.
/// @param bufferSize Operand used to evaluate the returned expression `invokeVoid(binding,G_GET_CONFIGSTRING,[num,buffer,bufferSize])`.
function trap_GetConfigstring(binding,num,buffer,bufferSize) return invokeVoid(binding,G_GET_CONFIGSTRING,[num,buffer,bufferSize]) end function
// trap_GetUserinfo
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param num Operand used to evaluate the returned expression `invokeVoid(binding,G_GET_USERINFO,[num,buffer,bufferSize])`.
/// @param buffer Operand used to evaluate the returned expression `invokeVoid(binding,G_GET_USERINFO,[num,buffer,bufferSize])`.
/// @param bufferSize Operand used to evaluate the returned expression `invokeVoid(binding,G_GET_USERINFO,[num,buffer,bufferSize])`.
function trap_GetUserinfo(binding,num,buffer,bufferSize) return invokeVoid(binding,G_GET_USERINFO,[num,buffer,bufferSize]) end function
// trap_SetUserinfo
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param num Operand used to evaluate the returned expression `invokeVoid(binding,G_SET_USERINFO,[num,buffer])`.
/// @param buffer Operand used to evaluate the returned expression `invokeVoid(binding,G_SET_USERINFO,[num,buffer])`.
function trap_SetUserinfo(binding,num,buffer) return invokeVoid(binding,G_SET_USERINFO,[num,buffer]) end function
// trap_GetServerinfo
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param buffer Operand used to evaluate the returned expression `invokeVoid(binding,G_GET_SERVERINFO,[buffer,bufferSize])`.
/// @param bufferSize Operand used to evaluate the returned expression `invokeVoid(binding,G_GET_SERVERINFO,[buffer,bufferSize])`.
function trap_GetServerinfo(binding,buffer,bufferSize) return invokeVoid(binding,G_GET_SERVERINFO,[buffer,bufferSize]) end function
// trap_SetBrushModel
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param ent Operand used to evaluate the returned expression `invokeVoid(binding,G_SET_BRUSH_MODEL,[ent,name])`.
/// @param name Name used to identify the requested entry.
function trap_SetBrushModel(binding,ent,name) return invokeVoid(binding,G_SET_BRUSH_MODEL,[ent,name]) end function
// trap_Trace
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param results Operand used to evaluate the returned expression `invokeVoid(binding,G_TRACE,[results,start,mins,maxs,finish,passEntityNum,contentmask])`.
/// @param start Operand used to evaluate the returned expression `invokeVoid(binding,G_TRACE,[results,start,mins,maxs,finish,passEntityNum,contentmask])`.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param finish Operand used to evaluate the returned expression `invokeVoid(binding,G_TRACE,[results,start,mins,maxs,finish,passEntityNum,contentmask])`.
/// @param passEntityNum Operand used to evaluate the returned expression `invokeVoid(binding,G_TRACE,[results,start,mins,maxs,finish,passEntityNum,contentmask])`.
/// @param contentmask Operand used to evaluate the returned expression `invokeVoid(binding,G_TRACE,[results,start,mins,maxs,finish,passEntityNum,contentmask])`.
function trap_Trace(binding,results,start,mins,maxs,finish,passEntityNum,contentmask) return invokeVoid(binding,G_TRACE,[results,start,mins,maxs,finish,passEntityNum,contentmask]) end function
// trap_TraceCapsule
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param results Operand used to evaluate the returned expression `invokeVoid(binding,G_TRACECAPSULE,[results,start,mins,maxs,finish,passEntityNum,contentmask])`.
/// @param start Operand used to evaluate the returned expression `invokeVoid(binding,G_TRACECAPSULE,[results,start,mins,maxs,finish,passEntityNum,contentmask])`.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param finish Operand used to evaluate the returned expression `invokeVoid(binding,G_TRACECAPSULE,[results,start,mins,maxs,finish,passEntityNum,contentmask])`.
/// @param passEntityNum Operand used to evaluate the returned expression `invokeVoid(binding,G_TRACECAPSULE,[results,start,mins,maxs,finish,passEntityNum,contentmask])`.
/// @param contentmask Operand used to evaluate the returned expression `invokeVoid(binding,G_TRACECAPSULE,[results,start,mins,maxs,finish,passEntityNum,contentmask])`.
function trap_TraceCapsule(binding,results,start,mins,maxs,finish,passEntityNum,contentmask) return invokeVoid(binding,G_TRACECAPSULE,[results,start,mins,maxs,finish,passEntityNum,contentmask]) end function
// trap_PointContents
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param point Three-component point used by the geometric query.
/// @param passEntityNum Operand used to evaluate the returned expression `invoke(binding,G_POINT_CONTENTS,[point,passEntityNum])`.
function trap_PointContents(binding,point,passEntityNum) return invoke(binding,G_POINT_CONTENTS,[point,passEntityNum]) end function
// trap_InPVS
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param p1 Operand used to evaluate the returned expression `invoke(binding,G_IN_PVS,[p1,p2])`.
/// @param p2 Operand used to evaluate the returned expression `invoke(binding,G_IN_PVS,[p1,p2])`.
function trap_InPVS(binding,p1,p2) return invoke(binding,G_IN_PVS,[p1,p2]) end function
// trap_InPVSIgnorePortals
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param p1 Operand used to evaluate the returned expression `invoke(binding,G_IN_PVS_IGNORE_PORTALS,[p1,p2])`.
/// @param p2 Operand used to evaluate the returned expression `invoke(binding,G_IN_PVS_IGNORE_PORTALS,[p1,p2])`.
function trap_InPVSIgnorePortals(binding,p1,p2) return invoke(binding,G_IN_PVS_IGNORE_PORTALS,[p1,p2]) end function
// trap_AdjustAreaPortalState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param ent Operand used to evaluate the returned expression `invokeVoid(binding,G_ADJUST_AREA_PORTAL_STATE,[ent,open])`.
/// @param open Operand used to evaluate the returned expression `invokeVoid(binding,G_ADJUST_AREA_PORTAL_STATE,[ent,open])`.
function trap_AdjustAreaPortalState(binding,ent,open) return invokeVoid(binding,G_ADJUST_AREA_PORTAL_STATE,[ent,open]) end function
// trap_AreasConnected
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param area1 Operand used to evaluate the returned expression `invoke(binding,G_AREAS_CONNECTED,[area1,area2])`.
/// @param area2 Operand used to evaluate the returned expression `invoke(binding,G_AREAS_CONNECTED,[area1,area2])`.
function trap_AreasConnected(binding,area1,area2) return invoke(binding,G_AREAS_CONNECTED,[area1,area2]) end function
// trap_LinkEntity
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param ent Operand used to evaluate the returned expression `invokeVoid(binding,G_LINKENTITY,[ent])`.
function trap_LinkEntity(binding,ent) return invokeVoid(binding,G_LINKENTITY,[ent]) end function
// trap_UnlinkEntity
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param ent Operand used to evaluate the returned expression `invokeVoid(binding,G_UNLINKENTITY,[ent])`.
function trap_UnlinkEntity(binding,ent) return invokeVoid(binding,G_UNLINKENTITY,[ent]) end function
// trap_EntitiesInBox
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param list Operand used to evaluate the returned expression `invoke(binding,G_ENTITIES_IN_BOX,[mins,maxs,list,maxcount])`.
/// @param maxcount Operand used to evaluate the returned expression `invoke(binding,G_ENTITIES_IN_BOX,[mins,maxs,list,maxcount])`.
function trap_EntitiesInBox(binding,mins,maxs,list,maxcount) return invoke(binding,G_ENTITIES_IN_BOX,[mins,maxs,list,maxcount]) end function
// trap_EntityContact
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param ent Operand used to evaluate the returned expression `invoke(binding,G_ENTITY_CONTACT,[mins,maxs,ent])`.
function trap_EntityContact(binding,mins,maxs,ent) return invoke(binding,G_ENTITY_CONTACT,[mins,maxs,ent]) end function
// trap_EntityContactCapsule
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param ent Operand used to evaluate the returned expression `invoke(binding,G_ENTITY_CONTACTCAPSULE,[mins,maxs,ent])`.
function trap_EntityContactCapsule(binding,mins,maxs,ent) return invoke(binding,G_ENTITY_CONTACTCAPSULE,[mins,maxs,ent]) end function
// trap_BotAllocateClient
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_BotAllocateClient(binding) return invoke(binding,G_BOT_ALLOCATE_CLIENT,[]) end function
// trap_BotFreeClient
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param clientNum Client slot number.
function trap_BotFreeClient(binding,clientNum) return invokeVoid(binding,G_BOT_FREE_CLIENT,[clientNum]) end function
// trap_GetUsercmd
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param clientNum Client slot number.
/// @param cmd Operand used to evaluate the returned expression `invokeVoid(binding,G_GET_USERCMD,[clientNum,cmd])`.
function trap_GetUsercmd(binding,clientNum,cmd) return invokeVoid(binding,G_GET_USERCMD,[clientNum,cmd]) end function
// trap_GetEntityToken
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param buffer Operand used to evaluate the returned expression `invoke(binding,G_GET_ENTITY_TOKEN,[buffer,bufferSize])`.
/// @param bufferSize Operand used to evaluate the returned expression `invoke(binding,G_GET_ENTITY_TOKEN,[buffer,bufferSize])`.
function trap_GetEntityToken(binding,buffer,bufferSize) return invoke(binding,G_GET_ENTITY_TOKEN,[buffer,bufferSize]) end function
// trap_DebugPolygonCreate
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param color Operand used to evaluate the returned expression `invoke(binding,G_DEBUG_POLYGON_CREATE,[color,numPoints,points])`.
/// @param numPoints Operand used to evaluate the returned expression `invoke(binding,G_DEBUG_POLYGON_CREATE,[color,numPoints,points])`.
/// @param points Operand used to evaluate the returned expression `invoke(binding,G_DEBUG_POLYGON_CREATE,[color,numPoints,points])`.
function trap_DebugPolygonCreate(binding,color,numPoints,points) return invoke(binding,G_DEBUG_POLYGON_CREATE,[color,numPoints,points]) end function
// trap_DebugPolygonDelete
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param id Operand used to evaluate the returned expression `invokeVoid(binding,G_DEBUG_POLYGON_DELETE,[id])`.
function trap_DebugPolygonDelete(binding,id) return invokeVoid(binding,G_DEBUG_POLYGON_DELETE,[id]) end function
// trap_RealTime
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param qtime Operand used to evaluate the returned expression `invoke(binding,G_REAL_TIME,[qtime])`.
function trap_RealTime(binding,qtime) return invoke(binding,G_REAL_TIME,[qtime]) end function
// trap_SnapVector
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param v Operand used to evaluate the returned expression `invokeVoid(binding,G_SNAPVECTOR,[v])`.
function trap_SnapVector(binding,v) return invokeVoid(binding,G_SNAPVECTOR,[v]) end function
// trap_BotLibSetup
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_BotLibSetup(binding) return invoke(binding,BOTLIB_SETUP,[]) end function
// trap_BotLibShutdown
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_BotLibShutdown(binding) return invoke(binding,BOTLIB_SHUTDOWN,[]) end function
// trap_BotLibVarSet
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param var_name Operand used to evaluate the returned expression `invoke(binding,BOTLIB_LIBVAR_SET,[var_name,value])`.
/// @param value Operand used to evaluate the returned expression `invoke(binding,BOTLIB_LIBVAR_SET,[var_name,value])`.
function trap_BotLibVarSet(binding,var_name,value) return invoke(binding,BOTLIB_LIBVAR_SET,[var_name,value]) end function
// trap_BotLibVarGet
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param var_name Operand used to evaluate the returned expression `invoke(binding,BOTLIB_LIBVAR_GET,[var_name,value,size])`.
/// @param value Operand used to evaluate the returned expression `invoke(binding,BOTLIB_LIBVAR_GET,[var_name,value,size])`.
/// @param size Size or capacity supplied to the buffer operation.
function trap_BotLibVarGet(binding,var_name,value,size) return invoke(binding,BOTLIB_LIBVAR_GET,[var_name,value,size]) end function
// trap_BotLibDefine
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param string Operand used to evaluate the returned expression `invoke(binding,BOTLIB_PC_ADD_GLOBAL_DEFINE,[string])`.
function trap_BotLibDefine(binding,string) return invoke(binding,BOTLIB_PC_ADD_GLOBAL_DEFINE,[string]) end function
// trap_BotLibStartFrame
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param time Time value in the units expected by this module.
function trap_BotLibStartFrame(binding,time) return invoke(binding,BOTLIB_START_FRAME,[PASSFLOAT(time)]) end function
// trap_BotLibLoadMap
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param mapname Operand used to evaluate the returned expression `invoke(binding,BOTLIB_LOAD_MAP,[mapname])`.
function trap_BotLibLoadMap(binding,mapname) return invoke(binding,BOTLIB_LOAD_MAP,[mapname]) end function
// trap_BotLibUpdateEntity
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param ent Operand used to evaluate the returned expression `invoke(binding,BOTLIB_UPDATENTITY,[ent,bue])`.
/// @param bue Operand used to evaluate the returned expression `invoke(binding,BOTLIB_UPDATENTITY,[ent,bue])`.
function trap_BotLibUpdateEntity(binding,ent,bue) return invoke(binding,BOTLIB_UPDATENTITY,[ent,bue]) end function
// trap_BotLibTest
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param parm0 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_TEST,[parm0,parm1,parm2,parm3])`.
/// @param parm1 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_TEST,[parm0,parm1,parm2,parm3])`.
/// @param parm2 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_TEST,[parm0,parm1,parm2,parm3])`.
/// @param parm3 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_TEST,[parm0,parm1,parm2,parm3])`.
function trap_BotLibTest(binding,parm0,parm1,parm2,parm3) return invoke(binding,BOTLIB_TEST,[parm0,parm1,parm2,parm3]) end function
// trap_BotGetSnapshotEntity
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param clientNum Client slot number.
/// @param sequence Operand used to evaluate the returned expression `invoke(binding,BOTLIB_GET_SNAPSHOT_ENTITY,[clientNum,sequence])`.
function trap_BotGetSnapshotEntity(binding,clientNum,sequence) return invoke(binding,BOTLIB_GET_SNAPSHOT_ENTITY,[clientNum,sequence]) end function
// trap_BotGetServerCommand
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param clientNum Client slot number.
/// @param message Message text supplied to the diagnostic or chat operation.
/// @param size Size or capacity supplied to the buffer operation.
function trap_BotGetServerCommand(binding,clientNum,message,size) return invoke(binding,BOTLIB_GET_CONSOLE_MESSAGE,[clientNum,message,size]) end function
// trap_BotUserCommand
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param clientNum Client slot number.
/// @param ucmd Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_USER_COMMAND,[clientNum,ucmd])`.
function trap_BotUserCommand(binding,clientNum,ucmd) return invokeVoid(binding,BOTLIB_USER_COMMAND,[clientNum,ucmd]) end function
// trap_AAS_EntityInfo
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param entnum Entity number in the game or AAS entity table.
/// @param info Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AAS_ENTITY_INFO,[entnum,info])`.
function trap_AAS_EntityInfo(binding,entnum,info) return invokeVoid(binding,BOTLIB_AAS_ENTITY_INFO,[entnum,info]) end function
// trap_AAS_Initialized
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_AAS_Initialized(binding) return invoke(binding,BOTLIB_AAS_INITIALIZED,[]) end function
// trap_AAS_PresenceTypeBoundingBox
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param presencetype Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AAS_PRESENCE_TYPE_BOUNDING_BOX,[presencetype,mins,maxs])`.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
function trap_AAS_PresenceTypeBoundingBox(binding,presencetype,mins,maxs) return invokeVoid(binding,BOTLIB_AAS_PRESENCE_TYPE_BOUNDING_BOX,[presencetype,mins,maxs]) end function
// trap_AAS_Time
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_AAS_Time(binding) return invokeFloat(binding,BOTLIB_AAS_TIME,[]) end function
// trap_AAS_PointAreaNum
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param point Three-component point used by the geometric query.
function trap_AAS_PointAreaNum(binding,point) return invoke(binding,BOTLIB_AAS_POINT_AREA_NUM,[point]) end function
// trap_AAS_PointReachabilityAreaIndex
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param point Three-component point used by the geometric query.
function trap_AAS_PointReachabilityAreaIndex(binding,point) return invoke(binding,BOTLIB_AAS_POINT_REACHABILITY_AREA_INDEX,[point]) end function
// trap_AAS_TraceAreas
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param start Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_TRACE_AREAS,[start,finish,areas,points,maxareas])`.
/// @param finish Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_TRACE_AREAS,[start,finish,areas,points,maxareas])`.
/// @param areas Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_TRACE_AREAS,[start,finish,areas,points,maxareas])`.
/// @param points Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_TRACE_AREAS,[start,finish,areas,points,maxareas])`.
/// @param maxareas Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_TRACE_AREAS,[start,finish,areas,points,maxareas])`.
function trap_AAS_TraceAreas(binding,start,finish,areas,points,maxareas) return invoke(binding,BOTLIB_AAS_TRACE_AREAS,[start,finish,areas,points,maxareas]) end function
// trap_AAS_BBoxAreas
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param absmins World-space minimum coordinates of the bounds.
/// @param absmaxs World-space maximum coordinates of the bounds.
/// @param areas Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_BBOX_AREAS,[absmins,absmaxs,areas,maxareas])`.
/// @param maxareas Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_BBOX_AREAS,[absmins,absmaxs,areas,maxareas])`.
function trap_AAS_BBoxAreas(binding,absmins,absmaxs,areas,maxareas) return invoke(binding,BOTLIB_AAS_BBOX_AREAS,[absmins,absmaxs,areas,maxareas]) end function
// trap_AAS_AreaInfo
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param areanum AAS area number; zero denotes no area.
/// @param info Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_AREA_INFO,[areanum,info])`.
function trap_AAS_AreaInfo(binding,areanum,info) return invoke(binding,BOTLIB_AAS_AREA_INFO,[areanum,info]) end function
// trap_AAS_PointContents
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param point Three-component point used by the geometric query.
function trap_AAS_PointContents(binding,point) return invoke(binding,BOTLIB_AAS_POINT_CONTENTS,[point]) end function
// trap_AAS_NextBSPEntity
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param ent Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_NEXT_BSP_ENTITY,[ent])`.
function trap_AAS_NextBSPEntity(binding,ent) return invoke(binding,BOTLIB_AAS_NEXT_BSP_ENTITY,[ent]) end function
// trap_AAS_ValueForBSPEpairKey
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param ent Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_VALUE_FOR_BSP_EPAIR_KEY,[ent,key,value,size])`.
/// @param key Lookup key or field name used by the operation.
/// @param value Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_VALUE_FOR_BSP_EPAIR_KEY,[ent,key,value,size])`.
/// @param size Size or capacity supplied to the buffer operation.
function trap_AAS_ValueForBSPEpairKey(binding,ent,key,value,size) return invoke(binding,BOTLIB_AAS_VALUE_FOR_BSP_EPAIR_KEY,[ent,key,value,size]) end function
// trap_AAS_VectorForBSPEpairKey
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param ent Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_VECTOR_FOR_BSP_EPAIR_KEY,[ent,key,v])`.
/// @param key Lookup key or field name used by the operation.
/// @param v Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_VECTOR_FOR_BSP_EPAIR_KEY,[ent,key,v])`.
function trap_AAS_VectorForBSPEpairKey(binding,ent,key,v) return invoke(binding,BOTLIB_AAS_VECTOR_FOR_BSP_EPAIR_KEY,[ent,key,v]) end function
// trap_AAS_FloatForBSPEpairKey
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param ent Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_FLOAT_FOR_BSP_EPAIR_KEY,[ent,key,value])`.
/// @param key Lookup key or field name used by the operation.
/// @param value Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_FLOAT_FOR_BSP_EPAIR_KEY,[ent,key,value])`.
function trap_AAS_FloatForBSPEpairKey(binding,ent,key,value) return invoke(binding,BOTLIB_AAS_FLOAT_FOR_BSP_EPAIR_KEY,[ent,key,value]) end function
// trap_AAS_IntForBSPEpairKey
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param ent Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_INT_FOR_BSP_EPAIR_KEY,[ent,key,value])`.
/// @param key Lookup key or field name used by the operation.
/// @param value Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_INT_FOR_BSP_EPAIR_KEY,[ent,key,value])`.
function trap_AAS_IntForBSPEpairKey(binding,ent,key,value) return invoke(binding,BOTLIB_AAS_INT_FOR_BSP_EPAIR_KEY,[ent,key,value]) end function
// trap_AAS_AreaReachability
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param areanum AAS area number; zero denotes no area.
function trap_AAS_AreaReachability(binding,areanum) return invoke(binding,BOTLIB_AAS_AREA_REACHABILITY,[areanum]) end function
// trap_AAS_AreaTravelTimeToGoalArea
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param areanum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param goalareanum Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_AREA_TRAVEL_TIME_TO_GOAL_AREA,[areanum,origin,goalareanum,travelflags])`.
/// @param travelflags Bit mask of permitted AAS travel modes and area restrictions.
function trap_AAS_AreaTravelTimeToGoalArea(binding,areanum,origin,goalareanum,travelflags) return invoke(binding,BOTLIB_AAS_AREA_TRAVEL_TIME_TO_GOAL_AREA,[areanum,origin,goalareanum,travelflags]) end function
// trap_AAS_EnableRoutingArea
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param areanum AAS area number; zero denotes no area.
/// @param enable Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_ENABLE_ROUTING_AREA,[areanum,enable])`.
function trap_AAS_EnableRoutingArea(binding,areanum,enable) return invoke(binding,BOTLIB_AAS_ENABLE_ROUTING_AREA,[areanum,enable]) end function
// trap_AAS_PredictRoute
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param route Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_PREDICT_ROUTE,[route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum])`.
/// @param areanum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param goalareanum Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_PREDICT_ROUTE,[route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum])`.
/// @param travelflags Bit mask of permitted AAS travel modes and area restrictions.
/// @param maxareas Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_PREDICT_ROUTE,[route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum])`.
/// @param maxtime Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_PREDICT_ROUTE,[route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum])`.
/// @param stopevent Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_PREDICT_ROUTE,[route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum])`.
/// @param stopcontents Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_PREDICT_ROUTE,[route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum])`.
/// @param stoptfl Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_PREDICT_ROUTE,[route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum])`.
/// @param stopareanum Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_PREDICT_ROUTE,[route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum])`.
function trap_AAS_PredictRoute(binding,route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum) return invoke(binding,BOTLIB_AAS_PREDICT_ROUTE,[route,areanum,origin,goalareanum,travelflags,maxareas,maxtime,stopevent,stopcontents,stoptfl,stopareanum]) end function
// trap_AAS_AlternativeRouteGoals
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param start Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL,[start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type])`.
/// @param startareanum Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL,[start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type])`.
/// @param goal Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL,[start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type])`.
/// @param goalareanum Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL,[start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type])`.
/// @param travelflags Bit mask of permitted AAS travel modes and area restrictions.
/// @param altroutegoals Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL,[start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type])`.
/// @param maxaltroutegoals Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL,[start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type])`.
/// @param type Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL,[start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type])`.
function trap_AAS_AlternativeRouteGoals(binding,start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type) return invoke(binding,BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL,[start,startareanum,goal,goalareanum,travelflags,altroutegoals,maxaltroutegoals,type]) end function
// trap_AAS_Swimming
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param origin World-space position as three coordinates.
function trap_AAS_Swimming(binding,origin) return invoke(binding,BOTLIB_AAS_SWIMMING,[origin]) end function
// trap_AAS_PredictClientMovement
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param move Value used by `trap_AAS_PredictClientMovement` in `return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdm...`.
/// @param entnum Entity number in the game or AAS entity table.
/// @param origin World-space position as three coordinates.
/// @param presencetype Value used by `trap_AAS_PredictClientMovement` in `return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdm...`.
/// @param onground Value used by `trap_AAS_PredictClientMovement` in `return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdm...`.
/// @param velocity Three-component movement velocity.
/// @param cmdmove Value used by `trap_AAS_PredictClientMovement` in `return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdm...`.
/// @param cmdframes Value used by `trap_AAS_PredictClientMovement` in `return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdm...`.
/// @param maxframes Value used by `trap_AAS_PredictClientMovement` in `return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdm...`.
/// @param frametime Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
/// @param stopevent Value used by `trap_AAS_PredictClientMovement` in `return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdm...`.
/// @param stopareanum Value used by `trap_AAS_PredictClientMovement` in `return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdm...`.
/// @param visualize Value used by `trap_AAS_PredictClientMovement` in `return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdm...`.
function trap_AAS_PredictClientMovement(binding,move,entnum,origin,presencetype,onground,velocity,cmdmove,cmdframes,maxframes,frametime,stopevent,stopareanum,visualize) return invoke(binding,BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT,[move,entnum,origin,presencetype,onground,velocity,cmdmove,cmdframes,maxframes,PASSFLOAT(frametime),stopevent,stopareanum,visualize]) end function
// trap_EA_Say
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_SAY,[client,str])`.
/// @param str Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_SAY,[client,str])`.
function trap_EA_Say(binding,client,str) return invokeVoid(binding,BOTLIB_EA_SAY,[client,str]) end function
// trap_EA_SayTeam
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_SAY_TEAM,[client,str])`.
/// @param str Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_SAY_TEAM,[client,str])`.
function trap_EA_SayTeam(binding,client,str) return invokeVoid(binding,BOTLIB_EA_SAY_TEAM,[client,str]) end function
// trap_EA_Command
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_COMMAND,[client,command])`.
/// @param command Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_COMMAND,[client,command])`.
function trap_EA_Command(binding,client,command) return invokeVoid(binding,BOTLIB_EA_COMMAND,[client,command]) end function
// trap_EA_Action
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_ACTION,[client,action])`.
/// @param action Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_ACTION,[client,action])`.
function trap_EA_Action(binding,client,action) return invokeVoid(binding,BOTLIB_EA_ACTION,[client,action]) end function
// trap_EA_Gesture
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_GESTURE,[client])`.
function trap_EA_Gesture(binding,client) return invokeVoid(binding,BOTLIB_EA_GESTURE,[client]) end function
// trap_EA_Talk
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_TALK,[client])`.
function trap_EA_Talk(binding,client) return invokeVoid(binding,BOTLIB_EA_TALK,[client]) end function
// trap_EA_Attack
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_ATTACK,[client])`.
function trap_EA_Attack(binding,client) return invokeVoid(binding,BOTLIB_EA_ATTACK,[client]) end function
// trap_EA_Use
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_USE,[client])`.
function trap_EA_Use(binding,client) return invokeVoid(binding,BOTLIB_EA_USE,[client]) end function
// trap_EA_Respawn
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_RESPAWN,[client])`.
function trap_EA_Respawn(binding,client) return invokeVoid(binding,BOTLIB_EA_RESPAWN,[client]) end function
// trap_EA_Crouch
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_CROUCH,[client])`.
function trap_EA_Crouch(binding,client) return invokeVoid(binding,BOTLIB_EA_CROUCH,[client]) end function
// trap_EA_MoveUp
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_MOVE_UP,[client])`.
function trap_EA_MoveUp(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_UP,[client]) end function
// trap_EA_MoveDown
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_MOVE_DOWN,[client])`.
function trap_EA_MoveDown(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_DOWN,[client]) end function
// trap_EA_MoveForward
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_MOVE_FORWARD,[client])`.
function trap_EA_MoveForward(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_FORWARD,[client]) end function
// trap_EA_MoveBack
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_MOVE_BACK,[client])`.
function trap_EA_MoveBack(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_BACK,[client]) end function
// trap_EA_MoveLeft
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_MOVE_LEFT,[client])`.
function trap_EA_MoveLeft(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_LEFT,[client]) end function
// trap_EA_MoveRight
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_MOVE_RIGHT,[client])`.
function trap_EA_MoveRight(binding,client) return invokeVoid(binding,BOTLIB_EA_MOVE_RIGHT,[client]) end function
// trap_EA_SelectWeapon
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_SELECT_WEAPON,[client,weapon])`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function trap_EA_SelectWeapon(binding,client,weapon) return invokeVoid(binding,BOTLIB_EA_SELECT_WEAPON,[client,weapon]) end function
// trap_EA_Jump
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_JUMP,[client])`.
function trap_EA_Jump(binding,client) return invokeVoid(binding,BOTLIB_EA_JUMP,[client]) end function
// trap_EA_DelayedJump
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_DELAYED_JUMP,[client])`.
function trap_EA_DelayedJump(binding,client) return invokeVoid(binding,BOTLIB_EA_DELAYED_JUMP,[client]) end function
// trap_EA_Move
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_MOVE,[client,dir,PASSFLOAT(speed)])`.
/// @param dir Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_MOVE,[client,dir,PASSFLOAT(speed)])`.
/// @param speed Requested movement speed.
function trap_EA_Move(binding,client,dir,speed) return invokeVoid(binding,BOTLIB_EA_MOVE,[client,dir,PASSFLOAT(speed)]) end function
// trap_EA_View
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_VIEW,[client,viewangles])`.
/// @param viewangles Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_VIEW,[client,viewangles])`.
function trap_EA_View(binding,client,viewangles) return invokeVoid(binding,BOTLIB_EA_VIEW,[client,viewangles]) end function
// trap_EA_EndRegular
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_END_REGULAR,[client,PASSFLOAT(thinktime)])`.
/// @param thinktime Bot thinking interval in seconds.
function trap_EA_EndRegular(binding,client,thinktime) return invokeVoid(binding,BOTLIB_EA_END_REGULAR,[client,PASSFLOAT(thinktime)]) end function
// trap_EA_GetInput
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_GET_INPUT,[client,PASSFLOAT(thinktime),input])`.
/// @param thinktime Bot thinking interval in seconds.
/// @param input Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_GET_INPUT,[client,PASSFLOAT(thinktime),input])`.
function trap_EA_GetInput(binding,client,thinktime,input) return invokeVoid(binding,BOTLIB_EA_GET_INPUT,[client,PASSFLOAT(thinktime),input]) end function
// trap_EA_ResetInput
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_EA_RESET_INPUT,[client])`.
function trap_EA_ResetInput(binding,client) return invokeVoid(binding,BOTLIB_EA_RESET_INPUT,[client]) end function
// trap_BotLoadCharacter
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param charfile Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_LOAD_CHARACTER,[charfile,PASSFLOAT(skill)])`.
/// @param skill Bot skill value used to select or interpolate characteristics.
function trap_BotLoadCharacter(binding,charfile,skill) return invoke(binding,BOTLIB_AI_LOAD_CHARACTER,[charfile,PASSFLOAT(skill)]) end function
// trap_BotFreeCharacter
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param character Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_FREE_CHARACTER,[character])`.
function trap_BotFreeCharacter(binding,character) return invokeVoid(binding,BOTLIB_AI_FREE_CHARACTER,[character]) end function
// trap_Characteristic_Float
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param character Operand used to evaluate the returned expression `invokeFloat(binding,BOTLIB_AI_CHARACTERISTIC_FLOAT,[character,index])`.
/// @param index Index of the entry to access.
function trap_Characteristic_Float(binding,character,index) return invokeFloat(binding,BOTLIB_AI_CHARACTERISTIC_FLOAT,[character,index]) end function
// trap_Characteristic_BFloat
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param character Operand used to evaluate the returned expression `invokeFloat(binding,BOTLIB_AI_CHARACTERISTIC_BFLOAT,[character,index,PASSFLOAT(min),PASSFLOAT(max)])`.
/// @param index Index of the entry to access.
/// @param min Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
/// @param max Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
function trap_Characteristic_BFloat(binding,character,index,min,max) return invokeFloat(binding,BOTLIB_AI_CHARACTERISTIC_BFLOAT,[character,index,PASSFLOAT(min),PASSFLOAT(max)]) end function
// trap_Characteristic_Integer
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param character Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_CHARACTERISTIC_INTEGER,[character,index])`.
/// @param index Index of the entry to access.
function trap_Characteristic_Integer(binding,character,index) return invoke(binding,BOTLIB_AI_CHARACTERISTIC_INTEGER,[character,index]) end function
// trap_Characteristic_BInteger
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param character Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_CHARACTERISTIC_BINTEGER,[character,index,min,max])`.
/// @param index Index of the entry to access.
/// @param min Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_CHARACTERISTIC_BINTEGER,[character,index,min,max])`.
/// @param max Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_CHARACTERISTIC_BINTEGER,[character,index,min,max])`.
function trap_Characteristic_BInteger(binding,character,index,min,max) return invoke(binding,BOTLIB_AI_CHARACTERISTIC_BINTEGER,[character,index,min,max]) end function
// trap_Characteristic_String
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param character Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_CHARACTERISTIC_STRING,[character,index,buf,size])`.
/// @param index Index of the entry to access.
/// @param buf Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_CHARACTERISTIC_STRING,[character,index,buf,size])`.
/// @param size Size or capacity supplied to the buffer operation.
function trap_Characteristic_String(binding,character,index,buf,size) return invokeVoid(binding,BOTLIB_AI_CHARACTERISTIC_STRING,[character,index,buf,size]) end function
// trap_BotAllocChatState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_BotAllocChatState(binding) return invoke(binding,BOTLIB_AI_ALLOC_CHAT_STATE,[]) end function
// trap_BotFreeChatState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
function trap_BotFreeChatState(binding,handle) return invokeVoid(binding,BOTLIB_AI_FREE_CHAT_STATE,[handle]) end function
// trap_BotQueueConsoleMessage
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param type Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_QUEUE_CONSOLE_MESSAGE,[chatstate,type,message])`.
/// @param message Message text supplied to the diagnostic or chat operation.
function trap_BotQueueConsoleMessage(binding,chatstate,type,message) return invokeVoid(binding,BOTLIB_AI_QUEUE_CONSOLE_MESSAGE,[chatstate,type,message]) end function
// trap_BotRemoveConsoleMessage
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param handle Resource handle resolved by the owning pool or host service.
function trap_BotRemoveConsoleMessage(binding,chatstate,handle) return invokeVoid(binding,BOTLIB_AI_REMOVE_CONSOLE_MESSAGE,[chatstate,handle]) end function
// trap_BotNextConsoleMessage
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param cm Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_NEXT_CONSOLE_MESSAGE,[chatstate,cm])`.
function trap_BotNextConsoleMessage(binding,chatstate,cm) return invoke(binding,BOTLIB_AI_NEXT_CONSOLE_MESSAGE,[chatstate,cm]) end function
// trap_BotNumConsoleMessages
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
function trap_BotNumConsoleMessages(binding,chatstate) return invoke(binding,BOTLIB_AI_NUM_CONSOLE_MESSAGE,[chatstate]) end function
// trap_BotInitialChat
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param type Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param mcontext Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var0 Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var1 Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var2 Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var3 Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var4 Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var5 Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var6 Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var7 Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
function trap_BotInitialChat(binding,chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7) return invokeVoid(binding,BOTLIB_AI_INITIAL_CHAT,[chatstate,type,mcontext,var0,var1,var2,var3,var4,var5,var6,var7]) end function
// trap_BotNumInitialChats
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param type Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_NUM_INITIAL_CHATS,[chatstate,type])`.
function trap_BotNumInitialChats(binding,chatstate,type) return invoke(binding,BOTLIB_AI_NUM_INITIAL_CHATS,[chatstate,type]) end function
// trap_BotReplyChat
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param message Message text supplied to the diagnostic or chat operation.
/// @param mcontext Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param vcontext Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var0 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var1 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var2 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var3 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var4 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var5 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var6 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
/// @param var7 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7])`.
function trap_BotReplyChat(binding,chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7) return invoke(binding,BOTLIB_AI_REPLY_CHAT,[chatstate,message,mcontext,vcontext,var0,var1,var2,var3,var4,var5,var6,var7]) end function
// trap_BotChatLength
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
function trap_BotChatLength(binding,chatstate) return invoke(binding,BOTLIB_AI_CHAT_LENGTH,[chatstate]) end function
// trap_BotEnterChat
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_ENTER_CHAT,[chatstate,client,sendto])`.
/// @param sendto Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_ENTER_CHAT,[chatstate,client,sendto])`.
function trap_BotEnterChat(binding,chatstate,client,sendto) return invokeVoid(binding,BOTLIB_AI_ENTER_CHAT,[chatstate,client,sendto]) end function
// trap_BotGetChatMessage
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param buf Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_GET_CHAT_MESSAGE,[chatstate,buf,size])`.
/// @param size Size or capacity supplied to the buffer operation.
function trap_BotGetChatMessage(binding,chatstate,buf,size) return invokeVoid(binding,BOTLIB_AI_GET_CHAT_MESSAGE,[chatstate,buf,size]) end function
// trap_StringContains
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param str1 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_STRING_CONTAINS,[str1,str2,casesensitive])`.
/// @param str2 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_STRING_CONTAINS,[str1,str2,casesensitive])`.
/// @param casesensitive Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_STRING_CONTAINS,[str1,str2,casesensitive])`.
function trap_StringContains(binding,str1,str2,casesensitive) return invoke(binding,BOTLIB_AI_STRING_CONTAINS,[str1,str2,casesensitive]) end function
// trap_BotFindMatch
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param str Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_FIND_MATCH,[str,match,context])`.
/// @param match Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_FIND_MATCH,[str,match,context])`.
/// @param context Context forwarded to the configured host callbacks.
function trap_BotFindMatch(binding,str,match,context) return invoke(binding,BOTLIB_AI_FIND_MATCH,[str,match,context]) end function
// trap_BotMatchVariable
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param match Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_MATCH_VARIABLE,[match,variable,buf,size])`.
/// @param variable Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_MATCH_VARIABLE,[match,variable,buf,size])`.
/// @param buf Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_MATCH_VARIABLE,[match,variable,buf,size])`.
/// @param size Size or capacity supplied to the buffer operation.
function trap_BotMatchVariable(binding,match,variable,buf,size) return invokeVoid(binding,BOTLIB_AI_MATCH_VARIABLE,[match,variable,buf,size]) end function
// trap_UnifyWhiteSpaces
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param string Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_UNIFY_WHITE_SPACES,[string])`.
function trap_UnifyWhiteSpaces(binding,string) return invokeVoid(binding,BOTLIB_AI_UNIFY_WHITE_SPACES,[string]) end function
// trap_BotReplaceSynonyms
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param string Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_REPLACE_SYNONYMS,[string,context])`.
/// @param context Context forwarded to the configured host callbacks.
function trap_BotReplaceSynonyms(binding,string,context) return invokeVoid(binding,BOTLIB_AI_REPLACE_SYNONYMS,[string,context]) end function
// trap_BotLoadChatFile
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param chatfile Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_LOAD_CHAT_FILE,[chatstate,chatfile,chatname])`.
/// @param chatname Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_LOAD_CHAT_FILE,[chatstate,chatfile,chatname])`.
function trap_BotLoadChatFile(binding,chatstate,chatfile,chatname) return invoke(binding,BOTLIB_AI_LOAD_CHAT_FILE,[chatstate,chatfile,chatname]) end function
// trap_BotSetChatGender
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param gender Chat gender identifier.
function trap_BotSetChatGender(binding,chatstate,gender) return invokeVoid(binding,BOTLIB_AI_SET_CHAT_GENDER,[chatstate,gender]) end function
// trap_BotSetChatName
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param chatstate Handle of the pooled bot chat state.
/// @param name Name used to identify the requested entry.
/// @param client Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_SET_CHAT_NAME,[chatstate,name,client])`.
function trap_BotSetChatName(binding,chatstate,name,client) return invokeVoid(binding,BOTLIB_AI_SET_CHAT_NAME,[chatstate,name,client]) end function
// trap_BotResetGoalState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
function trap_BotResetGoalState(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_RESET_GOAL_STATE,[goalstate]) end function
// trap_BotResetAvoidGoals
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
function trap_BotResetAvoidGoals(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_RESET_AVOID_GOALS,[goalstate]) end function
// trap_BotRemoveFromAvoidGoals
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param number Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_REMOVE_FROM_AVOID_GOALS,[goalstate,number])`.
function trap_BotRemoveFromAvoidGoals(binding,goalstate,number) return invokeVoid(binding,BOTLIB_AI_REMOVE_FROM_AVOID_GOALS,[goalstate,number]) end function
// trap_BotPushGoal
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param goal Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_PUSH_GOAL,[goalstate,goal])`.
function trap_BotPushGoal(binding,goalstate,goal) return invokeVoid(binding,BOTLIB_AI_PUSH_GOAL,[goalstate,goal]) end function
// trap_BotPopGoal
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
function trap_BotPopGoal(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_POP_GOAL,[goalstate]) end function
// trap_BotEmptyGoalStack
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
function trap_BotEmptyGoalStack(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_EMPTY_GOAL_STACK,[goalstate]) end function
// trap_BotDumpAvoidGoals
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
function trap_BotDumpAvoidGoals(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_DUMP_AVOID_GOALS,[goalstate]) end function
// trap_BotDumpGoalStack
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
function trap_BotDumpGoalStack(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_DUMP_GOAL_STACK,[goalstate]) end function
// trap_BotGoalName
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param number Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_GOAL_NAME,[number,name,size])`.
/// @param name Name used to identify the requested entry.
/// @param size Size or capacity supplied to the buffer operation.
function trap_BotGoalName(binding,number,name,size) return invokeVoid(binding,BOTLIB_AI_GOAL_NAME,[number,name,size]) end function
// trap_BotGetTopGoal
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param goal Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GET_TOP_GOAL,[goalstate,goal])`.
function trap_BotGetTopGoal(binding,goalstate,goal) return invoke(binding,BOTLIB_AI_GET_TOP_GOAL,[goalstate,goal]) end function
// trap_BotGetSecondGoal
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param goal Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GET_SECOND_GOAL,[goalstate,goal])`.
function trap_BotGetSecondGoal(binding,goalstate,goal) return invoke(binding,BOTLIB_AI_GET_SECOND_GOAL,[goalstate,goal]) end function
// trap_BotChooseLTGItem
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param origin World-space position as three coordinates.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param travelflags Bit mask of permitted AAS travel modes and area restrictions.
function trap_BotChooseLTGItem(binding,goalstate,origin,inventory,travelflags) return invoke(binding,BOTLIB_AI_CHOOSE_LTG_ITEM,[goalstate,origin,inventory,travelflags]) end function
// trap_BotChooseNBGItem
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param origin World-space position as three coordinates.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param travelflags Bit mask of permitted AAS travel modes and area restrictions.
/// @param ltg Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_CHOOSE_NBG_ITEM,[goalstate,origin,inventory,travelflags,ltg,PASSFLOAT(maxtime)])`.
/// @param maxtime Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
function trap_BotChooseNBGItem(binding,goalstate,origin,inventory,travelflags,ltg,maxtime) return invoke(binding,BOTLIB_AI_CHOOSE_NBG_ITEM,[goalstate,origin,inventory,travelflags,ltg,PASSFLOAT(maxtime)]) end function
// trap_BotTouchingGoal
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param origin World-space position as three coordinates.
/// @param goal Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_TOUCHING_GOAL,[origin,goal])`.
function trap_BotTouchingGoal(binding,origin,goal) return invoke(binding,BOTLIB_AI_TOUCHING_GOAL,[origin,goal]) end function
// trap_BotItemGoalInVisButNotVisible
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param viewer Entity number ignored by the visibility trace.
/// @param eye Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE,[viewer,eye,viewangles,goal])`.
/// @param viewangles Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE,[viewer,eye,viewangles,goal])`.
/// @param goal Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE,[viewer,eye,viewangles,goal])`.
function trap_BotItemGoalInVisButNotVisible(binding,viewer,eye,viewangles,goal) return invoke(binding,BOTLIB_AI_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE,[viewer,eye,viewangles,goal]) end function
// trap_BotGetLevelItemGoal
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param index Index of the entry to access.
/// @param classname Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GET_LEVEL_ITEM_GOAL,[index,classname,goal])`.
/// @param goal Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GET_LEVEL_ITEM_GOAL,[index,classname,goal])`.
function trap_BotGetLevelItemGoal(binding,index,classname,goal) return invoke(binding,BOTLIB_AI_GET_LEVEL_ITEM_GOAL,[index,classname,goal]) end function
// trap_BotGetNextCampSpotGoal
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param num Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GET_NEXT_CAMP_SPOT_GOAL,[num,goal])`.
/// @param goal Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GET_NEXT_CAMP_SPOT_GOAL,[num,goal])`.
function trap_BotGetNextCampSpotGoal(binding,num,goal) return invoke(binding,BOTLIB_AI_GET_NEXT_CAMP_SPOT_GOAL,[num,goal]) end function
// trap_BotGetMapLocationGoal
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param name Name used to identify the requested entry.
/// @param goal Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GET_MAP_LOCATION_GOAL,[name,goal])`.
function trap_BotGetMapLocationGoal(binding,name,goal) return invoke(binding,BOTLIB_AI_GET_MAP_LOCATION_GOAL,[name,goal]) end function
// trap_BotAvoidGoalTime
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param number Operand used to evaluate the returned expression `invokeFloat(binding,BOTLIB_AI_AVOID_GOAL_TIME,[goalstate,number])`.
function trap_BotAvoidGoalTime(binding,goalstate,number) return invokeFloat(binding,BOTLIB_AI_AVOID_GOAL_TIME,[goalstate,number]) end function
// trap_BotSetAvoidGoalTime
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param number Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_SET_AVOID_GOAL_TIME,[goalstate,number,PASSFLOAT(avoidtime)])`.
/// @param avoidtime Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
function trap_BotSetAvoidGoalTime(binding,goalstate,number,avoidtime) return invokeVoid(binding,BOTLIB_AI_SET_AVOID_GOAL_TIME,[goalstate,number,PASSFLOAT(avoidtime)]) end function
// trap_BotInitLevelItems
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_BotInitLevelItems(binding) return invokeVoid(binding,BOTLIB_AI_INIT_LEVEL_ITEMS,[]) end function
// trap_BotUpdateEntityItems
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_BotUpdateEntityItems(binding) return invokeVoid(binding,BOTLIB_AI_UPDATE_ENTITY_ITEMS,[]) end function
// trap_BotLoadItemWeights
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param filename Filename supplied to the configured loader or file service.
function trap_BotLoadItemWeights(binding,goalstate,filename) return invoke(binding,BOTLIB_AI_LOAD_ITEM_WEIGHTS,[goalstate,filename]) end function
// trap_BotFreeItemWeights
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
function trap_BotFreeItemWeights(binding,goalstate) return invokeVoid(binding,BOTLIB_AI_FREE_ITEM_WEIGHTS,[goalstate]) end function
// trap_BotInterbreedGoalFuzzyLogic
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param parent1 Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INTERBREED_GOAL_FUZZY_LOGIC,[parent1,parent2,child])`.
/// @param parent2 Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INTERBREED_GOAL_FUZZY_LOGIC,[parent1,parent2,child])`.
/// @param child Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INTERBREED_GOAL_FUZZY_LOGIC,[parent1,parent2,child])`.
function trap_BotInterbreedGoalFuzzyLogic(binding,parent1,parent2,child) return invokeVoid(binding,BOTLIB_AI_INTERBREED_GOAL_FUZZY_LOGIC,[parent1,parent2,child]) end function
// trap_BotSaveGoalFuzzyLogic
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param filename Filename supplied to the configured loader or file service.
function trap_BotSaveGoalFuzzyLogic(binding,goalstate,filename) return invokeVoid(binding,BOTLIB_AI_SAVE_GOAL_FUZZY_LOGIC,[goalstate,filename]) end function
// trap_BotMutateGoalFuzzyLogic
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param goalstate Handle of the pooled bot goal state.
/// @param range Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
function trap_BotMutateGoalFuzzyLogic(binding,goalstate,range) return invokeVoid(binding,BOTLIB_AI_MUTATE_GOAL_FUZZY_LOGIC,[goalstate,promotedFloatLow(range)]) end function
// trap_BotAllocGoalState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param state Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_ALLOC_GOAL_STATE,[state])`.
function trap_BotAllocGoalState(binding,state) return invoke(binding,BOTLIB_AI_ALLOC_GOAL_STATE,[state]) end function
// trap_BotFreeGoalState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
function trap_BotFreeGoalState(binding,handle) return invokeVoid(binding,BOTLIB_AI_FREE_GOAL_STATE,[handle]) end function
// trap_BotResetMoveState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param movestate Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_RESET_MOVE_STATE,[movestate])`.
function trap_BotResetMoveState(binding,movestate) return invokeVoid(binding,BOTLIB_AI_RESET_MOVE_STATE,[movestate]) end function
// trap_BotAddAvoidSpot
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param movestate Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_ADD_AVOID_SPOT,[movestate,origin,PASSFLOAT(radius),type])`.
/// @param origin World-space position as three coordinates.
/// @param radius Radius used by the spatial or damage query.
/// @param type Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_ADD_AVOID_SPOT,[movestate,origin,PASSFLOAT(radius),type])`.
function trap_BotAddAvoidSpot(binding,movestate,origin,radius,type) return invokeVoid(binding,BOTLIB_AI_ADD_AVOID_SPOT,[movestate,origin,PASSFLOAT(radius),type]) end function
// trap_BotMoveToGoal
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param result Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_MOVE_TO_GOAL,[result,movestate,goal,travelflags])`.
/// @param movestate Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_MOVE_TO_GOAL,[result,movestate,goal,travelflags])`.
/// @param goal Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_MOVE_TO_GOAL,[result,movestate,goal,travelflags])`.
/// @param travelflags Bit mask of permitted AAS travel modes and area restrictions.
function trap_BotMoveToGoal(binding,result,movestate,goal,travelflags) return invokeVoid(binding,BOTLIB_AI_MOVE_TO_GOAL,[result,movestate,goal,travelflags]) end function
// trap_BotMoveInDirection
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param movestate Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_MOVE_IN_DIRECTION,[movestate,dir,PASSFLOAT(speed),type])`.
/// @param dir Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_MOVE_IN_DIRECTION,[movestate,dir,PASSFLOAT(speed),type])`.
/// @param speed Requested movement speed.
/// @param type Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_MOVE_IN_DIRECTION,[movestate,dir,PASSFLOAT(speed),type])`.
function trap_BotMoveInDirection(binding,movestate,dir,speed,type) return invoke(binding,BOTLIB_AI_MOVE_IN_DIRECTION,[movestate,dir,PASSFLOAT(speed),type]) end function
// trap_BotResetAvoidReach
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param movestate Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_RESET_AVOID_REACH,[movestate])`.
function trap_BotResetAvoidReach(binding,movestate) return invokeVoid(binding,BOTLIB_AI_RESET_AVOID_REACH,[movestate]) end function
// trap_BotResetLastAvoidReach
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param movestate Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_RESET_LAST_AVOID_REACH,[movestate])`.
function trap_BotResetLastAvoidReach(binding,movestate) return invokeVoid(binding,BOTLIB_AI_RESET_LAST_AVOID_REACH,[movestate]) end function
// trap_BotReachabilityArea
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param origin World-space position as three coordinates.
/// @param testground Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_REACHABILITY_AREA,[origin,testground])`.
function trap_BotReachabilityArea(binding,origin,testground) return invoke(binding,BOTLIB_AI_REACHABILITY_AREA,[origin,testground]) end function
// trap_BotMovementViewTarget
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param movestate Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_MOVEMENT_VIEW_TARGET,[movestate,goal,travelflags,PASSFLOAT(lookahead),target])`.
/// @param goal Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_MOVEMENT_VIEW_TARGET,[movestate,goal,travelflags,PASSFLOAT(lookahead),target])`.
/// @param travelflags Bit mask of permitted AAS travel modes and area restrictions.
/// @param lookahead Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
/// @param target Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_MOVEMENT_VIEW_TARGET,[movestate,goal,travelflags,PASSFLOAT(lookahead),target])`.
function trap_BotMovementViewTarget(binding,movestate,goal,travelflags,lookahead,target) return invoke(binding,BOTLIB_AI_MOVEMENT_VIEW_TARGET,[movestate,goal,travelflags,PASSFLOAT(lookahead),target]) end function
// trap_BotPredictVisiblePosition
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param origin World-space position as three coordinates.
/// @param areanum AAS area number; zero denotes no area.
/// @param goal Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_PREDICT_VISIBLE_POSITION,[origin,areanum,goal,travelflags,target])`.
/// @param travelflags Bit mask of permitted AAS travel modes and area restrictions.
/// @param target Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_PREDICT_VISIBLE_POSITION,[origin,areanum,goal,travelflags,target])`.
function trap_BotPredictVisiblePosition(binding,origin,areanum,goal,travelflags,target) return invoke(binding,BOTLIB_AI_PREDICT_VISIBLE_POSITION,[origin,areanum,goal,travelflags,target]) end function
// trap_BotAllocMoveState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_BotAllocMoveState(binding) return invoke(binding,BOTLIB_AI_ALLOC_MOVE_STATE,[]) end function
// trap_BotFreeMoveState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
function trap_BotFreeMoveState(binding,handle) return invokeVoid(binding,BOTLIB_AI_FREE_MOVE_STATE,[handle]) end function
// trap_BotInitMoveState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param initmove Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_INIT_MOVE_STATE,[handle,initmove])`.
function trap_BotInitMoveState(binding,handle,initmove) return invokeVoid(binding,BOTLIB_AI_INIT_MOVE_STATE,[handle,initmove]) end function
// trap_BotChooseBestFightWeapon
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param weaponstate Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_CHOOSE_BEST_FIGHT_WEAPON,[weaponstate,inventory])`.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
function trap_BotChooseBestFightWeapon(binding,weaponstate,inventory) return invoke(binding,BOTLIB_AI_CHOOSE_BEST_FIGHT_WEAPON,[weaponstate,inventory]) end function
// trap_BotGetWeaponInfo
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param weaponstate Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_GET_WEAPON_INFO,[weaponstate,weapon,weaponinfo])`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
/// @param weaponinfo Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_GET_WEAPON_INFO,[weaponstate,weapon,weaponinfo])`.
function trap_BotGetWeaponInfo(binding,weaponstate,weapon,weaponinfo) return invokeVoid(binding,BOTLIB_AI_GET_WEAPON_INFO,[weaponstate,weapon,weaponinfo]) end function
// trap_BotLoadWeaponWeights
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param weaponstate Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_LOAD_WEAPON_WEIGHTS,[weaponstate,filename])`.
/// @param filename Filename supplied to the configured loader or file service.
function trap_BotLoadWeaponWeights(binding,weaponstate,filename) return invoke(binding,BOTLIB_AI_LOAD_WEAPON_WEIGHTS,[weaponstate,filename]) end function
// trap_BotAllocWeaponState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
function trap_BotAllocWeaponState(binding) return invoke(binding,BOTLIB_AI_ALLOC_WEAPON_STATE,[]) end function
// trap_BotFreeWeaponState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param weaponstate Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_FREE_WEAPON_STATE,[weaponstate])`.
function trap_BotFreeWeaponState(binding,weaponstate) return invokeVoid(binding,BOTLIB_AI_FREE_WEAPON_STATE,[weaponstate]) end function
// trap_BotResetWeaponState
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param weaponstate Operand used to evaluate the returned expression `invokeVoid(binding,BOTLIB_AI_RESET_WEAPON_STATE,[weaponstate])`.
function trap_BotResetWeaponState(binding,weaponstate) return invokeVoid(binding,BOTLIB_AI_RESET_WEAPON_STATE,[weaponstate]) end function
// trap_GeneticParentsAndChildSelection
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param numranks Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION,[numranks,ranks,parent1,parent2,child])`.
/// @param ranks Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION,[numranks,ranks,parent1,parent2,child])`.
/// @param parent1 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION,[numranks,ranks,parent1,parent2,child])`.
/// @param parent2 Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION,[numranks,ranks,parent1,parent2,child])`.
/// @param child Operand used to evaluate the returned expression `invoke(binding,BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION,[numranks,ranks,parent1,parent2,child])`.
function trap_GeneticParentsAndChildSelection(binding,numranks,ranks,parent1,parent2,child) return invoke(binding,BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION,[numranks,ranks,parent1,parent2,child]) end function
// trap_PC_LoadSource
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param filename Filename supplied to the configured loader or file service.
function trap_PC_LoadSource(binding,filename) return invoke(binding,BOTLIB_PC_LOAD_SOURCE,[filename]) end function
// trap_PC_FreeSource
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
function trap_PC_FreeSource(binding,handle) return invoke(binding,BOTLIB_PC_FREE_SOURCE,[handle]) end function
// trap_PC_ReadToken
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param pc_token Operand used to evaluate the returned expression `invoke(binding,BOTLIB_PC_READ_TOKEN,[handle,pc_token])`.
function trap_PC_ReadToken(binding,handle,pc_token) return invoke(binding,BOTLIB_PC_READ_TOKEN,[handle,pc_token]) end function
// trap_PC_SourceFileAndLine
/// @param binding Qagame syscall binding; accesses `invokeFn`, `context` and `calls`. May update `binding.calls` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param filename Filename supplied to the configured loader or file service.
/// @param line Source line number attached to the diagnostic.
function trap_PC_SourceFileAndLine(binding,handle,filename,line) return invoke(binding,BOTLIB_PC_SOURCE_FILE_AND_LINE,[handle,filename,line]) end function
