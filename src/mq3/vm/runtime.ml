// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Named VM_Create/VM_Restart/VM_Call/VM_Free lifecycle around the QVM interpreter.
package mq3.vm.runtime
import mq3.vm.interpreter as interpreter
import std.string as strings

const MAX_VM=3

struct Slot name image machine syscall active generation end struct
struct Services loadFn diagnosticFn context end struct
struct Runtime slots services current last end struct

function services() return Services(void,void,void) end function
function emptySlot() return Slot("",void,void,void,false,0) end function
function create(host)
  if host==void or host.loadFn==void then return error(3410,"VM runtime: missing image loader") end if
  return Runtime([emptySlot(),emptySlot(),emptySlot()],host,void,void)
end function

function sameName(left,right) return strings.toLowerAscii(left)==strings.toLowerAscii(right) end function
function find(runtime,name)
  if runtime==void or name==void then return void end if
  for each slot in runtime.slots if slot.active and sameName(slot.name,name) then return slot end if end for
  return void
end function

function loadImage(runtime,name)
  image=runtime.services.loadFn(runtime.services,"vm/"+name+".qvm")
  if image==void then return error(3411,"VM runtime: image not found: "+name) end if
  return image
end function

function load(runtime,name,syscall)
  if runtime==void or typeof(name)!="string" or name=="" or syscall==void then return error(3410,"VM runtime: bad create parameters") end if
  existing=find(runtime,name);if existing!=void then return existing end if
  target=void
  for each slot in runtime.slots if not slot.active and target==void then target=slot end if end for
  if target==void then return error(3412,"VM runtime: no free slot") end if
  image=loadImage(runtime,name);machine=interpreter.load(image,syscall)
  target.name=name;target.image=image;target.machine=machine;target.syscall=syscall
  target.active=true;target.generation=target.generation+1
  if runtime.services.diagnosticFn!=void then runtime.services.diagnosticFn(runtime.services,"load",name) end if
  return target
end function

function restoreCurrent(runtime,previous) runtime.current=previous;return void end function
function call(runtime,slot,args)
  if runtime==void or slot==void or not slot.active or slot.machine==void then return error(3413,"VM runtime: call on inactive VM") end if
  previous=runtime.current;runtime.last=previous;runtime.current=slot;defer restoreCurrent(runtime,previous)
  return interpreter.call(slot.machine,args)
end function

function restart(runtime,slot)
  if runtime==void or slot==void or not slot.active then return error(3414,"VM runtime: restart on inactive VM") end if
  image=loadImage(runtime,slot.name);slot.image=image;slot.machine=interpreter.load(image,slot.syscall)
  slot.generation=slot.generation+1
  if runtime.services.diagnosticFn!=void then runtime.services.diagnosticFn(runtime.services,"restart",slot.name) end if
  return slot
end function

function free(runtime,slot)
  if runtime==void or slot==void then return error(3415,"VM runtime: bad free parameters") end if
  if not slot.active then return void end if
  if runtime.current==slot then return error(3415,"VM runtime: cannot free current VM") end if
  name=slot.name;slot.name="";slot.image=void;slot.machine=void;slot.syscall=void;slot.active=false
  if runtime.last==slot then runtime.last=void end if
  if runtime.services.diagnosticFn!=void then runtime.services.diagnosticFn(runtime.services,"free",name) end if
  return void
end function

function freeAll(runtime)
  if runtime==void then return error(3415,"VM runtime: missing runtime") end if
  for each slot in runtime.slots free(runtime,slot) end for
  runtime.current=void;runtime.last=void;return void
end function
