// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Texture-unit selection and binding cache from renderer/tr_backend.c.
package mq3.renderer.texture_state

/// OpenGL target for two-dimensional texture objects.
const GL_TEXTURE_2D=0x0de1
/// OpenGL multitexture selector for texture unit 0.
const GL_TEXTURE0_ARB=0x84c0
/// OpenGL multitexture selector for texture unit 1.
const GL_TEXTURE1_ARB=0x84c1

/// Data record for `mq3.renderer.texture_state.Image`; groups `texnum`, `frameUsed`.
struct Image
  /// Graphics-driver texture object identifier.
  texnum
  /// Most recent renderer frame in which this image was used.
  frameUsed
end struct
/// Callback table for `mq3.renderer.texture_state.Services`; exposes `bindTextureFn`, `activeTextureFn`, `clientActiveTextureFn`, `logFn`, `warningFn`, `dropFn`, and 1 further field.
struct Services
  /// Host callback used to perform bind texture operations for this subsystem.
  bindTextureFn
  /// Host callback used to perform active texture operations for this subsystem.
  activeTextureFn
  /// Host callback used to perform client active texture operations for this subsystem.
  clientActiveTextureFn
  /// Host callback used to perform log operations for this subsystem.
  logFn
  /// Host callback used to perform warning operations for this subsystem.
  warningFn
  /// Host callback used to perform drop operations for this subsystem.
  dropFn
  /// Graphics-host state passed when binding textures, selecting texture units, or reporting state
  /// errors.
  context
end struct
/// Data record for `mq3.renderer.texture_state.State`; groups `currentTextures`, `currentTmu`, `defaultImage`, `dlightImage`, `noBind`, `frameCount`, and 1 further field.
struct State
  /// Texture object currently bound on each texture unit.
  currentTextures
  /// Index of the currently selected texture unit.
  currentTmu
  /// Fallback image used when a requested texture is unavailable.
  defaultImage
  /// Texture used when projecting dynamic-light contributions.
  dlightImage
  /// Debug setting that substitutes the selected debug texture for normal binds.
  noBind
  /// Sequence count of frames processed by this subsystem.
  frameCount
  /// Injected host operations used by this subsystem.
  services
end struct

/// Creates error `7200` with message `"texture state: "+message`.
/// @param message Input used in the result expression `error(7200,"texture state: "+message)`.
function fail(message) return error(7200,"texture state: "+message) end function
/// Constructs `mq3.renderer.texture_state.Services` with `bindTextureFn` = `void`, `activeTextureFn` = `void`, `clientActiveTextureFn` = `void`, `logFn` = `void` and the supplied remaining values.
function services() return Services(void,void,void,void,void,void,void) end function
/// Constructs `mq3.renderer.texture_state.Image` with `frameUsed` = `0` and the supplied remaining values.
/// @param texnum Initial value for `mq3.renderer.texture_state.Image.texnum`.
function image(texnum) return Image(texnum,0) end function

/// Builds `mq3.renderer.texture_state.State` for `mq3.renderer.texture_state.create`.
/// @param host Initial value for `mq3.renderer.texture_state.State.services`.
/// @param defaultImage Initial value for `mq3.renderer.texture_state.State.defaultImage`.
function create(host,defaultImage)
  if host==void then host=services() end if
  if defaultImage==void then return fail("default image is required") end if
  return State([0,0],0,defaultImage,void,false,0,host)
end function

/// Sends texture-state diagnostic text through the optional logging callback.
/// @param state Record providing `state.services`.
/// @param message Argument 2 supplied to `state.services.logFn`.
function emitLog(state,message)
  if state.services.logFn!=void then state.services.logFn(state.services.context,message) end if
end function

/// Updates `state.currentTmu` in `mq3.renderer.texture_state.selectTexture`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.currentTmu`.
/// @param unit Value assigned to `state.currentTmu`.
function selectTexture(state,unit)
  if state==void then return fail("missing state") end if
  if unit!=0 and unit!=1 then
    if state.services.dropFn!=void then state.services.dropFn(state.services.context,"GL_SelectTexture: unit = "+str(unit)) end if
    return fail("unit must be zero or one")
  end if
  if state.currentTmu==unit then return false end if
  value=GL_TEXTURE0_ARB;if unit==1 then value=GL_TEXTURE1_ARB end if
  if state.services.activeTextureFn!=void then state.services.activeTextureFn(state.services.context,value) end if
  emitLog(state,"glActiveTextureARB("+str(value)+")")
  if state.services.clientActiveTextureFn!=void then state.services.clientActiveTextureFn(state.services.context,value) end if
  emitLog(state,"glClientActiveTextureARB("+str(value)+")")
  state.currentTmu=unit
  return true
end function

/// Returns `state.defaultImage` from `mq3.renderer.texture_state.requestedImage`; earlier branches return `requested`.
/// @param state Record providing `state.services`, `state.defaultImage`.
/// @param requested Input tested by `requested!=void`.
function requestedImage(state,requested)
  if requested!=void then return requested end if
  if state.services.warningFn!=void then state.services.warningFn(state.services.context,"GL_Bind: NULL image") end if
  return state.defaultImage
end function

/// Updates `requested.frameUsed`, `state.currentTextures[unit]` in `mq3.renderer.texture_state.bind`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.currentTextures[unit]`.
/// @param requested Mutable record or buffer; this call updates `requested.frameUsed`.
function bind(state,requested)
  if state==void then return fail("missing state") end if
  selected=requestedImage(state,requested);texnum=selected.texnum
  if state.noBind and state.dlightImage!=void then texnum=state.dlightImage.texnum end if
  unit=state.currentTmu
  if state.currentTextures[unit]==texnum then return false end if
  // Baseq3 accounts the requested image even when r_nobind redirects the texnum.
  if requested!=void then requested.frameUsed=state.frameCount else selected.frameUsed=state.frameCount end if
  state.currentTextures[unit]=texnum
  if state.services.bindTextureFn!=void then state.services.bindTextureFn(state.services.context,GL_TEXTURE_2D,texnum) end if
  return true
end function

/// Updates `image1.frameUsed`, `state.currentTextures[1]`, `image0.frameUsed`, `state.currentTextures[0]` in `mq3.renderer.texture_state.bindMultitexture`; returns `changed`.
/// @param state Mutable record or buffer; this call updates `state.currentTextures[1]`, `state.currentTextures[0]`.
/// @param image0 Mutable record or buffer; this call updates `image0.frameUsed`.
/// @param env0 Unused compatibility argument retained by this entry point.
/// @param image1 Mutable record or buffer; this call updates `image1.frameUsed`.
/// @param env1 Unused compatibility argument retained by this entry point.
function bindMultitexture(state,image0,env0,image1,env1)
  if state==void or image0==void or image1==void then return fail("multitexture images are required") end if
  texnum0=image0.texnum;texnum1=image1.texnum
  if state.noBind and state.dlightImage!=void then texnum0=state.dlightImage.texnum;texnum1=texnum0 end if
  changed=0
  if state.currentTextures[1]!=texnum1 then
    selectTexture(state,1);image1.frameUsed=state.frameCount;state.currentTextures[1]=texnum1
    if state.services.bindTextureFn!=void then state.services.bindTextureFn(state.services.context,GL_TEXTURE_2D,texnum1) end if
    changed=changed+1
  end if
  if state.currentTextures[0]!=texnum0 then
    selectTexture(state,0);image0.frameUsed=state.frameCount;state.currentTextures[0]=texnum0
    if state.services.bindTextureFn!=void then state.services.bindTextureFn(state.services.context,GL_TEXTURE_2D,texnum0) end if
    changed=changed+1
  end if
  return changed
end function
