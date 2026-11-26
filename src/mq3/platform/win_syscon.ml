// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful Win32 console semantics from code/win32/win_syscon.c.
package mq3.platform.win_syscon

const COPY_ID=1
const QUIT_ID=2
const CLEAR_ID=3
const VIS_HIDDEN=0
const VIS_NORMAL=1
const VIS_MINIMIZED=2
const CONSOLE_BUFFER_SIZE=16384

/// Data record for `mq3.platform.win_syscon.Action`; groups `boundary`, `kind`, `text`, `value`, `dispatched`.
struct Action boundary kind text value dispatched end struct
/// Data record for `mq3.platform.win_syscon.State`; groups `created`, `visLevel`, `quitOnClose`, `consoleText`, `returnedText`, `displayText`, and 9 further fields.
struct State created visLevel quitOnClose consoleText returnedText displayText errorString hasInput hasError totalChars timePolarity viewlog dedicated actions retailActive end struct

/// Constructs `mq3.platform.win_syscon.State` with `created` = `false`, `visLevel` = `0`, `quitOnClose` = `false`, `consoleText` = `""` and the supplied remaining values.
/// @param retailActive Initial value for `mq3.platform.win_syscon.State.retailActive`.
function create(retailActive) return State(false,0,false,"","","","",false,false,0,false,0,false,[],retailActive) end function
/// Updates `state.actions` in `mq3.platform.win_syscon.emit`; returns `action`.
/// @param state Mutable record or buffer; this call updates `state.actions`.
/// @param boundary Value used for `mq3.platform.win_syscon.Action.boundary`.
/// @param kind Value used for `mq3.platform.win_syscon.Action.kind`.
/// @param text Value used for `mq3.platform.win_syscon.Action.text`.
/// @param value Value used for `mq3.platform.win_syscon.Action.value`.
function emit(state,boundary,kind,text,value) action=Action(boundary,kind,text,value,not state.retailActive);state.actions=state.actions+[action];return action end function
/// Returns `decode(raw)` from `mq3.platform.win_syscon.copyLimit`.
/// @param text Argument 1 supplied to `bytes`.
/// @param count Argument 3 supplied to `slice`.
function copyLimit(text,count) raw=bytes(text);if len(raw)>count then raw=slice(raw,0,count) end if;return decode(raw) end function
/// Computes `index+1<len(raw) and raw[index]==94 and raw[index+1]!=94` for `mq3.platform.win_syscon.isColor`.
/// @param raw Indexed input read at `index`, `index+1`.
/// @param index Input used in the result expression `index+1<len(raw) and raw[index]==94 and raw[index+1]!=94`.
function isColor(raw,index) return index+1<len(raw) and raw[index]==94 and raw[index+1]!=94 end function

// Sys_CreateConsole
/// @param state Mutable record or buffer; this call updates `state.created`, `state.hasInput`, `state.visLevel`.
/// @param registerOk Input tested by `not registerOk or not windowOk`.
/// @param windowOk Input tested by `not registerOk or not windowOk`.
function Sys_CreateConsole(state,registerOk,windowOk)
  if not registerOk or not windowOk then return false end if;state.created=true;state.hasInput=true;state.visLevel=1;emit(state,"win32","create-console","Quake 3 Console",1);emit(state,"win32","focus-input","",0);return true
end function
// Sys_DestroyConsole
/// @param state Mutable record or buffer; this call updates `state.created`, `state.hasInput`, `state.hasError`.
function Sys_DestroyConsole(state) if state.created then emit(state,"win32","hide-console","",0);emit(state,"win32","destroy-console","",0);state.created=false;state.hasInput=false;state.hasError=false end if;return void end function
// Sys_ShowConsole
/// @param state Mutable record or buffer; this call updates `state.quitOnClose`, `state.visLevel`.
/// @param visLevel Value assigned to `state.visLevel`.
/// @param quitOnClose Value assigned to `state.quitOnClose`.
function Sys_ShowConsole(state,visLevel,quitOnClose)
  state.quitOnClose=quitOnClose;if visLevel==state.visLevel then return true end if;state.visLevel=visLevel;if not state.created then return true end if
  if visLevel==VIS_HIDDEN then emit(state,"win32","hide-console","",0) else if visLevel==VIS_NORMAL then emit(state,"win32","show-console","",0);emit(state,"win32","scroll-end","",0) else if visLevel==VIS_MINIMIZED then emit(state,"win32","minimize-console","",0) else return error(7994,"Invalid visLevel "+str(visLevel)+" sent to Sys_ShowConsole\n") end if;return true
end function
// Sys_ConsoleInput
/// @param state Mutable record or buffer; this call updates `state.returnedText`, `state.consoleText`.
function Sys_ConsoleInput(state) if state.consoleText=="" then return void end if;state.returnedText=state.consoleText;state.consoleText="";return state.returnedText end function

// Conbuf_AppendText
/// @param state Mutable record or buffer; this call updates `state.totalChars`, `state.displayText`.
/// @param message Argument 1 supplied to `bytes`.
function Conbuf_AppendText(state,message)
  raw=bytes(message);if len(raw)>CONSOLE_BUFFER_SIZE-1 then raw=slice(raw,len(raw)-CONSOLE_BUFFER_SIZE+1,CONSOLE_BUFFER_SIZE-1) end if;normalized="";byteCount=0;index=0
  while index<len(raw) and byteCount<CONSOLE_BUFFER_SIZE*2-1
    if raw[index]==10 and index+1<len(raw) and raw[index+1]==13 then normalized=normalized+"\r\n";byteCount=byteCount+2;index=index+2
    else if raw[index]==13 or raw[index]==10 then normalized=normalized+"\r\n";byteCount=byteCount+2;index=index+1
    else if isColor(raw,index) then index=index+2
    else normalized=normalized+decode(slice(raw,index,1));byteCount=byteCount+1;index=index+1 end if
  end while
  state.totalChars=state.totalChars+byteCount
  if state.totalChars>32767 then state.displayText="";state.totalChars=byteCount;emit(state,"win32","select-all","",0) end if
  state.displayText=state.displayText+normalized;emit(state,"win32","append-console",normalized,byteCount);return normalized
end function
// Sys_SetErrorText
/// @param state Mutable record or buffer; this call updates `state.errorString`, `state.hasError`, `state.hasInput`.
/// @param text Value forwarded as `text` to `mq3.platform.win_syscon.copyLimit`.
function Sys_SetErrorText(state,text) state.errorString=copyLimit(text,79);if not state.hasError then state.hasError=true;state.hasInput=false;emit(state,"win32","create-error",state.errorString,0);emit(state,"win32","destroy-input","",0) end if;return state.errorString end function

// InputLineWndProc. Message names model WM_KILLFOCUS and WM_CHAR.
/// @param state Mutable record or buffer; this call updates `state.consoleText`.
/// @param message Input tested by `message=="killfocus" and (focusTarget=="console" or focusTarget=="error")`.
/// @param value Input tested by `message=="char" and value==13`.
/// @param focusTarget Value forwarded as `text` to `mq3.platform.win_syscon.copyLimit`.
function InputLineWndProc(state,message,value,focusTarget)
  if message=="killfocus" and (focusTarget=="console" or focusTarget=="error") then emit(state,"win32","focus-input","",0);return 0 end if
  if message=="char" and value==13 then text=copyLimit(focusTarget,1023);room=512-len(bytes(state.consoleText))-5;if room<0 then room=0 end if;state.consoleText=state.consoleText+copyLimit(text,room)+"\n";emit(state,"console","print","]"+text+"\n",0);return 0 end if;return 1
end function

// ConWndProc. This preserves every state-changing branch of the Win32 callback.
/// @param state Mutable record or buffer; this call updates `state.viewlog`, `state.displayText`, `state.timePolarity`.
/// @param message Input tested by `message=="activate"`.
/// @param value Input tested by `message=="activate"`.
/// @param minimized Input tested by `state.viewlog==1 and minimized`.
function ConWndProc(state,message,value,minimized)
  if message=="activate" then if value!=0 then emit(state,"win32","focus-input","",0) end if;if state.viewlog==1 and minimized then state.viewlog=2;emit(state,"cvar","set-viewlog","2",2) else if state.viewlog==2 and not minimized then state.viewlog=1;emit(state,"cvar","set-viewlog","1",1) end if;return 0 end if
  if message=="close" then if state.dedicated then emit(state,"event","console","quit",0) else if state.quitOnClose then emit(state,"win32","post-quit","",0) else Sys_ShowConsole(state,VIS_HIDDEN,false);state.viewlog=0;emit(state,"cvar","set-viewlog","0",0) end if;return 0 end if
  if message=="copy" then emit(state,"win32","copy-console",state.displayText,0);return 0 end if
  if message=="quit" then if state.quitOnClose then emit(state,"win32","post-quit","",0) else emit(state,"event","console","quit",0) end if;return 0 end if
  if message=="clear" then state.displayText="";emit(state,"win32","clear-console","",0);return 0 end if
  if message=="timer" and value==1 then state.timePolarity=not state.timePolarity;if state.hasError then emit(state,"win32","invalidate-error","",0) end if;return 0 end if;return 1
end function
