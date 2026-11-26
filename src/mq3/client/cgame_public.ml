// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete public engine/CGame ABI from code/cgame/cg_public.h.
package mq3.client.cgame_public

const CMD_BACKUP=64
const CMD_MASK=63
const MAX_ENTITIES_IN_SNAPSHOT=256
const CGAME_IMPORT_API_VERSION=4

const CGAME_EVENT_NONE=0
const CGAME_EVENT_TEAMMENU=1
const CGAME_EVENT_SCOREBOARD=2
const CGAME_EVENT_EDITHUD=3

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
const CG_MEMSET=100
const CG_MEMCPY=101
const CG_STRNCPY=102
const CG_SIN=103
const CG_COS=104
const CG_ATAN2=105
const CG_SQRT=106
const CG_FLOOR=107
const CG_CEIL=108
const CG_TESTPRINTINT=109
const CG_TESTPRINTFLOAT=110
const CG_ACOS=111

const CG_INIT=0
const CG_SHUTDOWN=1
const CG_CONSOLE_COMMAND=2
const CG_DRAW_ACTIVE_FRAME=3
const CG_CROSSHAIR_PLAYER=4
const CG_LAST_ATTACKER=5
const CG_KEY_EVENT=6
const CG_MOUSE_EVENT=7
const CG_EVENT_HANDLING=8

/// Stores client game public snapshot metadata and contents, including `snapFlags`, `ping`, `serverTime`, `areamask`, `ps`, `numEntities` and additional values.
struct Snapshot snapFlags ping serverTime areamask ps numEntities entities numServerCommands serverCommandSequence end struct

/// Lists the type names catalog for client game public in its declared source order.
function typeNames() return ["snapshot_t","cgameImport_t","cgameExport_t"] end function
/// Computes `count>=0 and count<=MAX_ENTITIES_IN_SNAPSHOT` for client game public `validSnapshotEntityCount`.
/// @param count Value used by `return count>=0 and count<=MAX_ENTITIES_IN_SNAPSHOT`.
function validSnapshotEntityCount(count) return count>=0 and count<=MAX_ENTITIES_IN_SNAPSHOT end function
/// Computes `requested>current-CMD_BACKUP and requested<=current` for client game public `validCommandNumber`.
/// @param current Value used by `return requested>current-CMD_BACKUP and requested<=current`.
/// @param requested Value used by `return requested>current-CMD_BACKUP and requested<=current`.
function validCommandNumber(current,requested) return requested>current-CMD_BACKUP and requested<=current end function
/// Computes `value>=CGAME_EVENT_NONE and value<=CGAME_EVENT_EDITHUD` for client game public `validEventHandling`.
/// @param value Value used by `return value>=CGAME_EVENT_NONE and value<=CGAME_EVENT_EDITHUD`.
function validEventHandling(value) return value>=CGAME_EVENT_NONE and value<=CGAME_EVENT_EDITHUD end function
