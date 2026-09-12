// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Material and stage-script parsing from renderer/tr_shader.c.
package mq3.renderer.shader_parser
import mq3.compat.numeric as n
import mq3.compat.textnumbers as numbers
import mq3.renderer.shader_index as shaderIndex
import mq3.shared.parser as parser
import std.string as strings

const GLS_SRCBLEND_ZERO=1
const GLS_SRCBLEND_ONE=2
const GLS_SRCBLEND_DST_COLOR=3
const GLS_SRCBLEND_ONE_MINUS_DST_COLOR=4
const GLS_SRCBLEND_SRC_ALPHA=5
const GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA=6
const GLS_SRCBLEND_DST_ALPHA=7
const GLS_SRCBLEND_ONE_MINUS_DST_ALPHA=8
const GLS_SRCBLEND_ALPHA_SATURATE=9
const GLS_DSTBLEND_ZERO=16
const GLS_DSTBLEND_ONE=32
const GLS_DSTBLEND_SRC_COLOR=48
const GLS_DSTBLEND_ONE_MINUS_SRC_COLOR=64
const GLS_DSTBLEND_SRC_ALPHA=80
const GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA=96
const GLS_DSTBLEND_DST_ALPHA=112
const GLS_DSTBLEND_ONE_MINUS_DST_ALPHA=128
const GLS_DEPTHMASK_TRUE=256
const GLS_DEPTHFUNC_EQUAL=131072
const GLS_ATEST_GT_0=268435456
const GLS_ATEST_LT_80=536870912
const GLS_ATEST_GE_80=1073741824
const MAX_SHADER_STAGES=8
const TR_MAX_TEXMODS=4
const MAX_IMAGE_ANIMATIONS=8

struct Wave func base amplitude phase frequency end struct
struct TexMod kind values wave end struct
struct Deform kind spread wave end struct
struct Stage active mapMode images animationSpeed isLightmap blendSrc blendDst rgbGen alphaGen rgbWave alphaWave constantColor portalRange tcGen tcGenVectors texMods depthWrite depthExplicit alphaFunc depthFunc detail stateBits end struct
struct Shader name stages sort cull surfaceParms noMipMaps noPicMip polygonOffset entityMergable portalRange clampTime deforms warnings end struct

function lower(text) return strings.toLowerAscii(text) end function
function number(text) return n.f32(numbers.atof(text)) end function
function blankWave() return Wave(0,0.0,0.0,0.0,0.0) end function

function nameToAFunc(name)
  name=lower(name)
  if name=="gt0" then return GLS_ATEST_GT_0 end if
  if name=="lt128" then return GLS_ATEST_LT_80 end if
  if name=="ge128" then return GLS_ATEST_GE_80 end if
  return 0
end function

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

function parseWave(state)
  kind=parser.parseExt(state,false);a=parser.parseExt(state,false);b=parser.parseExt(state,false);c=parser.parseExt(state,false);d=parser.parseExt(state,false)
  if kind=="" or a=="" or b=="" or c=="" or d=="" then return error(7120,"incomplete shader waveform") end if
  return Wave(nameToGenFunc(kind),number(a),number(b),number(c),number(d))
end function

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

function restOfLine(state)
  values=[]
  while true
    token=parser.parseExt(state,false);if token=="" then break end if;values=values+[token]
  end while
  return values
end function

function parseDeform(state)
  kind=lower(parser.parseExt(state,false));if kind=="" then return error(7144,"missing deformVertexes type") end if
  if kind=="wave" then
    divisor=parser.parseExt(state,false);if divisor=="" then return error(7145,"missing deformVertexes spread") end if
    value=number(divisor);spread=100.0;if value!=0.0 then spread=1.0/value end if
    return Deform("wave",spread,parseWave(state))
  end if
  restOfLine(state);return Deform(kind,0.0,blankWave())
end function

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
  values=[];for index=1 to expected-1 values=values+[number(tokens[index])] end for
  return TexMod(kind,values,blankWave())
end function

function blankStage()
  return Stage(true,"",[],0.0,false,0,0,"bad","identity",blankWave(),blankWave(),[255,255,255,255],0.0,"bad",[],[],true,false,0,0,false,GLS_DEPTHMASK_TRUE)
end function

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

function skipLine(state) restOfLine(state);return 1 end function

function parse(state,name)
  if parser.parseExt(state,true)!="{" then return error(7139,"shader definition must begin with {") end if
  shader=Shader(name,[],0.0,"front",[],false,false,false,false,0.0,0.0,[],[])
  while true
    token=parser.parseExt(state,true);if token=="" then return error(7140,"unterminated shader definition: "+name) end if
    if token=="}" then break end if
    if token=="{" then
      if len(shader.stages)>=MAX_SHADER_STAGES then return error(7141,"too many shader stages") end if
      stage=parseStage(state);shader.stages=shader.stages+[stage];if stage.portalRange>0.0 then shader.portalRange=stage.portalRange end if
    else
      command=lower(token)
      if strings.startsWith(command,"qer") or strings.startsWith(command,"q3map") or command=="tesssize" then skipLine(state)
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
      else if command=="light" then parser.parseExt(state,false)
      else return error(7142,"unsupported general shader directive: "+token)
      end if
    end if
  end while
  if len(shader.stages)==0 then return error(7143,"shader has no render stages") end if
  return shader
end function

function parseText(text,name) return parse(parser.create(text),name) end function
function parseIndexed(index,name)
  entry=shaderIndex.find(index,name);if entry==void then return void end if
  state=parser.create(index.text);state.offset=entry.bodyOffset;return parse(state,entry.name)
end function
