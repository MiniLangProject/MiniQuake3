// SPDX-License-Identifier: GPL-2.0-or-later
// Select local Baseq3 packages by their original protocol-68 PK3 checksums.
package mq3.client.remote_pure
import mq3.compat.numeric as pureNumeric
import mq3.compat.textnumbers as pureNumbers
import mq3.format.pk3 as purePk3
import mq3.qcommon.command_buffer as pureCommands
import mq3.qcommon.filesystem as pureFilesystem
import mq3.qcommon.md4 as pureMd4
import mq3.shared.info as pureInfo
import std.ds.hashmap as pureMap
import std.ds.list as pureList
import std.fs as pureFs
import std.sort as pureSort
import std.string as pureStrings
import std.string_builder as pureBuilder

const MAX_PURE_PACKAGES=128

/// Stores remote pure package record, including `archive`, `pureChecksum`.
struct Package archive pureChecksum end struct
/// Stores remote pure verification record, including `archive`, `command`.
struct Verification archive command end struct

/// Calls `mq3.qcommon.command_buffer.create`, `mq3.qcommon.command_buffer.tokenizeString`, `mq3.qcommon.command_buffer.argc` and additional helpers from remote pure `advertisedChecksums`. The final path returns `checksums`.
/// @param text Text consumed or emitted by `advertisedChecksums` in the remote pure path.
function advertisedChecksums(text)
  command=pureCommands.create()
  pureCommands.tokenizeString(command,text)
  count=pureCommands.argc(command)
  if count>MAX_PURE_PACKAGES then return error(7826,"The server advertises too many PK3 packages") end if
  checksums=array(count,0)
  for index=0 to count-1
    value=pureCommands.argv(command,index)
    checksum=pureNumbers.atoi(value)
    if str(checksum)!=value then return error(7826,"The server sent an invalid PK3 checksum") end if
    checksums[index]=checksum
  end for
  return checksums
end function

/// Calls `mq3.format.pk3.findEntry` from remote pure `checksumForEntry`.
/// @param archive Opened game archive supplying maps, models, textures or other assets. Record read through `archive.path`.
/// @param packages Value used by `for each candidate in packages`.
/// @param name Name used to select or register the corresponding remote pure resource.
function checksumForEntry(archive,packages,name)
  entry=purePk3.findEntry(archive,name)
  if entry==void then return error(7826,"Matching Retail packages are missing "+name) end if
  for each candidate in packages
    if candidate.archive.path==entry.sourcePath then return candidate.pureChecksum end if
  end for
  return error(7826,"No verified PK3 owns "+name)
end function

/// Calls `mq3.client.remote_pure.advertisedChecksums`, `mq3.shared.info.value`, `std.fs.listDir` and additional helpers from remote pure `verify`. The final path returns `Verification(archive,builder.toString())`.
/// @param baseDirectory Value used by `if baseDirectory=="" then return error(7826,"This connection needs a local baseq3 directory for pure PK3 verification") end if`.
/// @param systemInfo Value used by `loaded=advertisedChecksums(pureInfo.value(systemInfo,"sv_paks"))`.
/// @param checksumFeed Value used by `candidates.set(checksum,Package(archive,pureMd4.blockChecksumKey(header,checksumFeed)))`.
/// @param serverId Value used by `builder.append(str(serverId))`.
/// @param map map record passed to the remote pure helper calls.
function verify(baseDirectory,systemInfo,checksumFeed,serverId,map)
  if baseDirectory=="" then return error(7826,"This connection needs a local baseq3 directory for pure PK3 verification") end if
  loaded=advertisedChecksums(pureInfo.value(systemInfo,"sv_paks"))
  required=advertisedChecksums(pureInfo.value(systemInfo,"sv_referencedPaks"))
  if len(loaded)==0 then return error(7826,"The pure server did not advertise its PK3 packages") end if
  names=pureFs.listDir(baseDirectory)
  pureSort.sortBy(names,purePk3.pk3NameLess)
  wanted=pureMap.HashMap.new()
  for each checksum in loaded
    wanted.set(checksum,true)
  end for
  candidates=pureMap.HashMap.new()
  for each name in names
    path=pureFs.joinPath(baseDirectory,name)
    if pureStrings.endsWith(pureStrings.toLowerAscii(name),".pk3") and pureFs.isFile(path) then
      archive=try(purePk3.open(path))
      if archive is error then continue end if
      header=pureFilesystem.crcHeader(archive)
      checksum=pureMd4.blockChecksum(header)
      if wanted.has(checksum) then
        candidates.set(checksum,Package(archive,pureMd4.blockChecksumKey(header,checksumFeed)))
      end if
    end if
  end for
  for each checksum in required
    if not candidates.has(checksum) then return error(7826,"A required server PK3 is missing or differs from the local baseq3 copy") end if
  end for
  selected=pureList.List.withCapacity(len(loaded))
  layers=pureList.List.withCapacity(len(loaded))
  for each checksum in loaded
    candidate=candidates.getOr(checksum,void)
    if candidate!=void then
      candidates.remove(checksum)
      selected.add(candidate)
      layers.add(candidate.archive)
    end if
  end for
  if layers.len()==0 then return error(7826,"No local PK3 matches the pure server") end if
  archive=purePk3.mergeLayers(baseDirectory,layers.toArray(),void)
  if not purePk3.has(archive,"maps/"+map+".bsp") then return error(7826,"The pure server map is unavailable in the approved local PK3 set") end if
  approved=selected.toArray()
  cgame=checksumForEntry(archive,approved,"vm/cgame.qvm")
  ui=checksumForEntry(archive,approved,"vm/ui.qvm")
  builder=pureBuilder.StringBuilder.withCapacity(96+12*len(approved))
  builder.append("cp ")
  builder.append(str(serverId))
  builder.append(" ")
  builder.append(str(cgame))
  builder.append(" ")
  builder.append(str(ui))
  builder.append(" @")
  // This VFS serves exclusively the matching package set. Report every member
  // of that set, including packages whose contents Cgame can request later.
  combined=checksumFeed
  for each candidate in approved
    value=candidate.pureChecksum
    builder.append(" ")
    builder.append(str(value))
    combined=combined^value
  end for
  builder.append(" ")
  builder.append(str(pureNumeric.i32(combined^len(approved))))
  return Verification(archive,builder.toString())
end function
