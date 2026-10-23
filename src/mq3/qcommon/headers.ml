// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Canonical declaration and ABI facade for the six QCommon headers.
package mq3.qcommon.headers

const MAX_SUBMODELS=256
const BOX_MODEL_HANDLE=255
const CAPSULE_MODEL_HANDLE=254
const SURFACE_CLIP_EPSILON=0.125
const MAX_FACETS=1024
const MAX_PATCH_PLANES=2048
const MAX_GRID_SIZE=129
const SUBDIVIDE_DISTANCE=16
const PLANE_TRI_EPSILON=0.1
const WRAP_POINT_EPSILON=0.1
const MAX_POINTS_ON_WINDING=64
const SIDE_FRONT=0
const SIDE_BACK=1
const SIDE_ON=2
const SIDE_CROSS=3
const CLIP_EPSILON=0.1
const MAX_MAP_BOUNDS=65535
const ON_EPSILON=0.1

const PACKET_BACKUP=32
const PACKET_MASK=31
const MAX_PACKET_USERCMDS=32
const PORT_ANY=-1
const MAX_RELIABLE_COMMANDS=64
const MAX_MSGLEN=16384
const MAX_DOWNLOAD_WINDOW=8
const MAX_DOWNLOAD_BLKSIZE=2048
const PROTOCOL_VERSION=68
const UPDATE_SERVER_NAME="update.quake3arena.com"
const MASTER_SERVER_NAME="master.quake3arena.com"
const AUTHORIZE_SERVER_NAME="authorize.quake3arena.com"
const PORT_MASTER=27950
const PORT_UPDATE=27951
const PORT_AUTHORIZE=27952
const PORT_SERVER=27960
const NUM_SERVER_PORTS=4
const FS_GENERAL_REF=1
const FS_UI_REF=2
const FS_CGAME_REF=4
const FS_QAGAME_REF=8
const NUM_ID_PAKS=9
const MAX_FILE_HANDLES=64
const BASEGAME="baseq3"
const MAX_EDIT_LINE=256
const CPUID_GENERIC=0
const CPUID_AXP=16
const CPUID_INTEL_UNSUPPORTED=32
const CPUID_INTEL_PENTIUM=33
const CPUID_INTEL_MMX=34
const CPUID_INTEL_KATMAI=35
const CPUID_AMD_3DNOW=48
const MAXPRINTMSG=4096
const HMAX=256
const NYT=256
const INTERNAL_NODE=257
const SV_ENCODE_START=4
const SV_DECODE_START=12
const CL_ENCODE_START=12
const CL_DECODE_START=4

const NA_BOT=0
const NA_BAD=1
const NA_LOOPBACK=2
const NA_BROADCAST=3
const NA_IP=4
const NA_IPX=5
const NA_BROADCAST_IPX=6
const NS_CLIENT=0
const NS_SERVER=1
const VMI_NATIVE=0
const VMI_BYTECODE=1
const VMI_COMPILED=2
const TRAP_MEMSET=100
const TRAP_MEMCPY=101
const TRAP_STRNCPY=102
const TRAP_SIN=103
const TRAP_COS=104
const TRAP_ATAN2=105
const TRAP_SQRT=106
const TRAP_MATRIXMULTIPLY=107
const TRAP_ANGLEVECTORS=108
const TRAP_PERPENDICULARVECTOR=109
const TRAP_FLOOR=110
const TRAP_CEIL=111
const TRAP_TESTPRINTINT=112
const TRAP_TESTPRINTFLOAT=113
const TAG_FREE=0
const TAG_GENERAL=1
const TAG_BOTLIB=2
const TAG_RENDERER=3
const TAG_SMALL=4
const TAG_STATIC=5
const AXIS_SIDE=0
const AXIS_FORWARD=1
const AXIS_UP=2
const AXIS_ROLL=3
const AXIS_YAW=4
const AXIS_PITCH=5
const MAX_JOYSTICK_AXIS=6
const SE_NONE=0
const SE_KEY=1
const SE_CHAR=2
const SE_MOUSE=3
const SE_JOYSTICK_AXIS=4
const SE_CONSOLE=5
const SE_PACKET=6

const UNZ_OK=0
const UNZ_END_OF_LIST_OF_FILE=-100
const UNZ_ERRNO=-1
const UNZ_EOF=0
const UNZ_PARAMERROR=-102
const UNZ_BADZIPFILE=-103
const UNZ_INTERNALERROR=-104
const UNZ_CRCERROR=-105
const UNZ_CASESENSITIVE=1
const UNZ_NOTCASESENSITIVE=2
const UNZ_OSDEFAULTCASE=0

function cmlocalMacroNames() return ["BOX_MODEL_HANDLE","CAPSULE_MODEL_HANDLE","MAX_SUBMODELS","SURFACE_CLIP_EPSILON"] end function
function cmlocalTypeNames() return ["cArea_t","cLeaf_t","cNode_t","cPatch_t","cbrush_t","cbrushside_t","clipMap_t","cmodel_t","leafList_t","sphere_t","traceWork_t"] end function
function cmlocalFunctionNames() return ["CM_BoxBrushes","CM_BoxLeafnums_r","CM_ClearLevelPatches","CM_ClipHandleToModel","CM_GeneratePatchCollide","CM_PositionTestInPatchCollide","CM_StoreBrushes","CM_StoreLeafs","CM_TraceThroughPatchCollide"] end function
function cmlocalGlobalNames() return ["c_patch_traces","c_pointcontents","cm","cm_noAreas","cm_noCurves","cm_playerCurveClip"] end function
function cmlocalFieldNames() return ["cArea_t.floodnum","cArea_t.floodvalid","cLeaf_t.area","cLeaf_t.cluster","cLeaf_t.firstLeafBrush","cLeaf_t.firstLeafSurface","cLeaf_t.numLeafBrushes","cLeaf_t.numLeafSurfaces","cNode_t.children","cNode_t.plane","cPatch_t.checkcount","cPatch_t.contents","cPatch_t.pc","cPatch_t.surfaceFlags","cbrush_t.bounds","cbrush_t.checkcount","cbrush_t.contents","cbrush_t.numsides","cbrush_t.shaderNum","cbrush_t.sides","cbrushside_t.plane","cbrushside_t.shaderNum","cbrushside_t.surfaceFlags","clipMap_t.name","clipMap_t.areaPortals","clipMap_t.areas","clipMap_t.brushes","clipMap_t.brushsides","clipMap_t.checkcount","clipMap_t.clusterBytes","clipMap_t.cmodels","clipMap_t.entityString","clipMap_t.floodvalid","clipMap_t.leafbrushes","clipMap_t.leafs","clipMap_t.leafsurfaces","clipMap_t.nodes","clipMap_t.numAreas","clipMap_t.numBrushSides","clipMap_t.numBrushes","clipMap_t.numClusters","clipMap_t.numEntityChars","clipMap_t.numLeafBrushes","clipMap_t.numLeafSurfaces","clipMap_t.numLeafs","clipMap_t.numNodes","clipMap_t.numPlanes","clipMap_t.numShaders","clipMap_t.numSubModels","clipMap_t.numSurfaces","clipMap_t.planes","clipMap_t.shaders","clipMap_t.surfaces","clipMap_t.vised","clipMap_t.visibility","cmodel_t.leaf","cmodel_t.maxs","cmodel_t.mins","leafList_t.bounds","leafList_t.count","leafList_t.lastLeaf","leafList_t.list","leafList_t.maxcount","leafList_t.overflowed","leafList_t.storeLeafs","sphere_t.halfheight","sphere_t.offset","sphere_t.radius","sphere_t.use","traceWork_t.bounds","traceWork_t.contents","traceWork_t.end","traceWork_t.extents","traceWork_t.isPoint","traceWork_t.maxOffset","traceWork_t.modelOrigin","traceWork_t.offsets","traceWork_t.size","traceWork_t.sphere","traceWork_t.start","traceWork_t.trace"] end function

function cmpatchMacroNames() return ["MAX_FACETS","MAX_GRID_SIZE","MAX_PATCH_PLANES","PLANE_TRI_EPSILON","SUBDIVIDE_DISTANCE","WRAP_POINT_EPSILON"] end function
function cmpatchTypeNames() return ["cGrid_t","facet_t","patchCollide_t","patchPlane_t"] end function
function cmpatchFunctionNames() return ["CM_GeneratePatchCollide"] end function
function cmpatchGlobalNames() return [] end function
function cmpatchFieldNames() return ["cGrid_t.points","cGrid_t.height","cGrid_t.width","cGrid_t.wrapHeight","cGrid_t.wrapWidth","facet_t.borderInward","facet_t.borderNoAdjust","facet_t.borderPlanes","facet_t.numBorders","facet_t.surfacePlane","patchCollide_t.bounds","patchCollide_t.facets","patchCollide_t.numFacets","patchCollide_t.numPlanes","patchCollide_t.planes","patchPlane_t.plane","patchPlane_t.signbits"] end function

function cmpolylibMacroNames() return ["CLIP_EPSILON","MAX_MAP_BOUNDS","MAX_POINTS_ON_WINDING","ON_EPSILON","SIDE_BACK","SIDE_CROSS","SIDE_FRONT","SIDE_ON"] end function
function cmpolylibTypeNames() return ["winding_t"] end function
function cmpolylibFunctionNames() return ["AddWindingToConvexHull","AllocWinding","BaseWindingForPlane","CheckWinding","ChopWinding","ChopWindingInPlace","ClipWindingEpsilon","CopyWinding","FreeWinding","RemoveColinearPoints","ReverseWinding","WindingArea","WindingBounds","WindingCenter","WindingOnPlaneSide","WindingPlane","pw"] end function
function cmpolylibGlobalNames() return [] end function
function cmpolylibFieldNames() return ["winding_t.numpoints","winding_t.p"] end function

function cmpublicMacroNames() return [] end function
function cmpublicTypeNames() return [] end function
function cmpublicFunctionNames() return ["CM_AdjustAreaPortalState","CM_AreasConnected","CM_BoxLeafnums","CM_BoxTrace","CM_ClearMap","CM_ClusterPVS","CM_DrawDebugSurface","CM_EntityString","CM_InlineModel","CM_LeafArea","CM_LeafCluster","CM_LerpTag","CM_LoadMap","CM_MarkFragments","CM_ModelBounds","CM_NumClusters","CM_NumInlineModels","CM_PointContents","CM_PointLeafnum","CM_TempBoxModel","CM_TransformedBoxTrace","CM_TransformedPointContents","CM_WriteAreaBits"] end function
function cmpublicGlobalNames() return [] end function
function cmpublicFieldNames() return [] end function

function qcommonMacroNames() return ["AUTHORIZE_SERVER_NAME","BASEGAME","CL_DECODE_START","CL_ENCODE_START","CPUID_AMD_3DNOW","CPUID_AXP","CPUID_GENERIC","CPUID_INTEL_KATMAI","CPUID_INTEL_MMX","CPUID_INTEL_PENTIUM","CPUID_INTEL_UNSUPPORTED","FS_CGAME_REF","FS_GENERAL_REF","FS_QAGAME_REF","FS_UI_REF","HMAX","INTERNAL_NODE","MASTER_SERVER_NAME","MAXPRINTMSG","MAX_DOWNLOAD_BLKSIZE","MAX_DOWNLOAD_WINDOW","MAX_EDIT_LINE","MAX_FILE_HANDLES","MAX_MSGLEN","MAX_PACKET_USERCMDS","MAX_RELIABLE_COMMANDS","NUM_ID_PAKS","NUM_SERVER_PORTS","NYT","PACKET_BACKUP","PACKET_MASK","PORT_ANY","PORT_AUTHORIZE","PORT_MASTER","PORT_SERVER","PORT_UPDATE","PROTOCOL_VERSION","Q_vsnprintf","SV_DECODE_START","SV_ENCODE_START","S_Malloc","UPDATE_SERVER_NAME","ZONE_DEBUG","Z_Malloc","Z_TagMalloc","_QCOMMON_H_"] end function
function qcommonTypeNames() return ["field_t","huff_t","huffman_t","joystickAxis_t","memtag_t","msg_t","netadr_t","netadrtype_t","netchan_t","netsrc_t","node_t","sharedTraps_t","sysEventType_t","sysEvent_t","vmInterpret_t","vm_t","xcommand_t"] end function
function qcommonEnumNames() return ["NA_BOT","NA_BAD","NA_LOOPBACK","NA_BROADCAST","NA_IP","NA_IPX","NA_BROADCAST_IPX","NS_CLIENT","NS_SERVER","VMI_NATIVE","VMI_BYTECODE","VMI_COMPILED","TRAP_MEMSET","TRAP_MEMCPY","TRAP_STRNCPY","TRAP_SIN","TRAP_COS","TRAP_ATAN2","TRAP_SQRT","TRAP_MATRIXMULTIPLY","TRAP_ANGLEVECTORS","TRAP_PERPENDICULARVECTOR","TRAP_FLOOR","TRAP_CEIL","TRAP_TESTPRINTINT","TRAP_TESTPRINTFLOAT","TAG_FREE","TAG_GENERAL","TAG_BOTLIB","TAG_RENDERER","TAG_SMALL","TAG_STATIC","AXIS_SIDE","AXIS_FORWARD","AXIS_UP","AXIS_ROLL","AXIS_YAW","AXIS_PITCH","MAX_JOYSTICK_AXIS","SE_NONE","SE_KEY","SE_CHAR","SE_MOUSE","SE_JOYSTICK_AXIS","SE_CONSOLE","SE_PACKET"] end function
function qcommonFunctionNames() return ["CL_CDDialog","CL_CharEvent","CL_ConsolePrint","CL_Disconnect","CL_FlushMemory","CL_ForwardCommandToServer","CL_Frame","CL_GameCommand","CL_Init","CL_InitKeyCommands","CL_JoystickEvent","CL_KeyEvent","CL_MapLoading","CL_MouseEvent","CL_PacketEvent","CL_Shutdown","CL_ShutdownAll","CL_StartHunkUsers","Cbuf_AddText","Cbuf_Execute","Cbuf_ExecuteText","Cbuf_Init","Cmd_AddCommand","Cmd_Argc","Cmd_Args","Cmd_ArgsBuffer","Cmd_ArgsFrom","Cmd_Argv","Cmd_ArgvBuffer","Cmd_Cmd","Cmd_CommandCompletion","Cmd_ExecuteString","Cmd_Init","Cmd_RemoveCommand","Cmd_TokenizeString","Com_BeginRedirect","Com_BlockChecksum","Com_BlockChecksumKey","Com_DPrintf","Com_EndRedirect","Com_Error","Com_EventLoop","Com_Filter","Com_FilterPath","Com_Frame","Com_HashKey","Com_Init","Com_Milliseconds","Com_Printf","Com_Quit_f","Com_RealTime","Com_SafeMode","Com_Shutdown","Com_StartupVariable","Com_TouchMemory","CopyString","Cvar_Command","Cvar_CommandCompletion","Cvar_Get","Cvar_InfoString","Cvar_InfoStringBuffer","Cvar_InfoString_Big","Cvar_Init","Cvar_Register","Cvar_Reset","Cvar_Restart_f","Cvar_Set","Cvar_SetCheatState","Cvar_SetLatched","Cvar_SetValue","Cvar_Update","Cvar_VariableIntegerValue","Cvar_VariableString","Cvar_VariableStringBuffer","Cvar_VariableValue","Cvar_WriteVariables","FS_ClearPakReferences","FS_ComparePaks","FS_ConditionalRestart","FS_FCloseFile","FS_FOpenFileByMode","FS_FOpenFileRead","FS_FOpenFileWrite","FS_FTell","FS_FileExists","FS_FileIsInPAK","FS_FilenameCompare","FS_Flush","FS_ForceFlush","FS_FreeFile","FS_FreeFileList","FS_GamePureChecksum","FS_GetFileList","FS_GetModList","FS_InitFilesystem","FS_Initialized","FS_ListFiles","FS_LoadStack","FS_LoadedPakChecksums","FS_LoadedPakNames","FS_LoadedPakPureChecksums","FS_Printf","FS_PureServerSetLoadedPaks","FS_PureServerSetReferencedPaks","FS_Read","FS_Read2","FS_ReadFile","FS_ReferencedPakChecksums","FS_ReferencedPakNames","FS_ReferencedPakPureChecksums","FS_Rename","FS_Restart","FS_SV_FOpenFileRead","FS_SV_FOpenFileWrite","FS_SV_Rename","FS_Seek","FS_Shutdown","FS_Write","FS_WriteFile","FS_filelength","FS_idPak","Field_Clear","Field_CompleteCommand","Huff_Compress","Huff_Decompress","Huff_Init","Huff_Receive","Huff_addRef","Huff_getBit","Huff_offsetReceive","Huff_offsetTransmit","Huff_putBit","Huff_transmit","Hunk_AllocateTempMemory","Hunk_CheckMark","Hunk_Clear","Hunk_ClearTempMemory","Hunk_ClearToMark","Hunk_FreeTempMemory","Hunk_Log","Hunk_MemoryRemaining","Hunk_SetMark","Hunk_Trash","Info_Print","Key_WriteBindings","MSG_BeginReading","MSG_BeginReadingOOB","MSG_Bitstream","MSG_Clear","MSG_Copy","MSG_Init","MSG_InitOOB","MSG_ReadAngle16","MSG_ReadBigString","MSG_ReadBits","MSG_ReadByte","MSG_ReadChar","MSG_ReadData","MSG_ReadDeltaEntity","MSG_ReadDeltaPlayerstate","MSG_ReadDeltaUsercmd","MSG_ReadDeltaUsercmdKey","MSG_ReadFloat","MSG_ReadLong","MSG_ReadShort","MSG_ReadString","MSG_ReadStringLine","MSG_ReportChangeVectors_f","MSG_WriteAngle16","MSG_WriteBigString","MSG_WriteBits","MSG_WriteByte","MSG_WriteChar","MSG_WriteData","MSG_WriteDeltaEntity","MSG_WriteDeltaPlayerstate","MSG_WriteDeltaUsercmd","MSG_WriteDeltaUsercmdKey","MSG_WriteFloat","MSG_WriteLong","MSG_WriteShort","MSG_WriteString","NET_AdrToString","NET_CompareAdr","NET_CompareBaseAdr","NET_Config","NET_GetLoopPacket","NET_Init","NET_IsLocalAddress","NET_OutOfBandData","NET_OutOfBandPrint","NET_Restart","NET_SendPacket","NET_Shutdown","NET_Sleep","NET_StringToAdr","Netchan_Init","Netchan_Process","Netchan_Setup","Netchan_Transmit","Netchan_TransmitNextFragment","SCR_DebugGraph","SV_Frame","SV_GameCommand","SV_Init","SV_PacketEvent","SV_Shutdown","S_ClearSoundBuffer","S_Malloc","S_MallocDebug","Sys_BeginProfiling","Sys_BeginStreamedFile","Sys_CheckCD","Sys_Cwd","Sys_DefaultCDPath","Sys_DefaultHomePath","Sys_DefaultInstallPath","Sys_DisplaySystemConsole","Sys_EndProfiling","Sys_EndStreamedFile","Sys_Error","Sys_FreeFileList","Sys_GetBotLibAPI","Sys_GetCGameAPI","Sys_GetClipboardData","Sys_GetCurrentUser","Sys_GetEvent","Sys_GetGameAPI","Sys_GetProcessorId","Sys_GetUIAPI","Sys_Init","Sys_IsLANAddress","Sys_ListFiles","Sys_LoadDll","Sys_LowPhysicalMemory","Sys_Milliseconds","Sys_Mkdir","Sys_MonkeyShouldBeSpanked","Sys_Print","Sys_ProcessorCount","Sys_Quit","Sys_SendPacket","Sys_SetDefaultCDPath","Sys_SetDefaultHomePath","Sys_SetDefaultInstallPath","Sys_SetErrorText","Sys_ShowConsole","Sys_ShowIP","Sys_SnapVector","Sys_StreamSeek","Sys_StreamedRead","Sys_StringToAdr","Sys_UnloadBotLib","Sys_UnloadCGame","Sys_UnloadDll","Sys_UnloadGame","Sys_UnloadUI","UI_GameCommand","UI_usesUniqueCDKey","VM_ArgPtr","VM_Call","VM_Clear","VM_Create","VM_Debug","VM_ExplicitArgPtr","VM_Free","VM_Init","VM_Restart","Z_AvailableMemory","Z_Free","Z_FreeTags","Z_LogHeap","Z_Malloc","Z_MallocDebug","Z_TagMalloc","Z_TagMallocDebug"] end function
function qcommonGlobalNames() return ["cl_cdkey","cl_paused","clientHuffTables","com_blood","com_buildScript","com_cameraMode","com_cl_running","com_dedicated","com_developer","com_errorEntered","com_frameMsec","com_frameTime","com_journal","com_journalDataFile","com_journalFile","com_speeds","com_sv_running","com_timescale","com_version","com_viewlog","cvar_modifiedFlags","demo_protocols","sv_paused","time_backend","time_frontend","time_game"] end function
function qcommonFieldNames() return ["field_t.buffer","field_t.cursor","field_t.scroll","field_t.widthInChars","huff_t.loc","huff_t.blocNode","huff_t.blocPtrs","huff_t.freelist","huff_t.lhead","huff_t.ltail","huff_t.nodeList","huff_t.nodePtrs","huff_t.tree","huffman_t.compressor","huffman_t.decompressor","msg_t.allowoverflow","msg_t.bit","msg_t.cursize","msg_t.data","msg_t.maxsize","msg_t.oob","msg_t.overflowed","msg_t.readcount","netadr_t.ip","netadr_t.ipx","netadr_t.port","netadr_t.type","netchan_t.fragmentBuffer","netchan_t.unsentBuffer","netchan_t.dropped","netchan_t.fragmentLength","netchan_t.fragmentSequence","netchan_t.incomingSequence","netchan_t.outgoingSequence","netchan_t.qport","netchan_t.remoteAddress","netchan_t.sock","netchan_t.unsentFragmentStart","netchan_t.unsentFragments","netchan_t.unsentLength","node_t.head","node_t.left","node_t.next","node_t.parent","node_t.prev","node_t.right","node_t.symbol","node_t.weight","sysEvent_t.evPtr","sysEvent_t.evPtrLength","sysEvent_t.evTime","sysEvent_t.evType","sysEvent_t.evValue","sysEvent_t.evValue2"] end function

function unzipMacroNames() return ["UNZ_BADZIPFILE","UNZ_CASESENSITIVE","UNZ_CRCERROR","UNZ_END_OF_LIST_OF_FILE","UNZ_EOF","UNZ_ERRNO","UNZ_INTERNALERROR","UNZ_NOTCASESENSITIVE","UNZ_OK","UNZ_OSDEFAULTCASE","UNZ_PARAMERROR"] end function
function unzipTypeNames() return ["file_in_zip_read_info_s","tm_unz","alloc_func","free_func","unzFile","unzFile__","unz_file_info","unz_file_info_internal","unz_global_info","unz_s","z_stream","z_streamp"] end function
function unzipFunctionNames() return ["unzClose","unzCloseCurrentFile","unzGetCurrentFileInfo","unzGetCurrentFileInfoPosition","unzGetGlobalComment","unzGetGlobalInfo","unzGetLocalExtrafield","unzGoToFirstFile","unzGoToNextFile","unzLocateFile","unzOpen","unzOpenCurrentFile","unzReOpen","unzReadCurrentFile","unzSetCurrentFileInfoPosition","unzStringFileNameCompare","unzeof","unztell"] end function
function unzipGlobalNames() return [] end function
function unzipFieldNames() return ["file_in_zip_read_info_s.byte_before_the_zipfile","file_in_zip_read_info_s.compression_method","file_in_zip_read_info_s.crc32","file_in_zip_read_info_s.crc32_wait","file_in_zip_read_info_s.file","file_in_zip_read_info_s.offset_local_extrafield","file_in_zip_read_info_s.pos_in_zipfile","file_in_zip_read_info_s.pos_local_extrafield","file_in_zip_read_info_s.read_buffer","file_in_zip_read_info_s.rest_read_compressed","file_in_zip_read_info_s.rest_read_uncompressed","file_in_zip_read_info_s.size_local_extrafield","file_in_zip_read_info_s.stream","file_in_zip_read_info_s.stream_initialised","tm_unz.tm_hour","tm_unz.tm_mday","tm_unz.tm_min","tm_unz.tm_mon","tm_unz.tm_sec","tm_unz.tm_year","unzFile__.unused","unz_file_info.compressed_size","unz_file_info.compression_method","unz_file_info.crc","unz_file_info.disk_num_start","unz_file_info.dosDate","unz_file_info.external_fa","unz_file_info.flag","unz_file_info.internal_fa","unz_file_info.size_file_comment","unz_file_info.size_file_extra","unz_file_info.size_filename","unz_file_info.tmu_date","unz_file_info.uncompressed_size","unz_file_info.version","unz_file_info.version_needed","unz_file_info_internal.offset_curfile","unz_global_info.number_entry","unz_global_info.size_comment","unz_s.byte_before_the_zipfile","unz_s.central_pos","unz_s.cur_file_info","unz_s.cur_file_info_internal","unz_s.current_file_ok","unz_s.file","unz_s.gi","unz_s.num_file","unz_s.offset_central_dir","unz_s.pfile_in_zip_read","unz_s.pos_in_central_dir","unz_s.size_central_dir","unz_s.tmpFile","unz_s.tmpPos","unz_s.tmpSize","z_stream.adler","z_stream.avail_in","z_stream.avail_out","z_stream.data_type","z_stream.msg","z_stream.next_in","z_stream.next_out","z_stream.opaque","z_stream.reserved","z_stream.state","z_stream.total_in","z_stream.total_out","z_stream.zalloc","z_stream.zfree"] end function

function macroNames() return ["AUTHORIZE_SERVER_NAME","BASEGAME","BOX_MODEL_HANDLE","CAPSULE_MODEL_HANDLE","CLIP_EPSILON","CL_DECODE_START","CL_ENCODE_START","CPUID_AMD_3DNOW","CPUID_AXP","CPUID_GENERIC","CPUID_INTEL_KATMAI","CPUID_INTEL_MMX","CPUID_INTEL_PENTIUM","CPUID_INTEL_UNSUPPORTED","FS_CGAME_REF","FS_GENERAL_REF","FS_QAGAME_REF","FS_UI_REF","HMAX","INTERNAL_NODE","MASTER_SERVER_NAME","MAXPRINTMSG","MAX_DOWNLOAD_BLKSIZE","MAX_DOWNLOAD_WINDOW","MAX_EDIT_LINE","MAX_FACETS","MAX_FILE_HANDLES","MAX_GRID_SIZE","MAX_MAP_BOUNDS","MAX_MSGLEN","MAX_PACKET_USERCMDS","MAX_PATCH_PLANES","MAX_POINTS_ON_WINDING","MAX_RELIABLE_COMMANDS","MAX_SUBMODELS","NUM_ID_PAKS","NUM_SERVER_PORTS","NYT","ON_EPSILON","PACKET_BACKUP","PACKET_MASK","PLANE_TRI_EPSILON","PORT_ANY","PORT_AUTHORIZE","PORT_MASTER","PORT_SERVER","PORT_UPDATE","PROTOCOL_VERSION","Q_vsnprintf","SIDE_BACK","SIDE_CROSS","SIDE_FRONT","SIDE_ON","SUBDIVIDE_DISTANCE","SURFACE_CLIP_EPSILON","SV_DECODE_START","SV_ENCODE_START","S_Malloc","UNZ_BADZIPFILE","UNZ_CASESENSITIVE","UNZ_CRCERROR","UNZ_END_OF_LIST_OF_FILE","UNZ_EOF","UNZ_ERRNO","UNZ_INTERNALERROR","UNZ_NOTCASESENSITIVE","UNZ_OK","UNZ_OSDEFAULTCASE","UNZ_PARAMERROR","UPDATE_SERVER_NAME","WRAP_POINT_EPSILON","ZONE_DEBUG","Z_Malloc","Z_TagMalloc","_QCOMMON_H_"] end function
function typeNames() return ["cArea_t","cGrid_t","cLeaf_t","cNode_t","cPatch_t","cbrush_t","cbrushside_t","clipMap_t","cmodel_t","facet_t","field_t","file_in_zip_read_info_s","huff_t","huffman_t","joystickAxis_t","leafList_t","memtag_t","msg_t","netadr_t","netadrtype_t","netchan_t","netsrc_t","node_t","patchCollide_t","patchPlane_t","sharedTraps_t","sphere_t","sysEventType_t","sysEvent_t","tm_unz","traceWork_t","alloc_func","free_func","unzFile","unzFile__","unz_file_info","unz_file_info_internal","unz_global_info","unz_s","vmInterpret_t","vm_t","winding_t","xcommand_t","z_stream","z_streamp"] end function
function enumNames() return qcommonEnumNames() end function
function functionNames() return ["AddWindingToConvexHull","AllocWinding","BaseWindingForPlane","CL_CDDialog","CL_CharEvent","CL_ConsolePrint","CL_Disconnect","CL_FlushMemory","CL_ForwardCommandToServer","CL_Frame","CL_GameCommand","CL_Init","CL_InitKeyCommands","CL_JoystickEvent","CL_KeyEvent","CL_MapLoading","CL_MouseEvent","CL_PacketEvent","CL_Shutdown","CL_ShutdownAll","CL_StartHunkUsers","CM_AdjustAreaPortalState","CM_AreasConnected","CM_BoxBrushes","CM_BoxLeafnums","CM_BoxLeafnums_r","CM_BoxTrace","CM_ClearLevelPatches","CM_ClearMap","CM_ClipHandleToModel","CM_ClusterPVS","CM_DrawDebugSurface","CM_EntityString","CM_GeneratePatchCollide","CM_InlineModel","CM_LeafArea","CM_LeafCluster","CM_LerpTag","CM_LoadMap","CM_MarkFragments","CM_ModelBounds","CM_NumClusters","CM_NumInlineModels","CM_PointContents","CM_PointLeafnum","CM_PositionTestInPatchCollide","CM_StoreBrushes","CM_StoreLeafs","CM_TempBoxModel","CM_TraceThroughPatchCollide","CM_TransformedBoxTrace","CM_TransformedPointContents","CM_WriteAreaBits","Cbuf_AddText","Cbuf_Execute","Cbuf_ExecuteText","Cbuf_Init","CheckWinding","ChopWinding","ChopWindingInPlace","ClipWindingEpsilon","Cmd_AddCommand","Cmd_Argc","Cmd_Args","Cmd_ArgsBuffer","Cmd_ArgsFrom","Cmd_Argv","Cmd_ArgvBuffer","Cmd_Cmd","Cmd_CommandCompletion","Cmd_ExecuteString","Cmd_Init","Cmd_RemoveCommand","Cmd_TokenizeString","Com_BeginRedirect","Com_BlockChecksum","Com_BlockChecksumKey","Com_DPrintf","Com_EndRedirect","Com_Error","Com_EventLoop","Com_Filter","Com_FilterPath","Com_Frame","Com_HashKey","Com_Init","Com_Milliseconds","Com_Printf","Com_Quit_f","Com_RealTime","Com_SafeMode","Com_Shutdown","Com_StartupVariable","Com_TouchMemory","CopyString","CopyWinding","Cvar_Command","Cvar_CommandCompletion","Cvar_Get","Cvar_InfoString","Cvar_InfoStringBuffer","Cvar_InfoString_Big","Cvar_Init","Cvar_Register","Cvar_Reset","Cvar_Restart_f","Cvar_Set","Cvar_SetCheatState","Cvar_SetLatched","Cvar_SetValue","Cvar_Update","Cvar_VariableIntegerValue","Cvar_VariableString","Cvar_VariableStringBuffer","Cvar_VariableValue","Cvar_WriteVariables","FS_ClearPakReferences","FS_ComparePaks","FS_ConditionalRestart","FS_FCloseFile","FS_FOpenFileByMode","FS_FOpenFileRead","FS_FOpenFileWrite","FS_FTell","FS_FileExists","FS_FileIsInPAK","FS_FilenameCompare","FS_Flush","FS_ForceFlush","FS_FreeFile","FS_FreeFileList","FS_GamePureChecksum","FS_GetFileList","FS_GetModList","FS_InitFilesystem","FS_Initialized","FS_ListFiles","FS_LoadStack","FS_LoadedPakChecksums","FS_LoadedPakNames","FS_LoadedPakPureChecksums","FS_Printf","FS_PureServerSetLoadedPaks","FS_PureServerSetReferencedPaks","FS_Read","FS_Read2","FS_ReadFile","FS_ReferencedPakChecksums","FS_ReferencedPakNames","FS_ReferencedPakPureChecksums","FS_Rename","FS_Restart","FS_SV_FOpenFileRead","FS_SV_FOpenFileWrite","FS_SV_Rename","FS_Seek","FS_Shutdown","FS_Write","FS_WriteFile","FS_filelength","FS_idPak","Field_Clear","Field_CompleteCommand","FreeWinding","Huff_Compress","Huff_Decompress","Huff_Init","Huff_Receive","Huff_addRef","Huff_getBit","Huff_offsetReceive","Huff_offsetTransmit","Huff_putBit","Huff_transmit","Hunk_AllocateTempMemory","Hunk_CheckMark","Hunk_Clear","Hunk_ClearTempMemory","Hunk_ClearToMark","Hunk_FreeTempMemory","Hunk_Log","Hunk_MemoryRemaining","Hunk_SetMark","Hunk_Trash","Info_Print","Key_WriteBindings","MSG_BeginReading","MSG_BeginReadingOOB","MSG_Bitstream","MSG_Clear","MSG_Copy","MSG_Init","MSG_InitOOB","MSG_ReadAngle16","MSG_ReadBigString","MSG_ReadBits","MSG_ReadByte","MSG_ReadChar","MSG_ReadData","MSG_ReadDeltaEntity","MSG_ReadDeltaPlayerstate","MSG_ReadDeltaUsercmd","MSG_ReadDeltaUsercmdKey","MSG_ReadFloat","MSG_ReadLong","MSG_ReadShort","MSG_ReadString","MSG_ReadStringLine","MSG_ReportChangeVectors_f","MSG_WriteAngle16","MSG_WriteBigString","MSG_WriteBits","MSG_WriteByte","MSG_WriteChar","MSG_WriteData","MSG_WriteDeltaEntity","MSG_WriteDeltaPlayerstate","MSG_WriteDeltaUsercmd","MSG_WriteDeltaUsercmdKey","MSG_WriteFloat","MSG_WriteLong","MSG_WriteShort","MSG_WriteString","NET_AdrToString","NET_CompareAdr","NET_CompareBaseAdr","NET_Config","NET_GetLoopPacket","NET_Init","NET_IsLocalAddress","NET_OutOfBandData","NET_OutOfBandPrint","NET_Restart","NET_SendPacket","NET_Shutdown","NET_Sleep","NET_StringToAdr","Netchan_Init","Netchan_Process","Netchan_Setup","Netchan_Transmit","Netchan_TransmitNextFragment","RemoveColinearPoints","ReverseWinding","SCR_DebugGraph","SV_Frame","SV_GameCommand","SV_Init","SV_PacketEvent","SV_Shutdown","S_ClearSoundBuffer","S_Malloc","S_MallocDebug","Sys_BeginProfiling","Sys_BeginStreamedFile","Sys_CheckCD","Sys_Cwd","Sys_DefaultCDPath","Sys_DefaultHomePath","Sys_DefaultInstallPath","Sys_DisplaySystemConsole","Sys_EndProfiling","Sys_EndStreamedFile","Sys_Error","Sys_FreeFileList","Sys_GetBotLibAPI","Sys_GetCGameAPI","Sys_GetClipboardData","Sys_GetCurrentUser","Sys_GetEvent","Sys_GetGameAPI","Sys_GetProcessorId","Sys_GetUIAPI","Sys_Init","Sys_IsLANAddress","Sys_ListFiles","Sys_LoadDll","Sys_LowPhysicalMemory","Sys_Milliseconds","Sys_Mkdir","Sys_MonkeyShouldBeSpanked","Sys_Print","Sys_ProcessorCount","Sys_Quit","Sys_SendPacket","Sys_SetDefaultCDPath","Sys_SetDefaultHomePath","Sys_SetDefaultInstallPath","Sys_SetErrorText","Sys_ShowConsole","Sys_ShowIP","Sys_SnapVector","Sys_StreamSeek","Sys_StreamedRead","Sys_StringToAdr","Sys_UnloadBotLib","Sys_UnloadCGame","Sys_UnloadDll","Sys_UnloadGame","Sys_UnloadUI","UI_GameCommand","UI_usesUniqueCDKey","VM_ArgPtr","VM_Call","VM_Clear","VM_Create","VM_Debug","VM_ExplicitArgPtr","VM_Free","VM_Init","VM_Restart","WindingArea","WindingBounds","WindingCenter","WindingOnPlaneSide","WindingPlane","Z_AvailableMemory","Z_Free","Z_FreeTags","Z_LogHeap","Z_Malloc","Z_MallocDebug","Z_TagMalloc","Z_TagMallocDebug","pw","unzClose","unzCloseCurrentFile","unzGetCurrentFileInfo","unzGetCurrentFileInfoPosition","unzGetGlobalComment","unzGetGlobalInfo","unzGetLocalExtrafield","unzGoToFirstFile","unzGoToNextFile","unzLocateFile","unzOpen","unzOpenCurrentFile","unzReOpen","unzReadCurrentFile","unzSetCurrentFileInfoPosition","unzStringFileNameCompare","unzeof","unztell"] end function
function globalNames() return ["c_patch_traces","c_pointcontents","cl_cdkey","cl_paused","clientHuffTables","cm","cm_noAreas","cm_noCurves","cm_playerCurveClip","com_blood","com_buildScript","com_cameraMode","com_cl_running","com_dedicated","com_developer","com_errorEntered","com_frameMsec","com_frameTime","com_journal","com_journalDataFile","com_journalFile","com_speeds","com_sv_running","com_timescale","com_version","com_viewlog","cvar_modifiedFlags","demo_protocols","sv_paused","time_backend","time_frontend","time_game"] end function
function fieldNames() return ["cArea_t.floodnum","cArea_t.floodvalid","cGrid_t.points","cGrid_t.height","cGrid_t.width","cGrid_t.wrapHeight","cGrid_t.wrapWidth","cLeaf_t.area","cLeaf_t.cluster","cLeaf_t.firstLeafBrush","cLeaf_t.firstLeafSurface","cLeaf_t.numLeafBrushes","cLeaf_t.numLeafSurfaces","cNode_t.children","cNode_t.plane","cPatch_t.checkcount","cPatch_t.contents","cPatch_t.pc","cPatch_t.surfaceFlags","cbrush_t.bounds","cbrush_t.checkcount","cbrush_t.contents","cbrush_t.numsides","cbrush_t.shaderNum","cbrush_t.sides","cbrushside_t.plane","cbrushside_t.shaderNum","cbrushside_t.surfaceFlags","clipMap_t.name","clipMap_t.areaPortals","clipMap_t.areas","clipMap_t.brushes","clipMap_t.brushsides","clipMap_t.checkcount","clipMap_t.clusterBytes","clipMap_t.cmodels","clipMap_t.entityString","clipMap_t.floodvalid","clipMap_t.leafbrushes","clipMap_t.leafs","clipMap_t.leafsurfaces","clipMap_t.nodes","clipMap_t.numAreas","clipMap_t.numBrushSides","clipMap_t.numBrushes","clipMap_t.numClusters","clipMap_t.numEntityChars","clipMap_t.numLeafBrushes","clipMap_t.numLeafSurfaces","clipMap_t.numLeafs","clipMap_t.numNodes","clipMap_t.numPlanes","clipMap_t.numShaders","clipMap_t.numSubModels","clipMap_t.numSurfaces","clipMap_t.planes","clipMap_t.shaders","clipMap_t.surfaces","clipMap_t.vised","clipMap_t.visibility","cmodel_t.leaf","cmodel_t.maxs","cmodel_t.mins","facet_t.borderInward","facet_t.borderNoAdjust","facet_t.borderPlanes","facet_t.numBorders","facet_t.surfacePlane","field_t.buffer","field_t.cursor","field_t.scroll","field_t.widthInChars","file_in_zip_read_info_s.byte_before_the_zipfile","file_in_zip_read_info_s.compression_method","file_in_zip_read_info_s.crc32","file_in_zip_read_info_s.crc32_wait","file_in_zip_read_info_s.file","file_in_zip_read_info_s.offset_local_extrafield","file_in_zip_read_info_s.pos_in_zipfile","file_in_zip_read_info_s.pos_local_extrafield","file_in_zip_read_info_s.read_buffer","file_in_zip_read_info_s.rest_read_compressed","file_in_zip_read_info_s.rest_read_uncompressed","file_in_zip_read_info_s.size_local_extrafield","file_in_zip_read_info_s.stream","file_in_zip_read_info_s.stream_initialised","huff_t.loc","huff_t.blocNode","huff_t.blocPtrs","huff_t.freelist","huff_t.lhead","huff_t.ltail","huff_t.nodeList","huff_t.nodePtrs","huff_t.tree","huffman_t.compressor","huffman_t.decompressor","leafList_t.bounds","leafList_t.count","leafList_t.lastLeaf","leafList_t.list","leafList_t.maxcount","leafList_t.overflowed","leafList_t.storeLeafs","msg_t.allowoverflow","msg_t.bit","msg_t.cursize","msg_t.data","msg_t.maxsize","msg_t.oob","msg_t.overflowed","msg_t.readcount","netadr_t.ip","netadr_t.ipx","netadr_t.port","netadr_t.type","netchan_t.fragmentBuffer","netchan_t.unsentBuffer","netchan_t.dropped","netchan_t.fragmentLength","netchan_t.fragmentSequence","netchan_t.incomingSequence","netchan_t.outgoingSequence","netchan_t.qport","netchan_t.remoteAddress","netchan_t.sock","netchan_t.unsentFragmentStart","netchan_t.unsentFragments","netchan_t.unsentLength","node_t.head","node_t.left","node_t.next","node_t.parent","node_t.prev","node_t.right","node_t.symbol","node_t.weight","patchCollide_t.bounds","patchCollide_t.facets","patchCollide_t.numFacets","patchCollide_t.numPlanes","patchCollide_t.planes","patchPlane_t.plane","patchPlane_t.signbits","sphere_t.halfheight","sphere_t.offset","sphere_t.radius","sphere_t.use","sysEvent_t.evPtr","sysEvent_t.evPtrLength","sysEvent_t.evTime","sysEvent_t.evType","sysEvent_t.evValue","sysEvent_t.evValue2","tm_unz.tm_hour","tm_unz.tm_mday","tm_unz.tm_min","tm_unz.tm_mon","tm_unz.tm_sec","tm_unz.tm_year","traceWork_t.bounds","traceWork_t.contents","traceWork_t.end","traceWork_t.extents","traceWork_t.isPoint","traceWork_t.maxOffset","traceWork_t.modelOrigin","traceWork_t.offsets","traceWork_t.size","traceWork_t.sphere","traceWork_t.start","traceWork_t.trace","unzFile__.unused","unz_file_info.compressed_size","unz_file_info.compression_method","unz_file_info.crc","unz_file_info.disk_num_start","unz_file_info.dosDate","unz_file_info.external_fa","unz_file_info.flag","unz_file_info.internal_fa","unz_file_info.size_file_comment","unz_file_info.size_file_extra","unz_file_info.size_filename","unz_file_info.tmu_date","unz_file_info.uncompressed_size","unz_file_info.version","unz_file_info.version_needed","unz_file_info_internal.offset_curfile","unz_global_info.number_entry","unz_global_info.size_comment","unz_s.byte_before_the_zipfile","unz_s.central_pos","unz_s.cur_file_info","unz_s.cur_file_info_internal","unz_s.current_file_ok","unz_s.file","unz_s.gi","unz_s.num_file","unz_s.offset_central_dir","unz_s.pfile_in_zip_read","unz_s.pos_in_central_dir","unz_s.size_central_dir","unz_s.tmpFile","unz_s.tmpPos","unz_s.tmpSize","winding_t.numpoints","winding_t.p","z_stream.adler","z_stream.avail_in","z_stream.avail_out","z_stream.data_type","z_stream.msg","z_stream.next_in","z_stream.next_out","z_stream.opaque","z_stream.reserved","z_stream.state","z_stream.total_in","z_stream.total_out","z_stream.zalloc","z_stream.zfree"] end function
function validInlineModel(index,count) return index>=0 and index<count and index<MAX_SUBMODELS end function
function reliableSlot(sequence) return sequence & PACKET_MASK end function
function validMessageSize(size) return size>=0 and size<=MAX_MSGLEN end function
function validDownloadBlock(size) return size>=0 and size<=MAX_DOWNLOAD_BLKSIZE end function
function validUnzipResult(code) return code==UNZ_OK or code==UNZ_END_OF_LIST_OF_FILE or code<=UNZ_PARAMERROR end function
function headerCounts() return [75,46,45,344,32,222] end function
