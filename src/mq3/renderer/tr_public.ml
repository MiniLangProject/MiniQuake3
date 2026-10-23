// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete refresh-module ABI facade from renderer/tr_public.h.
package mq3.renderer.tr_public

const REF_API_VERSION=8
struct RefExport Shutdown BeginRegistration RegisterModel RegisterSkin RegisterShader RegisterShaderNoMip LoadWorld SetWorldVisData EndRegistration ClearScene AddRefEntityToScene AddPolyToScene LightForPoint AddLightToScene AddAdditiveLightToScene RenderScene SetColor DrawStretchPic DrawStretchRaw UploadCinematic BeginFrame EndFrame MarkFragments LerpTag ModelBounds A3D_RenderGeometry RegisterFont RemapShader GetEntityToken inPVS end struct
struct RefImport Printf Error Milliseconds Hunk_AllocDebug Hunk_Alloc Hunk_AllocateTempMemory Hunk_FreeTempMemory Malloc Free Cvar_Get Cvar_Set Cmd_AddCommand Cmd_RemoveCommand Cmd_Argc Cmd_Argv Cmd_ExecuteText CM_DrawDebugSurface FS_FileIsInPAK FS_ReadFile FS_FreeFile FS_ListFiles FS_FreeFileList FS_WriteFile FS_FileExists CIN_UploadCinematic CIN_PlayCinematic CIN_RunCinematic end struct
function declaredExportNames() return ["Shutdown","BeginRegistration","RegisterModel","RegisterSkin","RegisterShader","RegisterShaderNoMip","LoadWorld","SetWorldVisData","EndRegistration","ClearScene","AddRefEntityToScene","AddPolyToScene","LightForPoint","AddLightToScene","AddAdditiveLightToScene","RenderScene","SetColor","DrawStretchPic","DrawStretchRaw","UploadCinematic","BeginFrame","EndFrame","MarkFragments","LerpTag","ModelBounds","A3D_RenderGeometry","RegisterFont","RemapShader","GetEntityToken","inPVS"] end function
function exportNames() result=[];for each name in declaredExportNames() if name!="A3D_RenderGeometry" then result=result+[name] end if end for;return result end function
function importNames() return ["Printf","Error","Milliseconds","Hunk_AllocDebug","Hunk_Alloc","Hunk_AllocateTempMemory","Hunk_FreeTempMemory","Malloc","Free","Cvar_Get","Cvar_Set","Cmd_AddCommand","Cmd_RemoveCommand","Cmd_Argc","Cmd_Argv","Cmd_ExecuteText","CM_DrawDebugSurface","FS_FileIsInPAK","FS_ReadFile","FS_FreeFile","FS_ListFiles","FS_FreeFileList","FS_WriteFile","FS_FileExists","CIN_UploadCinematic","CIN_PlayCinematic","CIN_RunCinematic"] end function
function compatible(apiVersion) return apiVersion==REF_API_VERSION end function
function entrypointName() return "GetRefAPI" end function
