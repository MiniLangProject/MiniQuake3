// SPDX-License-Identifier: GPL-2.0-or-later
// Retail Baseq3 match text: bigchars atlas, warmup, timer and center print.
package mq3.client.baseq3_match_display
import mq3.client.cgame_scoreboard as oldScoreboard

import mq3.format.pk3 as pk3
import mq3.renderer.playable_materials as materials
import mq3.platform.playable_window as window
import mq3.platform.playable_multitexture as raster
import mq3.compat.numeric as numeric
import std.string as strings

const VIRTUAL_WIDTH=640.0
const VIRTUAL_HEIGHT=480.0
const BIGCHAR_WIDTH=16
const BIGCHAR_HEIGHT=16
const GIANT_WIDTH=32
const ATLAS_COLUMNS=16
const ATLAS_ROWS=16
const CENTER_DEFAULT_Y=144
const CENTER_DEFAULT_DURATION=3000
const FADE_TIME=200

/// Stores base Quake III match display media record, including `imageName`, `image`, `slot`, `glyphBatch`.
struct Media imageName image slot glyphBatch end struct
/// Stores base Quake III match display center print record, including `text`, `startedAt`, `y`, `charWidth`, `duration`, `lines`.
struct CenterPrint text startedAt y charWidth duration lines end struct
/// Stores base Quake III match display countdown record, including `text`, `charWidth`, `charHeight`, `second`.
struct Countdown text charWidth charHeight second end struct
/// Stores base Quake III match display score row record, including `name`, `score`, `deaths`, `localPlayer`, `red`, `green` and additional values.
struct ScoreRow name score deaths localPlayer red green blue end struct
/// Stores base Quake III match display point record, including `x`, `y`, `depth`.
struct Point x y depth end struct

/// Creates the base Quake III match display error `7583` with diagnostic text `"Baseq3 match display: "+message`.
/// @param message Argument 2 of `error`; passed as `"Baseq3 match display: "+message`.
function fail(message) return error(7583,"Baseq3 match display: "+message) end function

// cgs.media.charsetShader is registered from this exact retail shader name.
/// @param archive Opened game archive supplying maps, models, textures or other assets.
/// @param textureSlot Value used by `if textureSlot<0 or textureSlot>=window.NATIVE_TEXTURE_SLOTS then return fail("texture slot outside native range") end if`.
function load(archive,textureSlot)
  if archive==void then return fail("PK3 archive is required") end if
  if textureSlot<0 or textureSlot>=window.NATIVE_TEXTURE_SLOTS then return fail("texture slot outside native range") end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  name="gfx/2d/bigchars";mapped=materials.mappedImageName(scripts[0],name);if mapped==void then mapped=name end if
  loaded=materials.loadImage(archive,mapped)
  if loaded==void and mapped!=name then loaded=materials.loadImage(archive,name) end if
  if loaded==void then return fail("missing retail artwork "+name) end if
  return Media(loaded[0],loaded[1],textureSlot,void)
end function

/// Calls `mq3.platform.playable_window.uploadTextureNoMip` from base Quake III match display `upload`.
/// @param media Record read through `media.slot`, `media.image.pixels`, `media.image.width`, `media.image.height` and additional values.
function upload(media)
  if media==void then return fail("media is required") end if
  if not window.uploadTextureNoMip(media.slot,media.image.pixels,media.image.width,media.image.height) then return fail("could not upload "+media.imageName) end if
  return true
end function

/// Calls `mq3.platform.playable_window.releaseTexture` from base Quake III match display `release`.
/// @param media Record read through `media.slot`.
function release(media) if media!=void then window.releaseTexture(media.slot) end if;return void end function

/// Creates a `mq3.client.baseq3_match_display.Point` record. Assigns `x` from `x`, `y` from `y`.
/// @param x Value used to initialize `Point.x`.
/// @param y Value used to initialize `Point.y`.
function point(x,y) return Point(x,y,0.001) end function

/// Evaluates base Quake III match display `glyphCell` and returns `fail("glyph must be one character")`, `[code&15,code>>4]` according to its guard/selection conditions.
/// @param character Sequence whose length/content is inspected by `glyphCell`.
function glyphCell(character)
  if typeof(character)!="string" or len(character)!=1 then return fail("glyph must be one character") end if
  code=bytes(character)[0]&255
  return [code&15,code>>4]
end function

/// Computes `index+1<len(text) and text[index]=="^" and text[index+1]!="^"` for base Quake III match display `isColorEscape`.
/// @param text Sequence read at `text[index]`, `text[index+1]`.
/// @param index Value used by `return index+1<len(text) and text[index]=="^" and text[index+1]!="^"`.
function isColorEscape(text,index)
  return index+1<len(text) and text[index]=="^" and text[index+1]!="^"
end function

/// Calls `mq3.client.baseq3_match_display.isColorEscape` from base Quake III match display `printLength`. The final path returns `count`.
/// @param text Text whose length/content is inspected by `printLength`.
function printLength(text)
  count=0;index=0
  while index<len(text)
    if isColorEscape(text,index) then index=index+2 else count=count+1;index=index+1 end if
  end while
  return count
end function

/// Evaluates base Quake III match display `colorFor` and returns `[0,0,0]`, `[255,0,0]`, `[0,255,0]` and additional values according to its guard/selection conditions.
/// @param code Value used by `index=(bytes(code)[0]-48)&7`.
function colorFor(code)
  index=(bytes(code)[0]-48)&7
  if index==0 then return [0,0,0] end if
  if index==1 then return [255,0,0] end if
  if index==2 then return [0,255,0] end if
  if index==3 then return [255,255,0] end if
  if index==4 then return [0,0,255] end if
  if index==5 then return [0,255,255] end if
  if index==6 then return [255,0,255] end if
  return [255,255,255]
end function

/// Calls `mq3.client.baseq3_match_display.glyphCell`, `mq3.client.baseq3_match_display.point`, `mq3.platform.playable_window.drawTriangle` from base Quake III match display `drawGlyph`.
/// @param media Record read through `media.slot`.
/// @param character Value used by `if character==" " then return void end if`.
/// @param x Horizontal coordinate in the coordinate space used by `drawGlyph`.
/// @param y Vertical coordinate in the coordinate space used by `drawGlyph`.
/// @param charWidth Value used by `right=(x+charWidth)*scaleX`.
/// @param charHeight Value used by `bottom=(y+charHeight)*scaleY`.
/// @param scaleX Value used by `left=x*scaleX`.
/// @param scaleY Value used by `top=y*scaleY`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function drawGlyph(media,character,x,y,charWidth,charHeight,scaleX,scaleY,red,green,blue)
  if character==" " then return void end if
  cell=glyphCell(character);u0=cell[0]/16.0;v0=cell[1]/16.0;u1=u0+0.0625;v1=v0+0.0625
  left=x*scaleX;top=y*scaleY;right=(x+charWidth)*scaleX;bottom=(y+charHeight)*scaleY
  a=point(left,top);b=point(right,top);c=point(right,bottom);d=point(left,bottom)
  window.drawTriangle(media.slot,a,[u0,v0],1.0,b,[u1,v0],1.0,c,[u1,v1],1.0,red,green,blue)
  window.drawTriangle(media.slot,a,[u0,v0],1.0,c,[u1,v1],1.0,d,[u0,v1],1.0,red,green,blue)
  return void
end function

// Matches CG_DrawStringExt: color escapes consume no cell and every glyph gets
// the two-pixel black shadow used by the original HUD.
/// @param media Value used by `if media==void then return fail("media is required") end if`.
/// @param text Sequence read at `text[index]`, `text[index+1]`.
/// @param x Horizontal coordinate in the coordinate space used by `drawString`.
/// @param y Vertical coordinate in the coordinate space used by `drawString`.
/// @param charWidth Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`.
/// @param charHeight Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`.
/// @param scaleX Value used by `else drawGlyph(media,text[index],cursor+2,y+2,charWidth,charHeight,scaleX,scaleY,0,0,0)`.
/// @param scaleY Value used by `else drawGlyph(media,text[index],cursor+2,y+2,charWidth,charHeight,scaleX,scaleY,0,0,0)`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
/// @param shadow Value used by `if shadow then`.
function drawString(media,text,x,y,charWidth,charHeight,scaleX,scaleY,red,green,blue,shadow)
  if media==void then return fail("media is required") end if
  if charWidth<1 or charHeight<1 then return fail("positive character size required") end if
  if shadow then
    cursor=x;index=0
    while index<len(text)
      if isColorEscape(text,index) then index=index+2
      else drawGlyph(media,text[index],cursor+2,y+2,charWidth,charHeight,scaleX,scaleY,0,0,0);cursor=cursor+charWidth;index=index+1 end if
    end while
  end if
  cursor=x;index=0;color=[red,green,blue]
  while index<len(text)
    if isColorEscape(text,index) then color=colorFor(text[index+1]);index=index+2
    else drawGlyph(media,text[index],cursor,y,charWidth,charHeight,scaleX,scaleY,color[0],color[1],color[2]);cursor=cursor+charWidth;index=index+1 end if
  end while
  return void
end function

// The original charset shader is SRC_ALPHA/ONE_MINUS_SRC_ALPHA, rgbGen vertex.
// Retain one stream for the complete console instead of setting GL state and
// submitting two individual draw calls for every visible character.
/// @param media Mutable base Quake III match display record/storage; this routine assigns `media.glyphBatch`.
function beginGlyphBatch(media)
  if media==void then return fail("media is required") end if
  if media.glyphBatch==void then media.glyphBatch=window.createTriangleBatch(512);if media.glyphBatch is error then return media.glyphBatch end if end if
  window.resetTriangleBatch(media.glyphBatch);return media.glyphBatch
end function
/// Updates `media.glyphBatch` during base Quake III match display `reserveGlyphBatch`.
/// @param media Mutable base Quake III match display record/storage; this routine assigns `media.glyphBatch`.
function reserveGlyphBatch(media)
  if media.glyphBatch==void then started=beginGlyphBatch(media);if started is error then return started end if end if
  batch=media.glyphBatch;if batch.count+2<=batch.capacity then return batch end if
  capacity=batch.capacity*2;if capacity>window.TRIANGLE_BATCH_MAX_COUNT then capacity=window.TRIANGLE_BATCH_MAX_COUNT end if
  if capacity<batch.count+2 then return fail("console glyph batch exceeds native capacity") end if
  grown=window.createTriangleBatch(capacity);if grown is error then return grown end if
  if batch.count>0 then copyBytes(grown.data,0,batch.data,0,batch.count*window.TRIANGLE_BATCH_RECORD_BYTES) end if
  grown.count=batch.count;media.glyphBatch=grown;return grown
end function
/// Evaluates base Quake III match display `glyphChannel` and returns `0`, `255`, `value` according to its guard/selection conditions.
/// @param value Value tested by `value<0`, `value>255` before the calculation continues.
function glyphChannel(value) if value<0 then return 0 end if;if value>255 then return 255 end if;return value end function
/// Calls `mq3.client.baseq3_match_display.reserveGlyphBatch`, `mq3.platform.playable_window.writeScreenRect`, `mq3.client.baseq3_match_display.glyphChannel` from base Quake III match display `appendGlyphCode`. The final path returns `written`.
/// @param media Record read through `media.slot`.
/// @param code Value used by `code=code&255`.
/// @param x Horizontal coordinate in the coordinate space used by `appendGlyphCode`.
/// @param y Vertical coordinate in the coordinate space used by `appendGlyphCode`.
/// @param charWidth Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`.
/// @param charHeight Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`.
/// @param scaleX Value used by `written=window.writeScreenRect(batch,at,media.slot,x,y,charWidth,charHeight,u0,v0,u0+0.0625,v0+0.0625,scaleX,scaleY,[glyphChannel(red),glyphCh...`.
/// @param scaleY Value used by `written=window.writeScreenRect(batch,at,media.slot,x,y,charWidth,charHeight,u0,v0,u0+0.0625,v0+0.0625,scaleX,scaleY,[glyphChannel(red),glyphCh...`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
function appendGlyphCode(media,code,x,y,charWidth,charHeight,scaleX,scaleY,red,green,blue)
  code=code&255;if code==32 then return void end if
  if media==void then return fail("media is required") end if
  if charWidth<1 or charHeight<1 then return fail("positive character size required") end if
  batch=reserveGlyphBatch(media);if batch is error then return batch end if
  u0=(code&15)/16.0;v0=(code>>4)/16.0;at=batch.count;batch.count=batch.count+2
  written=window.writeScreenRect(batch,at,media.slot,x,y,charWidth,charHeight,u0,v0,u0+0.0625,v0+0.0625,scaleX,scaleY,[glyphChannel(red),glyphChannel(green),glyphChannel(blue),255]);if written is error then return written end if;return void
end function
/// Calls `mq3.client.baseq3_match_display.isColorEscape`, `mq3.client.baseq3_match_display.appendGlyphCode`, `mq3.client.baseq3_match_display.colorFor` from base Quake III match display `appendString`.
/// @param media Value used by `if media==void then return fail("media is required") end if`.
/// @param text Sequence read at `text[index]`, `text[index+1]`.
/// @param x Horizontal coordinate in the coordinate space used by `appendString`.
/// @param y Vertical coordinate in the coordinate space used by `appendString`.
/// @param charWidth Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`.
/// @param charHeight Value used by `if charWidth<1 or charHeight<1 then return fail("positive character size required") end if`.
/// @param scaleX Value used by `else written=appendGlyphCode(media,bytes(text[index])[0],cursor+2,y+2,charWidth,charHeight,scaleX,scaleY,0,0,0)`.
/// @param scaleY Value used by `else written=appendGlyphCode(media,bytes(text[index])[0],cursor+2,y+2,charWidth,charHeight,scaleX,scaleY,0,0,0)`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
/// @param shadow Value used by `if shadow then`.
function appendString(media,text,x,y,charWidth,charHeight,scaleX,scaleY,red,green,blue,shadow)
  if media==void then return fail("media is required") end if
  if charWidth<1 or charHeight<1 then return fail("positive character size required") end if
  if shadow then
    cursor=x;index=0
    while index<len(text)
      if isColorEscape(text,index) then index=index+2
      else written=appendGlyphCode(media,bytes(text[index])[0],cursor+2,y+2,charWidth,charHeight,scaleX,scaleY,0,0,0);if written is error then return written end if;cursor=cursor+charWidth;index=index+1 end if
    end while
  end if
  cursor=x;index=0;color=[red,green,blue]
  while index<len(text)
    if isColorEscape(text,index) then color=colorFor(text[index+1]);index=index+2
    else written=appendGlyphCode(media,bytes(text[index])[0],cursor,y,charWidth,charHeight,scaleX,scaleY,color[0],color[1],color[2]);if written is error then return written end if;cursor=cursor+charWidth;index=index+1 end if
  end while
  return void
end function
/// Calls `mq3.platform.playable_multitexture.setState`, `mq3.platform.playable_multitexture.setAlphaTest`, `mq3.platform.playable_multitexture.setTextureClamp` and additional helpers from base Quake III match display `flushGlyphBatch`. The final path returns `drawn`.
/// @param media Record read through `media.glyphBatch`, `media.glyphBatch.count`.
function flushGlyphBatch(media)
  if media==void then return fail("media is required") end if
  if media.glyphBatch==void or media.glyphBatch.count==0 then return 0 end if
  state=raster.setState(raster.BLEND_ALPHA,false,false);if state is error then return state end if
  raster.setAlphaTest(raster.ALPHA_TEST_NONE);raster.setTextureClamp(false);raster.setPolygonOffset(false)
  drawn=window.submitTriangleBatch(media.glyphBatch)
  raster.setState(raster.BLEND_OPAQUE,false,false)
  return drawn
end function

/// Calls `mq3.compat.numeric.trunc32` from base Quake III match display `timerText`. The final path returns `str(minutes)+":"+str(tens)+str(ones)`.
/// @param levelStartTime Value used by `elapsed=now-levelStartTime`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function timerText(levelStartTime,now)
  elapsed=now-levelStartTime;if elapsed<0 then elapsed=0 end if
  total=numeric.trunc32(elapsed/1000);minutes=numeric.trunc32(total/60);seconds=total-minutes*60
  tens=numeric.trunc32(seconds/10);ones=seconds-tens*10
  return str(minutes)+":"+str(tens)+str(ones)
end function

/// Calls `mq3.compat.numeric.trunc32`, `mq3.client.baseq3_match_display.Countdown` from base Quake III match display `countdown`. The final path returns `Countdown("Starts in: "+str(second+1),charWidth,numeric.trunc32(charWidth*1.5),second)`.
/// @param warmupEnd Value used by `if warmupEnd<=0 or now>warmupEnd then return void end if`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function countdown(warmupEnd,now)
  if warmupEnd<=0 or now>warmupEnd then return void end if
  second=numeric.trunc32((warmupEnd-now)/1000)
  charWidth=16
  if second==0 then charWidth=28 else if second==1 then charWidth=24 else if second==2 then charWidth=20 end if
  return Countdown("Starts in: "+str(second+1),charWidth,numeric.trunc32(charWidth*1.5),second)
end function

/// Returns the element/byte count of `strings.split(text,"\n")` for base Quake III match display `lineCount`.
/// @param text Argument 1 of `len`; passed as `strings.split(text,"\n")`.
function lineCount(text) return len(strings.split(text,"\n")) end function

/// Calls `mq3.client.baseq3_match_display.CenterPrint`, `mq3.client.baseq3_match_display.lineCount` from base Quake III match display `centerPrint`. The final path returns `CenterPrint(text,startedAt,y,charWidth,duration,lineCount(text))`.
/// @param text Text consumed or emitted by `centerPrint` in the base Quake III match display path.
/// @param startedAt Value used by `if typeof(text)!="string" or startedAt<0 then return fail("text and non-negative start time required") end if`.
/// @param y Vertical coordinate in the coordinate space used by `centerPrint`.
/// @param charWidth Value used by `if charWidth<=0 then charWidth=BIGCHAR_WIDTH end if`.
/// @param duration Lifetime or interval in the same units as this operation's clock.
function centerPrint(text,startedAt,y,charWidth,duration)
  if typeof(text)!="string" or startedAt<0 then return fail("text and non-negative start time required") end if
  if y<0 then y=CENTER_DEFAULT_Y end if
  if charWidth<=0 then charWidth=BIGCHAR_WIDTH end if
  if duration<=0 then duration=CENTER_DEFAULT_DURATION end if
  return CenterPrint(text,startedAt,y,charWidth,duration,lineCount(text))
end function

/// Calls `mq3.compat.numeric.trunc32` from base Quake III match display `centerAlpha`. The final path returns `255`.
/// @param center Record read through `center.startedAt`, `center.duration`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function centerAlpha(center,now)
  if center==void or center.startedAt==0 or now<center.startedAt then return 0 end if
  remaining=center.duration-(now-center.startedAt);if remaining<=0 then return 0 end if
  if remaining<FADE_TIME then return numeric.trunc32(255*remaining/FADE_TIME) end if
  return 255
end function

/// Calls `mq3.client.baseq3_match_display.timerText`, `mq3.client.baseq3_match_display.printLength`, `mq3.client.baseq3_match_display.drawString` from base Quake III match display `drawTimer`. The final path returns `drawString(media,text,x,y+2,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,scaleX,scaleY,255,255,255,true)`.
/// @param media Value used by `return drawString(media,text,x,y+2,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,scaleX,scaleY,255,255,255,true)`.
/// @param levelStartTime Value used by `text=timerText(levelStartTime,now)`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param width Width in the coordinate space used by `drawTimer`.
/// @param height Height in the coordinate space used by `drawTimer`.
/// @param y Vertical coordinate in the coordinate space used by `drawTimer`.
function drawTimer(media,levelStartTime,now,width,height,y)
  scaleX=width/VIRTUAL_WIDTH;scaleY=height/VIRTUAL_HEIGHT;text=timerText(levelStartTime,now)
  x=635-printLength(text)*BIGCHAR_WIDTH
  return drawString(media,text,x,y+2,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,scaleX,scaleY,255,255,255,true)
end function

/// Calls `mq3.client.baseq3_match_display.printLength`, `mq3.client.baseq3_match_display.drawString`, `mq3.client.baseq3_match_display.countdown` and additional helpers from base Quake III match display `drawWarmup`.
/// @param media Value used by `return drawString(media,text,x,24,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,width/VIRTUAL_WIDTH,height/VIRTUAL_HEIGHT,255,255,255,true)`.
/// @param gametypeName Value used by `if gametypeName!="" then`.
/// @param warmupEnd Value used by `if warmupEnd<0 then`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param width Width in the coordinate space used by `drawWarmup`.
/// @param height Height in the coordinate space used by `drawWarmup`.
function drawWarmup(media,gametypeName,warmupEnd,now,width,height)
  if warmupEnd<0 then
    text="Waiting for players";x=320-printLength(text)*BIGCHAR_WIDTH/2
    return drawString(media,text,x,24,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,width/VIRTUAL_WIDTH,height/VIRTUAL_HEIGHT,255,255,255,true)
  end if
  current=countdown(warmupEnd,now);if current==void then return void end if
  scaleX=width/VIRTUAL_WIDTH;scaleY=height/VIRTUAL_HEIGHT
  if gametypeName!="" then
    widthChars=printLength(gametypeName);cw=GIANT_WIDTH;if widthChars>20 then cw=numeric.trunc32(640/widthChars) end if
    drawString(media,gametypeName,320-widthChars*cw/2,25,cw,numeric.trunc32(cw*1.1),scaleX,scaleY,255,255,255,true)
  end if
  x=320-printLength(current.text)*current.charWidth/2
  return drawString(media,current.text,x,70,current.charWidth,current.charHeight,scaleX,scaleY,255,255,255,true)
end function

/// Calls `mq3.client.baseq3_match_display.centerAlpha`, `std.string.split`, `slice` and additional helpers from base Quake III match display `drawCenter`.
/// @param media Value used by `drawString(media,text,x,y,center.charWidth,numeric.trunc32(center.charWidth*1.5),scaleX,scaleY,alpha,alpha,alpha,true)`.
/// @param center Record read through `center.text`, `center.y`, `center.lines`, `center.charWidth`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param width Width in the coordinate space used by `drawCenter`.
/// @param height Height in the coordinate space used by `drawCenter`.
function drawCenter(media,center,now,width,height)
  alpha=centerAlpha(center,now);if alpha==0 then return void end if
  lines=strings.split(center.text,"\n");y=center.y-center.lines*BIGCHAR_HEIGHT/2
  scaleX=width/VIRTUAL_WIDTH;scaleY=height/VIRTUAL_HEIGHT
  for each text in lines
    if len(text)>50 then text=slice(text,0,50) end if
    x=320-printLength(text)*center.charWidth/2
    drawString(media,text,x,y,center.charWidth,numeric.trunc32(center.charWidth*1.5),scaleX,scaleY,alpha,alpha,alpha,true)
    y=y+numeric.trunc32(center.charWidth*1.5)
  end for
  return void
end function

/// Calls `mq3.client.baseq3_match_display.ScoreRow` from base Quake III match display `scoreRows`. The final path returns `[player,enemies]`.
/// @param playerScore Value used by `if playerScore<0 or enemyScore<0 or playerDeaths<0 then return fail("non-negative scoreboard values required") end if`.
/// @param enemyScore Value used by `if playerScore<0 or enemyScore<0 or playerDeaths<0 then return fail("non-negative scoreboard values required") end if`.
/// @param playerDeaths Value used by `if playerScore<0 or enemyScore<0 or playerDeaths<0 then return fail("non-negative scoreboard values required") end if`.
function scoreRows(playerScore,enemyScore,playerDeaths)
  if playerScore<0 or enemyScore<0 or playerDeaths<0 then return fail("non-negative scoreboard values required") end if
  player=ScoreRow("YOU",playerScore,playerDeaths,true,255,255,255)
  enemies=ScoreRow("SARGE BOTS",enemyScore,playerScore,false,255,80,80)
  if enemyScore>playerScore then return [enemies,player] end if
  return [player,enemies]
end function

/// Calls `mq3.client.baseq3_match_display.scoreRows`, `mq3.client.cgame_scoreboard.state`, `mq3.client.cgame_scoreboard.client` and additional helpers from base Quake III match display `drawScoreboard`. The final path returns `len(state.scores)`.
/// @param media Value used by `if media==void or width<320 or height<240 then return fail("media and a 320x240 surface are required") end if`.
/// @param width Width in the coordinate space used by `drawScoreboard`.
/// @param height Height in the coordinate space used by `drawScoreboard`.
/// @param playerScore Value assigned to `state.playerScore`, `you.score`.
/// @param enemyScore Value assigned to `enemy.score`.
/// @param playerDeaths Value used by `rows=scoreRows(playerScore,enemyScore,playerDeaths)`.
function drawScoreboard(media,width,height,playerScore,enemyScore,playerDeaths)
  if media==void or width<320 or height<240 then return fail("media and a 320x240 surface are required") end if
  rows=scoreRows(playerScore,enemyScore,playerDeaths);if rows is error then return rows end if
  scaleX=width/VIRTUAL_WIDTH;scaleY=height/VIRTUAL_HEIGHT
  state=oldScoreboard.state();state.showScores=true;state.pmType=oldScoreboard.PM_INTERMISSION;state.clientNum=0;state.playerTeam=oldScoreboard.TEAM_FREE;state.playerScore=playerScore;state.rank=0
  you=oldScoreboard.client("YOU",oldScoreboard.TEAM_FREE);you.score=playerScore;enemy=oldScoreboard.client("SARGE BOTS",oldScoreboard.TEAM_FREE);enemy.score=enemyScore
  state.clients=[you,enemy];state.scores=[oldScoreboard.score(0,playerScore,0,0),oldScoreboard.score(1,enemyScore,0,0)];state.numScores=2
  generated=oldScoreboard.drawOldScoreboard(state)
  for each command in generated.commands
    if command.kind=="big" then drawString(media,command.text,command.x,command.y,16,16,scaleX,scaleY,255,255,255,true)
    else if command.kind=="small" then drawString(media,command.text,command.x,command.y,8,16,scaleX,scaleY,255,255,255,true)
    else if command.kind=="giant" then drawString(media,command.text,command.x,command.y,32,48,scaleX,scaleY,255,255,255,true) end if
  end for
  return len(state.scores)
end function

// Integration entry point. The caller owns timing and can pass void for center.
/// @param media Value used by `if media==void or width<320 or height<240 then return fail("media and a 320x240 surface are required") end if`.
/// @param width Width in the coordinate space used by `draw`.
/// @param height Height in the coordinate space used by `draw`.
/// @param levelStartTime Value used by `if showTimer then drawTimer(media,levelStartTime,now,width,height,0) end if`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
/// @param showTimer Value used by `if showTimer then drawTimer(media,levelStartTime,now,width,height,0) end if`.
/// @param gametypeName Value used by `if warmupEnd!=0 then drawWarmup(media,gametypeName,warmupEnd,now,width,height) end if`.
/// @param warmupEnd Value used by `if warmupEnd!=0 then drawWarmup(media,gametypeName,warmupEnd,now,width,height) end if`.
/// @param center Value used by `if center!=void then drawCenter(media,center,now,width,height) end if`.
function draw(media,width,height,levelStartTime,now,showTimer,gametypeName,warmupEnd,center)
  if media==void or width<320 or height<240 then return fail("media and a 320x240 surface are required") end if
  if showTimer then drawTimer(media,levelStartTime,now,width,height,0) end if
  if warmupEnd!=0 then drawWarmup(media,gametypeName,warmupEnd,now,width,height) end if
  if center!=void then drawCenter(media,center,now,width,height) end if
  return void
end function
