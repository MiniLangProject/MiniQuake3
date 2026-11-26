// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Windows QGL loader and logging lifecycle from code/win32/win_qgl.c.
package mq3.platform.win_qgl_runtime

import mq3.renderer.qgl as qgl

/// OpenGL boolean false value accepted by OpenGL calls.
const GL_FALSE=0
/// OpenGL boolean true value accepted by OpenGL calls.
const GL_TRUE=1
/// OpenGL comparison function that always rejects the fragment.
const GL_NEVER=0x0200
/// OpenGL comparison function requiring a value smaller than the reference.
const GL_LESS=0x0201
/// OpenGL comparison function requiring equality with the reference.
const GL_EQUAL=0x0202
/// OpenGL comparison function requiring a value no greater than the reference.
const GL_LEQUAL=0x0203
/// OpenGL comparison function requiring a value greater than the reference.
const GL_GREATER=0x0204
/// OpenGL comparison function requiring inequality with the reference.
const GL_NOTEQUAL=0x0205
/// OpenGL comparison function requiring a value no smaller than the reference.
const GL_GEQUAL=0x0206
/// OpenGL comparison function that always accepts the fragment.
const GL_ALWAYS=0x0207
/// OpenGL primitive mode that draws independent points.
const GL_POINTS=0x0000
/// OpenGL primitive mode that draws independent line segments.
const GL_LINES=0x0001
/// OpenGL primitive mode that draws a closed chain of line segments.
const GL_LINE_LOOP=0x0002
/// OpenGL primitive mode that draws a connected chain of line segments.
const GL_LINE_STRIP=0x0003
/// OpenGL primitive mode that draws independent triangles.
const GL_TRIANGLES=0x0004
/// OpenGL primitive mode that draws a connected strip of triangles.
const GL_TRIANGLE_STRIP=0x0005
/// OpenGL primitive mode that draws triangles sharing the first vertex.
const GL_TRIANGLE_FAN=0x0006
/// OpenGL primitive mode that draws independent four-vertex polygons.
const GL_QUADS=0x0007
/// OpenGL primitive mode that draws a connected strip of four-vertex polygons.
const GL_QUAD_STRIP=0x0008
/// OpenGL primitive mode that draws one convex polygon.
const GL_POLYGON=0x0009
/// OpenGL scalar type for signed eight-bit components.
const GL_BYTE=0x1400
/// OpenGL scalar type for unsigned eight-bit components.
const GL_UNSIGNED_BYTE=0x1401
/// OpenGL scalar type for signed sixteen-bit components.
const GL_SHORT=0x1402
/// OpenGL scalar type for unsigned sixteen-bit components.
const GL_UNSIGNED_SHORT=0x1403
/// OpenGL scalar type for signed thirty-two-bit components.
const GL_INT=0x1404
/// OpenGL scalar type for unsigned thirty-two-bit components.
const GL_UNSIGNED_INT=0x1405
/// OpenGL scalar type for single-precision floating-point components.
const GL_FLOAT=0x1406
/// OpenGL scalar type for double-precision floating-point components.
const GL_DOUBLE=0x140a
/// OpenGL blend-factor selector using zero.
const GL_ZERO=0
/// OpenGL blend-factor selector using one.
const GL_ONE=1
/// OpenGL blend-factor selector using the source alpha.
const GL_SRC_ALPHA=0x0302
/// OpenGL blend-factor selector using one minus the source alpha.
const GL_ONE_MINUS_SRC_ALPHA=0x0303
/// OpenGL blend-factor selector using the destination alpha.
const GL_DST_ALPHA=0x0304
/// OpenGL blend-factor selector using the destination color.
const GL_DST_COLOR=0x0306
/// OpenGL blend-factor selector using one minus the destination color.
const GL_ONE_MINUS_DST_COLOR=0x0307
/// OpenGL target for two-dimensional texture objects.
const GL_TEXTURE_2D=0x0de1
/// OpenGL capability selector controlling source/destination color blending.
const GL_BLEND=0x0be2
/// OpenGL capability selector controlling depth-buffer comparison.
const GL_DEPTH_TEST=0x0b71
/// OpenGL capability selector controlling face culling.
const GL_CULL_FACE=0x0b44
/// OpenGL capability selector for the first user-defined clipping plane.
const GL_CLIP_PLANE0=0x3000
/// OpenGL client-array selector for per-vertex colors.
const GL_COLOR_ARRAY=0x8076
/// OpenGL client-array selector for texture coordinates.
const GL_TEXTURE_COORD_ARRAY=0x8078
/// OpenGL client-array selector for vertex positions.
const GL_VERTEX_ARRAY=0x8074
/// OpenGL capability selector controlling alpha comparison.
const GL_ALPHA_TEST=0x0bc0
/// OpenGL capability selector controlling stencil comparison.
const GL_STENCIL_TEST=0x0b90

/// Data record for `mq3.platform.win_qgl_runtime.State`; groups `loaded`, `driver`, `logging`, `logCounter`, `logOpen`, `logLines`, and 1 further field.
struct State
  /// Whether the selected OpenGL driver library is loaded.
  loaded
  /// Graphics driver selected or loaded by the platform layer.
  driver
  /// Whether graphics or platform call logging is enabled.
  logging
  /// Number of frames or operations included in graphics-call logging.
  logCounter
  /// Whether the graphics-call log is open.
  logOpen
  /// Graphics-call log lines accumulated by the adapter.
  logLines
  /// Graphics entry-point calls recorded by the adapter.
  calls
end struct

/// Constructs `mq3.platform.win_qgl_runtime.State` with `loaded` = `false`, `driver` = `""`, `logging` = `false`, `logCounter` = `0` and the supplied remaining values.
function create() return State(false,"",false,0,false,[],[]) end function
/// Returns `"OUT OF RANGE FOR BOOLEAN"` from `mq3.platform.win_qgl_runtime.BooleanToString`; earlier branches return `"GL_FALSE"`, `"GL_TRUE"`.
/// @param value Input tested by `value==GL_FALSE`.
function BooleanToString(value) if value==GL_FALSE then return "GL_FALSE" end if;if value==GL_TRUE then return "GL_TRUE" end if;return "OUT OF RANGE FOR BOOLEAN" end function
/// Computes `FuncToString` from `"!!! UNKNOWN !!!"`.
/// @param value Input tested by `value==GL_ALWAYS`.
function FuncToString(value)
  if value==GL_ALWAYS then return "GL_ALWAYS" end if;if value==GL_NEVER then return "GL_NEVER" end if;if value==GL_LEQUAL then return "GL_LEQUAL" end if;if value==GL_LESS then return "GL_LESS" end if
  if value==GL_EQUAL then return "GL_EQUAL" end if;if value==GL_GREATER then return "GL_GREATER" end if;if value==GL_GEQUAL then return "GL_GEQUAL" end if;if value==GL_NOTEQUAL then return "GL_NOTEQUAL" end if;return "!!! UNKNOWN !!!"
end function
/// Computes `PrimToString` from `str(value)`.
/// @param value Input tested by `value==GL_TRIANGLES`.
function PrimToString(value)
  if value==GL_TRIANGLES then return "GL_TRIANGLES" end if;if value==GL_TRIANGLE_STRIP then return "GL_TRIANGLE_STRIP" end if;if value==GL_TRIANGLE_FAN then return "GL_TRIANGLE_FAN" end if
  if value==GL_QUADS then return "GL_QUADS" end if;if value==GL_QUAD_STRIP then return "GL_QUAD_STRIP" end if;if value==GL_POLYGON then return "GL_POLYGON" end if
  if value==GL_POINTS then return "GL_POINTS" end if;if value==GL_LINES then return "GL_LINES" end if;if value==GL_LINE_STRIP then return "GL_LINE_STRIP" end if;if value==GL_LINE_LOOP then return "GL_LINE_LOOP" end if;return str(value)
end function
/// Computes `CapToString` from `str(value)`.
/// @param value Input tested by `value==GL_TEXTURE_2D`.
function CapToString(value)
  if value==GL_TEXTURE_2D then return "GL_TEXTURE_2D" end if;if value==GL_BLEND then return "GL_BLEND" end if;if value==GL_DEPTH_TEST then return "GL_DEPTH_TEST" end if;if value==GL_CULL_FACE then return "GL_CULL_FACE" end if
  if value==GL_CLIP_PLANE0 then return "GL_CLIP_PLANE0" end if;if value==GL_COLOR_ARRAY then return "GL_COLOR_ARRAY" end if;if value==GL_TEXTURE_COORD_ARRAY then return "GL_TEXTURE_COORD_ARRAY" end if
  if value==GL_VERTEX_ARRAY then return "GL_VERTEX_ARRAY" end if;if value==GL_ALPHA_TEST then return "GL_ALPHA_TEST" end if;if value==GL_STENCIL_TEST then return "GL_STENCIL_TEST" end if;return str(value)
end function
/// Computes `TypeToString` from `"!!! UNKNOWN !!!"`.
/// @param value Input tested by `value==GL_BYTE`.
function TypeToString(value)
  if value==GL_BYTE then return "GL_BYTE" end if;if value==GL_UNSIGNED_BYTE then return "GL_UNSIGNED_BYTE" end if;if value==GL_SHORT then return "GL_SHORT" end if;if value==GL_UNSIGNED_SHORT then return "GL_UNSIGNED_SHORT" end if
  if value==GL_INT then return "GL_INT" end if;if value==GL_UNSIGNED_INT then return "GL_UNSIGNED_INT" end if;if value==GL_FLOAT then return "GL_FLOAT" end if;if value==GL_DOUBLE then return "GL_DOUBLE" end if;return "!!! UNKNOWN !!!"
end function
/// Computes `BlendToName` from `str(value)`.
/// @param value Input tested by `value==GL_ONE`.
function BlendToName(value)
  if value==GL_ONE then return "GL_ONE" end if;if value==GL_ZERO then return "GL_ZERO" end if;if value==GL_SRC_ALPHA then return "GL_SRC_ALPHA" end if;if value==GL_ONE_MINUS_SRC_ALPHA then return "GL_ONE_MINUS_SRC_ALPHA" end if
  if value==GL_DST_COLOR then return "GL_DST_COLOR" end if;if value==GL_ONE_MINUS_DST_COLOR then return "GL_ONE_MINUS_DST_COLOR" end if;if value==GL_DST_ALPHA then return "GL_DST_ALPHA" end if;return str(value)
end function
/// Computes `loadSucceeded` for `mq3.platform.win_qgl_runtime.GlideIsValid`.
/// @param loadSucceeded Input used in the result expression `loadSucceeded`.
function GlideIsValid(loadSucceeded) return loadSucceeded end function

/// Recognizes the eight optional multitexture, array-lock, swap-interval, and 3DFX-gamma entry points.
/// @param name Exact qgl/qwgl symbol name to classify as an optional extension entry.
function isExtensionEntry(name)
  return name=="qglActiveTextureARB" or name=="qglClientActiveTextureARB" or name=="qglMultiTexCoord2fARB" or name=="qglLockArraysEXT" or name=="qglUnlockArraysEXT" or name=="qwglSwapIntervalEXT" or name=="qwglGetDeviceGammaRamp3DFX" or name=="qwglSetDeviceGammaRamp3DFX"
end function
/// Updates `state.loaded`, `state.driver` in `mq3.platform.win_qgl_runtime.QGL_Init`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.loaded`, `state.driver`.
/// @param registry Argument 1 supplied to `mq3.renderer.qgl.reset`.
/// @param dllname Value assigned to `state.driver`.
/// @param loadSucceeded Input tested by `not loadSucceeded`.
function QGL_Init(state,registry,dllname,loadSucceeded)
  if state==void or registry==void or dllname=="" or state.loaded then return false end if
  if not loadSucceeded then return false end if
  qgl.reset(registry)
  for each name in qgl.coreEntryPoints() if not isExtensionEntry(name) then qgl.bind(registry,name,1,false) end if end for
  for each name in qgl.wglEntryPoints() if not isExtensionEntry(name) then qgl.bind(registry,name,1,false) end if end for
  if not qgl.activate(registry,dllname) then qgl.reset(registry);return false end if
  state.loaded=true;state.driver=dllname;return true
end function
/// Updates `state.loaded`, `state.driver`, `state.logging`, `state.logCounter`, `state.logOpen` in `mq3.platform.win_qgl_runtime.QGL_Shutdown`.
/// @param state Mutable record or buffer; this call updates `state.loaded`, `state.driver`, `state.logging`, `state.logCounter`, `state.logOpen`.
/// @param registry Argument 1 supplied to `mq3.renderer.qgl.reset`.
function QGL_Shutdown(state,registry)
  if state==void or registry==void then return void end if
  state.loaded=false;state.driver="";state.logging=false;state.logCounter=0;state.logOpen=false;qgl.reset(registry);return void
end function
/// Updates `state.logCounter`, `state.logging`, `state.logOpen`, `state.logLines` in `mq3.platform.win_qgl_runtime.QGL_EnableLogging`; returns `state.logging`.
/// @param state Mutable record or buffer; this call updates `state.logCounter`, `state.logging`, `state.logOpen`, `state.logLines`.
/// @param enable Value assigned to `state.logging`.
/// @param counter Value assigned to `state.logCounter`.
function QGL_EnableLogging(state,enable,counter)
  if state==void then return false end if
  if state.logging and enable then state.logCounter=counter-1;if state.logCounter>0 then return true end if;enable=false end if
  if not enable and not state.logging then return false end if
  state.logging=enable
  if enable then state.logCounter=counter;if not state.logOpen then state.logOpen=true;state.logLines=state.logLines+["QGL log opened"] end if end if
  return state.logging
end function
/// Updates `state.calls`, `state.logLines` in `mq3.platform.win_qgl_runtime.dispatch`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.calls`, `state.logLines`.
/// @param registry Argument 1 supplied to `mq3.renderer.qgl.has`.
/// @param name Argument 2 supplied to `mq3.renderer.qgl.has`.
/// @param arguments Input used by `state.calls=state.calls+[[name,arguments]]`.
function dispatch(state,registry,name,arguments)
  if state==void or registry==void or not state.loaded or not qgl.has(registry,name) then return false end if
  state.calls=state.calls+[[name,arguments]]
  if state.logging then state.logLines=state.logLines+[name] end if
  return true
end function

// The original declares one typed forwarding wrapper for every core GL call.
// MiniLang has managed arguments, so dispatch owns the common forwarding and
// logging semantics while this complete inventory preserves every entrypoint.
// win_qgl.c's logFoo wrappers are a one-to-one projection of qglFoo. Keeping
// the canonical qgl inventory as the source prevents the two 336-entry lists
// from silently diverging while retaining complete wrapper coverage.
function logFunctionNames()
  names=[]
  for each name in qgl.coreEntryPoints() if not isExtensionEntry(name) then names=names+[name] end if end for
  return names
end function
/// Lists the 7 declared names for `mq3.platform.win_qgl_runtime.helperFunctionNames`, including `BlendToName`, `BooleanToString`, `CapToString`, `FuncToString`.
function helperFunctionNames() return ["BlendToName","BooleanToString","CapToString","FuncToString","GlideIsValid","PrimToString","TypeToString"] end function
/// Lists the 3 declared names for `mq3.platform.win_qgl_runtime.lifecycleFunctionNames`, including `QGL_EnableLogging`, `QGL_Init`, `QGL_Shutdown`.
function lifecycleFunctionNames() return ["QGL_EnableLogging","QGL_Init","QGL_Shutdown"] end function

