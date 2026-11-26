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

/// Stores base Quake III console background layer record, including `stage`, `imageName`, `image`, `slot`.
struct Layer stage imageName image slot end struct
/// Stores base Quake III console background media record, including `shaderName`, `layers`, `firstTextureSlot`.
struct Media shaderName layers firstTextureSlot end struct
/// Stores base Quake III console background point record, including `x`, `y`, `depth`.
struct Point x y depth end struct

/// Creates the base Quake III console background error `7745` with diagnostic text `"Baseq3 console background: "+message`.
/// @param message Argument 2 of `error`; passed as `"Baseq3 console background: "+message`.
function fail(message) return error(7745,"Baseq3 console background: "+message) end function
/// Calls `mq3.renderer.playable_materials.buildScriptIndex`, `mq3.renderer.shader_parser.parseIndexed`, `mq3.renderer.playable_materials.loadRuntimeStage` and additional helpers from base Quake III console background `load`. The final path returns `Media(SHADER_NAME,layers,firstTextureSlot)`.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param firstTextureSlot First texture slot reserved for this asset collection.
function load(archive,firstTextureSlot)
  if archive==void then return fail("PK3 archive is required") end if
  if firstTextureSlot<0 or firstTextureSlot+REQUIRED_TEXTURES>window.NATIVE_TEXTURE_SLOTS then return fail("two native texture slots are required") end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  parsed=shaderParser.parseIndexed(scripts[0],SHADER_NAME);if parsed is error then return parsed end if
  if parsed==void or len(parsed.stages)!=REQUIRED_TEXTURES then return fail("Retail console shader must have two stages") end if
  layers=[]
  for index=0 to REQUIRED_TEXTURES-1
    parsedStage=parsed.stages[index];if len(parsedStage.images)==0 then return fail("Retail console stage has no image") end if
    slot=firstTextureSlot+index
    loaded=materials.loadRuntimeStage(archive,parsedStage,slot,slot+1)
    if loaded==void then return fail("missing Retail console artwork "+parsedStage.images[0]) end if
    stage=loaded[0];layers=layers+[Layer(stage,stage.imageNames[0],stage.images[0],slot)]
  end for
  if not strings.endsWith(strings.toLowerAscii(layers[0].imageName),"gfx/misc/console01.tga") then return fail("console shader first stage is not console01.tga") end if
  second=strings.toLowerAscii(layers[1].imageName);if not strings.endsWith(second,"gfx/misc/console02.tga") and not strings.endsWith(second,"gfx/misc/console02.jpg") then return fail("console shader second stage is not console02 artwork") end if
  return Media(SHADER_NAME,layers,firstTextureSlot)
end function
/// Calls `mq3.platform.playable_window.uploadTextureNoMip`, `mq3.client.baseq3_console_background.release` from base Quake III console background `upload`.
/// @param media Record read through `media.layers`.
function upload(media)
  if media==void or len(media.layers)!=REQUIRED_TEXTURES then return fail("complete console media is required") end if
  for each layer in media.layers if not window.uploadTextureNoMip(layer.slot,layer.image.pixels,layer.image.width,layer.image.height) then release(media);return fail("could not upload "+layer.imageName) end if end for
  return true
end function
/// Calls `mq3.platform.playable_window.releaseTexture` from base Quake III console background `release`.
/// @param media Record read through `media.layers`.
function release(media) if media!=void then for each layer in media.layers window.releaseTexture(layer.slot) end for end if;return void end function
/// Creates a `mq3.client.baseq3_console_background.Point` record. Assigns `x` from `x`, `y` from `y`.
/// @param x Value used to initialize `Point.x`.
/// @param y Value used to initialize `Point.y`.
function point(x,y) return Point(x,y,0.0001) end function
/// Calls `mq3.platform.playable_multitexture.setState`, `mq3.client.baseq3_console_background.point`, `mq3.renderer.playable_materials.transformUVAt` and additional helpers from base Quake III console background `drawLayer`.
/// @param layer Record read through `layer.stage.blend`, `layer.stage`, `layer.slot`.
/// @param width Width in the coordinate space used by `drawLayer`.
/// @param height Height in the coordinate space used by `drawLayer`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function drawLayer(layer,width,height,now)
  state=raster.setState(layer.stage.blend,false,false);if state is error then return state end if
  a=point(0.0,0.0);b=point(width,0.0);c=point(width,height);d=point(0.0,height)
  uvA=materials.transformUVAt(layer.stage,[0.0,0.0],[0.0,0.0,0.0],now);if uvA is error then return uvA end if
  uvB=materials.transformUVAt(layer.stage,[1.0,0.0],[width,0.0,0.0],now);if uvB is error then return uvB end if
  uvC=materials.transformUVAt(layer.stage,[1.0,1.0],[width,height,0.0],now);if uvC is error then return uvC end if
  uvD=materials.transformUVAt(layer.stage,[0.0,1.0],[0.0,height,0.0],now);if uvD is error then return uvD end if
  window.drawTriangle(layer.slot,a,uvA,1.0,b,uvB,1.0,c,uvC,1.0,255,255,255);window.drawTriangle(layer.slot,a,uvA,1.0,c,uvC,1.0,d,uvD,1.0,255,255,255);return true
end function
/// Calls `mq3.platform.playable_multitexture.setAlphaTest`, `mq3.platform.playable_multitexture.setTextureClamp`, `mq3.client.baseq3_console_background.drawLayer` and additional helpers from base Quake III console background `draw`. The final path returns `len(media.layers)`.
/// @param media Record read through `media.layers`.
/// @param width Width in the coordinate space used by `draw`.
/// @param height Height in the coordinate space used by `draw`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function draw(media,width,height,now)
  if media==void or len(media.layers)!=REQUIRED_TEXTURES or width<=0 or height<=0 then return fail("media and positive dimensions are required") end if
  raster.setAlphaTest(raster.ALPHA_TEST_NONE);raster.setTextureClamp(false)
  for each layer in media.layers drawn=drawLayer(layer,width,height,now);if drawn is error then return drawn end if end for
  raster.setState(raster.BLEND_OPAQUE,false,false);return len(media.layers)
end function
