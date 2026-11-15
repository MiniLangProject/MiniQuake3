// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Named VM_Create/VM_Restart/VM_Call/VM_Free lifecycle around the QVM interpreter.
package mq3.vm.runtime
import mq3.vm.interpreter as interpreter
import mq3.vm.jit_compat as jit
import mq3.compat.numeric as n
import std.string as strings

const MAX_VM=3
const VMI_NATIVE=0
const VMI_BYTECODE=1
const VMI_COMPILED=2
const STACK_SIZE=0x20000

struct Symbol value name profileCount end struct
struct Slot name image machine syscall active generation symbols numSymbols compiled native codeLength tableLength compiledPlan end struct
struct Services loadFn symbolFn developerFn diagnosticFn registerCvarFn addCommandFn logFn context end struct
struct Runtime slots services current last debugLevel syscallCount syscallLog end struct

function services() return Services(void,void,void,void,void,void,void,void) end function
function emptySlot() return Slot("",void,void,void,false,0,[],0,false,false,0,0,void) end function
function create(host)
  if host==void or host.loadFn==void then return error(3410,"VM runtime: missing image loader") end if
  return Runtime([emptySlot(),emptySlot(),emptySlot()],host,void,void,0,0,[])
end function

// VM_VM2C is an identity conversion in the shipped engine.
function vm2c(pointer,length) return pointer end function
function debug(runtime,level) if runtime!=void then runtime.debugLevel=level end if;return void end function

// ParseHex intentionally ignores non-hex characters rather than terminating.
function parseHex(text)
  value=0;if text==void then return 0 end if
  for each letter in bytes(text)
    digit=-1
    if letter>=48 and letter<=57 then digit=letter-48
    else if letter>=97 and letter<=102 then digit=letter-87
    else if letter>=65 and letter<=70 then digit=letter-55 end if
    if digit>=0 then value=n.add32(n.mul32(value,16),digit) end if
  end for
  return value
end function

function valueToFunctionSymbol(slot,value)
  if slot==void or len(slot.symbols)==0 then return Symbol(0,"",0) end if
  entry=slot.symbols[0]
  if len(slot.symbols)>1 then for index=1 to len(slot.symbols)-1 if slot.symbols[index].value<=value then entry=slot.symbols[index] else break end if end for end if
  return entry
end function
function valueToSymbol(slot,value)
  if slot==void or len(slot.symbols)==0 then return "NO SYMBOLS" end if
  entry=valueToFunctionSymbol(slot,value);if value==entry.value then return entry.name end if
  return entry.name+"+"+str(value-entry.value)
end function
function symbolToValue(slot,name)
  if slot==void then return 0 end if
  for each entry in slot.symbols if entry.name==name then return entry.value end if end for
  return 0
end function
function symbolForCompiledPointer(slot,code)
  if slot==void or slot.machine==void then return "Before code block" end if
  if code<0 then return "Before code block" end if
  if code>=slot.codeLength then return "After code block" end if
  instruction=0
  for index=0 to len(slot.machine.addresses)-1 if slot.machine.addresses[index]>code then break end if;instruction=index end for
  return valueToSymbol(slot,instruction)
end function

function tokens(text)
  if text==void then return [] end if;data=bytes(text);result=[];index=0
  while index<len(data)
    while index<len(data) and data[index]<=32 index=index+1 end while
    if index>=len(data) then break end if;start=index
    while index<len(data) and data[index]>32 index=index+1 end while
    result=result+[decode(slice(data,start,index-start))]
  end while
  return result
end function
function loadSymbols(slot,text,developer)
  if slot==void then return error(3416,"VM runtime: missing symbol target") end if
  // The original returns before touching an existing symbol table when
  // developer mode is disabled.
  if not developer then return slot.numSymbols end if
  slot.symbols=[];slot.numSymbols=0;if text==void then return 0 end if
  words=tokens(text);index=0
  while index<len(words)
    segment=parseHex(words[index]);index=index+1
    if segment!=0 then if index<len(words) then index=index+1 end if;if index<len(words) then index=index+1 end if;continue end if
    if index>=len(words) then break end if;value=parseHex(words[index]);index=index+1
    if index>=len(words) then break end if;name=words[index];index=index+1
    if slot.machine!=void and value>=0 and value<len(slot.machine.addresses) then value=slot.machine.addresses[value] end if
    slot.symbols=slot.symbols+[Symbol(value,name,0)]
  end while
  slot.numSymbols=len(slot.symbols);return slot.numSymbols
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

function compile(slot,image,syscall)
  slot.compiledPlan=jit.VM_Compile(image,syscall,"portable");slot.machine=slot.compiledPlan.machine;slot.compiled=true;slot.native=false;return slot.machine
end function
function loadMapSymbols(runtime,slot)
  if runtime.services.symbolFn==void then return 0 end if
  developer=false;if runtime.services.developerFn!=void then developer=runtime.services.developerFn(runtime.services) end if
  if not developer then return slot.numSymbols end if
  mapData=runtime.services.symbolFn(runtime.services,"vm/"+slot.name+".map");if mapData==void then return 0 end if
  mapText=mapData;if typeof(mapData)!="string" then mapText=decode(mapData) end if
  return loadSymbols(slot,mapText,true)
end function
function loadMode(runtime,name,syscall,mode)
  if runtime==void or typeof(name)!="string" or name=="" or syscall==void then return error(3410,"VM runtime: bad create parameters") end if
  existing=find(runtime,name);if existing!=void then return existing end if
  target=void
  for each slot in runtime.slots if not slot.active and target==void then target=slot end if end for
  if target==void then return error(3412,"VM runtime: no free slot") end if
  // MiniQuake3 deliberately hosts game modules as QVMs.  This is the same
  // fallback VM_Create takes when a requested native DLL cannot be loaded.
  if mode==VMI_NATIVE then mode=VMI_COMPILED end if
  image=loadImage(runtime,name)
  target.name=name;target.image=image;target.syscall=syscall;target.compiled=false;target.native=false
  if mode>=VMI_COMPILED then compile(target,image,syscall) else target.machine=interpreter.load(image,syscall) end if
  target.codeLength=len(target.machine.code);target.tableLength=len(target.machine.addresses)*4
  target.active=true;target.generation=target.generation+1
  loadMapSymbols(runtime,target)
  if runtime.services.diagnosticFn!=void then runtime.services.diagnosticFn(runtime.services,"load",name) end if
  return target
end function
function load(runtime,name,syscall) return loadMode(runtime,name,syscall,VMI_BYTECODE) end function

function restoreCurrent(runtime,previous) if previous!=void then runtime.current=previous end if;return void end function
function call(runtime,slot,args)
  if runtime==void or slot==void or not slot.active or slot.machine==void then return error(3413,"VM runtime: call on inactive VM") end if
  previous=runtime.current;runtime.last=slot;runtime.current=slot;defer restoreCurrent(runtime,previous)
  if runtime.debugLevel!=0 and runtime.services.diagnosticFn!=void then callNumber=0;if len(args)>0 then callNumber=args[0] end if;runtime.services.diagnosticFn(runtime.services,"call",str(callNumber)) end if
  if slot.compiled then return callCompiled(slot,args) end if;return interpreter.callFast(slot.machine,args)
end function

function callCompiled(slot,args) return jit.VM_CallCompiled(slot.compiledPlan,args) end function

function dllSyscall(runtime,args)
  if runtime==void or runtime.current==void or runtime.current.syscall==void then return error(3417,"VM runtime: DLL syscall without current VM") end if
  slot=runtime.current;machine=slot.machine;base=machine.programStack-68
  if base<0 or base+len(args)*4>len(machine.data) then return error(3417,"VM runtime: DLL syscall arguments outside VM memory") end if
  for index=0 to len(args)-1 n.writeU32(machine.data,base+index*4,args[index]) end for
  return slot.syscall(machine,base)
end function

function restart(runtime,slot)
  if runtime==void or slot==void or not slot.active then return error(3414,"VM runtime: restart on inactive VM") end if
  image=loadImage(runtime,slot.name);fresh=interpreter.load(image,slot.syscall)
  // VM_Restart reloads initialized/BSS data in place while retaining code,
  // symbols and instruction pointers.
  slot.image=image;slot.machine.data=fresh.data;slot.machine.mask=fresh.mask;slot.machine.programStack=fresh.programStack;slot.machine.stackBottom=fresh.stackBottom
  slot.generation=slot.generation+1
  if runtime.services.diagnosticFn!=void then runtime.services.diagnosticFn(runtime.services,"restart",slot.name) end if
  return slot
end function

function free(runtime,slot)
  if runtime==void or slot==void then return error(3415,"VM runtime: bad free parameters") end if
  if not slot.active then return void end if
  name=slot.name;slot.name="";slot.image=void;slot.machine=void;slot.syscall=void;slot.active=false
  slot.symbols=[];slot.numSymbols=0;slot.compiled=false;slot.native=false;slot.codeLength=0;slot.tableLength=0;slot.compiledPlan=void
  runtime.current=void;runtime.last=void
  if runtime.services.diagnosticFn!=void then runtime.services.diagnosticFn(runtime.services,"free",name) end if
  return void
end function

function freeAll(runtime)
  if runtime==void then return error(3415,"VM runtime: missing runtime") end if
  for each slot in runtime.slots
    if slot.active and runtime.services.diagnosticFn!=void then runtime.services.diagnosticFn(runtime.services,"free",slot.name) end if
    slot.name="";slot.image=void;slot.machine=void;slot.syscall=void;slot.active=false;slot.symbols=[];slot.numSymbols=0;slot.compiled=false;slot.native=false;slot.codeLength=0;slot.tableLength=0;slot.compiledPlan=void
  end for
  runtime.current=void;runtime.last=void;return void
end function
function clear(runtime) return freeAll(runtime) end function

function argPtr(runtime,value)
  if value==0 or runtime==void or runtime.current==void then return void end if
  if runtime.current.native then return value end if;return value&runtime.current.machine.mask
end function
function explicitArgPtr(runtime,slot,value)
  if value==0 or runtime==void or runtime.current==void or slot==void then return void end if
  if slot.native then return value end if;return value&slot.machine.mask
end function

function profileSort(left,right)
  if left.profileCount<right.profileCount then return -1 end if;if left.profileCount>right.profileCount then return 1 end if;return 0
end function
function profile(runtime)
  if runtime==void or runtime.last==void or len(runtime.last.symbols)==0 then return [] end if
  sorted=[];total=0
  for each entry in runtime.last.symbols
    inserted=false
    if len(sorted)>0 then for index=0 to len(sorted)-1 if profileSort(entry,sorted[index])<0 then sorted=slice(sorted,0,index)+[entry]+slice(sorted,index,len(sorted)-index);inserted=true;break end if end for end if
    if not inserted then sorted=sorted+[entry] end if;total=total+entry.profileCount
  end for
  lines=[]
  for each entry in sorted percent=0;if total!=0 then percent=n.trunc32(100.0*entry.profileCount/total) end if;lines=lines+[[percent,entry.profileCount,entry.name]];entry.profileCount=0 end for
  return [lines,total]
end function
function info(runtime)
  result=[];if runtime==void then return result end if
  for each slot in runtime.slots
    if not slot.active then break end if;kind="interpreted";if slot.native then kind="native" else if slot.compiled then kind="compiled on load" end if
    result=result+[[slot.name,kind,slot.codeLength,slot.tableLength,slot.machine.mask+1]]
  end for
  return result
end function
function logSyscalls(runtime,argsOffset,args)
  if runtime==void then return error(3417,"VM runtime: missing syscall logger") end if
  runtime.syscallCount=runtime.syscallCount+1;row=[runtime.syscallCount,argsOffset]
  for index=0 to 4 value=0;if index<len(args) then value=args[index] end if;row=row+[value] end for
  runtime.syscallLog=runtime.syscallLog+[row];if runtime.services.logFn!=void then runtime.services.logFn(runtime.services,row) end if;return row
end function

function init(runtime)
  if runtime==void then return error(3410,"VM runtime: missing init runtime") end if
  if runtime.services.registerCvarFn!=void then
    runtime.services.registerCvarFn(runtime.services,"vm_cgame","2",1);runtime.services.registerCvarFn(runtime.services,"vm_game","2",1);runtime.services.registerCvarFn(runtime.services,"vm_ui","2",1)
  end if
  if runtime.services.addCommandFn!=void then runtime.services.addCommandFn(runtime.services,"vmprofile",runtime);runtime.services.addCommandFn(runtime.services,"vminfo",runtime) end if
  freeAll(runtime);runtime.debugLevel=0;runtime.syscallCount=0;runtime.syscallLog=[];return runtime
end function
