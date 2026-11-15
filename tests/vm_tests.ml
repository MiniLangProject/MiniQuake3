// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.vm.interpreter as vm
import mq3.compat.numeric as n
import std.fs as fs
import std.string as strings

function syscall(state, address)
  return n.readI32(state.data, address) * 17 + n.readI32(state.data, address + 4) + n.readI32(state.data, address + 8)
end function

function main(args)
  names = fs.readAllLines(args[0])
  expected = fs.readAllBytes(args[1])
  index = 0
  for each line in names
    name = strings.trim(line)
    if len(name) > 0 then
      image=fs.readAllBytes(name);state = vm.load(image, syscall)
      result = vm.call(state, [7,11,13,17,19,23,29,31,37,41])
      nativeState=vm.load(image,syscall);nativeResult=vm.callFast(nativeState,[7,11,13,17,19,23,29,31,37,41])
      if nativeResult!=result or nativeState.data!=state.data or nativeState.steps!=state.steps or nativeState.breaks!=state.breaks or nativeState.programStack!=state.programStack then
        print "FAIL native QVM parity "+name+" native="+str(nativeResult)+" portable="+str(result)
        return 3
      end if
      wanted = n.readI32(expected, index * 68)
      if result != wanted then
        print "FAIL " + name + " got " + str(result) + " expected " + str(wanted)
        return 1
      end if
      for offset = 0 to 63
        if state.data[offset] != expected[index * 68 + 4 + offset] then
          print "FAIL memory " + name + " offset " + str(offset)
          return 1
        end if
      end for
      index = index + 1
    end if
  end for
  if len(expected) != index * 68 then return 2 end if
  print "PASS: " + str(index) + " original QVM interpreter differential cases"
  return 0
end function
