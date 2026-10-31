// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Memory-safe portable owner for vm_x86.c, vm_ppc.c and vm_ppc_new.c.
//
// The original backends emit host instructions into writable executable
// memory. MiniLang deliberately keeps W^X and executes the already decoded
// instruction plan through the exact QVM engine. VM_Compile still performs
// complete decode/validation and creates the instruction-pointer table;
// VM_CallCompiled preserves the compiled ABI without architecture-specific
// executable-memory allocation.
package mq3.vm.jit_compat

import mq3.compat.numeric as n
import mq3.vm.interpreter as interpreter

struct Compiled machine architecture instructionPointers codeLength tableLength nativeCode end struct

function x86Symbols() return ["AsmCall","Constant1","Constant4","Emit1","Emit2","Emit4","EmitAddEDI4","EmitCommand","EmitMovEAXEDI","EmitMovEBXEDI","EmitString","Hex","VM_CallCompiled","VM_Compile","callAsmCall"] end function
function ppcSymbols() return ["AsmCall","Constant1","Constant4","Emit4","Inst","Inst4","InstImm","InstImmU","VM_CallCompiled","VM_Compile","fltop","fltopandsecond","ltop","ltopandsecond"] end function
function ppcNewSymbols() return ["AsmCall","Constant1","Constant4","Emit4","Inst","Inst4","InstImm","InstImmU","VM_CallCompiled","VM_Compile","fltop","fltopandsecond","loadOpStack","ltop","ltopandsecond","makeFloat","makeInteger","spillOpStack"] end function

function appendBytes(left,right)
  output=bytes(len(left)+len(right),0)
  if len(left)>0 then copyBytes(output,0,left,0,len(left)) end if
  if len(right)>0 then copyBytes(output,len(left),right,0,len(right)) end if
  return output
end function
function Emit1(output,value) return appendBytes(output,bytes([value&255])) end function
function Emit2(output,value) result=Emit1(output,value);return Emit1(result,value>>8) end function
function Emit4(output,value) result=Emit2(output,value);return Emit2(result,value>>16) end function
function EmitString(output,text)
  raw=bytes(text);index=0;result=output
  while index<len(raw)
    while index<len(raw) and raw[index]<=32 index=index+1 end while
    if index>=len(raw) then break end if
    if index+1>=len(raw) then return error(7975,"JIT hex string has an odd digit") end if
    result=Emit1(result,(Hex(raw[index])<<4)|Hex(raw[index+1]));index=index+2
  end while
  return result
end function
function Hex(letter)
  if letter>=48 and letter<=57 then return letter-48 end if
  if letter>=65 and letter<=70 then return letter-55 end if
  if letter>=97 and letter<=102 then return letter-87 end if
  return error(7975,"JIT hex digit is invalid")
end function

function Constant1(machine,instruction)
  if machine==void or instruction<0 or instruction>=len(machine.addresses) then return error(7975,"JIT instruction is invalid") end if
  at=machine.addresses[instruction]+1
  if at>=len(machine.code) then return error(7975,"JIT constant is outside code") end if
  return machine.code[at]&255
end function
function Constant4(machine,instruction)
  if machine==void or instruction<0 or instruction>=len(machine.addresses) then return error(7975,"JIT instruction is invalid") end if
  at=machine.addresses[instruction]+1
  if at>=len(machine.code) then return error(7975,"JIT constant is outside code") end if
  return n.i32(machine.code[at])
end function

// Original x86 peephole entry points. These produce their exact byte forms.
function EmitMovEAXEDI(output) return EmitString(output,"89 07") end function
function EmitMovEBXEDI(output) return EmitString(output,"89 1F") end function
function EmitAddEDI4(output) return EmitString(output,"83 C7 04") end function
function EmitCommand(output,command)
  if command==1 then return EmitMovEAXEDI(output) end if
  if command==2 then return EmitMovEBXEDI(output) end if
  if command==3 then return EmitAddEDI4(output) end if
  return error(7975,"JIT command is invalid")
end function

// PowerPC instruction constructors preserve the original bit layouts.
function Inst(opcode,destReg,aReg,bReg) return n.i32(opcode|(destReg<<21)|(aReg<<16)|(bReg<<11)) end function
function Inst4(opcode,destReg,aReg,bReg,flags) return n.i32(Inst(opcode,destReg,aReg,bReg)|flags) end function
function InstImm(opcode,destReg,aReg,immediate) return n.i32(opcode|(destReg<<21)|(aReg<<16)|(immediate&65535)) end function
function InstImmU(opcode,destReg,aReg,immediate) return InstImm(opcode,destReg,aReg,immediate) end function
function ltop(value) return value end function
function ltopandsecond(top,second) return [top,second] end function
function fltop(value) return n.bitsFloat(value) end function
function fltopandsecond(top,second) return [n.bitsFloat(top),n.bitsFloat(second)] end function
function loadOpStack(values) return values end function
function spillOpStack(values) return values end function
function makeFloat(value) return n.bitsFloat(value) end function
function makeInteger(value) return n.i32(value) end function

function VM_Compile(image,callback,architecture)
  if architecture!="x86" and architecture!="ppc" and architecture!="ppc_new" and architecture!="portable" then return error(7975,"unsupported JIT architecture") end if
  machine=interpreter.load(image,callback)
  pointers=[]
  for each address in machine.addresses pointers=pointers+[address] end for
  return Compiled(machine,architecture,pointers,len(machine.code),len(pointers)*4,false)
end function
function VM_CallCompiled(compiled,args)
  if compiled==void or compiled.machine==void then return error(7975,"compiled QVM is missing") end if
  return interpreter.call(compiled.machine,args)
end function
function callAsmCall(compiled,args) return VM_CallCompiled(compiled,args) end function
function AsmCall(compiled,args) return VM_CallCompiled(compiled,args) end function
