// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Windows QGL loader and logging lifecycle from code/win32/win_qgl.c.
package mq3.platform.win_qgl_runtime

import mq3.renderer.qgl as qgl

const GL_FALSE=0
const GL_TRUE=1
const GL_NEVER=0x0200
const GL_LESS=0x0201
const GL_EQUAL=0x0202
const GL_LEQUAL=0x0203
const GL_GREATER=0x0204
const GL_NOTEQUAL=0x0205
const GL_GEQUAL=0x0206
const GL_ALWAYS=0x0207
const GL_POINTS=0x0000
const GL_LINES=0x0001
const GL_LINE_LOOP=0x0002
const GL_LINE_STRIP=0x0003
const GL_TRIANGLES=0x0004
const GL_TRIANGLE_STRIP=0x0005
const GL_TRIANGLE_FAN=0x0006
const GL_QUADS=0x0007
const GL_QUAD_STRIP=0x0008
const GL_POLYGON=0x0009
const GL_BYTE=0x1400
const GL_UNSIGNED_BYTE=0x1401
const GL_SHORT=0x1402
const GL_UNSIGNED_SHORT=0x1403
const GL_INT=0x1404
const GL_UNSIGNED_INT=0x1405
const GL_FLOAT=0x1406
const GL_DOUBLE=0x140a
const GL_ZERO=0
const GL_ONE=1
const GL_SRC_ALPHA=0x0302
const GL_ONE_MINUS_SRC_ALPHA=0x0303
const GL_DST_ALPHA=0x0304
const GL_DST_COLOR=0x0306
const GL_ONE_MINUS_DST_COLOR=0x0307
const GL_TEXTURE_2D=0x0de1
const GL_BLEND=0x0be2
const GL_DEPTH_TEST=0x0b71
const GL_CULL_FACE=0x0b44
const GL_CLIP_PLANE0=0x3000
const GL_COLOR_ARRAY=0x8076
const GL_TEXTURE_COORD_ARRAY=0x8078
const GL_VERTEX_ARRAY=0x8074
const GL_ALPHA_TEST=0x0bc0
const GL_STENCIL_TEST=0x0b90

struct State loaded driver logging logCounter logOpen logLines calls end struct

function create() return State(false,"",false,0,false,[],[]) end function
function BooleanToString(value) if value==GL_FALSE then return "GL_FALSE" end if;if value==GL_TRUE then return "GL_TRUE" end if;return "OUT OF RANGE FOR BOOLEAN" end function
function FuncToString(value)
  if value==GL_ALWAYS then return "GL_ALWAYS" end if;if value==GL_NEVER then return "GL_NEVER" end if;if value==GL_LEQUAL then return "GL_LEQUAL" end if;if value==GL_LESS then return "GL_LESS" end if
  if value==GL_EQUAL then return "GL_EQUAL" end if;if value==GL_GREATER then return "GL_GREATER" end if;if value==GL_GEQUAL then return "GL_GEQUAL" end if;if value==GL_NOTEQUAL then return "GL_NOTEQUAL" end if;return "!!! UNKNOWN !!!"
end function
function PrimToString(value)
  if value==GL_TRIANGLES then return "GL_TRIANGLES" end if;if value==GL_TRIANGLE_STRIP then return "GL_TRIANGLE_STRIP" end if;if value==GL_TRIANGLE_FAN then return "GL_TRIANGLE_FAN" end if
  if value==GL_QUADS then return "GL_QUADS" end if;if value==GL_QUAD_STRIP then return "GL_QUAD_STRIP" end if;if value==GL_POLYGON then return "GL_POLYGON" end if
  if value==GL_POINTS then return "GL_POINTS" end if;if value==GL_LINES then return "GL_LINES" end if;if value==GL_LINE_STRIP then return "GL_LINE_STRIP" end if;if value==GL_LINE_LOOP then return "GL_LINE_LOOP" end if;return str(value)
end function
function CapToString(value)
  if value==GL_TEXTURE_2D then return "GL_TEXTURE_2D" end if;if value==GL_BLEND then return "GL_BLEND" end if;if value==GL_DEPTH_TEST then return "GL_DEPTH_TEST" end if;if value==GL_CULL_FACE then return "GL_CULL_FACE" end if
  if value==GL_CLIP_PLANE0 then return "GL_CLIP_PLANE0" end if;if value==GL_COLOR_ARRAY then return "GL_COLOR_ARRAY" end if;if value==GL_TEXTURE_COORD_ARRAY then return "GL_TEXTURE_COORD_ARRAY" end if
  if value==GL_VERTEX_ARRAY then return "GL_VERTEX_ARRAY" end if;if value==GL_ALPHA_TEST then return "GL_ALPHA_TEST" end if;if value==GL_STENCIL_TEST then return "GL_STENCIL_TEST" end if;return str(value)
end function
function TypeToString(value)
  if value==GL_BYTE then return "GL_BYTE" end if;if value==GL_UNSIGNED_BYTE then return "GL_UNSIGNED_BYTE" end if;if value==GL_SHORT then return "GL_SHORT" end if;if value==GL_UNSIGNED_SHORT then return "GL_UNSIGNED_SHORT" end if
  if value==GL_INT then return "GL_INT" end if;if value==GL_UNSIGNED_INT then return "GL_UNSIGNED_INT" end if;if value==GL_FLOAT then return "GL_FLOAT" end if;if value==GL_DOUBLE then return "GL_DOUBLE" end if;return "!!! UNKNOWN !!!"
end function
function BlendToName(value)
  if value==GL_ONE then return "GL_ONE" end if;if value==GL_ZERO then return "GL_ZERO" end if;if value==GL_SRC_ALPHA then return "GL_SRC_ALPHA" end if;if value==GL_ONE_MINUS_SRC_ALPHA then return "GL_ONE_MINUS_SRC_ALPHA" end if
  if value==GL_DST_COLOR then return "GL_DST_COLOR" end if;if value==GL_ONE_MINUS_DST_COLOR then return "GL_ONE_MINUS_DST_COLOR" end if;if value==GL_DST_ALPHA then return "GL_DST_ALPHA" end if;return str(value)
end function
function GlideIsValid(loadSucceeded) return loadSucceeded end function

function isExtensionEntry(name)
  return name=="qglActiveTextureARB" or name=="qglClientActiveTextureARB" or name=="qglMultiTexCoord2fARB" or name=="qglLockArraysEXT" or name=="qglUnlockArraysEXT" or name=="qwglSwapIntervalEXT" or name=="qwglGetDeviceGammaRamp3DFX" or name=="qwglSetDeviceGammaRamp3DFX"
end function
function QGL_Init(state,registry,dllname,loadSucceeded)
  if state==void or registry==void or dllname=="" or state.loaded then return false end if
  if not loadSucceeded then return false end if
  qgl.reset(registry)
  for each name in qgl.coreEntryPoints() if not isExtensionEntry(name) then qgl.bind(registry,name,1,false) end if end for
  for each name in qgl.wglEntryPoints() if not isExtensionEntry(name) then qgl.bind(registry,name,1,false) end if end for
  if not qgl.activate(registry,dllname) then qgl.reset(registry);return false end if
  state.loaded=true;state.driver=dllname;return true
end function
function QGL_Shutdown(state,registry)
  if state==void or registry==void then return void end if
  state.loaded=false;state.driver="";state.logging=false;state.logCounter=0;state.logOpen=false;qgl.reset(registry);return void
end function
function QGL_EnableLogging(state,enable,counter)
  if state==void then return false end if
  if state.logging and enable then state.logCounter=counter-1;if state.logCounter>0 then return true end if;enable=false end if
  if not enable and not state.logging then return false end if
  state.logging=enable
  if enable then state.logCounter=counter;if not state.logOpen then state.logOpen=true;state.logLines=state.logLines+["QGL log opened"] end if end if
  return state.logging
end function
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
function helperFunctionNames() return ["BlendToName","BooleanToString","CapToString","FuncToString","GlideIsValid","PrimToString","TypeToString"] end function
function lifecycleFunctionNames() return ["QGL_EnableLogging","QGL_Init","QGL_Shutdown"] end function

