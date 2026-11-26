// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Visible Field_Draw-style console/chat line for the native QVM window.
package mq3.client.console_input_display

import mq3.client.console_input as consoleState
import mq3.client.baseq3_match_display as font
import mq3.platform.playable_window as window
import mq3.compat.numeric as numeric

/// Stores console input display presentation record, including `active`, `kind`, `text`, `x`, `y`, `panelTop` and additional values.
struct Presentation
  /// When constructing this record, `present` supplies `false` for this member.
  active
  /// Drawing primitive or presentation category selecting how this record is rendered.
  kind
  /// Visible console or chat input string, including the prompt and cursor marker.
  text
  /// Horizontal coordinate of the visible console or chat input text in the target display.
  x
  /// Vertical coordinate of the visible console or chat input text in the target display.
  y
  /// When constructing this record, `present` supplies `0` for this member.
  panelTop
  /// When constructing this record, `present` supplies `0` for this member.
  panelBottom
end struct

/// Evaluates console input display `bounded` and returns `low`, `high`, `value` according to its guard/selection conditions.
/// @param value Value tested by `value<low`, `value>high` before the calculation continues.
/// @param low Lower bound used for comparison or clamping.
/// @param high Upper bound used for comparison or clamping.
function bounded(value,low,high) if value<low then return low end if;if value>high then return high end if;return value end function
/// Calls `mq3.client.console_input_display.bounded`, `decode`, `slice` from console input display `fieldText`. The final path returns `prompt+visible`.
/// @param edit Record read through `edit.text`, `edit.scroll`, `edit.widthInChars`, `edit.cursor`.
/// @param prompt Value used by `return prompt+visible`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function fieldText(edit,prompt,now)
  data=bytes(edit.text);start=bounded(edit.scroll,0,len(data));count=edit.widthInChars
  if start+count>len(data) then count=len(data)-start end if
  visible=decode(slice(data,start,count));cursor=bounded(edit.cursor-start,0,len(bytes(visible)))
  // Field_VariableSizeDraw blinks at cls.realtime bit 8.
  if ((now>>8)&1)==0 then raw=bytes(visible);visible=decode(slice(raw,0,cursor))+"_"+decode(slice(raw,cursor,len(raw)-cursor)) end if
  return prompt+visible
end function
/// Calls `mq3.client.console_input_display.Presentation`, `mq3.client.console_input_display.fieldText` from console input display `present`. The final path returns `Presentation(true,"message",fieldText(state.chat,prompt,now),8,448,438,472)`.
/// @param state Record read through `state.catcher`, `state.console`, `state.chatPlayerNum`, `state.chatTeam` and additional values.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function present(state,now)
  if state==void then return Presentation(false,"","",0,0,0,0) end if
  if (state.catcher&consoleState.KEYCATCH_CONSOLE)!=0 then return Presentation(true,"console",fieldText(state.console,"]",now),8,196,0,216) end if
  if (state.catcher&consoleState.KEYCATCH_MESSAGE)!=0 then
    prompt="say: ";if state.chatPlayerNum!=-1 then prompt="tell "+str(state.chatPlayerNum)+": " else if state.chatTeam then prompt="say_team: " end if
    return Presentation(true,"message",fieldText(state.chat,prompt,now),8,448,438,472)
  end if
  return Presentation(false,"","",0,0,0,0)
end function
/// Calls `mq3.client.console_input_display.present`, `mq3.compat.numeric.trunc32`, `mq3.platform.playable_window.drawLine` and additional helpers from console input display `draw`.
/// @param media Value used by `drawn=font.drawString(media,view.text,view.x,view.y,8,16,scaleX,scaleY,255,255,255,true)`.
/// @param state Shared console input display state passed to the helper calls in `draw`.
/// @param width Width in the coordinate space used by `draw`.
/// @param height Height in the coordinate space used by `draw`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function draw(media,state,width,height,now)
  view=present(state,now);if not view.active then return false end if
  scaleX=width/640.0;scaleY=height/480.0;top=numeric.trunc32(view.panelTop*scaleY);bottom=numeric.trunc32(view.panelBottom*scaleY)
  for y=top to bottom window.drawLine(window.LoadingPoint(0,y),window.LoadingPoint(width-1,y),8,8,12) end for
  drawn=font.drawString(media,view.text,view.x,view.y,8,16,scaleX,scaleY,255,255,255,true);if drawn is error then return drawn end if
  return true
end function
