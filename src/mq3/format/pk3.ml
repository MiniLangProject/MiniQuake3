// SPDX-License-Identifier: GPL-2.0-or-later
// PK3 index, bounded range reads and raw DEFLATE in MiniLang.
package mq3.format.pk3
import mq3.platform.file as file
import mq3.compat.numeric as n
import mq3.format.deflate as deflate
import std.fs as fs
import std.checksum.crc32 as crc
import std.ds.list as lists
import std.sort as sort
import std.string as strings

/// Entry record for format.pk3, containing `name`, `version`, `versionNeeded`, `flags`, `method`, `dosDate`, and 12 further fields.
struct Entry
  /// Entry path exactly as decoded from ZIP metadata; lookup ignores ASCII case but does not rewrite separators.
  name
  /// ZIP creator version recorded in the central-directory entry.
  version
  /// Minimum ZIP reader version required to extract the entry.
  versionNeeded
  /// ZIP general-purpose flags controlling the entry encoding.
  flags
  /// ZIP compression-method identifier.
  method
  /// Packed MS-DOS date and time of the ZIP entry.
  dosDate
  /// CRC-32 of the uncompressed ZIP entry, checked by readEntry for archive-backed data.
  checksum
  /// Length of the compressed ZIP entry data in bytes.
  compressedSize
  /// Length of the uncompressed entry data in bytes.
  size
  /// Absolute byte offset of the local header in sourcePath, including any prefix before the ZIP data.
  localOffset
  /// Absolute byte offset of this entry's central-directory record in sourcePath.
  centralOffset
  /// Extra-field bytes stored in the central-directory record.
  centralExtra
  /// Per-entry ZIP comment decoded from the central-directory record.
  comment
  /// Disk number containing the start of this ZIP entry.
  diskStart
  /// Internal ZIP file-attribute bits.
  internalAttributes
  /// External platform-specific ZIP file-attribute bits.
  externalAttributes
  /// Filesystem path of the containing PK3, or of the file itself for a loose-file entry.
  sourcePath
  /// Absolute byte offset of the source PK3's central directory; -1 identifies a loose file.
  sourceDirectoryOffset
end struct

/// Archive record for format.pk3, containing `path`, `entries`, `directoryOffset`, `directorySize`, `endOffset`, `comment`, and 3 further fields.
struct Archive
  /// PK3 filename for a single archive, or the caller's root directory for a merged search view.
  path
  /// Central-directory entries available for asset lookup.
  entries
  /// Byte offset of the central directory.
  directoryOffset
  /// Length of the central directory in bytes.
  directorySize
  /// Byte offset of the end-of-central-directory record.
  endOffset
  /// Archive-wide ZIP comment; empty for synthetic merged search views.
  comment
  /// Number of bytes preceding the ZIP data in a self-extracting or embedded archive.
  byteBeforeZip
  /// Hash buckets accelerating entry lookup by normalized name.
  nameBuckets
  /// Active-game Archive retained by overlay; void when no separate mod archive is attached.
  modArchive
end struct

/// Number of hash buckets used to find archive entries by name.
const NAME_BUCKET_COUNT = 4096

/// Compute name hash in format.pk3; the normal completion returns `(hash & (NAME_BUCKET_COUNT - 1))`.
/// @param name Name used in `bytes(name)`.
function nameHash(name)
  data=bytes(name);hash=5381
  for index=0 to len(data)-1
    letter=data[index];if letter>=65 and letter<=90 then letter=letter+32 end if
    hash=n.i32(hash*33+letter)
  end for
  return hash&(NAME_BUCKET_COUNT-1)
end function

/// Compute freeze name buckets in format.pk3; the normal completion returns `buckets`.
/// @param builders Builders used in `builders[bucketIndex]` and `(builders[bucketIndex] != void)`.
function freezeNameBuckets(builders)
  buckets=array(NAME_BUCKET_COUNT,void)
  for bucketIndex=0 to NAME_BUCKET_COUNT-1
    if builders[bucketIndex]!=void then buckets[bucketIndex]=builders[bucketIndex].toArray() end if
  end for
  return buckets
end function

/// Build name buckets in format.pk3; the normal completion returns `freezeNameBuckets(builders)`.
/// @param entries Entries used in `len(entries)` and `entries[entryIndex]`.
function buildNameBuckets(entries)
  builders=array(NAME_BUCKET_COUNT,void)
  entryIndex=0
  while entryIndex<len(entries)
    bucketIndex=nameHash(entries[entryIndex].name)
    if builders[bucketIndex]==void then builders[bucketIndex]=lists.List.withCapacity(4) end if
    builders[bucketIndex].add(entryIndex)
    entryIndex=entryIndex+1
  end while
  return freezeNameBuckets(builders)
end function

/// Create the format.pk3 error for `fail` with 3501 and the supplied diagnostic text.
/// @param message Message used in `("PK3: " + message)` and `error(3501, ("PK3: " + message))`.
function fail(message)
  return error(3501, "PK3: " + message)
end function

/// Compute u 16 in format.pk3; the normal completion returns `(data[offset] | (data[(offset + 1)] << 8))`.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function u16(data, offset)
  if offset < 0 or offset + 2 > len(data) then return fail("truncated word") end if
  return data[offset] | (data[offset + 1] << 8)
end function

/// Read a PK3's ZIP directory and build a case-insensitive name index without extracting file payloads.
/// Rejects malformed directory bounds, inconsistent entry counts, and multi-disk
/// archives. Adjusts local-header offsets for any prefix before the ZIP data.
/// Compression support, local-header agreement, and payload CRCs are checked
/// when an entry is read. Returns an Archive or the encountered file/PK3 error.
/// @param path Filesystem path of the PK3 file to index.
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
    entries[index] = Entry(name, u16(directory,pos+4), u16(directory,pos+6), u16(directory,pos+8), u16(directory,pos+10), n.readU32(directory,pos+12), n.readU32(directory,pos+16), n.readU32(directory,pos+20), n.readU32(directory,pos+24), byteBeforeZip+n.readU32(directory,pos+42), absoluteDirectoryOffset+pos, centralExtra, entryComment, u16(directory,pos+34), u16(directory,pos+36), n.readU32(directory,pos+38), path, absoluteDirectoryOffset)
    pos = nextPos
    index = index + 1
  end while
  if pos != directorySize then return fail("directory length mismatch") end if
  archiveComment = decode(slice(tail,endOffset+22,u16(tail,endOffset+20)))
  nameBuckets=buildNameBuckets(entries)
  return Archive(path, entries, absoluteDirectoryOffset, directorySize, absoluteEnd, archiveComment, byteBeforeZip, nameBuckets, void)
end function

// Mount the standard Baseq3 patch set with the same higher-pak precedence as
// Quake III.  The retail CD has pak0/pak1; patched 1.32 installations may
// provide through pak8.  Duplicate qpaths are indexed only once.
/// @param baseDirectory Base directory passed as `baseDirectory` to `mq3.format.pk3.openPackages`.
function openStandard(baseDirectory)
  return openPackages(baseDirectory,true)
end function

/// Merge archive search layers, retaining the first entry for each ASCII-case-insensitive path.
/// Layers are supplied in priority order: later duplicates are discarded.
/// The result retains the selected Entry records and their original source paths;
/// it does not copy payloads or write a new archive.
/// @param path Root path recorded on the synthetic Archive.
/// @param archives Archive records ordered from highest to lowest search priority.
/// @param modArchive Active-game Archive to retain on the result, or void.
function mergeLayers(path,archives,modArchive)
  totalEntries=0
  for each archive in archives totalEntries=totalEntries+len(archive.entries) end for
  merged=lists.List.withCapacity(totalEntries);seen=array(NAME_BUCKET_COUNT,void)
  for each archive in archives
    for each entry in archive.entries
      bucketIndex=nameHash(entry.name);bucket=seen[bucketIndex];duplicate=false
      if bucket!=void then for position=0 to bucket.len()-1
        if stringEqualsIgnoreCaseAscii(merged.get(bucket.get(position)).name,entry.name) then duplicate=true;break end if
      end for end if
      if not duplicate then
        merged.add(entry)
        if bucket==void then bucket=lists.List.withCapacity(4);seen[bucketIndex]=bucket end if
        bucket.add(merged.len()-1)
      end if
    end for
  end for
  return Archive(path,merged.toArray(),0,0,0,"",0,freezeNameBuckets(seen),modArchive)
end function

/// Open packages in format.pk3; the normal completion returns `mergeLayers(baseDirectory, archives, void)`.
/// @param baseDirectory Initial `path` field stored in the returned or constructed `mq3.format.pk3.Archive` record.
/// @param requirePak0 Require pak 0 used in `(requirePak0 and not hasPak0)`.
function openPackages(baseDirectory,requirePak0)
  names=try(fs.listDir(baseDirectory));if names is error then return fail("base directory not found "+baseDirectory) end if
  pakNames=lists.List.withCapacity(len(names));hasPak0=false
  for each name in names
    lower=strings.toLowerAscii(name)
    if strings.endsWith(lower,".pk3") and fs.isFile(fs.joinPath(baseDirectory,name)) then
      pakNames.add(name);if lower=="pak0.pk3" then hasPak0=true end if
    end if
  end for
  if requirePak0 and not hasPak0 then return fail("required retail archive not found "+baseDirectory+"/pak0.pk3") end if
  if pakNames.len()==0 then return Archive(baseDirectory,[],0,0,0,"",0,void,void) end if
  sortedNames=pakNames.toArray();sort.sortBy(sortedNames,pk3NameLess)
  archives=array(len(sortedNames),void);archiveIndex=len(sortedNames)-1
  for each name in sortedNames
    path=fs.joinPath(baseDirectory,name);archive=try(open(path));if archive is error then return archive end if
    archives[archiveIndex]=archive;archiveIndex=archiveIndex-1
  end for
  if len(archives)==1 then return archives[0] end if
  return mergeLayers(baseDirectory,archives,void)
end function

/// Create `mq3.format.pk3.Entry` with name=name; version=0; versionNeeded=0; flags=0; 14 further fields.
/// @param name Initial `name` field stored in the returned or constructed `mq3.format.pk3.Entry` record.
/// @param path Initial `sourcePath` field stored in the returned or constructed `mq3.format.pk3.Entry` record.
/// @param size Initial `compressedSize` field stored in the returned or constructed `mq3.format.pk3.Entry` record.
function looseEntry(name,path,size)
  return Entry(name,0,0,0,0,0,0,size,size,0,0,bytes(0,0),"",0,0,0,path,-1)
end function
/// Compute with loose in format.pk3; the normal completion returns `mergeLayers(root, [packages, loose], void)`.
/// @param root Initial `path` field stored in the returned or constructed `mq3.format.pk3.Archive` record.
/// @param packages Packages used in `mergeLayers(root, [packages, loose], void)`.
/// @param looseEntries Initial `entries` field stored in the returned or constructed `mq3.format.pk3.Archive` record.
function withLoose(root,packages,looseEntries)
  if len(looseEntries)==0 then return packages end if
  loose=Archive(root,looseEntries,0,0,0,"",0,void,void)
  return mergeLayers(root,[packages,loose],void)
end function
/// Return `mq3.format.pk3.mergeLayers(root, [activeGame, base], activeGame)` from `format.pk3.overlay`.
/// @param root Path passed as `path` to `mq3.format.pk3.mergeLayers`.
/// @param base Base used in `mergeLayers(root, [activeGame, base], activeGame)`.
/// @param activeGame Mod archive passed as `modArchive` to `mq3.format.pk3.mergeLayers`.
function overlay(root,base,activeGame)
  return mergeLayers(root,[activeGame,base],activeGame)
end function

/// Compute pk3 name less in format.pk3; the normal completion returns `(len(a) < len(b))`.
/// @param left Left used in `strings.toLowerAscii(left)` and `bytes(strings.toLowerAscii(left))`.
/// @param right Right used in `strings.toLowerAscii(right)` and `bytes(strings.toLowerAscii(right))`.
function pk3NameLess(left,right)
  a=bytes(strings.toLowerAscii(left));b=bytes(strings.toLowerAscii(right));count=len(a);if len(b)<count then count=len(b) end if
  for index=0 to count-1 if a[index]<b[index] then return true else if a[index]>b[index] then return false end if end for
  return len(a)<len(b)
end function

/// Validate an entry's local ZIP header and return its absolute payload offset and local extra-field bytes.
/// Checks compression method, flags, filename, and bounds against the source
/// central directory. Local sizes and CRC must also agree unless flag bit 3
/// indicates a data descriptor. Returns a PK3 error on disagreement.
/// @param archive Reserved argument; this implementation does not read its value.
/// @param entry Record exposing `localOffset`, `sourceDirectoryOffset`, `sourcePath`, `flags`, `method`, `checksum`, `compressedSize` and further fields.
function localInfo(archive,entry)
  if entry.localOffset + 30 > entry.sourceDirectoryOffset then return fail("local header outside archive") end if
  header=file.readRange(entry.sourcePath,entry.localOffset,30)
  if n.readU32(header,0)!=0x04034b50 then return fail("invalid local header") end if
  flags=u16(header,6);method=u16(header,8);nameLength=u16(header,26);extraLength=u16(header,28)
  if flags!=entry.flags or method!=entry.method then return fail("local header disagreement") end if
  if method!=0 and method!=8 then return fail("unsupported compression method") end if
  if (flags&8)==0 and (n.readU32(header,14)!=entry.checksum or n.readU32(header,18)!=entry.compressedSize or n.readU32(header,22)!=entry.size) then return fail("local size or CRC disagreement") end if
  if nameLength!=len(bytes(entry.name)) then return fail("local filename length disagreement") end if
  variableEnd=entry.localOffset+30+nameLength+extraLength
  if variableEnd>entry.sourceDirectoryOffset then return fail("local fields outside archive") end if
  localFields=file.readRange(entry.sourcePath,entry.localOffset+30,nameLength+extraLength)
  localName=decode(slice(localFields,0,nameLength))
  if localName!=entry.name then return fail("local filename disagreement") end if
  return [variableEnd,slice(localFields,nameLength,extraLength)]
end function

/// Load an entry's bytes, decompressing and checking its size and CRC for archive-backed entries.
/// Supports stored and raw-DEFLATE ZIP entries and rejects encrypted data.
/// A loose-file entry is read directly from sourcePath without ZIP validation.
/// Returns the loaded byte buffer or the encountered file, PK3, or inflate error.
/// @param archive Archive passed to the local-header helper; each Entry retains its actual source file.
/// @param entry Indexed ZIP entry or looseEntry record to read.
function readEntry(archive, entry)
  if entry.sourceDirectoryOffset==-1 then return fs.readAllBytes(entry.sourcePath) end if
  if (entry.flags & 1) != 0 then return fail("encrypted entry") end if
  if entry.method != 0 and entry.method != 8 then return fail("unsupported compression method") end if
  local=localInfo(archive,entry)
  if local is error then return local end if
  dataOffset=local[0]
  if dataOffset + entry.compressedSize > entry.sourceDirectoryOffset then return fail("compressed data outside archive") end if
  data = file.readRange(entry.sourcePath, dataOffset, entry.compressedSize)
  if entry.method == 8 then data = deflate.inflate(data, entry.size) end if
  if len(data) != entry.size then return fail("entry size mismatch") end if
  if n.u32(crc.compute(data)) != entry.checksum then return fail("CRC mismatch") end if
  return data
end function

/// Find an indexed entry by ASCII-case-insensitive path, returning void when no match is available.
/// A missing archive/index, non-string name, or empty name also returns void.
/// @param archive Archive with populated nameBuckets and entries.
/// @param name Entry path using the separators stored in the archive; separators are not normalized here.
function findEntry(archive,name)
  if archive==void or archive.nameBuckets==void or typeof(name)!="string" or name=="" then return void end if
  bucket=archive.nameBuckets[nameHash(name)]
  if bucket!=void then for each entryIndex in bucket
    entry=archive.entries[entryIndex];if stringEqualsIgnoreCaseAscii(entry.name,name) then return entry end if
  end for end if
  return void
end function
/// Compute format.pk3.has as `(findEntry(archive, name) != void)`.
/// @param archive Archive passed as `archive` to `mq3.format.pk3.findEntry`.
/// @param name Name passed as `name` to `mq3.format.pk3.findEntry`.
function has(archive,name) return findEntry(archive,name)!=void end function
/// Resolve an entry path and return its loaded bytes; missing entries produce PK3 error 3501.
/// File access, ZIP validation, and decompression failures propagate from readEntry.
/// @param archive Single archive or merged search view with a name index.
/// @param name Entry path matched without regard to ASCII letter case.
function read(archive,name)
  entry=findEntry(archive,name)
  if entry!=void then return readEntry(archive,entry) end if
  return fail("file not found " + name)
end function
