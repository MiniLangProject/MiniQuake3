// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete renderer-facing public ABI from code/cgame/tr_types.h.
package mq3.renderer.tr_types

/// Maximum number of dynamic lights represented by the renderer's light bit masks.
const MAX_DLIGHTS=32
/// Maximum number of scene entities accepted by the renderer interface.
const MAX_ENTITIES=1023
/// Entity-rendering flag that enforces a minimum ambient-light contribution.
const RF_MINLIGHT=1
/// Entity-rendering flag that hides the entity in first-person views.
const RF_THIRD_PERSON=2
/// Entity-rendering flag that draws the entity only in first-person views.
const RF_FIRST_PERSON=4
/// Entity-rendering flag that uses the shortened depth range for first-person weapons.
const RF_DEPTHHACK=8
/// Entity-rendering flag that suppresses shadow generation.
const RF_NOSHADOW=64
/// Entity-rendering flag selecting the supplied alternate lighting origin.
const RF_LIGHTING_ORIGIN=128
/// Entity-rendering flag that enables projection onto the supplied shadow plane.
const RF_SHADOW_PLANE=256
/// Entity-rendering flag allowing animation frames to wrap within the model's frame range.
const RF_WRAP_FRAMES=512
/// View flag that renders submitted entities without the BSP world model.
const RDF_NOWORLDMODEL=1
/// View flag selecting the special hyperspace rendering effect.
const RDF_HYPERSPACE=4

/// Renderer entity type for an animated or inline model.
const RT_MODEL=0
/// Renderer entity type for submitted polygon geometry.
const RT_POLY=1
/// Renderer entity type for a camera-facing sprite.
const RT_SPRITE=2
/// Renderer entity type for a beam between two endpoints.
const RT_BEAM=3
/// Renderer entity type for the core of a railgun trail.
const RT_RAIL_CORE=4
/// Renderer entity type for rings around a railgun trail.
const RT_RAIL_RINGS=5
/// Renderer entity type for the lightning-gun beam.
const RT_LIGHTNING=6
/// Renderer entity type carrying portal-view information without directly drawing geometry.
const RT_PORTALSURFACE=7
/// Exclusive upper bound of valid renderer entity types; not a drawable entity kind.
const RT_MAX_REF_ENTITY_TYPE=8

/// Number of text slots available to deform-text shaders in one view definition.
const MAX_RENDER_STRINGS=8
/// Character capacity of each deform-text shader string in the native view ABI.
const MAX_RENDER_STRING_LENGTH=32
/// Stereo-frame selector for the ordinary centered view.
const STEREO_CENTER=0
/// Stereo-frame selector for the left-eye view.
const STEREO_LEFT=1
/// Stereo-frame selector for the right-eye view.
const STEREO_RIGHT=2
/// Texture-compression mode indicating that textures remain uncompressed.
const TC_NONE=0
/// Texture-compression mode using the S3TC extension.
const TC_S3TC=1
/// Driver category for an OpenGL driver integrated with the window system.
const GLDRV_ICD=0
/// Driver category for a standalone OpenGL minidriver.
const GLDRV_STANDALONE=1
/// Driver category for the legacy standalone 3Dfx driver.
const GLDRV_VOODOO=2
/// Hardware category requiring no device-specific renderer workaround.
const GLHW_GENERIC=0
/// Hardware category selecting legacy integrated 3Dfx display workarounds.
const GLHW_3DFX_2D3D=1
/// Hardware category selecting RIVA 128 alpha-interpolation workarounds.
const GLHW_RIVA128=2
/// Hardware category selecting Rage Pro alpha-texture workarounds.
const GLHW_RAGEPRO=3
/// Hardware category selecting Permedia2 blending workarounds.
const GLHW_PERMEDIA2=4
/// Native library name used to load the legacy 3Dfx OpenGL driver.
const _3DFX_DRIVER_NAME="3dfxvgl"
/// Native library name used to load the standard Windows OpenGL driver.
const OPENGL_DRIVER_NAME="opengl32"

/// Data record for `mq3.renderer.tr_types.PolyVert`; groups `xyz`, `st`, `modulate`.
struct PolyVert
  /// Three-dimensional position of this vertex.
  xyz
  /// Two-dimensional texture coordinates associated with the vertex.
  st
  /// Per-vertex RGBA color bytes that modulate the sampled texture.
  modulate
end struct
/// Data record for `mq3.renderer.tr_types.Poly`; groups `hShader`, `numVerts`, `verts`.
struct Poly
  /// Registered shader handle used to draw the polygon.
  hShader
  /// Number of vertices stored in the polygon or model surface.
  numVerts
  /// Polygon vertex array supplied through the public renderer scene interface.
  verts
end struct
/// Data record for `mq3.renderer.tr_types.RefEntity`; groups `reType`, `renderfx`, `hModel`, `lightingOrigin`, `shadowPlane`, `axis`, and 14 further fields.
struct RefEntity
  /// Renderer entity type selecting the model, sprite, beam, or portal path.
  reType
  /// Bit mask of entity rendering options, such as depth hack or shadow suppression.
  renderfx
  /// Registered model handle used to obtain the entity's geometry.
  hModel
  /// Alternate position used to give multipart models consistent lighting.
  lightingOrigin
  /// Plane height onto which projection shadows are placed.
  shadowPlane
  /// Public entity orientation basis; nonNormalizedAxes indicates whether it also carries scale.
  axis
  /// Whether the orientation basis also contains scaling.
  nonNormalizedAxes
  /// World-space placement of the public render entity, also serving as the first endpoint for
  /// beam-like effects.
  origin
  /// Current model animation-frame index.
  frame
  /// Previous entity position used by interpolation or beam geometry.
  oldorigin
  /// Previous animation frame used for interpolation.
  oldframe
  /// Interpolation weight of the previous frame: zero selects current, one selects previous.
  backlerp
  /// Model skin index selected for this entity.
  skinNum
  /// Explicit skin handle overriding the model's default skin.
  customSkin
  /// Shader handle overriding the entity's normal surface shaders.
  customShader
  /// Entity RGBA color bytes used by entity-driven shader generators.
  shaderRGBA
  /// Entity texture-coordinate offset used by entity-driven texture modifiers.
  shaderTexCoord
  /// Time offset in seconds subtracted from the view time for entity shader effects.
  shaderTime
  /// Radius used for the light, sprite, beam, or bounded object.
  radius
  /// Sprite rotation angle in degrees.
  rotation
end struct
/// Data record for `mq3.renderer.tr_types.Refdef`; groups `x`, `y`, `width`, `height`, `fov_x`, `fov_y`, and 6 further fields.
struct Refdef
  /// Horizontal position of the view or drawing rectangle, in pixels.
  x
  /// Vertical position of the view or drawing rectangle, in pixels.
  y
  /// Width in pixels of the viewport supplied through the public renderer interface.
  width
  /// Height in pixels of the viewport supplied through the public renderer interface.
  height
  /// Horizontal camera field of view, in degrees.
  fov_x
  /// Vertical camera field of view, in degrees.
  fov_y
  /// Camera origin in world coordinates.
  vieworg
  /// Camera orientation represented by three basis vectors.
  viewaxis
  /// Scene timestamp in milliseconds supplied through the public renderer view definition.
  time
  /// Bit mask of view-level rendering options such as no-world or hyperspace rendering.
  rdflags
  /// Area-visibility mask; set bits suppress rendering of the associated areas.
  areamask
  /// Strings made available to deform-text shader stages for this view.
  text
end struct
/// Data record for `mq3.renderer.tr_types.Glconfig`; groups `renderer_string`, `vendor_string`, `version_string`, `extensions_string`, `maxTextureSize`, `maxActiveTextures`, and 15 further fields.
struct Glconfig
  /// Renderer identification string reported by OpenGL.
  renderer_string
  /// Vendor identification string reported by OpenGL.
  vendor_string
  /// Version string reported by OpenGL.
  version_string
  /// Space-separated extension names reported by OpenGL.
  extensions_string
  /// Largest supported texture dimension reported by the graphics driver.
  maxTextureSize
  /// Number of simultaneous texture units supported by the driver.
  maxActiveTextures
  /// Color-buffer precision in bits.
  colorBits
  /// Depth-buffer precision in bits.
  depthBits
  /// Stencil-buffer precision in bits.
  stencilBits
  /// Graphics-driver integration category used by platform compatibility handling.
  driverType
  /// Detected graphics-hardware family used to select compatibility behavior.
  hardwareType
  /// Whether the display supports hardware gamma-ramp updates.
  deviceSupportsGamma
  /// Selected texture-compression capability or mode.
  textureCompression
  /// Whether the driver supports additive texture-environment combining.
  textureEnvAddAvailable
  /// Width of the active video mode in pixels.
  vidWidth
  /// Height of the active video mode in pixels.
  vidHeight
  /// Physical display aspect ratio used to configure the renderer's projection.
  windowAspect
  /// Refresh frequency of the selected display mode, in hertz.
  displayFrequency
  /// Whether rendering occupies the full display.
  isFullscreen
  /// Whether stereoscopic drawing buffers are available and enabled.
  stereoEnabled
  /// Whether a separate render thread is currently active.
  smpActive
end struct

/// Lists the 10 declared names for `mq3.renderer.tr_types.typeNames`, including `polyVert_t`, `poly_t`, `refEntityType_t`, `refEntity_t`.
function typeNames() return ["polyVert_t","poly_t","refEntityType_t","refEntity_t","refdef_t","stereoFrame_t","textureCompression_t","glDriverType_t","glHardwareType_t","glconfig_t"] end function
/// Computes `value>=RT_MODEL and value<RT_MAX_REF_ENTITY_TYPE` for `mq3.renderer.tr_types.validRefEntityType`.
/// @param value Input used in the result expression `value>=RT_MODEL and value<RT_MAX_REF_ENTITY_TYPE`.
function validRefEntityType(value) return value>=RT_MODEL and value<RT_MAX_REF_ENTITY_TYPE end function
/// Returns `true` from `mq3.renderer.tr_types.visibleInView`; earlier branches return `false`.
/// @param renderfx Input tested by `(renderfx&RF_FIRST_PERSON)!=0 and isPortal`.
/// @param isPortal Input tested by `(renderfx&RF_FIRST_PERSON)!=0 and isPortal`.
function visibleInView(renderfx,isPortal)
  if (renderfx&RF_FIRST_PERSON)!=0 and isPortal then return false end if
  if (renderfx&RF_THIRD_PERSON)!=0 and not isPortal then return false end if
  return true
end function
/// Computes `(rdflags&RDF_NOWORLDMODEL)==0` for `mq3.renderer.tr_types.isWorldRequired`.
/// @param rdflags Input used in the result expression `(rdflags&RDF_NOWORLDMODEL)==0`.
function isWorldRequired(rdflags) return (rdflags&RDF_NOWORLDMODEL)==0 end function
