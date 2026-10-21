// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CG_KEY_* host-side QVM ABI from CL_CgameSystemCalls.
package mq3.vm.cgame_key_traps

import mq3.vm.syscall_common as common

const CG_KEY_ISDOWN=60
const CG_KEY_GETCATCHER=61
const CG_KEY_SETCATCHER=62
const CG_KEY_GETKEY=63
const MAX_KEYS=256

struct Services context isDownFn getCatcherFn setCatcherFn getKeyFn end struct
struct State down bindings catcher overstrike end struct

function services(context) return Services(context,void,void,void,void) end function
function create() return State(array(MAX_KEYS,false),array(MAX_KEYS,void),0,false) end function
function fail(message) return error(7487,"cgame key traps: "+message) end function
function unavailable(name) return fail(name+" service unavailable") end function
function arg(vm,base,index) return common.argument(vm,base,index) end function

// These state helpers mirror cl_keys.c and cl_ui.c closely enough to be shared
// by native input, the UI QVM and the cgame QVM without exposing VM memory.
function validKey(key) return key>=0 and key<MAX_KEYS end function
function setDown(state,key,value)
  if state==void or not validKey(key) then return false end if
  state.down[key]=value;return true
end function
function isDown(state,key)
  if state==void or not validKey(key) then return false end if
  return state.down[key]
end function
function getCatcher(state) if state==void then return 0 end if;return state.catcher end function
function setCatcher(state,value) if state!=void then state.catcher=value end if;return void end function
function setBinding(state,key,value)
  if state==void or not validKey(key) then return false end if
  if value==void then value="" end if;state.bindings[key]=value;return true
end function
function getBinding(state,key)
  if state==void or not validKey(key) then return "" end if
  return state.bindings[key]
end function
function getKey(state,binding)
  if state==void or binding==void then return -1 end if
  // Key_GetKey scans the 256-entry table from zero and compares bindings
  // without case sensitivity, returning the first matching key number.
  for key=0 to MAX_KEYS-1
    value=state.bindings[key]
    if value!=void and stringEqualsIgnoreCaseAscii(value,binding) then return key end if
  end for
  return -1
end function

// Exact cl_keys.c textual key ABI used by the original controls menu.  Keys
// absent from keynames[] intentionally retain the lowercase 0xnn spelling.
function keynumToString(key)
  if key==-1 then return "<KEY NOT FOUND>" end if
  if key<0 or key>255 then return "<OUT OF RANGE>" end if
  if key>32 and key<127 and key!=34 and key!=59 then return decode(bytes(1,key)) end if
  if key==9 then return "TAB" end if
  if key==13 then return "ENTER" end if
  if key==27 then return "ESCAPE" end if
  if key==32 then return "SPACE" end if
  if key==127 then return "BACKSPACE" end if
  if key==128 then return "COMMAND" end if
  if key==129 then return "CAPSLOCK" end if
  if key==131 then return "PAUSE" end if
  if key==132 then return "UPARROW" end if
  if key==133 then return "DOWNARROW" end if
  if key==134 then return "LEFTARROW" end if
  if key==135 then return "RIGHTARROW" end if
  if key==136 then return "ALT" end if
  if key==137 then return "CTRL" end if
  if key==138 then return "SHIFT" end if
  if key==139 then return "INS" end if
  if key==140 then return "DEL" end if
  if key==141 then return "PGDN" end if
  if key==142 then return "PGUP" end if
  if key==143 then return "HOME" end if
  if key==144 then return "END" end if
  if key>=145 and key<=156 then return "F"+str(key-144) end if
  keypad=["KP_HOME","KP_UPARROW","KP_PGUP","KP_LEFTARROW","KP_5","KP_RIGHTARROW","KP_END","KP_DOWNARROW","KP_PGDN","KP_ENTER","KP_INS","KP_DEL","KP_SLASH","KP_MINUS","KP_PLUS","KP_NUMLOCK","KP_STAR","KP_EQUALS"]
  if key>=160 and key<=177 then return keypad[key-160] end if
  if key>=178 and key<=182 then return "MOUSE"+str(key-177) end if
  if key==183 then return "MWHEELDOWN" end if
  if key==184 then return "MWHEELUP" end if
  if key>=185 and key<=216 then return "JOY"+str(key-184) end if
  if key>=217 and key<=232 then return "AUX"+str(key-216) end if
  if key==59 then return "SEMICOLON" end if
  digits="0123456789abcdef"
  return "0x"+decode(slice(bytes(digits),key>>4,1))+decode(slice(bytes(digits),key&15,1))
end function

function hexNibble(value)
  if value>=48 and value<=57 then return value-48 end if
  if value>=97 and value<=102 then return value-97+10 end if
  return 0
end function

function stringToKeynum(text)
  if text==void or len(text)==0 then return -1 end if
  raw=bytes(text);if len(raw)==1 then return raw[0] end if
  if len(raw)==4 and raw[0]==48 and raw[1]==120 then return hexNibble(raw[2])*16+hexNibble(raw[3]) end if
  for key=0 to 255 if stringEqualsIgnoreCaseAscii(keynumToString(key),text) then return key end if end for
  return -1
end function

function getOverstrike(state) if state==void then return false end if;return state.overstrike end function
function setOverstrike(state,value) if state!=void then state.overstrike=value end if;return void end function
function clearStates(state)
  if state==void then return void end if
  for key=0 to MAX_KEYS-1 state.down[key]=false end for
  return void
end function

function stateServices(state)
  host=services(state);host.isDownFn=isDown;host.getCatcherFn=getCatcher
  host.setCatcherFn=setCatcher;host.getKeyFn=getKey;return host
end function

function dispatch(host,vm,base)
  if host==void or vm==void or typeof(vm.data)!="bytes" then return fail("invalid dispatcher context") end if
  op=arg(vm,base,0)
  switch op
    case CG_KEY_ISDOWN
      if host.isDownFn==void then return unavailable("key state") end if
      if host.isDownFn(host.context,arg(vm,base,1)) then return 1 end if;return 0
    end case
    case CG_KEY_GETCATCHER
      if host.getCatcherFn==void then return unavailable("key catcher") end if
      return host.getCatcherFn(host.context)
    end case
    case CG_KEY_SETCATCHER
      if host.setCatcherFn==void then return unavailable("set key catcher") end if
      host.setCatcherFn(host.context,arg(vm,base,1));return 0
    end case
    case CG_KEY_GETKEY
      if host.getKeyFn==void then return unavailable("binding lookup") end if
      return host.getKeyFn(host.context,common.readString(vm,arg(vm,base,1)))
    end case
  end switch
  return fail("unsupported trap "+str(op))
end function

function callback(host) return function(vm,base) => dispatch(host,vm,base) end function
