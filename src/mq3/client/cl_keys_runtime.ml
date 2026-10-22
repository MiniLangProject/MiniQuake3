// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native MiniLang facade for client/cl_keys.c.
package mq3.client.cl_keys_runtime

import mq3.vm.cgame_key_traps as keys
import mq3.client.console_input as console
import mq3.client.key_binding_dispatch as dispatch
import mq3.client.key_bindings_config as config
import mq3.qcommon.command_buffer as command

const MAX_KEYS=256
const KEYCATCH_CONSOLE=1
const KEYCATCH_UI=2
const KEYCATCH_MESSAGE=4
const KEYCATCH_CGAME=8
const K_CHAR_FLAG=1024
const K_ESCAPE=27
// connstate_t is a public ABI shared with client.h and ui_public.h.  Keep the
// explicit Baseq3 ordinals here because routing below depends on the otherwise
// easy-to-confuse DISCONNECTED, PRIMED and CINEMATIC values.
const CA_UNINITIALIZED=0
const CA_DISCONNECTED=1
const CA_AUTHORIZING=2
const CA_CONNECTING=3
const CA_CHALLENGING=4
const CA_CONNECTED=5
const CA_LOADING=6
const CA_PRIMED=7
const CA_ACTIVE=8
const CA_CINEMATIC=9
const SMALLCHAR_WIDTH=8
const BIGCHAR_WIDTH=16

struct Event kind key down text end struct
struct DrawResult text x y size cursorVisible cursorX cursorChar prestep end struct
struct Runtime keyState consoleState repeats anyKeyDown events commandState bindingState archiveModified demoPlaying cameraMode initialized end struct

function create(width,services)
  keyState=keys.create();consoleState=console.create(width,services);commandState=command.create();command.initCommands(commandState);return Runtime(keyState,consoleState,array(MAX_KEYS,0),0,[],commandState,config.create(keyState),false,false,0,false)
end function
function event(state,kind,key,down,text) state.events=state.events+[Event(kind,key,down,text)];return void end function
function syncCatcher(state) state.keyState.catcher=state.consoleState.catcher;return void end function
function valid(key) return key>=0 and key<MAX_KEYS end function

function Key_IsDown(state,keynum) if keynum==-1 or state==void or not valid(keynum) then return false end if;return keys.isDown(state.keyState,keynum) end function
function Key_StringToKeynum(text) return keys.stringToKeynum(text) end function
function Key_KeynumToString(keynum) return keys.keynumToString(keynum) end function
function Key_SetBinding(state,keynum,binding) if state==void or keynum==-1 or not valid(keynum) then return false end if;result=keys.setBinding(state.keyState,keynum,binding);if result then state.archiveModified=true end if;return result end function
function Key_GetBinding(state,keynum) if state==void or keynum==-1 or not valid(keynum) then return "" end if;return keys.getBinding(state.keyState,keynum) end function
function Key_GetKey(state,binding) if state==void then return -1 end if;return keys.getKey(state.keyState,binding) end function
function Key_GetOverstrikeMode(state) if state==void then return false end if;return keys.getOverstrike(state.keyState) end function
function Key_SetOverstrikeMode(state,value) if state!=void then keys.setOverstrike(state.keyState,value);state.consoleState.overstrike=value end if;return void end function

function Field_Paste(state,edit) if state==void then return false end if;state.consoleState.overstrike=keys.getOverstrike(state.keyState);result=console.paste(state.consoleState,edit);keys.setOverstrike(state.keyState,state.consoleState.overstrike);return result end function
function Field_KeyDownEvent(state,edit,key)
  if state==void then return false end if;state.consoleState.overstrike=keys.getOverstrike(state.keyState);result=console.fieldKeyDown(state.consoleState,edit,key,Key_IsDown(state,console.K_SHIFT),Key_IsDown(state,console.K_CTRL));keys.setOverstrike(state.keyState,state.consoleState.overstrike);return result
end function
function Field_CharEvent(state,edit,ch)
  if state==void then return false end if;state.consoleState.overstrike=keys.getOverstrike(state.keyState);result=console.charEvent(state.consoleState,edit,ch);keys.setOverstrike(state.keyState,state.consoleState.overstrike);return result
end function
function visibleLength(text) raw=bytes(text);count=0;index=0;while index<len(raw) if raw[index]==94 and index+1<len(raw) and raw[index+1]!=94 then index=index+2 else count=count+1;index=index+1 end if end while;return count end function
function Field_VariableSizeDraw(state,edit,x,y,width,size,showCursor,realtime)
  drawLen=edit.widthInChars;length=len(bytes(edit.text))+1;prestep=0
  if length>drawLen then if edit.scroll+drawLen>length then edit.scroll=length-drawLen;if edit.scroll<0 then edit.scroll=0 end if end if;prestep=edit.scroll end if
  if prestep+drawLen>length then drawLen=length-prestep end if;available=len(bytes(edit.text))-prestep;if available<0 then available=0 end if;copy=drawLen;if copy>available then copy=available end if;text=decode(slice(bytes(edit.text),prestep,copy));cursorVisible=showCursor and ((realtime>>8)&1)==0;cursorChar=10;if Key_GetOverstrikeMode(state) then cursorChar=11 end if;i=drawLen-(visibleLength(text)+1);cursorX=x+(edit.cursor-prestep-i)*size;return DrawResult(text,x,y,size,cursorVisible,cursorX,cursorChar,prestep)
end function
function Field_Draw(state,edit,x,y,width,showCursor,realtime) return Field_VariableSizeDraw(state,edit,x,y,width,SMALLCHAR_WIDTH,showCursor,realtime) end function
function Field_BigDraw(state,edit,x,y,width,showCursor,realtime) return Field_VariableSizeDraw(state,edit,x,y,width,BIGCHAR_WIDTH,showCursor,realtime) end function

function Key_Unbind_f(state,args)
  if len(args)!=2 then event(state,"print",-1,false,"unbind <key> : remove commands from a key\n");return false end if;key=Key_StringToKeynum(args[1]);if key==-1 then event(state,"print",-1,false,"\""+args[1]+"\" isn't a valid key\n");return false end if;return Key_SetBinding(state,key,"")
end function
function Key_Unbindall_f(state,args) for key=0 to MAX_KEYS-1 value=Key_GetBinding(state,key);if value!=void then Key_SetBinding(state,key,"") end if end for;return true end function
function Key_Bind_f(state,args)
  if len(args)<2 then event(state,"print",-1,false,"bind <key> [command] : attach a command to a key\n");return false end if;key=Key_StringToKeynum(args[1]);if key==-1 then event(state,"print",-1,false,"\""+args[1]+"\" isn't a valid key\n");return false end if
  if len(args)==2 then value=Key_GetBinding(state,key);if value!=void and value!="" then event(state,"print",key,false,"\""+args[1]+"\" = \""+value+"\"\n") else event(state,"print",key,false,"\""+args[1]+"\" is not bound\n") end if;return true end if
  value="";for index=2 to len(args)-1 if index>2 then value=value+" " end if;value=value+args[index] end for;return Key_SetBinding(state,key,value)
end function
function Key_WriteBindings(state) if state==void then return "unbindall\n" end if;return config.bindingText(state.bindingState) end function
function Key_Bindlist_f(state,args) count=0;for key=0 to MAX_KEYS-1 value=Key_GetBinding(state,key);if value!=void and value!="" then event(state,"print",key,false,Key_KeynumToString(key)+" \""+value+"\"\n");count=count+1 end if end for;return count end function
function commandArgs(commandState) result=[];for index=0 to command.argc(commandState)-1 result=result+[command.argv(commandState,index)] end for;return result end function
function bindCallback(commandState,state) return Key_Bind_f(state,commandArgs(commandState)) end function
function unbindCallback(commandState,state) return Key_Unbind_f(state,commandArgs(commandState)) end function
function unbindAllCallback(commandState,state) return Key_Unbindall_f(state,commandArgs(commandState)) end function
function bindListCallback(commandState,state) return Key_Bindlist_f(state,commandArgs(commandState)) end function
function CL_InitKeyCommands(state)
  if state==void then return false end if;if state.initialized then return true end if
  if not command.addContextCommand(state.commandState,"bind",bindCallback,state) then return error(7805,"bind command already registered") end if
  if not command.addContextCommand(state.commandState,"unbind",unbindCallback,state) then return error(7805,"unbind command already registered") end if
  if not command.addContextCommand(state.commandState,"unbindall",unbindAllCallback,state) then return error(7805,"unbindall command already registered") end if
  if not command.addContextCommand(state.commandState,"bindlist",bindListCallback,state) then return error(7805,"bindlist command already registered") end if
  state.initialized=true;return true
end function

function CL_AddKeyUpCommands(state,key,binding,time)
  values=dispatch.commands(binding,key,false,time);if values is error then return values end if;for each value in values event(state,"command",key,false,value.text) end for;return values
end function
function Console_Key(state,key) result=console.consoleKey(state.consoleState,key,Key_IsDown(state,console.K_SHIFT),Key_IsDown(state,console.K_CTRL));syncCatcher(state);return result end function
function Message_Key(state,key) result=console.messageKey(state.consoleState,key,Key_IsDown(state,console.K_SHIFT),Key_IsDown(state,console.K_CTRL));syncCatcher(state);return result end function

function CL_KeyEvent(state,key,down,time)
  if state==void or not valid(key) then return false end if;keys.setDown(state.keyState,key,down)
  if down then state.repeats[key]=state.repeats[key]+1;if state.repeats[key]==1 then state.anyKeyDown=state.anyKeyDown+1 end if
  else state.repeats[key]=0;state.anyKeyDown=state.anyKeyDown-1;if state.anyKeyDown<0 then state.anyKeyDown=0 end if end if
  if key==96 or key==126 then if down then console.toggleConsole(state.consoleState);syncCatcher(state);event(state,"console-toggle",key,true,"") end if;return true end if
  catcher=state.consoleState.catcher
  if down and (key<128 or key==178) and (state.demoPlaying or state.consoleState.connectionState==CA_CINEMATIC) and catcher==0 and state.cameraMode==0 then event(state,"set-nextdemo",key,true,"");key=K_ESCAPE end if
  if key==K_ESCAPE and down then
    if (catcher&KEYCATCH_MESSAGE)!=0 then Message_Key(state,key);return true end if
    if (catcher&KEYCATCH_CGAME)!=0 then state.consoleState.catcher=catcher&(~KEYCATCH_CGAME);syncCatcher(state);event(state,"cgame-event-none",key,true,"");return true end if
    if (catcher&KEYCATCH_UI)==0 then if state.consoleState.connectionState==CA_ACTIVE and not state.demoPlaying then state.consoleState.catcher=catcher|KEYCATCH_UI;event(state,"ui-menu",key,true,"ingame") else event(state,"disconnect",key,true,"");state.consoleState.catcher=catcher|KEYCATCH_UI;event(state,"ui-menu",key,true,"main") end if;syncCatcher(state);return true end if
    event(state,"ui-key",key,true,"");return true
  end if
  if not down then
    CL_AddKeyUpCommands(state,key,Key_GetBinding(state,key),time);if (catcher&KEYCATCH_UI)!=0 then event(state,"ui-key",key,false,"") else if (catcher&KEYCATCH_CGAME)!=0 then event(state,"cgame-key",key,false,"") end if;return true
  end if
  if (catcher&KEYCATCH_CONSOLE)!=0 then Console_Key(state,key)
  else if (catcher&KEYCATCH_UI)!=0 then event(state,"ui-key",key,true,"")
  else if (catcher&KEYCATCH_CGAME)!=0 then event(state,"cgame-key",key,true,"")
  else if (catcher&KEYCATCH_MESSAGE)!=0 then Message_Key(state,key)
  else if state.consoleState.connectionState==CA_DISCONNECTED then Console_Key(state,key)
  else binding=Key_GetBinding(state,key);if binding==void or binding=="" then if key>=200 then event(state,"print",key,true,Key_KeynumToString(key)+" is unbound, use controls menu to set.\n") end if else values=dispatch.commands(binding,key,true,time);if values is error then return values end if;for each value in values event(state,"command",key,true,value.text) end for end if end if
  return true
end function
function CL_CharEvent(state,key)
  if state==void or key==96 or key==126 then return false end if;catcher=state.consoleState.catcher
  if (catcher&KEYCATCH_CONSOLE)!=0 then Field_CharEvent(state,state.consoleState.console,key)
  else if (catcher&KEYCATCH_UI)!=0 then event(state,"ui-key",key|K_CHAR_FLAG,true,"")
  else if (catcher&KEYCATCH_MESSAGE)!=0 then Field_CharEvent(state,state.consoleState.chat,key)
  else if state.consoleState.connectionState==CA_DISCONNECTED then Field_CharEvent(state,state.consoleState.console,key) end if;return true
end function
function Key_ClearStates(state)
  if state==void then return void end if;state.anyKeyDown=0;for key=0 to MAX_KEYS-1 if Key_IsDown(state,key) then CL_KeyEvent(state,key,false,0) end if;keys.setDown(state.keyState,key,false);state.repeats[key]=0 end for;return void
end function
