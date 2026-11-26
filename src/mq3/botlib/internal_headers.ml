// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Canonical contract facade for the internal Baseq3 botlib headers.
package mq3.botlib.internal_headers

/// Maximum character capacity of a BSP entity key or value.
const MAX_EPAIRKEY=128
/// Maximum number of client slots supported by these interfaces.
const MAX_CLIENTS=64
/// These are sent over the net as 8 bits.
const MAX_MODELS=256
/// So they cannot be blindly increased.
const MAX_SOUNDS=256
/// Number of indexed configuration-string slots in the game protocol.
const MAX_CONFIGSTRINGS=1024
/// Configuration-string slot used to publish score information.
const CS_SCORES=32
/// First configuration-string slot reserved for registered model names.
const CS_MODELS=96
/// First configuration-string slot reserved for registered sound names.
const CS_SOUNDS=352
/// Byte capacity of a bot-library path string.
const MAX_PATH=64
/// Routing-cache type identifier for routes between cluster portals.
const CACHETYPE_PORTAL=0
/// Routing-cache type identifier for routes within an AAS cluster.
const CACHETYPE_AREA=1
/// Fuzzy-weight node kind whose value can be adjusted during weight balancing.
const WT_BALANCE=1
/// Maximum number of named fuzzy-weight expressions in a configuration.
const MAX_WEIGHTS=128
/// String used to separate path components in botlib file names.
const PATHSEPERATOR_STR="\\"
/// Character used to separate path components in botlib file names.
const PATHSEPERATOR_CHAR=92
/// Preprocessor-definition flag preventing removal or ordinary replacement.
const DEFINE_FIXED=1
/// Preprocessor built-in macro identifier for line.
const BUILTIN_LINE=1
/// Preprocessor built-in macro identifier for file.
const BUILTIN_FILE=2
/// Preprocessor built-in macro identifier for date.
const BUILTIN_DATE=3
/// Preprocessor built-in macro identifier for time.
const BUILTIN_TIME=4
/// Preprocessor built-in macro identifier for C standard compatibility.
const BUILTIN_STDC=5
/// Preprocessor nesting-kind identifier for if.
const INDENT_IF=1
/// Preprocessor nesting-kind identifier for else.
const INDENT_ELSE=2
/// Preprocessor nesting-kind identifier for elif.
const INDENT_ELIF=4
/// Preprocessor nesting-kind identifier for ifdef.
const INDENT_IFDEF=8
/// Preprocessor nesting-kind identifier for ifndef.
const INDENT_IFNDEF=16
/// Maximum character capacity reserved for a scanner token spelling.
const MAX_TOKENLENGTH=1024
/// Maximum character capacity reserved for a scanner token spelling.
const MAX_TOKEN=1024
/// Scanner flag suppressing error diagnostics.
const SCFL_NOERRORS=1
/// Scanner flag suppressing warning diagnostics.
const SCFL_NOWARNINGS=2
/// Scanner flag preventing whitespace-separated string literals from being joined.
const SCFL_NOSTRINGWHITESPACES=4
/// Scanner flag disabling escape-sequence interpretation inside string literals.
const SCFL_NOSTRINGESCAPECHARS=8
/// Scanner flag selecting primitive tokenization rules.
const SCFL_PRIMITIVE=16
/// Scanner flag disabling binary-number literal syntax.
const SCFL_NOBINARYNUMBERS=32
/// Scanner flag preventing numeric token values from being calculated.
const SCFL_NONUMBERVALUES=64
/// Token-kind identifier for a quoted string literal.
const TT_STRING=1
/// Token-kind identifier for a quoted character literal.
const TT_LITERAL=2
/// Token-kind identifier for a numeric literal.
const TT_NUMBER=3
/// Token-kind identifier for an identifier or unquoted name.
const TT_NAME=4
/// Token-kind identifier for an operator or punctuation spelling.
const TT_PUNCTUATION=5
/// Numeric-token subtype flag for decimal notation.
const TT_DECIMAL=8
/// Numeric-token subtype flag for hexadecimal notation.
const TT_HEX=256
/// Numeric-token subtype flag for octal notation.
const TT_OCTAL=512
/// Numeric-token subtype flag for binary notation.
const TT_BINARY=1024
/// Numeric-token subtype flag for a floating-point value.
const TT_FLOAT=2048
/// Numeric-token subtype flag for an integer value.
const TT_INTEGER=4096
/// Numeric-token subtype flag for an integer with a long suffix.
const TT_LONG=8192
/// Numeric-token subtype flag for an unsigned integer.
const TT_UNSIGNED=16384
/// Scanner punctuation identifier for `>>=`.
const P_RSHIFT_ASSIGN=1
/// Scanner punctuation identifier for `<<=`.
const P_LSHIFT_ASSIGN=2
/// Scanner punctuation identifier for `...`.
const P_PARMS=3
/// Scanner punctuation identifier for `##`.
const P_PRECOMPMERGE=4
/// Scanner punctuation identifier for `&&`.
const P_LOGIC_AND=5
/// Scanner punctuation identifier for `||`.
const P_LOGIC_OR=6
/// Scanner punctuation identifier for `>=`.
const P_LOGIC_GEQ=7
/// Scanner punctuation identifier for `<=`.
const P_LOGIC_LEQ=8
/// Scanner punctuation identifier for `==`.
const P_LOGIC_EQ=9
/// Scanner punctuation identifier for `!=`.
const P_LOGIC_UNEQ=10
/// Scanner punctuation identifier for `*=`.
const P_MUL_ASSIGN=11
/// Scanner punctuation identifier for `/=`.
const P_DIV_ASSIGN=12
/// Scanner punctuation identifier for `%=`.
const P_MOD_ASSIGN=13
/// Scanner punctuation identifier for `+=`.
const P_ADD_ASSIGN=14
/// Scanner punctuation identifier for `-=`.
const P_SUB_ASSIGN=15
/// Scanner punctuation identifier for `++`.
const P_INC=16
/// Scanner punctuation identifier for `--`.
const P_DEC=17
/// Scanner punctuation identifier for `&=`.
const P_BIN_AND_ASSIGN=18
/// Scanner punctuation identifier for `|=`.
const P_BIN_OR_ASSIGN=19
/// Scanner punctuation identifier for `^=`.
const P_BIN_XOR_ASSIGN=20
/// Scanner punctuation identifier for `>>`.
const P_RSHIFT=21
/// Scanner punctuation identifier for `<<`.
const P_LSHIFT=22
/// Scanner punctuation identifier for `->`.
const P_POINTERREF=23
/// Scanner punctuation identifier for `::`.
const P_CPP1=24
/// Scanner punctuation identifier for `.*`.
const P_CPP2=25
/// Scanner punctuation identifier for `*`.
const P_MUL=26
/// Scanner punctuation identifier for `/`.
const P_DIV=27
/// Scanner punctuation identifier for `%`.
const P_MOD=28
/// Scanner punctuation identifier for `+`.
const P_ADD=29
/// Scanner punctuation identifier for `-`.
const P_SUB=30
/// Scanner punctuation identifier for `=`.
const P_ASSIGN=31
/// Scanner punctuation identifier for `&`.
const P_BIN_AND=32
/// Scanner punctuation identifier for `|`.
const P_BIN_OR=33
/// Scanner punctuation identifier for `^`.
const P_BIN_XOR=34
/// Scanner punctuation identifier for `~`.
const P_BIN_NOT=35
/// Scanner punctuation identifier for `!`.
const P_LOGIC_NOT=36
/// Scanner punctuation identifier for `>`.
const P_LOGIC_GREATER=37
/// Scanner punctuation identifier for `<`.
const P_LOGIC_LESS=38
/// Scanner punctuation identifier for `.`.
const P_REF=39
/// Scanner punctuation identifier for `,`.
const P_COMMA=40
/// Scanner punctuation identifier for `;`.
const P_SEMICOLON=41
/// Scanner punctuation identifier for `:`.
const P_COLON=42
/// Scanner punctuation identifier for `?`.
const P_QUESTIONMARK=43
/// Scanner punctuation identifier for `(`.
const P_PARENTHESESOPEN=44
/// Scanner punctuation identifier for `)`.
const P_PARENTHESESCLOSE=45
/// Scanner punctuation identifier for `{`.
const P_BRACEOPEN=46
/// Scanner punctuation identifier for `}`.
const P_BRACECLOSE=47
/// Scanner punctuation identifier for `[`.
const P_SQBRACKETOPEN=48
/// Scanner punctuation identifier for `]`.
const P_SQBRACKETCLOSE=49
/// Scanner punctuation identifier for `\\`.
const P_BACKSLASH=50
/// Scanner punctuation identifier for `#`.
const P_PRECOMP=51
/// Scanner punctuation identifier for `$`.
const P_DOLLAR=52
/// Character capacity of a fixed-size botlib ABI string field.
const MAX_STRINGFIELD=80
/// Structure-reader type code for a character-sized integer.
const FT_CHAR=1
/// Structure-reader type code for an integer field.
const FT_INT=2
/// Structure-reader type code for a floating-point field.
const FT_FLOAT=3
/// Structure-reader type code for a fixed-size string field.
const FT_STRING=4
/// Structure-reader type code for a nested structure.
const FT_STRUCT=6
/// Mask selecting the base field type in a structure-reader descriptor.
const FT_TYPE=255
/// Structure-reader modifier identifying an array field.
const FT_ARRAY=256
/// Structure-reader modifier enforcing numeric minimum and maximum bounds.
const FT_BOUNDED=512
/// Structure-reader modifier selecting unsigned integer interpretation.
const FT_UNSIGNED=1024

/// Return the ordered header names table for internal headers: 22 entries beginning with `"be_aas_bsp.h"` and `"be_aas_cluster.h"`.
function headerNames() return ["be_aas_bsp.h","be_aas_cluster.h","be_aas_debug.h","be_aas_def.h","be_aas_entity.h","be_aas_file.h","be_aas_funcs.h","be_aas_main.h","be_aas_move.h","be_aas_optimize.h","be_aas_reach.h","be_aas_route.h","be_aas_routealt.h","be_aas_sample.h","be_ai_weight.h","be_interface.h","l_log.h","l_memory.h","l_precomp.h","l_script.h","l_struct.h","l_utils.h"] end function
/// Return the ordered ownership mappings table for internal headers: 22 entries beginning with `"be_aas_bsp.h=aas_bspq3,aas_client_trace"` and `"be_aas_cluster.h=aas_clustering"`.
function ownershipMappings() return ["be_aas_bsp.h=aas_bspq3,aas_client_trace","be_aas_cluster.h=aas_clustering","be_aas_debug.h=aas_debug","be_aas_def.h=aas_runtime,aas_routing_cache","be_aas_entity.h=aas_entities","be_aas_file.h=be_aas_file","be_aas_funcs.h=aas_main","be_aas_main.h=aas_main,aas_runtime","be_aas_move.h=be_aas_move,aas_client_movement","be_aas_optimize.h=aas_optimizer","be_aas_reach.h=aas_reachability","be_aas_route.h=be_aas_route,aas_routing","be_aas_routealt.h=aas_route_extras","be_aas_sample.h=aas_sample,aas_trace_areas","be_ai_weight.h=ai_weight_runtime,ai_item_weights","be_interface.h=be_interface,server_imports","l_log.h=log","l_memory.h=l_memory","l_precomp.h=l_precomp","l_script.h=l_script","l_struct.h=l_struct","l_utils.h=internal_headers"] end function
/// Return the ordered macro names table for internal headers: 119 entries beginning with `"MAX_EPAIRKEY"` and `"AAS_DEBUG"`.
function macroNames() return ["MAX_EPAIRKEY","AAS_DEBUG","MAX_CLIENTS","MAX_MODELS","MAX_SOUNDS","MAX_CONFIGSTRINGS","CS_SCORES","CS_MODELS","CS_SOUNDS","MAX_PATH","CACHETYPE_PORTAL","CACHETYPE_AREA","AASINTERN","WT_BALANCE","MAX_WEIGHTS","RANDOMIZE","GetHunkMemory","GetClearedHunkMemory","PATHSEPERATOR_STR","PATHSEPERATOR_CHAR","QDECL","DEFINE_FIXED","BUILTIN_LINE","BUILTIN_FILE","BUILTIN_DATE","BUILTIN_TIME","BUILTIN_STDC","INDENT_IF","INDENT_ELSE","INDENT_ELIF","INDENT_IFDEF","INDENT_IFNDEF","MAX_TOKENLENGTH","BINARYNUMBERS","NUMBERVALUE","DOLLAR","MAX_TOKEN","SCFL_NOERRORS","SCFL_NOWARNINGS","SCFL_NOSTRINGWHITESPACES","SCFL_NOSTRINGESCAPECHARS","SCFL_PRIMITIVE","SCFL_NOBINARYNUMBERS","SCFL_NONUMBERVALUES","TT_STRING","TT_LITERAL","TT_NUMBER","TT_NAME","TT_PUNCTUATION","TT_DECIMAL","TT_HEX","TT_OCTAL","TT_BINARY","TT_FLOAT","TT_INTEGER","TT_LONG","TT_UNSIGNED","P_RSHIFT_ASSIGN","P_LSHIFT_ASSIGN","P_PARMS","P_PRECOMPMERGE","P_LOGIC_AND","P_LOGIC_OR","P_LOGIC_GEQ","P_LOGIC_LEQ","P_LOGIC_EQ","P_LOGIC_UNEQ","P_MUL_ASSIGN","P_DIV_ASSIGN","P_MOD_ASSIGN","P_ADD_ASSIGN","P_SUB_ASSIGN","P_INC","P_DEC","P_BIN_AND_ASSIGN","P_BIN_OR_ASSIGN","P_BIN_XOR_ASSIGN","P_RSHIFT","P_LSHIFT","P_POINTERREF","P_CPP1","P_CPP2","P_MUL","P_DIV","P_MOD","P_ADD","P_SUB","P_ASSIGN","P_BIN_AND","P_BIN_OR","P_BIN_XOR","P_BIN_NOT","P_LOGIC_NOT","P_LOGIC_GREATER","P_LOGIC_LESS","P_REF","P_COMMA","P_SEMICOLON","P_COLON","P_QUESTIONMARK","P_PARENTHESESOPEN","P_PARENTHESESCLOSE","P_BRACEOPEN","P_BRACECLOSE","P_SQBRACKETOPEN","P_SQBRACKETCLOSE","P_BACKSLASH","P_PRECOMP","P_DOLLAR","MAX_STRINGFIELD","FT_CHAR","FT_INT","FT_FLOAT","FT_STRING","FT_STRUCT","FT_TYPE","FT_ARRAY","FT_BOUNDED","FT_UNSIGNED"] end function
/// Return the ordered constant names table for internal headers: 110 entries beginning with `"MAX_EPAIRKEY"` and `"MAX_CLIENTS"`.
function constantNames() return ["MAX_EPAIRKEY","MAX_CLIENTS","MAX_MODELS","MAX_SOUNDS","MAX_CONFIGSTRINGS","CS_SCORES","CS_MODELS","CS_SOUNDS","MAX_PATH","CACHETYPE_PORTAL","CACHETYPE_AREA","WT_BALANCE","MAX_WEIGHTS","PATHSEPERATOR_STR","PATHSEPERATOR_CHAR","DEFINE_FIXED","BUILTIN_LINE","BUILTIN_FILE","BUILTIN_DATE","BUILTIN_TIME","BUILTIN_STDC","INDENT_IF","INDENT_ELSE","INDENT_ELIF","INDENT_IFDEF","INDENT_IFNDEF","MAX_TOKENLENGTH","MAX_TOKEN","SCFL_NOERRORS","SCFL_NOWARNINGS","SCFL_NOSTRINGWHITESPACES","SCFL_NOSTRINGESCAPECHARS","SCFL_PRIMITIVE","SCFL_NOBINARYNUMBERS","SCFL_NONUMBERVALUES","TT_STRING","TT_LITERAL","TT_NUMBER","TT_NAME","TT_PUNCTUATION","TT_DECIMAL","TT_HEX","TT_OCTAL","TT_BINARY","TT_FLOAT","TT_INTEGER","TT_LONG","TT_UNSIGNED","P_RSHIFT_ASSIGN","P_LSHIFT_ASSIGN","P_PARMS","P_PRECOMPMERGE","P_LOGIC_AND","P_LOGIC_OR","P_LOGIC_GEQ","P_LOGIC_LEQ","P_LOGIC_EQ","P_LOGIC_UNEQ","P_MUL_ASSIGN","P_DIV_ASSIGN","P_MOD_ASSIGN","P_ADD_ASSIGN","P_SUB_ASSIGN","P_INC","P_DEC","P_BIN_AND_ASSIGN","P_BIN_OR_ASSIGN","P_BIN_XOR_ASSIGN","P_RSHIFT","P_LSHIFT","P_POINTERREF","P_CPP1","P_CPP2","P_MUL","P_DIV","P_MOD","P_ADD","P_SUB","P_ASSIGN","P_BIN_AND","P_BIN_OR","P_BIN_XOR","P_BIN_NOT","P_LOGIC_NOT","P_LOGIC_GREATER","P_LOGIC_LESS","P_REF","P_COMMA","P_SEMICOLON","P_COLON","P_QUESTIONMARK","P_PARENTHESESOPEN","P_PARENTHESESCLOSE","P_BRACEOPEN","P_BRACECLOSE","P_SQBRACKETOPEN","P_SQBRACKETCLOSE","P_BACKSLASH","P_PRECOMP","P_DOLLAR","MAX_STRINGFIELD","FT_CHAR","FT_INT","FT_FLOAT","FT_STRING","FT_STRUCT","FT_TYPE","FT_ARRAY","FT_BOUNDED","FT_UNSIGNED"] end function
/// Return the ordered constant values table for internal headers: 110 entries beginning with `MAX_EPAIRKEY` and `MAX_CLIENTS`.
function constantValues() return [MAX_EPAIRKEY,MAX_CLIENTS,MAX_MODELS,MAX_SOUNDS,MAX_CONFIGSTRINGS,CS_SCORES,CS_MODELS,CS_SOUNDS,MAX_PATH,CACHETYPE_PORTAL,CACHETYPE_AREA,WT_BALANCE,MAX_WEIGHTS,PATHSEPERATOR_STR,PATHSEPERATOR_CHAR,DEFINE_FIXED,BUILTIN_LINE,BUILTIN_FILE,BUILTIN_DATE,BUILTIN_TIME,BUILTIN_STDC,INDENT_IF,INDENT_ELSE,INDENT_ELIF,INDENT_IFDEF,INDENT_IFNDEF,MAX_TOKENLENGTH,MAX_TOKEN,SCFL_NOERRORS,SCFL_NOWARNINGS,SCFL_NOSTRINGWHITESPACES,SCFL_NOSTRINGESCAPECHARS,SCFL_PRIMITIVE,SCFL_NOBINARYNUMBERS,SCFL_NONUMBERVALUES,TT_STRING,TT_LITERAL,TT_NUMBER,TT_NAME,TT_PUNCTUATION,TT_DECIMAL,TT_HEX,TT_OCTAL,TT_BINARY,TT_FLOAT,TT_INTEGER,TT_LONG,TT_UNSIGNED,P_RSHIFT_ASSIGN,P_LSHIFT_ASSIGN,P_PARMS,P_PRECOMPMERGE,P_LOGIC_AND,P_LOGIC_OR,P_LOGIC_GEQ,P_LOGIC_LEQ,P_LOGIC_EQ,P_LOGIC_UNEQ,P_MUL_ASSIGN,P_DIV_ASSIGN,P_MOD_ASSIGN,P_ADD_ASSIGN,P_SUB_ASSIGN,P_INC,P_DEC,P_BIN_AND_ASSIGN,P_BIN_OR_ASSIGN,P_BIN_XOR_ASSIGN,P_RSHIFT,P_LSHIFT,P_POINTERREF,P_CPP1,P_CPP2,P_MUL,P_DIV,P_MOD,P_ADD,P_SUB,P_ASSIGN,P_BIN_AND,P_BIN_OR,P_BIN_XOR,P_BIN_NOT,P_LOGIC_NOT,P_LOGIC_GREATER,P_LOGIC_LESS,P_REF,P_COMMA,P_SEMICOLON,P_COLON,P_QUESTIONMARK,P_PARENTHESESOPEN,P_PARENTHESESCLOSE,P_BRACEOPEN,P_BRACECLOSE,P_SQBRACKETOPEN,P_SQBRACKETCLOSE,P_BACKSLASH,P_PRECOMP,P_DOLLAR,MAX_STRINGFIELD,FT_CHAR,FT_INT,FT_FLOAT,FT_STRING,FT_STRUCT,FT_TYPE,FT_ARRAY,FT_BOUNDED,FT_UNSIGNED] end function
/// Return the ordered type names table for internal headers: 25 entries beginning with `"aas_stringindex_t"` and `"aas_link_t"`.
function typeNames() return ["aas_stringindex_t","aas_link_t","bsp_link_t","bsp_entdata_t","aas_entity_t","aas_settings_t","aas_routingcache_t","aas_routingupdate_t","aas_reversedlink_t","aas_reversedreachability_t","aas_reachabilityareas_t","aas_t","fuzzyseperator_t","weight_t","weightconfig_t","botlib_globals_t","define_t","indent_t","source_t","pc_token_t","punctuation_t","token_t","script_t","fielddef_t","structdef_t"] end function
/// Return the ordered declaration names table for internal headers: 227 entries beginning with `"AAS_LoadBSPFile"` and `"AAS_DumpBSPData"`.
function declarationNames() return ["AAS_LoadBSPFile","AAS_DumpBSPData","AAS_UnlinkFromBSPLeaves","AAS_BSPLinkEntity","AAS_EntityCollision","AAS_PrintFreeBSPLinks","AAS_Trace","AAS_PointContents","AAS_inPVS","AAS_inPHS","AAS_AreasConnected","AAS_BoxEntities","AAS_BSPModelMinsMaxsOrigin","AAS_NextBSPEntity","AAS_ValueForBSPEpairKey","AAS_VectorForBSPEpairKey","AAS_FloatForBSPEpairKey","AAS_IntForBSPEpairKey","AAS_InitClustering","AAS_SetViewPortalsAsClusterPortals","AAS_ClearShownDebugLines","AAS_ClearShownPolygons","AAS_DebugLine","AAS_PermanentLine","AAS_DrawPermanentCross","AAS_DrawPlaneCross","AAS_ShowBoundingBox","AAS_ShowFace","AAS_ShowArea","AAS_ShowAreaPolygons","AAS_DrawCross","AAS_PrintTravelType","AAS_DrawArrow","AAS_ShowReachability","AAS_ShowReachableAreas","AAS_InvalidateEntities","AAS_UnlinkInvalidEntities","AAS_ResetEntityLinks","AAS_UpdateEntity","AAS_EntityBSPData","AAS_EntitySize","AAS_EntityModelNum","AAS_OriginOfMoverWithModelNum","AAS_BestReachableEntityArea","AAS_EntityInfo","AAS_NextEntity","AAS_EntityOrigin","AAS_EntityType","AAS_EntityModelindex","AAS_LoadAASFile","AAS_WriteAASFile","AAS_DumpAASData","AAS_FileInfo","AAS_Error","AAS_SetInitialized","AAS_Setup","AAS_Shutdown","AAS_LoadMap","AAS_StartFrame","AAS_Initialized","AAS_Loaded","AAS_ModelFromIndex","AAS_IndexFromModel","AAS_Time","AAS_ProjectPointOntoVector","AAS_PredictClientMovement","AAS_ClientMovementHitBBox","AAS_OnGround","AAS_Swimming","AAS_JumpReachRunStart","AAS_AgainstLadder","AAS_RocketJumpZVelocity","AAS_BFGJumpZVelocity","AAS_HorizontalVelocityForJump","AAS_SetMovedir","AAS_DropToFloor","AAS_InitSettings","AAS_Optimize","AAS_InitReachability","AAS_ContinueInitReachability","AAS_BestReachableLinkArea","AAS_AreaReachability","AAS_BestReachableArea","AAS_BestReachableFromJumpPadArea","AAS_NextModelReachability","AAS_AreaGroundFaceArea","AAS_AreaCrouch","AAS_AreaSwim","AAS_AreaLiquid","AAS_AreaLava","AAS_AreaSlime","AAS_AreaGrounded","AAS_AreaLadder","AAS_AreaJumpPad","AAS_AreaDoNotEnter","AAS_InitRouting","AAS_FreeRoutingCaches","AAS_AreaTravelTime","AAS_CreateAllRoutingCache","AAS_WriteRouteCache","AAS_RoutingInfo","AAS_TravelFlagForType","AAS_AreaContentsTravelFlags","AAS_NextAreaReachability","AAS_ReachabilityFromNum","AAS_RandomGoalArea","AAS_EnableRoutingArea","AAS_AreaTravelTimeToGoalArea","AAS_PredictRoute","AAS_InitAlternativeRouting","AAS_ShutdownAlternativeRouting","AAS_AlternativeRouteGoals","AAS_InitAASLinkHeap","AAS_InitAASLinkedEntities","AAS_FreeAASLinkHeap","AAS_FreeAASLinkedEntities","AAS_AreaGroundFace","AAS_TraceEndFace","AAS_PlaneFromNum","AAS_AASLinkEntity","AAS_LinkEntityClientBBox","AAS_PointInsideFace","AAS_InsideFace","AAS_UnlinkFromAreas","AAS_PresenceTypeBoundingBox","AAS_AreaCluster","AAS_AreaPresenceType","AAS_PointPresenceType","AAS_TraceClientBBox","AAS_TraceAreas","AAS_BBoxAreas","AAS_AreaInfo","AAS_PointAreaNum","AAS_PointReachabilityAreaIndex","AAS_FacePlane","ReadWeightConfig","FreeWeightConfig","WriteWeightConfig","FindFuzzyWeight","FuzzyWeight","FuzzyWeightUndecided","ScaleWeight","ScaleBalanceRange","EvolveWeightConfig","InterbreedWeightConfigs","BotShutdownWeights","Sys_MilliSeconds","Log_Open","Log_Close","Log_Shutdown","Log_Write","Log_WriteTimeStamped","Log_FilePointer","Log_Flush","GetMemory","GetClearedMemory","GetMemoryDebug","GetClearedMemoryDebug","GetHunkMemory","GetClearedHunkMemory","GetHunkMemoryDebug","GetClearedHunkMemoryDebug","FreeMemory","AvailableMemory","PrintUsedMemorySize","PrintMemoryLabels","MemoryByteSize","DumpMemory","PC_ReadToken","PC_ExpectTokenString","PC_ExpectTokenType","PC_ExpectAnyToken","PC_CheckTokenString","PC_CheckTokenType","PC_SkipUntilString","PC_UnreadLastToken","PC_UnreadToken","PC_ReadLine","PC_WhiteSpaceBeforeToken","PC_AddDefine","PC_AddGlobalDefine","PC_RemoveGlobalDefine","PC_RemoveAllGlobalDefines","PC_AddBuiltinDefines","PC_SetIncludePath","PC_SetPunctuations","PC_SetBaseFolder","LoadSourceFile","LoadSourceMemory","FreeSource","SourceError","SourceWarning","PC_LoadSourceHandle","PC_FreeSourceHandle","PC_ReadTokenHandle","PC_SourceFileAndLine","PC_CheckOpenSourceHandles","PS_ReadToken","PS_ExpectTokenString","PS_ExpectTokenType","PS_ExpectAnyToken","PS_CheckTokenString","PS_CheckTokenType","PS_SkipUntilString","PS_UnreadLastToken","PS_UnreadToken","PS_NextWhiteSpaceChar","StripDoubleQuotes","StripSingleQuotes","ReadSignedInt","ReadSignedFloat","SetScriptPunctuations","SetScriptFlags","GetScriptFlags","ResetScript","EndOfScript","PunctuationFromNum","LoadScriptFile","LoadScriptMemory","FreeScript","PS_SetBaseFolder","ScriptError","ScriptWarning","ReadStructure","WriteStructure","WriteIndent","WriteFloat"] end function
/// Return a new array `["aasworld","aassettings","botlibglobals","botimport","bot_developer"]` for `globalNames`.
function globalNames() return ["aasworld","aassettings","botlibglobals","botimport","bot_developer"] end function
/// Return the ordered field names table for internal headers: 236 entries beginning with `"aas_stringindex_t.numindexes"` and `"aas_stringindex_t.index"`.
function fieldNames() return ["aas_stringindex_t.numindexes","aas_stringindex_t.index","aas_link_t.entnum","aas_link_t.areanum","aas_link_t.next_ent","aas_link_t.prev_ent","aas_link_t.next_area","aas_link_t.prev_area","bsp_link_t.entnum","bsp_link_t.leafnum","bsp_link_t.next_ent","bsp_link_t.prev_ent","bsp_link_t.next_leaf","bsp_link_t.prev_leaf","bsp_entdata_t.origin","bsp_entdata_t.angles","bsp_entdata_t.absmins","bsp_entdata_t.absmaxs","bsp_entdata_t.solid","bsp_entdata_t.modelnum","aas_entity_t.i","aas_entity_t.areas","aas_entity_t.leaves","aas_settings_t.phys_gravitydirection","aas_settings_t.phys_friction","aas_settings_t.phys_stopspeed","aas_settings_t.phys_gravity","aas_settings_t.phys_waterfriction","aas_settings_t.phys_watergravity","aas_settings_t.phys_maxvelocity","aas_settings_t.phys_maxwalkvelocity","aas_settings_t.phys_maxcrouchvelocity","aas_settings_t.phys_maxswimvelocity","aas_settings_t.phys_walkaccelerate","aas_settings_t.phys_airaccelerate","aas_settings_t.phys_swimaccelerate","aas_settings_t.phys_maxstep","aas_settings_t.phys_maxsteepness","aas_settings_t.phys_maxwaterjump","aas_settings_t.phys_maxbarrier","aas_settings_t.phys_jumpvel","aas_settings_t.phys_falldelta5","aas_settings_t.phys_falldelta10","aas_settings_t.rs_waterjump","aas_settings_t.rs_teleport","aas_settings_t.rs_barrierjump","aas_settings_t.rs_startcrouch","aas_settings_t.rs_startgrapple","aas_settings_t.rs_startwalkoffledge","aas_settings_t.rs_startjump","aas_settings_t.rs_rocketjump","aas_settings_t.rs_bfgjump","aas_settings_t.rs_jumppad","aas_settings_t.rs_aircontrolledjumppad","aas_settings_t.rs_funcbob","aas_settings_t.rs_startelevator","aas_settings_t.rs_falldamage5","aas_settings_t.rs_falldamage10","aas_settings_t.rs_maxfallheight","aas_settings_t.rs_maxjumpfallheight","aas_routingcache_t.type","aas_routingcache_t.time","aas_routingcache_t.size","aas_routingcache_t.cluster","aas_routingcache_t.areanum","aas_routingcache_t.origin","aas_routingcache_t.starttraveltime","aas_routingcache_t.travelflags","aas_routingcache_t.prev","aas_routingcache_t.next","aas_routingcache_t.time_prev","aas_routingcache_t.time_next","aas_routingcache_t.reachabilities","aas_routingcache_t.traveltimes","aas_routingupdate_t.cluster","aas_routingupdate_t.areanum","aas_routingupdate_t.start","aas_routingupdate_t.tmptraveltime","aas_routingupdate_t.areatraveltimes","aas_routingupdate_t.inlist","aas_routingupdate_t.next","aas_routingupdate_t.prev","aas_reversedlink_t.linknum","aas_reversedlink_t.areanum","aas_reversedlink_t.next","aas_reversedreachability_t.numlinks","aas_reversedreachability_t.first","aas_reachabilityareas_t.firstarea","aas_reachabilityareas_t.numareas","aas_t.loaded","aas_t.initialized","aas_t.savefile","aas_t.bspchecksum","aas_t.time","aas_t.numframes","aas_t.filename","aas_t.mapname","aas_t.numbboxes","aas_t.bboxes","aas_t.numvertexes","aas_t.vertexes","aas_t.numplanes","aas_t.planes","aas_t.numedges","aas_t.edges","aas_t.edgeindexsize","aas_t.edgeindex","aas_t.numfaces","aas_t.faces","aas_t.faceindexsize","aas_t.faceindex","aas_t.numareas","aas_t.areas","aas_t.numareasettings","aas_t.areasettings","aas_t.reachabilitysize","aas_t.reachability","aas_t.numnodes","aas_t.nodes","aas_t.numportals","aas_t.portals","aas_t.portalindexsize","aas_t.portalindex","aas_t.numclusters","aas_t.clusters","aas_t.numreachabilityareas","aas_t.reachabilitytime","aas_t.linkheap","aas_t.linkheapsize","aas_t.freelinks","aas_t.arealinkedentities","aas_t.maxentities","aas_t.maxclients","aas_t.entities","aas_t.configstrings","aas_t.indexessetup","aas_t.travelflagfortype","aas_t.areacontentstravelflags","aas_t.areaupdate","aas_t.portalupdate","aas_t.frameroutingupdates","aas_t.reversedreachability","aas_t.areatraveltimes","aas_t.clusterareacache","aas_t.portalcache","aas_t.oldestcache","aas_t.newestcache","aas_t.portalmaxtraveltimes","aas_t.reachabilityareaindex","aas_t.reachabilityareas","fuzzyseperator_t.index","fuzzyseperator_t.value","fuzzyseperator_t.type","fuzzyseperator_t.weight","fuzzyseperator_t.minweight","fuzzyseperator_t.maxweight","fuzzyseperator_t.child","fuzzyseperator_t.next","weight_t.name","weight_t.firstseperator","weightconfig_t.numweights","weightconfig_t.weights","weightconfig_t.filename","botlib_globals_t.botlibsetup","botlib_globals_t.maxentities","botlib_globals_t.maxclients","botlib_globals_t.time","botlib_globals_t.debug","botlib_globals_t.goalareanum","botlib_globals_t.goalorigin","botlib_globals_t.runai","define_t.name","define_t.flags","define_t.builtin","define_t.numparms","define_t.parms","define_t.tokens","define_t.next","define_t.hashnext","indent_t.type","indent_t.skip","indent_t.script","indent_t.next","source_t.filename","source_t.includepath","source_t.punctuations","source_t.scriptstack","source_t.tokens","source_t.defines","source_t.definehash","source_t.indentstack","source_t.skip","source_t.token","pc_token_t.type","pc_token_t.subtype","pc_token_t.intvalue","pc_token_t.floatvalue","pc_token_t.string","punctuation_t.p","punctuation_t.n","punctuation_t.next","token_t.string","token_t.type","token_t.subtype","token_t.intvalue","token_t.floatvalue","token_t.whitespace_p","token_t.endwhitespace_p","token_t.line","token_t.linescrossed","token_t.next","script_t.filename","script_t.buffer","script_t.script_p","script_t.end_p","script_t.lastscript_p","script_t.whitespace_p","script_t.endwhitespace_p","script_t.length","script_t.line","script_t.lastline","script_t.tokenavailable","script_t.flags","script_t.punctuations","script_t.punctuationtable","script_t.token","script_t.next","fielddef_t.name","fielddef_t.offset","fielddef_t.type","fielddef_t.maxarray","fielddef_t.floatmin","fielddef_t.floatmax","fielddef_t.substruct","structdef_t.size","structdef_t.fields"] end function
/// Return a new array `[8,24,24,56,148,156,64,40,12,8,8,4580,32,8,1092,16,32,16,3152,1040,12,1072,2160,28,8]` for `x86AbiSizes`.
function x86AbiSizes() return [8,24,24,56,148,156,64,40,12,8,8,4580,32,8,1092,16,32,16,3152,1040,12,1072,2160,28,8] end function
/// Return a new array `[22,119,110,25,227,5,236]` for `headerCounts`.
function headerCounts() return [22,119,110,25,227,5,236] end function
/// Test `value==CACHETYPE_PORTAL or value==CACHETYPE_AREA` as the condition for `validCacheType`.
/// @param value Operand used to evaluate the returned expression `value==CACHETYPE_PORTAL or value==CACHETYPE_AREA`.
function validCacheType(value) return value==CACHETYPE_PORTAL or value==CACHETYPE_AREA end function
/// Test `value>=TT_STRING and value<=TT_PUNCTUATION` as the condition for `validTokenType`.
/// @param value Operand used to evaluate the returned expression `value>=TT_STRING and value<=TT_PUNCTUATION`.
function validTokenType(value) return value>=TT_STRING and value<=TT_PUNCTUATION end function
/// Check whether the masked structure-field type is char, integer, float, string or nested structure.
/// @param value Value used by `validFieldType` in `base=value&FT_TYPE`.
function validFieldType(value) base=value&FT_TYPE;return base==FT_CHAR or base==FT_INT or base==FT_FLOAT or base==FT_STRING or base==FT_STRUCT end function
/// Clamp epair text length to the available key buffer while reserving a terminating byte.
/// @param length Operand used to evaluate the returned expression `length`.
function clampEpairLength(length) if length<0 then return 0 end if;if length>=MAX_EPAIRKEY then return MAX_EPAIRKEY-1 end if;return length end function
