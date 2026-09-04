// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Adaptation of qcommon/vm.c, vm_local.h and vm_interpreted.c.
package mq3.vm.interpreter
import mq3.compat.numeric as n

struct VM
  code
  addresses
  starts
  data
  mask
  programStack
  stackBottom
  syscall
  steps
  limit
  breaks
end struct

function fail(message)
  return error(3400, "QVM: " + message)
end function

function immediateSize(op)
  if op == 3 or op == 4 or op == 8 or op == 9 or (op >= 11 and op <= 26) or op == 34 then return 4 end if
  if op == 33 then return 1 end if
  return 0
end function

function load(image, callback)
  if typeof(image) != "bytes" or len(image) < 32 then return fail("truncated header") end if
  if n.readU32(image, 0) != 0x12721444 then return fail("unsupported magic") end if
  count = n.readI32(image, 4)
  codeOffset = n.readI32(image, 8)
  codeLength = n.readI32(image, 12)
  dataOffset = n.readI32(image, 16)
  dataLength = n.readI32(image, 20)
  litLength = n.readI32(image, 24)
  bssLength = n.readI32(image, 28)
  if count <= 0 or codeLength <= 0 or count > codeLength then return fail("invalid instruction count") end if
  if codeOffset < 32 or codeOffset + codeLength > len(image) then return fail("code outside file") end if
  if dataLength < 0 or litLength < 0 or bssLength < 0 or (dataLength & 3) != 0 then return fail("invalid data sizes") end if
  if dataOffset < codeOffset + codeLength or dataOffset + dataLength + litLength > len(image) then return fail("data outside file") end if
  memorySize = dataLength + litLength + bssLength
  if memorySize < 65536 or memorySize > 268435456 then return fail("invalid memory/stack size") end if
  size = 1
  while size < memorySize
    size = size << 1
  end while
  code = array(codeLength, 0)
  addresses = array(count, 0)
  starts = bytes(codeLength, 0)
  pc = 0
  for index = 0 to count - 1
    if pc >= codeLength then return fail("truncated instruction") end if
    op = image[codeOffset + pc]
    if op == 0 or op > 59 then return fail("invalid opcode") end if
    width = immediateSize(op)
    if pc + 1 + width > codeLength then return fail("truncated operand") end if
    starts[pc] = 1
    addresses[index] = pc
    code[pc] = op
    pc = pc + 1
    if width == 4 then code[pc] = n.readI32(image, codeOffset + pc) end if
    if width == 1 then code[pc] = image[codeOffset + pc] end if
    pc = pc + width
  end for
  // q3asm may append alignment padding after the declared instructions.
  for index = 0 to count - 1
    pc = addresses[index]
    op = code[pc]
    if op >= 11 and op <= 26 then
      target = code[pc + 1]
      if target < 0 or target >= count then return fail("branch outside code") end if
      code[pc + 1] = addresses[target]
    end if
    if op == 3 or op == 4 then
      frame = code[pc + 1]
      if frame < 0 or (frame & 3) != 0 then return fail("invalid stack frame") end if
    end if
  end for
  data = bytes(size, 0)
  copyBytes(data, 0, image, dataOffset, dataLength + litLength)
  return VM(code, addresses, starts, data, size - 1, size, size - 65536, callback, 0, 10000000, 0)
end function

function targetAddress(vm, target)
  if target < 0 or target >= len(vm.addresses) then return fail("jump outside code") end if
  return vm.addresses[target]
end function

function signedDivide(a, b)
  if b == 0 then return fail("integer divide by zero") end if
  if a == -2147483648 and b == -1 then return fail("signed division overflow") end if
  negative = (a < 0) != (b < 0)
  if a < 0 then a = 0 - a end if
  if b < 0 then b = 0 - b end if
  value = n.quotient(a, b)
  if negative then value = 0 - value end if
  return value
end function

function restoreStack(vm, saved)
  vm.programStack = saved
end function

function call(vm, args)
  if len(args) > 10 then return fail("vmMain accepts at most ten arguments") end if
  originalStack = vm.programStack
  defer restoreStack(vm, originalStack)
  initialSteps = vm.steps
  ps = originalStack - 48
  if ps <= vm.stackBottom then return fail("program stack exhausted") end if
  n.writeU32(vm.data, ps, -1)
  n.writeU32(vm.data, ps + 4, 0)
  for index = 0 to 9
    value = 0
    if index < len(args) then value = args[index] end if
    n.writeU32(vm.data, ps + 8 + index * 4, value)
  end for
  stack = array(256, 0)
  top = 0
  pc = 0
  while true
    vm.steps = vm.steps + 1
    if vm.steps - initialSteps > vm.limit then return fail("instruction budget exhausted") end if
    if pc < 0 or pc >= len(vm.code) or vm.starts[pc] == 0 then return fail("pc outside instructions") end if
    if ps <= vm.stackBottom or ps + 4 > len(vm.data) or (ps & 3) != 0 then return fail("program stack outside memory") end if
    op = vm.code[pc]
    pc = pc + 1
    operand = 0
    width = immediateSize(op)
    if width != 0 then operand = vm.code[pc] end if
    pc = pc + width
    need = 0
    if op == 5 or op == 7 or op == 10 or (op >= 27 and op <= 29) or op == 33 or (op >= 35 and op <= 37) or op == 49 or op == 53 or op == 58 or op == 59 then need = 1 end if
    if (op >= 11 and op <= 26) or (op >= 30 and op <= 32) or op == 34 or (op >= 38 and op <= 48) or (op >= 50 and op <= 52) or (op >= 54 and op <= 57) then need = 2 end if
    if top < need then return fail("operand stack underflow") end if
    a = stack[top]
    b = 0
    if top > 0 then b = stack[top - 1] end if
    switch op
      case 1
        // Original OP_IGNORE performs no operation.
      end case
      case 2
        vm.breaks = vm.breaks + 1
      end case
      case 3
        ps = ps - operand
      end case
      case 4
        ps = ps + operand
        pc = n.readI32(vm.data, ps)
        if pc == -1 then
          if top != 1 or ps != originalStack - 48 then return fail("unbalanced return") end if
          vm.programStack = originalStack
          return stack[1]
        end if
      end case
      case 5
        n.writeU32(vm.data, ps, pc)
        top = top - 1
        if a < 0 then
          vm.programStack = ps - 4
          n.writeU32(vm.data, ps + 4, -1 - a)
          callback = vm.syscall
          if callback is void then return fail("syscall handler missing") end if
          value = callback(vm, ps + 4)
          vm.programStack = originalStack
          top = top + 1
          stack[top] = n.i32(value)
          pc = n.readI32(vm.data, ps)
        else
          pc = targetAddress(vm, a)
        end if
      end case
      case 6
        top = top + 1
      end case
      case 7
        top = top - 1
      end case
      case 8
        top = top + 1
        if top >= 256 then return fail("operand stack overflow") end if
        stack[top] = operand
      end case
      case 9
        top = top + 1
        if top >= 256 then return fail("operand stack overflow") end if
        stack[top] = ps + operand
      end case
      case 10
        pc = targetAddress(vm, a)
        top = top - 1
      end case
      case 27
        stack[top] = vm.data[a & vm.mask]
      end case
      case 28
        address = a & vm.mask
        if address + 2 > len(vm.data) then return fail("load2 outside data") end if
        stack[top] = vm.data[address] | (vm.data[address + 1] << 8)
      end case
      case 29
        stack[top] = n.readI32(vm.data, a & vm.mask)
      end case
      case 30
        vm.data[b & vm.mask] = a & 255
        top = top - 2
      end case
      case 31
        address = b & (vm.mask & ~1)
        vm.data[address] = a & 255
        vm.data[address + 1] = (a >> 8) & 255
        top = top - 2
      end case
      case 32
        n.writeU32(vm.data, b & (vm.mask & ~3), a)
        top = top - 2
      end case
      case 33
        n.writeU32(vm.data, ps + operand, a)
        top = top - 1
      end case
      case 34
        source = a & vm.mask
        destination = b & vm.mask
        count = ((source + operand) & vm.mask) - source
        count = ((destination + count) & vm.mask) - destination
        if ((source | destination | count) & 3) != 0 then return fail("block copy misaligned") end if
        index = count - 4
        while index >= 0
          n.writeU32(vm.data, destination + index, n.readU32(vm.data, source + index))
          index = index - 4
        end while
        top = top - 2
      end case
      case 35
        stack[top] = n.i8(a)
      end case
      case 36
        stack[top] = n.i16(a)
      end case
      case 37
        stack[top] = n.i32(0 - a)
      end case
      case 49
        // Preserve the upstream interpreter's unusual slot write. The x86
        // compiled VM differs here; record the selected reference profile.
        stack[top - 1] = n.i32(~a)
      end case
      case 53
        stack[top] = n.i32(n.u32(a) ^ 0x80000000)
      end case
      case 58
        stack[top] = n.i32(n.floatBits(n.f32(a)))
      end case
      case 59
        value = n.bitsFloat(a)
        if n.isNaNBits(n.u32(a)) or value >= 2147483648.0 or value < -2147483648.0 then
          stack[top] = -2147483648
        else
          bits = n.u32(a)
          magnitude = n.mantissa(bits)
          power = n.exponent(bits)
          if power < 0 then
            if power < -31 then magnitude = 0 else magnitude = magnitude >> (0 - power) end if
          else
            magnitude = magnitude << power
          end if
          if (bits & 0x80000000) != 0 then magnitude = 0 - magnitude end if
          stack[top] = magnitude
        end if
      end case
      case default
        if op >= 11 and op <= 26 then
          left = b
          right = a
          if op >= 17 and op <= 20 then left = n.u32(b); right = n.u32(a) end if
          if op >= 21 then left = n.bitsFloat(b); right = n.bitsFloat(a) end if
          take = false
          switch op
            case 11, 21
              take = left == right
            end case
            case 12, 22
              take = left != right
            end case
            case 13, 17, 23
              take = left < right
            end case
            case 14, 18, 24
              take = left <= right
            end case
            case 15, 19, 25
              take = left > right
            end case
            case 16, 20, 26
              take = left >= right
            end case
          end switch
          if take then pc = operand end if
          top = top - 2
        else
          value = 0
          switch op
            case 38
              value = n.add32(b, a)
            end case
            case 39
              value = n.i32(b - a)
            end case
            case 40
              value = signedDivide(b, a)
            end case
            case 41
              value = n.i32(n.quotient(n.u32(b), n.u32(a)))
            end case
            case 42
              value = b - signedDivide(b, a) * a
            end case
            case 43
              value = n.i32(n.u32(b) - n.quotient(n.u32(b), n.u32(a)) * n.u32(a))
            end case
            case 44, 45
              value = n.mul32(b, a)
            end case
            case 46
              value = n.i32(b & a)
            end case
            case 47
              value = n.i32(b | a)
            end case
            case 48
              value = n.i32(b ^ a)
            end case
            case 50
              value = n.shl32(b, a)
            end case
            case 51
              value = n.sar32(b, a)
            end case
            case 52
              value = n.i32(n.shr32(b, a))
            end case
            case 54
              value = n.i32(n.addBits(n.u32(b), n.u32(a)))
            end case
            case 55
              value = n.i32(n.addBits(n.u32(b), n.u32(a) ^ 0x80000000))
            end case
            case 56
              value = n.i32(n.divBits(n.u32(b), n.u32(a)))
            end case
            case 57
              value = n.i32(n.mulBits(n.u32(b), n.u32(a)))
            end case
            case default
              return fail("opcode has no implementation")
            end case
          end switch
          top = top - 1
          stack[top] = value
        end if
      end case
    end switch
    if top < 0 or top >= 256 then return fail("operand stack out of range") end if
  end while
end function
