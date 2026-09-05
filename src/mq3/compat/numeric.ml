// SPDX-License-Identifier: GPL-2.0-or-later
// C integer widths and binary32 operations. Algorithms are MiniLang-owned.
package mq3.compat.numeric

extern function mq3_f32(value as double) from "miniquake3_abi.dll" returns double
extern function mq3_float_bits(value as double) from "miniquake3_abi.dll" returns u32
extern function mq3_bits_float(value as u32) from "miniquake3_abi.dll" returns double

function u32(value)
  return value & 0xffffffff
end function

function i32(value)
  v = value & 0xffffffff
  if v >= 0x80000000 then return v - 0x100000000 end if
  return v
end function

function i16(value)
  v = value & 0xffff
  if v >= 0x8000 then return v - 0x10000 end if
  return v
end function

function i8(value)
  v = value & 0xff
  if v >= 0x80 then return v - 0x100 end if
  return v
end function

function add32(a, b)
  return i32(i32(a) + i32(b))
end function

function mul32(a, b)
  // Split products so the tagged MiniLang integer never needs a full uint64.
  x = u32(a)
  y = u32(b)
  low = (x & 65535) * (y & 65535)
  high = ((x >> 16) * (y & 65535) + (y >> 16) * (x & 65535)) & 65535
  return i32(low + (high << 16))
end function

function shl32(a, b)
  return i32(u32(a) << (b & 31))
end function

function shr32(a, b)
  return u32(a) >> (b & 31)
end function

function sar32(a, b)
  return i32(a) >> (b & 31)
end function

function f32(value)
  // Passing an existing float through toFloat() in the frozen compiler can
  // incorrectly narrow integral magnitudes above the tagged integer range.
  return mq3_f32(value)
end function

function floatBits(value)
  return mq3_float_bits(value)
end function

function bitsFloat(value)
  return mq3_bits_float(u32(value))
end function

function fadd(a, b)
  return bitsFloat(addBits(floatBits(a), floatBits(b)))
end function

function fsub(a, b)
  return bitsFloat(addBits(floatBits(a), floatBits(b) ^ 0x80000000))
end function

function fmul(a, b)
  return bitsFloat(mulBits(floatBits(a), floatBits(b)))
end function

function fdiv(a, b)
  return bitsFloat(divBits(floatBits(a), floatBits(b)))
end function

function fsqrt(value)
  return bitsFloat(sqrtBits(floatBits(value)))
end function

function fneg(value)
  return bitsFloat(floatBits(value)^0x80000000)
end function

function trunc32(value)
  bits = floatBits(value)
  if isNaNBits(bits) or value >= 2147483648.0 or value < -2147483648.0 then return -2147483648 end if
  magnitude = mantissa(bits); power = exponent(bits)
  if power < 0 then
    if power < -31 then magnitude = 0 else magnitude = magnitude >> (0-power) end if
  else magnitude = magnitude << power end if
  if (bits & 0x80000000) != 0 then magnitude = 0-magnitude end if
  return magnitude
end function

function sqrtBits(value)
  if isNaNBits(value) then return value | 0x400000 end if
  if (value & 0x7fffffff) == 0 then return value end if
  if (value & 0x80000000) != 0 then return 0xffc00000 end if
  if value == 0x7f800000 then return value end if
  m = mantissa(value)
  power = exponent(value)
  while m < 0x800000
    m = m << 1; power = power-1
  end while
  // sqrt(m * 2^power) = sqrt(m * 2^23) * 2^((power-23)/2).
  // Integer radicands cannot land at the quarter-integer midpoint square.
  if ((power-23) & 1) != 0 then m = m << 1; power = power-1 end if
  radicand = m << 23
  low = 0; high = 0x1000000
  while low+1 < high
    mid = (low+high) >> 1
    if mid*mid <= radicand then low = mid else high = mid end if
  end while
  if radicand-low*low > low then low = low+1 end if
  return packFloat(0,low,(power-23) >> 1)
end function

function mantissa(bits)
  value = bits & 0x7fffff
  if (bits & 0x7f800000) != 0 then value = value | 0x800000 end if
  return value
end function

function exponent(bits)
  value = (bits >> 23) & 255
  if value == 0 then return -149 end if
  return value - 150
end function

function jam(value, shift)
  if shift <= 0 then return value end if
  if shift >= 56 then
    if value == 0 then return 0 end if
    return 1
  end if
  rest = value & ((1 << shift) - 1)
  result = value >> shift
  if rest != 0 then result = result | 1 end if
  return result
end function

// Round an exact integer significand times 2^power to binary32 (nearest-even).
function packFloat(sign, significand, power)
  if significand == 0 then return sign end if
  high = 0
  scan = significand
  while scan > 1
    scan = scan >> 1
    high = high + 1
  end while
  target = power + high - 23
  if target < -149 then target = -149 end if
  shift = target - power
  if shift >= 56 then return sign end if
  if shift > 0 then
    mask = (1 << shift) - 1
    remainder = significand & mask
    half = 1 << (shift - 1)
    significand = significand >> shift
    if remainder > half or (remainder == half and (significand & 1) != 0) then
      significand = significand + 1
    end if
  else if shift < 0 then
    significand = significand << (0 - shift)
  end if
  if significand >= 0x1000000 then
    significand = significand >> 1
    target = target + 1
  end if
  if target > 104 then return sign | 0x7f800000 end if
  if significand < 0x800000 then return sign | significand end if
  return sign | ((target + 150) << 23) | (significand & 0x7fffff)
end function

function isNaNBits(value)
  return (value & 0x7fffffff) > 0x7f800000
end function

function addBits(a, b)
  if isNaNBits(a) then return a | 0x400000 end if
  if isNaNBits(b) then return b | 0x400000 end if
  aa = a & 0x7fffffff
  bb = b & 0x7fffffff
  if aa == 0x7f800000 then
    if bb == aa and ((a ^ b) & 0x80000000) != 0 then return 0xffc00000 end if
    return a
  end if
  if bb == 0x7f800000 then return b end if
  if aa == 0 and bb == 0 then return a & b & 0x80000000 end if
  ea = exponent(a)
  eb = exponent(b)
  power = ea
  if eb > power then power = eb end if
  ma = jam(mantissa(a) << 3, power - ea)
  mb = jam(mantissa(b) << 3, power - eb)
  if (a & 0x80000000) != 0 then ma = 0 - ma end if
  if (b & 0x80000000) != 0 then mb = 0 - mb end if
  result = ma + mb
  sign = 0
  if result < 0 then
    sign = 0x80000000
    result = 0 - result
  end if
  return packFloat(sign, result, power - 3)
end function

function mulBits(a, b)
  if isNaNBits(a) then return a | 0x400000 end if
  if isNaNBits(b) then return b | 0x400000 end if
  sign = (a ^ b) & 0x80000000
  aa = a & 0x7fffffff
  bb = b & 0x7fffffff
  if aa == 0x7f800000 or bb == 0x7f800000 then
    if aa == 0 or bb == 0 then return 0xffc00000 end if
    return sign | 0x7f800000
  end if
  return packFloat(sign, mantissa(a) * mantissa(b), exponent(a) + exponent(b))
end function

function quotient(a, b)
  if b == 0 then return error(3002, "integer divide by zero") end if
  result = 0
  remainder = a
  shifted = b
  place = 1
  while shifted <= (a >> 1)
    shifted = shifted << 1
    place = place << 1
  end while
  while place != 0
    if remainder >= shifted then
      remainder = remainder - shifted
      result = result | place
    end if
    shifted = shifted >> 1
    place = place >> 1
  end while
  return result
end function

function divBits(a, b)
  if isNaNBits(a) then return a | 0x400000 end if
  if isNaNBits(b) then return b | 0x400000 end if
  sign = (a ^ b) & 0x80000000
  aa = a & 0x7fffffff
  bb = b & 0x7fffffff
  if (aa == 0 and bb == 0) or (aa == 0x7f800000 and bb == aa) then return 0xffc00000 end if
  if aa == 0x7f800000 or bb == 0 then return sign | 0x7f800000 end if
  if aa == 0 or bb == 0x7f800000 then return sign end if
  ma = mantissa(a)
  mb = mantissa(b)
  ea = exponent(a)
  eb = exponent(b)
  while ma < 0x800000
    ma = ma << 1
    ea = ea - 1
  end while
  while mb < 0x800000
    mb = mb << 1
    eb = eb - 1
  end while
  numerator = ma << 28
  result = quotient(numerator, mb)
  if numerator - result * mb != 0 then result = result | 1 end if
  return packFloat(sign, result, ea - eb - 28)
end function

function readU32(data, offset)
  if offset < 0 or offset + 4 > len(data) then return error(3001, "readU32 out of range") end if
  return data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16) | (data[offset + 3] << 24)
end function

function readI32(data, offset)
  return i32(readU32(data, offset))
end function

function writeU32(data, offset, value)
  if offset < 0 or offset + 4 > len(data) then return error(3001, "writeU32 out of range") end if
  v = u32(value)
  data[offset] = v & 255
  data[offset + 1] = (v >> 8) & 255
  data[offset + 2] = (v >> 16) & 255
  data[offset + 3] = (v >> 24) & 255
  return true
end function
