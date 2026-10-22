// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Adapter from native g_syscalls wrappers to the existing QVM/server dispatcher.
package mq3.game.syscall_qagame_host

import mq3.game.syscalls as traps
import mq3.vm.syscall_qagame as qagame
import mq3.compat.numeric as n

struct Context services vm base end struct

function context(services,vm,base)
  if services==void or vm==void or typeof(vm.data)!="bytes" then return error(7861,"qagame syscall host requires services and VM memory") end if
  if base<0 or base>len(vm.data) then return error(7861,"qagame syscall argument base outside VM memory") end if
  return Context(services,vm,base)
end function

function invoke(value,opcode,arguments)
  if value==void or value.vm==void then return error(7861,"qagame syscall host context is missing") end if
  size=(len(arguments)+1)*4;if value.base<0 or size>len(value.vm.data)-value.base then return error(7861,"qagame syscall argument vector outside VM memory") end if
  n.writeU32(value.vm.data,value.base,opcode)
  if len(arguments)>0 then for index=0 to len(arguments)-1
    argument=arguments[index]
    written=try(n.writeU32(value.vm.data,value.base+(index+1)*4,argument));if written is error then return error(7861,"qagame QVM host requires integer or VM-address ABI arguments") end if
  end for end if
  return qagame.dispatch(value.services,value.vm,value.base)
end function

function bind(services,vm,base)
  value=context(services,vm,base);if value is error then return value end if
  return traps.dllEntry(invoke,value)
end function
