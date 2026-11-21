// SPDX-License-Identifier: GPL-2.0-or-later
// The two real Retail stages of the engine shader named "console".
package mq3.client.baseq3_console_background

import mq3.renderer.playable_materials as materials
import mq3.renderer.shader_parser as shaderParser
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as raster
import std.string as strings

const SHADER_NAME="console"
const REQUIRED_TEXTURES=2

struct Layer stage imageName image slot end struct
struct Media shaderName layers firstTextureSlot end struct
struct Point x y depth end struct

function fail(message) return error(7745,"Baseq3 console background: "+message) end function
function load(archive,firstTextureSlot)
  if archive==void then return fail("PK3 archive is required") end if
  if firstTextureSlot<0 or firstTextureSlot+REQUIRED_TEXTURES>window.NATIVE_TEXTURE_SLOTS then return fail("two native texture slots are required") end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  parsed=shaderParser.parseIndexed(scripts[0],SHADER_NAME);if parsed is error then return parsed end if
  if parsed==void or len(parsed.stages)!=REQUIRED_TEXTURES then return fail("Retail console shader must have two stages") end if
  layers=[]
  for index=0 to REQUIRED_TEXTURES-1
    stage=parsed.stages[index];if len(stage.images)==0 then return fail("Retail console stage has no image") end if
    loaded=materials.loadImage(archive,stage.images[0]);if loaded==void then return fail("missing Retail console artwork "+stage.images[0]) end if
    layers=layers+[Layer(stage,loaded[0],loaded[1],firstTextureSlot+index)]
  end for
  if not strings.endsWith(strings.toLowerAscii(layers[0].imageName),"gfx/misc/console01.tga") then return fail("console shader first stage is not console01.tga") end if
  second=strings.toLowerAscii(layers[1].imageName);if not strings.endsWith(second,"gfx/misc/console02.tga") and not strings.endsWith(second,"gfx/misc/console02.jpg") then return fail("console shader second stage is not console02 artwork") end if
  return Media(SHADER_NAME,layers,firstTextureSlot)
end function
function upload(media)
  if media==void or len(media.layers)!=REQUIRED_TEXTURES then return fail("complete console media is required") end if
  for each layer in media.layers if not window.uploadTextureNoMip(layer.slot,layer.image.pixels,layer.image.width,layer.image.height) then release(media);return fail("could not upload "+layer.imageName) end if end for
  return true
end function
function release(media) if media!=void then for each layer in media.layers window.releaseTexture(layer.slot) end for end if;return void end function
function point(x,y) return Point(x,y,0.0001) end function
function drawLayer(layer,width,height,now)
  blend=materials.stageBlend(layer.stage);state=raster.setState(blend,false,false);if state is error then return state end if
  a=point(0.0,0.0);b=point(width,0.0);c=point(width,height);d=point(0.0,height)
  uvA=materials.transformUVAt(layer.stage,[0.0,0.0],[0.0,0.0,0.0],now);if uvA is error then return uvA end if
  uvB=materials.transformUVAt(layer.stage,[1.0,0.0],[width,0.0,0.0],now);if uvB is error then return uvB end if
  uvC=materials.transformUVAt(layer.stage,[1.0,1.0],[width,height,0.0],now);if uvC is error then return uvC end if
  uvD=materials.transformUVAt(layer.stage,[0.0,1.0],[0.0,height,0.0],now);if uvD is error then return uvD end if
  window.drawTriangle(layer.slot,a,uvA,1.0,b,uvB,1.0,c,uvC,1.0,255,255,255);window.drawTriangle(layer.slot,a,uvA,1.0,c,uvC,1.0,d,uvD,1.0,255,255,255);return true
end function
function draw(media,width,height,now)
  if media==void or len(media.layers)!=REQUIRED_TEXTURES or width<=0 or height<=0 then return fail("media and positive dimensions are required") end if
  raster.setAlphaTest(raster.ALPHA_TEST_NONE);raster.setTextureClamp(false)
  for each layer in media.layers drawn=drawLayer(layer,width,height,now);if drawn is error then return drawn end if end for
  raster.setState(raster.BLEND_OPAQUE,false,false);return len(media.layers)
end function
