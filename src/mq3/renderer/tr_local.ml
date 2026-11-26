// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete internal renderer declaration facade from renderer/tr_local.h.
package mq3.renderer.tr_local

const SMP_FRAMES=2
const MAX_SHADERS=16384
const MAX_STATES_PER_SHADER=32
const MAX_STATE_NAME=32
const MAX_SHADER_STAGES=8
const TR_MAX_TEXMODS=4
const MAX_SHADER_DEFORMS=3
const MAX_IMAGE_ANIMATIONS=8
const NUM_TEXTURE_BUNDLES=2
const LIGHTMAP_2D=-4
const LIGHTMAP_BY_VERTEX=-3
const LIGHTMAP_WHITEIMAGE=-2
const LIGHTMAP_NONE=-1
const MAX_FACE_POINTS=64
const MAX_PATCH_SIZE=32
const MAX_GRID_SIZE=65
const VERTEXSIZE=8
const SIDE_FRONT=0
const SIDE_BACK=1
const SIDE_ON=2
const CONTENTS_NODE=-1
const MAX_MOD_KNOWN=1024
const MAX_DRAWIMAGES=2048
const MAX_LIGHTMAPS=256
const MAX_SKINS=1024
const MAX_DRAWSURFS=65536
const DRAWSURF_MASK=65535
const QSORT_SHADERNUM_SHIFT=17
const QSORT_ENTITYNUM_SHIFT=7
const QSORT_FOGNUM_SHIFT=2
const FOG_TABLE_SIZE=256
const FUNCTABLE_SIZE=1024
const FUNCTABLE_SIZE2=10
const FUNCTABLE_MASK=1023
const CULL_IN=0
const CULL_CLIP=1
const CULL_OUT=2
const GLS_SRCBLEND_BITS=0x0000000f
const GLS_DSTBLEND_BITS=0x000000f0
const GLS_DEPTHMASK_TRUE=0x00000100
const GLS_POLYMODE_LINE=0x00001000
const GLS_DEPTHTEST_DISABLE=0x00010000
const GLS_DEPTHFUNC_EQUAL=0x00020000
const GLS_ATEST_BITS=0x70000000
const GLS_DEFAULT=GLS_DEPTHMASK_TRUE
const MAX_RENDER_COMMANDS=262144
const MAX_POLYS=600
const MAX_POLYVERTS=3000
/// Data record for `mq3.renderer.tr_local.DrawSurf`; groups `sort`, `surface`.
struct DrawSurf sort surface end struct
/// Data record for `mq3.renderer.tr_local.RenderCommandList`; groups `cmds`, `used`.
struct RenderCommandList cmds used end struct
/// Data record for `mq3.renderer.tr_local.SetColorCommand`; groups `commandId`, `color`.
struct SetColorCommand commandId color end struct
/// Data record for `mq3.renderer.tr_local.DrawBufferCommand`; groups `commandId`, `buffer`.
struct DrawBufferCommand commandId buffer end struct
/// Data record for `mq3.renderer.tr_local.SwapBuffersCommand`; groups `commandId`.
struct SwapBuffersCommand commandId end struct
/// Data record for `mq3.renderer.tr_local.EndFrameCommand`; groups `commandId`, `buffer`.
struct EndFrameCommand commandId buffer end struct
/// Data record for `mq3.renderer.tr_local.StretchPicCommand`; groups `commandId`, `shader`, `x`, `y`, `w`, `h`, and 4 further fields.
struct StretchPicCommand commandId shader x y w h s1 t1 s2 t2 end struct
/// Data record for `mq3.renderer.tr_local.ScreenshotCommand`; groups `commandId`, `x`, `y`, `width`, `height`, `fileName`, and 1 further field.
struct ScreenshotCommand commandId x y width height fileName jpeg end struct
/// Lists the 73 declared names for `mq3.renderer.tr_local.macroNames`, including `CONTENTS_NODE`, `CULL_CLIP`, `CULL_IN`, `CULL_OUT`.
function macroNames() return ["CONTENTS_NODE","CULL_CLIP","CULL_IN","CULL_OUT","DRAWSURF_MASK","FOG_TABLE_SIZE","FUNCTABLE_MASK","FUNCTABLE_SIZE","FUNCTABLE_SIZE2","GLS_ATEST_BITS","GLS_ATEST_GE_80","GLS_ATEST_GT_0","GLS_ATEST_LT_80","GLS_DEFAULT","GLS_DEPTHFUNC_EQUAL","GLS_DEPTHMASK_TRUE","GLS_DEPTHTEST_DISABLE","GLS_DSTBLEND_BITS","GLS_DSTBLEND_DST_ALPHA","GLS_DSTBLEND_ONE","GLS_DSTBLEND_ONE_MINUS_DST_ALPHA","GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA","GLS_DSTBLEND_ONE_MINUS_SRC_COLOR","GLS_DSTBLEND_SRC_ALPHA","GLS_DSTBLEND_SRC_COLOR","GLS_DSTBLEND_ZERO","GLS_POLYMODE_LINE","GLS_SRCBLEND_ALPHA_SATURATE","GLS_SRCBLEND_BITS","GLS_SRCBLEND_DST_ALPHA","GLS_SRCBLEND_DST_COLOR","GLS_SRCBLEND_ONE","GLS_SRCBLEND_ONE_MINUS_DST_ALPHA","GLS_SRCBLEND_ONE_MINUS_DST_COLOR","GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA","GLS_SRCBLEND_SRC_ALPHA","GLS_SRCBLEND_ZERO","GL_INDEX_TYPE","LIGHTMAP_2D","LIGHTMAP_BY_VERTEX","LIGHTMAP_NONE","LIGHTMAP_WHITEIMAGE","MAX_DRAWIMAGES","MAX_DRAWSURFS","MAX_FACE_POINTS","MAX_GRID_SIZE","MAX_IMAGE_ANIMATIONS","MAX_LIGHTMAPS","MAX_MOD_KNOWN","MAX_PATCH_SIZE","MAX_POLYS","MAX_POLYVERTS","MAX_RENDER_COMMANDS","MAX_SHADERS","MAX_SHADER_DEFORMS","MAX_SHADER_STAGES","MAX_SKINS","MAX_STATES_PER_SHADER","MAX_STATE_NAME","NUM_TEXTURE_BUNDLES","PATCH_STITCHING","QSORT_ENTITYNUM_SHIFT","QSORT_FOGNUM_SHIFT","QSORT_SHADERNUM_SHIFT","RB_CHECKOVERFLOW","SIDE_BACK","SIDE_FRONT","SIDE_ON","SMP_FRAMES","TR_LOCAL_H","TR_MAX_TEXMODS","VERTEXSIZE","myftol"] end function
/// Lists the 111 declared names for `mq3.renderer.tr_local.enumNames`, including `ACFF_MODULATE_ALPHA`, `ACFF_MODULATE_RGB`, `ACFF_MODULATE_RGBA`, `ACFF_NONE`.
function enumNames() return ["ACFF_MODULATE_ALPHA","ACFF_MODULATE_RGB","ACFF_MODULATE_RGBA","ACFF_NONE","AGEN_CONST","AGEN_ENTITY","AGEN_IDENTITY","AGEN_LIGHTING_SPECULAR","AGEN_ONE_MINUS_ENTITY","AGEN_ONE_MINUS_VERTEX","AGEN_PORTAL","AGEN_SKIP","AGEN_VERTEX","AGEN_WAVEFORM","CGEN_BAD","CGEN_CONST","CGEN_ENTITY","CGEN_EXACT_VERTEX","CGEN_FOG","CGEN_IDENTITY","CGEN_IDENTITY_LIGHTING","CGEN_LIGHTING_DIFFUSE","CGEN_ONE_MINUS_ENTITY","CGEN_ONE_MINUS_VERTEX","CGEN_VERTEX","CGEN_WAVEFORM","CT_BACK_SIDED","CT_FRONT_SIDED","CT_TWO_SIDED","DEFORM_AUTOSPRITE","DEFORM_AUTOSPRITE2","DEFORM_BULGE","DEFORM_MOVE","DEFORM_NONE","DEFORM_NORMALS","DEFORM_PROJECTION_SHADOW","DEFORM_TEXT0","DEFORM_TEXT1","DEFORM_TEXT2","DEFORM_TEXT3","DEFORM_TEXT4","DEFORM_TEXT5","DEFORM_TEXT6","DEFORM_TEXT7","DEFORM_WAVE","FP_EQUAL","FP_LE","FP_NONE","GF_INVERSE_SAWTOOTH","GF_NOISE","GF_NONE","GF_SAWTOOTH","GF_SIN","GF_SQUARE","GF_TRIANGLE","MOD_BAD","MOD_BRUSH","MOD_MD4","MOD_MESH","RC_DRAW_BUFFER","RC_DRAW_SURFS","RC_END_OF_LIST","RC_SCREENSHOT","RC_SET_COLOR","RC_STRETCH_PIC","RC_SWAP_BUFFERS","SF_BAD","SF_DISPLAY_LIST","SF_ENTITY","SF_FACE","SF_FLARE","SF_GRID","SF_MAX","SF_MD3","SF_MD4","SF_NUM_SURFACE_TYPES","SF_POLY","SF_SKIP","SF_TRIANGLES","SS_ALMOST_NEAREST","SS_BAD","SS_BANNER","SS_BLEND0","SS_BLEND1","SS_BLEND2","SS_BLEND3","SS_BLEND6","SS_DECAL","SS_ENVIRONMENT","SS_FOG","SS_NEAREST","SS_OPAQUE","SS_PORTAL","SS_SEE_THROUGH","SS_STENCIL_SHADOW","SS_UNDERWATER","TCGEN_BAD","TCGEN_ENVIRONMENT_MAPPED","TCGEN_FOG","TCGEN_IDENTITY","TCGEN_LIGHTMAP","TCGEN_TEXTURE","TCGEN_VECTOR","TMOD_ENTITY_TRANSLATE","TMOD_NONE","TMOD_ROTATE","TMOD_SCALE","TMOD_SCROLL","TMOD_STRETCH","TMOD_TRANSFORM","TMOD_TURBULENT"] end function
/// Lists the 61 declared names for `mq3.renderer.tr_local.typeNames`, including `acff_t`, `alphaGen_t`, `backEndCounters_t`, `backEndData_t`.
function typeNames() return ["acff_t","alphaGen_t","backEndCounters_t","backEndData_t","backEndState_t","bmodel_t","colorGen_t","cullType_t","deformStage_t","deform_t","dlight_t","drawBufferCommand_t","drawSurf_t","drawSurfsCommand_t","endFrameCommand_t","fogParms_t","fogPass_t","fog_t","frontEndCounters_t","genFunc_t","glIndex_t","glstate_t","image_t","mnode_t","model_t","modtype_t","msurface_t","orientationr_t","renderCommandList_t","renderCommand_t","screenshotCommand_t","setColorCommand_t","shaderCommands_t","shaderSort_t","shaderStage_t","shaderState_t","shader_t","skinSurface_t","skin_t","skyParms_t","srfDisplayList_t","srfFlare_t","srfGridMesh_t","srfPoly_t","srfSurfaceFace_t","srfTriangles_t","stageVars_t","stretchPicCommand_t","subImageCommand_t","surfaceType_t","swapBuffersCommand_t","texCoordGen_t","texModInfo_t","texMod_t","textureBundle_t","trGlobals_t","trRefEntity_t","trRefdef_t","viewParms_t","waveForm_t","world_t"] end function
/// Lists the 159 declared names for `mq3.renderer.tr_local.functionNames`, including `myftol`, `R_ModelInit`, `R_GetModelByHandle`, `R_LerpTag`.
function functionNames() return ["myftol","R_ModelInit","R_GetModelByHandle","R_LerpTag","R_ModelBounds","R_Modellist_f","R_NoiseGet4f","R_NoiseInit","R_SwapBuffers","R_RenderView","R_AddMD3Surfaces","R_AddNullModelSurfaces","R_AddBeamSurfaces","R_AddRailSurfaces","R_AddLightningBoltSurfaces","R_AddPolygonSurfaces","R_DecomposeSort","R_AddDrawSurf","R_LocalNormalToWorld","R_LocalPointToWorld","R_CullLocalBox","R_CullPointAndRadius","R_CullLocalPointAndRadius","R_RotateForEntity","GL_Bind","GL_SetDefaultState","GL_SelectTexture","GL_TextureMode","GL_CheckErrors","GL_State","GL_TexEnv","GL_Cull","RE_StretchRaw","RE_UploadCinematic","RE_BeginFrame","RE_BeginRegistration","RE_LoadWorldMap","RE_SetWorldVisData","RE_RegisterModel","RE_RegisterSkin","RE_Shutdown","R_GetEntityToken","R_AllocModel","R_Init","R_FindImageFile","R_CreateImage","R_GetModeInfo","R_SetColorMappings","R_GammaCorrect","R_ImageList_f","R_SkinList_f","RB_TakeScreenshotCmd","R_ScreenShot_f","R_InitFogTable","R_FogFactor","R_InitImages","R_DeleteTextures","R_SumOfUsedImages","R_InitSkins","R_GetSkinByHandle","RE_RegisterShaderLightMap","RE_RegisterShader","RE_RegisterShaderNoMip","RE_RegisterShaderFromImage","R_FindShader","R_GetShaderByHandle","R_GetShaderByState","R_FindShaderByName","R_InitShaders","R_ShaderList_f","R_RemapShader","GLimp_Init","GLimp_Shutdown","GLimp_EndFrame","GLimp_RendererSleep","GLimp_FrontEndSleep","GLimp_WakeRenderer","GLimp_LogComment","GLimp_SetGamma","RB_BeginSurface","RB_EndSurface","RB_CheckOverflow","RB_StageIteratorGeneric","RB_StageIteratorSky","RB_StageIteratorVertexLitTexture","RB_StageIteratorLightmappedMultitexture","RB_AddQuadStamp","RB_AddQuadStampExt","RB_ShowImages","R_AddBrushModelSurfaces","R_AddWorldSurfaces","R_inPVS","R_ClearFlares","RB_AddFlare","RB_AddDlightFlares","RB_RenderFlares","R_DlightBmodel","R_SetupEntityLighting","R_TransformDlights","R_LightForPoint","RB_ShadowTessEnd","RB_ShadowFinish","RB_ProjectionShadowDeform","R_BuildCloudData","R_InitSkyTexCoords","R_DrawSkyBox","RB_DrawSun","RB_ClipSkyPolygons","R_SubdividePatchToGrid","R_GridInsertColumn","R_GridInsertRow","R_FreeSurfaceGridMesh","R_MarkFragments","R_ToggleSmpFrame","RE_ClearScene","RE_AddRefEntityToScene","RE_AddPolyToScene","RE_AddLightToScene","RE_AddAdditiveLightToScene","RE_RenderScene","R_MakeAnimModel","R_AddAnimSurfaces","RB_SurfaceAnim","R_TransformModelToClip","R_TransformClipToWindow","RB_DeformTessGeometry","RB_CalcEnvironmentTexCoords","RB_CalcFogTexCoords","RB_CalcScrollTexCoords","RB_CalcRotateTexCoords","RB_CalcScaleTexCoords","RB_CalcTurbulentTexCoords","RB_CalcTransformTexCoords","RB_CalcModulateColorsByFog","RB_CalcModulateAlphasByFog","RB_CalcModulateRGBAsByFog","RB_CalcWaveAlpha","RB_CalcWaveColor","RB_CalcAlphaFromEntity","RB_CalcAlphaFromOneMinusEntity","RB_CalcStretchTexCoords","RB_CalcColorFromEntity","RB_CalcColorFromOneMinusEntity","RB_CalcSpecularAlpha","RB_CalcDiffuseColor","RB_RenderThread","RB_ExecuteRenderCommands","R_GetCommandBuffer","R_InitCommandBuffers","R_ShutdownCommandBuffers","R_SyncRenderThread","R_AddDrawSurfCmd","RE_SetColor","RE_StretchPic","RE_EndFrame","SaveJPG","R_InitFreeType","R_DoneFreeType","RE_RegisterFont"] end function
/// Lists the 98 declared names for `mq3.renderer.tr_local.globalNames`, including `backEnd`, `backEndData`, `glConfig`, `glState`.
function globalNames() return ["backEnd","backEndData","glConfig","glState","max_polys","max_polyverts","r_allowExtensions","r_clear","r_colorMipLevels","r_colorbits","r_debugSort","r_debugSurface","r_depthbits","r_detailTextures","r_displayRefresh","r_dlightBacks","r_drawBuffer","r_drawSun","r_drawentities","r_drawworld","r_dynamiclight","r_ext_compiled_vertex_array","r_ext_compressed_textures","r_ext_gamma_control","r_ext_multitexture","r_ext_texenv_op","r_ext_texture_env_add","r_facePlaneCull","r_fastsky","r_finish","r_flareFade","r_flareSize","r_flares","r_fullbright","r_fullscreen","r_gamma","r_glDriver","r_ignore","r_ignoreFastPath","r_ignoreGLErrors","r_ignorehwgamma","r_inGameVideo","r_intensity","r_lightmap","r_lockpvs","r_lodCurveError","r_lodbias","r_lodscale","r_logFile","r_mapOverBrightBits","r_measureOverdraw","r_mode","r_nobind","r_nocull","r_nocurves","r_noportals","r_norefresh","r_novis","r_offsetFactor","r_offsetUnits","r_overBrightBits","r_picmip","r_portalOnly","r_primitives","r_printShaders","r_railCoreWidth","r_railSegmentLength","r_railWidth","r_roundImagesDown","r_saveFontData","r_shadows","r_showImages","r_showSmp","r_showcluster","r_shownormals","r_showsky","r_showtris","r_simpleMipMaps","r_singleShader","r_skipBackEnd","r_smp","r_speeds","r_stencilbits","r_stereo","r_subdivisions","r_swapInterval","r_textureMode","r_texturebits","r_uiFullScreen","r_verbose","r_vertexLight","r_znear","rb_surfaceTable","renderCommandList","renderThreadActive","ri","tess","tr"] end function
/// Computes `(shaderNum<<QSORT_SHADERNUM_SHIFT)|(entityNum<<QSORT_ENTITYNUM_SHIFT)|(fogNum<<QSORT_FOGNUM_SHIFT)|dlightMap` for `mq3.renderer.tr_local.packSort`.
/// @param shaderNum Input used in the result expression `(shaderNum<<QSORT_SHADERNUM_SHIFT)|(entityNum<<QSORT_ENTITYNUM_SHIFT)|(fogNum<<QSORT_FOGNUM_SHIFT)|dlightMap`.
/// @param entityNum Input used in the result expression `(shaderNum<<QSORT_SHADERNUM_SHIFT)|(entityNum<<QSORT_ENTITYNUM_SHIFT)|(fogNum<<QSORT_FOGNUM_SHIFT)|dlightMap`.
/// @param fogNum Input used in the result expression `(shaderNum<<QSORT_SHADERNUM_SHIFT)|(entityNum<<QSORT_ENTITYNUM_SHIFT)|(fogNum<<QSORT_FOGNUM_SHIFT)|dlightMap`.
/// @param dlightMap Input used in the result expression `(shaderNum<<QSORT_SHADERNUM_SHIFT)|(entityNum<<QSORT_ENTITYNUM_SHIFT)|(fogNum<<QSORT_FOGNUM_SHIFT)|dlightMap`.
function packSort(shaderNum,entityNum,fogNum,dlightMap) return (shaderNum<<QSORT_SHADERNUM_SHIFT)|(entityNum<<QSORT_ENTITYNUM_SHIFT)|(fogNum<<QSORT_FOGNUM_SHIFT)|dlightMap end function
/// Computes `value>>QSORT_SHADERNUM_SHIFT` for `mq3.renderer.tr_local.sortShader`.
/// @param value Input used in the result expression `value>>QSORT_SHADERNUM_SHIFT`.
function sortShader(value) return value>>QSORT_SHADERNUM_SHIFT end function
/// Computes `(value>>QSORT_ENTITYNUM_SHIFT)&1023` for `mq3.renderer.tr_local.sortEntity`.
/// @param value Input used in the result expression `(value>>QSORT_ENTITYNUM_SHIFT)&1023`.
function sortEntity(value) return (value>>QSORT_ENTITYNUM_SHIFT)&1023 end function
/// Computes `(value>>QSORT_FOGNUM_SHIFT)&31` for `mq3.renderer.tr_local.sortFog`.
/// @param value Input used in the result expression `(value>>QSORT_FOGNUM_SHIFT)&31`.
function sortFog(value) return (value>>QSORT_FOGNUM_SHIFT)&31 end function
/// Computes `value&3` for `mq3.renderer.tr_local.sortDlight`.
/// @param value Input used in the result expression `value&3`.
function sortDlight(value) return value&3 end function
/// Computes `requested>=0 and used>=0 and used+requested+4<=MAX_RENDER_COMMANDS` for `mq3.renderer.tr_local.commandBytesAvailable`.
/// @param used Input used in the result expression `requested>=0 and used>=0 and used+requested+4<=MAX_RENDER_COMMANDS`.
/// @param requested Input used in the result expression `requested>=0 and used>=0 and used+requested+4<=MAX_RENDER_COMMANDS`.
function commandBytesAvailable(used,requested) return requested>=0 and used>=0 and used+requested+4<=MAX_RENDER_COMMANDS end function
/// Computes `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes` for `mq3.renderer.tr_local.checkOverflow`.
/// @param numVertexes Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`.
/// @param numIndexes Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`.
/// @param verts Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`.
/// @param indexes Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`.
/// @param maxVertexes Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`.
/// @param maxIndexes Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`.
function checkOverflow(numVertexes,numIndexes,verts,indexes,maxVertexes,maxIndexes) return numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes end function
