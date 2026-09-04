// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.shared.parser as parser
import mq3.qcommon.cvar as cv
import mq3.compat.numeric as n
import std.fs as fs
import std.string as strings

struct Reader
  data
  offset
end struct

function word(reader)
  result = n.readI32(reader.data, reader.offset)
  reader.offset = reader.offset + 4
  return result
end function

function text(reader)
  count = word(reader)
  if count == -1 then return void end if
  result = decode(slice(reader.data, reader.offset, count))
  reader.offset = reader.offset + count
  return result
end function

function equal(a, b, label)
  if a != b then return error(3901, "mismatch " + label + " got " + str(a) + " wanted " + str(b)) end if
  return true
end function

function main(args)
  expected = Reader(fs.readAllBytes(args[2]), 0)
  if args[0] == "parser" then
    state = parser.create(fs.readAllBytes(args[1]))
    for index = 0 to 63
      token = parser.parseExt(state, (index % 3) != 0)
      equal(token, text(expected), "token " + str(index))
      equal(state.line, word(expected), "line " + str(index))
      equal(state.offset, word(expected), "offset " + str(index))
    end for
    print "PASS: 64 original COM_ParseExt comparisons"
  else
    registry = cv.create()
    count = 0
    for each line in fs.readAllLines(args[1])
      line = strings.trim(line)
      if len(line) == 0 then continue end if
      parts = strings.split(line, "\t")
      op = parts[0]
      name = parts[1]
      value = parts[2]
      if value == "<empty>" then value = "" end if
      flags = toNumber(parts[3])
      if op == "get" then cv.get(registry, name, value, flags) end if
      if op == "set" then cv.set2(registry, name, value, flags != 0) end if
      if op == "reset" then cv.set2(registry, name, void, false) end if
      if op == "cheats" then cv.setCheatState(registry) end if
      if not cv.validName(name) then name = "BADNAME" end if
      variable = cv.find(registry, name)
      equal(variable.name, text(expected), "name " + str(count))
      equal(variable.string, text(expected), "string " + str(count))
      equal(variable.resetString, text(expected), "reset " + str(count))
      equal(variable.latchedString, text(expected), "latch " + str(count))
      equal(variable.flags, word(expected), "flags " + str(count))
      modified = 0
      if variable.modified then modified = 1 end if
      equal(modified, word(expected), "modified " + str(count))
      equal(variable.modificationCount, word(expected), "modcount " + str(count))
      equal(variable.integer, word(expected), "integer " + str(count))
      equal(n.floatBits(variable.value), n.u32(word(expected)), "float " + str(count))
      equal(registry.modifiedFlags, word(expected), "modifiedFlags " + str(count))
      count = count + 1
    end for
    print "PASS: " + str(count) + " original Cvar state comparisons"
  end if
  equal(expected.offset, len(expected.data), "complete oracle consumption")
  return 0
end function
