// SPDX-License-Identifier: GPL-2.0-or-later
// The original native game uses CRT atoi/atof/sscanf. Keep that CRT boundary.
package mq3.compat.textnumbers
import mq3.compat.numeric as n
extern function atof(text as cstr) from "ucrtbase.dll" returns double
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
extern function __stdio_common_vsscanf(options as u64,text as cstr,length as u64,format as cstr,locale as ptr,arguments as bytes) from "ucrtbase.dll" returns i32
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
