// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 cl_keys.c Field_*, Console_Key and Message_Key state machine.
package mq3.client.console_input

/// Maximum length of a console or editable input line.
const MAX_EDIT_LINE=256
/// Number of submitted console commands retained for history navigation.
const COMMAND_HISTORY=32
/// Input-capture bit that routes keyboard events to the console subsystem.
const KEYCATCH_CONSOLE=1
/// Input-capture bit that routes keyboard events to the message subsystem.
const KEYCATCH_MESSAGE=4
/// Connection-state value for normal gameplay after game-state loading, defined for deciding whether
/// console and chat input can interact with an active game.
const CA_ACTIVE=8
/// Engine key code for the tab input, used by menu and client key-event handling.
const K_TAB=9
/// Engine key code for the enter input, used by menu and client key-event handling.
const K_ENTER=13
/// Engine key code for the escape input, used by menu and client key-event handling.
const K_ESCAPE=27
/// Engine key code for the backspace input, used by menu and client key-event handling.
const K_BACKSPACE=127
/// Engine key code for the uparrow input, used by menu and client key-event handling.
const K_UPARROW=132
/// Engine key code for the downarrow input, used by menu and client key-event handling.
const K_DOWNARROW=133
/// Engine key code for the leftarrow input, used by menu and client key-event handling.
const K_LEFTARROW=134
/// Engine key code for the rightarrow input, used by menu and client key-event handling.
const K_RIGHTARROW=135
/// Engine key code for the ctrl input, used by menu and client key-event handling.
const K_CTRL=137
/// Engine key code for the shift input, used by menu and client key-event handling.
const K_SHIFT=138
/// Engine key code for the ins input, used by menu and client key-event handling.
const K_INS=139
/// Engine key code for the del input, used by menu and client key-event handling.
const K_DEL=140
/// Engine key code for the pgdn input, used by menu and client key-event handling.
const K_PGDN=141
/// Engine key code for the pgup input, used by menu and client key-event handling.
const K_PGUP=142
/// Engine key code for the home input, used by menu and client key-event handling.
const K_HOME=143
/// Engine key code for the end input, used by menu and client key-event handling.
const K_END=144
/// Engine key code for the kp uparrow input, used by menu and client key-event handling.
const K_KP_UPARROW=161
/// Engine key code for the kp downarrow input, used by menu and client key-event handling.
const K_KP_DOWNARROW=167
/// Engine key code for the kp enter input, used by menu and client key-event handling.
const K_KP_ENTER=169
/// Engine key code for the kp ins input, used by menu and client key-event handling.
const K_KP_INS=170
/// Engine key code for the mwheeldown input, used by menu and client key-event handling.
const K_MWHEELDOWN=183
/// Engine key code for the mwheelup input, used by menu and client key-event handling.
const K_MWHEELUP=184

/// Stores console input field record, including `cursor`, `scroll`, `widthInChars`, `text`.
struct Field
  /// When constructing this record, `field` supplies `0` for this member.
  cursor
  /// When constructing this record, `field` supplies `0` for this member.
  scroll
  /// Number of character columns visible in the editable text or console field.
  widthInChars
  /// Editable or accumulated console text retained for drawing and command submission.
  text
end struct
/// Stores console input host-service callbacks, including `context`, `commandFn`, `reliableFn`, `printFn`, `completeFn`, `clipboardFn` and additional values.
struct Services
  /// Caller-supplied value forwarded unchanged to the service callbacks for console editing and command
  /// submission.
  context
  /// Host callback for the command operation; an unset callback leaves that host operation unavailable.
  commandFn
  /// Host callback for the reliable operation; an unset callback leaves that host operation
  /// unavailable.
  reliableFn
  /// Host callback for the print operation; an unset callback leaves that host operation unavailable.
  printFn
  /// Host callback for the complete operation; an unset callback leaves that host operation
  /// unavailable.
  completeFn
  /// Host callback for the clipboard operation; an unset callback leaves that host operation
  /// unavailable.
  clipboardFn
  /// Host callback for the scroll operation; an unset callback leaves that host operation unavailable.
  scrollFn
end struct
/// Stores console input state, including `console`, `chat`, `history`, `nextHistoryLine`, `historyLine`, `overstrike` and additional values.
struct State
  /// When constructing this record, `create` supplies `field(width)` for this member. Used by
  /// `toggleConsole` and `consoleKey` during subsequent processing.
  console
  /// When constructing this record, `create` supplies `field(30)` for this member. Used by
  /// `beginMessage` and `messageKey` during subsequent processing.
  chat
  /// When constructing this record, `create` supplies `history` for this member. Used by `consoleKey`
  /// during subsequent processing.
  history
  /// When constructing this record, `create` supplies `0` for this member. Used by `consoleKey` during
  /// subsequent processing.
  nextHistoryLine
  /// When constructing this record, `create` supplies `0` for this member. Used by `consoleKey` during
  /// subsequent processing.
  historyLine
  /// When constructing this record, `create` supplies `false` for this member. Used by `insertByte` and
  /// `fieldKeyDown` during subsequent processing.
  overstrike
  /// When constructing this record, `create` supplies `0` for this member. Used by `toggleConsole` and
  /// `beginMessage` during subsequent processing.
  catcher
  /// Client connection-state identifier controlling handshake, loading, and active-play behavior.
  connectionState
  /// When constructing this record, `create` supplies `false` for this member. Used by `beginMessage`
  /// and `messageKey` during subsequent processing.
  chatTeam
  /// When constructing this record, `create` supplies `-1` for this member. Used by `beginMessage` and
  /// `messageKey` during subsequent processing.
  chatPlayerNum
  /// Service callbacks and context used to access the host engine from this client subsystem.
  services
  /// Optional console rendering state attached by the console runtime constructor, linking line editing
  /// to scrollback presentation.
  consoleRuntime
end struct

/// Creates a `mq3.client.console_input.Field` record. Assigns `widthInChars` from `width`.
/// @param width Value used to initialize `Field.widthInChars`.
function field(width) return Field(0,0,width,"") end function
/// Creates a `mq3.client.console_input.Services` record. Assigns `context` from `context`.
/// @param context Value used to initialize `Services.context`.
function services(context) return Services(context,void,void,void,void,void,void) end function
/// Calls `mq3.client.console_input.field`, `mq3.client.console_input.State` from console input `create`. The final path returns `State(field(width),field(30),history,0,0,false,0,0,false,-1,host,void)`.
/// @param width Width in the coordinate space used by `create`.
/// @param host host record passed to the console input helper calls.
function create(width,host)
  history=[];for index=0 to COMMAND_HISTORY-1 history=history+[field(width)] end for
  return State(field(width),field(30),history,0,0,false,0,0,false,-1,host,void)
end function
/// Updates `state.catcher` during console input `toggleConsole`.
/// @param state Mutable console input record/storage; this routine assigns `state.catcher`.
function toggleConsole(state)
  if state==void then return false end if
  clear(state.console);state.catcher=state.catcher^KEYCATCH_CONSOLE;return true
end function
/// Updates `state.chatTeam`, `state.chatPlayerNum`, `state.chat.widthInChars`, `state.catcher` during console input `beginMessage`.
/// @param state Mutable console input record/storage; this routine assigns `state.chatTeam`, `state.chatPlayerNum`, `state.chat.widthInChars`, `state.catcher`.
/// @param team Value assigned to `state.chatTeam`.
/// @param playerNum Value assigned to `state.chatPlayerNum`.
function beginMessage(state,team,playerNum)
  if state==void then return false end if
  state.chatTeam=team;state.chatPlayerNum=playerNum;clear(state.chat)
  if team then state.chat.widthInChars=25 else state.chat.widthInChars=30 end if
  state.catcher=state.catcher^KEYCATCH_MESSAGE;return true
end function
/// Creates a `mq3.client.console_input.Field` record.
/// @param value Record read through `value.cursor`, `value.scroll`, `value.widthInChars`, `value.text`.
function cloneField(value) return Field(value.cursor,value.scroll,value.widthInChars,value.text) end function
/// Updates `value.cursor`, `value.scroll`, `value.text` during console input `clear`.
/// @param value Mutable console input record/storage; this routine assigns `value.cursor`, `value.scroll`, `value.text`.
function clear(value) value.cursor=0;value.scroll=0;value.text="";return void end function
/// Evaluates console input `lowerKey` and returns `key+32`, `key` according to its guard/selection conditions.
/// @param key Key or control identifier used to select the corresponding console input entry.
function lowerKey(key) if key>=65 and key<=90 then return key+32 end if;return key end function
/// Updates `edit.text`, `edit.cursor`, `edit.scroll` during console input `insertByte`.
/// @param state Record read through `state.overstrike`.
/// @param edit Mutable console input record/storage; this routine assigns `edit.text`, `edit.cursor`, `edit.scroll`.
/// @param ch Value used by `if ch<32 then return false end if`.
function insertByte(state,edit,ch)
  if ch<32 then return false end if
  data=bytes(edit.text);length=len(data)
  if state.overstrike then
    if edit.cursor==MAX_EDIT_LINE-1 then return false end if
    if edit.cursor<length then edit.text=decode(slice(data,0,edit.cursor))+decode(bytes(1,ch))+decode(slice(data,edit.cursor+1,length-edit.cursor-1))
    else edit.text=edit.text+decode(bytes(1,ch)) end if
  else
    if length==MAX_EDIT_LINE-1 then return false end if
    edit.text=decode(slice(data,0,edit.cursor))+decode(bytes(1,ch))+decode(slice(data,edit.cursor,length-edit.cursor))
  end if
  edit.cursor=edit.cursor+1;if edit.cursor>=edit.widthInChars then edit.scroll=edit.scroll+1 end if;return true
end function
/// Calls `state.services.clipboardFn`, `mq3.client.console_input.insertByte` from console input `paste`.
/// @param state Record read through `state.services`, `state.services.clipboardFn`, `state.services.context`.
/// @param edit Value used by `for each ch in bytes(value) insertByte(state,edit,ch) end for`.
function paste(state,edit)
  if state.services==void or state.services.clipboardFn==void then return false end if
  value=state.services.clipboardFn(state.services.context);if value==void then return false end if
  for each ch in bytes(value) insertByte(state,edit,ch) end for;return true
end function
/// Updates `edit.text`, `edit.cursor`, `edit.scroll` during console input `charEvent`.
/// @param state Shared console input state passed to the helper calls in `charEvent`.
/// @param edit Mutable console input record/storage; this routine assigns `edit.text`, `edit.cursor`, `edit.scroll`.
/// @param ch Value used by `if ch==22 then return paste(state,edit) end if`.
function charEvent(state,edit,ch)
  if ch==22 then return paste(state,edit) end if
  if ch==3 then clear(edit);return true end if
  data=bytes(edit.text);length=len(data)
  if ch==8 then
    if edit.cursor>0 then edit.text=decode(slice(data,0,edit.cursor-1))+decode(slice(data,edit.cursor,length-edit.cursor));edit.cursor=edit.cursor-1;if edit.cursor<edit.scroll then edit.scroll=edit.scroll-1 end if end if
    return true
  end if
  if ch==1 then edit.cursor=0;edit.scroll=0;return true end if
  if ch==5 then edit.cursor=length;edit.scroll=edit.cursor-edit.widthInChars;return true end if
  return insertByte(state,edit,ch)
end function
/// Updates `edit.text`, `edit.cursor`, `edit.scroll`, `state.overstrike` during console input `fieldKeyDown`.
/// @param state Mutable console input record/storage; this routine assigns `state.overstrike`.
/// @param edit Mutable console input record/storage; this routine assigns `edit.text`, `edit.cursor`, `edit.scroll`.
/// @param key Key or control identifier used to select the corresponding console input entry.
/// @param shift Value used by `if (key==K_INS or key==K_KP_INS) and shift then return paste(state,edit) end if`.
/// @param ctrl Value used by `if key==K_HOME or (lowerKey(key)==97 and ctrl) then edit.cursor=0`.
function fieldKeyDown(state,edit,key,shift,ctrl)
  if (key==K_INS or key==K_KP_INS) and shift then return paste(state,edit) end if
  data=bytes(edit.text);length=len(data)
  if key==K_DEL then if edit.cursor<length then edit.text=decode(slice(data,0,edit.cursor))+decode(slice(data,edit.cursor+1,length-edit.cursor-1)) end if;return true end if
  if key==K_RIGHTARROW then if edit.cursor<length then edit.cursor=edit.cursor+1 end if;if edit.cursor>=edit.scroll+edit.widthInChars and edit.cursor<=length then edit.scroll=edit.scroll+1 end if;return true end if
  if key==K_LEFTARROW then if edit.cursor>0 then edit.cursor=edit.cursor-1 end if;if edit.cursor<edit.scroll then edit.scroll=edit.scroll-1 end if;return true end if
  if key==K_HOME or (lowerKey(key)==97 and ctrl) then edit.cursor=0;return true end if
  if key==K_END or (lowerKey(key)==101 and ctrl) then edit.cursor=length;return true end if
  if key==K_INS then state.overstrike=not state.overstrike;return true end if
  return false
end function
/// Calls `state.services.commandFn` from console input `emitCommand`.
/// @param state Record read through `state.services`, `state.services.commandFn`, `state.services.context`.
/// @param text Text consumed or emitted by `emitCommand` in the console input path.
function emitCommand(state,text) if state.services!=void and state.services.commandFn!=void then state.services.commandFn(state.services.context,text) end if;return void end function
/// Calls `state.services.reliableFn` from console input `emitReliable`.
/// @param state Record read through `state.services`, `state.services.reliableFn`, `state.services.context`.
/// @param text Text consumed or emitted by `emitReliable` in the console input path.
function emitReliable(state,text) if state.services!=void and state.services.reliableFn!=void then state.services.reliableFn(state.services.context,text) end if;return void end function
/// Calls `state.services.printFn` from console input `emitPrint`.
/// @param state Record read through `state.services`, `state.services.printFn`, `state.services.context`.
/// @param text Text consumed or emitted by `emitPrint` in the console input path.
function emitPrint(state,text) if state.services!=void and state.services.printFn!=void then state.services.printFn(state.services.context,text) end if;return void end function
/// Calls `state.services.scrollFn` from console input `scroll`.
/// @param state Record read through `state.services`, `state.services.scrollFn`, `state.services.context`.
/// @param operation Value used by `if state.services!=void and state.services.scrollFn!=void then state.services.scrollFn(state.services.context,operation,count) end if`.
/// @param count Value used by `if state.services!=void and state.services.scrollFn!=void then state.services.scrollFn(state.services.context,operation,count) end if`.
function scroll(state,operation,count) if state.services!=void and state.services.scrollFn!=void then state.services.scrollFn(state.services.context,operation,count) end if;return void end function
/// Updates `state.console.text`, `state.console.cursor`, `state.history[state.nextHistoryLine%COMMAND_HISTORY]`, `state.nextHistoryLine` and additional values during console input `consoleKey`.
/// @param state Mutable console input record/storage; this routine assigns `state.console.text`, `state.console.cursor`, `state.history[state.nextHistoryLine%COMMAND_HISTORY]`, `state.nextHistoryLine` and additional values.
/// @param key Key or control identifier used to select the corresponding console input entry.
/// @param shift Value used by `if (key==K_MWHEELUP and shift) or key==K_UPARROW or key==K_KP_UPARROW or (lowerKey(key)==112 and ctrl) then`.
/// @param ctrl Value used by `if key==108 and ctrl then emitCommand(state,"clear\n")`.
function consoleKey(state,key,shift,ctrl)
  if key==108 and ctrl then emitCommand(state,"clear\n");return true end if
  if key==K_ENTER or key==K_KP_ENTER then
    line=state.console.text
    if state.connectionState!=CA_ACTIVE and len(bytes(line))>0 and bytes(line)[0]!=92 and bytes(line)[0]!=47 then line="\\"+line;state.console.text=line;state.console.cursor=state.console.cursor+1 end if
    emitPrint(state,"]"+line+"\n")
    if len(bytes(line))>0 and (bytes(line)[0]==92 or bytes(line)[0]==47) then emitCommand(state,decode(slice(bytes(line),1,len(bytes(line))-1))+"\n")
    else if len(bytes(line))==0 then return true else emitCommand(state,"cmd say "+line+"\n") end if
    state.history[state.nextHistoryLine%COMMAND_HISTORY]=cloneField(state.console);state.nextHistoryLine=state.nextHistoryLine+1;state.historyLine=state.nextHistoryLine
    width=state.console.widthInChars;clear(state.console);state.console.widthInChars=width;return true
  end if
  if key==K_TAB then if state.services!=void and state.services.completeFn!=void then state.services.completeFn(state.services.context,state.console) end if;return true end if
  if (key==K_MWHEELUP and shift) or key==K_UPARROW or key==K_KP_UPARROW or (lowerKey(key)==112 and ctrl) then
    if state.nextHistoryLine-state.historyLine<COMMAND_HISTORY and state.historyLine>0 then state.historyLine=state.historyLine-1 end if;state.console=cloneField(state.history[state.historyLine%COMMAND_HISTORY]);return true
  end if
  if (key==K_MWHEELDOWN and shift) or key==K_DOWNARROW or key==K_KP_DOWNARROW or (lowerKey(key)==110 and ctrl) then
    if state.historyLine==state.nextHistoryLine then return true end if;state.historyLine=state.historyLine+1;state.console=cloneField(state.history[state.historyLine%COMMAND_HISTORY]);return true
  end if
  if key==K_PGUP then scroll(state,"pageup",1);return true end if
  if key==K_PGDN then scroll(state,"pagedown",1);return true end if
  if key==K_MWHEELUP then count=1;if ctrl then count=3 end if;scroll(state,"pageup",count);return true end if
  if key==K_MWHEELDOWN then count=1;if ctrl then count=3 end if;scroll(state,"pagedown",count);return true end if
  if key==K_HOME and ctrl then scroll(state,"top",1);return true end if
  if key==K_END and ctrl then scroll(state,"bottom",1);return true end if
  return fieldKeyDown(state,state.console,key,shift,ctrl)
end function
/// Updates `state.catcher` during console input `messageKey`.
/// @param state Mutable console input record/storage; this routine assigns `state.catcher`.
/// @param key Key or control identifier used to select the corresponding console input entry.
/// @param shift Value used by `return fieldKeyDown(state,state.chat,key,shift,ctrl)`.
/// @param ctrl Value used by `return fieldKeyDown(state,state.chat,key,shift,ctrl)`.
function messageKey(state,key,shift,ctrl)
  if key==K_ESCAPE then state.catcher=state.catcher&(~KEYCATCH_MESSAGE);clear(state.chat);return true end if
  if key==K_ENTER or key==K_KP_ENTER then
    if len(bytes(state.chat.text))>0 and state.connectionState==CA_ACTIVE then
      if state.chatPlayerNum!=-1 then emitReliable(state,"tell "+str(state.chatPlayerNum)+" \""+state.chat.text+"\"\n")
      else if state.chatTeam then emitReliable(state,"say_team \""+state.chat.text+"\"\n") else emitReliable(state,"say \""+state.chat.text+"\"\n") end if
    end if
    state.catcher=state.catcher&(~KEYCATCH_MESSAGE);clear(state.chat);return true
  end if
  return fieldKeyDown(state,state.chat,key,shift,ctrl)
end function
/// Calls `mq3.client.console_input.messageKey`, `mq3.client.console_input.consoleKey` from console input `caughtKey`.
/// @param state Record read through `state.catcher`.
/// @param key Key or control identifier used to select the corresponding console input entry.
/// @param shift Value used by `if (state.catcher&KEYCATCH_MESSAGE)!=0 then return messageKey(state,key,shift,ctrl) end if`.
/// @param ctrl Value used by `if (state.catcher&KEYCATCH_MESSAGE)!=0 then return messageKey(state,key,shift,ctrl) end if`.
function caughtKey(state,key,shift,ctrl)
  if (state.catcher&KEYCATCH_MESSAGE)!=0 then return messageKey(state,key,shift,ctrl) end if
  if (state.catcher&KEYCATCH_CONSOLE)!=0 then return consoleKey(state,key,shift,ctrl) end if
  return false
end function
/// Calls `mq3.client.console_input.charEvent` from console input `caughtChar`.
/// @param state Record read through `state.catcher`, `state.chat`, `state.console`.
/// @param ch Value used by `if (state.catcher&KEYCATCH_MESSAGE)!=0 then return charEvent(state,state.chat,ch) end if`.
function caughtChar(state,ch)
  if (state.catcher&KEYCATCH_MESSAGE)!=0 then return charEvent(state,state.chat,ch) end if
  if (state.catcher&KEYCATCH_CONSOLE)!=0 then return charEvent(state,state.console,ch) end if
  return false
end function
