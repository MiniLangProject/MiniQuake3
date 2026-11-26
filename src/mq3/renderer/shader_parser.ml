// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Material and stage-script parsing from renderer/tr_shader.c.
package mq3.renderer.shader_parser
import mq3.compat.numeric as n
import mq3.compat.textnumbers as numbers
import mq3.renderer.shader_index as shaderIndex
import mq3.shared.parser as parser
import std.string as strings

/// Packed renderer-state value selecting zero as the source blend factor.
const GLS_SRCBLEND_ZERO=1
/// Packed renderer-state value selecting one as the source blend factor.
const GLS_SRCBLEND_ONE=2
/// Packed renderer-state value selecting the destination color as the source blend factor.
const GLS_SRCBLEND_DST_COLOR=3
/// Packed renderer-state value selecting one minus the destination color as the source blend factor.
const GLS_SRCBLEND_ONE_MINUS_DST_COLOR=4
/// Packed renderer-state value selecting the source alpha as the source blend factor.
const GLS_SRCBLEND_SRC_ALPHA=5
/// Packed renderer-state value selecting one minus the source alpha as the source blend factor.
const GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA=6
/// Packed renderer-state value selecting the destination alpha as the source blend factor.
const GLS_SRCBLEND_DST_ALPHA=7
/// Packed renderer-state value selecting one minus the destination alpha as the source blend factor.
const GLS_SRCBLEND_ONE_MINUS_DST_ALPHA=8
/// Packed renderer-state value selecting the smaller of source alpha and one minus destination alpha as
/// the source blend factor.
const GLS_SRCBLEND_ALPHA_SATURATE=9
/// Packed renderer-state value selecting zero as the destination blend factor.
const GLS_DSTBLEND_ZERO=16
/// Packed renderer-state value selecting one as the destination blend factor.
const GLS_DSTBLEND_ONE=32
/// Packed renderer-state value selecting the source color as the destination blend factor.
const GLS_DSTBLEND_SRC_COLOR=48
/// Packed renderer-state value selecting one minus the source color as the destination blend factor.
const GLS_DSTBLEND_ONE_MINUS_SRC_COLOR=64
/// Packed renderer-state value selecting the source alpha as the destination blend factor.
const GLS_DSTBLEND_SRC_ALPHA=80
/// Packed renderer-state value selecting one minus the source alpha as the destination blend factor.
const GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA=96
/// Packed renderer-state value selecting the destination alpha as the destination blend factor.
const GLS_DSTBLEND_DST_ALPHA=112
/// Packed renderer-state value selecting one minus the destination alpha as the destination blend
/// factor.
const GLS_DSTBLEND_ONE_MINUS_DST_ALPHA=128
/// Packed-state flag enabling writes to the depth buffer.
const GLS_DEPTHMASK_TRUE=256
/// Packed-state flag requiring equality with the existing depth value.
const GLS_DEPTHFUNC_EQUAL=131072
/// Packed alpha-test mode accepting fragments whose alpha is greater than zero.
const GLS_ATEST_GT_0=268435456
/// Packed alpha-test mode accepting fragments whose alpha is below one half.
const GLS_ATEST_LT_80=536870912
/// Packed alpha-test mode accepting fragments whose alpha is at least one half.
const GLS_ATEST_GE_80=1073741824
/// Maximum number of texture and color stages retained in one shader.
const MAX_SHADER_STAGES=8
/// Maximum number of texture-coordinate modifiers accepted by one shader stage.
const TR_MAX_TEXMODS=4
/// Maximum number of images in an animated shader map.
const MAX_IMAGE_ANIMATIONS=8

/// Data record for `mq3.renderer.shader_parser.Wave`; groups `func`, `base`, `amplitude`, `phase`, `frequency`.
struct Wave
  /// Waveform function selected for the shader effect.
  func
  /// Constant value around which the waveform oscillates.
  base
  /// Magnitude by which the waveform varies around its base value.
  amplitude
  /// Offset applied to the waveform's periodic phase.
  phase
  /// Number of waveform cycles per second.
  frequency
end struct
/// Data record for `mq3.renderer.shader_parser.TexMod`; groups `kind`, `values`, `wave`.
struct TexMod
  /// Parsed texture-coordinate operation selecting scale, scroll, rotate, transform, turbulence, or
  /// another modifier.
  kind
  /// Numeric parameters interpreted according to the texture modifier's kind.
  values
  /// Waveform parameters driving this texture or vertex modification.
  wave
end struct
/// Data record for `mq3.renderer.shader_parser.Deform`; groups `kind`, `spread`, `wave`, `vector`, `bulgeWidth`, `bulgeHeight`, and 1 further field.
struct Deform
  /// Vertex-deformation operation selecting wave, move, bulge, autosprite, text, or another shader
  /// deformation.
  kind
  /// Spatial divisor controlling the phase spread of a vertex deformation.
  spread
  /// Waveform parameters driving this texture or vertex modification.
  wave
  /// Direction and magnitude used by the deformation.
  vector
  /// Spatial frequency of the texture-coordinate-driven bulge.
  bulgeWidth
  /// Maximum displacement produced by the bulge deformation.
  bulgeHeight
  /// Rate at which the bulge deformation moves over time.
  bulgeSpeed
end struct
/// Data record for `mq3.renderer.shader_parser.Stage`; groups `active`, `mapMode`, `images`, `animationSpeed`, `isLightmap`, `blendSrc`, and 16 further fields.
struct Stage
  /// Whether this object is currently active and accepts processing.
  active
  /// Texture-map selection mode parsed from the shader stage.
  mapMode
  /// Image resources or image-animation frames retained by the record.
  images
  /// Rate at which animated shader images advance, in frames per second.
  animationSpeed
  /// Whether the stage samples a BSP lightmap.
  isLightmap
  /// Source blend factor encoded in the shader stage.
  blendSrc
  /// Destination blend factor encoded in the shader stage.
  blendDst
  /// Generator used to compute the stage's RGB color components.
  rgbGen
  /// Generator used to compute the stage's alpha component.
  alphaGen
  /// Waveform used by the RGB color generator.
  rgbWave
  /// Waveform used by the alpha generator.
  alphaWave
  /// Constant color components used by the shader stage's color generators.
  constantColor
  /// Distance over which portal alpha fades between transparent and opaque.
  portalRange
  /// Generator used to produce the stage's texture coordinates.
  tcGen
  /// Projection vectors used by vector-generated texture coordinates.
  tcGenVectors
  /// Ordered texture-coordinate modifiers applied by the shader stage.
  texMods
  /// Whether drawing this pass writes to the depth buffer.
  depthWrite
  /// Whether the shader text explicitly selected depth writing.
  depthExplicit
  /// Alpha comparison selected for fragment rejection.
  alphaFunc
  /// Depth comparison selected for the shader pass.
  depthFunc
  /// Whether this shader stage is an optional detail-texture pass.
  detail
  /// Packed renderer flags specifying blending, depth, and alpha state.
  stateBits
end struct
/// Data record for `mq3.renderer.shader_parser.Shader`; groups `name`, `stages`, `sort`, `cull`, `surfaceParms`, `noMipMaps`, and 10 further fields.
struct Shader
  /// Material name declared at the start of the parsed shader definition.
  name
  /// Ordered material stages evaluated when the shader is drawn.
  stages
  /// Shader ordering category used to schedule this material relative to other surfaces.
  sort
  /// Culling mode or classification applied to this geometry.
  cull
  /// Surface flags and material properties parsed from shader directives.
  surfaceParms
  /// Whether mipmap generation is disabled for this material's textures.
  noMipMaps
  /// Whether the material bypasses the global texture downscaling setting.
  noPicMip
  /// Whether polygon-offset depth bias is applied while drawing.
  polygonOffset
  /// Whether surfaces from separate entities may share one shader batch.
  entityMergable
  /// Distance over which portal alpha fades between transparent and opaque.
  portalRange
  /// Upper limit applied to the shader's effect time; zero disables clamping.
  clampTime
  /// Ordered vertex deformations applied by the shader.
  deforms
  /// Color of the fog volume defined by the material.
  fogColor
  /// Distance at which the shader's fog becomes opaque.
  fogDepth
  /// Nonfatal diagnostics retained by the subsystem.
  warnings
  /// Height used to project moving cloud texture coordinates.
  cloudHeight
end struct

/// Calls `std.string.toLowerAscii` with `(text)` and returns its result.
/// @param text Argument 1 supplied to `std.string.toLowerAscii`.
function lower(text) return strings.toLowerAscii(text) end function
/// Calls `mq3.compat.numeric.f32` with `(numbers.atof(text))` and returns its result.
/// @param text Argument 1 supplied to `mq3.compat.textnumbers.atof`.
function number(text) return n.f32(numbers.atof(text)) end function
/// Constructs `mq3.renderer.shader_parser.Wave` with `func` = `0`, `base` = `0.0`, `amplitude` = `0.0`, `phase` = `0.0` and the supplied remaining values.
function blankWave() return Wave(0,0.0,0.0,0.0,0.0) end function
/// Returns `false` from `mq3.renderer.shader_parser.hasValue`; earlier branches return `true`.
/// @param values Sequence traversed as `value` while producing this result.
/// @param wanted Input used by `for each value in values if value==wanted then return true`.
function hasValue(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function

/// Returns `0` from `mq3.renderer.shader_parser.nameToAFunc`; earlier branches return `GLS_ATEST_GT_0`, `GLS_ATEST_LT_80`, `GLS_ATEST_GE_80`.
/// @param name Value forwarded as `text` to `mq3.renderer.shader_parser.lower`.
function nameToAFunc(name)
  name=lower(name)
  if name=="gt0" then return GLS_ATEST_GT_0 end if
  if name=="lt128" then return GLS_ATEST_LT_80 end if
  if name=="ge128" then return GLS_ATEST_GE_80 end if
  return 0
end function

/// Maps a case-insensitive OpenGL source-blend token to packed shader state, defaulting to GL_ONE.
/// @param name Value forwarded as `text` to `mq3.renderer.shader_parser.lower`.
function nameToSrcBlendMode(name)
  name=lower(name)
  if name=="gl_one" then return GLS_SRCBLEND_ONE end if
  if name=="gl_zero" then return GLS_SRCBLEND_ZERO end if
  if name=="gl_dst_color" then return GLS_SRCBLEND_DST_COLOR end if
  if name=="gl_one_minus_dst_color" then return GLS_SRCBLEND_ONE_MINUS_DST_COLOR end if
  if name=="gl_src_alpha" then return GLS_SRCBLEND_SRC_ALPHA end if
  if name=="gl_one_minus_src_alpha" then return GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA end if
  if name=="gl_dst_alpha" then return GLS_SRCBLEND_DST_ALPHA end if
  if name=="gl_one_minus_dst_alpha" then return GLS_SRCBLEND_ONE_MINUS_DST_ALPHA end if
  if name=="gl_src_alpha_saturate" then return GLS_SRCBLEND_ALPHA_SATURATE end if
  return GLS_SRCBLEND_ONE
end function

/// Maps a case-insensitive OpenGL destination-blend token to packed shader state, defaulting to GL_ONE.
/// @param name Value forwarded as `text` to `mq3.renderer.shader_parser.lower`.
function nameToDstBlendMode(name)
  name=lower(name)
  if name=="gl_one" then return GLS_DSTBLEND_ONE end if
  if name=="gl_zero" then return GLS_DSTBLEND_ZERO end if
  if name=="gl_src_alpha" then return GLS_DSTBLEND_SRC_ALPHA end if
  if name=="gl_one_minus_src_alpha" then return GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA end if
  if name=="gl_dst_alpha" then return GLS_DSTBLEND_DST_ALPHA end if
  if name=="gl_one_minus_dst_alpha" then return GLS_DSTBLEND_ONE_MINUS_DST_ALPHA end if
  if name=="gl_src_color" then return GLS_DSTBLEND_SRC_COLOR end if
  if name=="gl_one_minus_src_color" then return GLS_DSTBLEND_ONE_MINUS_SRC_COLOR end if
  return GLS_DSTBLEND_ONE
end function

/// Maps sine, square, triangle, sawtooth, inverse-sawtooth, or noise names to waveform IDs, defaulting to sine.
/// @param name Value forwarded as `text` to `mq3.renderer.shader_parser.lower`.
function nameToGenFunc(name)
  name=lower(name)
  if name=="sin" then return 1 end if
  if name=="square" then return 2 end if
  if name=="triangle" then return 3 end if
  if name=="sawtooth" then return 4 end if
  if name=="inversesawtooth" then return 5 end if
  if name=="noise" then return 6 end if
  return 1
end function

/// Computes `sortValue` from `number(name)` using `mq3.renderer.shader_parser.lower`, `mq3.renderer.shader_parser.number`.
/// @param name Value forwarded as `text` to `mq3.renderer.shader_parser.lower`.
function sortValue(name)
  value=lower(name)
  if value=="portal" then return 1.0 end if
  if value=="sky" then return 2.0 end if
  if value=="opaque" then return 3.0 end if
  if value=="decal" then return 4.0 end if
  if value=="seethrough" then return 5.0 end if
  if value=="banner" then return 6.0 end if
  if value=="underwater" then return 8.0 end if
  if value=="additive" then return 10.0 end if
  if value=="nearest" then return 16.0 end if
  return number(name)
end function

/// Builds `mq3.renderer.shader_parser.Wave` using `mq3.shared.parser.parseExt`.
/// @param state Argument 1 supplied to `mq3.shared.parser.parseExt`.
function parseWave(state)
  kind=parser.parseExt(state,false);a=parser.parseExt(state,false);b=parser.parseExt(state,false);c=parser.parseExt(state,false);d=parser.parseExt(state,false)
  if kind=="" or a=="" or b=="" or c=="" or d=="" then return error(7120,"incomplete shader waveform") end if
  return Wave(nameToGenFunc(kind),number(a),number(b),number(c),number(d))
end function

/// Parses a parenthesized vector with the requested component count and reports missing tokens or delimiters.
/// @param state Argument 1 supplied to `mq3.shared.parser.parseExt`.
/// @param count Input used by `for index=0 to count-1`.
function parseVector(state,count)
  if parser.parseExt(state,false)!="(" then return error(7121,"shader vector requires spaced opening parenthesis") end if
  values=[]
  for index=0 to count-1
    token=parser.parseExt(state,false);if token=="" then return error(7122,"incomplete shader vector") end if
    values=values+[number(token)]
  end for
  if parser.parseExt(state,false)!=")" then return error(7123,"shader vector requires spaced closing parenthesis") end if
  return values
end function

/// Returns `values` from `mq3.renderer.shader_parser.restOfLine`.
/// @param state Argument 1 supplied to `mq3.shared.parser.parseExt`.
function restOfLine(state)
  values=[]
  while true
    token=parser.parseExt(state,false);if token=="" then break end if;values=values+[token]
  end while
  return values
end function

/// Builds `mq3.renderer.shader_parser.Deform` using `mq3.shared.parser.parseExt`.
/// @param state Argument 1 supplied to `mq3.shared.parser.parseExt`.
function parseDeform(state)
  kind=lower(parser.parseExt(state,false));if kind=="" then return error(7144,"missing deformVertexes type") end if
  if kind=="wave" then
    divisor=parser.parseExt(state,false);if divisor=="" then return error(7145,"missing deformVertexes spread") end if
    value=number(divisor);spread=100.0;if value!=0.0 then spread=1.0/value end if
    return Deform("wave",spread,parseWave(state),[0.0,0.0,0.0],0.0,0.0,0.0)
  end if
  if kind=="move" then
    vector=[];for index=0 to 2 token=parser.parseExt(state,false);if token=="" then return error(7146,"incomplete deformVertexes move vector") end if;vector=vector+[number(token)] end for
    return Deform("move",0.0,parseWave(state),vector,0.0,0.0,0.0)
  end if
  if kind=="bulge" then
    width=parser.parseExt(state,false);height=parser.parseExt(state,false);speed=parser.parseExt(state,false)
    if width=="" or height=="" or speed=="" then return error(7147,"incomplete deformVertexes bulge") end if
    return Deform("bulge",0.0,blankWave(),[0.0,0.0,0.0],number(width),number(height),number(speed))
  end if
  if kind=="normal" then
    amplitude=parser.parseExt(state,false);frequency=parser.parseExt(state,false)
    if amplitude=="" or frequency=="" then return error(7148,"incomplete deformVertexes normal") end if
    return Deform("normal",0.0,Wave(1,0.0,number(amplitude),0.0,number(frequency)),[0.0,0.0,0.0],0.0,0.0,0.0)
  end if
  restOfLine(state);return Deform(kind,0.0,blankWave(),[0.0,0.0,0.0],0.0,0.0,0.0)
end function

/// Builds `mq3.renderer.shader_parser.TexMod` for `mq3.renderer.shader_parser.parseTexMod`.
/// @param tokens Indexed input read at `0`, `1`, `2`, `3`.
function parseTexMod(tokens)
  if len(tokens)==0 then return error(7124,"missing tcMod type") end if
  kind=lower(tokens[0]);expected=0
  if kind=="turb" then expected=5
  else if kind=="scale" or kind=="scroll" then expected=3
  else if kind=="stretch" then expected=6
  else if kind=="transform" then expected=7
  else if kind=="rotate" then expected=2
  else if kind=="entitytranslate" then expected=1
  else return TexMod("unknown",[],blankWave())
  end if
  if len(tokens)<expected then return error(7125,"incomplete tcMod "+kind) end if
  if kind=="stretch" then
    wave=Wave(nameToGenFunc(tokens[1]),number(tokens[2]),number(tokens[3]),number(tokens[4]),number(tokens[5]))
    return TexMod(kind,[],wave)
  end if
  values=[];if expected>1 then for index=1 to expected-1 values=values+[number(tokens[index])] end for end if
  return TexMod(kind,values,blankWave())
end function

/// Constructs `mq3.renderer.shader_parser.Stage` with `active` = `true`, `mapMode` = `""`, `images` = `[]`, `animationSpeed` = `0.0` and the supplied remaining values.
function blankStage()
  return Stage(true,"",[],0.0,false,0,0,"bad","identity",blankWave(),blankWave(),[255,255,255,255],0.0,"bad",[],[],true,false,0,0,false,GLS_DEPTHMASK_TRUE)
end function

/// Builds `stage.mapMode`, `stage.images`, `stage.isLightmap`, `stage.animationSpeed`, `stage.alphaFunc` in `mq3.renderer.shader_parser.parseStage`; returns `stage`.
/// @param state Argument 1 supplied to `mq3.shared.parser.parseExt`.
function parseStage(state)
  stage=blankStage()
  while true
    token=parser.parseExt(state,true);if token=="" then return error(7126,"unterminated shader stage") end if
    if token=="}" then break end if
    command=lower(token)
    if command=="map" or command=="clampmap" then
      image=parser.parseExt(state,false);if image=="" then return error(7127,"missing stage map") end if
      stage.mapMode="repeat";if command=="clampmap" then stage.mapMode="clamp" end if
      stage.images=[image];if lower(image)=="$lightmap" then stage.isLightmap=true end if
    else if command=="videomap" then
      image=parser.parseExt(state,false);if image=="" then return error(7127,"missing videoMap cinematic") end if
      // tr_shader.c keeps the filename on a texture bundle and replaces its
      // first image with the handle's scratch image after CIN_PlayCinematic.
      stage.mapMode="video";stage.images=[image]
    else if command=="animmap" then
      speed=parser.parseExt(state,false);if speed=="" then return error(7128,"missing animMap frequency") end if
      stage.animationSpeed=number(speed);images=restOfLine(state)
      if len(images)>MAX_IMAGE_ANIMATIONS then images=slice(images,0,MAX_IMAGE_ANIMATIONS) end if
      stage.mapMode="repeat";stage.images=images
    else if command=="alphafunc" then
      value=parser.parseExt(state,false);if value=="" then return error(7129,"missing alphaFunc") end if;stage.alphaFunc=nameToAFunc(value)
    else if command=="depthfunc" then
      value=lower(parser.parseExt(state,false));if value=="" then return error(7130,"missing depthFunc") end if
      if value=="equal" then stage.depthFunc=GLS_DEPTHFUNC_EQUAL else if value=="lequal" then stage.depthFunc=0 end if
    else if command=="detail" then stage.detail=true
    else if command=="depthwrite" then stage.depthWrite=true;stage.depthExplicit=true
    else if command=="blendfunc" then
      value=parser.parseExt(state,false);if value=="" then return error(7131,"missing blendFunc") end if;simple=lower(value)
      if simple=="add" then stage.blendSrc=GLS_SRCBLEND_ONE;stage.blendDst=GLS_DSTBLEND_ONE
      else if simple=="filter" then stage.blendSrc=GLS_SRCBLEND_DST_COLOR;stage.blendDst=GLS_DSTBLEND_ZERO
      else if simple=="blend" then stage.blendSrc=GLS_SRCBLEND_SRC_ALPHA;stage.blendDst=GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA
      else destination=parser.parseExt(state,false);if destination=="" then return error(7132,"missing destination blend mode") end if;stage.blendSrc=nameToSrcBlendMode(value);stage.blendDst=nameToDstBlendMode(destination)
      end if
      if not stage.depthExplicit then stage.depthWrite=false end if
    else if command=="rgbgen" then
      value=lower(parser.parseExt(state,false));if value=="" then return error(7133,"missing rgbGen") end if
      if value=="wave" then stage.rgbWave=parseWave(state);stage.rgbGen="wave"
      else if value=="const" then color=parseVector(state,3);stage.constantColor[0]=color[0]*255;stage.constantColor[1]=color[1]*255;stage.constantColor[2]=color[2]*255;stage.rgbGen="const"
      else if value=="identity" or value=="identitylighting" or value=="entity" or value=="oneminusentity" or value=="vertex" or value=="exactvertex" or value=="lightingdiffuse" or value=="oneminusvertex" then
        stage.rgbGen=value;if value=="vertex" and stage.alphaGen=="identity" then stage.alphaGen="vertex" end if
      end if
    else if command=="alphagen" then
      value=lower(parser.parseExt(state,false));if value=="" then return error(7134,"missing alphaGen") end if
      if value=="wave" then stage.alphaWave=parseWave(state);stage.alphaGen="wave"
      else if value=="const" then alpha=parser.parseExt(state,false);if alpha=="" then return error(7135,"missing alphaGen const") end if;stage.constantColor[3]=number(alpha)*255;stage.alphaGen="const"
      else if value=="portal" then range=parser.parseExt(state,false);stage.alphaGen="portal";stage.portalRange=256.0;if range!="" then stage.portalRange=number(range) end if
      else if value=="identity" or value=="entity" or value=="oneminusentity" or value=="vertex" or value=="lightingspecular" or value=="oneminusvertex" then stage.alphaGen=value end if
    else if command=="tcgen" or command=="texgen" then
      value=lower(parser.parseExt(state,false));if value=="" then return error(7136,"missing tcGen") end if
      if value=="environment" or value=="lightmap" or value=="texture" then stage.tcGen=value
      else if value=="base" then stage.tcGen="texture"
      else if value=="vector" then stage.tcGen="vector";stage.tcGenVectors=[parseVector(state,3),parseVector(state,3)] end if
    else if command=="tcmod" then
      if len(stage.texMods)>=TR_MAX_TEXMODS then return error(7137,"too many tcMod stages") end if
      stage.texMods=stage.texMods+[parseTexMod(restOfLine(state))]
    else return error(7138,"unknown shader stage directive: "+token)
    end if
  end while
  if stage.rgbGen=="bad" then
    if stage.blendSrc==0 or stage.blendSrc==GLS_SRCBLEND_ONE or stage.blendSrc==GLS_SRCBLEND_SRC_ALPHA then stage.rgbGen="identitylighting" else stage.rgbGen="identity" end if
  end if
  if stage.blendSrc==GLS_SRCBLEND_ONE and stage.blendDst==GLS_DSTBLEND_ZERO then stage.blendSrc=0;stage.blendDst=0;stage.depthWrite=true end if
  stage.stateBits=stage.blendSrc|stage.blendDst|stage.alphaFunc|stage.depthFunc;if stage.depthWrite then stage.stateBits=stage.stateBits|GLS_DEPTHMASK_TRUE end if
  return stage
end function

/// Returns `1` from `mq3.renderer.shader_parser.skipLine`.
/// @param state Value forwarded as `state` to `mq3.renderer.shader_parser.restOfLine`.
function skipLine(state) restOfLine(state);return 1 end function

/// Builds `shader.stages`, `shader.portalRange`, `shader.cloudHeight`, `shader.surfaceParms`, `shader.noMipMaps` in `mq3.renderer.shader_parser.parse`; returns `shader`.
/// @param state Argument 1 supplied to `mq3.shared.parser.parseExt`.
/// @param name Value used for `mq3.renderer.shader_parser.Shader.name`.
function parse(state,name)
  if parser.parseExt(state,true)!="{" then return error(7139,"shader definition must begin with {") end if
  shader=Shader(name,[],0.0,"front",[],false,false,false,false,0.0,0.0,[],[0.0,0.0,0.0],0.0,[],512.0)
  while true
    token=parser.parseExt(state,true);if token=="" then return error(7140,"unterminated shader definition: "+name) end if
    if token=="}" then break end if
    if token=="{" then
      if len(shader.stages)>=MAX_SHADER_STAGES then return error(7141,"too many shader stages") end if
      stage=parseStage(state);shader.stages=shader.stages+[stage];if stage.portalRange>0.0 then shader.portalRange=stage.portalRange end if
    else
      command=lower(token)
      if command=="skyparms" then
        values=restOfLine(state)
        if len(values)>=2 then shader.cloudHeight=number(values[1]);if shader.cloudHeight==0.0 then shader.cloudHeight=512.0 end if end if
      else if strings.startsWith(command,"qer") or strings.startsWith(command,"q3map") or command=="tesssize" or command=="cloudparms" or command=="lightning" then skipLine(state)
      else if command=="surfaceparm" then value=parser.parseExt(state,false);if value!="" then shader.surfaceParms=shader.surfaceParms+[lower(value)] end if
      else if command=="nomipmaps" then shader.noMipMaps=true;shader.noPicMip=true
      else if command=="nopicmip" then shader.noPicMip=true
      else if command=="polygonoffset" then shader.polygonOffset=true
      else if command=="entitymergable" then shader.entityMergable=true
      else if command=="portal" then shader.sort=1.0
      else if command=="sort" then value=parser.parseExt(state,false);if value!="" then shader.sort=sortValue(value) end if
      else if command=="cull" then value=lower(parser.parseExt(state,false));if value=="none" or value=="twosided" or value=="disable" then shader.cull="twoSided" else if value=="back" or value=="backside" or value=="backsided" then shader.cull="back" end if
      else if command=="clamptime" then value=parser.parseExt(state,false);if value!="" then shader.clampTime=number(value) end if
      else if command=="deformvertexes" then shader.deforms=shader.deforms+[parseDeform(state)]
      else if command=="fogparms" then
        shader.fogColor=parseVector(state,3);depth=parser.parseExt(state,false);if depth=="" then return error(7149,"missing fogParms depth") end if;shader.fogDepth=number(depth);skipLine(state)
      else if command=="light" then parser.parseExt(state,false)
      else return error(7142,"unsupported general shader directive: "+token)
      end if
    end if
  end while
  if len(shader.stages)==0 and not hasValue(shader.surfaceParms,"fog") then return error(7143,"shader has no render stages") end if
  return shader
end function

/// Calls `mq3.renderer.shader_parser.parse` with `(parser.create(text),name)` and returns its result.
/// @param text Argument 1 supplied to `mq3.shared.parser.create`.
/// @param name Value forwarded as `name` to `mq3.renderer.shader_parser.parse`.
function parseText(text,name) return parse(parser.create(text),name) end function
/// Builds `state.offset` in `mq3.renderer.shader_parser.parseIndexed`; returns `parse(state,entry.name)`.
/// @param index Record providing `index.text`.
/// @param name Argument 2 supplied to `mq3.renderer.shader_index.find`.
function parseIndexed(index,name)
  entry=shaderIndex.find(index,name);if entry==void then return void end if
  state=parser.create(index.text);state.offset=entry.bodyOffset;return parse(state,entry.name)
end function
