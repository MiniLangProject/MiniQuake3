// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete renderer-facing public ABI from code/cgame/tr_types.h.
package mq3.renderer.tr_types

const MAX_DLIGHTS=32
const MAX_ENTITIES=1023
const RF_MINLIGHT=1
const RF_THIRD_PERSON=2
const RF_FIRST_PERSON=4
const RF_DEPTHHACK=8
const RF_NOSHADOW=64
const RF_LIGHTING_ORIGIN=128
const RF_SHADOW_PLANE=256
const RF_WRAP_FRAMES=512
const RDF_NOWORLDMODEL=1
const RDF_HYPERSPACE=4

const RT_MODEL=0
const RT_POLY=1
const RT_SPRITE=2
const RT_BEAM=3
const RT_RAIL_CORE=4
const RT_RAIL_RINGS=5
const RT_LIGHTNING=6
const RT_PORTALSURFACE=7
const RT_MAX_REF_ENTITY_TYPE=8

const MAX_RENDER_STRINGS=8
const MAX_RENDER_STRING_LENGTH=32
const STEREO_CENTER=0
const STEREO_LEFT=1
const STEREO_RIGHT=2
const TC_NONE=0
const TC_S3TC=1
const GLDRV_ICD=0
const GLDRV_STANDALONE=1
const GLDRV_VOODOO=2
const GLHW_GENERIC=0
const GLHW_3DFX_2D3D=1
const GLHW_RIVA128=2
const GLHW_RAGEPRO=3
const GLHW_PERMEDIA2=4
const _3DFX_DRIVER_NAME="3dfxvgl"
const OPENGL_DRIVER_NAME="opengl32"

/// Data record for `mq3.renderer.tr_types.PolyVert`; groups `xyz`, `st`, `modulate`.
struct PolyVert xyz st modulate end struct
/// Data record for `mq3.renderer.tr_types.Poly`; groups `hShader`, `numVerts`, `verts`.
struct Poly hShader numVerts verts end struct
/// Data record for `mq3.renderer.tr_types.RefEntity`; groups `reType`, `renderfx`, `hModel`, `lightingOrigin`, `shadowPlane`, `axis`, and 14 further fields.
struct RefEntity reType renderfx hModel lightingOrigin shadowPlane axis nonNormalizedAxes origin frame oldorigin oldframe backlerp skinNum customSkin customShader shaderRGBA shaderTexCoord shaderTime radius rotation end struct
/// Data record for `mq3.renderer.tr_types.Refdef`; groups `x`, `y`, `width`, `height`, `fov_x`, `fov_y`, and 6 further fields.
struct Refdef x y width height fov_x fov_y vieworg viewaxis time rdflags areamask text end struct
/// Data record for `mq3.renderer.tr_types.Glconfig`; groups `renderer_string`, `vendor_string`, `version_string`, `extensions_string`, `maxTextureSize`, `maxActiveTextures`, and 15 further fields.
struct Glconfig renderer_string vendor_string version_string extensions_string maxTextureSize maxActiveTextures colorBits depthBits stencilBits driverType hardwareType deviceSupportsGamma textureCompression textureEnvAddAvailable vidWidth vidHeight windowAspect displayFrequency isFullscreen stereoEnabled smpActive end struct

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
