// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Shared, memory-safe QVM syscall boundary for qagame, cgame and UI.
package mq3.vm.syscall_common
import mq3.compat.numeric as n
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as command

const ABI_QAGAME = 0
const ABI_CGAME = 1
const ABI_UI = 2
const MAX_VM_STRING = 8192
const VM_CVAR_SIZE = 272

struct Services
  cvars
  commands
  context
  printFn
  errorFn
  millisecondsFn
  consoleFn
  openFn
  readFn
  writeFn
  closeFn
end struct

struct OpenResult handle length end struct

function services(registry,commands,context)
  return Services(registry,commands,context,void,void,void,void,void,void,void,void)
end function

function fail(message) return error(3420,"QVM syscall: "+message) end function

function argument(vm,address,index)
  at=address+index*4
  if address<0 or index<0 or at<address or at+4>len(vm.data) then return fail("argument vector outside VM memory") end if
  return n.readI32(vm.data,at)
end function

function pointer(vm,value,size,label)
  if value==0 then return fail(label+" is NULL") end if
  if size<0 then return fail(label+" has negative size") end if
  at=value & vm.mask
  if at<0 or at>len(vm.data) or size>len(vm.data)-at then return fail(label+" outside VM memory") end if
  return at
end function

function readString(vm,value)
  at=pointer(vm,value,1,"string");limit=at+MAX_VM_STRING
  if limit>len(vm.data) then limit=len(vm.data) end if
  stop=at
  while stop<limit and vm.data[stop]!=0 stop=stop+1 end while
  if stop==limit then return fail("unterminated VM string") end if
  return decode(slice(vm.data,at,stop-at))
end function

function writeBuffer(vm,value,capacity,data,label)
  if capacity<0 then return fail(label+" has negative capacity") end if
  if capacity==0 then return 0 end if
  at=pointer(vm,value,capacity,label);source=bytes(data);count=len(source)
  if count>=capacity then count=capacity-1 end if
  copyBytes(vm.data,at,source,0,count);vm.data[at+count]=0
  return count
end function

function writeRaw(vm,value,data,count,label)
  if count<0 then return fail(label+" has negative length") end if
  at=pointer(vm,value,count,label)
  if len(data)<count then return fail(label+" service returned too few bytes") end if
  if count>0 then copyBytes(vm.data,at,data,0,count) end if
  return void
end function

function requireCvars(host)
  if host.cvars==void then return fail("cvar service unavailable") end if
  return host.cvars
end function

function writeVmCvar(vm,address,variable)
  at=pointer(vm,address,VM_CVAR_SIZE,"vmCvar_t")
  n.writeU32(vm.data,at,variable.index);n.writeU32(vm.data,at+4,variable.modificationCount)
  n.writeU32(vm.data,at+8,n.floatBits(variable.value));n.writeU32(vm.data,at+12,variable.integer)
  data=bytes(variable.string);if len(data)>255 then return fail("cvar string exceeds vmCvar_t") end if
  for index=0 to 255 vm.data[at+16+index]=0 end for
  if len(data)>0 then copyBytes(vm.data,at+16,data,0,len(data)) end if
  return void
end function

function registerCvar(vm,base,host)
  registry=requireCvars(host);target=argument(vm,base,1)
  variable=cvar.get(registry,readString(vm,argument(vm,base,2)),readString(vm,argument(vm,base,3)),argument(vm,base,4))
  if target!=0 then writeVmCvar(vm,target,variable) end if
  return 0
end function

function updateCvar(vm,base,host)
  registry=requireCvars(host);target=argument(vm,base,1);at=pointer(vm,target,VM_CVAR_SIZE,"vmCvar_t")
  handle=n.readI32(vm.data,at)
  if handle<0 or handle>=registry.numIndexes then return fail("vmCvar_t handle out of range") end if
  variable=registry.indexes[handle]
  if n.readI32(vm.data,at+4)!=variable.modificationCount then writeVmCvar(vm,target,variable) end if
  return 0
end function

function cvarSet(vm,base,host)
  cvar.set2(requireCvars(host),readString(vm,argument(vm,base,1)),readString(vm,argument(vm,base,2)),false);return 0
end function

function cvarInteger(vm,base,host)
  variable=cvar.find(requireCvars(host),readString(vm,argument(vm,base,1)))
  if variable==void then return 0 end if
  return variable.integer
end function

function cvarValueBits(vm,base,host)
  variable=cvar.find(requireCvars(host),readString(vm,argument(vm,base,1)))
  if variable==void then return 0 end if
  return n.i32(n.floatBits(variable.value))
end function

function cvarString(vm,base,host)
  variable=cvar.find(requireCvars(host),readString(vm,argument(vm,base,1)));text=""
  if variable!=void then text=variable.string end if
  writeBuffer(vm,argument(vm,base,2),argument(vm,base,3),text,"cvar output");return 0
end function

function argc(host)
  if host.commands==void then return fail("command service unavailable") end if
  return command.argc(host.commands)
end function

function argv(vm,base,host)
  if host.commands==void then return fail("command service unavailable") end if
  text=command.argv(host.commands,argument(vm,base,1))
  writeBuffer(vm,argument(vm,base,2),argument(vm,base,3),text,"argv output");return 0
end function

function argsText(vm,base,host)
  if host.commands==void then return fail("command service unavailable") end if
  writeBuffer(vm,argument(vm,base,1),argument(vm,base,2),command.args(host.commands),"args output");return 0
end function

function fsOpen(vm,base,host)
  if host.openFn==void then return fail("file open service unavailable") end if
  target=argument(vm,base,2);pointer(vm,target,4,"file handle output")
  result=host.openFn(host.context,readString(vm,argument(vm,base,1)),argument(vm,base,3))
  if result==void then result=OpenResult(0,-1) end if
  n.writeU32(vm.data,target & vm.mask,result.handle);return result.length
end function

function fsRead(vm,base,host)
  if host.readFn==void then return fail("file read service unavailable") end if
  count=argument(vm,base,2);data=host.readFn(host.context,argument(vm,base,3),count)
  writeRaw(vm,argument(vm,base,1),data,count,"file read output");return 0
end function

function fsWrite(vm,base,host)
  if host.writeFn==void then return fail("file write service unavailable") end if
  count=argument(vm,base,2);at=pointer(vm,argument(vm,base,1),count,"file write input")
  host.writeFn(host.context,argument(vm,base,3),slice(vm.data,at,count));return 0
end function

function fsClose(vm,base,host)
  if host.closeFn==void then return fail("file close service unavailable") end if
  host.closeFn(host.context,argument(vm,base,1));return 0
end function

function emitPrint(vm,base,host,isError)
  text=readString(vm,argument(vm,base,1));callback=host.printFn
  if isError then callback=host.errorFn end if
  if callback==void then return fail("console service unavailable") end if
  callback(host.context,text);return 0
end function

function executeConsole(vm,base,host)
  if host.consoleFn==void then return fail("console command service unavailable") end if
  host.consoleFn(host.context,argument(vm,base,1),readString(vm,argument(vm,base,2)));return 0
end function

function dispatchQagame(vm,base,host,op)
  switch op
    case 0 return emitPrint(vm,base,host,false) end case
    case 1 return emitPrint(vm,base,host,true) end case
    case 2 if host.millisecondsFn==void then return fail("clock service unavailable") end if;return host.millisecondsFn(host.context) end case
    case 3 return registerCvar(vm,base,host) end case
    case 4 return updateCvar(vm,base,host) end case
    case 5 return cvarSet(vm,base,host) end case
    case 6 return cvarInteger(vm,base,host) end case
    case 7 return cvarString(vm,base,host) end case
    case 8 return argc(host) end case
    case 9 return argv(vm,base,host) end case
    case 10 return fsOpen(vm,base,host) end case
    case 11 return fsRead(vm,base,host) end case
    case 12 return fsWrite(vm,base,host) end case
    case 13 return fsClose(vm,base,host) end case
    case 14 return executeConsole(vm,base,host) end case
  end switch
  return fail("unsupported qagame trap "+str(op))
end function

function dispatchCgame(vm,base,host,op)
  if op<=5 then return dispatchQagame(vm,base,host,op) end if
  switch op
    case 6 return cvarString(vm,base,host) end case
    case 7 return argc(host) end case
    case 8 return argv(vm,base,host) end case
    case 9 return argsText(vm,base,host) end case
    case 10 return fsOpen(vm,base,host) end case
    case 11 return fsRead(vm,base,host) end case
    case 12 return fsWrite(vm,base,host) end case
    case 13 return fsClose(vm,base,host) end case
    case 14 return executeConsole(vm,base,host) end case
  end switch
  return fail("unsupported cgame trap "+str(op))
end function

function dispatchUi(vm,base,host,op)
  switch op
    case 0 return emitPrint(vm,base,host,true) end case
    case 1 return emitPrint(vm,base,host,false) end case
    case 2 if host.millisecondsFn==void then return fail("clock service unavailable") end if;return host.millisecondsFn(host.context) end case
    case 3 return cvarSet(vm,base,host) end case
    case 4 return cvarValueBits(vm,base,host) end case
    case 5 return cvarString(vm,base,host) end case
    case 10 return argc(host) end case
    case 11 return argv(vm,base,host) end case
    case 12 return executeConsole(vm,base,host) end case
    case 13 return fsOpen(vm,base,host) end case
    case 14 return fsRead(vm,base,host) end case
    case 15 return fsWrite(vm,base,host) end case
    case 16 return fsClose(vm,base,host) end case
    case 50 return registerCvar(vm,base,host) end case
    case 51 return updateCvar(vm,base,host) end case
  end switch
  return fail("unsupported UI trap "+str(op))
end function

function dispatch(abi,host,vm,base)
  if host==void or vm==void or typeof(vm.data)!="bytes" then return fail("invalid dispatcher context") end if
  op=argument(vm,base,0)
  if abi==ABI_QAGAME then return dispatchQagame(vm,base,host,op) end if
  if abi==ABI_CGAME then return dispatchCgame(vm,base,host,op) end if
  if abi==ABI_UI then return dispatchUi(vm,base,host,op) end if
  return fail("unknown ABI")
end function

function callback(abi,host)
  return function(vm,base) => dispatch(abi,host,vm,base)
end function
