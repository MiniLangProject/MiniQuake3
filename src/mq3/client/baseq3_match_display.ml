// SPDX-License-Identifier: GPL-2.0-or-later
// Retail Baseq3 match text: bigchars atlas, warmup, timer and center print.
package mq3.client.baseq3_match_display

import mq3.format.pk3 as pk3
import mq3.renderer.playable_materials as materials
import mq3.platform.playable_window as window
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

struct Media imageName image slot end struct
struct CenterPrint text startedAt y charWidth duration lines end struct
struct Countdown text charWidth charHeight second end struct
struct ScoreRow name score deaths localPlayer red green blue end struct
struct Point x y depth end struct

function fail(message) return error(7583,"Baseq3 match display: "+message) end function

// cgs.media.charsetShader is registered from this exact retail shader name.
function load(archive,textureSlot)
  if archive==void then return fail("PK3 archive is required") end if
  if textureSlot<0 or textureSlot>=512 then return fail("texture slot outside native range") end if
  scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  name="gfx/2d/bigchars";mapped=materials.mappedImageName(scripts[0],name);if mapped==void then mapped=name end if
  loaded=materials.loadImage(archive,mapped)
  if loaded==void and mapped!=name then loaded=materials.loadImage(archive,name) end if
  if loaded==void then return fail("missing retail artwork "+name) end if
  return Media(loaded[0],loaded[1],textureSlot)
end function

function upload(media)
  if media==void then return fail("media is required") end if
  if not window.uploadTextureNoMip(media.slot,media.image.pixels,media.image.width,media.image.height) then return fail("could not upload "+media.imageName) end if
  return true
end function

function release(media) if media!=void then window.releaseTexture(media.slot) end if;return void end function

function point(x,y) return Point(x,y,0.001) end function

function glyphCell(character)
  if typeof(character)!="string" or len(character)!=1 then return fail("glyph must be one character") end if
  code=bytes(character)[0]&255
  return [code&15,code>>4]
end function

function isColorEscape(text,index)
  return index+1<len(text) and text[index]=="^" and text[index+1]!="^"
end function

function printLength(text)
  count=0;index=0
  while index<len(text)
    if isColorEscape(text,index) then index=index+2 else count=count+1;index=index+1 end if
  end while
  return count
end function

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

function timerText(levelStartTime,now)
  elapsed=now-levelStartTime;if elapsed<0 then elapsed=0 end if
  total=numeric.trunc32(elapsed/1000);minutes=numeric.trunc32(total/60);seconds=total-minutes*60
  tens=numeric.trunc32(seconds/10);ones=seconds-tens*10
  return str(minutes)+":"+str(tens)+str(ones)
end function

function countdown(warmupEnd,now)
  if warmupEnd<=0 or now>warmupEnd then return void end if
  second=numeric.trunc32((warmupEnd-now)/1000)
  charWidth=16
  if second==0 then charWidth=28 else if second==1 then charWidth=24 else if second==2 then charWidth=20 end if
  return Countdown("Starts in: "+str(second+1),charWidth,numeric.trunc32(charWidth*1.5),second)
end function

function lineCount(text) return len(strings.split(text,"\n")) end function

function centerPrint(text,startedAt,y,charWidth,duration)
  if typeof(text)!="string" or startedAt<0 then return fail("text and non-negative start time required") end if
  if y<0 then y=CENTER_DEFAULT_Y end if
  if charWidth<=0 then charWidth=BIGCHAR_WIDTH end if
  if duration<=0 then duration=CENTER_DEFAULT_DURATION end if
  return CenterPrint(text,startedAt,y,charWidth,duration,lineCount(text))
end function

function centerAlpha(center,now)
  if center==void or center.startedAt==0 or now<center.startedAt then return 0 end if
  remaining=center.duration-(now-center.startedAt);if remaining<=0 then return 0 end if
  if remaining<FADE_TIME then return numeric.trunc32(255*remaining/FADE_TIME) end if
  return 255
end function

function drawTimer(media,levelStartTime,now,width,height,y)
  scaleX=width/VIRTUAL_WIDTH;scaleY=height/VIRTUAL_HEIGHT;text=timerText(levelStartTime,now)
  x=635-printLength(text)*BIGCHAR_WIDTH
  return drawString(media,text,x,y+2,BIGCHAR_WIDTH,BIGCHAR_HEIGHT,scaleX,scaleY,255,255,255,true)
end function

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

function scoreRows(playerScore,enemyScore,playerDeaths)
  if playerScore<0 or enemyScore<0 or playerDeaths<0 then return fail("non-negative scoreboard values required") end if
  player=ScoreRow("YOU",playerScore,playerDeaths,true,255,255,255)
  enemies=ScoreRow("SARGE BOTS",enemyScore,playerScore,false,255,80,80)
  if enemyScore>playerScore then return [enemies,player] end if
  return [player,enemies]
end function

function drawScoreboard(media,width,height,playerScore,enemyScore,playerDeaths)
  if media==void or width<320 or height<240 then return fail("media and a 320x240 surface are required") end if
  rows=scoreRows(playerScore,enemyScore,playerDeaths);if rows is error then return rows end if
  scaleX=width/VIRTUAL_WIDTH;scaleY=height/VIRTUAL_HEIGHT
  drawString(media,"SCOREBOARD",240,204,16,16,scaleX,scaleY,255,255,255,true)
  drawString(media,"NAME",96,236,12,16,scaleX,scaleY,255,220,96,true)
  drawString(media,"SCORE",384,236,12,16,scaleX,scaleY,255,220,96,true)
  drawString(media,"DEATHS",504,236,12,16,scaleX,scaleY,255,220,96,true)
  y=266
  for each row in rows
    name=row.name;if row.localPlayer then name="^2"+name end if
    drawString(media,name,96,y,16,20,scaleX,scaleY,row.red,row.green,row.blue,true)
    drawString(media,str(row.score),420,y,16,20,scaleX,scaleY,row.red,row.green,row.blue,true)
    drawString(media,str(row.deaths),548,y,16,20,scaleX,scaleY,row.red,row.green,row.blue,true)
    y=y+34
  end for
  return len(rows)
end function

// Integration entry point. The caller owns timing and can pass void for center.
function draw(media,width,height,levelStartTime,now,showTimer,gametypeName,warmupEnd,center)
  if media==void or width<320 or height<240 then return fail("media and a 320x240 surface are required") end if
  if showTimer then drawTimer(media,levelStartTime,now,width,height,0) end if
  if warmupEnd!=0 then drawWarmup(media,gametypeName,warmupEnd,now,width,height) end if
  if center!=void then drawCenter(media,center,now,width,height) end if
  return void
end function
