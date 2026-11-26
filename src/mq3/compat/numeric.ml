// SPDX-License-Identifier: GPL-2.0-or-later
// C integer widths and exact binary32 primitives. MiniLang integer algorithms
// remain an independent reference; hot ABI arithmetic uses controlled SSE2.
package mq3.compat.numeric

/// Round a floating-point value to IEEE-754 binary32 through a saved and restored SSE rounding environment.
/// @param value Floating-point value to narrow to binary32.
/// @returns The rounded binary32 value, widened to the declared floating-point return type.
extern function mq3_f32(value as double) from "miniquake3_abi.dll" returns double
/// Expose the binary32 representation of a floating-point value through the native ABI.
/// @param value Floating-point value to narrow and reinterpret.
/// @returns The unsigned 32-bit IEEE-754 bit pattern.
extern function mq3_float_bits(value as double) from "miniquake3_abi.dll" returns u32
/// Decode an IEEE-754 binary32 bit pattern through the native ABI.
/// @param value Low 32 bits containing an IEEE-754 binary32 encoding.
/// @returns The encoded binary32 value widened to the declared floating-point type.
extern function mq3_bits_float(value as u32) from "miniquake3_abi.dll" returns double
/// Compute the binary32 sum while saving and restoring the host SSE control state.
/// @param a Left double argument, narrowed to binary32 before arithmetic.
/// @param b Right double argument, narrowed to binary32 before arithmetic.
/// @returns The binary32 sum, widened to double; NaNs follow left-to-right operand selection.
extern function mq3_fadd(a as double,b as double) from "miniquake3_abi.dll" returns double
/// Compute the binary32 difference while saving and restoring the host SSE control state.
/// @param a Left double argument, narrowed to binary32 before arithmetic.
/// @param b Right double argument, narrowed to binary32 before arithmetic.
/// @returns The binary32 difference, widened to double; NaNs follow left-to-right operand selection.
extern function mq3_fsub(a as double,b as double) from "miniquake3_abi.dll" returns double
/// Compute the binary32 product while saving and restoring the host SSE control state.
/// @param a Left double argument, narrowed to binary32 before arithmetic.
/// @param b Right double argument, narrowed to binary32 before arithmetic.
/// @returns The binary32 product, widened to double; NaNs follow left-to-right operand selection.
extern function mq3_fmul(a as double,b as double) from "miniquake3_abi.dll" returns double
/// Compute the binary32 quotient while saving and restoring the host SSE control state.
/// @param a Left double argument, narrowed to binary32 before arithmetic.
/// @param b Right double argument, narrowed to binary32 before arithmetic.
/// @returns The binary32 quotient, widened to double; NaNs follow left-to-right operand selection.
extern function mq3_fdiv(a as double,b as double) from "miniquake3_abi.dll" returns double
/// Compute a three-component dot product with separate binary32 products and left-to-right additions in one native rounding scope.
/// @param ax X component of the left vector.
/// @param ay Y component of the left vector.
/// @param az Z component of the left vector.
/// @param bx X component of the right vector.
/// @param by Y component of the right vector.
/// @param bz Z component of the right vector.
/// @returns The separately rounded binary32 dot product.
extern function mq3_dot3(ax as double,ay as double,az as double,bx as double,by as double,bz as double) from "miniquake3_abi.dll" returns double
/// Take a binary32 square root while preserving the host SSE control state.
/// @param value Floating-point radicand, narrowed to binary32.
/// @returns The binary32 square root widened to double, including IEEE-754 NaN propagation.
extern function mq3_fsqrt(value as double) from "miniquake3_abi.dll" returns double

/// Interpret the low 32 bits as an unsigned integer.
/// @param value Integer whose low 32 bits are retained.
/// @returns The unsigned 32-bit value, represented as a MiniLang integer.
function u32(value as int) returns int
  return value & 0xffffffff
end function

/// Interpret the low 32 bits as a signed integer.
/// @param value Integer whose low 32 bits are retained.
/// @returns The signed 32-bit value, represented as a MiniLang integer.
function inline i32(value as int) returns int
  v = value & 0xffffffff
  if v >= 0x80000000 then return v - 0x100000000 end if
  return v
end function

/// Interpret the low 16 bits as a signed integer.
/// @param value Integer whose low 16 bits are retained.
/// @returns The signed 16-bit value, represented as a MiniLang integer.
function i16(value as int) returns int
  v = value & 0xffff
  if v >= 0x8000 then return v - 0x10000 end if
  return v
end function

/// Interpret the low 8 bits as a signed integer.
/// @param value Integer whose low 8 bits are retained.
/// @returns The signed 8-bit value, represented as a MiniLang integer.
function i8(value as int) returns int
  v = value & 0xff
  if v >= 0x80 then return v - 0x100 end if
  return v
end function

/// Compute the sum with signed 32-bit wraparound.
/// @param a Left integer operand; only its low 32 bits participate.
/// @param b Right integer operand; only its low 32 bits participate.
/// @returns The signed 32-bit sum.
function add32(a as int, b as int) returns int
  return i32(i32(a) + i32(b))
end function

/// Compute the product with signed 32-bit wraparound.
/// @param a Left integer operand; only its low 32 bits participate.
/// @param b Right integer operand; only its low 32 bits participate.
/// @returns The signed 32-bit product.
function mul32(a as int, b as int) returns int
  // Split products so the tagged MiniLang integer never needs a full uint64.
  x = u32(a)
  y = u32(b)
  low = (x & 65535) * (y & 65535)
  high = ((x >> 16) * (y & 65535) + (y >> 16) * (x & 65535)) & 65535
  return i32(low + (high << 16))
end function

/// Apply a 32-bit left shift with the shift count masked to five bits.
/// @param a Integer bit pattern to shift.
/// @param b Shift distance; the implementation uses b & 31.
/// @returns The shifted 32-bit result.
function shl32(a as int, b as int) returns int
  return i32(u32(a) << (b & 31))
end function

/// Apply a 32-bit logical right shift with the shift count masked to five bits.
/// @param a Integer bit pattern to shift.
/// @param b Shift distance; the implementation uses b & 31.
/// @returns The shifted 32-bit result.
function shr32(a as int, b as int) returns int
  return u32(a) >> (b & 31)
end function

/// Apply a 32-bit arithmetic right shift with the shift count masked to five bits.
/// @param a Integer bit pattern to shift.
/// @param b Shift distance; the implementation uses b & 31.
/// @returns The shifted 32-bit result.
function sar32(a as int, b as int) returns int
  return i32(a) >> (b & 31)
end function

/// Round a floating-point value to IEEE-754 binary32 through the native SSE boundary.
/// @param value Floating-point value to narrow to binary32.
/// @returns The rounded binary32 value, widened to the declared floating-point return type.
function f32(value) returns float
  // Passing an existing float through toFloat() in the frozen compiler can
  // incorrectly narrow integral magnitudes above the tagged integer range.
  return mq3_f32(value)
end function

/// Expose the binary32 representation of a floating-point value through the MiniLang numeric facade.
/// @param value Floating-point value to narrow and reinterpret.
/// @returns The unsigned 32-bit IEEE-754 bit pattern.
function inline floatBits(value) returns int
  return mq3_float_bits(value)
end function

/// Decode an IEEE-754 binary32 bit pattern through the MiniLang numeric facade.
/// @param value Low 32 bits containing an IEEE-754 binary32 encoding.
/// @returns The encoded binary32 value widened to the declared floating-point type.
function inline bitsFloat(value) returns float
  return mq3_bits_float(u32(value))
end function

/// Compute the binary32 sum through the controlled-rounding native ABI.
/// @param a Left floating-point operand.
/// @param b Right floating-point operand.
/// @returns The binary32 sum, widened to a MiniLang float.
function inline fadd(a, b) returns float
  return mq3_fadd(a,b)
end function

/// Compute the binary32 difference through the controlled-rounding native ABI.
/// @param a Left floating-point operand.
/// @param b Right floating-point operand.
/// @returns The binary32 difference, widened to a MiniLang float.
function inline fsub(a, b) returns float
  return mq3_fsub(a,b)
end function
/// Compute sub bits in compat.numeric; the normal completion returns `addBits(a, (b ^ 2147483648))`.
/// @param a Unsigned 32-bit binary32 encoding.
/// @param b Unsigned 32-bit binary32 encoding.
function subBits(a,b)
  // SSE subtraction propagates a NaN operand without negating its sign.
  if isNaNBits(a) then return a | 0x400000 end if
  if isNaNBits(b) then return b | 0x400000 end if
  return addBits(a,b ^ 0x80000000)
end function

/// Compute the binary32 product through the controlled-rounding native ABI.
/// @param a Left floating-point operand.
/// @param b Right floating-point operand.
/// @returns The binary32 product, widened to a MiniLang float.
function inline fmul(a, b) returns float
  return mq3_fmul(a,b)
end function

/// Compute a three-component dot product with separate binary32 products and left-to-right additions in the numeric facade.
/// @param ax X component of the left vector.
/// @param ay Y component of the left vector.
/// @param az Z component of the left vector.
/// @param bx X component of the right vector.
/// @param by Y component of the right vector.
/// @param bz Z component of the right vector.
/// @returns The separately rounded binary32 dot product.
function dot3(ax,ay,az,bx,by,bz) returns float
  return mq3_dot3(ax,ay,az,bx,by,bz)
end function

/// Compute the binary32 quotient through the controlled-rounding native ABI.
/// @param a Left floating-point operand.
/// @param b Right floating-point operand.
/// @returns The binary32 quotient, widened to a MiniLang float.
function fdiv(a, b) returns float
  return mq3_fdiv(a,b)
end function

/// Compute the binary32 square root through the controlled native numeric boundary.
/// @param value Floating-point radicand.
/// @returns The binary32 square-root result widened to a MiniLang float.
function fsqrt(value) returns float
  return mq3_fsqrt(value)
end function

/// Negate a binary32 value by toggling its sign bit, preserving signed zero and NaN payload bits.
/// @param value Floating-point value whose binary32 sign is toggled.
/// @returns The binary32 value with bit 31 inverted.
function fneg(value) returns float
  return bitsFloat(floatBits(value)^0x80000000)
end function

/// Truncate binary32 toward zero, matching the x86 integer sentinel for NaN or out-of-range input.
/// @param value Floating-point value to convert to signed 32-bit integer semantics.
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

/// Compute sqrt bits in compat.numeric; the normal completion returns `packFloat(0, low, ((power - 23) >> 1))`.
/// @param value Unsigned 32-bit binary32 encoding.
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

/// Compute mantissa in compat.numeric; the normal completion returns `value`.
/// @param bits Bits used in `(bits & 8388607)` and `(bits & 2139095040)`.
function mantissa(bits)
  value = bits & 0x7fffff
  if (bits & 0x7f800000) != 0 then value = value | 0x800000 end if
  return value
end function

/// Compute exponent in compat.numeric; the normal completion returns `(value - 150)`.
/// @param bits Bits used in `(bits >> 23)` and `((bits >> 23) & 255)`.
function exponent(bits)
  value = (bits >> 23) & 255
  if value == 0 then return -149 end if
  return value - 150
end function

/// Compute jam in compat.numeric; the normal completion returns `result`.
/// @param value Value used in `(value == 0)` and `(value >> shift)`.
/// @param shift Shift used in `(shift <= 0)` and `(1 << shift)`.
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
/// @param sign Sign used in `(sign | 2139095040)` and `(sign | significand)`.
/// @param significand Significand used in `(significand & 1)` and `(significand + 1)`.
/// @param power Power used in `(power + high)` and `(target - power)`.
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

/// Recognize IEEE-754 binary32 NaN encodings from the exponent and mantissa bits.
/// @param value Unsigned 32-bit binary32 encoding.
/// @returns True for a NaN bit pattern; false for finite values and infinities.
function inline isNaNBits(value as int) returns bool
  return (value & 0x7fffffff) > 0x7f800000
end function

/// Add bits in compat.numeric; the normal completion returns `packFloat(sign, result, (power - 3))`.
/// @param a Unsigned 32-bit binary32 encoding.
/// @param b Unsigned 32-bit binary32 encoding.
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

/// Compute mul bits in compat.numeric; the normal completion returns `packFloat(sign, (mantissa(a) * mantissa(b)), (exponent(a) + exponent(b)))`.
/// @param a Unsigned 32-bit binary32 encoding.
/// @param b Unsigned 32-bit binary32 encoding.
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

/// Compute quotient in compat.numeric; the normal completion returns `result`.
///
/// Validation failures include `integer divide by zero`.
/// @param a A used in `(a >> 1)` and `(shifted <= (a >> 1))`.
/// @param b B used in `(b == 0)`.
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

/// Compute div bits in compat.numeric; the normal completion returns `packFloat(sign, result, ((ea - eb) - 28))`.
/// @param a Unsigned 32-bit binary32 encoding.
/// @param b Unsigned 32-bit binary32 encoding.
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

/// Read u 32 in compat.numeric; the normal completion returns `(((data[offset] | (data[(offset + 1)] << 8)) | (data[(offset + 2)] << 16)) | (data[(offset + 3)] << 24))`.
///
/// Validation failures include `readU32 out of range`.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function readU32(data, offset as int)
  if offset < 0 or offset + 4 > len(data) then return error(3001, "readU32 out of range") end if
  return data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16) | (data[offset + 3] << 24)
end function

/// Read i 32 in compat.numeric; the normal completion returns `i32(readU32(data, offset))`.
/// @param data Data passed as `data` to `mq3.compat.numeric.readU32`.
/// @param offset Offset passed as `offset` to `mq3.compat.numeric.readU32`.
function inline readI32(data, offset as int)
  return i32(readU32(data, offset))
end function

/// Write u 32 in compat.numeric; the normal completion returns `true`.
///
/// Validation failures include `writeU32 out of range`.
/// Direct state writes: `data elements`.
/// @param data Mutable sequence written at `offset`, `(offset + 1)`, `(offset + 2)`.
/// @param offset Offset used in `(offset < 0)` and `(offset + 4)`.
/// @param value Integer whose low 32 bits are retained.
function writeU32(data, offset as int, value as int)
  if offset < 0 or offset + 4 > len(data) then return error(3001, "writeU32 out of range") end if
  v = u32(value)
  data[offset] = v & 255
  data[offset + 1] = (v >> 8) & 255
  data[offset + 2] = (v >> 16) & 255
  data[offset + 3] = (v >> 24) & 255
  return true
end function
