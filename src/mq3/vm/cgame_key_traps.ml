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
struct State down bindings catcher end struct

function services(context) return Services(context,void,void,void,void) end function
function create() return State(array(MAX_KEYS,false),array(MAX_KEYS,void),0) end function
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
