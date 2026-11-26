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

/// Compiled record for vm.jit_compat, containing `machine`, `architecture`, `instructionPointers`, `codeLength`, `tableLength`, `nativeCode`.
struct Compiled
  /// Interpreter/VM instance associated with the prepared compilation plan.
  machine
  /// Architecture identifier associated with the native VM execution plan.
  architecture
  /// QVM code-byte offsets indexed by instruction number, retained by the compatibility dispatch plan.
  instructionPointers
  /// Length of the VM code region in bytes.
  codeLength
  /// Byte length of the prepared instruction-address table, calculated as four bytes per entry.
  tableLength
  /// True only when native machine code has been emitted; false for this compatibility plan, which
  /// executes through the fast interpreter.
  nativeCode
end struct

/// List the 15 names in vm.jit_compat.x86Symbols, beginning with `AsmCall`, `Constant1`, `Constant4`, `Emit1`.
function x86Symbols() return ["AsmCall","Constant1","Constant4","Emit1","Emit2","Emit4","EmitAddEDI4","EmitCommand","EmitMovEAXEDI","EmitMovEBXEDI","EmitString","Hex","VM_CallCompiled","VM_Compile","callAsmCall"] end function
/// List the 14 names in vm.jit_compat.ppcSymbols, beginning with `AsmCall`, `Constant1`, `Constant4`, `Emit4`.
function ppcSymbols() return ["AsmCall","Constant1","Constant4","Emit4","Inst","Inst4","InstImm","InstImmU","VM_CallCompiled","VM_Compile","fltop","fltopandsecond","ltop","ltopandsecond"] end function
/// List the 18 names in vm.jit_compat.ppcNewSymbols, beginning with `AsmCall`, `Constant1`, `Constant4`, `Emit4`.
function ppcNewSymbols() return ["AsmCall","Constant1","Constant4","Emit4","Inst","Inst4","InstImm","InstImmU","VM_CallCompiled","VM_Compile","fltop","fltopandsecond","loadOpStack","ltop","ltopandsecond","makeFloat","makeInteger","spillOpStack"] end function

/// Append bytes in vm.jit_compat; the normal completion returns `output`.
/// @param left Left used in `len(left)` and `(len(left) > 0)`.
/// @param right Right used in `len(right)` and `(len(right) > 0)`.
function appendBytes(left,right)
  output=bytes(len(left)+len(right),0)
  if len(left)>0 then copyBytes(output,0,left,0,len(left)) end if
  if len(right)>0 then copyBytes(output,len(left),right,0,len(right)) end if
  return output
end function
/// Return `mq3.vm.jit_compat.appendBytes(output, bytes([(value & 255)]))` from `vm.jit_compat.Emit1`.
/// @param output Left passed as `left` to `mq3.vm.jit_compat.appendBytes`.
/// @param value Value used in `(value & 255)` and `bytes([(value & 255)])`.
function Emit1(output,value) return appendBytes(output,bytes([value&255])) end function
/// Emit 2 in vm.jit_compat; the normal completion returns `Emit1(result, (value >> 8))`.
/// @param output Output passed as `output` to `mq3.vm.jit_compat.Emit1`.
/// @param value Value passed as `value` to `mq3.vm.jit_compat.Emit1`.
function Emit2(output,value) result=Emit1(output,value);return Emit1(result,value>>8) end function
/// Emit 4 in vm.jit_compat; the normal completion returns `Emit2(result, (value >> 16))`.
/// @param output Output passed as `output` to `mq3.vm.jit_compat.Emit2`.
/// @param value Value passed as `value` to `mq3.vm.jit_compat.Emit2`.
function Emit4(output,value) result=Emit2(output,value);return Emit2(result,value>>16) end function
/// Emit string in vm.jit_compat; the normal completion returns `result`.
///
/// Validation failures include `JIT hex string has an odd digit`.
/// @param output Output operand used by `EmitString`; its reads are shown in the implementation.
/// @param text Text used in `bytes(text)`.
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
/// Compute hex in vm.jit_compat; the normal completion returns `error(7975, "JIT hex digit is invalid")`.
///
/// Validation failures include `JIT hex digit is invalid`.
/// @param letter Letter used in `(letter - 48)` and `(letter - 55)`.
function Hex(letter)
  if letter>=48 and letter<=57 then return letter-48 end if
  if letter>=65 and letter<=70 then return letter-55 end if
  if letter>=97 and letter<=102 then return letter-87 end if
  return error(7975,"JIT hex digit is invalid")
end function

/// Compute constant 1 in vm.jit_compat; the normal completion returns `(machine.code[at] & 255)`.
///
/// Validation failures include `JIT instruction is invalid`; `JIT constant is outside code`.
/// @param machine Record exposing `addresses`, `code`.
/// @param instruction Zero-based index into `machine.addresses`.
function Constant1(machine,instruction)
  if machine==void or instruction<0 or instruction>=len(machine.addresses) then return error(7975,"JIT instruction is invalid") end if
  at=machine.addresses[instruction]+1
  if at>=len(machine.code) then return error(7975,"JIT constant is outside code") end if
  return machine.code[at]&255
end function
/// Compute constant 4 in vm.jit_compat; the normal completion returns `n.i32(machine.code[at])`.
///
/// Validation failures include `JIT instruction is invalid`; `JIT constant is outside code`.
/// @param machine Record exposing `addresses`, `code`.
/// @param instruction Zero-based index into `machine.addresses`.
function Constant4(machine,instruction)
  if machine==void or instruction<0 or instruction>=len(machine.addresses) then return error(7975,"JIT instruction is invalid") end if
  at=machine.addresses[instruction]+1
  if at>=len(machine.code) then return error(7975,"JIT constant is outside code") end if
  return n.i32(machine.code[at])
end function

// Original x86 peephole entry points. These produce their exact byte forms.
/// @param output Output passed as `output` to `mq3.vm.jit_compat.EmitString`.
function EmitMovEAXEDI(output) return EmitString(output,"89 07") end function
/// Return `mq3.vm.jit_compat.EmitString(output, "89 1F")` from `vm.jit_compat.EmitMovEBXEDI`.
/// @param output Output passed as `output` to `mq3.vm.jit_compat.EmitString`.
function EmitMovEBXEDI(output) return EmitString(output,"89 1F") end function
/// Return `mq3.vm.jit_compat.EmitString(output, "83 C7 04")` from `vm.jit_compat.EmitAddEDI4`.
/// @param output Output passed as `output` to `mq3.vm.jit_compat.EmitString`.
function EmitAddEDI4(output) return EmitString(output,"83 C7 04") end function
/// Emit command in vm.jit_compat; the normal completion returns `error(7975, "JIT command is invalid")`.
///
/// Validation failures include `JIT command is invalid`.
/// @param output Output passed as `output` to `mq3.vm.jit_compat.EmitMovEAXEDI`.
/// @param command Command used in `(command == 1)` and `(command == 2)`.
function EmitCommand(output,command)
  if command==1 then return EmitMovEAXEDI(output) end if
  if command==2 then return EmitMovEBXEDI(output) end if
  if command==3 then return EmitAddEDI4(output) end if
  return error(7975,"JIT command is invalid")
end function

// PowerPC instruction constructors preserve the original bit layouts.
/// @param opcode Opcode used in `(opcode | (destReg << 21))` and `((opcode | (destReg << 21)) | (aReg << 16))`.
/// @param destReg Dest reg used in `(destReg << 21)` and `(opcode | (destReg << 21))`.
/// @param aReg A reg used in `(aReg << 16)` and `((opcode | (destReg << 21)) | (aReg << 16))`.
/// @param bReg B reg used in `(bReg << 11)` and `(((opcode | (destReg << 21)) | (aReg << 16)) | (bReg << 11))`.
function Inst(opcode,destReg,aReg,bReg) return n.i32(opcode|(destReg<<21)|(aReg<<16)|(bReg<<11)) end function
/// Return `mq3.compat.numeric.i32((Inst(opcode, destReg, aReg, bReg) | flags))` from `vm.jit_compat.Inst4`.
/// @param opcode Opcode passed as `opcode` to `mq3.vm.jit_compat.Inst`.
/// @param destReg Dest reg passed as `destReg` to `mq3.vm.jit_compat.Inst`.
/// @param aReg A reg passed as `aReg` to `mq3.vm.jit_compat.Inst`.
/// @param bReg B reg passed as `bReg` to `mq3.vm.jit_compat.Inst`.
/// @param flags Flags used in `(Inst(opcode, destReg, aReg, bReg) | flags)` and `n.i32((Inst(opcode, destReg, aReg, bReg) | flags))`.
function Inst4(opcode,destReg,aReg,bReg,flags) return n.i32(Inst(opcode,destReg,aReg,bReg)|flags) end function
/// Return `mq3.compat.numeric.i32((((opcode | (destReg << 21)) | (aReg << 16)) | (immediate & 65535)))` from `vm.jit_compat.InstImm`.
/// @param opcode Opcode used in `(opcode | (destReg << 21))` and `((opcode | (destReg << 21)) | (aReg << 16))`.
/// @param destReg Dest reg used in `(destReg << 21)` and `(opcode | (destReg << 21))`.
/// @param aReg A reg used in `(aReg << 16)` and `((opcode | (destReg << 21)) | (aReg << 16))`.
/// @param immediate Immediate used in `(immediate & 65535)` and `(((opcode | (destReg << 21)) | (aReg << 16)) | (immediate & 65535))`.
function InstImm(opcode,destReg,aReg,immediate) return n.i32(opcode|(destReg<<21)|(aReg<<16)|(immediate&65535)) end function
/// Return `mq3.vm.jit_compat.InstImm(opcode, destReg, aReg, immediate)` from `vm.jit_compat.InstImmU`.
/// @param opcode Opcode passed as `opcode` to `mq3.vm.jit_compat.InstImm`.
/// @param destReg Dest reg passed as `destReg` to `mq3.vm.jit_compat.InstImm`.
/// @param aReg A reg passed as `aReg` to `mq3.vm.jit_compat.InstImm`.
/// @param immediate Immediate passed as `immediate` to `mq3.vm.jit_compat.InstImm`.
function InstImmU(opcode,destReg,aReg,immediate) return InstImm(opcode,destReg,aReg,immediate) end function
/// Compute vm.jit_compat.ltop as `value`.
/// @param value Value returned unchanged by this function.
function ltop(value) return value end function
/// Compute vm.jit_compat.ltopandsecond as `[top, second]`.
/// @param top Top operand used by `ltopandsecond`; its reads are shown in the implementation.
/// @param second Second operand used by `ltopandsecond`; its reads are shown in the implementation.
function ltopandsecond(top,second) return [top,second] end function
/// Return `mq3.compat.numeric.bitsFloat(value)` from `vm.jit_compat.fltop`.
/// @param value Low 32 bits containing an IEEE-754 binary32 encoding.
function fltop(value) return n.bitsFloat(value) end function
/// Compute vm.jit_compat.fltopandsecond as `[n.bitsFloat(top), n.bitsFloat(second)]`.
/// @param top Low 32 bits containing an IEEE-754 binary32 encoding.
/// @param second Low 32 bits containing an IEEE-754 binary32 encoding.
function fltopandsecond(top,second) return [n.bitsFloat(top),n.bitsFloat(second)] end function
/// Compute vm.jit_compat.loadOpStack as `values`.
/// @param values Value returned unchanged by this function.
function loadOpStack(values) return values end function
/// Compute vm.jit_compat.spillOpStack as `values`.
/// @param values Value returned unchanged by this function.
function spillOpStack(values) return values end function
/// Return `mq3.compat.numeric.bitsFloat(value)` from `vm.jit_compat.makeFloat`.
/// @param value Low 32 bits containing an IEEE-754 binary32 encoding.
function makeFloat(value) return n.bitsFloat(value) end function
/// Return `mq3.compat.numeric.i32(value)` from `vm.jit_compat.makeInteger`.
/// @param value Integer whose low 32 bits are retained.
function makeInteger(value) return n.i32(value) end function

/// Compute compile in vm.jit_compat; the normal completion returns `Compiled(machine, architecture, pointers, len(machine.code), (len(pointers) * 4), false)`.
///
/// Validation failures include `unsupported JIT architecture`.
/// @param image Image passed as `image` to `mq3.vm.interpreter.load`.
/// @param callback Callback passed as `callback` to `mq3.vm.interpreter.load`.
/// @param architecture Initial `architecture` field stored in the returned or constructed `mq3.vm.jit_compat.Compiled` record.
function VM_Compile(image,callback,architecture)
  if architecture!="x86" and architecture!="ppc" and architecture!="ppc_new" and architecture!="portable" then return error(7975,"unsupported JIT architecture") end if
  machine=interpreter.load(image,callback)
  pointers=array(len(machine.addresses),0)
  if len(pointers)>0 then copyArray(pointers,0,machine.addresses,0,len(pointers)) end if
  return Compiled(machine,architecture,pointers,len(machine.code),len(pointers)*4,false)
end function
/// Compute call compiled in vm.jit_compat; the normal completion returns `interpreter.callFast(compiled.machine, args)`.
///
/// Validation failures include `compiled QVM is missing`.
/// @param compiled Record exposing `machine`.
/// @param args Args passed as `args` to `mq3.vm.interpreter.callFast`.
function VM_CallCompiled(compiled,args)
  if compiled==void or compiled.machine==void then return error(7975,"compiled QVM is missing") end if
  return interpreter.callFast(compiled.machine,args)
end function
/// Return `mq3.vm.jit_compat.VM_CallCompiled(compiled, args)` from `vm.jit_compat.callAsmCall`.
/// @param compiled Compiled passed as `compiled` to `mq3.vm.jit_compat.VM_CallCompiled`.
/// @param args Args passed as `args` to `mq3.vm.jit_compat.VM_CallCompiled`.
function callAsmCall(compiled,args) return VM_CallCompiled(compiled,args) end function
/// Return `mq3.vm.jit_compat.VM_CallCompiled(compiled, args)` from `vm.jit_compat.AsmCall`.
/// @param compiled Compiled passed as `compiled` to `mq3.vm.jit_compat.VM_CallCompiled`.
/// @param args Args passed as `args` to `mq3.vm.jit_compat.VM_CallCompiled`.
function AsmCall(compiled,args) return VM_CallCompiled(compiled,args) end function
