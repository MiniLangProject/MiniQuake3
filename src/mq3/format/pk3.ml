// SPDX-License-Identifier: GPL-2.0-or-later
// PK3 index, bounded range reads and raw DEFLATE in MiniLang.
package mq3.format.pk3
import mq3.platform.file as file
import mq3.compat.numeric as n
import mq3.format.deflate as deflate
import std.fs as fs
import std.checksum.crc32 as crc

struct Entry
  name
  version
  versionNeeded
  flags
  method
  dosDate
  checksum
  compressedSize
  size
  localOffset
  centralOffset
  centralExtra
  comment
  diskStart
  internalAttributes
  externalAttributes
end struct

struct Archive
  path
  entries
  directoryOffset
  directorySize
  endOffset
  comment
  byteBeforeZip
  nameBuckets
end struct

const NAME_BUCKET_COUNT = 4096

function nameHash(name)
  data=bytes(name);hash=5381
  for index=0 to len(data)-1
    letter=data[index];if letter>=65 and letter<=90 then letter=letter+32 end if
    hash=n.i32(hash*33+letter)
  end for
  return hash&(NAME_BUCKET_COUNT-1)
end function

function fail(message)
  return error(3501, "PK3: " + message)
end function

function u16(data, offset)
  if offset < 0 or offset + 2 > len(data) then return fail("truncated word") end if
  return data[offset] | (data[offset + 1] << 8)
end function

function open(path)
  size = fs.fileSize(path)
  tailSize = size
  if tailSize > 65557 then tailSize = 65557 end if
  if size < 22 then return fail("truncated archive") end if
  tail = file.readRange(path, size - tailSize, tailSize)
  endOffset = -1
  pos = tailSize - 22
  while pos >= 0
    if n.readU32(tail, pos) == 0x06054b50 and pos + 22 + u16(tail, pos + 20) == tailSize then
      endOffset = pos
      break
    end if
    pos = pos - 1
  end while
  if endOffset < 0 then return fail("end directory missing") end if
  if u16(tail, endOffset + 4) != 0 or u16(tail, endOffset + 6) != 0 then return fail("multi-disk archive") end if
  count = u16(tail, endOffset + 10)
  if count != u16(tail, endOffset + 8) then return fail("inconsistent directory count") end if
  directorySize = n.readU32(tail, endOffset + 12)
  directoryOffset = n.readU32(tail, endOffset + 16)
  absoluteEnd = size - tailSize + endOffset
  if directoryOffset + directorySize > absoluteEnd then return fail("directory outside archive") end if
  byteBeforeZip = absoluteEnd - directoryOffset - directorySize
  if byteBeforeZip < 0 then return fail("invalid self-extracting prefix") end if
  absoluteDirectoryOffset = byteBeforeZip + directoryOffset
  directory = file.readRange(path, absoluteDirectoryOffset, directorySize)
  entries = array(count, void)
  pos = 0
  index = 0
  while index < count
    if pos + 46 > directorySize or n.readU32(directory, pos) != 0x02014b50 then return fail("invalid directory entry") end if
    nameLength = u16(directory, pos + 28)
    extraLength = u16(directory, pos + 30)
    commentLength = u16(directory, pos + 32)
    nextPos = pos + 46 + nameLength + extraLength + commentLength
    if nextPos > directorySize then return fail("truncated filename") end if
    if u16(directory, pos + 34) != 0 then return fail("entry on another disk") end if
    name = decode(slice(directory, pos + 46, nameLength))
    centralExtra = slice(directory, pos + 46 + nameLength, extraLength)
    entryComment = decode(slice(directory, pos + 46 + nameLength + extraLength, commentLength))
    entries[index] = Entry(name, u16(directory,pos+4), u16(directory,pos+6), u16(directory,pos+8), u16(directory,pos+10), n.readU32(directory,pos+12), n.readU32(directory,pos+16), n.readU32(directory,pos+20), n.readU32(directory,pos+24), byteBeforeZip+n.readU32(directory,pos+42), absoluteDirectoryOffset+pos, centralExtra, entryComment, u16(directory,pos+34), u16(directory,pos+36), n.readU32(directory,pos+38))
    pos = nextPos
    index = index + 1
  end while
  if pos != directorySize then return fail("directory length mismatch") end if
  archiveComment = decode(slice(tail,endOffset+22,u16(tail,endOffset+20)))
  nameBuckets=array(NAME_BUCKET_COUNT,void)
  for entryIndex=0 to len(entries)-1
    bucketIndex=nameHash(entries[entryIndex].name);if nameBuckets[bucketIndex]==void then nameBuckets[bucketIndex]=[] end if
    nameBuckets[bucketIndex]=nameBuckets[bucketIndex]+[entryIndex]
  end for
  return Archive(path, entries, absoluteDirectoryOffset, directorySize, absoluteEnd, archiveComment, byteBeforeZip, nameBuckets)
end function

function localInfo(archive,entry)
  if entry.localOffset + 30 > archive.directoryOffset then return fail("local header outside archive") end if
  header=file.readRange(archive.path,entry.localOffset,30)
  if n.readU32(header,0)!=0x04034b50 then return fail("invalid local header") end if
  flags=u16(header,6);method=u16(header,8);nameLength=u16(header,26);extraLength=u16(header,28)
  if flags!=entry.flags or method!=entry.method then return fail("local header disagreement") end if
  if method!=0 and method!=8 then return fail("unsupported compression method") end if
  if (flags&8)==0 and (n.readU32(header,14)!=entry.checksum or n.readU32(header,18)!=entry.compressedSize or n.readU32(header,22)!=entry.size) then return fail("local size or CRC disagreement") end if
  if nameLength!=len(bytes(entry.name)) then return fail("local filename length disagreement") end if
  variableEnd=entry.localOffset+30+nameLength+extraLength
  if variableEnd>archive.directoryOffset then return fail("local fields outside archive") end if
  localName=decode(file.readRange(archive.path,entry.localOffset+30,nameLength))
  if localName!=entry.name then return fail("local filename disagreement") end if
  return [variableEnd,file.readRange(archive.path,entry.localOffset+30+nameLength,extraLength)]
end function

function readEntry(archive, entry)
  if (entry.flags & 1) != 0 then return fail("encrypted entry") end if
  if entry.method != 0 and entry.method != 8 then return fail("unsupported compression method") end if
  local=localInfo(archive,entry)
  if local is error then return local end if
  dataOffset=local[0]
  if dataOffset + entry.compressedSize > archive.directoryOffset then return fail("compressed data outside archive") end if
  data = file.readRange(archive.path, dataOffset, entry.compressedSize)
  if entry.method == 8 then data = deflate.inflate(data, entry.size) end if
  if len(data) != entry.size then return fail("entry size mismatch") end if
  if n.u32(crc.compute(data)) != entry.checksum then return fail("CRC mismatch") end if
  return data
end function

function read(archive, name)
  bucket=archive.nameBuckets[nameHash(name)]
  if bucket!=void then for each entryIndex in bucket
    entry=archive.entries[entryIndex];if stringEqualsIgnoreCaseAscii(entry.name,name) then return readEntry(archive,entry) end if
  end for end if
  return fail("file not found " + name)
end function
