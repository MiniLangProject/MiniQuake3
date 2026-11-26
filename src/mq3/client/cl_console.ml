// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete client/cl_console.c transcript, notify, scrolling and animation facade.
package mq3.client.cl_console

import mq3.client.console_input as clConsoleInput
import mq3.client.console_input_display as inputDisplay
import mq3.compat.numeric as numeric
import std.fs as fs
import std.ds.list as lists

/// Number of recent console-line timestamps retained for notification fading.
const NUM_CON_TIMES=4
/// Capacity of the console scrollback text buffer.
const CON_TEXTSIZE=32768
/// Fallback console width setting used when constructing the native client simulation or effect
/// configuration.
const DEFAULT_CONSOLE_WIDTH=78
/// Smallchar font metric controlling width in virtual UI coordinates.
const SMALLCHAR_WIDTH=8
/// Smallchar font metric controlling height in virtual UI coordinates.
const SMALLCHAR_HEIGHT=16
/// Native UI keyboard-capture bit exposed alongside the console's input-catcher definitions.
const KEYCATCH_UI=2
/// Input-capture bit that routes keyboard events to the cgame subsystem.
const KEYCATCH_CGAME=8
/// Client connection state with no active server connection.
const CA_DISCONNECTED=0
/// Connection-state value for normal gameplay after game-state loading, defined for selecting in-game
/// notification and console presentation.
const CA_ACTIVE=8
/// Native console palette index selecting white text.
const COLOR_WHITE=7
/// Native console palette index selecting red text.
const COLOR_RED=1
/// Capacity limit for the clients collection or bounded storage used by this client module.
const MAX_CLIENTS=64

/// Stores engine client console host-service callbacks, including `context`, `startDemoLoopFn`, `crosshairPlayerFn`, `lastAttackerFn`.
struct Services
  /// Caller-supplied value forwarded unchanged to the service callbacks for console scrollback and
  /// notification drawing.
  context
  /// Host callback for the start demo loop operation; an unset callback leaves that host operation
  /// unavailable.
  startDemoLoopFn
  /// Host callback for the crosshair player operation; an unset callback leaves that host operation
  /// unavailable.
  crosshairPlayerFn
  /// Host callback for the last attacker operation; an unset callback leaves that host operation
  /// unavailable.
  lastAttackerFn
end struct
/// Stores engine client console glyph record, including `x`, `y`, `ch`, `color`.
struct Glyph
  /// Horizontal coordinate of a console character in the target display.
  x
  /// Vertical coordinate of a console character in the target display.
  y
  /// When constructing this record, `lineGlyphs` supplies `ch` for this member.
  ch
  /// Console palette index from zero through seven encoded with this glyph character.
  color
end struct
/// Stores engine client console console line record, including `line`, `text`, `glyphs`.
struct ConsoleLine
  /// When constructing this record, `Con_DrawNotify` supplies `line` for this member.
  line
  /// Character text of one console scrollback line, paired with separately positioned and colored
  /// glyphs.
  text
  /// When constructing this record, `Con_DrawNotify` supplies
  /// `lineGlyphs(state,line,SMALLCHAR_WIDTH,vertical)` for this member.
  glyphs
end struct
/// Stores engine client console notify view record, including `lines`, `chat`.
struct NotifyView
  /// When constructing this record, `Con_DrawNotify` supplies `lines` for this member.
  lines
  /// When constructing this record, `Con_DrawNotify` supplies `chat` for this member.
  chat
end struct
/// Stores engine client console solid view record, including `fraction`, `scanlines`, `rows`, `backscrolled`, `version`, `glyphs` and additional values.
struct SolidView
  /// When constructing this record, `Con_DrawSolidConsole` supplies `fraction` for this member.
  fraction
  /// When constructing this record, `Con_DrawSolidConsole` supplies `lines` for this member.
  scanlines
  /// When constructing this record, `Con_DrawSolidConsole` supplies `rows` for this member.
  rows
  /// When constructing this record, `Con_DrawSolidConsole` supplies `back` for this member.
  backscrolled
  /// Graphics-driver or renderer version string exposed to the video-settings UI.
  version
  /// When constructing this record, `Con_DrawSolidConsole` supplies `glyphs.toArray()` for this member.
  glyphs
  /// When constructing this record, `Con_DrawSolidConsole` supplies `Con_DrawInput(state)` for this
  /// member.
  input
end struct
/// Stores engine client console draw view record, including `mode`, `solid`, `notify`.
struct DrawView
  /// When constructing this record, `Con_DrawConsole` supplies `"solid"` for this member.
  mode
  /// When constructing this record, `Con_DrawConsole` supplies
  /// `Con_DrawSolidConsole(state,1.0,videoWidth,videoHeight,version)` for this member.
  solid
  /// When constructing this record, `Con_DrawConsole` supplies an absent (`void`) value for this
  /// member.
  notify
end struct
/// Stores engine client console state, including `initialized`, `text`, `current`, `x`, `display`, `linewidth` and additional values.
struct State
  /// True once console storage and line wrapping have been initialized for the current screen width.
  initialized
  /// Editable or accumulated console text retained for drawing and command submission.
  text
  /// When constructing this record, `create` supplies `0` for this member. Used by `Con_CheckResize`
  /// and `Con_Linefeed` during subsequent processing.
  current
  /// Current character column in the console's output line, advanced as characters are appended to
  /// scrollback.
  x
  /// When constructing this record, `create` supplies `0` for this member. Used by `Con_CheckResize`
  /// and `Con_Linefeed` during subsequent processing.
  display
  /// When constructing this record, `create` supplies `0` for this member. Used by `lineOffset` and
  /// `lineText` during subsequent processing.
  linewidth
  /// When constructing this record, `create` supplies `0` for this member. Used by `lineOffset` and
  /// `lineText` during subsequent processing.
  totallines
  /// When constructing this record, `create` supplies `0.0` for this member.
  xadjust
  /// When constructing this record, `create` supplies `0.0` for this member. Used by `Con_DrawConsole`
  /// and `Con_RunConsole` during subsequent processing.
  displayFrac
  /// When constructing this record, `create` supplies `0.0` for this member. Used by `Con_RunConsole`
  /// and `Con_Close` during subsequent processing.
  finalFrac
  /// When constructing this record, `create` supplies `0` for this member. Used by `Con_DrawInput` and
  /// `Con_DrawSolidConsole` during subsequent processing.
  vislines
  /// When constructing this record, `create` supplies `[0,0,0,0]` for this member. Used by
  /// `Con_ClearNotify` and `Con_Linefeed` during subsequent processing.
  times
  /// RGBA console modulation color retained in the console runtime state.
  color
  /// When constructing this record, `create` supplies `3.0` for this member. Used by `Con_Init` and
  /// `Con_DrawNotify` during subsequent processing.
  notifyTime
  /// When constructing this record, `create` supplies `3.0` for this member. Used by `Con_Init` and
  /// `Con_RunConsole` during subsequent processing.
  conSpeed
  /// Local client clock in milliseconds used for console notification ages and input cursor blinking.
  realtime
  /// When constructing this record, `create` supplies `0` for this member. Used by `Con_RunConsole`
  /// during subsequent processing.
  realFrametime
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `CL_ConsolePrint` during subsequent processing.
  noPrint
  /// Client connection-state identifier controlling handshake, loading, and active-play behavior.
  connectionState
  /// Bitmask selecting which subsystems currently intercept keyboard input.
  keyCatchers
  /// When constructing this record, `create` supplies `0` for this member. Used by `Con_DrawNotify` and
  /// `Con_DrawConsole` during subsequent processing.
  uiOrCgameCatcher
  /// When constructing this record, `create` supplies `false` for this member. Used by `Con_DrawNotify`
  /// during subsequent processing.
  intermission
  /// When constructing this record, `create` supplies `true` for this member. Used by `Con_Close`
  /// during subsequent processing.
  clientRunning
  /// When constructing this record, `create` supplies `consoleInput` for this member. Used by
  /// `setCatcher` and `Con_Init` during subsequent processing.
  consoleInput
  /// Host-adapter callbacks and context used to execute the module's engine operations.
  host
  /// When constructing this record, `create` supplies an empty list for this member. Used by `Con_Init`
  /// during subsequent processing.
  commands
end struct

/// Creates a `mq3.client.cl_console.Services` record. Assigns `context` from `context`.
/// @param context Value used to initialize `Services.context`.
function services(context) return Services(context,void,void,void) end function
/// Computes a nonnegative ring-buffer index from a possibly negative value and a positive modulus.
/// @param value Value used by `result=value%modulus`.
/// @param modulus Value used by `result=value%modulus`.
function positiveMod(value,modulus) result=value%modulus;if result<0 then result=result+modulus end if;return result end function
/// Computes `(COLOR_WHITE<<8)|32` for engine client console `whiteCell`.
function whiteCell() return (COLOR_WHITE<<8)|32 end function
/// Creates an array from `CON_TEXTSIZE, whiteCell()` for engine client console `blankText`.
function blankText() return array(CON_TEXTSIZE,whiteCell()) end function
/// Updates `consoleInput.consoleRuntime` during engine client console `create`.
/// @param consoleInput Mutable engine client console record/storage; this routine assigns `consoleInput.consoleRuntime`.
/// @param host host record passed to the engine client console helper calls.
function create(consoleInput,host)
  if consoleInput==void then consoleInput=clConsoleInput.create(DEFAULT_CONSOLE_WIDTH,clConsoleInput.services(void)) end if
  state=State(false,blankText(),0,0,0,0,0,0.0,0.0,0.0,0,[0,0,0,0],[1.0,1.0,1.0,1.0],3.0,3.0,0,0,false,CA_DISCONNECTED,consoleInput.catcher,0,false,true,consoleInput,host,[]);consoleInput.consoleRuntime=state;return state
end function
/// Updates `state.keyCatchers`, `state.consoleInput.catcher` during engine client console `setCatcher`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.keyCatchers`, `state.consoleInput.catcher`.
/// @param value Value assigned to `state.keyCatchers`, `state.consoleInput.catcher`.
function setCatcher(state,value) state.keyCatchers=value;if state.consoleInput!=void then state.consoleInput.catcher=value end if;return value end function
/// Computes `ch&7` for engine client console `colorIndex`.
/// @param ch Value used by `return ch&7`.
function colorIndex(ch) return ch&7 end function
/// Computes `index+1<len(data) and data[index]==94 and data[index+1]!=94` for engine client console `isColor`.
/// @param data Sequence read at `data[index]`, `data[index+1]`.
/// @param index Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`.
function isColor(data,index) return index+1<len(data) and data[index]==94 and data[index+1]!=94 end function
/// Updates `state.text` during engine client console `clearCells`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.text`.
function clearCells(state) state.text=blankText();return true end function
/// Computes `positiveMod(line,state.totallines)*state.linewidth` for engine client console `lineOffset`.
/// @param state Record read through `state.totallines`, `state.linewidth`.
/// @param line Value used by `return positiveMod(line,state.totallines)*state.linewidth`.
function lineOffset(state,line) return positiveMod(line,state.totallines)*state.linewidth end function
/// Calls `mq3.client.cl_console.lineOffset`, `decode`, `slice` from engine client console `lineText`. The final path returns `decode(slice(raw,0,endAt))`.
/// @param state Record read through `state.totallines`, `state.linewidth`, `state.text`.
/// @param line Value used by `base=lineOffset(state,line)`.
function lineText(state,line)
  if state.totallines<=0 or state.linewidth<=0 then return "" end if
  base=lineOffset(state,line);raw=bytes(state.linewidth,32);for index=0 to state.linewidth-1 raw[index]=state.text[base+index]&255 end for
  endAt=state.linewidth;while endAt>0 and raw[endAt-1]==32 endAt=endAt-1 end while;return decode(slice(raw,0,endAt))
end function
/// Collects non-space glyphs from a console row, extracting each packed character/color value into a positioned glyph record.
/// @param state Record read through `state.linewidth`, `state.totallines`, `state.text`.
/// @param line Value used by `base=lineOffset(state,line)`.
/// @param startX Value used by `if ch!=32 then result.add(Glyph(startX+index*SMALLCHAR_WIDTH,startY,ch,(cell>>8)&7)) end if end for`.
/// @param startY Value used by `if ch!=32 then result.add(Glyph(startX+index*SMALLCHAR_WIDTH,startY,ch,(cell>>8)&7)) end if end for`.
function lineGlyphs(state,line,startX,startY)
  result=lists.List.withCapacity(state.linewidth);if state.totallines<=0 then return [] end if;base=lineOffset(state,line)
  for index=0 to state.linewidth-1 cell=state.text[base+index];ch=cell&255;if ch!=32 then result.add(Glyph(startX+index*SMALLCHAR_WIDTH,startY,ch,(cell>>8)&7)) end if end for
  return result.toArray()
end function

/// Updates `state.times` during engine client console `Con_ClearNotify`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.times`.
function Con_ClearNotify(state) state.times=[0,0,0,0];return true end function
/// Updates `state.linewidth`, `state.totallines`, `state.text[newBase+column]`, `state.current` and additional values during engine client console `Con_CheckResize`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.linewidth`, `state.totallines`, `state.text[newBase+column]`, `state.current` and additional values.
/// @param screenWidth Value used by `width=numeric.trunc32(screenWidth/SMALLCHAR_WIDTH)-2`.
function Con_CheckResize(state,screenWidth)
  width=numeric.trunc32(screenWidth/SMALLCHAR_WIDTH)-2;if width==state.linewidth then return false end if
  if width<1 then width=DEFAULT_CONSOLE_WIDTH;state.linewidth=width;state.totallines=numeric.trunc32(CON_TEXTSIZE/width);clearCells(state)
  else
    oldwidth=state.linewidth;oldtotal=state.totallines;oldtext=state.text;state.linewidth=width;state.totallines=numeric.trunc32(CON_TEXTSIZE/width);clearCells(state)
    numlines=oldtotal;if state.totallines<numlines then numlines=state.totallines end if
    numchars=oldwidth;if state.linewidth<numchars then numchars=state.linewidth end if
    if oldwidth>0 and oldtotal>0 then
      for line=0 to numlines-1
        oldLine=positiveMod(state.current-line+oldtotal,oldtotal);newBase=(state.totallines-1-line)*state.linewidth;oldBase=oldLine*oldwidth
        for column=0 to numchars-1 state.text[newBase+column]=oldtext[oldBase+column] end for
      end for
    end if
    Con_ClearNotify(state)
  end if
  state.current=state.totallines-1;state.display=state.current;state.x=0;return true
end function
/// Updates `state.notifyTime`, `state.conSpeed`, `state.consoleInput.console.widthInChars`, `state.consoleInput.history[index].widthInChars` and additional values during engine client console `Con_Init`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.notifyTime`, `state.conSpeed`, `state.consoleInput.console.widthInChars`, `state.consoleInput.history[index].widthInChars` and additional values.
/// @param screenWidth Value used by `Con_CheckResize(state,screenWidth)`.
function Con_Init(state,screenWidth)
  state.notifyTime=3.0;state.conSpeed=3.0;clConsoleInput.clear(state.consoleInput.console);state.consoleInput.console.widthInChars=DEFAULT_CONSOLE_WIDTH
  for index=0 to len(state.consoleInput.history)-1 clConsoleInput.clear(state.consoleInput.history[index]);state.consoleInput.history[index].widthInChars=DEFAULT_CONSOLE_WIDTH end for
  state.commands=["toggleconsole","messagemode","messagemode2","messagemode3","messagemode4","clear","condump"]
  state.linewidth=-1;Con_CheckResize(state,screenWidth);state.initialized=true;return true
end function
/// Updates `state.times[positiveMod(state.current,NUM_CON_TIMES)]`, `state.x`, `state.display`, `state.current` and additional values during engine client console `Con_Linefeed`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.times[positiveMod(state.current,NUM_CON_TIMES)]`, `state.x`, `state.display`, `state.current` and additional values.
/// @param skipnotify Value used by `if state.current>=0 then if skipnotify then state.times[positiveMod(state.current,NUM_CON_TIMES)]=0 else state.times[positiveMod(state.current...`.
function Con_Linefeed(state,skipnotify)
  if state.current>=0 then if skipnotify then state.times[positiveMod(state.current,NUM_CON_TIMES)]=0 else state.times[positiveMod(state.current,NUM_CON_TIMES)]=state.realtime end if end if
  state.x=0;if state.display==state.current then state.display=state.display+1 end if;state.current=state.current+1;base=lineOffset(state,state.current)
  for index=0 to state.linewidth-1 state.text[base+index]=whiteCell() end for;return true
end function
/// Updates `state.linewidth`, `state.initialized`, `state.x`, `state.text[base+state.x]` and additional values during engine client console `CL_ConsolePrint`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.linewidth`, `state.initialized`, `state.x`, `state.text[base+state.x]` and additional values.
/// @param text Mutable sequence; this routine writes `text[base+state.x]`.
/// @param screenWidth Value used by `Con_CheckResize(state,screenWidth)`.
function CL_ConsolePrint(state,text,screenWidth)
  raw=bytes(text);skipnotify=false;prefix=bytes("[skipnotify]")
  if len(raw)>=len(prefix) and decode(slice(raw,0,len(prefix)))=="[skipnotify]" then skipnotify=true;raw=slice(raw,len(prefix),len(raw)-len(prefix)) end if
  if state.noPrint then return false end if
  if not state.initialized then state.linewidth=-1;Con_CheckResize(state,screenWidth);state.initialized=true end if
  color=COLOR_WHITE;position=0
  while position<len(raw)
    if isColor(raw,position) then color=colorIndex(raw[position+1]);position=position+2;continue end if
    c=raw[position];word=0;while word<state.linewidth and position+word<len(raw) and raw[position+word]>32 word=word+1 end while
    if word!=state.linewidth and state.x+word>=state.linewidth then Con_Linefeed(state,skipnotify) end if
    position=position+1
    if c==10 then Con_Linefeed(state,skipnotify)
    else if c==13 then state.x=0
    else base=lineOffset(state,state.current);state.text[base+state.x]=(color<<8)|c;state.x=state.x+1;if state.x>=state.linewidth then Con_Linefeed(state,skipnotify);state.x=0 end if end if
  end while
  if state.current>=0 then slot=positiveMod(state.current,NUM_CON_TIMES);if skipnotify then previous=slot-1;if previous<0 then previous=NUM_CON_TIMES-1 end if;state.times[previous]=0 else state.times[slot]=state.realtime end if end if
  return true
end function

/// Updates `state.display` during engine client console `Con_Bottom`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.display`.
function Con_Bottom(state) state.display=state.current;return state.display end function
/// Updates `state.display` during engine client console `Con_Top`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.display`.
function Con_Top(state) state.display=state.totallines;if state.current-state.display>=state.totallines then state.display=state.current-state.totallines+1 end if;return state.display end function
/// Updates `state.display` during engine client console `Con_PageUp`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.display`.
function Con_PageUp(state) state.display=state.display-2;if state.current-state.display>=state.totallines then state.display=state.current-state.totallines+1 end if;return state.display end function
/// Updates `state.display` during engine client console `Con_PageDown`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.display`.
function Con_PageDown(state) state.display=state.display+2;if state.display>state.current then state.display=state.current end if;return state.display end function
/// Calls `mq3.client.cl_console.clearCells`, `mq3.client.cl_console.Con_Bottom` from engine client console `Con_Clear_f`.
/// @param state Shared engine client console state passed to the helper calls in `Con_Clear_f`.
function Con_Clear_f(state) clearCells(state);Con_Bottom(state);return true end function
/// Calls `mq3.client.cl_console.lineText` from engine client console `dumpText`. The final path returns `result`.
/// @param state Record read through `state.totallines`, `state.current`.
function dumpText(state)
  if state.totallines<=0 then return "" end if;first=state.current-state.totallines+1
  while first<=state.current and lineText(state,first)=="" first=first+1 end while
  result="";while first<=state.current result=result+lineText(state,first)+"\n";first=first+1 end while;return result
end function
/// Calls `mq3.client.cl_console.dumpText`, `std.fs.writeAllBytes` from engine client console `Con_Dump_f`. The final path returns `len(data)`.
/// @param state Shared engine client console state passed to the helper calls in `Con_Dump_f`.
/// @param filename File name passed to the corresponding file/asset operation.
function Con_Dump_f(state,filename)
  if filename=="" then return error(7742,"usage: condump <filename>") end if;data=bytes(dumpText(state));written=try(fs.writeAllBytes(filename,data));if written is error then return written end if;return len(data)
end function

/// Updates `state.consoleInput.console.widthInChars` during engine client console `Con_ToggleConsole_f`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.consoleInput.console.widthInChars`.
function Con_ToggleConsole_f(state)
  if state.connectionState==CA_DISCONNECTED and state.keyCatchers==clConsoleInput.KEYCATCH_CONSOLE then if state.host!=void and state.host.startDemoLoopFn!=void then state.host.startDemoLoopFn(state.host.context) end if;return false end if
  clConsoleInput.clear(state.consoleInput.console);state.consoleInput.console.widthInChars=DEFAULT_CONSOLE_WIDTH;Con_ClearNotify(state);setCatcher(state,state.keyCatchers^clConsoleInput.KEYCATCH_CONSOLE);return true
end function
/// Updates `state.consoleInput.chatPlayerNum` during engine client console `messagePlayer`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.consoleInput.chatPlayerNum`.
/// @param kind Action/operation identifier used to select the engine service request.
function messagePlayer(state,kind)
  player=-1;if state.host!=void then if kind==3 and state.host.crosshairPlayerFn!=void then player=state.host.crosshairPlayerFn(state.host.context) else if kind==4 and state.host.lastAttackerFn!=void then player=state.host.lastAttackerFn(state.host.context) end if end if
  if player<0 or player>=MAX_CLIENTS then state.consoleInput.chatPlayerNum=-1;return false end if;return clConsoleInput.beginMessage(state.consoleInput,false,player)
end function
/// Calls `mq3.client.console_input.beginMessage`, `mq3.client.cl_console.setCatcher` from engine client console `Con_MessageMode_f`. The final path returns `result`.
/// @param state Record read through `state.consoleInput`, `state.consoleInput.catcher`.
function Con_MessageMode_f(state) result=clConsoleInput.beginMessage(state.consoleInput,false,-1);setCatcher(state,state.consoleInput.catcher);return result end function
/// Calls `mq3.client.console_input.beginMessage`, `mq3.client.cl_console.setCatcher` from engine client console `Con_MessageMode2_f`. The final path returns `result`.
/// @param state Record read through `state.consoleInput`, `state.consoleInput.catcher`.
function Con_MessageMode2_f(state) result=clConsoleInput.beginMessage(state.consoleInput,true,-1);setCatcher(state,state.consoleInput.catcher);return result end function
/// Calls `mq3.client.cl_console.messagePlayer`, `mq3.client.cl_console.setCatcher` from engine client console `Con_MessageMode3_f`. The final path returns `result`.
/// @param state Record read through `state.consoleInput.catcher`.
function Con_MessageMode3_f(state) result=messagePlayer(state,3);setCatcher(state,state.consoleInput.catcher);return result end function
/// Calls `mq3.client.cl_console.messagePlayer`, `mq3.client.cl_console.setCatcher` from engine client console `Con_MessageMode4_f`. The final path returns `result`.
/// @param state Record read through `state.consoleInput.catcher`.
function Con_MessageMode4_f(state) result=messagePlayer(state,4);setCatcher(state,state.consoleInput.catcher);return result end function

/// Updates `state.consoleInput.catcher` during engine client console `Con_DrawInput`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.consoleInput.catcher`.
function Con_DrawInput(state)
  state.consoleInput.catcher=state.keyCatchers;if state.connectionState!=CA_DISCONNECTED and (state.keyCatchers&clConsoleInput.KEYCATCH_CONSOLE)==0 then return inputDisplay.Presentation(false,"","",0,0,0,0) end if
  return inputDisplay.Presentation(true,"console",inputDisplay.fieldText(state.consoleInput.console,"]",state.realtime),8,state.vislines-SMALLCHAR_HEIGHT*2,0,state.vislines)
end function
/// Updates `state.consoleInput.catcher` during engine client console `Con_DrawNotify`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.consoleInput.catcher`.
function Con_DrawNotify(state)
  lines=[];vertical=0
  for line=state.current-NUM_CON_TIMES+1 to state.current
    if line>=0 then stamp=state.times[positiveMod(line,NUM_CON_TIMES)];age=state.realtime-stamp
      if stamp!=0 and age<=state.notifyTime*1000.0 and (state.intermission or state.uiOrCgameCatcher==0) then lines=lines+[ConsoleLine(line,lineText(state,line),lineGlyphs(state,line,SMALLCHAR_WIDTH,vertical))];vertical=vertical+SMALLCHAR_HEIGHT end if
    end if
  end for
  chat=inputDisplay.Presentation(false,"","",0,0,0,0);if state.uiOrCgameCatcher==0 and (state.keyCatchers&clConsoleInput.KEYCATCH_MESSAGE)!=0 then state.consoleInput.catcher=state.keyCatchers;chat=inputDisplay.present(state.consoleInput,state.realtime) end if
  return NotifyView(lines,chat)
end function
/// Updates `state.vislines` during engine client console `Con_DrawSolidConsole`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.vislines`.
/// @param fraction Interpolation or blend fraction between the endpoint values.
/// @param videoWidth Value used by `for index=0 to len(versionRaw)-1 glyphs.add(Glyph(videoWidth-(len(versionRaw)-index)*SMALLCHAR_WIDTH,lines-(SMALLCHAR_HEIGHT+SMALLCHAR_HEIGHT/...`.
/// @param videoHeight Value used by `lines=numeric.trunc32(videoHeight*fraction)`.
/// @param version Sequence whose length/content is inspected by `Con_DrawSolidConsole`.
function Con_DrawSolidConsole(state,fraction,videoWidth,videoHeight,version)
  lines=numeric.trunc32(videoHeight*fraction);if lines<0 then lines=0 end if;if lines>videoHeight then lines=videoHeight end if
  state.vislines=lines;rows=numeric.trunc32((lines-SMALLCHAR_WIDTH)/SMALLCHAR_WIDTH);y=lines-(SMALLCHAR_HEIGHT*3);back=state.display!=state.current;capacity=rows*state.linewidth+len(version);if capacity<8 then capacity=8 end if;glyphs=lists.List.withCapacity(capacity)
  if back then column=0;while column<state.linewidth glyphs.add(Glyph((column+1)*SMALLCHAR_WIDTH,y,94,COLOR_RED));column=column+4 end while;y=y-SMALLCHAR_HEIGHT;rows=rows-1 end if
  row=state.display;if state.x==0 then row=row-1 end if
  for index=0 to rows-1
    if row>=0 and state.current-row<state.totallines then glyphs.addAll(lineGlyphs(state,row,SMALLCHAR_WIDTH,y)) end if;row=row-1;y=y-SMALLCHAR_HEIGHT
  end for
  versionRaw=bytes(version);for index=0 to len(versionRaw)-1 glyphs.add(Glyph(videoWidth-(len(versionRaw)-index)*SMALLCHAR_WIDTH,lines-(SMALLCHAR_HEIGHT+SMALLCHAR_HEIGHT/2),versionRaw[index],COLOR_RED)) end for
  return SolidView(fraction,lines,rows,back,version,glyphs.toArray(),Con_DrawInput(state))
end function
/// Calls `mq3.client.cl_console.Con_CheckResize`, `mq3.client.cl_console.DrawView`, `mq3.client.cl_console.Con_DrawSolidConsole` and additional helpers from engine client console `Con_DrawConsole`. The final path returns `DrawView("none",void,void)`.
/// @param state Record read through `state.connectionState`, `state.uiOrCgameCatcher`, `state.displayFrac`.
/// @param screenWidth Value used by `Con_CheckResize(state,screenWidth)`.
/// @param videoWidth Value used by `if state.connectionState==CA_DISCONNECTED and state.uiOrCgameCatcher==0 then return DrawView("solid",Con_DrawSolidConsole(state,1.0,videoWidth...`.
/// @param videoHeight Value used by `if state.connectionState==CA_DISCONNECTED and state.uiOrCgameCatcher==0 then return DrawView("solid",Con_DrawSolidConsole(state,1.0,videoWidth...`.
/// @param version Value used by `if state.connectionState==CA_DISCONNECTED and state.uiOrCgameCatcher==0 then return DrawView("solid",Con_DrawSolidConsole(state,1.0,videoWidth...`.
function Con_DrawConsole(state,screenWidth,videoWidth,videoHeight,version)
  Con_CheckResize(state,screenWidth)
  if state.connectionState==CA_DISCONNECTED and state.uiOrCgameCatcher==0 then return DrawView("solid",Con_DrawSolidConsole(state,1.0,videoWidth,videoHeight,version),void) end if
  if state.displayFrac>0.0 then return DrawView("solid",Con_DrawSolidConsole(state,state.displayFrac,videoWidth,videoHeight,version),void) end if
  if state.connectionState==CA_ACTIVE then return DrawView("notify",void,Con_DrawNotify(state)) end if
  return DrawView("none",void,void)
end function
/// Updates `state.finalFrac`, `state.displayFrac` during engine client console `Con_RunConsole`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.finalFrac`, `state.displayFrac`.
function Con_RunConsole(state)
  if (state.keyCatchers&clConsoleInput.KEYCATCH_CONSOLE)!=0 then state.finalFrac=0.5 else state.finalFrac=0.0 end if;step=state.conSpeed*state.realFrametime*0.001
  if state.finalFrac<state.displayFrac then state.displayFrac=state.displayFrac-step;if state.finalFrac>state.displayFrac then state.displayFrac=state.finalFrac end if
  else if state.finalFrac>state.displayFrac then state.displayFrac=state.displayFrac+step;if state.finalFrac<state.displayFrac then state.displayFrac=state.finalFrac end if end if
  return state.displayFrac
end function
/// Updates `state.finalFrac`, `state.displayFrac` during engine client console `Con_Close`.
/// @param state Mutable engine client console record/storage; this routine assigns `state.finalFrac`, `state.displayFrac`.
function Con_Close(state)
  if not state.clientRunning then return false end if;clConsoleInput.clear(state.consoleInput.console);Con_ClearNotify(state);setCatcher(state,state.keyCatchers&(~clConsoleInput.KEYCATCH_CONSOLE));state.finalFrac=0.0;state.displayFrac=0.0;return true
end function
