// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete dynamically resolved OpenGL/WGL/GLX facade from renderer/qgl.h.
package mq3.renderer.qgl

/// OpenGL state-query selector for the active server-side texture unit.
const GL_ACTIVE_TEXTURE_ARB=0x84e0
/// OpenGL state-query selector for the active client texture-coordinate array unit.
const GL_CLIENT_ACTIVE_TEXTURE_ARB=0x84e1
/// OpenGL state-query selector for the maximum number of simultaneously active texture units.
const GL_MAX_ACTIVE_TEXTURES_ARB=0x84e2
/// OpenGL multitexture selector for texture unit 0.
const GL_TEXTURE0_ARB=0x84c0
/// OpenGL multitexture selector for texture unit 1.
const GL_TEXTURE1_ARB=0x84c1
/// OpenGL multitexture selector for texture unit 2.
const GL_TEXTURE2_ARB=0x84c2
/// OpenGL multitexture selector for texture unit 3.
const GL_TEXTURE3_ARB=0x84c3
/// OpenGL legacy S3TC compressed RGB texture-format selector.
const GL_RGB_S3TC=0x83a0
/// OpenGL legacy RGB4_S3TC compressed RGB texture-format selector.
const GL_RGB4_S3TC=0x83a1
/// Data record for `mq3.renderer.qgl.Binding`; groups `name`, `address`, `extension`.
struct Binding
  /// OpenGL function name whose native entry-point address is bound by the registry.
  name
  /// Network address used to identify the remote or local endpoint.
  address
  /// Whether the graphics entry point belongs to an optional extension.
  extension
end struct
/// Data record for `mq3.renderer.qgl.Registry`; groups `bindings`, `loaded`, `driver`.
struct Registry
  /// Bindings associating names or handles with their backing resources.
  bindings
  /// Whether the selected graphics driver and entry points have been loaded.
  loaded
  /// Graphics driver selected or loaded by the platform layer.
  driver
end struct
/// Lists the 341 declared names for `mq3.renderer.qgl.coreEntryPoints`, including `qglAccum`, `qglActiveTextureARB`, `qglAlphaFunc`, `qglAreTexturesResident`.
function coreEntryPoints() return ["qglAccum","qglActiveTextureARB","qglAlphaFunc","qglAreTexturesResident","qglArrayElement","qglBegin","qglBindTexture","qglBitmap","qglBlendFunc","qglCallList","qglCallLists","qglClear","qglClearAccum","qglClearColor","qglClearDepth","qglClearIndex","qglClearStencil","qglClientActiveTextureARB","qglClipPlane","qglColor3b","qglColor3bv","qglColor3d","qglColor3dv","qglColor3f","qglColor3fv","qglColor3i","qglColor3iv","qglColor3s","qglColor3sv","qglColor3ub","qglColor3ubv","qglColor3ui","qglColor3uiv","qglColor3us","qglColor3usv","qglColor4b","qglColor4bv","qglColor4d","qglColor4dv","qglColor4f","qglColor4fv","qglColor4i","qglColor4iv","qglColor4s","qglColor4sv","qglColor4ub","qglColor4ubv","qglColor4ui","qglColor4uiv","qglColor4us","qglColor4usv","qglColorMask","qglColorMaterial","qglColorPointer","qglCopyPixels","qglCopyTexImage1D","qglCopyTexImage2D","qglCopyTexSubImage1D","qglCopyTexSubImage2D","qglCullFace","qglDeleteLists","qglDeleteTextures","qglDepthFunc","qglDepthMask","qglDepthRange","qglDisable","qglDisableClientState","qglDrawArrays","qglDrawBuffer","qglDrawElements","qglDrawPixels","qglEdgeFlag","qglEdgeFlagPointer","qglEdgeFlagv","qglEnable","qglEnableClientState","qglEnd","qglEndList","qglEvalCoord1d","qglEvalCoord1dv","qglEvalCoord1f","qglEvalCoord1fv","qglEvalCoord2d","qglEvalCoord2dv","qglEvalCoord2f","qglEvalCoord2fv","qglEvalMesh1","qglEvalMesh2","qglEvalPoint1","qglEvalPoint2","qglFeedbackBuffer","qglFinish","qglFlush","qglFogf","qglFogfv","qglFogi","qglFogiv","qglFrontFace","qglFrustum","qglGenLists","qglGenTextures","qglGetBooleanv","qglGetClipPlane","qglGetDoublev","qglGetError","qglGetFloatv","qglGetIntegerv","qglGetLightfv","qglGetLightiv","qglGetMapdv","qglGetMapfv","qglGetMapiv","qglGetMaterialfv","qglGetMaterialiv","qglGetPixelMapfv","qglGetPixelMapuiv","qglGetPixelMapusv","qglGetPointerv","qglGetPolygonStipple","qglGetString","qglGetTexEnvfv","qglGetTexEnviv","qglGetTexGendv","qglGetTexGenfv","qglGetTexGeniv","qglGetTexImage","qglGetTexLevelParameterfv","qglGetTexLevelParameteriv","qglGetTexParameterfv","qglGetTexParameteriv","qglHint","qglIndexMask","qglIndexPointer","qglIndexd","qglIndexdv","qglIndexf","qglIndexfv","qglIndexi","qglIndexiv","qglIndexs","qglIndexsv","qglIndexub","qglIndexubv","qglInitNames","qglInterleavedArrays","qglIsEnabled","qglIsList","qglIsTexture","qglLightModelf","qglLightModelfv","qglLightModeli","qglLightModeliv","qglLightf","qglLightfv","qglLighti","qglLightiv","qglLineStipple","qglLineWidth","qglListBase","qglLoadIdentity","qglLoadMatrixd","qglLoadMatrixf","qglLoadName","qglLockArraysEXT","qglLogicOp","qglMap1d","qglMap1f","qglMap2d","qglMap2f","qglMapGrid1d","qglMapGrid1f","qglMapGrid2d","qglMapGrid2f","qglMaterialf","qglMaterialfv","qglMateriali","qglMaterialiv","qglMatrixMode","qglMultMatrixd","qglMultMatrixf","qglMultiTexCoord2fARB","qglNewList","qglNormal3b","qglNormal3bv","qglNormal3d","qglNormal3dv","qglNormal3f","qglNormal3fv","qglNormal3i","qglNormal3iv","qglNormal3s","qglNormal3sv","qglNormalPointer","qglOrtho","qglPassThrough","qglPixelMapfv","qglPixelMapuiv","qglPixelMapusv","qglPixelStoref","qglPixelStorei","qglPixelTransferf","qglPixelTransferi","qglPixelZoom","qglPointSize","qglPolygonMode","qglPolygonOffset","qglPolygonStipple","qglPopAttrib","qglPopClientAttrib","qglPopMatrix","qglPopName","qglPrioritizeTextures","qglPushAttrib","qglPushClientAttrib","qglPushMatrix","qglPushName","qglRasterPos2d","qglRasterPos2dv","qglRasterPos2f","qglRasterPos2fv","qglRasterPos2i","qglRasterPos2iv","qglRasterPos2s","qglRasterPos2sv","qglRasterPos3d","qglRasterPos3dv","qglRasterPos3f","qglRasterPos3fv","qglRasterPos3i","qglRasterPos3iv","qglRasterPos3s","qglRasterPos3sv","qglRasterPos4d","qglRasterPos4dv","qglRasterPos4f","qglRasterPos4fv","qglRasterPos4i","qglRasterPos4iv","qglRasterPos4s","qglRasterPos4sv","qglReadBuffer","qglReadPixels","qglRectd","qglRectdv","qglRectf","qglRectfv","qglRecti","qglRectiv","qglRects","qglRectsv","qglRenderMode","qglRotated","qglRotatef","qglScaled","qglScalef","qglScissor","qglSelectBuffer","qglShadeModel","qglStencilFunc","qglStencilMask","qglStencilOp","qglTexCoord1d","qglTexCoord1dv","qglTexCoord1f","qglTexCoord1fv","qglTexCoord1i","qglTexCoord1iv","qglTexCoord1s","qglTexCoord1sv","qglTexCoord2d","qglTexCoord2dv","qglTexCoord2f","qglTexCoord2fv","qglTexCoord2i","qglTexCoord2iv","qglTexCoord2s","qglTexCoord2sv","qglTexCoord3d","qglTexCoord3dv","qglTexCoord3f","qglTexCoord3fv","qglTexCoord3i","qglTexCoord3iv","qglTexCoord3s","qglTexCoord3sv","qglTexCoord4d","qglTexCoord4dv","qglTexCoord4f","qglTexCoord4fv","qglTexCoord4i","qglTexCoord4iv","qglTexCoord4s","qglTexCoord4sv","qglTexCoordPointer","qglTexEnvf","qglTexEnvfv","qglTexEnvi","qglTexEnviv","qglTexGend","qglTexGendv","qglTexGenf","qglTexGenfv","qglTexGeni","qglTexGeniv","qglTexImage1D","qglTexImage2D","qglTexParameterf","qglTexParameterfv","qglTexParameteri","qglTexParameteriv","qglTexSubImage1D","qglTexSubImage2D","qglTranslated","qglTranslatef","qglUnlockArraysEXT","qglVertex2d","qglVertex2dv","qglVertex2f","qglVertex2fv","qglVertex2i","qglVertex2iv","qglVertex2s","qglVertex2sv","qglVertex3d","qglVertex3dv","qglVertex3f","qglVertex3fv","qglVertex3i","qglVertex3iv","qglVertex3s","qglVertex3sv","qglVertex4d","qglVertex4dv","qglVertex4f","qglVertex4fv","qglVertex4i","qglVertex4iv","qglVertex4s","qglVertex4sv","qglVertexPointer","qglViewport"] end function
/// Lists the 24 declared names for `mq3.renderer.qgl.wglEntryPoints`, including `qwglChoosePixelFormat`, `qwglCopyContext`, `qwglCreateContext`, `qwglCreateLayerContext`.
function wglEntryPoints() return ["qwglChoosePixelFormat","qwglCopyContext","qwglCreateContext","qwglCreateLayerContext","qwglDeleteContext","qwglDescribeLayerPlane","qwglDescribePixelFormat","qwglGetCurrentContext","qwglGetCurrentDC","qwglGetDeviceGammaRamp3DFX","qwglGetLayerPaletteEntries","qwglGetPixelFormat","qwglGetProcAddress","qwglMakeCurrent","qwglRealizeLayerPalette","qwglSetDeviceGammaRamp3DFX","qwglSetLayerPaletteEntries","qwglSetPixelFormat","qwglShareLists","qwglSwapBuffers","qwglSwapIntervalEXT","qwglSwapLayerBuffers","qwglUseFontBitmaps","qwglUseFontOutlines"] end function
/// Lists the 12 declared names for `mq3.renderer.qgl.platformEntryPoints`, including `qfxMesaCreateBestContext`, `qfxMesaCreateContext`, `qfxMesaDestroyContext`, `qfxMesaGetCurrentContext`.
function platformEntryPoints() return ["qfxMesaCreateBestContext","qfxMesaCreateContext","qfxMesaDestroyContext","qfxMesaGetCurrentContext","qfxMesaMakeCurrent","qfxMesaSwapBuffers","qglXChooseVisual","qglXCopyContext","qglXCreateContext","qglXDestroyContext","qglXMakeCurrent","qglXSwapBuffers"] end function
/// Lists the 34 declared names for `mq3.renderer.qgl.procedureTypes`, including `PFNGLACTIVETEXTUREARBPROC`, `PFNGLCLIENTACTIVETEXTUREARBPROC`, `PFNGLMULTITEXCOORD1DARBPROC`, `PFNGLMULTITEXCOORD1DVARBPROC`.
function procedureTypes() return ["PFNGLACTIVETEXTUREARBPROC","PFNGLCLIENTACTIVETEXTUREARBPROC","PFNGLMULTITEXCOORD1DARBPROC","PFNGLMULTITEXCOORD1DVARBPROC","PFNGLMULTITEXCOORD1FARBPROC","PFNGLMULTITEXCOORD1FVARBPROC","PFNGLMULTITEXCOORD1IARBPROC","PFNGLMULTITEXCOORD1IVARBPROC","PFNGLMULTITEXCOORD1SARBPROC","PFNGLMULTITEXCOORD1SVARBPROC","PFNGLMULTITEXCOORD2DARBPROC","PFNGLMULTITEXCOORD2DVARBPROC","PFNGLMULTITEXCOORD2FARBPROC","PFNGLMULTITEXCOORD2FVARBPROC","PFNGLMULTITEXCOORD2IARBPROC","PFNGLMULTITEXCOORD2IVARBPROC","PFNGLMULTITEXCOORD2SARBPROC","PFNGLMULTITEXCOORD2SVARBPROC","PFNGLMULTITEXCOORD3DARBPROC","PFNGLMULTITEXCOORD3DVARBPROC","PFNGLMULTITEXCOORD3FARBPROC","PFNGLMULTITEXCOORD3FVARBPROC","PFNGLMULTITEXCOORD3IARBPROC","PFNGLMULTITEXCOORD3IVARBPROC","PFNGLMULTITEXCOORD3SARBPROC","PFNGLMULTITEXCOORD3SVARBPROC","PFNGLMULTITEXCOORD4DARBPROC","PFNGLMULTITEXCOORD4DVARBPROC","PFNGLMULTITEXCOORD4FARBPROC","PFNGLMULTITEXCOORD4FVARBPROC","PFNGLMULTITEXCOORD4IARBPROC","PFNGLMULTITEXCOORD4IVARBPROC","PFNGLMULTITEXCOORD4SARBPROC","PFNGLMULTITEXCOORD4SVARBPROC"] end function
/// Calls `mq3.renderer.qgl.coreEntryPoints` with `()+wglEntryPoints()+platformEntryPoints()` and returns its result.
function allEntryPoints() return coreEntryPoints()+wglEntryPoints()+platformEntryPoints() end function
/// Constructs `mq3.renderer.qgl.Registry` with `bindings` = `[]`, `loaded` = `false`, `driver` = `""`.
function createRegistry() return Registry([],false,"") end function
/// Updates `registry.bindings` in `mq3.renderer.qgl.bind`; returns `true`.
/// @param registry Mutable record or buffer; this call updates `registry.bindings`.
/// @param name Value used for `mq3.renderer.qgl.Binding.name`.
/// @param address Value assigned to `item.address`.
/// @param extension Value assigned to `item.extension`.
function bind(registry,name,address,extension)
  if registry==void or name=="" or address==0 then return false end if
  for each item in registry.bindings if item.name==name then item.address=address;item.extension=extension;return true end if end for
  registry.bindings=registry.bindings+[Binding(name,address,extension)];return true
end function
/// Returns `0` from `mq3.renderer.qgl.address`; earlier branches return `0`, `item.address`.
/// @param registry Record providing `registry.bindings`.
/// @param name Input used by `for each item in registry.bindings if item.name==name then return item.address`.
function address(registry,name) if registry==void then return 0 end if;for each item in registry.bindings if item.name==name then return item.address end if end for;return 0 end function
/// Computes `address(registry,name)!=0` for `mq3.renderer.qgl.has`.
/// @param registry Value forwarded as `registry` to `mq3.renderer.qgl.address`.
/// @param name Value forwarded as `name` to `mq3.renderer.qgl.address`.
function has(registry,name) return address(registry,name)!=0 end function
/// Lists the 26 declared names for `mq3.renderer.qgl.requiredEntryPoints`, including `qglBindTexture`, `qglBlendFunc`, `qglClear`, `qglClearColor`.
function requiredEntryPoints() return ["qglBindTexture","qglBlendFunc","qglClear","qglClearColor","qglCullFace","qglDepthFunc","qglDepthMask","qglDisable","qglDrawElements","qglEnable","qglFinish","qglGetError","qglGetIntegerv","qglGetString","qglReadPixels","qglScissor","qglTexCoordPointer","qglTexImage2D","qglTexParameteri","qglVertexPointer","qglViewport","qwglCreateContext","qwglDeleteContext","qwglGetProcAddress","qwglMakeCurrent","qwglSwapBuffers"] end function
/// Returns `missing` from `mq3.renderer.qgl.missingRequired`.
/// @param registry Value forwarded as `registry` to `mq3.renderer.qgl.has`.
function missingRequired(registry) missing=[];for each name in requiredEntryPoints() if not has(registry,name) then missing=missing+[name] end if end for;return missing end function
/// Updates `registry.driver`, `registry.loaded` in `mq3.renderer.qgl.activate`; returns `registry.loaded`.
/// @param registry Mutable record or buffer; this call updates `registry.driver`, `registry.loaded`.
/// @param driver Value assigned to `registry.driver`.
function activate(registry,driver) registry.driver=driver;registry.loaded=len(missingRequired(registry))==0;return registry.loaded end function
/// Updates `registry.bindings`, `registry.loaded`, `registry.driver` in `mq3.renderer.qgl.reset`.
/// @param registry Mutable record or buffer; this call updates `registry.bindings`, `registry.loaded`, `registry.driver`.
function reset(registry) registry.bindings=[];registry.loaded=false;registry.driver="";return void end function
