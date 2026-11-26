// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BSP46 layout from code/qcommon/qfiles.h; checked byte views, no native structs.
package mq3.format.bsp
import mq3.compat.numeric as n
import mq3.shared.parser as parser
import mq3.format.qfiles as qfiles

/// BSP record for format.bsp, containing `data`, `offsets`, `lengths`, `counts`.
struct BSP
  /// Complete BSP file bytes backing the lump readers.
  data
  /// Byte offsets of BSP lump payloads, indexed by lump identifier.
  offsets
  /// Byte lengths of BSP lump payloads, indexed by lump identifier.
  lengths
  /// Decoded element counts for each BSP lump.
  counts
end struct

/// Create the format.bsp error for `fail` with 3502 and the supplied diagnostic text.
/// @param message Message used in `("BSP46: " + message)` and `error(3502, ("BSP46: " + message))`.
function fail(message)
  return error(3502, "BSP46: " + message)
end function

/// Test range in format.bsp; the normal completion returns `true`.
/// @param first First used in `(first < 0)` and `(first + count)`.
/// @param count Count used in `(count < 0)` and `(first + count)`.
/// @param limit Limit used in `((first + count) > limit)` and `(((first < 0) or (count < 0)) or ((first + count) > limit))`.
function range(first, count, limit)
  if first < 0 or count < 0 or first + count > limit then return fail("invalid indexed range") end if
  return true
end function

/// Load bsp in format.bsp; the normal completion returns `BSP(data, offsets, lengths, counts)`.
/// @param data Data passed as `data` to `mq3.compat.numeric.readU32`.
function load(data)
  if len(data) < 8+qfiles.HEADER_LUMPS*8 or n.readU32(data, 0) != qfiles.BSP_IDENT or n.readU32(data, 4) != qfiles.BSP_VERSION then return fail("invalid header") end if
  strides = [1,72,16,36,48,4,4,40,12,8,44,4,72,104,49152,8,1]
  offsets = array(qfiles.HEADER_LUMPS, 0)
  lengths = array(qfiles.HEADER_LUMPS, 0)
  counts = array(qfiles.HEADER_LUMPS, 0)
  for index = 0 to qfiles.HEADER_LUMPS-1
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

/// Compute entities in format.bsp; the normal completion returns `result`.
/// @param map Record exposing `data`, `offsets`, `lengths`.
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
