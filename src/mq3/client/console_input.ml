// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 cl_keys.c Field_*, Console_Key and Message_Key state machine.
package mq3.client.console_input

const MAX_EDIT_LINE=256
const COMMAND_HISTORY=32
const KEYCATCH_CONSOLE=1
const KEYCATCH_MESSAGE=4
const CA_ACTIVE=8
const K_TAB=9
const K_ENTER=13
const K_ESCAPE=27
const K_BACKSPACE=127
const K_UPARROW=132
const K_DOWNARROW=133
const K_LEFTARROW=134
const K_RIGHTARROW=135
const K_CTRL=137
const K_SHIFT=138
const K_INS=139
const K_DEL=140
const K_PGDN=141
const K_PGUP=142
const K_HOME=143
const K_END=144
const K_KP_UPARROW=161
const K_KP_DOWNARROW=167
const K_KP_ENTER=169
const K_KP_INS=170
const K_MWHEELDOWN=183
const K_MWHEELUP=184

struct Field cursor scroll widthInChars text end struct
struct Services context commandFn reliableFn printFn completeFn clipboardFn scrollFn end struct
struct State console chat history nextHistoryLine historyLine overstrike catcher connectionState chatTeam chatPlayerNum services consoleRuntime end struct

function field(width) return Field(0,0,width,"") end function
function services(context) return Services(context,void,void,void,void,void,void) end function
function create(width,host)
  history=[];for index=0 to COMMAND_HISTORY-1 history=history+[field(width)] end for
  return State(field(width),field(30),history,0,0,false,0,0,false,-1,host,void)
end function
function toggleConsole(state)
  if state==void then return false end if
  clear(state.console);state.catcher=state.catcher^KEYCATCH_CONSOLE;return true
end function
function beginMessage(state,team,playerNum)
  if state==void then return false end if
  state.chatTeam=team;state.chatPlayerNum=playerNum;clear(state.chat)
  if team then state.chat.widthInChars=25 else state.chat.widthInChars=30 end if
  state.catcher=state.catcher^KEYCATCH_MESSAGE;return true
end function
function cloneField(value) return Field(value.cursor,value.scroll,value.widthInChars,value.text) end function
function clear(value) value.cursor=0;value.scroll=0;value.text="";return void end function
function lowerKey(key) if key>=65 and key<=90 then return key+32 end if;return key end function
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
function paste(state,edit)
  if state.services==void or state.services.clipboardFn==void then return false end if
  value=state.services.clipboardFn(state.services.context);if value==void then return false end if
  for each ch in bytes(value) insertByte(state,edit,ch) end for;return true
end function
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
function emitCommand(state,text) if state.services!=void and state.services.commandFn!=void then state.services.commandFn(state.services.context,text) end if;return void end function
function emitReliable(state,text) if state.services!=void and state.services.reliableFn!=void then state.services.reliableFn(state.services.context,text) end if;return void end function
function emitPrint(state,text) if state.services!=void and state.services.printFn!=void then state.services.printFn(state.services.context,text) end if;return void end function
function scroll(state,operation,count) if state.services!=void and state.services.scrollFn!=void then state.services.scrollFn(state.services.context,operation,count) end if;return void end function
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
function caughtKey(state,key,shift,ctrl)
  if (state.catcher&KEYCATCH_MESSAGE)!=0 then return messageKey(state,key,shift,ctrl) end if
  if (state.catcher&KEYCATCH_CONSOLE)!=0 then return consoleKey(state,key,shift,ctrl) end if
  return false
end function
function caughtChar(state,ch)
  if (state.catcher&KEYCATCH_MESSAGE)!=0 then return charEvent(state,state.chat,ch) end if
  if (state.catcher&KEYCATCH_CONSOLE)!=0 then return charEvent(state,state.console,ch) end if
  return false
end function
