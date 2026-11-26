// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native, stateful renderer back end corresponding to renderer/tr_backend.c.
// Hardware calls cross an injected services boundary; the retained renderer
// consumes the resulting batches, view state, uploads and frame transitions.
package mq3.renderer.tr_backend_runtime

import mq3.compat.numeric as n
import mq3.renderer.command_queue as commands
import mq3.renderer.draw_surfs as drawSurfs
import mq3.renderer.texture_state as textures
import mq3.renderer.tr_local as trLocal
import mq3.renderer.qgl as qgl

/// Cull type that keeps the front-facing side of a surface.
const CT_FRONT_SIDED=0
/// Cull type that keeps the back-facing side of a surface.
const CT_BACK_SIDED=1
/// Cull type that renders both sides of a surface.
const CT_TWO_SIDED=2
/// View flag that renders submitted entities without the BSP world model.
const RDF_NOWORLDMODEL=1
/// View flag selecting the special hyperspace rendering effect.
const RDF_HYPERSPACE=4
/// Entity-rendering flag that uses the shortened depth range for first-person weapons.
const RF_DEPTHHACK=8
/// Reserved entity number identifying static world geometry.
const ENTITYNUM_WORLD=1022
/// OpenGL texture-environment mode that multiplies texture color by incoming color.
const GL_MODULATE=0x2100
/// OpenGL texture-environment mode that applies the texture as a decal over incoming color.
const GL_DECAL=0x2101
/// OpenGL texture-environment mode that replaces incoming color with texture color.
const GL_REPLACE=0x1e01
/// OpenGL texture-environment mode that adds texture color to incoming color.
const GL_ADD=0x0104
/// Bit mask selecting the source blend-factor field in packed renderer state.
const GLS_SRCBLEND_BITS=trLocal.GLS_SRCBLEND_BITS
/// Bit mask selecting the destination blend-factor field in packed renderer state.
const GLS_DSTBLEND_BITS=trLocal.GLS_DSTBLEND_BITS
/// Packed-state flag enabling writes to the depth buffer.
const GLS_DEPTHMASK_TRUE=trLocal.GLS_DEPTHMASK_TRUE
/// Packed-state flag selecting wireframe polygon drawing.
const GLS_POLYMODE_LINE=trLocal.GLS_POLYMODE_LINE
/// Packed-state flag disabling depth-buffer comparison.
const GLS_DEPTHTEST_DISABLE=trLocal.GLS_DEPTHTEST_DISABLE
/// Packed-state flag requiring equality with the existing depth value.
const GLS_DEPTHFUNC_EQUAL=trLocal.GLS_DEPTHFUNC_EQUAL
/// Bit mask selecting the alpha-test mode in packed renderer state.
const GLS_ATEST_BITS=trLocal.GLS_ATEST_BITS
/// Packed alpha-test mode accepting fragments whose alpha is greater than zero.
const GLS_ATEST_GT_0=0x10000000
/// Packed alpha-test mode accepting fragments whose alpha is below one half.
const GLS_ATEST_LT_80=0x20000000
/// Packed alpha-test mode accepting fragments whose alpha is at least one half.
const GLS_ATEST_GE_80=0x40000000
/// Default packed renderer state, with depth-buffer writes enabled.
const GLS_DEFAULT=GLS_DEPTHMASK_TRUE

/// Data record for `mq3.renderer.tr_backend_runtime.GLState`; groups `faceCulling`, `texEnv`, `stateBits`, `depthEqual`, `blendEnabled`, `srcBlend`, and 6 further fields.
struct GLState
  /// Current front-face, back-face, or two-sided culling selection.
  faceCulling
  /// Texture-environment combine mode cached for each texture unit.
  texEnv
  /// Packed renderer flags specifying blending, depth, and alpha state.
  stateBits
  /// Whether depth testing accepts only fragments at the existing surface depth.
  depthEqual
  /// Whether framebuffer blending is enabled.
  blendEnabled
  /// Source factor used by framebuffer blending.
  srcBlend
  /// Destination factor used by framebuffer blending.
  dstBlend
  /// Whether drawing this pass writes to the depth buffer.
  depthWrite
  /// Whether polygon edges are drawn instead of filled triangles.
  wireframe
  /// Whether depth-buffer comparison is enabled.
  depthTest
  /// Alpha comparison used to reject fragments in this pass.
  alphaTest
  /// Whether the view reflects handedness across a portal or mirror plane.
  mirror
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.ViewParms`; groups `projectionMatrix`, `viewportX`, `viewportY`, `viewportWidth`, `viewportHeight`, `isPortal`, and 6 further fields.
struct ViewParms
  /// Matrix mapping view-space coordinates into clip space.
  projectionMatrix
  /// Horizontal origin of the viewport, in pixels.
  viewportX
  /// Vertical origin of the viewport, in pixels.
  viewportY
  /// Width of the viewport, in pixels.
  viewportWidth
  /// Height of the viewport, in pixels.
  viewportHeight
  /// Whether this view renders through a portal surface.
  isPortal
  /// Whether the view is reflected across a mirror surface.
  isMirror
  /// Normal of the plane clipping the portal view.
  portalNormal
  /// Signed distance of the plane clipping the portal view.
  portalDist
  /// Origin of the current model orientation.
  orientationOrigin
  /// Basis vectors of the current model orientation.
  orientationAxis
  /// Matrix transforming world coordinates for the current view.
  worldMatrix
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.Entity`; groups `shaderTime`, `renderfx`, `needDlights`, `modelMatrix`.
struct Entity
  /// Time offset in seconds subtracted from the view time for entity shader effects.
  shaderTime
  /// Bit mask of entity rendering options, such as depth hack or shadow suppression.
  renderfx
  /// Whether the entity must receive dynamic-light processing.
  needDlights
  /// Matrix placing the model in the current view or world coordinate system.
  modelMatrix
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.Refdef`; groups `time`, `floatTime`, `rdflags`, `entities`, `dlights`.
struct Refdef
  /// Backend view time in milliseconds, also converted to floating-point seconds for shader evaluation.
  time
  /// View time expressed in seconds for shader calculations.
  floatTime
  /// Bit mask of view-level rendering options such as no-world or hyperspace rendering.
  rdflags
  /// Entity records associated with the current world, scene, or snapshot.
  entities
  /// Dynamic lights submitted to the current scene.
  dlights
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.Shader`; groups `name`, `entityMergable`, `timeOffset`.
struct Shader
  /// Material name attached to the backend shader batch for identification and diagnostics.
  name
  /// Whether surfaces from separate entities may share one shader batch.
  entityMergable
  /// Offset in seconds applied to the material's shader time.
  timeOffset
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.Surface`; groups `sort`, `surface`.
struct Surface
  /// Packed draw-order key containing the shader, entity, fog, and dynamic-light selectors.
  sort
  /// Surface record, handle, or identifier associated with the drawing operation.
  surface
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.DrawPayload`; groups `refdef`, `viewParms`, `drawSurfs`, `shaders`.
struct DrawPayload
  /// Camera, viewport, timing, and rendering flags for the view.
  refdef
  /// Derived camera matrices, clipping planes, and viewport settings.
  viewParms
  /// Surfaces queued for ordering and drawing.
  drawSurfs
  /// Shader records available to resolve the queued drawing surfaces.
  shaders
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.RawUpload`; groups `client`, `width`, `height`, `pixels`, `fullUpload`, `dirty`.
struct RawUpload
  /// Cinematic client or scratch-image slot associated with the raw image.
  client
  /// Width in pixels of the raw or cinematic image being uploaded to its scratch texture.
  width
  /// Height in pixels of the raw or cinematic image being uploaded to its scratch texture.
  height
  /// Decoded pixel data for the image or upload.
  pixels
  /// Whether all image pixels must be uploaded to the graphics backend.
  fullUpload
  /// Whether the stored image differs from the graphics-driver copy.
  dirty
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.RawQuad`; groups `positions`, `texCoords`, `client`.
struct RawQuad
  /// Four screen-space corners used to draw an uploaded raw image or cinematic frame.
  positions
  /// Texture corners used to sample an uploaded raw image or cinematic frame.
  texCoords
  /// Cinematic client or scratch-image slot associated with the raw image.
  client
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.ImageInfo`; groups `image`, `uploadWidth`, `uploadHeight`.
struct ImageInfo
  /// Registered image reference included in the backend image-display listing.
  image
  /// Width in pixels of the image submitted to the graphics driver.
  uploadWidth
  /// Height in pixels of the image submitted to the graphics driver.
  uploadHeight
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.Command`; groups `id`, `payload`.
struct Command
  /// Command identifier selecting the renderer backend operation.
  id
  /// Operation-specific data interpreted according to the record's command or event type.
  payload
end struct
/// Callback table for `mq3.renderer.tr_backend_runtime.Services`; exposes `eventFn`, `surfaceFn`, `screenshotFn`, `sleepFn`, `context`.
struct Services
  /// Host callback used to perform event operations for this subsystem.
  eventFn
  /// Host callback used to perform surface operations for this subsystem.
  surfaceFn
  /// Host callback used to perform screenshot operations for this subsystem.
  screenshotFn
  /// Host callback used to perform sleep operations for this subsystem.
  sleepFn
  /// Render-backend host state supplied to event, surface, screenshot, and sleep callbacks.
  context
end struct
/// Data record for `mq3.renderer.tr_backend_runtime.State`; groups `textureState`, `gl`, `commandBackend`, `services`, `width`, `height`, and 19 further fields.
struct State
  /// Cached texture bindings and active texture-unit state.
  textureState
  /// Cached graphics state used by the renderer backend.
  gl
  /// Backend state used to execute queued renderer commands.
  commandBackend
  /// Injected host operations used by this subsystem.
  services
  /// Width in pixels of the framebuffer used to establish the backend 2D projection.
  width
  /// Height in pixels of the framebuffer used to establish the backend 2D projection.
  height
  /// Whether the backend currently uses its two-dimensional projection.
  projection2D
  /// Whether a graphics completion barrier was already issued for this frame.
  finishCalled
  /// Whether the special hyperspace rendering effect is active.
  isHyperspace
  /// Whether the sky pass has already been submitted for this view.
  skyRenderedThisView
  /// Index of the frame buffer shared between frontend and render thread.
  smpFrame
  /// Camera, viewport, timing, and rendering flags for the view.
  refdef
  /// Derived camera matrices, clipping planes, and viewport settings.
  viewParms
  /// Renderer entity representing static world geometry.
  worldEntity
  /// Renderer entity whose surfaces are currently being processed.
  currentEntity
  /// Shader currently selected for the tessellation buffer.
  tessShader
  /// Fog volume currently selected for the tessellation buffer.
  tessFog
  /// Dynamic-light state currently selected for the tessellation buffer.
  tessDlight
  /// Number of indices currently stored or submitted.
  numIndexes
  /// RGBA modulation color used for two-dimensional drawing.
  color2D
  /// Accumulated overdraw measurement for the rendered frame.
  overdraw
  /// Elapsed duration of the operation or frame, in milliseconds.
  msec
  /// Cinematic or raw image resources retained by the backend.
  rawImages
  /// Image uploads recorded or prepared by the backend.
  uploads
  /// Number of completed backend frames.
  frames
end struct

/// Creates error `7720` with message `"tr_backend: "+message`.
/// @param message Input used in the result expression `error(7720,"tr_backend: "+message)`.
function fail(message) return error(7720,"tr_backend: "+message) end function
/// Calls `len` with `(qgl.requiredEntryPoints())` and returns its result.
function qglRequiredCount() return len(qgl.requiredEntryPoints()) end function
/// Constructs `mq3.renderer.tr_backend_runtime.Services` with `eventFn` = `void`, `surfaceFn` = `void`, `screenshotFn` = `void`, `sleepFn` = `void` and the supplied remaining values.
function services() return Services(void,void,void,void,void) end function
/// Constructs `mq3.renderer.tr_backend_runtime.GLState` with `faceCulling` = `-1`, `texEnv` = `[0,0]`, `stateBits` = `0`, `depthEqual` = `false` and the supplied remaining values.
function glState() return GLState(-1,[0,0],0,false,false,0,0,true,false,true,0,false) end function
/// Returns `[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0]` for `mq3.renderer.tr_backend_runtime.identityMatrix`.
function identityMatrix() return [1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0] end function
/// Returns `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for `mq3.renderer.tr_backend_runtime.identityAxis`.
function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
/// Constructs `mq3.renderer.tr_backend_runtime.ViewParms` with `projectionMatrix` = `identityMatrix()`, `viewportX` = `0`, `viewportY` = `0`, `isPortal` = `false` and the supplied remaining values.
/// @param width Initial value for `mq3.renderer.tr_backend_runtime.ViewParms.viewportWidth`.
/// @param height Initial value for `mq3.renderer.tr_backend_runtime.ViewParms.viewportHeight`.
function viewParms(width,height) return ViewParms(identityMatrix(),0,0,width,height,false,false,[0.0,0.0,1.0],0.0,[0.0,0.0,0.0],identityAxis(),identityMatrix()) end function
/// Constructs `mq3.renderer.tr_backend_runtime.Refdef` with `time` = `0`, `floatTime` = `0.0`, `rdflags` = `0`, `entities` = `[]` and the supplied remaining values.
function refdef() return Refdef(0,0.0,0,[],[]) end function
/// Constructs `mq3.renderer.tr_backend_runtime.Entity` with `shaderTime` = `0.0`, `renderfx` = `0`, `needDlights` = `false`, `modelMatrix` = `identityMatrix()`.
function entity() return Entity(0.0,0,false,identityMatrix()) end function
/// Builds `mq3.renderer.tr_backend_runtime.State` using `mq3.renderer.command_queue.backend`.
/// @param textureState Initial value for `mq3.renderer.tr_backend_runtime.State.textureState`.
/// @param width Initial value for `mq3.renderer.tr_backend_runtime.State.width`.
/// @param height Initial value for `mq3.renderer.tr_backend_runtime.State.height`.
/// @param host Initial value for `mq3.renderer.tr_backend_runtime.State.services`.
function create(textureState,width,height,host)
  if textureState==void or width<=0 or height<=0 then return fail("texture state and positive dimensions are required") end if
  if host==void then host=services() end if
  commandState=commands.backend(void)
  return State(textureState,glState(),commandState,host,width,height,false,false,false,false,0,refdef(),viewParms(width,height),entity(),void,void,-1,0,0,commandState.color2D,0,0,[],[],0)
end function
/// Returns `void` from `mq3.renderer.tr_backend_runtime.emit`.
/// @param state Record providing `state.services`.
/// @param kind Argument 2 supplied to `state.services.eventFn`.
/// @param value Argument 3 supplied to `state.services.eventFn`.
function emit(state,kind,value)
  if state.services.eventFn!=void then state.services.eventFn(state.services.context,kind,value) end if
  return void
end function

// C-named texture facade.  These calls use the productive two-TMU cache.
/// @param state Record providing `state.textureState`.
/// @param image Argument 2 supplied to `mq3.renderer.texture_state.bind`.
function GL_Bind(state,image) return textures.bind(state.textureState,image) end function
/// Calls `mq3.renderer.texture_state.selectTexture` with `(state.textureState,unit)` and returns its result.
/// @param state Record providing `state.textureState`.
/// @param unit Argument 2 supplied to `mq3.renderer.texture_state.selectTexture`.
function GL_SelectTexture(state,unit) return textures.selectTexture(state.textureState,unit) end function
/// Calls `mq3.renderer.texture_state.bindMultitexture` with `(state.textureState,image0,env0,image1,env1)` and returns its result.
/// @param state Record providing `state.textureState`.
/// @param image0 Argument 2 supplied to `mq3.renderer.texture_state.bindMultitexture`.
/// @param env0 Argument 3 supplied to `mq3.renderer.texture_state.bindMultitexture`.
/// @param image1 Argument 4 supplied to `mq3.renderer.texture_state.bindMultitexture`.
/// @param env1 Argument 5 supplied to `mq3.renderer.texture_state.bindMultitexture`.
function GL_BindMultitexture(state,image0,env0,image1,env1) return textures.bindMultitexture(state.textureState,image0,env0,image1,env1) end function

/// Updates `state.gl.faceCulling` in `mq3.renderer.tr_backend_runtime.GL_Cull`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.gl.faceCulling`.
/// @param cullType Value assigned to `state.gl.faceCulling`.
function GL_Cull(state,cullType)
  if state==void or (cullType!=CT_FRONT_SIDED and cullType!=CT_BACK_SIDED and cullType!=CT_TWO_SIDED) then return fail("invalid cull mode") end if
  if state.gl.faceCulling==cullType then return false end if
  state.gl.faceCulling=cullType
  if cullType==CT_TWO_SIDED then emit(state,"cull",[false,0])
  else
    face=1
    if (cullType==CT_BACK_SIDED and not state.viewParms.isMirror) or (cullType==CT_FRONT_SIDED and state.viewParms.isMirror) then face=2 end if
    emit(state,"cull",[true,face])
  end if
  return true
end function

/// Updates `state.gl.texEnv[unit]` in `mq3.renderer.tr_backend_runtime.GL_TexEnv`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.gl.texEnv[unit]`.
/// @param env Value assigned to `state.gl.texEnv[unit]`.
function GL_TexEnv(state,env)
  if state==void then return fail("missing state") end if
  unit=state.textureState.currentTmu
  if env!=GL_MODULATE and env!=GL_REPLACE and env!=GL_DECAL and env!=GL_ADD then return fail("invalid texture environment") end if
  if state.gl.texEnv[unit]==env then return false end if
  state.gl.texEnv[unit]=env;emit(state,"texEnv",[unit,env]);return true
end function

/// Returns `error(7721,"invalid source blend bits")` from `mq3.renderer.tr_backend_runtime.srcFactor`; earlier branches return `value`.
/// @param bits Input used by `value=bits&GLS_SRCBLEND_BITS`.
function srcFactor(bits)
  value=bits&GLS_SRCBLEND_BITS;if value>=1 and value<=9 then return value end if;return error(7721,"invalid source blend bits")
end function
/// Returns `error(7721,"invalid destination blend bits")` from `mq3.renderer.tr_backend_runtime.dstFactor`; earlier branches return `value`.
/// @param bits Input used by `value=(bits&GLS_DSTBLEND_BITS)>>4`.
function dstFactor(bits)
  value=(bits&GLS_DSTBLEND_BITS)>>4;if value>=1 and value<=8 then return value end if;return error(7721,"invalid destination blend bits")
end function
/// Updates `state.gl.depthEqual`, `state.gl.blendEnabled`, `state.gl.srcBlend`, `state.gl.dstBlend`, `state.gl.depthWrite` in `mq3.renderer.tr_backend_runtime.GL_State`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.gl.depthEqual`, `state.gl.blendEnabled`, `state.gl.srcBlend`, `state.gl.dstBlend`, `state.gl.depthWrite`.
/// @param stateBits Value assigned to `state.gl.stateBits`.
function GL_State(state,stateBits)
  if state==void then return fail("missing state") end if
  diff=stateBits^state.gl.stateBits;if diff==0 then return false end if
  if (diff&GLS_DEPTHFUNC_EQUAL)!=0 then state.gl.depthEqual=(stateBits&GLS_DEPTHFUNC_EQUAL)!=0;emit(state,"depthFunc",state.gl.depthEqual) end if
  if (diff&(GLS_SRCBLEND_BITS|GLS_DSTBLEND_BITS))!=0 then
    if (stateBits&(GLS_SRCBLEND_BITS|GLS_DSTBLEND_BITS))!=0 then
      source=srcFactor(stateBits);if source is error then return source end if;destination=dstFactor(stateBits);if destination is error then return destination end if
      state.gl.blendEnabled=true;state.gl.srcBlend=source;state.gl.dstBlend=destination;emit(state,"blend",[source,destination])
    else state.gl.blendEnabled=false;emit(state,"blend",[0,0]) end if
  end if
  if (diff&GLS_DEPTHMASK_TRUE)!=0 then state.gl.depthWrite=(stateBits&GLS_DEPTHMASK_TRUE)!=0;emit(state,"depthMask",state.gl.depthWrite) end if
  if (diff&GLS_POLYMODE_LINE)!=0 then state.gl.wireframe=(stateBits&GLS_POLYMODE_LINE)!=0;emit(state,"wireframe",state.gl.wireframe) end if
  if (diff&GLS_DEPTHTEST_DISABLE)!=0 then state.gl.depthTest=(stateBits&GLS_DEPTHTEST_DISABLE)==0;emit(state,"depthTest",state.gl.depthTest) end if
  if (diff&GLS_ATEST_BITS)!=0 then
    mode=stateBits&GLS_ATEST_BITS;if mode!=0 and mode!=GLS_ATEST_GT_0 and mode!=GLS_ATEST_LT_80 and mode!=GLS_ATEST_GE_80 then return fail("invalid alpha-test bits") end if
    state.gl.alphaTest=mode;emit(state,"alphaTest",mode)
  end if
  state.gl.stateBits=stateBits;return true
end function

/// Updates `state.isHyperspace` in `mq3.renderer.tr_backend_runtime.RB_Hyperspace`; returns `c`.
/// @param state Mutable record or buffer; this call updates `state.isHyperspace`.
function RB_Hyperspace(state)
  c=(state.refdef.time&255)/255.0;emit(state,"clearColor",[c,c,c,1.0]);emit(state,"clear",["color"]);state.isHyperspace=true;return c
end function
/// Emits the current view's projection matrix, viewport rectangle, and matching scissor rectangle.
/// @param state Record providing `state.viewParms`.
function SetViewportAndScissor(state)
  view=state.viewParms;emit(state,"projection",view.projectionMatrix);emit(state,"viewport",[view.viewportX,view.viewportY,view.viewportWidth,view.viewportHeight]);emit(state,"scissor",[view.viewportX,view.viewportY,view.viewportWidth,view.viewportHeight]);return void
end function
/// Transforms the portal clipping plane into the current view orientation and origin.
/// @param view Record providing `view.portalNormal`, `view.orientationAxis`, `view.orientationOrigin`, `view.portalDist`.
function portalPlane(view)
  p=view.portalNormal;a=view.orientationAxis;o=view.orientationOrigin
  return [a[0][0]*p[0]+a[0][1]*p[1]+a[0][2]*p[2],a[1][0]*p[0]+a[1][1]*p[1]+a[1][2]*p[2],a[2][0]*p[0]+a[2][1]*p[1]+a[2][2]*p[2],p[0]*o[0]+p[1]*o[1]+p[2]*o[2]-view.portalDist]
end function
/// Updates `state.finishCalled`, `state.projection2D`, `state.commandBackend.projection2D`, `state.isHyperspace`, `state.gl.faceCulling` in `mq3.renderer.tr_backend_runtime.RB_BeginDrawingView`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.finishCalled`, `state.projection2D`, `state.commandBackend.projection2D`, `state.isHyperspace`, `state.gl.faceCulling`.
/// @param finishMode Input tested by `finishMode==1 and not state.finishCalled`.
/// @param measureOverdraw Input tested by `measureOverdraw or shadowMode==2`.
/// @param shadowMode Input tested by `measureOverdraw or shadowMode==2`.
/// @param fastSky Input tested by `fastSky and (state.refdef.rdflags&RDF_NOWORLDMODEL)==0`.
function RB_BeginDrawingView(state,finishMode,measureOverdraw,shadowMode,fastSky)
  if finishMode==1 and not state.finishCalled then emit(state,"finish",void);state.finishCalled=true end if
  if finishMode==0 then state.finishCalled=true end if
  state.projection2D=false;state.commandBackend.projection2D=false;SetViewportAndScissor(state);GL_State(state,GLS_DEFAULT)
  clear=["depth"];if measureOverdraw or shadowMode==2 then clear=clear+["stencil"] end if;if fastSky and (state.refdef.rdflags&RDF_NOWORLDMODEL)==0 then emit(state,"clearColor",[0.0,0.0,0.0,1.0]);clear=clear+["color"] end if;emit(state,"clear",clear)
  if (state.refdef.rdflags&RDF_HYPERSPACE)!=0 then RB_Hyperspace(state);return false end if
  state.isHyperspace=false;state.gl.faceCulling=-1;state.skyRenderedThisView=false
  if state.viewParms.isPortal then emit(state,"clipPlane",portalPlane(state.viewParms)) else emit(state,"clipPlane",void) end if
  return true
end function

/// Updates `state.numIndexes` in `mq3.renderer.tr_backend_runtime.endSurface`.
/// @param state Mutable record or buffer; this call updates `state.numIndexes`.
function endSurface(state)
  if state.tessShader!=void then emit(state,"endSurface",[state.tessShader.name,state.tessFog,state.tessDlight,state.numIndexes]) end if
  state.numIndexes=0;return void
end function
/// Updates `state.tessShader`, `state.tessFog`, `state.tessDlight`, `state.numIndexes` in `mq3.renderer.tr_backend_runtime.beginSurface`.
/// @param state Mutable record or buffer; this call updates `state.tessShader`, `state.tessFog`, `state.tessDlight`, `state.numIndexes`.
/// @param shader Record providing `shader.name`.
/// @param fog Value assigned to `state.tessFog`.
/// @param dlight Value assigned to `state.tessDlight`.
function beginSurface(state,shader,fog,dlight)
  state.tessShader=shader;state.tessFog=fog;state.tessDlight=dlight;state.numIndexes=0;emit(state,"beginSurface",[shader.name,fog,dlight]);return void
end function
/// Returns `state.refdef.entities[index]` from `mq3.renderer.tr_backend_runtime.entityAt`; earlier branches return `state.worldEntity`.
/// @param state Record providing `state.refdef`, `state.worldEntity`.
/// @param index Input tested by `index<0 or index>=len(state.refdef.entities)`.
function entityAt(state,index)
  if index<0 or index>=len(state.refdef.entities) then return state.worldEntity end if;return state.refdef.entities[index]
end function
/// Updates `state.numIndexes`, `state.currentEntity`, `state.refdef.floatTime` in `mq3.renderer.tr_backend_runtime.RB_RenderDrawSurfList`; returns `rendered`.
/// @param state Mutable record or buffer; this call updates `state.numIndexes`, `state.currentEntity`, `state.refdef.floatTime`.
/// @param surfaces Sequence traversed as `item` while producing this result.
/// @param shaders Indexed input read at `fields.shaderIndex`.
/// @param finishMode Value forwarded as `finishMode` to `mq3.renderer.tr_backend_runtime.RB_BeginDrawingView`.
/// @param measureOverdraw Value forwarded as `measureOverdraw` to `mq3.renderer.tr_backend_runtime.RB_BeginDrawingView`.
/// @param shadowMode Value forwarded as `shadowMode` to `mq3.renderer.tr_backend_runtime.RB_BeginDrawingView`.
/// @param fastSky Value forwarded as `fastSky` to `mq3.renderer.tr_backend_runtime.RB_BeginDrawingView`.
function RB_RenderDrawSurfList(state,surfaces,shaders,finishMode,measureOverdraw,shadowMode,fastSky)
  if surfaces==void or shaders==void then return fail("draw surfaces and shaders are required") end if
  if not RB_BeginDrawingView(state,finishMode,measureOverdraw,shadowMode,fastSky) then return 0 end if
  originalTime=state.refdef.floatTime;oldSort=-1;oldEntity=-1;oldShader=void;oldFog=-1;oldDlight=-1;depthRange=false;rendered=0
  for each item in surfaces
    if item.sort==oldSort then
      if state.services.surfaceFn!=void then state.services.surfaceFn(state.services.context,item.surface) end if;state.numIndexes=state.numIndexes+1;rendered=rendered+1
    else
      oldSort=item.sort;fields=drawSurfs.decompose(item.sort)
      if fields.shaderIndex<0 or fields.shaderIndex>=len(shaders) then return fail("shader index outside table") end if;shader=shaders[fields.shaderIndex]
      if shader!=oldShader or fields.fogNum!=oldFog or fields.dlightMap!=oldDlight or (fields.entityNum!=oldEntity and not shader.entityMergable) then
        if oldShader!=void then endSurface(state) end if;beginSurface(state,shader,fields.fogNum,fields.dlightMap);oldShader=shader;oldFog=fields.fogNum;oldDlight=fields.dlightMap
      end if
      if fields.entityNum!=oldEntity then
        depthRange=false
        if fields.entityNum!=ENTITYNUM_WORLD then
          current=entityAt(state,fields.entityNum);state.currentEntity=current;state.refdef.floatTime=originalTime-current.shaderTime;emit(state,"modelMatrix",current.modelMatrix);if current.needDlights then emit(state,"transformDlights",len(state.refdef.dlights)) end if;if (current.renderfx&RF_DEPTHHACK)!=0 then depthRange=true end if
        else state.currentEntity=state.worldEntity;state.refdef.floatTime=originalTime;emit(state,"modelMatrix",state.viewParms.worldMatrix);emit(state,"transformDlights",len(state.refdef.dlights)) end if
        emit(state,"shaderTime",state.refdef.floatTime-shader.timeOffset);emit(state,"depthRange",depthRange);oldEntity=fields.entityNum
      end if
      if state.services.surfaceFn!=void then state.services.surfaceFn(state.services.context,item.surface) end if;state.numIndexes=state.numIndexes+1;rendered=rendered+1
    end if
  end for
  state.refdef.floatTime=originalTime;if oldShader!=void then endSurface(state) end if;emit(state,"modelMatrix",state.viewParms.worldMatrix);if depthRange then emit(state,"depthRange",false) end if;emit(state,"shadowFinish",void);emit(state,"renderFlares",void);return rendered
end function

/// Updates `state.projection2D`, `state.commandBackend.projection2D`, `state.refdef.time`, `state.refdef.floatTime` in `mq3.renderer.tr_backend_runtime.RB_SetGL2D`.
/// @param state Mutable record or buffer; this call updates `state.projection2D`, `state.commandBackend.projection2D`, `state.refdef.time`, `state.refdef.floatTime`.
/// @param now Value assigned to `state.refdef.time`.
function RB_SetGL2D(state,now)
  state.projection2D=true;state.commandBackend.projection2D=true;emit(state,"viewport",[0,0,state.width,state.height]);emit(state,"ortho",[0,state.width,state.height,0,0,1]);GL_State(state,GLS_DEPTHTEST_DISABLE|5|0x60);emit(state,"cull",[false,0]);emit(state,"clipPlane",void);state.refdef.time=now;state.refdef.floatTime=now*0.001;return void
end function
/// Computes `value>0 and (value&(value-1))==0` for `mq3.renderer.tr_backend_runtime.powerOfTwo`.
/// @param value Input used in the result expression `value>0 and (value&(value-1))==0`.
function powerOfTwo(value) return value>0 and (value&(value-1))==0 end function
/// Updates `state.rawImages`, `state.rawImages[client]`, `state.uploads` in `mq3.renderer.tr_backend_runtime.uploadRaw`; returns `full or dirty`.
/// @param state Mutable record or buffer; this call updates `state.rawImages`, `state.rawImages[client]`, `state.uploads`.
/// @param w Unused compatibility argument retained by this entry point.
/// @param h Unused compatibility argument retained by this entry point.
/// @param cols Value forwarded as `value` to `mq3.renderer.tr_backend_runtime.powerOfTwo`.
/// @param rows Value forwarded as `value` to `mq3.renderer.tr_backend_runtime.powerOfTwo`.
/// @param data Value used for `mq3.renderer.tr_backend_runtime.RawUpload.pixels`.
/// @param client Value used for `mq3.renderer.tr_backend_runtime.RawUpload.client`.
/// @param dirty Value used for `mq3.renderer.tr_backend_runtime.RawUpload.dirty`.
/// @param requirePowerOfTwo Input tested by `requirePowerOfTwo and (not powerOfTwo(cols) or not powerOfTwo(rows))`.
function uploadRaw(state,w,h,cols,rows,data,client,dirty,requirePowerOfTwo)
  if state==void or cols<=0 or rows<=0 or client<0 then return fail("invalid cinematic upload") end if
  if requirePowerOfTwo and (not powerOfTwo(cols) or not powerOfTwo(rows)) then return fail("cinematic size must be power of two") end if
  while len(state.rawImages)<=client state.rawImages=state.rawImages+[void] end while
  previous=state.rawImages[client];full=previous==void or previous.uploadWidth!=cols or previous.uploadHeight!=rows
  image=ImageInfo(void,cols,rows);state.rawImages[client]=image
  if full or dirty then state.uploads=state.uploads+[RawUpload(client,cols,rows,data,full,dirty)] end if
  return full or dirty
end function
/// Calls `mq3.renderer.tr_backend_runtime.uploadRaw` with `(state,w,h,cols,rows,data,client,dirty,false)` and returns its result.
/// @param state Value forwarded as `state` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param w Value forwarded as `w` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param h Value forwarded as `h` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param cols Value forwarded as `cols` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param rows Value forwarded as `rows` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param data Value forwarded as `data` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param client Value forwarded as `client` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param dirty Value forwarded as `dirty` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
function RE_UploadCinematic(state,w,h,cols,rows,data,client,dirty) return uploadRaw(state,w,h,cols,rows,data,client,dirty,false) end function
/// Uploads raw cinematic pixels, switches to 2D projection, and emits a half-texel-corrected screen quad.
/// @param state Value forwarded as `state` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param x Input used by `quad=RawQuad([[x,y],[x+w,y],[x+w,y+h],[x,y+h]],[[0.5/cols,0.5/rows],[(cols-0.5)/cols,0.5/rows],[(cols-0.5)/cols,(rows-0.5)/rows],[0.5/cols,(rows-0.5)/rows]],client)`.
/// @param y Input used by `quad=RawQuad([[x,y],[x+w,y],[x+w,y+h],[x,y+h]],[[0.5/cols,0.5/rows],[(cols-0.5)/cols,0.5/rows],[(cols-0.5)/cols,(rows-0.5)/rows],[0.5/cols,(rows-0.5)/rows]],client)`.
/// @param w Value forwarded as `w` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param h Value forwarded as `h` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param cols Value forwarded as `cols` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param rows Value forwarded as `rows` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param data Value forwarded as `data` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param client Value forwarded as `client` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param dirty Value forwarded as `dirty` to `mq3.renderer.tr_backend_runtime.uploadRaw`.
/// @param now Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_SetGL2D`.
function RE_StretchRaw(state,x,y,w,h,cols,rows,data,client,dirty,now)
  uploaded=uploadRaw(state,w,h,cols,rows,data,client,dirty,true);if uploaded is error then return uploaded end if;RB_SetGL2D(state,now)
  quad=RawQuad([[x,y],[x+w,y],[x+w,y+h],[x,y+h]],[[0.5/cols,0.5/rows],[(cols-0.5)/cols,0.5/rows],[(cols-0.5)/cols,(rows-0.5)/rows],[0.5/cols,(rows-0.5)/rows]],client);emit(state,"rawQuad",quad);return quad
end function

/// Updates `state.color2D` in `mq3.renderer.tr_backend_runtime.RB_SetColor`; returns `state.color2D`.
/// @param state Mutable record or buffer; this call updates `state.color2D`.
/// @param command Argument 2 supplied to `mq3.renderer.command_queue.executeSetColor`.
function RB_SetColor(state,command)
  commands.executeSetColor(state.commandBackend,command);state.color2D=state.commandBackend.color2D;return state.color2D
end function
/// Updates `state.numIndexes`, `state.tessShader` in `mq3.renderer.tr_backend_runtime.RB_StretchPic`; returns `1`.
/// @param state Mutable record or buffer; this call updates `state.numIndexes`, `state.tessShader`.
/// @param command Record providing `command.shader`.
/// @param now Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_SetGL2D`.
function RB_StretchPic(state,command,now)
  if not state.projection2D then RB_SetGL2D(state,now) end if
  commands.executeStretchPic(state.commandBackend,command);state.numIndexes=state.commandBackend.numIndexes;state.tessShader=command.shader;return 1
end function
/// Updates `state.refdef`, `state.viewParms` in `mq3.renderer.tr_backend_runtime.RB_DrawSurfs`.
/// @param state Mutable record or buffer; this call updates `state.refdef`, `state.viewParms`.
/// @param command Record providing `command.payload`.
/// @param finishMode Value forwarded as `finishMode` to `mq3.renderer.tr_backend_runtime.RB_RenderDrawSurfList`.
/// @param measureOverdraw Value forwarded as `measureOverdraw` to `mq3.renderer.tr_backend_runtime.RB_RenderDrawSurfList`.
/// @param shadowMode Value forwarded as `shadowMode` to `mq3.renderer.tr_backend_runtime.RB_RenderDrawSurfList`.
/// @param fastSky Value forwarded as `fastSky` to `mq3.renderer.tr_backend_runtime.RB_RenderDrawSurfList`.
function RB_DrawSurfs(state,command,finishMode,measureOverdraw,shadowMode,fastSky)
  if state.numIndexes>0 then endSurface(state) end if;payload=command.payload;state.refdef=payload.refdef;state.viewParms=payload.viewParms;return RB_RenderDrawSurfList(state,payload.drawSurfs,payload.shaders,finishMode,measureOverdraw,shadowMode,fastSky)
end function
/// Returns `true` from `mq3.renderer.tr_backend_runtime.RB_DrawBuffer`.
/// @param state Value forwarded as `state` to `mq3.renderer.tr_backend_runtime.emit`.
/// @param command Record providing `command.payload`.
/// @param clearDebug Input tested by `clearDebug`.
function RB_DrawBuffer(state,command,clearDebug)
  emit(state,"drawBuffer",command.payload);if clearDebug then emit(state,"clearColor",[1.0,0.0,0.5,1.0]);emit(state,"clear",["color","depth"]) end if;return true
end function
/// Builds a 20-by-15 image-inspection grid, optionally scaling each tile by uploaded texture dimensions.
/// @param state Record providing `state.projection2D`, `state.width`, `state.height`.
/// @param images Indexed input read at `index`.
/// @param mode Input tested by `mode==2`.
/// @param now Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_SetGL2D`.
function RB_ShowImages(state,images,mode,now)
  if not state.projection2D then RB_SetGL2D(state,now) end if;emit(state,"clear",["color"]);result=[];cellW=state.width/20;cellH=state.height/15
  for index=0 to len(images)-1 info=images[index];w=cellW;h=cellH;if mode==2 then w=w*info.uploadWidth/512.0;h=h*info.uploadHeight/512.0 end if;x=(index%20)*cellW;y=n.quotient(index,20)*cellH;result=result+[RawQuad([[x,y],[x+w,y],[x+w,y+h],[x,y+h]],[[0.0,0.0],[1.0,0.0],[1.0,1.0],[0.0,1.0]],index)] end for
  emit(state,"showImages",result);return result
end function
/// Updates `state.overdraw`, `state.projection2D`, `state.commandBackend.projection2D`, `state.frames` in `mq3.renderer.tr_backend_runtime.RB_SwapBuffers`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.overdraw`, `state.projection2D`, `state.commandBackend.projection2D`, `state.frames`.
/// @param command Unused compatibility argument retained by this entry point.
/// @param showImages Value forwarded as `mode` to `mq3.renderer.tr_backend_runtime.RB_ShowImages`.
/// @param images Value forwarded as `images` to `mq3.renderer.tr_backend_runtime.RB_ShowImages`.
/// @param measureOverdraw Input tested by `measureOverdraw`.
/// @param stencil Sequence traversed as `value` while producing this result.
/// @param now Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_ShowImages`.
function RB_SwapBuffers(state,command,showImages,images,measureOverdraw,stencil,now)
  if state.numIndexes>0 then endSurface(state) end if;if showImages!=0 then RB_ShowImages(state,images,showImages,now) end if
  if measureOverdraw then sum=0;for each value in stencil sum=sum+value end for;state.overdraw=state.overdraw+sum end if
  if not state.finishCalled then emit(state,"finish",void) end if;emit(state,"endFrame",void);state.projection2D=false;state.commandBackend.projection2D=false;state.frames=state.frames+1;return true
end function

/// Updates `state.smpFrame`, `state.msec` in `mq3.renderer.tr_backend_runtime.RB_ExecuteRenderCommands`; returns `count`.
/// @param state Mutable record or buffer; this call updates `state.smpFrame`, `state.msec`.
/// @param stream Sequence traversed as `command` while producing this result.
/// @param smpEnabled Input tested by `smpEnabled and secondBuffer`.
/// @param secondBuffer Input tested by `smpEnabled and secondBuffer`.
/// @param now Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_StretchPic`.
function RB_ExecuteRenderCommands(state,stream,smpEnabled,secondBuffer,now)
  if state==void or stream==void then return fail("state and command stream are required") end if;state.smpFrame=0;if smpEnabled and secondBuffer then state.smpFrame=1 end if;count=0
  for each command in stream
    if command.id==commands.RC_SET_COLOR then RB_SetColor(state,command.payload)
    else if command.id==commands.RC_STRETCH_PIC then RB_StretchPic(state,command.payload,now)
    else if command.id==commands.RC_DRAW_SURFS then RB_DrawSurfs(state,command,0,false,0,false)
    else if command.id==commands.RC_DRAW_BUFFER then RB_DrawBuffer(state,command,false)
    else if command.id==commands.RC_SWAP_BUFFERS then RB_SwapBuffers(state,command,0,[],false,[],now)
    else if command.id==commands.RC_SCREENSHOT then if state.services.screenshotFn!=void then state.services.screenshotFn(state.services.context,command.payload) end if
    else state.msec=0;return count
    end if;count=count+1
  end for
  state.msec=0;return count
end function
/// Returns `count` from `mq3.renderer.tr_backend_runtime.RB_RenderThread`; earlier branches return `0`, `count`.
/// @param state Value forwarded as `state` to `mq3.renderer.tr_backend_runtime.RB_ExecuteRenderCommands`.
/// @param streams Sequence traversed as `stream` while producing this result.
/// @param smpEnabled Value forwarded as `smpEnabled` to `mq3.renderer.tr_backend_runtime.RB_ExecuteRenderCommands`.
/// @param now Value forwarded as `now` to `mq3.renderer.tr_backend_runtime.RB_ExecuteRenderCommands`.
function RB_RenderThread(state,streams,smpEnabled,now)
  if streams==void then return 0 end if;count=0;for each stream in streams if stream==void then return count end if;RB_ExecuteRenderCommands(state,stream,smpEnabled,count%2==1,now);count=count+1 end for;return count
end function
