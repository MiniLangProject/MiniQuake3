// SPDX-License-Identifier: GPL-2.0-or-later
// The original native game uses CRT atoi/atof/sscanf. Keep that CRT boundary.
package mq3.compat.textnumbers
import mq3.compat.numeric as n
extern function atof(text as cstr) from "ucrtbase.dll" returns double
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
extern function __stdio_common_vsscanf(options as u64,text as cstr,length as u64,format as cstr,locale as ptr,arguments as bytes) from "ucrtbase.dll" returns i32
extern function __stdio_common_vsprintf(options as u64,output as bytes,length as u64,format as cstr,locale as ptr,arguments as bytes) from "ucrtbase.dll" returns i32
function atof32(text)
  return n.f32(atof(text))
end function
function truncDouble32(value)
  // cvttsd2si semantics without a premature float store.
  if value != value or value >= 2147483648.0 or value < -2147483648.0 then return -2147483648 end if
  negative = value < 0
  if negative then value = 0.0-value end if
  low = 0; high = 2147483649
  while low+1 < high
    mid = (low+high) >> 1
    if mid <= value then low = mid else high = mid end if
  end while
  if negative then return 0-low end if
  return low
end function
function fixed2(value)
  // Encode the exact float-to-double promotion in an x64 va_list slot.
  bits = n.floatBits(value); exponent = (bits >> 23) & 255; fraction = bits & 0x7fffff
  hi = bits & 0x80000000; lo = 0
  if exponent == 255 then hi = hi | 0x7ff00000
  else if exponent != 0 then hi = hi | ((exponent+896) << 20)
  else if fraction != 0 then
    exponent = 1
    while fraction < 0x800000
      fraction = fraction << 1; exponent = exponent-1
    end while
    fraction = fraction & 0x7fffff; hi = hi | ((exponent+896) << 20)
  end if
  hi = hi | (fraction >> 3); lo = (fraction & 7) << 29
  arguments = bytes(8,0); output = bytes(64,0)
  for b = 0 to 3
    arguments[b] = (lo >> (b*8)) & 255; arguments[b+4] = (hi >> (b*8)) & 255
  end for
  // The pinned MSVC static CRT reference enables standard ties-even rounding.
  count = __stdio_common_vsprintf(32,output,64,"%5.2f",0,arguments)
  if count < 0 or count >= 64 then return error(487,"Shader time formatting overflow") end if
  return decode(slice(output,0,count))
end function
function fixed6(value)
  // va("%f", float) receives the same binary32-to-double promotion.
  bits = n.floatBits(value); exponent = (bits >> 23) & 255; fraction = bits & 0x7fffff
  hi = bits & 0x80000000; lo = 0
  if exponent == 255 then hi = hi | 0x7ff00000
  else if exponent != 0 then hi = hi | ((exponent+896) << 20)
  else if fraction != 0 then
    exponent = 1
    while fraction < 0x800000
      fraction = fraction << 1; exponent = exponent-1
    end while
    fraction = fraction & 0x7fffff; hi = hi | ((exponent+896) << 20)
  end if
  hi = hi | (fraction >> 3); lo = (fraction & 7) << 29
  arguments = bytes(8,0); output = bytes(64,0)
  for b = 0 to 3
    arguments[b] = (lo >> (b*8)) & 255; arguments[b+4] = (hi >> (b*8)) & 255
  end for
  count = __stdio_common_vsprintf(32,output,64,"%f",0,arguments)
  if count < 0 or count >= 64 then return error(487,"Float formatting overflow") end if
  return decode(slice(output,0,count))
end function
function vector(text,initial)
  output = bytes(12,0); arguments = bytes(24,0)
  for axis = 0 to 2
    bits = n.floatBits(initial[axis]); pointer = nativeBytesPtr(output)+axis*4
    for b = 0 to 3
      output[axis*4+b] = (bits >> (b*8)) & 255
    end for
    for b = 0 to 7
      arguments[axis*8+b] = (pointer >> (b*8)) & 255
    end for
  end for
  count = __stdio_common_vsscanf(0,text,len(bytes(text)),"%f %f %f",0,arguments)
  return [count,[n.bitsFloat(n.readU32(output,0)),n.bitsFloat(n.readU32(output,4)),n.bitsFloat(n.readU32(output,8))]]
end function
function sessionIntegers(text)
  // Match the native game's seven %i conversions, including octal/hex input.
  output = bytes(28,0); arguments = bytes(56,0)
  for index = 0 to 6
    pointer = nativeBytesPtr(output)+index*4
    for b = 0 to 7
      arguments[index*8+b] = (pointer >> (b*8)) & 255
    end for
  end for
  count = __stdio_common_vsscanf(0,text,len(bytes(text)),"%i %i %i %i %i %i %i",0,arguments)
  if count != 7 then return error(486,"Incomplete session data would read uninitialized C locals") end if
  result = []
  for index = 0 to 6
    result = result+[n.readI32(output,index*4)]
  end for
  return result
end function
