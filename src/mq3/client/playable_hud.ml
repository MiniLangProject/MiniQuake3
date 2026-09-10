// SPDX-License-Identifier: GPL-2.0-or-later
// Compact line-rendered status display for the playable MiniQuake3 preview.
package mq3.client.playable_hud

import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric

const GLYPH_WIDTH=5
const GLYPH_HEIGHT=7
const VALUE_MAX=999

struct HudState health armor ammo status helpText end struct
struct HudLayout margin valueY labelY statusY helpY crosshairSize end struct

function line(x0,y0,x1,y1,red,green,blue)
  window.lineNative(numeric.trunc32(x0),numeric.trunc32(y0),numeric.trunc32(x1),numeric.trunc32(y1),red,green,blue)
  return void
end function

function clampValue(value)
  if value<0 then return 0 end if
  if value>VALUE_MAX then return VALUE_MAX end if
  return value
end function

function state(health,armor,ammo,status,helpText)
  return HudState(clampValue(health),clampValue(armor),clampValue(ammo),status,helpText)
end function

function setValues(hud,health,armor,ammo)
  if hud==void then return error(7490,"HUD state is required") end if
  hud.health=clampValue(health);hud.armor=clampValue(armor);hud.ammo=clampValue(ammo)
  return void
end function

function layout(width,height)
  if width<160 or height<120 then return error(7491,"HUD surface is too small") end if
  scale=2
  if width>=960 and height>=540 then scale=3 end if
  return HudLayout(18,height-25*scale,height-16*scale,16,38,5*scale)
end function

function glyph(character)
  if character=="A" then return [14,17,17,31,17,17,17] end if
  if character=="B" then return [30,17,17,30,17,17,30] end if
  if character=="C" then return [14,17,16,16,16,17,14] end if
  if character=="D" then return [30,17,17,17,17,17,30] end if
  if character=="E" then return [31,16,16,30,16,16,31] end if
  if character=="F" then return [31,16,16,30,16,16,16] end if
  if character=="G" then return [14,17,16,23,17,17,15] end if
  if character=="H" then return [17,17,17,31,17,17,17] end if
  if character=="I" then return [31,4,4,4,4,4,31] end if
  if character=="J" then return [7,2,2,2,18,18,12] end if
  if character=="K" then return [17,18,20,24,20,18,17] end if
  if character=="L" then return [16,16,16,16,16,16,31] end if
  if character=="M" then return [17,27,21,21,17,17,17] end if
  if character=="N" then return [17,25,21,19,17,17,17] end if
  if character=="O" then return [14,17,17,17,17,17,14] end if
  if character=="P" then return [30,17,17,30,16,16,16] end if
  if character=="Q" then return [14,17,17,17,21,18,13] end if
  if character=="R" then return [30,17,17,30,20,18,17] end if
  if character=="S" then return [15,16,16,14,1,1,30] end if
  if character=="T" then return [31,4,4,4,4,4,4] end if
  if character=="U" then return [17,17,17,17,17,17,14] end if
  if character=="V" then return [17,17,17,17,17,10,4] end if
  if character=="W" then return [17,17,17,21,21,27,17] end if
  if character=="X" then return [17,17,10,4,10,17,17] end if
  if character=="Y" then return [17,17,10,4,4,4,4] end if
  if character=="Z" then return [31,1,2,4,8,16,31] end if
  if character=="0" then return [14,17,19,21,25,17,14] end if
  if character=="1" then return [4,12,4,4,4,4,14] end if
  if character=="2" then return [14,17,1,2,4,8,31] end if
  if character=="3" then return [30,1,1,14,1,1,30] end if
  if character=="4" then return [2,6,10,18,31,2,2] end if
  if character=="5" then return [31,16,16,30,1,1,30] end if
  if character=="6" then return [14,16,16,30,17,17,14] end if
  if character=="7" then return [31,1,2,4,8,8,8] end if
  if character=="8" then return [14,17,17,14,17,17,14] end if
  if character=="9" then return [14,17,17,15,1,1,14] end if
  if character==":" then return [0,4,4,0,4,4,0] end if
  if character=="-" then return [0,0,0,31,0,0,0] end if
  if character=="/" then return [1,1,2,4,8,16,16] end if
  if character=="+" then return [0,4,4,31,4,4,0] end if
  if character=="." then return [0,0,0,0,0,12,12] end if
  if character=="!" then return [4,4,4,4,4,0,4] end if
  return [0,0,0,0,0,0,0]
end function

function textWidth(text,scale)
  if scale<=0 then return error(7492,"HUD text scale must be positive") end if
  if len(text)==0 then return 0 end if
  return len(text)*(GLYPH_WIDTH+1)*scale-scale
end function

function drawText(text,x,y,scale,red,green,blue)
  if scale<=0 then return error(7493,"HUD text scale must be positive") end if
  cursor=x
  for index=0 to len(text)-1
    rows=glyph(text[index])
    for row=0 to GLYPH_HEIGHT-1
      for column=0 to GLYPH_WIDTH-1
        if (rows[row]&(1<<(GLYPH_WIDTH-1-column)))!=0 then
          x0=cursor+column*scale;y0=y+row*scale
          line(x0,y0,x0+scale-1,y0,red,green,blue)
        end if
      end for
    end for
    cursor=cursor+(GLYPH_WIDTH+1)*scale
  end for
  return void
end function

function drawCrosshair(width,height,size,red,green,blue)
  if size<2 then return error(7494,"HUD crosshair is too small") end if
  x=width/2;y=height/2;gap=size/3
  line(x-size,y,x-gap,y,red,green,blue)
  line(x+gap,y,x+size,y,red,green,blue)
  line(x,y-size,x,y-gap,red,green,blue)
  line(x,y+gap,x,y+size,red,green,blue)
  return void
end function

function draw(hud,width,height)
  if hud==void then return error(7495,"HUD state is required") end if
  placement=layout(width,height)
  scale=2;if width>=960 and height>=540 then scale=3 end if
  third=width/3
  drawCrosshair(width,height,placement.crosshairSize,255,220,96)
  drawText("HEALTH",placement.margin,placement.labelY,scale,210,210,210)
  drawText(str(hud.health),placement.margin,placement.valueY,scale+1,255,96,72)
  drawText("ARMOR",third+placement.margin,placement.labelY,scale,210,210,210)
  drawText(str(hud.armor),third+placement.margin,placement.valueY,scale+1,96,180,255)
  drawText("AMMO",third*2+placement.margin,placement.labelY,scale,210,210,210)
  drawText(str(hud.ammo),third*2+placement.margin,placement.valueY,scale+1,255,210,72)
  if len(hud.status)>0 then drawText(hud.status,placement.margin,placement.statusY,2,255,220,96) end if
  if len(hud.helpText)>0 then drawText(hud.helpText,placement.margin,placement.helpY,2,170,195,205) end if
  return void
end function
