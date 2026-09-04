// SPDX-License-Identifier: GPL-2.0-or-later
// RFC 1951 raw DEFLATE decoder. No native decompression dependency.
package mq3.format.deflate

struct Bits
  data
  offset
  value
  available
end struct

struct Huffman
  counts
  symbols
end struct

function fail(message)
  return error(3500, "DEFLATE: " + message)
end function

function readBits(reader, count)
  while reader.available < count
    if reader.offset >= len(reader.data) then return fail("truncated bitstream") end if
    reader.value = reader.value | (reader.data[reader.offset] << reader.available)
    reader.available = reader.available + 8
    reader.offset = reader.offset + 1
  end while
  result = reader.value & ((1 << count) - 1)
  reader.value = reader.value >> count
  reader.available = reader.available - count
  return result
end function

function tree(lengths)
  counts = array(16, 0)
  for each width in lengths
    if width < 0 or width > 15 then return fail("invalid code length") end if
    counts[width] = counts[width] + 1
  end for
  left = 1
  for width = 1 to 15
    left = (left << 1) - counts[width]
    if left < 0 then return fail("oversubscribed Huffman tree") end if
  end for
  offsets = array(16, 0)
  for width = 1 to 14
    offsets[width + 1] = offsets[width] + counts[width]
  end for
  symbols = array(len(lengths), 0)
  for sym = 0 to len(lengths) - 1
    width = lengths[sym]
    if width > 0 then
      symbols[offsets[width]] = sym
      offsets[width] = offsets[width] + 1
    end if
  end for
  return Huffman(counts, symbols)
end function

function decodeSymbol(reader, codes)
  code = 0
  first = 0
  index = 0
  for width = 1 to 15
    code = code | readBits(reader, 1)
    count = codes.counts[width]
    if code < first + count then return codes.symbols[index + code - first] end if
    index = index + count
    first = (first + count) << 1
    code = code << 1
  end for
  return fail("invalid Huffman code")
end function

function fixedTrees()
  lengths = array(288, 8)
  for index = 144 to 255
    lengths[index] = 9
  end for
  for index = 256 to 279
    lengths[index] = 7
  end for
  return [tree(lengths), tree(array(32, 5))]
end function

function dynamicTrees(reader)
  literalCount = readBits(reader, 5) + 257
  distanceCount = readBits(reader, 5) + 1
  codeCount = readBits(reader, 4) + 4
  if literalCount > 286 or distanceCount > 30 then return fail("reserved dynamic sym count") end if
  // Code-length alphabet order from the DEFLATE format.
  order = [16,17,18,0,8,7,9,6,10,5,11,4,12,3,13,2,14,1,15]
  codeLengths = array(19, 0)
  for index = 0 to codeCount - 1
    codeLengths[order[index]] = readBits(reader, 3)
  end for
  codeTree = tree(codeLengths)
  lengths = array(literalCount + distanceCount, 0)
  index = 0
  while index < len(lengths)
    sym = decodeSymbol(reader, codeTree)
    if sym <= 15 then
      lengths[index] = sym
      index = index + 1
    else
      repeated = 0
      count = 0
      if sym == 16 then
        if index == 0 then return fail("repeat without preceding length") end if
        repeated = lengths[index - 1]
        count = readBits(reader, 2) + 3
      else if sym == 17 then
        count = readBits(reader, 3) + 3
      else
        count = readBits(reader, 7) + 11
      end if
      if index + count > len(lengths) then return fail("code repeat outside alphabet") end if
      for offset = 0 to count - 1
        lengths[index] = repeated
        index = index + 1
      end for
    end if
  end while
  if lengths[256] == 0 then return fail("end code missing") end if
  literals = array(literalCount, 0)
  distances = array(distanceCount, 0)
  copyArray(literals, 0, lengths, 0, literalCount)
  copyArray(distances, 0, lengths, literalCount, distanceCount)
  return [tree(literals), tree(distances)]
end function

function inflate(data, expectedSize)
  if expectedSize < 0 or expectedSize > 268435456 then return fail("output size exceeds limit") end if
  reader = Bits(data, 0, 0, 0)
  output = bytes(expectedSize, 0)
  lengthBase = [3,4,5,6,7,8,9,10,11,13,15,17,19,23,27,31,35,43,51,59,67,83,99,115,131,163,195,227,258]
  lengthExtra = [0,0,0,0,0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,0]
  distanceBase = [1,2,3,4,5,7,9,13,17,25,33,49,65,97,129,193,257,385,513,769,1025,1537,2049,3073,4097,6145,8193,12289,16385,24577]
  distanceExtra = [0,0,0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13]
  position = 0
  finalBlock = 0
  while finalBlock == 0
    finalBlock = readBits(reader, 1)
    kind = readBits(reader, 2)
    if kind == 0 then
      reader.value = 0
      reader.available = 0
      count = readBits(reader, 16)
      complement = readBits(reader, 16)
      if (count ^ complement) != 65535 then return fail("stored block checksum") end if
      if position + count > expectedSize then return fail("stored block exceeds output") end if
      index = 0
      while index < count
        output[position] = readBits(reader, 8)
        position = position + 1
        index = index + 1
      end while
    else
      if kind == 3 then return fail("reserved block type") end if
      trees = void
      if kind == 1 then trees = fixedTrees() else trees = dynamicTrees(reader) end if
      while true
        sym = decodeSymbol(reader, trees[0])
        if sym == 256 then break end if
        if sym < 256 then
          if position >= expectedSize then return fail("literal exceeds output") end if
          output[position] = sym
          position = position + 1
        else
          if sym > 285 then return fail("reserved length sym") end if
          length = lengthBase[sym - 257] + readBits(reader, lengthExtra[sym - 257])
          distanceSymbol = decodeSymbol(reader, trees[1])
          if distanceSymbol >= 30 then return fail("reserved distance sym") end if
          distance = distanceBase[distanceSymbol] + readBits(reader, distanceExtra[distanceSymbol])
          if distance > position or position + length > expectedSize then return fail("backreference outside output") end if
          for index = 0 to length - 1
            output[position] = output[position - distance]
            position = position + 1
          end for
        end if
      end while
    end if
  end while
  if position != expectedSize then return fail("output size mismatch") end if
  if reader.offset != len(data) then return fail("trailing compressed bytes") end if
  return output
end function
