// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.compat.numeric as n
import std.fs as fs
function main(args)
  data = fs.readAllBytes(args[0])
  count = n.quotient(len(data), 24)
  if len(data) != count * 24 then return 2 end if
  for index = 0 to count - 1
    off = index * 24
    a = n.readU32(data, off)
    b = n.readU32(data, off + 4)
    actual = [n.addBits(a,b), n.addBits(a,b ^ 0x80000000), n.mulBits(a,b), n.divBits(a,b)]
    for op = 0 to 3
      expected = n.readU32(data, off + 8 + op * 4)
      if actual[op] != expected then
        print "FAIL binary32 case " + str(index) + " op " + str(op) + " inputs " + str(a) + "," + str(b) + " got " + str(actual[op]) + " expected " + str(expected)
        return 1
      end if
    end for
  end for
  print "PASS: " + str(count * 4) + " exact C binary32 results"
  return 0
end function
