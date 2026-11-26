// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Typed CG_PC_* host bridge from CL_CgameSystemCalls.
package mq3.vm.cgame_pc_traps

import mq3.vm.syscall_common as common
import mq3.vm.pc_parser as pcParser
import mq3.botlib.l_precomp as lPrecomp
import mq3.compat.numeric as n

const CG_PC_ADD_GLOBAL_DEFINE=64
const CG_PC_LOAD_SOURCE=65
const CG_PC_FREE_SOURCE=66
const CG_PC_READ_TOKEN=67
const CG_PC_SOURCE_FILE_AND_LINE=68
const TOKEN_SIZE=1040
const SOURCE_NAME_SIZE=64

/// Services record for vm.cgame_pc_traps, containing `context`, `addDefineFn`, `loadSourceFn`, `freeSourceFn`, `readTokenFn`, `sourceLineFn`.
struct Services context addDefineFn loadSourceFn freeSourceFn readTokenFn sourceLineFn end struct
/// TokenResult record for vm.cgame_pc_traps, containing `found`, `data`.
struct TokenResult found data end struct
/// SourceLocation record for vm.cgame_pc_traps, containing `found`, `name`, `line`.
struct SourceLocation found name line end struct

/// Create `mq3.vm.cgame_pc_traps.Services` with context=context; addDefineFn=void; loadSourceFn=void; freeSourceFn=void; readTokenFn=void; sourceLineFn=void.
/// @param context Initial `context` field stored in the returned or constructed `mq3.vm.cgame_pc_traps.Services` record.
function services(context) return Services(context,void,void,void,void,void) end function
/// Compute registry services in vm.cgame_pc_traps; the normal completion returns `host`.
/// @param registry Context passed as `context` to `mq3.vm.cgame_pc_traps.services`.
function registryServices(registry)
  host=services(registry);host.addDefineFn=pcParser.addDefine;host.loadSourceFn=pcParser.load
  host.freeSourceFn=pcParser.free;host.readTokenFn=readRegistryToken;host.sourceLineFn=registryLocation
  return host
end function
// Full botlib l_precomp.c ownership adapter. This keeps the existing QVM ABI
// while sharing the same pc_parser registry used by game/cgame/UI hosts.
/// @param runtime Runtime passed as `runtime` to `mq3.botlib.l_precomp.PC_ReadTokenHandle`.
/// @param handle Handle passed as `handle` to `mq3.botlib.l_precomp.PC_ReadTokenHandle`.
function readPrecompToken(runtime,handle)
  token=lPrecomp.PC_ReadTokenHandle(runtime,handle);if token is error then return token end if
  if token==void then return TokenResult(false,void) end if;return TokenResult(true,pcParser.encode(token))
end function
/// Compute precomp location in vm.cgame_pc_traps; the normal completion returns `SourceLocation(true, value[0], value[1])`.
/// @param runtime Runtime passed as `runtime` to `mq3.botlib.l_precomp.PC_SourceFileAndLine`.
/// @param handle Handle passed as `handle` to `mq3.botlib.l_precomp.PC_SourceFileAndLine`.
function precompLocation(runtime,handle)
  value=lPrecomp.PC_SourceFileAndLine(runtime,handle);if value==void then return SourceLocation(false,"",0) end if;return SourceLocation(true,value[0],value[1])
end function
/// Compute precomp services in vm.cgame_pc_traps; the normal completion returns `host`.
/// @param runtime Context passed as `context` to `mq3.vm.cgame_pc_traps.services`.
function precompServices(runtime)
  host=services(runtime);host.addDefineFn=lPrecomp.PC_AddGlobalDefine;host.loadSourceFn=lPrecomp.PC_LoadSourceHandle;host.freeSourceFn=lPrecomp.PC_FreeSourceHandle;host.readTokenFn=readPrecompToken;host.sourceLineFn=precompLocation;return host
end function
/// Create the vm.cgame_pc_traps error for `fail` with 7490 and the supplied diagnostic text.
/// @param message Message used in `("cgame PC traps: " + message)` and `error(7490, ("cgame PC traps: " + message))`.
function fail(message) return error(7490,"cgame PC traps: "+message) end function
/// Return `mq3.vm.cgame_pc_traps.fail((name + " service unavailable"))` from `vm.cgame_pc_traps.unavailable`.
/// @param name Name used in `(name + " service unavailable")` and `fail((name + " service unavailable"))`.
function unavailable(name) return fail(name+" service unavailable") end function
/// Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.cgame_pc_traps.arg`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param index Index passed as `index` to `mq3.vm.syscall_common.argument`.
function arg(vm,base,index) return common.argument(vm,base,index) end function

/// Read registry token in vm.cgame_pc_traps; the normal completion returns `TokenResult(true, pcParser.encode(token))`.
/// @param registry Registry passed as `registry` to `mq3.vm.pc_parser.read`.
/// @param handle Source handle passed as `sourceHandle` to `mq3.vm.pc_parser.read`.
function readRegistryToken(registry,handle)
  token=pcParser.read(registry,handle);if token is error then return token end if
  if token==void then return TokenResult(false,void) end if
  return TokenResult(true,pcParser.encode(token))
end function

/// Compute registry location in vm.cgame_pc_traps; the normal completion returns `SourceLocation(true, value[0], value[1])`.
/// @param registry Registry passed as `registry` to `mq3.vm.pc_parser.location`.
/// @param handle Handle passed as `handle` to `mq3.vm.pc_parser.location`.
function registryLocation(registry,handle)
  value=pcParser.location(registry,handle);if value==void then return SourceLocation(false,"",0) end if
  return SourceLocation(true,value[0],value[1])
end function

/// Compute string call in vm.cgame_pc_traps; the normal completion returns `callback(host.context, common.readString(vm, arg(vm, base, 1)))`.
/// @param host Record exposing `context`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Base passed as `base` to `mq3.vm.cgame_pc_traps.arg`.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
/// @param name Name passed as `name` to `mq3.vm.cgame_pc_traps.unavailable`.
function stringCall(host,vm,base,callback,name)
  if callback==void then return unavailable(name) end if
  return callback(host.context,common.readString(vm,arg(vm,base,1)))
end function

/// Read token in vm.cgame_pc_traps; the normal completion returns `1`.
/// @param host Record exposing `readTokenFn`, `context`.
/// @param vm Vm passed as `vm` to `mq3.vm.cgame_pc_traps.arg`.
/// @param base Base passed as `base` to `mq3.vm.cgame_pc_traps.arg`.
function readToken(host,vm,base)
  if host.readTokenFn==void then return unavailable("read token") end if
  result=host.readTokenFn(host.context,arg(vm,base,1));if result is error then return result end if
  if result==void or not result.found then return 0 end if
  if typeof(result.data)!="bytes" or len(result.data)!=TOKEN_SIZE then return fail("invalid pc_token_t layout") end if
  written=common.writeRaw(vm,arg(vm,base,2),result.data,TOKEN_SIZE,"pc_token_t output");if written is error then return written end if
  return 1
end function

/// Compute source line in vm.cgame_pc_traps; the normal completion returns `1`.
/// @param host Record exposing `sourceLineFn`, `context`.
/// @param vm Record exposing `data`.
/// @param base Base passed as `base` to `mq3.vm.cgame_pc_traps.arg`.
function sourceLine(host,vm,base)
  if host.sourceLineFn==void then return unavailable("source file and line") end if
  result=host.sourceLineFn(host.context,arg(vm,base,1));if result is error then return result end if
  if result==void or not result.found then return 0 end if
  written=common.writeBuffer(vm,arg(vm,base,2),SOURCE_NAME_SIZE,result.name,"parser source filename");if written is error then return written end if
  lineAt=common.pointer(vm,arg(vm,base,3),4,"parser source line");if lineAt is error then return lineAt end if
  n.writeU32(vm.data,lineAt,result.line);return 1
end function

/// Dispatch cgame pc traps in vm.cgame_pc_traps; the normal completion returns `fail(("unsupported trap " + str(op)))`.
/// @param host Record exposing `addDefineFn`, `loadSourceFn`, `freeSourceFn`, `context`.
/// @param vm Record exposing `data`.
/// @param base Base passed as `base` to `mq3.vm.cgame_pc_traps.arg`.
function dispatch(host,vm,base)
  if host==void or vm==void or typeof(vm.data)!="bytes" then return fail("invalid dispatcher context") end if
  op=arg(vm,base,0)
  switch op
    case CG_PC_ADD_GLOBAL_DEFINE return stringCall(host,vm,base,host.addDefineFn,"add global define") end case
    case CG_PC_LOAD_SOURCE return stringCall(host,vm,base,host.loadSourceFn,"load source") end case
    case CG_PC_FREE_SOURCE if host.freeSourceFn==void then return unavailable("free source") end if;return host.freeSourceFn(host.context,arg(vm,base,1)) end case
    case CG_PC_READ_TOKEN return readToken(host,vm,base) end case
    case CG_PC_SOURCE_FILE_AND_LINE return sourceLine(host,vm,base) end case
  end switch
  return fail("unsupported trap "+str(op))
end function

/// Apply `mq3.vm.cgame_pc_traps.dispatch` for callback in vm.cgame_pc_traps.
/// @param host Host passed as `host` to `mq3.vm.cgame_pc_traps.dispatch`.
function callback(host) return function(vm,base) => dispatch(host,vm,base) end function
