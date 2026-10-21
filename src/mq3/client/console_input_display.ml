// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Visible Field_Draw-style console/chat line for the native QVM window.
package mq3.client.console_input_display

import mq3.client.console_input as consoleState
import mq3.client.baseq3_match_display as font
import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric

struct Presentation active kind text x y panelTop panelBottom end struct

function bounded(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
function fieldText(edit,prompt,now)
  data=bytes(edit.text);start=bounded(edit.scroll,0,len(data));count=edit.widthInChars
  if start+count>len(data) then count=len(data)-start end if
  visible=decode(slice(data,start,count));cursor=bounded(edit.cursor-start,0,len(bytes(visible)))
  // Field_VariableSizeDraw blinks at cls.realtime bit 8.
  if ((now>>8)&1)==0 then raw=bytes(visible);visible=decode(slice(raw,0,cursor))+"_"+decode(slice(raw,cursor,len(raw)-cursor)) end if
  return prompt+visible
end function
function present(state,now)
  if state==void then return Presentation(false,"","",0,0,0,0) end if
  if (state.catcher&consoleState.KEYCATCH_CONSOLE)!=0 then return Presentation(true,"console",fieldText(state.console,"]",now),8,196,0,216) end if
  if (state.catcher&consoleState.KEYCATCH_MESSAGE)!=0 then
    prompt="say: ";if state.chatPlayerNum!=-1 then prompt="tell "+str(state.chatPlayerNum)+": " else if state.chatTeam then prompt="say_team: " end if
    return Presentation(true,"message",fieldText(state.chat,prompt,now),8,448,438,472)
  end if
  return Presentation(false,"","",0,0,0,0)
end function
function draw(media,state,width,height,now)
  view=present(state,now);if not view.active then return false end if
  scaleX=width/640.0;scaleY=height/480.0;top=numeric.trunc32(view.panelTop*scaleY);bottom=numeric.trunc32(view.panelBottom*scaleY)
  for y=top to bottom window.drawLine(window.LoadingPoint(0,y),window.LoadingPoint(width-1,y),8,8,12) end for
  drawn=font.drawString(media,view.text,view.x,view.y,8,16,scaleX,scaleY,255,255,255,true);if drawn is error then return drawn end if
  return true
end function
