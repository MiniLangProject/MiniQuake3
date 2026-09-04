// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BSP46 layout from code/qcommon/qfiles.h; checked byte views, no native structs.
package mq3.format.bsp
import mq3.compat.numeric as n
import mq3.shared.parser as parser

struct BSP
  data
  offsets
  lengths
  counts
end struct

function fail(message)
  return error(3502, "BSP46: " + message)
end function

function range(first, count, limit)
  if first < 0 or count < 0 or first + count > limit then return fail("invalid indexed range") end if
  return true
end function

function load(data)
  if len(data) < 144 or n.readU32(data, 0) != 0x50534249 or n.readU32(data, 4) != 46 then return fail("invalid header") end if
  strides = [1,72,16,36,48,4,4,40,12,8,44,4,72,104,49152,8,1]
  offsets = array(17, 0)
  lengths = array(17, 0)
  counts = array(17, 0)
  for index = 0 to 16
    offset = n.readI32(data, 8 + index * 8)
    length = n.readI32(data, 12 + index * 8)
    if offset < 0 or length < 0 or offset + length > len(data) then return fail("lump outside file") end if
    if length > 0 and offset < 144 then return fail("lump overlaps header") end if
    if (length % strides[index]) != 0 then return fail("lump record size mismatch") end if
    offsets[index] = offset
    lengths[index] = length
    counts[index] = n.quotient(length, strides[index])
  end for
  if counts[7] == 0 or counts[2] == 0 or counts[4] == 0 then return fail("world model/planes/leaves missing") end if
  index = 0
  while index < counts[9]
    off = offsets[9] + index * 8
    range(n.readI32(data, off), 1, counts[2])
    range(n.readI32(data, off + 4), 1, counts[1])
    index = index + 1
  end while
  index = 0
  while index < counts[8]
    off = offsets[8] + index * 12
    range(n.readI32(data, off), n.readI32(data, off + 4), counts[9])
    range(n.readI32(data, off + 8), 1, counts[1])
    index = index + 1
  end while
  index = 0
  while index < counts[7]
    off = offsets[7] + index * 40
    range(n.readI32(data, off + 24), n.readI32(data, off + 28), counts[13])
    range(n.readI32(data, off + 32), n.readI32(data, off + 36), counts[8])
    index = index + 1
  end while
  index = 0
  while index < counts[3]
    off = offsets[3] + index * 36
    range(n.readI32(data, off), 1, counts[2])
    for side = 0 to 1
      child = n.readI32(data, off + 4 + side * 4)
      if child >= 0 then range(child, 1, counts[3]) else range(-1 - child, 1, counts[4]) end if
    end for
    index = index + 1
  end while
  index = 0
  while index < counts[4]
    off = offsets[4] + index * 48
    range(n.readI32(data, off + 32), n.readI32(data, off + 36), counts[5])
    range(n.readI32(data, off + 40), n.readI32(data, off + 44), counts[6])
    index = index + 1
  end while
  index = 0
  while index < counts[5]
    range(n.readI32(data, offsets[5] + index * 4), 1, counts[13])
    index = index + 1
  end while
  index = 0
  while index < counts[6]
    range(n.readI32(data, offsets[6] + index * 4), 1, counts[8])
    index = index + 1
  end while
  index = 0
  while index < counts[13]
    off = offsets[13] + index * 104
    range(n.readI32(data, off), 1, counts[1])
    range(n.readI32(data, off + 12), n.readI32(data, off + 16), counts[10])
    range(n.readI32(data, off + 20), n.readI32(data, off + 24), counts[11])
    index = index + 1
  end while
  if lengths[16] > 0 then
    if lengths[16] < 8 then return fail("truncated visibility") end if
    clusters = n.readI32(data, offsets[16])
    rowBytes = n.readI32(data, offsets[16] + 4)
    if clusters < 0 or rowBytes < 0 or clusters > 131072 or rowBytes > 16777216 then return fail("invalid visibility dimensions") end if
    if clusters * rowBytes + 8 != lengths[16] then return fail("visibility size mismatch") end if
  end if
  return BSP(data, offsets, lengths, counts)
end function

function entities(map)
  state = parser.create(slice(map.data, map.offsets[0], map.lengths[0]))
  result = []
  while true
    token = parser.parseExt(state, true)
    if token == "" then break end if
    if token != "{" then return fail("entity opening brace missing") end if
    fields = []
    while true
      key = parser.parseExt(state, true)
      if key == "}" then break end if
      if key == "" then return fail("unterminated entity") end if
      value = parser.parseExt(state, true)
      if state.offset < 0 or value == "}" then return fail("entity value missing") end if
      fields = fields + [[key, value]]
    end while
    result = result + [fields]
  end while
  return result
end function
