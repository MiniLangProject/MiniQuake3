// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.vm.interpreter as vm
import mq3.compat.numeric as n
import std.fs as fs
function main(args)
  state = vm.load(fs.readAllBytes(args[0]), void)
  result = vm.call(state, [toNumber(args[1]),11,13,17,19,23,29,31,37,41])
  expected = fs.readAllBytes(args[2])
  if result != n.readI32(expected, 0) then return error(3903, "retail QVM return mismatch") end if
  for index = 0 to 63
    if state.data[index] != expected[index + 4] then return error(3903, "retail QVM memory mismatch") end if
  end for
  print "PASS: original QVM " + args[0] + " command " + args[1] + " result " + str(result) + " instructions " + str(state.steps)
  return 0
end function
