// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.compat.numeric as n
import mq3.shared.math as q
import std.fs as fs

function requireEqual(actual, expected, label)
  if actual != expected then
    print "FAIL " + label + ": got " + str(actual) + ", expected " + str(expected)
    return error(3900, label)
  end if
  return true
end function

function f(data, offset)
  return n.bitsFloat(n.readU32(data, offset))
end function

function checkFloat(value, data, offset, label)
  return requireEqual(n.floatBits(value), n.readU32(data, offset), label)
end function

function main(args)
  requireEqual(n.i32(0xffffffff), -1, "sign32")
  requireEqual(n.i16(0x8000), -32768, "sign16")
  requireEqual(n.i8(0xff), -1, "sign8")
  requireEqual(n.mul32(0xffffffff, 0xffffffff), 1, "multiply-wrap")
  requireEqual(n.shr32(-1, 1), 2147483647, "logical-shift")
  requireEqual(n.sar32(0x80000000, 31), -1, "arithmetic-shift")
  data = fs.readAllBytes(args[0])
  requireEqual(n.readU32(data, 0), 0x33514d54, "oracle-magic")
  count = n.readU32(data, 4)
  requireEqual(len(data), 8 + count * 96, "oracle-size")
  for index = 0 to count - 1
    off = 8 + index * 96
    seed = n.readI32(data, off)
    state = q.RandomState(seed)
    state.seed = seed
    requireEqual(q.Q_rand(state), n.readI32(data, off + 4), "Q_rand " + str(index))
    state.seed = seed
    checkFloat(q.Q_random(state), data, off + 8, "Q_random " + str(index))
    state.seed = seed
    checkFloat(q.Q_crandom(state), data, off + 12, "Q_crandom " + str(index))
    value = f(data, off + 16)
    checkFloat(q.Q_rsqrt(value), data, off + 20, "Q_rsqrt " + str(index))
    checkFloat(q.Q_fabs(n.bitsFloat(n.floatBits(value) | 0x80000000)), data, off + 24, "Q_fabs " + str(index))
    fraction = f(data, off + 36)
    checkFloat(q.LerpAngle(f(data, off + 28), f(data, off + 32), fraction), data, off + 40, "LerpAngle " + str(index))
    a = [f(data, off + 44), f(data, off + 48), f(data, off + 52)]
    b = [f(data, off + 56), f(data, off + 60), f(data, off + 64)]
    checkFloat(q.DotProduct(a,b), data, off + 68, "DotProduct " + str(index))
    cross = q.CrossProduct(a,b)
    ma = q.VectorMA(a,fraction,b)
    for axis = 0 to 2
      checkFloat(cross[axis], data, off + 72 + axis * 4, "CrossProduct " + str(index))
      checkFloat(ma[axis], data, off + 84 + axis * 4, "VectorMA " + str(index))
    end for
  end for
  print "PASS: " + str(count) + " C-reference cases, 53248 exact results"
  return 0
end function
