// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete refresh-module ABI facade from renderer/tr_public.h.
package mq3.renderer.tr_public

/// Renderer import/export ABI version expected by the engine.
const REF_API_VERSION=8
/// Callback table for `mq3.renderer.tr_public.RefExport`; exposes `Shutdown`, `BeginRegistration`, `RegisterModel`, `RegisterSkin`, `RegisterShader`, `RegisterShaderNoMip`, and 24 further fields.
struct RefExport
  /// Renderer API callback used to shut down the renderer and optionally destroy its graphics window.
  Shutdown
  /// Renderer API callback used to begin renderer registration and return the active graphics
  /// configuration.
  BeginRegistration
  /// Renderer API callback used to load or find a model and return its registered handle.
  RegisterModel
  /// Renderer API callback used to load or find a skin and return its registered handle.
  RegisterSkin
  /// Renderer API callback used to load or find a shader and return its registered handle.
  RegisterShader
  /// Renderer API callback used to register a two-dimensional shader without image mipmaps.
  RegisterShaderNoMip
  /// Renderer API callback used to load the BSP world used by subsequent scene rendering.
  LoadWorld
  /// Renderer API callback used to supply shared BSP visibility data to the renderer.
  SetWorldVisData
  /// Renderer API callback used to finish resource registration and prepare registered images for use.
  EndRegistration
  /// Renderer API callback used to clear the current scene entity, light, and polygon submissions.
  ClearScene
  /// Renderer API callback used to append a model, sprite, beam, or portal entity to the current scene.
  AddRefEntityToScene
  /// Renderer API callback used to append a shader-bound polygon to the current scene.
  AddPolyToScene
  /// Renderer API callback used to sample ambient and directed world lighting at a point.
  LightForPoint
  /// Renderer API callback used to append a modulating dynamic light to the current scene.
  AddLightToScene
  /// Renderer API callback used to append an additive dynamic light to the current scene.
  AddAdditiveLightToScene
  /// Renderer API callback used to render the submitted scene using a view definition.
  RenderScene
  /// Renderer API callback used to set the modulation color used by subsequent two-dimensional drawing.
  SetColor
  /// Renderer API callback used to draw a shader-bound textured rectangle in two dimensions.
  DrawStretchPic
  /// Renderer API callback used to draw an uploaded raw or cinematic image as a rectangle.
  DrawStretchRaw
  /// Renderer API callback used to upload decoded cinematic pixels into a scratch image.
  UploadCinematic
  /// Renderer API callback used to begin a renderer frame for the selected stereo eye.
  BeginFrame
  /// Renderer API callback used to finish rendering and present the completed frame.
  EndFrame
  /// Renderer API callback used to clip a projected polygon against world geometry for impact marks.
  MarkFragments
  /// Renderer API callback used to interpolate a model attachment tag between animation frames.
  LerpTag
  /// Renderer API callback used to return the minimum and maximum bounds of a registered model.
  ModelBounds
  /// Renderer API callback used to submit world geometry to the legacy A3D geometry interface.
  A3D_RenderGeometry
  /// Renderer API callback used to load or rasterize a font and return glyph metadata.
  RegisterFont
  /// Renderer API callback used to replace references to one shader name with another shader.
  RemapShader
  /// Renderer API callback used to read the next token from the loaded map entity text.
  GetEntityToken
  /// Renderer API callback used to test whether two positions share the potentially visible set.
  inPVS
end struct
/// Callback table for `mq3.renderer.tr_public.RefImport`; exposes `Printf`, `Error`, `Milliseconds`, `Hunk_AllocDebug`, `Hunk_Alloc`, `Hunk_AllocateTempMemory`, and 21 further fields.
struct RefImport
  /// Engine service callback used to send a renderer diagnostic message to the engine console.
  Printf
  /// Engine service callback used to report a renderer error through the engine error handler.
  Error
  /// Engine service callback used to read the engine clock in milliseconds.
  Milliseconds
  /// Engine service callback used to allocate persistent hunk memory with source-location tracking.
  Hunk_AllocDebug
  /// Engine service callback used to allocate persistent hunk memory owned by the engine.
  Hunk_Alloc
  /// Engine service callback used to allocate temporary engine hunk memory.
  Hunk_AllocateTempMemory
  /// Engine service callback used to release a temporary engine hunk allocation.
  Hunk_FreeTempMemory
  /// Engine service callback used to allocate engine-managed heap storage.
  Malloc
  /// Engine service callback used to release engine-managed heap storage.
  Free
  /// Engine service callback used to find or register a console variable.
  Cvar_Get
  /// Engine service callback used to update the string value of a console variable.
  Cvar_Set
  /// Engine service callback used to register a renderer console command.
  Cmd_AddCommand
  /// Engine service callback used to remove a registered renderer console command.
  Cmd_RemoveCommand
  /// Engine service callback used to read the argument count of the current console command.
  Cmd_Argc
  /// Engine service callback used to read one argument of the current console command.
  Cmd_Argv
  /// Engine service callback used to schedule command text for engine execution.
  Cmd_ExecuteText
  /// Engine service callback used to enumerate collision surfaces for renderer debug drawing.
  CM_DrawDebugSurface
  /// Engine service callback used to test whether a virtual file is provided by a package archive.
  FS_FileIsInPAK
  /// Engine service callback used to read a complete virtual file into engine-managed storage.
  FS_ReadFile
  /// Engine service callback used to release storage returned by a virtual file read.
  FS_FreeFile
  /// Engine service callback used to enumerate virtual files matching the requested directory and
  /// extension.
  FS_ListFiles
  /// Engine service callback used to release a file-name list returned by the virtual filesystem.
  FS_FreeFileList
  /// Engine service callback used to write bytes to a file through the engine filesystem.
  FS_WriteFile
  /// Engine service callback used to test whether a virtual file exists.
  FS_FileExists
  /// Engine service callback used to upload the latest decoded cinematic frame.
  CIN_UploadCinematic
  /// Engine service callback used to open a cinematic and start playback.
  CIN_PlayCinematic
  /// Engine service callback used to advance a cinematic to the current engine time.
  CIN_RunCinematic
end struct
/// Lists the 30 declared names for `mq3.renderer.tr_public.declaredExportNames`, including `Shutdown`, `BeginRegistration`, `RegisterModel`, `RegisterSkin`.
function declaredExportNames() return ["Shutdown","BeginRegistration","RegisterModel","RegisterSkin","RegisterShader","RegisterShaderNoMip","LoadWorld","SetWorldVisData","EndRegistration","ClearScene","AddRefEntityToScene","AddPolyToScene","LightForPoint","AddLightToScene","AddAdditiveLightToScene","RenderScene","SetColor","DrawStretchPic","DrawStretchRaw","UploadCinematic","BeginFrame","EndFrame","MarkFragments","LerpTag","ModelBounds","A3D_RenderGeometry","RegisterFont","RemapShader","GetEntityToken","inPVS"] end function
/// Returns `result` from `mq3.renderer.tr_public.exportNames`.
function exportNames() result=[];for each name in declaredExportNames() if name!="A3D_RenderGeometry" then result=result+[name] end if end for;return result end function
/// Lists the 27 declared names for `mq3.renderer.tr_public.importNames`, including `Printf`, `Error`, `Milliseconds`, `Hunk_AllocDebug`.
function importNames() return ["Printf","Error","Milliseconds","Hunk_AllocDebug","Hunk_Alloc","Hunk_AllocateTempMemory","Hunk_FreeTempMemory","Malloc","Free","Cvar_Get","Cvar_Set","Cmd_AddCommand","Cmd_RemoveCommand","Cmd_Argc","Cmd_Argv","Cmd_ExecuteText","CM_DrawDebugSurface","FS_FileIsInPAK","FS_ReadFile","FS_FreeFile","FS_ListFiles","FS_FreeFileList","FS_WriteFile","FS_FileExists","CIN_UploadCinematic","CIN_PlayCinematic","CIN_RunCinematic"] end function
/// Computes `apiVersion==REF_API_VERSION` for `mq3.renderer.tr_public.compatible`.
/// @param apiVersion Input used in the result expression `apiVersion==REF_API_VERSION`.
function compatible(apiVersion) return apiVersion==REF_API_VERSION end function
/// Computes `"GetRefAPI"` for `mq3.renderer.tr_public.entrypointName`.
function entrypointName() return "GetRefAPI" end function
