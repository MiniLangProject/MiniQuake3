// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Typed CG_PC_* host bridge from CL_CgameSystemCalls.
package mq3.vm.cgame_pc_traps

import mq3.vm.syscall_common as common
import mq3.vm.pc_parser as pcParser
import mq3.compat.numeric as n

const CG_PC_ADD_GLOBAL_DEFINE=64
const CG_PC_LOAD_SOURCE=65
const CG_PC_FREE_SOURCE=66
const CG_PC_READ_TOKEN=67
const CG_PC_SOURCE_FILE_AND_LINE=68
const TOKEN_SIZE=1040
const SOURCE_NAME_SIZE=64

struct Services context addDefineFn loadSourceFn freeSourceFn readTokenFn sourceLineFn end struct
struct TokenResult found data end struct
struct SourceLocation found name line end struct

function services(context) return Services(context,void,void,void,void,void) end function
function registryServices(registry)
  host=services(registry);host.addDefineFn=pcParser.addDefine;host.loadSourceFn=pcParser.load
  host.freeSourceFn=pcParser.free;host.readTokenFn=readRegistryToken;host.sourceLineFn=registryLocation
  return host
end function
function fail(message) return error(7490,"cgame PC traps: "+message) end function
function unavailable(name) return fail(name+" service unavailable") end function
function arg(vm,base,index) return common.argument(vm,base,index) end function

function readRegistryToken(registry,handle)
  token=pcParser.read(registry,handle);if token is error then return token end if
  if token==void then return TokenResult(false,void) end if
  return TokenResult(true,pcParser.encode(token))
end function

function registryLocation(registry,handle)
  value=pcParser.location(registry,handle);if value==void then return SourceLocation(false,"",0) end if
  return SourceLocation(true,value[0],value[1])
end function

function stringCall(host,vm,base,callback,name)
  if callback==void then return unavailable(name) end if
  return callback(host.context,common.readString(vm,arg(vm,base,1)))
end function

function readToken(host,vm,base)
  if host.readTokenFn==void then return unavailable("read token") end if
  result=host.readTokenFn(host.context,arg(vm,base,1));if result is error then return result end if
  if result==void or not result.found then return 0 end if
  if typeof(result.data)!="bytes" or len(result.data)!=TOKEN_SIZE then return fail("invalid pc_token_t layout") end if
  written=common.writeRaw(vm,arg(vm,base,2),result.data,TOKEN_SIZE,"pc_token_t output");if written is error then return written end if
  return 1
end function

function sourceLine(host,vm,base)
  if host.sourceLineFn==void then return unavailable("source file and line") end if
  result=host.sourceLineFn(host.context,arg(vm,base,1));if result is error then return result end if
  if result==void or not result.found then return 0 end if
  written=common.writeBuffer(vm,arg(vm,base,2),SOURCE_NAME_SIZE,result.name,"parser source filename");if written is error then return written end if
  lineAt=common.pointer(vm,arg(vm,base,3),4,"parser source line");if lineAt is error then return lineAt end if
  n.writeU32(vm.data,lineAt,result.line);return 1
end function

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

function callback(host) return function(vm,base) => dispatch(host,vm,base) end function
