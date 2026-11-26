// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native managed representation of qcommon/vm_local.h.
package mq3.vm.abi

/// Byte offset of programStack in the legacy VM assembly ABI.
const VM_OFFSET_PROGRAM_STACK=0
/// Byte offset of the systemCall entry in the legacy VM assembly ABI.
const VM_OFFSET_SYSTEM_CALL=4

/// QVM bytecode opcode for an invalid-instruction trap.
const OP_UNDEF=0
/// QVM bytecode opcode for a no-operation instruction.
const OP_IGNORE=1
/// QVM bytecode opcode for a debug break.
const OP_BREAK=2
/// QVM bytecode opcode for function entry and stack-frame allocation.
const OP_ENTER=3
/// QVM bytecode opcode for function return and stack-frame release.
const OP_LEAVE=4
/// QVM bytecode opcode for a VM function call or host syscall.
const OP_CALL=5
/// QVM bytecode opcode for allocating an operand-stack slot.
const OP_PUSH=6
/// QVM bytecode opcode for removing an operand-stack value.
const OP_POP=7
/// QVM bytecode opcode for pushing an immediate 32-bit constant.
const OP_CONST=8
/// QVM bytecode opcode for pushing an address relative to the current program-stack frame.
const OP_LOCAL=9
/// QVM bytecode opcode for an unconditional jump to an operand-stack destination.
const OP_JUMP=10
/// QVM conditional branch comparing signed-integer operands for equal.
const OP_EQ=11
/// QVM conditional branch comparing signed-integer operands for not equal.
const OP_NE=12
/// QVM conditional branch comparing signed-integer operands for less than.
const OP_LTI=13
/// QVM conditional branch comparing signed-integer operands for less than or equal.
const OP_LEI=14
/// QVM conditional branch comparing signed-integer operands for greater than.
const OP_GTI=15
/// QVM conditional branch comparing signed-integer operands for greater than or equal.
const OP_GEI=16
/// QVM conditional branch comparing unsigned-integer operands for less than.
const OP_LTU=17
/// QVM conditional branch comparing unsigned-integer operands for less than or equal.
const OP_LEU=18
/// QVM conditional branch comparing unsigned-integer operands for greater than.
const OP_GTU=19
/// QVM conditional branch comparing unsigned-integer operands for greater than or equal.
const OP_GEU=20
/// QVM conditional branch comparing floating-point operands for equal.
const OP_EQF=21
/// QVM conditional branch comparing floating-point operands for not equal.
const OP_NEF=22
/// QVM conditional branch comparing floating-point operands for less than.
const OP_LTF=23
/// QVM conditional branch comparing floating-point operands for less than or equal.
const OP_LEF=24
/// QVM conditional branch comparing floating-point operands for greater than.
const OP_GTF=25
/// QVM conditional branch comparing floating-point operands for greater than or equal.
const OP_GEF=26
/// QVM opcode for loading 1 byte(s) in VM memory.
const OP_LOAD1=27
/// QVM opcode for loading 2 byte(s) in VM memory.
const OP_LOAD2=28
/// QVM opcode for loading 4 byte(s) in VM memory.
const OP_LOAD4=29
/// QVM opcode for storing 1 byte(s) in VM memory.
const OP_STORE1=30
/// QVM opcode for storing 2 byte(s) in VM memory.
const OP_STORE2=31
/// QVM opcode for storing 4 byte(s) in VM memory.
const OP_STORE4=32
/// QVM bytecode opcode for storing a call argument in the program-stack frame.
const OP_ARG=33
/// QVM bytecode opcode for copying a fixed-size block of VM memory.
const OP_BLOCK_COPY=34
/// QVM bytecode opcode for sign-extending an 8-bit value.
const OP_SEX8=35
/// QVM bytecode opcode for sign-extending a 16-bit value.
const OP_SEX16=36
/// QVM bytecode opcode for signed-integer negation.
const OP_NEGI=37
/// QVM bytecode opcode for 32-bit integer addition.
const OP_ADD=38
/// QVM bytecode opcode for 32-bit integer subtraction.
const OP_SUB=39
/// QVM bytecode opcode for signed-integer division.
const OP_DIVI=40
/// QVM bytecode opcode for unsigned-integer division.
const OP_DIVU=41
/// QVM bytecode opcode for signed-integer remainder.
const OP_MODI=42
/// QVM bytecode opcode for unsigned-integer remainder.
const OP_MODU=43
/// QVM bytecode opcode for signed-integer multiplication.
const OP_MULI=44
/// QVM bytecode opcode for unsigned-integer multiplication.
const OP_MULU=45
/// QVM bytecode opcode for bitwise AND.
const OP_BAND=46
/// QVM bytecode opcode for bitwise OR.
const OP_BOR=47
/// QVM bytecode opcode for bitwise exclusive OR.
const OP_BXOR=48
/// QVM bytecode opcode for bitwise complement.
const OP_BCOM=49
/// QVM bytecode opcode for left bit shift.
const OP_LSH=50
/// QVM bytecode opcode for arithmetic signed right shift.
const OP_RSHI=51
/// QVM bytecode opcode for logical unsigned right shift.
const OP_RSHU=52
/// QVM bytecode opcode for floating-point negation.
const OP_NEGF=53
/// QVM bytecode opcode for floating-point addition.
const OP_ADDF=54
/// QVM bytecode opcode for floating-point subtraction.
const OP_SUBF=55
/// QVM bytecode opcode for floating-point division.
const OP_DIVF=56
/// QVM bytecode opcode for floating-point multiplication.
const OP_MULF=57
/// QVM bytecode opcode for conversion from signed integer to float.
const OP_CVIF=58
/// QVM bytecode opcode for conversion from float to signed integer.
const OP_CVFI=59
/// Number of defined QVM opcode values; not an executable instruction.
const OP_COUNT=60

/// VmSymbol record for vm.abi, containing `next`, `symValue`, `profileCount`, `symName`.
struct VmSymbol
  /// Next entry in the linked VM symbol list.
  next
  /// Numeric address/value associated with the VM debug symbol.
  symValue
  /// Execution/profile counter associated with this VM symbol.
  profileCount
  /// Name associated with the VM debug symbol.
  symName
end struct

// vm_s is pointer-heavy in C. The port keeps equivalent ownership and state
// fields as managed values while retaining the two assembler-visible offsets.
struct VmState
  /// Byte offset of the current stack frame in QVM data memory.
  programStack
  /// Host callback that services system calls made by the VM.
  systemCall
  /// Name of the VM instance represented by this native ABI record.
  name
  /// Handle for the loaded native game-module library, when native execution is active.
  dllHandle
  /// Callable entry point used to dispatch commands to the native game module.
  entryPoint
  /// Nonzero while execution is inside the bytecode interpreter.
  currentlyInterpreting
  /// Nonzero when this VM has a prepared compiled execution path.
  compiled
  /// Base storage/address of the VM instruction region.
  codeBase
  /// Length of the VM code region in bytes.
  codeLength
  /// Lookup table mapping QVM instruction numbers to execution addresses.
  instructionPointers
  /// Byte length of the allocated instruction-pointer table; the original engine reserves four bytes
  /// per QVM instruction.
  instructionPointersLength
  /// Base storage/address of the VM data region.
  dataBase
  /// Address mask applied to VM data offsets to preserve the QVM memory model.
  dataMask
  /// Lowest byte offset that the QVM program stack is allowed to reach.
  stackBottom
  /// Number of entries in the loaded VM debug-symbol table.
  numSymbols
  /// Loaded VM debug symbols used for symbolic lookup, diagnostics, and profiling.
  symbols
  /// Current nesting depth of calls into the VM.
  callLevel
  /// VM function selected as the debugging breakpoint target.
  breakFunction
  /// Counter associated with VM debug-break handling.
  breakCount
  /// Fully qualified path of the loaded native module or VM image.
  fqpath
end struct

/// Provide the opcode values lookup table in vm.abi.
function opcodeValues()
  return [OP_UNDEF,OP_IGNORE,OP_BREAK,OP_ENTER,OP_LEAVE,OP_CALL,OP_PUSH,OP_POP,OP_CONST,OP_LOCAL,OP_JUMP,OP_EQ,OP_NE,OP_LTI,OP_LEI,OP_GTI,OP_GEI,OP_LTU,OP_LEU,OP_GTU,OP_GEU,OP_EQF,OP_NEF,OP_LTF,OP_LEF,OP_GTF,OP_GEF,OP_LOAD1,OP_LOAD2,OP_LOAD4,OP_STORE1,OP_STORE2,OP_STORE4,OP_ARG,OP_BLOCK_COPY,OP_SEX8,OP_SEX16,OP_NEGI,OP_ADD,OP_SUB,OP_DIVI,OP_DIVU,OP_MODI,OP_MODU,OP_MULI,OP_MULU,OP_BAND,OP_BOR,OP_BXOR,OP_BCOM,OP_LSH,OP_RSHI,OP_RSHU,OP_NEGF,OP_ADDF,OP_SUBF,OP_DIVF,OP_MULF,OP_CVIF,OP_CVFI]
end function

/// Create `mq3.vm.abi.VmState` with programStack=0; systemCall=void; name=name; dllHandle=void; 16 further fields.
/// @param name Initial `name` field stored in the returned or constructed `mq3.vm.abi.VmState` record.
function createState(name)
  return VmState(0,void,name,void,void,false,false,void,0,[],0,void,0,0,0,[],0,0,0,"")
end function
