// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Canonical public Botlib ABI contracts shared by game QVM and native Botlib.
package mq3.botlib.public_headers

const MAX_STRINGFIELD=80
const TFL_INVALID=0x00000001
const TFL_WALK=0x00000002
const TFL_CROUCH=0x00000004
const TFL_BARRIERJUMP=0x00000008
const TFL_JUMP=0x00000010
const TFL_LADDER=0x00000020
const TFL_WALKOFFLEDGE=0x00000080
const TFL_SWIM=0x00000100
const TFL_WATERJUMP=0x00000200
const TFL_TELEPORT=0x00000400
const TFL_ELEVATOR=0x00000800
const TFL_ROCKETJUMP=0x00001000
const TFL_BFGJUMP=0x00002000
const TFL_GRAPPLEHOOK=0x00004000
const TFL_DOUBLEJUMP=0x00008000
const TFL_RAMPJUMP=0x00010000
const TFL_STRAFEJUMP=0x00020000
const TFL_JUMPPAD=0x00040000
const TFL_AIR=0x00080000
const TFL_WATER=0x00100000
const TFL_SLIME=0x00200000
const TFL_LAVA=0x00400000
const TFL_DONOTENTER=0x00800000
const TFL_FUNCBOB=0x01000000
const TFL_FLIGHT=0x02000000
const TFL_BRIDGE=0x04000000
const TFL_NOTTEAM1=0x08000000
const TFL_NOTTEAM2=0x10000000
const TFL_DEFAULT=TFL_WALK|TFL_CROUCH|TFL_BARRIERJUMP|TFL_JUMP|TFL_LADDER|TFL_WALKOFFLEDGE|TFL_SWIM|TFL_WATERJUMP|TFL_TELEPORT|TFL_ELEVATOR|TFL_AIR|TFL_WATER|TFL_JUMPPAD|TFL_FUNCBOB
const SE_NONE=0
const SE_HITGROUND=1
const SE_LEAVEGROUND=2
const SE_ENTERWATER=4
const SE_ENTERSLIME=8
const SE_ENTERLAVA=16
const SE_HITGROUNDDAMAGE=32
const SE_GAP=64
const SE_TOUCHJUMPPAD=128
const SE_TOUCHTELEPORTER=256
const SE_ENTERAREA=512
const SE_HITGROUNDAREA=1024
const SE_HITBOUNDINGBOX=2048
const SE_TOUCHCLUSTERPORTAL=4096
const ALTROUTEGOAL_ALL=1
const ALTROUTEGOAL_CLUSTERPORTALS=2
const ALTROUTEGOAL_VIEWPORTALS=4
const RSE_NONE=0
const RSE_NOROUTE=1
const RSE_USETRAVELTYPE=2
const RSE_ENTERCONTENTS=4
const RSE_ENTERAREA=8
const MAX_MESSAGE_SIZE=256
const MAX_CHATTYPE_NAME=32
const MAX_MATCHVARIABLES=8
const CHAT_GENDERLESS=0
const CHAT_GENDERFEMALE=1
const CHAT_GENDERMALE=2
const CHAT_ALL=0
const CHAT_TEAM=1
const CHAT_TELL=2
const MAX_AVOIDGOALS=256
const MAX_GOALSTACK=8
const GFL_NONE=0
const GFL_ITEM=1
const GFL_ROAM=2
const GFL_DROPPED=4
const MOVE_WALK=1
const MOVE_CROUCH=2
const MOVE_JUMP=4
const MOVE_GRAPPLE=8
const MOVE_ROCKETJUMP=16
const MOVE_BFGJUMP=32
const MFL_BARRIERJUMP=1
const MFL_ONGROUND=2
const MFL_SWIMMING=4
const MFL_AGAINSTLADDER=8
const MFL_WATERJUMP=16
const MFL_TELEPORTED=32
const MFL_GRAPPLEPULL=64
const MFL_ACTIVEGRAPPLE=128
const MFL_GRAPPLERESET=256
const MFL_WALK=512
const MOVERESULT_MOVEMENTVIEW=1
const MOVERESULT_SWIMVIEW=2
const MOVERESULT_WAITING=4
const MOVERESULT_MOVEMENTVIEWSET=8
const MOVERESULT_MOVEMENTWEAPON=16
const MOVERESULT_ONTOPOFOBSTACLE=32
const MOVERESULT_ONTOPOF_FUNCBOB=64
const MOVERESULT_ONTOPOF_ELEVATOR=128
const MOVERESULT_BLOCKEDBYAVOIDSPOT=256
const MAX_AVOIDREACH=1
const MAX_AVOIDSPOTS=32
const AVOID_CLEAR=0
const AVOID_ALWAYS=1
const AVOID_DONTBLOCK=2
const RESULTTYPE_ELEVATORUP=1
const RESULTTYPE_WAITFORFUNCBOBBING=2
const RESULTTYPE_BADGRAPPLEPATH=4
const RESULTTYPE_INSOLIDAREA=8
const PFL_WINDOWDAMAGE=1
const PFL_RETURN=2
const WFL_FIRERELEASED=1
const DAMAGETYPE_IMPACT=1
const DAMAGETYPE_RADIAL=2
const DAMAGETYPE_VISIBLE=4
const BOTLIB_API_VERSION=2
const BOTFILESBASEFOLDER="botfiles"
const LINECOLOR_NONE=-1
const LINECOLOR_RED=1
const LINECOLOR_GREEN=2
const LINECOLOR_BLUE=3
const LINECOLOR_YELLOW=4
const LINECOLOR_ORANGE=5
const PRT_MESSAGE=1
const PRT_WARNING=2
const PRT_ERROR=3
const PRT_FATAL=4
const PRT_EXIT=5
const CMS_NORMAL=0
const CMS_CHAT=1
const BLERR_NOERROR=0
const BLERR_LIBRARYNOTSETUP=1
const BLERR_INVALIDENTITYNUMBER=2
const BLERR_NOAASFILE=3
const BLERR_CANNOTOPENAASFILE=4
const BLERR_WRONGAASFILEID=5
const BLERR_WRONGAASFILEVERSION=6
const BLERR_CANNOTREADAASLUMP=7
const BLERR_CANNOTLOADICHAT=8
const BLERR_CANNOTLOADITEMWEIGHTS=9
const BLERR_CANNOTLOADITEMCONFIG=10
const BLERR_CANNOTLOADWEAPONWEIGHTS=11
const BLERR_CANNOTLOADWEAPONCONFIG=12
const ACTION_ATTACK=0x0000001
const ACTION_USE=0x0000002
const ACTION_RESPAWN=0x0000008
const ACTION_JUMP=0x0000010
const ACTION_MOVEUP=0x0000020
const ACTION_CROUCH=0x0000080
const ACTION_MOVEDOWN=0x0000100
const ACTION_MOVEFORWARD=0x0000200
const ACTION_MOVEBACK=0x0000800
const ACTION_MOVELEFT=0x0001000
const ACTION_MOVERIGHT=0x0002000
const ACTION_DELAYEDJUMP=0x0008000
const ACTION_TALK=0x0010000
const ACTION_GESTURE=0x0020000
const ACTION_WALK=0x0080000
const ACTION_AFFIRMATIVE=0x0100000
const ACTION_NEGATIVE=0x0200000
const ACTION_GETFLAG=0x0800000
const ACTION_GUARDBASE=0x1000000
const ACTION_PATROL=0x2000000
const ACTION_FOLLOWME=0x8000000

/// Return the ordered constant names table for public headers: 156 entries beginning with `"MAX_STRINGFIELD"` and `"TFL_INVALID"`.
function constantNames() return ["MAX_STRINGFIELD","TFL_INVALID","TFL_WALK","TFL_CROUCH","TFL_BARRIERJUMP","TFL_JUMP","TFL_LADDER","TFL_WALKOFFLEDGE","TFL_SWIM","TFL_WATERJUMP","TFL_TELEPORT","TFL_ELEVATOR","TFL_ROCKETJUMP","TFL_BFGJUMP","TFL_GRAPPLEHOOK","TFL_DOUBLEJUMP","TFL_RAMPJUMP","TFL_STRAFEJUMP","TFL_JUMPPAD","TFL_AIR","TFL_WATER","TFL_SLIME","TFL_LAVA","TFL_DONOTENTER","TFL_FUNCBOB","TFL_FLIGHT","TFL_BRIDGE","TFL_NOTTEAM1","TFL_NOTTEAM2","TFL_DEFAULT","SE_NONE","SE_HITGROUND","SE_LEAVEGROUND","SE_ENTERWATER","SE_ENTERSLIME","SE_ENTERLAVA","SE_HITGROUNDDAMAGE","SE_GAP","SE_TOUCHJUMPPAD","SE_TOUCHTELEPORTER","SE_ENTERAREA","SE_HITGROUNDAREA","SE_HITBOUNDINGBOX","SE_TOUCHCLUSTERPORTAL","ALTROUTEGOAL_ALL","ALTROUTEGOAL_CLUSTERPORTALS","ALTROUTEGOAL_VIEWPORTALS","RSE_NONE","RSE_NOROUTE","RSE_USETRAVELTYPE","RSE_ENTERCONTENTS","RSE_ENTERAREA","MAX_MESSAGE_SIZE","MAX_CHATTYPE_NAME","MAX_MATCHVARIABLES","CHAT_GENDERLESS","CHAT_GENDERFEMALE","CHAT_GENDERMALE","CHAT_ALL","CHAT_TEAM","CHAT_TELL","MAX_AVOIDGOALS","MAX_GOALSTACK","GFL_NONE","GFL_ITEM","GFL_ROAM","GFL_DROPPED","MOVE_WALK","MOVE_CROUCH","MOVE_JUMP","MOVE_GRAPPLE","MOVE_ROCKETJUMP","MOVE_BFGJUMP","MFL_BARRIERJUMP","MFL_ONGROUND","MFL_SWIMMING","MFL_AGAINSTLADDER","MFL_WATERJUMP","MFL_TELEPORTED","MFL_GRAPPLEPULL","MFL_ACTIVEGRAPPLE","MFL_GRAPPLERESET","MFL_WALK","MOVERESULT_MOVEMENTVIEW","MOVERESULT_SWIMVIEW","MOVERESULT_WAITING","MOVERESULT_MOVEMENTVIEWSET","MOVERESULT_MOVEMENTWEAPON","MOVERESULT_ONTOPOFOBSTACLE","MOVERESULT_ONTOPOF_FUNCBOB","MOVERESULT_ONTOPOF_ELEVATOR","MOVERESULT_BLOCKEDBYAVOIDSPOT","MAX_AVOIDREACH","MAX_AVOIDSPOTS","AVOID_CLEAR","AVOID_ALWAYS","AVOID_DONTBLOCK","RESULTTYPE_ELEVATORUP","RESULTTYPE_WAITFORFUNCBOBBING","RESULTTYPE_BADGRAPPLEPATH","RESULTTYPE_INSOLIDAREA","PFL_WINDOWDAMAGE","PFL_RETURN","WFL_FIRERELEASED","DAMAGETYPE_IMPACT","DAMAGETYPE_RADIAL","DAMAGETYPE_VISIBLE","BOTLIB_API_VERSION","BOTFILESBASEFOLDER","LINECOLOR_NONE","LINECOLOR_RED","LINECOLOR_GREEN","LINECOLOR_BLUE","LINECOLOR_YELLOW","LINECOLOR_ORANGE","PRT_MESSAGE","PRT_WARNING","PRT_ERROR","PRT_FATAL","PRT_EXIT","CMS_NORMAL","CMS_CHAT","BLERR_NOERROR","BLERR_LIBRARYNOTSETUP","BLERR_INVALIDENTITYNUMBER","BLERR_NOAASFILE","BLERR_CANNOTOPENAASFILE","BLERR_WRONGAASFILEID","BLERR_WRONGAASFILEVERSION","BLERR_CANNOTREADAASLUMP","BLERR_CANNOTLOADICHAT","BLERR_CANNOTLOADITEMWEIGHTS","BLERR_CANNOTLOADITEMCONFIG","BLERR_CANNOTLOADWEAPONWEIGHTS","BLERR_CANNOTLOADWEAPONCONFIG","ACTION_ATTACK","ACTION_USE","ACTION_RESPAWN","ACTION_JUMP","ACTION_MOVEUP","ACTION_CROUCH","ACTION_MOVEDOWN","ACTION_MOVEFORWARD","ACTION_MOVEBACK","ACTION_MOVELEFT","ACTION_MOVERIGHT","ACTION_DELAYEDJUMP","ACTION_TALK","ACTION_GESTURE","ACTION_WALK","ACTION_AFFIRMATIVE","ACTION_NEGATIVE","ACTION_GETFLAG","ACTION_GUARDBASE","ACTION_PATROL","ACTION_FOLLOWME"] end function
/// Return the ordered constant values table for public headers: 156 entries beginning with `MAX_STRINGFIELD` and `TFL_INVALID`.
function constantValues() return [MAX_STRINGFIELD,TFL_INVALID,TFL_WALK,TFL_CROUCH,TFL_BARRIERJUMP,TFL_JUMP,TFL_LADDER,TFL_WALKOFFLEDGE,TFL_SWIM,TFL_WATERJUMP,TFL_TELEPORT,TFL_ELEVATOR,TFL_ROCKETJUMP,TFL_BFGJUMP,TFL_GRAPPLEHOOK,TFL_DOUBLEJUMP,TFL_RAMPJUMP,TFL_STRAFEJUMP,TFL_JUMPPAD,TFL_AIR,TFL_WATER,TFL_SLIME,TFL_LAVA,TFL_DONOTENTER,TFL_FUNCBOB,TFL_FLIGHT,TFL_BRIDGE,TFL_NOTTEAM1,TFL_NOTTEAM2,TFL_DEFAULT,SE_NONE,SE_HITGROUND,SE_LEAVEGROUND,SE_ENTERWATER,SE_ENTERSLIME,SE_ENTERLAVA,SE_HITGROUNDDAMAGE,SE_GAP,SE_TOUCHJUMPPAD,SE_TOUCHTELEPORTER,SE_ENTERAREA,SE_HITGROUNDAREA,SE_HITBOUNDINGBOX,SE_TOUCHCLUSTERPORTAL,ALTROUTEGOAL_ALL,ALTROUTEGOAL_CLUSTERPORTALS,ALTROUTEGOAL_VIEWPORTALS,RSE_NONE,RSE_NOROUTE,RSE_USETRAVELTYPE,RSE_ENTERCONTENTS,RSE_ENTERAREA,MAX_MESSAGE_SIZE,MAX_CHATTYPE_NAME,MAX_MATCHVARIABLES,CHAT_GENDERLESS,CHAT_GENDERFEMALE,CHAT_GENDERMALE,CHAT_ALL,CHAT_TEAM,CHAT_TELL,MAX_AVOIDGOALS,MAX_GOALSTACK,GFL_NONE,GFL_ITEM,GFL_ROAM,GFL_DROPPED,MOVE_WALK,MOVE_CROUCH,MOVE_JUMP,MOVE_GRAPPLE,MOVE_ROCKETJUMP,MOVE_BFGJUMP,MFL_BARRIERJUMP,MFL_ONGROUND,MFL_SWIMMING,MFL_AGAINSTLADDER,MFL_WATERJUMP,MFL_TELEPORTED,MFL_GRAPPLEPULL,MFL_ACTIVEGRAPPLE,MFL_GRAPPLERESET,MFL_WALK,MOVERESULT_MOVEMENTVIEW,MOVERESULT_SWIMVIEW,MOVERESULT_WAITING,MOVERESULT_MOVEMENTVIEWSET,MOVERESULT_MOVEMENTWEAPON,MOVERESULT_ONTOPOFOBSTACLE,MOVERESULT_ONTOPOF_FUNCBOB,MOVERESULT_ONTOPOF_ELEVATOR,MOVERESULT_BLOCKEDBYAVOIDSPOT,MAX_AVOIDREACH,MAX_AVOIDSPOTS,AVOID_CLEAR,AVOID_ALWAYS,AVOID_DONTBLOCK,RESULTTYPE_ELEVATORUP,RESULTTYPE_WAITFORFUNCBOBBING,RESULTTYPE_BADGRAPPLEPATH,RESULTTYPE_INSOLIDAREA,PFL_WINDOWDAMAGE,PFL_RETURN,WFL_FIRERELEASED,DAMAGETYPE_IMPACT,DAMAGETYPE_RADIAL,DAMAGETYPE_VISIBLE,BOTLIB_API_VERSION,BOTFILESBASEFOLDER,LINECOLOR_NONE,LINECOLOR_RED,LINECOLOR_GREEN,LINECOLOR_BLUE,LINECOLOR_YELLOW,LINECOLOR_ORANGE,PRT_MESSAGE,PRT_WARNING,PRT_ERROR,PRT_FATAL,PRT_EXIT,CMS_NORMAL,CMS_CHAT,BLERR_NOERROR,BLERR_LIBRARYNOTSETUP,BLERR_INVALIDENTITYNUMBER,BLERR_NOAASFILE,BLERR_CANNOTOPENAASFILE,BLERR_WRONGAASFILEID,BLERR_WRONGAASFILEVERSION,BLERR_CANNOTREADAASLUMP,BLERR_CANNOTLOADICHAT,BLERR_CANNOTLOADITEMWEIGHTS,BLERR_CANNOTLOADITEMCONFIG,BLERR_CANNOTLOADWEAPONWEIGHTS,BLERR_CANNOTLOADWEAPONCONFIG,ACTION_ATTACK,ACTION_USE,ACTION_RESPAWN,ACTION_JUMP,ACTION_MOVEUP,ACTION_CROUCH,ACTION_MOVEDOWN,ACTION_MOVEFORWARD,ACTION_MOVEBACK,ACTION_MOVELEFT,ACTION_MOVERIGHT,ACTION_DELAYEDJUMP,ACTION_TALK,ACTION_GESTURE,ACTION_WALK,ACTION_AFFIRMATIVE,ACTION_NEGATIVE,ACTION_GETFLAG,ACTION_GUARDBASE,ACTION_PATROL,ACTION_FOLLOWME] end function
/// Return the ordered type names table for public headers: 25 entries beginning with `"solid_t"` and `"aas_trace_t"`.
function typeNames() return ["solid_t","aas_trace_t","aas_entityinfo_t","aas_areainfo_t","aas_clientmove_t","aas_altroutegoal_t","aas_predictroute_t","bot_consolemessage_t","bot_matchvariable_t","bot_match_t","bot_goal_t","bot_initmove_t","bot_moveresult_t","bot_avoidspot_t","projectileinfo_t","weaponinfo_t","bot_input_t","bsp_surface_t","bsp_trace_t","bot_entitystate_t","botlib_import_t","aas_export_t","ea_export_t","ai_export_t","botlib_export_t"] end function
/// Return the ordered declaration names table for public headers: 113 entries beginning with `"BotLoadCharacter"` and `"BotFreeCharacter"`.
function declarationNames() return ["BotLoadCharacter","BotFreeCharacter","Characteristic_Float","Characteristic_BFloat","Characteristic_Integer","Characteristic_BInteger","Characteristic_String","BotShutdownCharacters","BotSetupChatAI","BotShutdownChatAI","BotAllocChatState","BotFreeChatState","BotQueueConsoleMessage","BotRemoveConsoleMessage","BotNextConsoleMessage","BotNumConsoleMessages","BotInitialChat","BotNumInitialChats","BotReplyChat","BotChatLength","BotEnterChat","BotGetChatMessage","StringContains","BotFindMatch","BotMatchVariable","UnifyWhiteSpaces","BotReplaceSynonyms","BotLoadChatFile","BotSetChatGender","BotSetChatName","GeneticParentsAndChildSelection","BotResetGoalState","BotResetAvoidGoals","BotRemoveFromAvoidGoals","BotPushGoal","BotPopGoal","BotEmptyGoalStack","BotDumpAvoidGoals","BotDumpGoalStack","BotGoalName","BotGetTopGoal","BotGetSecondGoal","BotChooseLTGItem","BotChooseNBGItem","BotTouchingGoal","BotItemGoalInVisButNotVisible","BotGetLevelItemGoal","BotGetNextCampSpotGoal","BotGetMapLocationGoal","BotAvoidGoalTime","BotSetAvoidGoalTime","BotInitLevelItems","BotUpdateEntityItems","BotInterbreedGoalFuzzyLogic","BotSaveGoalFuzzyLogic","BotMutateGoalFuzzyLogic","BotLoadItemWeights","BotFreeItemWeights","BotAllocGoalState","BotFreeGoalState","BotSetupGoalAI","BotShutdownGoalAI","BotResetMoveState","BotMoveToGoal","BotMoveInDirection","BotResetAvoidReach","BotResetLastAvoidReach","BotReachabilityArea","BotMovementViewTarget","BotPredictVisiblePosition","BotAllocMoveState","BotFreeMoveState","BotInitMoveState","BotAddAvoidSpot","BotSetBrushModelTypes","BotSetupMoveAI","BotShutdownMoveAI","BotSetupWeaponAI","BotShutdownWeaponAI","BotChooseBestFightWeapon","BotGetWeaponInfo","BotLoadWeaponWeights","BotAllocWeaponState","BotFreeWeaponState","BotResetWeaponState","EA_Say","EA_SayTeam","EA_Command","EA_Action","EA_Crouch","EA_Walk","EA_MoveUp","EA_MoveDown","EA_MoveForward","EA_MoveBack","EA_MoveLeft","EA_MoveRight","EA_Attack","EA_Respawn","EA_Talk","EA_Gesture","EA_Use","EA_SelectWeapon","EA_Jump","EA_DelayedJump","EA_Move","EA_View","EA_EndRegular","EA_GetInput","EA_ResetInput","EA_Setup","EA_Shutdown","GetBotLibAPI"] end function
/// Return the ordered struct names table for public headers: 24 entries beginning with `"aas_trace_t"` and `"aas_entityinfo_t"`.
function structNames() return ["aas_trace_t","aas_entityinfo_t","aas_areainfo_t","aas_clientmove_t","aas_altroutegoal_t","aas_predictroute_t","bot_consolemessage_t","bot_matchvariable_t","bot_match_t","bot_goal_t","bot_initmove_t","bot_moveresult_t","bot_avoidspot_t","projectileinfo_t","weaponinfo_t","bot_input_t","bsp_surface_t","bsp_trace_t","bot_entitystate_t","botlib_import_t","aas_export_t","ea_export_t","ai_export_t","botlib_export_t"] end function
/// Return the ordered field names table for public headers: 333 entries beginning with `"startsolid"` and `"fraction"`.
function fieldNames() return ["startsolid","fraction","endpos","ent","lastarea","area","planenum","valid","type","flags","ltime","update_time","number","origin","angles","old_origin","lastvisorigin","mins","maxs","groundent","solid","modelindex","modelindex2","frame","event","eventParm","powerups","weapon","legsAnim","torsoAnim","contents","flags","presencetype","cluster","mins","maxs","center","endpos","endarea","velocity","trace","presencetype","stopevent","endcontents","time","frames","origin","areanum","starttraveltime","goaltraveltime","extratraveltime","endpos","endarea","stopevent","endcontents","endtravelflags","numareas","time","handle","time","type","message","prev","next","offset","length","string","type","subtype","variables","origin","areanum","mins","maxs","entitynum","number","flags","iteminfo","origin","velocity","viewoffset","entitynum","client","thinktime","presencetype","viewangles","or_moveflags","failure","type","blocked","blockentity","traveltype","flags","weapon","movedir","ideal_viewangles","origin","radius","type","name","model","flags","gravity","damage","radius","visdamage","damagetype","healthinc","push","detonation","bounce","bouncefric","bouncestop","valid","number","name","model","level","weaponindex","flags","projectile","numprojectiles","hspread","vspread","speed","acceleration","recoil","offset","angleoffset","extrazvelocity","ammoamount","ammoindex","activate","reload","spinup","spindown","proj","thinktime","dir","speed","viewangles","actionflags","weapon","name","flags","value","allsolid","startsolid","fraction","endpos","plane","exp_dist","sidenum","surface","contents","ent","type","flags","origin","angles","old_origin","mins","maxs","groundent","solid","modelindex","modelindex2","frame","event","eventParm","powerups","weapon","legsAnim","torsoAnim","Print","Trace","EntityTrace","PointContents","inPVS","BSPEntityData","BSPModelMinsMaxsOrigin","BotClientCommand","GetMemory","FreeMemory","AvailableMemory","HunkAlloc","FS_FOpenFile","FS_Read","FS_Write","FS_FCloseFile","FS_Seek","DebugLineCreate","DebugLineDelete","DebugLineShow","DebugPolygonCreate","DebugPolygonDelete","AAS_EntityInfo","AAS_Initialized","AAS_PresenceTypeBoundingBox","AAS_Time","AAS_PointAreaNum","AAS_PointReachabilityAreaIndex","AAS_TraceAreas","AAS_BBoxAreas","AAS_AreaInfo","AAS_PointContents","AAS_NextBSPEntity","AAS_ValueForBSPEpairKey","AAS_VectorForBSPEpairKey","AAS_FloatForBSPEpairKey","AAS_IntForBSPEpairKey","AAS_AreaReachability","AAS_AreaTravelTimeToGoalArea","AAS_EnableRoutingArea","AAS_PredictRoute","AAS_AlternativeRouteGoals","AAS_Swimming","AAS_PredictClientMovement","EA_Command","EA_Say","EA_SayTeam","EA_Action","EA_Gesture","EA_Talk","EA_Attack","EA_Use","EA_Respawn","EA_MoveUp","EA_MoveDown","EA_MoveForward","EA_MoveBack","EA_MoveLeft","EA_MoveRight","EA_Crouch","EA_SelectWeapon","EA_Jump","EA_DelayedJump","EA_Move","EA_View","EA_EndRegular","EA_GetInput","EA_ResetInput","BotLoadCharacter","BotFreeCharacter","Characteristic_Float","Characteristic_BFloat","Characteristic_Integer","Characteristic_BInteger","Characteristic_String","BotAllocChatState","BotFreeChatState","BotQueueConsoleMessage","BotRemoveConsoleMessage","BotNextConsoleMessage","BotNumConsoleMessages","BotInitialChat","BotNumInitialChats","BotReplyChat","BotChatLength","BotEnterChat","BotGetChatMessage","StringContains","BotFindMatch","BotMatchVariable","UnifyWhiteSpaces","BotReplaceSynonyms","BotLoadChatFile","BotSetChatGender","BotSetChatName","BotResetGoalState","BotResetAvoidGoals","BotRemoveFromAvoidGoals","BotPushGoal","BotPopGoal","BotEmptyGoalStack","BotDumpAvoidGoals","BotDumpGoalStack","BotGoalName","BotGetTopGoal","BotGetSecondGoal","BotChooseLTGItem","BotChooseNBGItem","BotTouchingGoal","BotItemGoalInVisButNotVisible","BotGetLevelItemGoal","BotGetNextCampSpotGoal","BotGetMapLocationGoal","BotAvoidGoalTime","BotSetAvoidGoalTime","BotInitLevelItems","BotUpdateEntityItems","BotLoadItemWeights","BotFreeItemWeights","BotInterbreedGoalFuzzyLogic","BotSaveGoalFuzzyLogic","BotMutateGoalFuzzyLogic","BotAllocGoalState","BotFreeGoalState","BotResetMoveState","BotMoveToGoal","BotMoveInDirection","BotResetAvoidReach","BotResetLastAvoidReach","BotReachabilityArea","BotMovementViewTarget","BotPredictVisiblePosition","BotAllocMoveState","BotFreeMoveState","BotInitMoveState","BotAddAvoidSpot","BotChooseBestFightWeapon","BotGetWeaponInfo","BotLoadWeaponWeights","BotAllocWeaponState","BotFreeWeaponState","BotResetWeaponState","GeneticParentsAndChildSelection","BotLibSetup","BotLibShutdown","BotLibVarSet","BotLibVarGet","PC_AddGlobalDefine","PC_LoadSourceHandle","PC_FreeSourceHandle","PC_ReadTokenHandle","PC_SourceFileAndLine","BotLibStartFrame","BotLibLoadMap","BotLibUpdateEntity","Test","aas","ea","ai"] end function
/// Return a new array `["startsolid","fraction","endpos","ent","lastarea","area","planenum"]` for `aas_trace_tFields`.
function aas_trace_tFields() return ["startsolid","fraction","endpos","ent","lastarea","area","planenum"] end function
/// Return the ordered aas entityinfo t fields table for public headers: 23 entries beginning with `"valid"` and `"type"`.
function aas_entityinfo_tFields() return ["valid","type","flags","ltime","update_time","number","origin","angles","old_origin","lastvisorigin","mins","maxs","groundent","solid","modelindex","modelindex2","frame","event","eventParm","powerups","weapon","legsAnim","torsoAnim"] end function
/// Return a new array `["contents","flags","presencetype","cluster","mins","maxs","center"]` for `aas_areainfo_tFields`.
function aas_areainfo_tFields() return ["contents","flags","presencetype","cluster","mins","maxs","center"] end function
/// Return a new array `["endpos","endarea","velocity","trace","presencetype","stopevent","endcontents","time","frames"]` for `aas_clientmove_tFields`.
function aas_clientmove_tFields() return ["endpos","endarea","velocity","trace","presencetype","stopevent","endcontents","time","frames"] end function
/// Return a new array `["origin","areanum","starttraveltime","goaltraveltime","extratraveltime"]` for `aas_altroutegoal_tFields`.
function aas_altroutegoal_tFields() return ["origin","areanum","starttraveltime","goaltraveltime","extratraveltime"] end function
/// Return a new array `["endpos","endarea","stopevent","endcontents","endtravelflags","numareas","time"]` for `aas_predictroute_tFields`.
function aas_predictroute_tFields() return ["endpos","endarea","stopevent","endcontents","endtravelflags","numareas","time"] end function
/// Return a new array `["handle","time","type","message","prev","next"]` for `bot_consolemessage_tFields`.
function bot_consolemessage_tFields() return ["handle","time","type","message","prev","next"] end function
/// Return a new array `["offset","length"]` for `bot_matchvariable_tFields`.
function bot_matchvariable_tFields() return ["offset","length"] end function
/// Return a new array `["string","type","subtype","variables"]` for `bot_match_tFields`.
function bot_match_tFields() return ["string","type","subtype","variables"] end function
/// Return a new array `["origin","areanum","mins","maxs","entitynum","number","flags","iteminfo"]` for `bot_goal_tFields`.
function bot_goal_tFields() return ["origin","areanum","mins","maxs","entitynum","number","flags","iteminfo"] end function
/// Return a new array `["origin","velocity","viewoffset","entitynum","client","thinktime","presencetype","viewangles","or_moveflags"]` for `bot_initmove_tFields`.
function bot_initmove_tFields() return ["origin","velocity","viewoffset","entitynum","client","thinktime","presencetype","viewangles","or_moveflags"] end function
/// Return a new array `["failure","type","blocked","blockentity","traveltype","flags","weapon","movedir","ideal_viewangles"]` for `bot_moveresult_tFields`.
function bot_moveresult_tFields() return ["failure","type","blocked","blockentity","traveltype","flags","weapon","movedir","ideal_viewangles"] end function
/// Return a new array `["origin","radius","type"]` for `bot_avoidspot_tFields`.
function bot_avoidspot_tFields() return ["origin","radius","type"] end function
/// Return a new array `["name","model","flags","gravity","damage","radius","visdamage","damagetype","healthinc","push","detonation","bounce","bouncefric","bouncestop"]` for `projectileinfo_tFields`.
function projectileinfo_tFields() return ["name","model","flags","gravity","damage","radius","visdamage","damagetype","healthinc","push","detonation","bounce","bouncefric","bouncestop"] end function
/// Return the ordered weaponinfo t fields table for public headers: 24 entries beginning with `"valid"` and `"number"`.
function weaponinfo_tFields() return ["valid","number","name","model","level","weaponindex","flags","projectile","numprojectiles","hspread","vspread","speed","acceleration","recoil","offset","angleoffset","extrazvelocity","ammoamount","ammoindex","activate","reload","spinup","spindown","proj"] end function
/// Return a new array `["thinktime","dir","speed","viewangles","actionflags","weapon"]` for `bot_input_tFields`.
function bot_input_tFields() return ["thinktime","dir","speed","viewangles","actionflags","weapon"] end function
/// Return a new array `["name","flags","value"]` for `bsp_surface_tFields`.
function bsp_surface_tFields() return ["name","flags","value"] end function
/// Return a new array `["allsolid","startsolid","fraction","endpos","plane","exp_dist","sidenum","surface","contents","ent"]` for `bsp_trace_tFields`.
function bsp_trace_tFields() return ["allsolid","startsolid","fraction","endpos","plane","exp_dist","sidenum","surface","contents","ent"] end function
/// Return the ordered bot entitystate t fields table for public headers: 18 entries beginning with `"type"` and `"flags"`.
function bot_entitystate_tFields() return ["type","flags","origin","angles","old_origin","mins","maxs","groundent","solid","modelindex","modelindex2","frame","event","eventParm","powerups","weapon","legsAnim","torsoAnim"] end function
/// Return the ordered botlib import t fields table for public headers: 22 entries beginning with `"Print"` and `"Trace"`.
function botlib_import_tFields() return ["Print","Trace","EntityTrace","PointContents","inPVS","BSPEntityData","BSPModelMinsMaxsOrigin","BotClientCommand","GetMemory","FreeMemory","AvailableMemory","HunkAlloc","FS_FOpenFile","FS_Read","FS_Write","FS_FCloseFile","FS_Seek","DebugLineCreate","DebugLineDelete","DebugLineShow","DebugPolygonCreate","DebugPolygonDelete"] end function
/// Return the ordered aas export t fields table for public headers: 22 entries beginning with `"AAS_EntityInfo"` and `"AAS_Initialized"`.
function aas_export_tFields() return ["AAS_EntityInfo","AAS_Initialized","AAS_PresenceTypeBoundingBox","AAS_Time","AAS_PointAreaNum","AAS_PointReachabilityAreaIndex","AAS_TraceAreas","AAS_BBoxAreas","AAS_AreaInfo","AAS_PointContents","AAS_NextBSPEntity","AAS_ValueForBSPEpairKey","AAS_VectorForBSPEpairKey","AAS_FloatForBSPEpairKey","AAS_IntForBSPEpairKey","AAS_AreaReachability","AAS_AreaTravelTimeToGoalArea","AAS_EnableRoutingArea","AAS_PredictRoute","AAS_AlternativeRouteGoals","AAS_Swimming","AAS_PredictClientMovement"] end function
/// Return the ordered ea export t fields table for public headers: 24 entries beginning with `"EA_Command"` and `"EA_Say"`.
function ea_export_tFields() return ["EA_Command","EA_Say","EA_SayTeam","EA_Action","EA_Gesture","EA_Talk","EA_Attack","EA_Use","EA_Respawn","EA_MoveUp","EA_MoveDown","EA_MoveForward","EA_MoveBack","EA_MoveLeft","EA_MoveRight","EA_Crouch","EA_SelectWeapon","EA_Jump","EA_DelayedJump","EA_Move","EA_View","EA_EndRegular","EA_GetInput","EA_ResetInput"] end function
/// Return the ordered ai export t fields table for public headers: 75 entries beginning with `"BotLoadCharacter"` and `"BotFreeCharacter"`.
function ai_export_tFields() return ["BotLoadCharacter","BotFreeCharacter","Characteristic_Float","Characteristic_BFloat","Characteristic_Integer","Characteristic_BInteger","Characteristic_String","BotAllocChatState","BotFreeChatState","BotQueueConsoleMessage","BotRemoveConsoleMessage","BotNextConsoleMessage","BotNumConsoleMessages","BotInitialChat","BotNumInitialChats","BotReplyChat","BotChatLength","BotEnterChat","BotGetChatMessage","StringContains","BotFindMatch","BotMatchVariable","UnifyWhiteSpaces","BotReplaceSynonyms","BotLoadChatFile","BotSetChatGender","BotSetChatName","BotResetGoalState","BotResetAvoidGoals","BotRemoveFromAvoidGoals","BotPushGoal","BotPopGoal","BotEmptyGoalStack","BotDumpAvoidGoals","BotDumpGoalStack","BotGoalName","BotGetTopGoal","BotGetSecondGoal","BotChooseLTGItem","BotChooseNBGItem","BotTouchingGoal","BotItemGoalInVisButNotVisible","BotGetLevelItemGoal","BotGetNextCampSpotGoal","BotGetMapLocationGoal","BotAvoidGoalTime","BotSetAvoidGoalTime","BotInitLevelItems","BotUpdateEntityItems","BotLoadItemWeights","BotFreeItemWeights","BotInterbreedGoalFuzzyLogic","BotSaveGoalFuzzyLogic","BotMutateGoalFuzzyLogic","BotAllocGoalState","BotFreeGoalState","BotResetMoveState","BotMoveToGoal","BotMoveInDirection","BotResetAvoidReach","BotResetLastAvoidReach","BotReachabilityArea","BotMovementViewTarget","BotPredictVisiblePosition","BotAllocMoveState","BotFreeMoveState","BotInitMoveState","BotAddAvoidSpot","BotChooseBestFightWeapon","BotGetWeaponInfo","BotLoadWeaponWeights","BotAllocWeaponState","BotFreeWeaponState","BotResetWeaponState","GeneticParentsAndChildSelection"] end function
/// Return the ordered botlib export t fields table for public headers: 16 entries beginning with `"BotLibSetup"` and `"BotLibShutdown"`.
function botlib_export_tFields() return ["BotLibSetup","BotLibShutdown","BotLibVarSet","BotLibVarGet","PC_AddGlobalDefine","PC_LoadSourceHandle","PC_FreeSourceHandle","PC_ReadTokenHandle","PC_SourceFileAndLine","BotLibStartFrame","BotLibLoadMap","BotLibUpdateEntity","Test","aas","ea","ai"] end function
/// Test `value==BOTLIB_API_VERSION` as the condition for `validApiVersion`.
/// @param value Operand used to evaluate the returned expression `value==BOTLIB_API_VERSION`.
function validApiVersion(value) return value==BOTLIB_API_VERSION end function
/// Test `value>=CHAT_GENDERLESS and value<=CHAT_GENDERMALE` as the condition for `validChatGender`.
/// @param value Operand used to evaluate the returned expression `value>=CHAT_GENDERLESS and value<=CHAT_GENDERMALE`.
function validChatGender(value) return value>=CHAT_GENDERLESS and value<=CHAT_GENDERMALE end function
/// Test `(flags&required)==required` as the condition for `hasTravel`.
/// @param flags Operand used to evaluate the returned expression `(flags&required)==required`.
/// @param required Operand used to evaluate the returned expression `(flags&required)==required`.
function hasTravel(flags,required) return (flags&required)==required end function
/// Return `TFL_DEFAULT` for `defaultTravelFlags`.
function defaultTravelFlags() return TFL_DEFAULT end function
/// Return a new array `[156,25,113,24,333]` for `inventoryCounts`.
function inventoryCounts() return [156,25,113,24,333] end function
/// Return a new array `[4,36,140,52,84,24,36,276,8,328,56,68,52,20,208,552,40,24,84,112,88,88,96,300,536]` for `abiSizes`.
function abiSizes() return [4,36,140,52,84,24,36,276,8,328,56,68,52,20,208,552,40,24,84,112,88,88,96,300,536] end function
