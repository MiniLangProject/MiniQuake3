// SPDX-License-Identifier: GPL-2.0-or-later
// Quake III search-path, PK3 indexing and pure-pak checksum subset.
package mq3.qcommon.filesystem
import mq3.compat.numeric as n
import mq3.format.pk3 as pk3
import mq3.qcommon.md4 as md4
import std.fs as hostfs
import std.sort as sort
import std.string as strings

const FS_GENERAL_REF = 1
const FS_UI_REF = 2
const FS_CGAME_REF = 4
const FS_QAGAME_REF = 8

struct Pak
  archive
  basename
  gameName
  checksum
  pureChecksum
  referenced
end struct

struct SearchPath
  kind
  pak
  root
  gameName
  looseFiles
end struct

struct FileSystem
  paths
  serverPakChecksums
  serverPakNames
  serverReferencedPakChecksums
  serverReferencedPakNames
  checksumFeed
  fakeChecksum
end struct

extern function GetFileAttributesW(name as wstr) from "kernel32.dll" returns u32
extern function FindFirstFileW(name as wstr,data as bytes) from "kernel32.dll" returns ptr
extern function FindNextFileW(handle as ptr,data as bytes) from "kernel32.dll" returns bool
extern function FindClose(handle as ptr) from "kernel32.dll" returns bool

function create(feed)
  return FileSystem([],[],[],[],[],n.i32(feed),0)
end function

function normalize(name)
  data = bytes(name)
  if len(data) == 0 then return "" end if
  if data[0] == 47 or data[0] == 92 then return error(3510,"FS: absolute qpath") end if
  output = bytes(len(data),0)
  for index = 0 to len(data)-1
    value = data[index]
    if value == 92 then value = 47 end if
    if value >= 65 and value <= 90 then value = value+32 end if
    output[index] = value
  end for
  result = decode(output)
  if strings.indexOf(result,"..",0) >= 0 or strings.indexOf(result,"::",0) >= 0 then return error(3510,"FS: invalid qpath") end if
  return result
end function

function filename(path)
  data = bytes(path); start = 0
  for index = 0 to len(data)-1
    if data[index] == 47 or data[index] == 92 then start = index+1 end if
  end for
  return decode(slice(data,start,len(data)-start))
end function

function stripPk3(name)
  data = bytes(name)
  if len(data) > 4 and stringEqualsIgnoreCaseAscii(decode(slice(data,len(data)-4,4)),".pk3") then
    return decode(slice(data,0,len(data)-4))
  end if
  return name
end function

function crcHeader(archive)
  count = 0
  for each entry in archive.entries
    if entry.size > 0 then count = count+1 end if
  end for
  result = bytes(count*4,0); index = 0
  for each entry in archive.entries
    if entry.size > 0 then n.writeU32(result,index*4,entry.checksum); index = index+1 end if
  end for
  return result
end function

function loadPak(path,gameName,feed)
  archive = pk3.open(path); header = crcHeader(archive)
  return Pak(archive,stripPk3(filename(path)),gameName,md4.blockChecksum(header),md4.blockChecksumKey(header,feed),0)
end function

function pathLess(a,b)
  left = bytes(normalize(a)); right = bytes(normalize(b)); count = len(left)
  if len(right) < count then count = len(right) end if
  index = 0
  while index < count
    if left[index] < right[index] then return true end if
    if left[index] > right[index] then return false end if
    index = index+1
  end while
  return len(left) < len(right)
end function

function mountGameDirectory(state,root,gameName,pakPaths,looseFiles)
  sorted = array(len(pakPaths),"")
  for index = 0 to len(pakPaths)-1
    sorted[index] = pakPaths[index]
  end for
  sort.sortBy(sorted,pathLess)
  group = [SearchPath(0,void,root,gameName,looseFiles)]
  for each path in sorted
    group = [SearchPath(1,loadPak(path,gameName,state.checksumFeed),"","",[])]+group
  end for
  state.paths = group+state.paths
  return void
end function

function wideAsciiName(data)
  result = []; index = 44
  while index+1 < len(data) and len(result) < 259
    low = data[index]; high = data[index+1]
    if low == 0 and high == 0 then break end if
    if high != 0 or low >= 128 then return error(3510,"FS: non-ASCII host filename") end if
    result = result+[low]; index = index+2
  end while
  return decode(bytes(result))
end function

function joinHostPath(left,right)
  if len(left) > 0 and (left[len(left)-1] == "\\" or left[len(left)-1] == "/") then return left+right end if
  return left+"\\"+right
end function

function discoverDirectory(directory,prefix)
  paks = []; loose = []; data = bytes(592,0); handle = FindFirstFileW(joinHostPath(directory,"*"),data)
  if handle == -1 then return [paks,loose] end if
  defer FindClose(handle)
  more = true
  while more
    name = wideAsciiName(data)
    if name != "." and name != ".." then
      relative = name; if prefix != "" then relative = prefix+"/"+name end if
      if (n.readU32(data,0) & 0x10) != 0 then
        nested = discoverDirectory(joinHostPath(directory,name),relative)
        paks = paks+nested[0]; loose = loose+nested[1]
      else if prefix == "" and suffix(name,".pk3") then
        paks = paks+[joinHostPath(directory,name)]
      else loose = loose+[relative] end if
    end if
    data = bytes(592,0); more = FindNextFileW(handle,data)
  end while
  return [paks,loose]
end function

function mountHostGameDirectory(state,root,gameName)
  directory = joinHostPath(root,gameName); files = discoverDirectory(directory,"")
  mountGameDirectory(state,root,gameName,files[0],files[1]); return files
end function

function setPureServerPaks(state,checksums)
  state.serverPakChecksums = checksums
  return void
end function

function setPureServerPakInfo(state,checksums,names)
  state.serverPakChecksums = checksums; state.serverPakNames = names; return void
end function

function setPureServerReferencedPaks(state,checksums,names)
  state.serverReferencedPakChecksums = checksums; state.serverReferencedPakNames = names; return void
end function


function pakIsPure(state,pak)
  if len(state.serverPakChecksums) == 0 then return true end if
  for each checksum in state.serverPakChecksums
    if n.i32(checksum) == pak.checksum then return true end if
  end for
  return false
end function

function hostPath(search,name)
  separator = "\\"
  if len(search.root) > 0 and (search.root[len(search.root)-1] == "\\" or search.root[len(search.root)-1] == "/") then separator = "" end if
  return search.root+separator+search.gameName+"\\"+name
end function

function excludedGeneralReference(name)
  return suffix(name,".shader") or suffix(name,".txt") or suffix(name,".cfg") or
    suffix(name,".config") or strings.indexOf(name,"levelshots",0) >= 0 or
    suffix(name,".bot") or suffix(name,".arena") or suffix(name,".menu")
end function

function markReference(pak,name)
  if not excludedGeneralReference(name) then pak.referenced = pak.referenced | FS_GENERAL_REF end if
  if strings.indexOf(name,"qagame.qvm",0) >= 0 then pak.referenced = pak.referenced | FS_QAGAME_REF end if
  if strings.indexOf(name,"cgame.qvm",0) >= 0 then pak.referenced = pak.referenced | FS_CGAME_REF end if
  if strings.indexOf(name,"ui.qvm",0) >= 0 then pak.referenced = pak.referenced | FS_UI_REF end if
  return void
end function

function read(state,qpath)
  wanted = normalize(qpath)
  for each search in state.paths
    if search.kind == 1 then
      if pakIsPure(state,search.pak) then
        for each entry in search.pak.archive.entries
          if stringEqualsIgnoreCaseAscii(normalize(entry.name),wanted) then
            markReference(search.pak,wanted); return pk3.readEntry(search.pak.archive,entry)
          end if
        end for
      end if
    else if len(state.serverPakChecksums) == 0 then
      path = hostPath(search,wanted)
      if GetFileAttributesW(path) != 0xffffffff then return hostfs.readAllBytes(path) end if
    end if
  end for
  return error(3510,"FS: file not found "+qpath)
end function

function suffix(name,extension)
  if len(extension) == 0 then return true end if
  if len(name) < len(extension) then return false end if
  return stringEqualsIgnoreCaseAscii(decode(slice(bytes(name),len(name)-len(extension),len(extension))),extension)
end function

function depthAndLastSlash(name)
  depth = 0; last = 0; data = bytes(name)
  for index = 0 to len(data)-1
    if data[index] == 47 or data[index] == 92 then depth = depth+1; last = index end if
  end for
  return [depth,last]
end function

function addUnique(list,name)
  for each old in list
    if stringEqualsIgnoreCaseAscii(old,name) then return list end if
  end for
  if len(list) >= 4095 then return list end if
  return list+[name]
end function

function listCandidate(list,path,extension,name)
  normalized = normalize(name); pathInfo = depthAndLastSlash(path); info = depthAndLastSlash(normalized)
  pathLength = len(path)
  if pathLength > 0 and path[pathLength-1] == "/" then pathLength = pathLength-1 end if
  if info[0]-pathInfo[0] > 2 or pathLength > info[1] then return list end if
  if pathLength > 0 and not stringEqualsIgnoreCaseAscii(decode(slice(bytes(normalized),0,pathLength)),decode(slice(bytes(path),0,pathLength))) then return list end if
  if not suffix(normalized,extension) then return list end if
  start = pathLength
  if start > 0 then start = start+1 end if
  return addUnique(list,decode(slice(bytes(normalized),start,len(normalized)-start)))
end function

function listFiles(state,path,extension)
  path = normalize(path); result = []
  for each search in state.paths
    if search.kind == 1 then
      if pakIsPure(state,search.pak) then
        for each entry in search.pak.archive.entries
          result = listCandidate(result,path,extension,entry.name)
        end for
      end if
    else if len(state.serverPakChecksums) == 0 then
      for each name in search.looseFiles
        result = listCandidate(result,path,extension,name)
      end for
    end if
  end for
  return result
end function

function loadedPakChecksums(state)
  result = []
  for each search in state.paths
    if search.kind == 1 then result = result+[search.pak.checksum] end if
  end for
  return result
end function

function loadedPakPureChecksums(state)
  result = []
  for each search in state.paths
    if search.kind == 1 then result = result+[search.pak.pureChecksum] end if
  end for
  return result
end function

function loadedPakNames(state)
  result = []
  for each search in state.paths
    if search.kind == 1 then result = result+[search.pak.basename] end if
  end for
  return result
end function


function clearPakReferences(state,flags)
  if flags == 0 then flags = -1 end if
  for each search in state.paths
    if search.kind == 1 then search.pak.referenced = search.pak.referenced & ~flags end if
  end for
  return void
end function

function isBaseGame(gameName)
  return stringEqualsIgnoreCaseAscii(gameName,"baseq3")
end function

function referencedPakChecksums(state)
  result = []
  for each search in state.paths
    if search.kind == 1 and (search.pak.referenced != 0 or not isBaseGame(search.pak.gameName)) then
      result = result+[search.pak.checksum]
    end if
  end for
  return result
end function

function referencedPakNames(state)
  result = []
  for each search in state.paths
    if search.kind == 1 and (search.pak.referenced != 0 or not isBaseGame(search.pak.gameName)) then
      result = result+[search.pak.gameName+"/"+search.pak.basename]
    end if
  end for
  return result
end function

function referencedPakPureTokens(state)
  result = []; checksum = state.checksumFeed; count = 0; flags = [FS_CGAME_REF,FS_UI_REF,FS_GENERAL_REF]
  for each flag in flags
    if flag == FS_GENERAL_REF then result = result+["@"] end if
    for each search in state.paths
      if search.kind == 1 and (search.pak.referenced & flag) != 0 then
        result = result+[search.pak.pureChecksum]
        checksum = checksum ^ search.pak.pureChecksum; count = count+1
        if flag == FS_CGAME_REF or flag == FS_UI_REF then break end if
      end if
    end for
    if state.fakeChecksum != 0 then result = result+[state.fakeChecksum] end if
  end for
  return result+[n.i32(checksum ^ count)]
end function

function qagamePakChecksum(state)
  result = void
  for each search in state.paths
    if search.kind == 1 and (search.pak.referenced & FS_QAGAME_REF) != 0 then result = search.pak.checksum end if
  end for
  return result
end function

struct PakComparison
  needed
  text
end struct

function idPak(name,base)
  normalized = normalize(name)
  for index = 0 to 8
    if stringEqualsIgnoreCaseAscii(normalized,base+"/pak"+str(index)) then return true end if
  end for
  return false
end function

function checksumHex(checksum)
  digits = bytes("0123456789abcdef"); value = n.u32(checksum); output = bytes(8,48)
  for index = 0 to 7
    shift = (7-index)*4; output[index] = digits[(value >> shift) & 15]
  end for
  return decode(output)
end function

function appendCapacity(text,part,capacity)
  if capacity <= 0 then return "" end if
  room = capacity-1-len(bytes(text)); if room <= 0 then return text end if
  data = bytes(part); if len(data) > room then data = slice(data,0,room) end if
  return text+decode(data)
end function

function hasPakChecksum(state,checksum)
  for each search in state.paths
    if search.kind == 1 and n.i32(search.pak.checksum) == n.i32(checksum) then return true end if
  end for
  return false
end function

function comparePaks(state,capacity,downloadString,serverFileExistsFn)
  text = ""; count = len(state.serverReferencedPakChecksums)
  for index = 0 to count-1
    checksum = state.serverReferencedPakChecksums[index]; name = ""
    if index < len(state.serverReferencedPakNames) then name = state.serverReferencedPakNames[index] end if
    if idPak(name,"baseq3") or idPak(name,"missionpack") then continue end if
    if hasPakChecksum(state,checksum) or name == "" then continue end if
    localExists = false
    if serverFileExistsFn != void then localExists = serverFileExistsFn(name+".pk3") end if
    if downloadString then
      text = appendCapacity(text,"@"+name+".pk3@",capacity)
      localName = name+".pk3"
      if localExists then localName = name+"."+checksumHex(checksum)+".pk3" end if
      text = appendCapacity(text,localName,capacity)
    else
      line = name+".pk3"
      if localExists then line = line+" (local file exists with wrong checksum)" end if
      text = appendCapacity(text,line+"\n",capacity)
    end if
  end for
  return PakComparison(text != "",text)
end function
