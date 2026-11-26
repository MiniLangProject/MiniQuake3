// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native managed representation of qcommon/vm_local.h.
package mq3.vm.abi

const VM_OFFSET_PROGRAM_STACK=0
const VM_OFFSET_SYSTEM_CALL=4

const OP_UNDEF=0
const OP_IGNORE=1
const OP_BREAK=2
const OP_ENTER=3
const OP_LEAVE=4
const OP_CALL=5
const OP_PUSH=6
const OP_POP=7
const OP_CONST=8
const OP_LOCAL=9
const OP_JUMP=10
const OP_EQ=11
const OP_NE=12
const OP_LTI=13
const OP_LEI=14
const OP_GTI=15
const OP_GEI=16
const OP_LTU=17
const OP_LEU=18
const OP_GTU=19
const OP_GEU=20
const OP_EQF=21
const OP_NEF=22
const OP_LTF=23
const OP_LEF=24
const OP_GTF=25
const OP_GEF=26
const OP_LOAD1=27
const OP_LOAD2=28
const OP_LOAD4=29
const OP_STORE1=30
const OP_STORE2=31
const OP_STORE4=32
const OP_ARG=33
const OP_BLOCK_COPY=34
const OP_SEX8=35
const OP_SEX16=36
const OP_NEGI=37
const OP_ADD=38
const OP_SUB=39
const OP_DIVI=40
const OP_DIVU=41
const OP_MODI=42
const OP_MODU=43
const OP_MULI=44
const OP_MULU=45
const OP_BAND=46
const OP_BOR=47
const OP_BXOR=48
const OP_BCOM=49
const OP_LSH=50
const OP_RSHI=51
const OP_RSHU=52
const OP_NEGF=53
const OP_ADDF=54
const OP_SUBF=55
const OP_DIVF=56
const OP_MULF=57
const OP_CVIF=58
const OP_CVFI=59
const OP_COUNT=60

/// VmSymbol record for vm.abi, containing `next`, `symValue`, `profileCount`, `symName`.
struct VmSymbol next symValue profileCount symName end struct

// vm_s is pointer-heavy in C. The port keeps equivalent ownership and state
// fields as managed values while retaining the two assembler-visible offsets.
struct VmState programStack systemCall name dllHandle entryPoint currentlyInterpreting compiled codeBase codeLength instructionPointers instructionPointersLength dataBase dataMask stackBottom numSymbols symbols callLevel breakFunction breakCount fqpath end struct

/// Provide the opcode values lookup table in vm.abi.
function opcodeValues()
  return [OP_UNDEF,OP_IGNORE,OP_BREAK,OP_ENTER,OP_LEAVE,OP_CALL,OP_PUSH,OP_POP,OP_CONST,OP_LOCAL,OP_JUMP,OP_EQ,OP_NE,OP_LTI,OP_LEI,OP_GTI,OP_GEI,OP_LTU,OP_LEU,OP_GTU,OP_GEU,OP_EQF,OP_NEF,OP_LTF,OP_LEF,OP_GTF,OP_GEF,OP_LOAD1,OP_LOAD2,OP_LOAD4,OP_STORE1,OP_STORE2,OP_STORE4,OP_ARG,OP_BLOCK_COPY,OP_SEX8,OP_SEX16,OP_NEGI,OP_ADD,OP_SUB,OP_DIVI,OP_DIVU,OP_MODI,OP_MODU,OP_MULI,OP_MULU,OP_BAND,OP_BOR,OP_BXOR,OP_BCOM,OP_LSH,OP_RSHI,OP_RSHU,OP_NEGF,OP_ADDF,OP_SUBF,OP_DIVF,OP_MULF,OP_CVIF,OP_CVFI]
end function

/// Create `mq3.vm.abi.VmState` with programStack=0; systemCall=void; name=name; dllHandle=void; 16 further fields.
/// @param name Initial `name` field stored in the returned or constructed `mq3.vm.abi.VmState` record.
function createState(name)
  return VmState(0,void,name,void,void,false,false,void,0,[],0,void,0,0,0,[],0,0,0,"")
end function
