// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Canonical declaration and ABI facade for the six QCommon headers.
package mq3.qcommon.headers

/// Maximum number of inline collision models accepted from a BSP map.
const MAX_SUBMODELS=256
/// Reserved collision-model handle for a temporary axis-aligned box.
const BOX_MODEL_HANDLE=255
/// Reserved collision-model handle for a temporary capsule.
const CAPSULE_MODEL_HANDLE=254
/// Distance tolerance used when clipping against patch facets.
const SURFACE_CLIP_EPSILON=0.125
/// Maximum number of convex collision facets generated for one patch.
const MAX_FACETS=1024
/// Maximum number of collision planes retained for one patch.
const MAX_PATCH_PLANES=2048
/// Maximum control-grid dimension used while subdividing a collision patch.
const MAX_GRID_SIZE=129
/// Maximum patch-curvature deviation accepted before further subdivision.
const SUBDIVIDE_DISTANCE=16
/// Tolerance used when validating a plane against triangle vertices.
const PLANE_TRI_EPSILON=0.1
/// Tolerance for recognizing matching endpoints of a wrapping patch grid.
const WRAP_POINT_EPSILON=0.1
/// Maximum number of vertices in a clipped winding polygon.
const MAX_POINTS_ON_WINDING=64
/// Plane-classification result for geometry in front of the plane.
const SIDE_FRONT=0
/// Plane-classification result for geometry behind the plane.
const SIDE_BACK=1
/// Plane-classification result for geometry within the plane tolerance.
const SIDE_ON=2
/// Plane-classification result for geometry crossing the plane.
const SIDE_CROSS=3
/// Distance tolerance used when clipping a trace against a plane.
const CLIP_EPSILON=0.1
/// Largest accepted absolute coordinate in a collision winding.
const MAX_MAP_BOUNDS=65535
/// Distance tolerance for classifying a point as lying on a plane.
const ON_EPSILON=0.1

/// Number of old messages that must be kept on client and.
const PACKET_BACKUP=32
/// Mask converting a network sequence number into a circular packet-history slot.
const PACKET_MASK=31
/// Max number of usercmd_t in a packet.
const MAX_PACKET_USERCMDS=32
/// Socket-port selector asking the host to choose an available port.
const PORT_ANY=-1
/// Capacity of the reliable-command ring retained until acknowledgment.
const MAX_RELIABLE_COMMANDS=64
/// Maximum byte length of a complete sequenced network message.
const MAX_MSGLEN=16384
/// Max of eight download frames.
const MAX_DOWNLOAD_WINDOW=8
/// 2048 byte block chunks.
const MAX_DOWNLOAD_BLKSIZE=2048
/// Protocol version placed in Quake III connection and discovery messages.
const PROTOCOL_VERSION=68
/// Host name of the legacy game-update service.
const UPDATE_SERVER_NAME="update.quake3arena.com"
/// Host name of the master-server directory service.
const MASTER_SERVER_NAME="master.quake3arena.com"
/// Host name of the legacy client-authorization service.
const AUTHORIZE_SERVER_NAME="authorize.quake3arena.com"
/// Default UDP port used by the master-server directory.
const PORT_MASTER=27950
/// Default UDP port used by the update service.
const PORT_UPDATE=27951
/// Default UDP port used by the authorization service.
const PORT_AUTHORIZE=27952
/// Default UDP port used by a Quake III game server.
const PORT_SERVER=27960
/// Broadcast scan this many ports after.
const NUM_SERVER_PORTS=4
/// Package-reference bit recording ordinary asset use.
const FS_GENERAL_REF=1
/// Package-reference bit recording use by the UI VM.
const FS_UI_REF=2
/// Package-reference bit recording use by the client-game VM.
const FS_CGAME_REF=4
/// Package-reference bit recording use by the server game VM.
const FS_QAGAME_REF=8
/// Number of original game packages recognized by the filesystem policy.
const NUM_ID_PAKS=9
/// Maximum number of simultaneous virtual-filesystem file handles.
const MAX_FILE_HANDLES=64
/// Name of the base-game asset directory searched by the filesystem.
const BASEGAME="baseq3"
/// Capacity of the editable console input line.
const MAX_EDIT_LINE=256
/// Any unrecognized processor.
const CPUID_GENERIC=0
/// Legacy CPU classification for the Alpha AXP architecture.
const CPUID_AXP=16
/// Legacy CPU classification for an unsupported Intel instruction set.
const CPUID_INTEL_UNSUPPORTED=32
/// Intel Pentium or PPro.
const CPUID_INTEL_PENTIUM=33
/// Intel Pentium/MMX or P2/MMX.
const CPUID_INTEL_MMX=34
/// Legacy CPU classification for Intel processors with Katmai-era extensions.
const CPUID_INTEL_KATMAI=35
/// AMD K6 3DNOW!
const CPUID_AMD_3DNOW=48
/// Maximum character capacity of a formatted engine diagnostic message.
const MAXPRINTMSG=4096
/// Number of byte values in the Huffman symbol alphabet.
const HMAX=256
/// NYT = Not Yet Transmitted.
const NYT=256
/// Huffman symbol code reserved for an internal tree node.
const INTERNAL_NODE=257
/// Byte offset at which server-to-client payload obfuscation begins.
const SV_ENCODE_START=4
/// Byte offset at which client-to-server payload decoding begins.
const SV_DECODE_START=12
/// Byte offset at which client-to-server payload obfuscation begins.
const CL_ENCODE_START=12
/// Byte offset at which server-to-client payload decoding begins.
const CL_DECODE_START=4

/// Network-address kind reserved for an in-process bot client.
const NA_BOT=0
/// Network-address kind indicating an invalid or unsupported endpoint.
const NA_BAD=1
/// Network-address kind for local loopback delivery.
const NA_LOOPBACK=2
/// Network-address kind for an IPv4 broadcast destination.
const NA_BROADCAST=3
/// Network-address kind for an IPv4 endpoint.
const NA_IP=4
/// Legacy network-address kind for an IPX endpoint.
const NA_IPX=5
/// Legacy network-address kind for IPX broadcast delivery.
const NA_BROADCAST_IPX=6
/// Network socket-side selector for the client endpoint.
const NS_CLIENT=0
/// Network socket-side selector for the server endpoint.
const NS_SERVER=1
/// VM execution-mode identifier for a native game module.
const VMI_NATIVE=0
/// VM execution-mode identifier for interpreted bytecode.
const VMI_BYTECODE=1
/// VM execution-mode identifier for compiled bytecode.
const VMI_COMPILED=2
/// Game-VM trap identifier for memset.
const TRAP_MEMSET=100
/// Game-VM trap identifier for memcpy.
const TRAP_MEMCPY=101
/// Game-VM trap identifier for strncpy.
const TRAP_STRNCPY=102
/// Game-VM trap identifier for sin.
const TRAP_SIN=103
/// Game-VM trap identifier for cos.
const TRAP_COS=104
/// Game-VM trap identifier for atan2.
const TRAP_ATAN2=105
/// Game-VM trap identifier for sqrt.
const TRAP_SQRT=106
/// Game-VM trap identifier for matrixmultiply.
const TRAP_MATRIXMULTIPLY=107
/// Game-VM trap identifier for anglevectors.
const TRAP_ANGLEVECTORS=108
/// Game-VM trap identifier for perpendicularvector.
const TRAP_PERPENDICULARVECTOR=109
/// Game-VM trap identifier for floor.
const TRAP_FLOOR=110
/// Game-VM trap identifier for ceil.
const TRAP_CEIL=111
/// Game-VM trap identifier for testprintint.
const TRAP_TESTPRINTINT=112
/// Game-VM trap identifier for testprintfloat.
const TRAP_TESTPRINTFLOAT=113
/// Memory-tag value marking an unused allocation block.
const TAG_FREE=0
/// Memory-tag value for ordinary engine allocations.
const TAG_GENERAL=1
/// Memory-tag value for bot-library allocations.
const TAG_BOTLIB=2
/// Memory-tag value for renderer allocations.
const TAG_RENDERER=3
/// Memory-tag value for allocations in the small-block zone.
const TAG_SMALL=4
/// Memory-tag value for static data that must not be freed normally.
const TAG_STATIC=5
/// Vector-component index used for side movement input.
const AXIS_SIDE=0
/// Vector-component index used for forward movement input.
const AXIS_FORWARD=1
/// Vector-component index used for vertical movement input.
const AXIS_UP=2
/// Angle-component index used for roll.
const AXIS_ROLL=3
/// Angle-component index used for yaw.
const AXIS_YAW=4
/// Angle-component index used for pitch.
const AXIS_PITCH=5
/// Number of supported joystick axes in system input events.
const MAX_JOYSTICK_AXIS=6
/// System-event type identifying no pending system event.
const SE_NONE=0
/// System-event type identifying a key press or release.
const SE_KEY=1
/// System-event type identifying a typed character.
const SE_CHAR=2
/// System-event type identifying relative mouse motion.
const SE_MOUSE=3
/// System-event type identifying a joystick-axis update.
const SE_JOYSTICK_AXIS=4
/// System-event type identifying console command input.
const SE_CONSOLE=5
/// System-event type identifying an incoming network packet.
const SE_PACKET=6

/// ZIP-reader result indicating success.
const UNZ_OK=0
/// ZIP-reader result indicating that the central-directory enumeration is exhausted.
const UNZ_END_OF_LIST_OF_FILE=-100
/// ZIP-reader error caused by an underlying file operation.
const UNZ_ERRNO=-1
/// ZIP-reader result indicating end of the current entry.
const UNZ_EOF=0
/// ZIP-reader error indicating invalid input parameters.
const UNZ_PARAMERROR=-102
/// ZIP-reader error indicating malformed or unsupported ZIP data.
const UNZ_BADZIPFILE=-103
/// ZIP-reader error indicating an internal decoding failure.
const UNZ_INTERNALERROR=-104
/// ZIP-reader error indicating a mismatch in the entry CRC-32 checksum.
const UNZ_CRCERROR=-105
/// ZIP filename-comparison selector requiring matching letter case.
const UNZ_CASESENSITIVE=1
/// ZIP filename-comparison selector ignoring letter case.
const UNZ_NOTCASESENSITIVE=2
/// ZIP filename-comparison selector using the platform default case policy.
const UNZ_OSDEFAULTCASE=0

/// List the 4 names in qcommon.headers.cmlocalMacroNames, beginning with `BOX_MODEL_HANDLE`, `CAPSULE_MODEL_HANDLE`, `MAX_SUBMODELS`, `SURFACE_CLIP_EPSILON`.
function cmlocalMacroNames() return ["BOX_MODEL_HANDLE","CAPSULE_MODEL_HANDLE","MAX_SUBMODELS","SURFACE_CLIP_EPSILON"] end function
/// List the 11 names in qcommon.headers.cmlocalTypeNames, beginning with `cArea_t`, `cLeaf_t`, `cNode_t`, `cPatch_t`.
function cmlocalTypeNames() return ["cArea_t","cLeaf_t","cNode_t","cPatch_t","cbrush_t","cbrushside_t","clipMap_t","cmodel_t","leafList_t","sphere_t","traceWork_t"] end function
/// List the 9 names in qcommon.headers.cmlocalFunctionNames, beginning with `CM_BoxBrushes`, `CM_BoxLeafnums_r`, `CM_ClearLevelPatches`, `CM_ClipHandleToModel`.
function cmlocalFunctionNames() return ["CM_BoxBrushes","CM_BoxLeafnums_r","CM_ClearLevelPatches","CM_ClipHandleToModel","CM_GeneratePatchCollide","CM_PositionTestInPatchCollide","CM_StoreBrushes","CM_StoreLeafs","CM_TraceThroughPatchCollide"] end function
/// List the 6 names in qcommon.headers.cmlocalGlobalNames, beginning with `c_patch_traces`, `c_pointcontents`, `cm`, `cm_noAreas`.
function cmlocalGlobalNames() return ["c_patch_traces","c_pointcontents","cm","cm_noAreas","cm_noCurves","cm_playerCurveClip"] end function
/// List the 81 names in qcommon.headers.cmlocalFieldNames, beginning with `cArea_t.floodnum`, `cArea_t.floodvalid`, `cLeaf_t.area`, `cLeaf_t.cluster`.
function cmlocalFieldNames() return ["cArea_t.floodnum","cArea_t.floodvalid","cLeaf_t.area","cLeaf_t.cluster","cLeaf_t.firstLeafBrush","cLeaf_t.firstLeafSurface","cLeaf_t.numLeafBrushes","cLeaf_t.numLeafSurfaces","cNode_t.children","cNode_t.plane","cPatch_t.checkcount","cPatch_t.contents","cPatch_t.pc","cPatch_t.surfaceFlags","cbrush_t.bounds","cbrush_t.checkcount","cbrush_t.contents","cbrush_t.numsides","cbrush_t.shaderNum","cbrush_t.sides","cbrushside_t.plane","cbrushside_t.shaderNum","cbrushside_t.surfaceFlags","clipMap_t.name","clipMap_t.areaPortals","clipMap_t.areas","clipMap_t.brushes","clipMap_t.brushsides","clipMap_t.checkcount","clipMap_t.clusterBytes","clipMap_t.cmodels","clipMap_t.entityString","clipMap_t.floodvalid","clipMap_t.leafbrushes","clipMap_t.leafs","clipMap_t.leafsurfaces","clipMap_t.nodes","clipMap_t.numAreas","clipMap_t.numBrushSides","clipMap_t.numBrushes","clipMap_t.numClusters","clipMap_t.numEntityChars","clipMap_t.numLeafBrushes","clipMap_t.numLeafSurfaces","clipMap_t.numLeafs","clipMap_t.numNodes","clipMap_t.numPlanes","clipMap_t.numShaders","clipMap_t.numSubModels","clipMap_t.numSurfaces","clipMap_t.planes","clipMap_t.shaders","clipMap_t.surfaces","clipMap_t.vised","clipMap_t.visibility","cmodel_t.leaf","cmodel_t.maxs","cmodel_t.mins","leafList_t.bounds","leafList_t.count","leafList_t.lastLeaf","leafList_t.list","leafList_t.maxcount","leafList_t.overflowed","leafList_t.storeLeafs","sphere_t.halfheight","sphere_t.offset","sphere_t.radius","sphere_t.use","traceWork_t.bounds","traceWork_t.contents","traceWork_t.end","traceWork_t.extents","traceWork_t.isPoint","traceWork_t.maxOffset","traceWork_t.modelOrigin","traceWork_t.offsets","traceWork_t.size","traceWork_t.sphere","traceWork_t.start","traceWork_t.trace"] end function

/// List the 6 names in qcommon.headers.cmpatchMacroNames, beginning with `MAX_FACETS`, `MAX_GRID_SIZE`, `MAX_PATCH_PLANES`, `PLANE_TRI_EPSILON`.
function cmpatchMacroNames() return ["MAX_FACETS","MAX_GRID_SIZE","MAX_PATCH_PLANES","PLANE_TRI_EPSILON","SUBDIVIDE_DISTANCE","WRAP_POINT_EPSILON"] end function
/// List the 4 names in qcommon.headers.cmpatchTypeNames, beginning with `cGrid_t`, `facet_t`, `patchCollide_t`, `patchPlane_t`.
function cmpatchTypeNames() return ["cGrid_t","facet_t","patchCollide_t","patchPlane_t"] end function
/// List the 1 names in qcommon.headers.cmpatchFunctionNames, beginning with `CM_GeneratePatchCollide`.
function cmpatchFunctionNames() return ["CM_GeneratePatchCollide"] end function
/// List the 0 names in qcommon.headers.cmpatchGlobalNames.
function cmpatchGlobalNames() return [] end function
/// List the 17 names in qcommon.headers.cmpatchFieldNames, beginning with `cGrid_t.points`, `cGrid_t.height`, `cGrid_t.width`, `cGrid_t.wrapHeight`.
function cmpatchFieldNames() return ["cGrid_t.points","cGrid_t.height","cGrid_t.width","cGrid_t.wrapHeight","cGrid_t.wrapWidth","facet_t.borderInward","facet_t.borderNoAdjust","facet_t.borderPlanes","facet_t.numBorders","facet_t.surfacePlane","patchCollide_t.bounds","patchCollide_t.facets","patchCollide_t.numFacets","patchCollide_t.numPlanes","patchCollide_t.planes","patchPlane_t.plane","patchPlane_t.signbits"] end function

/// List the 8 names in qcommon.headers.cmpolylibMacroNames, beginning with `CLIP_EPSILON`, `MAX_MAP_BOUNDS`, `MAX_POINTS_ON_WINDING`, `ON_EPSILON`.
function cmpolylibMacroNames() return ["CLIP_EPSILON","MAX_MAP_BOUNDS","MAX_POINTS_ON_WINDING","ON_EPSILON","SIDE_BACK","SIDE_CROSS","SIDE_FRONT","SIDE_ON"] end function
/// List the 1 names in qcommon.headers.cmpolylibTypeNames, beginning with `winding_t`.
function cmpolylibTypeNames() return ["winding_t"] end function
/// List the 17 names in qcommon.headers.cmpolylibFunctionNames, beginning with `AddWindingToConvexHull`, `AllocWinding`, `BaseWindingForPlane`, `CheckWinding`.
function cmpolylibFunctionNames() return ["AddWindingToConvexHull","AllocWinding","BaseWindingForPlane","CheckWinding","ChopWinding","ChopWindingInPlace","ClipWindingEpsilon","CopyWinding","FreeWinding","RemoveColinearPoints","ReverseWinding","WindingArea","WindingBounds","WindingCenter","WindingOnPlaneSide","WindingPlane","pw"] end function
/// List the 0 names in qcommon.headers.cmpolylibGlobalNames.
function cmpolylibGlobalNames() return [] end function
/// List the 2 names in qcommon.headers.cmpolylibFieldNames, beginning with `winding_t.numpoints`, `winding_t.p`.
function cmpolylibFieldNames() return ["winding_t.numpoints","winding_t.p"] end function

/// List the 0 names in qcommon.headers.cmpublicMacroNames.
function cmpublicMacroNames() return [] end function
/// List the 0 names in qcommon.headers.cmpublicTypeNames.
function cmpublicTypeNames() return [] end function
/// List the 23 names in qcommon.headers.cmpublicFunctionNames, beginning with `CM_AdjustAreaPortalState`, `CM_AreasConnected`, `CM_BoxLeafnums`, `CM_BoxTrace`.
function cmpublicFunctionNames() return ["CM_AdjustAreaPortalState","CM_AreasConnected","CM_BoxLeafnums","CM_BoxTrace","CM_ClearMap","CM_ClusterPVS","CM_DrawDebugSurface","CM_EntityString","CM_InlineModel","CM_LeafArea","CM_LeafCluster","CM_LerpTag","CM_LoadMap","CM_MarkFragments","CM_ModelBounds","CM_NumClusters","CM_NumInlineModels","CM_PointContents","CM_PointLeafnum","CM_TempBoxModel","CM_TransformedBoxTrace","CM_TransformedPointContents","CM_WriteAreaBits"] end function
/// List the 0 names in qcommon.headers.cmpublicGlobalNames.
function cmpublicGlobalNames() return [] end function
/// List the 0 names in qcommon.headers.cmpublicFieldNames.
function cmpublicFieldNames() return [] end function

/// List the 46 names in qcommon.headers.qcommonMacroNames, beginning with `AUTHORIZE_SERVER_NAME`, `BASEGAME`, `CL_DECODE_START`, `CL_ENCODE_START`.
function qcommonMacroNames() return ["AUTHORIZE_SERVER_NAME","BASEGAME","CL_DECODE_START","CL_ENCODE_START","CPUID_AMD_3DNOW","CPUID_AXP","CPUID_GENERIC","CPUID_INTEL_KATMAI","CPUID_INTEL_MMX","CPUID_INTEL_PENTIUM","CPUID_INTEL_UNSUPPORTED","FS_CGAME_REF","FS_GENERAL_REF","FS_QAGAME_REF","FS_UI_REF","HMAX","INTERNAL_NODE","MASTER_SERVER_NAME","MAXPRINTMSG","MAX_DOWNLOAD_BLKSIZE","MAX_DOWNLOAD_WINDOW","MAX_EDIT_LINE","MAX_FILE_HANDLES","MAX_MSGLEN","MAX_PACKET_USERCMDS","MAX_RELIABLE_COMMANDS","NUM_ID_PAKS","NUM_SERVER_PORTS","NYT","PACKET_BACKUP","PACKET_MASK","PORT_ANY","PORT_AUTHORIZE","PORT_MASTER","PORT_SERVER","PORT_UPDATE","PROTOCOL_VERSION","Q_vsnprintf","SV_DECODE_START","SV_ENCODE_START","S_Malloc","UPDATE_SERVER_NAME","ZONE_DEBUG","Z_Malloc","Z_TagMalloc","_QCOMMON_H_"] end function
/// List the 17 names in qcommon.headers.qcommonTypeNames, beginning with `field_t`, `huff_t`, `huffman_t`, `joystickAxis_t`.
function qcommonTypeNames() return ["field_t","huff_t","huffman_t","joystickAxis_t","memtag_t","msg_t","netadr_t","netadrtype_t","netchan_t","netsrc_t","node_t","sharedTraps_t","sysEventType_t","sysEvent_t","vmInterpret_t","vm_t","xcommand_t"] end function
/// List the 46 names in qcommon.headers.qcommonEnumNames, beginning with `NA_BOT`, `NA_BAD`, `NA_LOOPBACK`, `NA_BROADCAST`.
function qcommonEnumNames() return ["NA_BOT","NA_BAD","NA_LOOPBACK","NA_BROADCAST","NA_IP","NA_IPX","NA_BROADCAST_IPX","NS_CLIENT","NS_SERVER","VMI_NATIVE","VMI_BYTECODE","VMI_COMPILED","TRAP_MEMSET","TRAP_MEMCPY","TRAP_STRNCPY","TRAP_SIN","TRAP_COS","TRAP_ATAN2","TRAP_SQRT","TRAP_MATRIXMULTIPLY","TRAP_ANGLEVECTORS","TRAP_PERPENDICULARVECTOR","TRAP_FLOOR","TRAP_CEIL","TRAP_TESTPRINTINT","TRAP_TESTPRINTFLOAT","TAG_FREE","TAG_GENERAL","TAG_BOTLIB","TAG_RENDERER","TAG_SMALL","TAG_STATIC","AXIS_SIDE","AXIS_FORWARD","AXIS_UP","AXIS_ROLL","AXIS_YAW","AXIS_PITCH","MAX_JOYSTICK_AXIS","SE_NONE","SE_KEY","SE_CHAR","SE_MOUSE","SE_JOYSTICK_AXIS","SE_CONSOLE","SE_PACKET"] end function
/// List the 276 names in qcommon.headers.qcommonFunctionNames, beginning with `CL_CDDialog`, `CL_CharEvent`, `CL_ConsolePrint`, `CL_Disconnect`.
function qcommonFunctionNames() return ["CL_CDDialog","CL_CharEvent","CL_ConsolePrint","CL_Disconnect","CL_FlushMemory","CL_ForwardCommandToServer","CL_Frame","CL_GameCommand","CL_Init","CL_InitKeyCommands","CL_JoystickEvent","CL_KeyEvent","CL_MapLoading","CL_MouseEvent","CL_PacketEvent","CL_Shutdown","CL_ShutdownAll","CL_StartHunkUsers","Cbuf_AddText","Cbuf_Execute","Cbuf_ExecuteText","Cbuf_Init","Cmd_AddCommand","Cmd_Argc","Cmd_Args","Cmd_ArgsBuffer","Cmd_ArgsFrom","Cmd_Argv","Cmd_ArgvBuffer","Cmd_Cmd","Cmd_CommandCompletion","Cmd_ExecuteString","Cmd_Init","Cmd_RemoveCommand","Cmd_TokenizeString","Com_BeginRedirect","Com_BlockChecksum","Com_BlockChecksumKey","Com_DPrintf","Com_EndRedirect","Com_Error","Com_EventLoop","Com_Filter","Com_FilterPath","Com_Frame","Com_HashKey","Com_Init","Com_Milliseconds","Com_Printf","Com_Quit_f","Com_RealTime","Com_SafeMode","Com_Shutdown","Com_StartupVariable","Com_TouchMemory","CopyString","Cvar_Command","Cvar_CommandCompletion","Cvar_Get","Cvar_InfoString","Cvar_InfoStringBuffer","Cvar_InfoString_Big","Cvar_Init","Cvar_Register","Cvar_Reset","Cvar_Restart_f","Cvar_Set","Cvar_SetCheatState","Cvar_SetLatched","Cvar_SetValue","Cvar_Update","Cvar_VariableIntegerValue","Cvar_VariableString","Cvar_VariableStringBuffer","Cvar_VariableValue","Cvar_WriteVariables","FS_ClearPakReferences","FS_ComparePaks","FS_ConditionalRestart","FS_FCloseFile","FS_FOpenFileByMode","FS_FOpenFileRead","FS_FOpenFileWrite","FS_FTell","FS_FileExists","FS_FileIsInPAK","FS_FilenameCompare","FS_Flush","FS_ForceFlush","FS_FreeFile","FS_FreeFileList","FS_GamePureChecksum","FS_GetFileList","FS_GetModList","FS_InitFilesystem","FS_Initialized","FS_ListFiles","FS_LoadStack","FS_LoadedPakChecksums","FS_LoadedPakNames","FS_LoadedPakPureChecksums","FS_Printf","FS_PureServerSetLoadedPaks","FS_PureServerSetReferencedPaks","FS_Read","FS_Read2","FS_ReadFile","FS_ReferencedPakChecksums","FS_ReferencedPakNames","FS_ReferencedPakPureChecksums","FS_Rename","FS_Restart","FS_SV_FOpenFileRead","FS_SV_FOpenFileWrite","FS_SV_Rename","FS_Seek","FS_Shutdown","FS_Write","FS_WriteFile","FS_filelength","FS_idPak","Field_Clear","Field_CompleteCommand","Huff_Compress","Huff_Decompress","Huff_Init","Huff_Receive","Huff_addRef","Huff_getBit","Huff_offsetReceive","Huff_offsetTransmit","Huff_putBit","Huff_transmit","Hunk_AllocateTempMemory","Hunk_CheckMark","Hunk_Clear","Hunk_ClearTempMemory","Hunk_ClearToMark","Hunk_FreeTempMemory","Hunk_Log","Hunk_MemoryRemaining","Hunk_SetMark","Hunk_Trash","Info_Print","Key_WriteBindings","MSG_BeginReading","MSG_BeginReadingOOB","MSG_Bitstream","MSG_Clear","MSG_Copy","MSG_Init","MSG_InitOOB","MSG_ReadAngle16","MSG_ReadBigString","MSG_ReadBits","MSG_ReadByte","MSG_ReadChar","MSG_ReadData","MSG_ReadDeltaEntity","MSG_ReadDeltaPlayerstate","MSG_ReadDeltaUsercmd","MSG_ReadDeltaUsercmdKey","MSG_ReadFloat","MSG_ReadLong","MSG_ReadShort","MSG_ReadString","MSG_ReadStringLine","MSG_ReportChangeVectors_f","MSG_WriteAngle16","MSG_WriteBigString","MSG_WriteBits","MSG_WriteByte","MSG_WriteChar","MSG_WriteData","MSG_WriteDeltaEntity","MSG_WriteDeltaPlayerstate","MSG_WriteDeltaUsercmd","MSG_WriteDeltaUsercmdKey","MSG_WriteFloat","MSG_WriteLong","MSG_WriteShort","MSG_WriteString","NET_AdrToString","NET_CompareAdr","NET_CompareBaseAdr","NET_Config","NET_GetLoopPacket","NET_Init","NET_IsLocalAddress","NET_OutOfBandData","NET_OutOfBandPrint","NET_Restart","NET_SendPacket","NET_Shutdown","NET_Sleep","NET_StringToAdr","Netchan_Init","Netchan_Process","Netchan_Setup","Netchan_Transmit","Netchan_TransmitNextFragment","SCR_DebugGraph","SV_Frame","SV_GameCommand","SV_Init","SV_PacketEvent","SV_Shutdown","S_ClearSoundBuffer","S_Malloc","S_MallocDebug","Sys_BeginProfiling","Sys_BeginStreamedFile","Sys_CheckCD","Sys_Cwd","Sys_DefaultCDPath","Sys_DefaultHomePath","Sys_DefaultInstallPath","Sys_DisplaySystemConsole","Sys_EndProfiling","Sys_EndStreamedFile","Sys_Error","Sys_FreeFileList","Sys_GetBotLibAPI","Sys_GetCGameAPI","Sys_GetClipboardData","Sys_GetCurrentUser","Sys_GetEvent","Sys_GetGameAPI","Sys_GetProcessorId","Sys_GetUIAPI","Sys_Init","Sys_IsLANAddress","Sys_ListFiles","Sys_LoadDll","Sys_LowPhysicalMemory","Sys_Milliseconds","Sys_Mkdir","Sys_MonkeyShouldBeSpanked","Sys_Print","Sys_ProcessorCount","Sys_Quit","Sys_SendPacket","Sys_SetDefaultCDPath","Sys_SetDefaultHomePath","Sys_SetDefaultInstallPath","Sys_SetErrorText","Sys_ShowConsole","Sys_ShowIP","Sys_SnapVector","Sys_StreamSeek","Sys_StreamedRead","Sys_StringToAdr","Sys_UnloadBotLib","Sys_UnloadCGame","Sys_UnloadDll","Sys_UnloadGame","Sys_UnloadUI","UI_GameCommand","UI_usesUniqueCDKey","VM_ArgPtr","VM_Call","VM_Clear","VM_Create","VM_Debug","VM_ExplicitArgPtr","VM_Free","VM_Init","VM_Restart","Z_AvailableMemory","Z_Free","Z_FreeTags","Z_LogHeap","Z_Malloc","Z_MallocDebug","Z_TagMalloc","Z_TagMallocDebug"] end function
/// List the 26 names in qcommon.headers.qcommonGlobalNames, beginning with `cl_cdkey`, `cl_paused`, `clientHuffTables`, `com_blood`.
function qcommonGlobalNames() return ["cl_cdkey","cl_paused","clientHuffTables","com_blood","com_buildScript","com_cameraMode","com_cl_running","com_dedicated","com_developer","com_errorEntered","com_frameMsec","com_frameTime","com_journal","com_journalDataFile","com_journalFile","com_speeds","com_sv_running","com_timescale","com_version","com_viewlog","cvar_modifiedFlags","demo_protocols","sv_paused","time_backend","time_frontend","time_game"] end function
/// List the 54 names in qcommon.headers.qcommonFieldNames, beginning with `field_t.buffer`, `field_t.cursor`, `field_t.scroll`, `field_t.widthInChars`.
function qcommonFieldNames() return ["field_t.buffer","field_t.cursor","field_t.scroll","field_t.widthInChars","huff_t.loc","huff_t.blocNode","huff_t.blocPtrs","huff_t.freelist","huff_t.lhead","huff_t.ltail","huff_t.nodeList","huff_t.nodePtrs","huff_t.tree","huffman_t.compressor","huffman_t.decompressor","msg_t.allowoverflow","msg_t.bit","msg_t.cursize","msg_t.data","msg_t.maxsize","msg_t.oob","msg_t.overflowed","msg_t.readcount","netadr_t.ip","netadr_t.ipx","netadr_t.port","netadr_t.type","netchan_t.fragmentBuffer","netchan_t.unsentBuffer","netchan_t.dropped","netchan_t.fragmentLength","netchan_t.fragmentSequence","netchan_t.incomingSequence","netchan_t.outgoingSequence","netchan_t.qport","netchan_t.remoteAddress","netchan_t.sock","netchan_t.unsentFragmentStart","netchan_t.unsentFragments","netchan_t.unsentLength","node_t.head","node_t.left","node_t.next","node_t.parent","node_t.prev","node_t.right","node_t.symbol","node_t.weight","sysEvent_t.evPtr","sysEvent_t.evPtrLength","sysEvent_t.evTime","sysEvent_t.evType","sysEvent_t.evValue","sysEvent_t.evValue2"] end function

/// List the 11 names in qcommon.headers.unzipMacroNames, beginning with `UNZ_BADZIPFILE`, `UNZ_CASESENSITIVE`, `UNZ_CRCERROR`, `UNZ_END_OF_LIST_OF_FILE`.
function unzipMacroNames() return ["UNZ_BADZIPFILE","UNZ_CASESENSITIVE","UNZ_CRCERROR","UNZ_END_OF_LIST_OF_FILE","UNZ_EOF","UNZ_ERRNO","UNZ_INTERNALERROR","UNZ_NOTCASESENSITIVE","UNZ_OK","UNZ_OSDEFAULTCASE","UNZ_PARAMERROR"] end function
/// List the 12 names in qcommon.headers.unzipTypeNames, beginning with `file_in_zip_read_info_s`, `tm_unz`, `alloc_func`, `free_func`.
function unzipTypeNames() return ["file_in_zip_read_info_s","tm_unz","alloc_func","free_func","unzFile","unzFile__","unz_file_info","unz_file_info_internal","unz_global_info","unz_s","z_stream","z_streamp"] end function
/// List the 18 names in qcommon.headers.unzipFunctionNames, beginning with `unzClose`, `unzCloseCurrentFile`, `unzGetCurrentFileInfo`, `unzGetCurrentFileInfoPosition`.
function unzipFunctionNames() return ["unzClose","unzCloseCurrentFile","unzGetCurrentFileInfo","unzGetCurrentFileInfoPosition","unzGetGlobalComment","unzGetGlobalInfo","unzGetLocalExtrafield","unzGoToFirstFile","unzGoToNextFile","unzLocateFile","unzOpen","unzOpenCurrentFile","unzReOpen","unzReadCurrentFile","unzSetCurrentFileInfoPosition","unzStringFileNameCompare","unzeof","unztell"] end function
/// List the 0 names in qcommon.headers.unzipGlobalNames.
function unzipGlobalNames() return [] end function
/// List the 68 names in qcommon.headers.unzipFieldNames, beginning with `file_in_zip_read_info_s.byte_before_the_zipfile`, `file_in_zip_read_info_s.compression_method`, `file_in_zip_read_info_s.crc32`, `file_in_zip_read_info_s.crc32_wait`.
function unzipFieldNames() return ["file_in_zip_read_info_s.byte_before_the_zipfile","file_in_zip_read_info_s.compression_method","file_in_zip_read_info_s.crc32","file_in_zip_read_info_s.crc32_wait","file_in_zip_read_info_s.file","file_in_zip_read_info_s.offset_local_extrafield","file_in_zip_read_info_s.pos_in_zipfile","file_in_zip_read_info_s.pos_local_extrafield","file_in_zip_read_info_s.read_buffer","file_in_zip_read_info_s.rest_read_compressed","file_in_zip_read_info_s.rest_read_uncompressed","file_in_zip_read_info_s.size_local_extrafield","file_in_zip_read_info_s.stream","file_in_zip_read_info_s.stream_initialised","tm_unz.tm_hour","tm_unz.tm_mday","tm_unz.tm_min","tm_unz.tm_mon","tm_unz.tm_sec","tm_unz.tm_year","unzFile__.unused","unz_file_info.compressed_size","unz_file_info.compression_method","unz_file_info.crc","unz_file_info.disk_num_start","unz_file_info.dosDate","unz_file_info.external_fa","unz_file_info.flag","unz_file_info.internal_fa","unz_file_info.size_file_comment","unz_file_info.size_file_extra","unz_file_info.size_filename","unz_file_info.tmu_date","unz_file_info.uncompressed_size","unz_file_info.version","unz_file_info.version_needed","unz_file_info_internal.offset_curfile","unz_global_info.number_entry","unz_global_info.size_comment","unz_s.byte_before_the_zipfile","unz_s.central_pos","unz_s.cur_file_info","unz_s.cur_file_info_internal","unz_s.current_file_ok","unz_s.file","unz_s.gi","unz_s.num_file","unz_s.offset_central_dir","unz_s.pfile_in_zip_read","unz_s.pos_in_central_dir","unz_s.size_central_dir","unz_s.tmpFile","unz_s.tmpPos","unz_s.tmpSize","z_stream.adler","z_stream.avail_in","z_stream.avail_out","z_stream.data_type","z_stream.msg","z_stream.next_in","z_stream.next_out","z_stream.opaque","z_stream.reserved","z_stream.state","z_stream.total_in","z_stream.total_out","z_stream.zalloc","z_stream.zfree"] end function

/// List the 75 names in qcommon.headers.macroNames, beginning with `AUTHORIZE_SERVER_NAME`, `BASEGAME`, `BOX_MODEL_HANDLE`, `CAPSULE_MODEL_HANDLE`.
function macroNames() return ["AUTHORIZE_SERVER_NAME","BASEGAME","BOX_MODEL_HANDLE","CAPSULE_MODEL_HANDLE","CLIP_EPSILON","CL_DECODE_START","CL_ENCODE_START","CPUID_AMD_3DNOW","CPUID_AXP","CPUID_GENERIC","CPUID_INTEL_KATMAI","CPUID_INTEL_MMX","CPUID_INTEL_PENTIUM","CPUID_INTEL_UNSUPPORTED","FS_CGAME_REF","FS_GENERAL_REF","FS_QAGAME_REF","FS_UI_REF","HMAX","INTERNAL_NODE","MASTER_SERVER_NAME","MAXPRINTMSG","MAX_DOWNLOAD_BLKSIZE","MAX_DOWNLOAD_WINDOW","MAX_EDIT_LINE","MAX_FACETS","MAX_FILE_HANDLES","MAX_GRID_SIZE","MAX_MAP_BOUNDS","MAX_MSGLEN","MAX_PACKET_USERCMDS","MAX_PATCH_PLANES","MAX_POINTS_ON_WINDING","MAX_RELIABLE_COMMANDS","MAX_SUBMODELS","NUM_ID_PAKS","NUM_SERVER_PORTS","NYT","ON_EPSILON","PACKET_BACKUP","PACKET_MASK","PLANE_TRI_EPSILON","PORT_ANY","PORT_AUTHORIZE","PORT_MASTER","PORT_SERVER","PORT_UPDATE","PROTOCOL_VERSION","Q_vsnprintf","SIDE_BACK","SIDE_CROSS","SIDE_FRONT","SIDE_ON","SUBDIVIDE_DISTANCE","SURFACE_CLIP_EPSILON","SV_DECODE_START","SV_ENCODE_START","S_Malloc","UNZ_BADZIPFILE","UNZ_CASESENSITIVE","UNZ_CRCERROR","UNZ_END_OF_LIST_OF_FILE","UNZ_EOF","UNZ_ERRNO","UNZ_INTERNALERROR","UNZ_NOTCASESENSITIVE","UNZ_OK","UNZ_OSDEFAULTCASE","UNZ_PARAMERROR","UPDATE_SERVER_NAME","WRAP_POINT_EPSILON","ZONE_DEBUG","Z_Malloc","Z_TagMalloc","_QCOMMON_H_"] end function
/// List the 45 names in qcommon.headers.typeNames, beginning with `cArea_t`, `cGrid_t`, `cLeaf_t`, `cNode_t`.
function typeNames() return ["cArea_t","cGrid_t","cLeaf_t","cNode_t","cPatch_t","cbrush_t","cbrushside_t","clipMap_t","cmodel_t","facet_t","field_t","file_in_zip_read_info_s","huff_t","huffman_t","joystickAxis_t","leafList_t","memtag_t","msg_t","netadr_t","netadrtype_t","netchan_t","netsrc_t","node_t","patchCollide_t","patchPlane_t","sharedTraps_t","sphere_t","sysEventType_t","sysEvent_t","tm_unz","traceWork_t","alloc_func","free_func","unzFile","unzFile__","unz_file_info","unz_file_info_internal","unz_global_info","unz_s","vmInterpret_t","vm_t","winding_t","xcommand_t","z_stream","z_streamp"] end function
/// Return `mq3.qcommon.headers.qcommonEnumNames()` from `qcommon.headers.enumNames`.
function enumNames() return qcommonEnumNames() end function
/// List the 343 names in qcommon.headers.functionNames, beginning with `AddWindingToConvexHull`, `AllocWinding`, `BaseWindingForPlane`, `CL_CDDialog`.
function functionNames() return ["AddWindingToConvexHull","AllocWinding","BaseWindingForPlane","CL_CDDialog","CL_CharEvent","CL_ConsolePrint","CL_Disconnect","CL_FlushMemory","CL_ForwardCommandToServer","CL_Frame","CL_GameCommand","CL_Init","CL_InitKeyCommands","CL_JoystickEvent","CL_KeyEvent","CL_MapLoading","CL_MouseEvent","CL_PacketEvent","CL_Shutdown","CL_ShutdownAll","CL_StartHunkUsers","CM_AdjustAreaPortalState","CM_AreasConnected","CM_BoxBrushes","CM_BoxLeafnums","CM_BoxLeafnums_r","CM_BoxTrace","CM_ClearLevelPatches","CM_ClearMap","CM_ClipHandleToModel","CM_ClusterPVS","CM_DrawDebugSurface","CM_EntityString","CM_GeneratePatchCollide","CM_InlineModel","CM_LeafArea","CM_LeafCluster","CM_LerpTag","CM_LoadMap","CM_MarkFragments","CM_ModelBounds","CM_NumClusters","CM_NumInlineModels","CM_PointContents","CM_PointLeafnum","CM_PositionTestInPatchCollide","CM_StoreBrushes","CM_StoreLeafs","CM_TempBoxModel","CM_TraceThroughPatchCollide","CM_TransformedBoxTrace","CM_TransformedPointContents","CM_WriteAreaBits","Cbuf_AddText","Cbuf_Execute","Cbuf_ExecuteText","Cbuf_Init","CheckWinding","ChopWinding","ChopWindingInPlace","ClipWindingEpsilon","Cmd_AddCommand","Cmd_Argc","Cmd_Args","Cmd_ArgsBuffer","Cmd_ArgsFrom","Cmd_Argv","Cmd_ArgvBuffer","Cmd_Cmd","Cmd_CommandCompletion","Cmd_ExecuteString","Cmd_Init","Cmd_RemoveCommand","Cmd_TokenizeString","Com_BeginRedirect","Com_BlockChecksum","Com_BlockChecksumKey","Com_DPrintf","Com_EndRedirect","Com_Error","Com_EventLoop","Com_Filter","Com_FilterPath","Com_Frame","Com_HashKey","Com_Init","Com_Milliseconds","Com_Printf","Com_Quit_f","Com_RealTime","Com_SafeMode","Com_Shutdown","Com_StartupVariable","Com_TouchMemory","CopyString","CopyWinding","Cvar_Command","Cvar_CommandCompletion","Cvar_Get","Cvar_InfoString","Cvar_InfoStringBuffer","Cvar_InfoString_Big","Cvar_Init","Cvar_Register","Cvar_Reset","Cvar_Restart_f","Cvar_Set","Cvar_SetCheatState","Cvar_SetLatched","Cvar_SetValue","Cvar_Update","Cvar_VariableIntegerValue","Cvar_VariableString","Cvar_VariableStringBuffer","Cvar_VariableValue","Cvar_WriteVariables","FS_ClearPakReferences","FS_ComparePaks","FS_ConditionalRestart","FS_FCloseFile","FS_FOpenFileByMode","FS_FOpenFileRead","FS_FOpenFileWrite","FS_FTell","FS_FileExists","FS_FileIsInPAK","FS_FilenameCompare","FS_Flush","FS_ForceFlush","FS_FreeFile","FS_FreeFileList","FS_GamePureChecksum","FS_GetFileList","FS_GetModList","FS_InitFilesystem","FS_Initialized","FS_ListFiles","FS_LoadStack","FS_LoadedPakChecksums","FS_LoadedPakNames","FS_LoadedPakPureChecksums","FS_Printf","FS_PureServerSetLoadedPaks","FS_PureServerSetReferencedPaks","FS_Read","FS_Read2","FS_ReadFile","FS_ReferencedPakChecksums","FS_ReferencedPakNames","FS_ReferencedPakPureChecksums","FS_Rename","FS_Restart","FS_SV_FOpenFileRead","FS_SV_FOpenFileWrite","FS_SV_Rename","FS_Seek","FS_Shutdown","FS_Write","FS_WriteFile","FS_filelength","FS_idPak","Field_Clear","Field_CompleteCommand","FreeWinding","Huff_Compress","Huff_Decompress","Huff_Init","Huff_Receive","Huff_addRef","Huff_getBit","Huff_offsetReceive","Huff_offsetTransmit","Huff_putBit","Huff_transmit","Hunk_AllocateTempMemory","Hunk_CheckMark","Hunk_Clear","Hunk_ClearTempMemory","Hunk_ClearToMark","Hunk_FreeTempMemory","Hunk_Log","Hunk_MemoryRemaining","Hunk_SetMark","Hunk_Trash","Info_Print","Key_WriteBindings","MSG_BeginReading","MSG_BeginReadingOOB","MSG_Bitstream","MSG_Clear","MSG_Copy","MSG_Init","MSG_InitOOB","MSG_ReadAngle16","MSG_ReadBigString","MSG_ReadBits","MSG_ReadByte","MSG_ReadChar","MSG_ReadData","MSG_ReadDeltaEntity","MSG_ReadDeltaPlayerstate","MSG_ReadDeltaUsercmd","MSG_ReadDeltaUsercmdKey","MSG_ReadFloat","MSG_ReadLong","MSG_ReadShort","MSG_ReadString","MSG_ReadStringLine","MSG_ReportChangeVectors_f","MSG_WriteAngle16","MSG_WriteBigString","MSG_WriteBits","MSG_WriteByte","MSG_WriteChar","MSG_WriteData","MSG_WriteDeltaEntity","MSG_WriteDeltaPlayerstate","MSG_WriteDeltaUsercmd","MSG_WriteDeltaUsercmdKey","MSG_WriteFloat","MSG_WriteLong","MSG_WriteShort","MSG_WriteString","NET_AdrToString","NET_CompareAdr","NET_CompareBaseAdr","NET_Config","NET_GetLoopPacket","NET_Init","NET_IsLocalAddress","NET_OutOfBandData","NET_OutOfBandPrint","NET_Restart","NET_SendPacket","NET_Shutdown","NET_Sleep","NET_StringToAdr","Netchan_Init","Netchan_Process","Netchan_Setup","Netchan_Transmit","Netchan_TransmitNextFragment","RemoveColinearPoints","ReverseWinding","SCR_DebugGraph","SV_Frame","SV_GameCommand","SV_Init","SV_PacketEvent","SV_Shutdown","S_ClearSoundBuffer","S_Malloc","S_MallocDebug","Sys_BeginProfiling","Sys_BeginStreamedFile","Sys_CheckCD","Sys_Cwd","Sys_DefaultCDPath","Sys_DefaultHomePath","Sys_DefaultInstallPath","Sys_DisplaySystemConsole","Sys_EndProfiling","Sys_EndStreamedFile","Sys_Error","Sys_FreeFileList","Sys_GetBotLibAPI","Sys_GetCGameAPI","Sys_GetClipboardData","Sys_GetCurrentUser","Sys_GetEvent","Sys_GetGameAPI","Sys_GetProcessorId","Sys_GetUIAPI","Sys_Init","Sys_IsLANAddress","Sys_ListFiles","Sys_LoadDll","Sys_LowPhysicalMemory","Sys_Milliseconds","Sys_Mkdir","Sys_MonkeyShouldBeSpanked","Sys_Print","Sys_ProcessorCount","Sys_Quit","Sys_SendPacket","Sys_SetDefaultCDPath","Sys_SetDefaultHomePath","Sys_SetDefaultInstallPath","Sys_SetErrorText","Sys_ShowConsole","Sys_ShowIP","Sys_SnapVector","Sys_StreamSeek","Sys_StreamedRead","Sys_StringToAdr","Sys_UnloadBotLib","Sys_UnloadCGame","Sys_UnloadDll","Sys_UnloadGame","Sys_UnloadUI","UI_GameCommand","UI_usesUniqueCDKey","VM_ArgPtr","VM_Call","VM_Clear","VM_Create","VM_Debug","VM_ExplicitArgPtr","VM_Free","VM_Init","VM_Restart","WindingArea","WindingBounds","WindingCenter","WindingOnPlaneSide","WindingPlane","Z_AvailableMemory","Z_Free","Z_FreeTags","Z_LogHeap","Z_Malloc","Z_MallocDebug","Z_TagMalloc","Z_TagMallocDebug","pw","unzClose","unzCloseCurrentFile","unzGetCurrentFileInfo","unzGetCurrentFileInfoPosition","unzGetGlobalComment","unzGetGlobalInfo","unzGetLocalExtrafield","unzGoToFirstFile","unzGoToNextFile","unzLocateFile","unzOpen","unzOpenCurrentFile","unzReOpen","unzReadCurrentFile","unzSetCurrentFileInfoPosition","unzStringFileNameCompare","unzeof","unztell"] end function
/// List the 32 names in qcommon.headers.globalNames, beginning with `c_patch_traces`, `c_pointcontents`, `cl_cdkey`, `cl_paused`.
function globalNames() return ["c_patch_traces","c_pointcontents","cl_cdkey","cl_paused","clientHuffTables","cm","cm_noAreas","cm_noCurves","cm_playerCurveClip","com_blood","com_buildScript","com_cameraMode","com_cl_running","com_dedicated","com_developer","com_errorEntered","com_frameMsec","com_frameTime","com_journal","com_journalDataFile","com_journalFile","com_speeds","com_sv_running","com_timescale","com_version","com_viewlog","cvar_modifiedFlags","demo_protocols","sv_paused","time_backend","time_frontend","time_game"] end function
/// List the 222 names in qcommon.headers.fieldNames, beginning with `cArea_t.floodnum`, `cArea_t.floodvalid`, `cGrid_t.points`, `cGrid_t.height`.
function fieldNames() return ["cArea_t.floodnum","cArea_t.floodvalid","cGrid_t.points","cGrid_t.height","cGrid_t.width","cGrid_t.wrapHeight","cGrid_t.wrapWidth","cLeaf_t.area","cLeaf_t.cluster","cLeaf_t.firstLeafBrush","cLeaf_t.firstLeafSurface","cLeaf_t.numLeafBrushes","cLeaf_t.numLeafSurfaces","cNode_t.children","cNode_t.plane","cPatch_t.checkcount","cPatch_t.contents","cPatch_t.pc","cPatch_t.surfaceFlags","cbrush_t.bounds","cbrush_t.checkcount","cbrush_t.contents","cbrush_t.numsides","cbrush_t.shaderNum","cbrush_t.sides","cbrushside_t.plane","cbrushside_t.shaderNum","cbrushside_t.surfaceFlags","clipMap_t.name","clipMap_t.areaPortals","clipMap_t.areas","clipMap_t.brushes","clipMap_t.brushsides","clipMap_t.checkcount","clipMap_t.clusterBytes","clipMap_t.cmodels","clipMap_t.entityString","clipMap_t.floodvalid","clipMap_t.leafbrushes","clipMap_t.leafs","clipMap_t.leafsurfaces","clipMap_t.nodes","clipMap_t.numAreas","clipMap_t.numBrushSides","clipMap_t.numBrushes","clipMap_t.numClusters","clipMap_t.numEntityChars","clipMap_t.numLeafBrushes","clipMap_t.numLeafSurfaces","clipMap_t.numLeafs","clipMap_t.numNodes","clipMap_t.numPlanes","clipMap_t.numShaders","clipMap_t.numSubModels","clipMap_t.numSurfaces","clipMap_t.planes","clipMap_t.shaders","clipMap_t.surfaces","clipMap_t.vised","clipMap_t.visibility","cmodel_t.leaf","cmodel_t.maxs","cmodel_t.mins","facet_t.borderInward","facet_t.borderNoAdjust","facet_t.borderPlanes","facet_t.numBorders","facet_t.surfacePlane","field_t.buffer","field_t.cursor","field_t.scroll","field_t.widthInChars","file_in_zip_read_info_s.byte_before_the_zipfile","file_in_zip_read_info_s.compression_method","file_in_zip_read_info_s.crc32","file_in_zip_read_info_s.crc32_wait","file_in_zip_read_info_s.file","file_in_zip_read_info_s.offset_local_extrafield","file_in_zip_read_info_s.pos_in_zipfile","file_in_zip_read_info_s.pos_local_extrafield","file_in_zip_read_info_s.read_buffer","file_in_zip_read_info_s.rest_read_compressed","file_in_zip_read_info_s.rest_read_uncompressed","file_in_zip_read_info_s.size_local_extrafield","file_in_zip_read_info_s.stream","file_in_zip_read_info_s.stream_initialised","huff_t.loc","huff_t.blocNode","huff_t.blocPtrs","huff_t.freelist","huff_t.lhead","huff_t.ltail","huff_t.nodeList","huff_t.nodePtrs","huff_t.tree","huffman_t.compressor","huffman_t.decompressor","leafList_t.bounds","leafList_t.count","leafList_t.lastLeaf","leafList_t.list","leafList_t.maxcount","leafList_t.overflowed","leafList_t.storeLeafs","msg_t.allowoverflow","msg_t.bit","msg_t.cursize","msg_t.data","msg_t.maxsize","msg_t.oob","msg_t.overflowed","msg_t.readcount","netadr_t.ip","netadr_t.ipx","netadr_t.port","netadr_t.type","netchan_t.fragmentBuffer","netchan_t.unsentBuffer","netchan_t.dropped","netchan_t.fragmentLength","netchan_t.fragmentSequence","netchan_t.incomingSequence","netchan_t.outgoingSequence","netchan_t.qport","netchan_t.remoteAddress","netchan_t.sock","netchan_t.unsentFragmentStart","netchan_t.unsentFragments","netchan_t.unsentLength","node_t.head","node_t.left","node_t.next","node_t.parent","node_t.prev","node_t.right","node_t.symbol","node_t.weight","patchCollide_t.bounds","patchCollide_t.facets","patchCollide_t.numFacets","patchCollide_t.numPlanes","patchCollide_t.planes","patchPlane_t.plane","patchPlane_t.signbits","sphere_t.halfheight","sphere_t.offset","sphere_t.radius","sphere_t.use","sysEvent_t.evPtr","sysEvent_t.evPtrLength","sysEvent_t.evTime","sysEvent_t.evType","sysEvent_t.evValue","sysEvent_t.evValue2","tm_unz.tm_hour","tm_unz.tm_mday","tm_unz.tm_min","tm_unz.tm_mon","tm_unz.tm_sec","tm_unz.tm_year","traceWork_t.bounds","traceWork_t.contents","traceWork_t.end","traceWork_t.extents","traceWork_t.isPoint","traceWork_t.maxOffset","traceWork_t.modelOrigin","traceWork_t.offsets","traceWork_t.size","traceWork_t.sphere","traceWork_t.start","traceWork_t.trace","unzFile__.unused","unz_file_info.compressed_size","unz_file_info.compression_method","unz_file_info.crc","unz_file_info.disk_num_start","unz_file_info.dosDate","unz_file_info.external_fa","unz_file_info.flag","unz_file_info.internal_fa","unz_file_info.size_file_comment","unz_file_info.size_file_extra","unz_file_info.size_filename","unz_file_info.tmu_date","unz_file_info.uncompressed_size","unz_file_info.version","unz_file_info.version_needed","unz_file_info_internal.offset_curfile","unz_global_info.number_entry","unz_global_info.size_comment","unz_s.byte_before_the_zipfile","unz_s.central_pos","unz_s.cur_file_info","unz_s.cur_file_info_internal","unz_s.current_file_ok","unz_s.file","unz_s.gi","unz_s.num_file","unz_s.offset_central_dir","unz_s.pfile_in_zip_read","unz_s.pos_in_central_dir","unz_s.size_central_dir","unz_s.tmpFile","unz_s.tmpPos","unz_s.tmpSize","winding_t.numpoints","winding_t.p","z_stream.adler","z_stream.avail_in","z_stream.avail_out","z_stream.data_type","z_stream.msg","z_stream.next_in","z_stream.next_out","z_stream.opaque","z_stream.reserved","z_stream.state","z_stream.total_in","z_stream.total_out","z_stream.zalloc","z_stream.zfree"] end function
/// Compute qcommon.headers.validInlineModel as `(((index >= 0) and (index < count)) and (index < MAX_SUBMODELS))`.
/// @param index Index used in `(index >= 0)` and `(index < count)`.
/// @param count Count used in `(index < count)` and `((index >= 0) and (index < count))`.
function validInlineModel(index,count) return index>=0 and index<count and index<MAX_SUBMODELS end function
/// Compute qcommon.headers.reliableSlot as `(sequence & PACKET_MASK)`.
/// @param sequence Sequence used in `(sequence & PACKET_MASK)`.
function reliableSlot(sequence) return sequence & PACKET_MASK end function
/// Compute qcommon.headers.validMessageSize as `((size >= 0) and (size <= MAX_MSGLEN))`.
/// @param size Size used in `(size >= 0)` and `(size <= MAX_MSGLEN)`.
function validMessageSize(size) return size>=0 and size<=MAX_MSGLEN end function
/// Compute qcommon.headers.validDownloadBlock as `((size >= 0) and (size <= MAX_DOWNLOAD_BLKSIZE))`.
/// @param size Size used in `(size >= 0)` and `(size <= MAX_DOWNLOAD_BLKSIZE)`.
function validDownloadBlock(size) return size>=0 and size<=MAX_DOWNLOAD_BLKSIZE end function
/// Compute qcommon.headers.validUnzipResult as `(((code == UNZ_OK) or (code == UNZ_END_OF_LIST_OF_FILE)) or (code <= UNZ_PARAMERROR))`.
/// @param code Code used in `(code == UNZ_OK)` and `(code <= UNZ_PARAMERROR)`.
function validUnzipResult(code) return code==UNZ_OK or code==UNZ_END_OF_LIST_OF_FILE or code<=UNZ_PARAMERROR end function
/// Compute qcommon.headers.headerCounts as `[75, 46, 45, 344, 32, 222]`.
function headerCounts() return [75,46,45,344,32,222] end function
