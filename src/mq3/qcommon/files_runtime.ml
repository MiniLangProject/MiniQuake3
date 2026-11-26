// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native facade for code/qcommon/files.c.
package mq3.qcommon.files_runtime

import mq3.compat.numeric as n
import mq3.compat.textnumbers as numbers
import mq3.qcommon.filesystem as paths
import std.fs as hostfs
import std.sort as sort
import std.string as strings

/// Maximum number of simultaneous virtual-filesystem file handles.
const MAX_FILE_HANDLES=64
/// File-open mode requesting read access.
const FS_READ=0
/// File-open mode requesting replacement write access.
const FS_WRITE=1
/// File-open mode that appends writes to existing file contents.
const FS_APPEND=2
/// File-open mode that appends writes and flushes them synchronously.
const FS_APPEND_SYNC=3

/// Handle record for qcommon.files_runtime, containing `active`, `name`, `mode`, `data`, `position`, `path`, and 4 further fields.
struct Handle
  /// True while this entry participates in the active runtime.
  active
  /// Virtual filesystem name used when opening this file.
  name
  /// Read, write, or append mode selected when the handle was opened.
  mode
  /// Buffered contents of the open file or decoded archive entry.
  data
  /// Current cursor within the parsed token sequence or open file.
  position
  /// Resolved host filesystem path for a loose file.
  path
  /// True when buffered writes have not yet been flushed to the host file.
  dirty
  /// True when writes should be flushed synchronously.
  sync
  /// True when the handle reads an entry inside a PK3 archive.
  zipFile
  /// True when the open operation requests a separately owned file stream.
  unique
end struct
/// OpenResult record for qcommon.files_runtime, containing `length`, `handle`.
struct OpenResult
  /// Length of the opened file in bytes, or an error sentinel.
  length
  /// Managed file handle returned by the open operation.
  handle
end struct
/// InPak record for qcommon.files_runtime, containing `found`, `checksum`.
struct InPak
  /// True when the requested lookup produced a matching entry.
  found
  /// Checksum used to validate or identify the represented data.
  checksum
end struct
/// FileList record for qcommon.files_runtime, containing `count`, `names`, `packed`.
struct FileList
  /// Number of valid entries represented by this result.
  count
  /// Matching virtual filenames returned by the directory enumeration.
  names
  /// NUL-separated filename bytes prepared for VM ABI output.
  packed
end struct
/// Config record for qcommon.files_runtime, containing `basePath`, `homePath`, `cdPath`, `baseGame`, `gameDir`, `restrict`.
struct Config
  /// Base installation path used to locate game assets.
  basePath
  /// Writable user-data path searched for configuration and assets.
  homePath
  /// Optional read-only game-media path.
  cdPath
  /// Name of the base-game asset directory.
  baseGame
  /// Currently selected modification or game directory.
  gameDir
  /// True when filesystem access is restricted by the configured package policy.
  restrict
end struct
/// Runtime record for qcommon.files_runtime, containing `fs`, `handles`, `config`, `initialized`, `loadStack`, `lastGameDir`, and 3 further fields.
struct Runtime
  /// Mounted package and search-path state.
  fs
  /// Managed file handles available to engine and VM callers.
  handles
  /// Configuration object supplying the settings used by this runtime.
  config
  /// True while virtual-filesystem search paths and runtime state are active.
  initialized
  /// Nesting count of temporary whole-file loads.
  loadStack
  /// Game directory used by the preceding filesystem initialization.
  lastGameDir
  /// Caller-supplied data associated with filesystem mod enumeration and host console command
  /// registration.
  context
  /// Host callback that enumerates available game modification directories.
  listModsFn
  /// Host callback that executes a command through the host command interface.
  commandFn
end struct

/// Read Win32 file or directory attributes for qcommon.files_runtime.
/// @param name Null-terminated UTF-16 filesystem path.
/// @returns The file-attribute bitmask, or INVALID_FILE_ATTRIBUTES (0xffffffff) on failure.
extern function GetFileAttributesW(name as wstr) from "kernel32.dll" returns u32
/// Create one filesystem directory through the Win32 runtime.
/// @param name Null-terminated UTF-16 directory path.
/// @param security SECURITY_ATTRIBUTES pointer, or null for default security.
/// @returns Nonzero on success; zero on failure, including an already existing directory.
extern function CreateDirectoryW(name as wstr,security as ptr) from "kernel32.dll" returns bool
/// Request deletion of the named filesystem file.
/// @param name Null-terminated UTF-16 file path.
/// @returns Nonzero when deletion is accepted; zero on failure.
extern function DeleteFileW(name as wstr) from "kernel32.dll" returns bool
/// Move or replace a filesystem file with the requested Win32 move flags.
/// @param oldName Null-terminated UTF-16 existing path.
/// @param newName Null-terminated UTF-16 destination path.
/// @param flags MOVEFILE_* option bitmask controlling replacement and move semantics.
/// @returns Nonzero when the requested operation succeeds; zero on failure.
extern function MoveFileExW(oldName as wstr,newName as wstr,flags as u32) from "kernel32.dll" returns bool

/// Create `mq3.qcommon.files_runtime.Handle` with active=false; name=""; mode=FS_READ; data=bytes(0, 0); position=0; path=""; dirty=false; sync=false; zipFile=false; unique=false.
function blankHandle() return Handle(false,"",FS_READ,bytes(0,0),0,"",false,false,false,false) end function
/// Create files runtime in qcommon.files_runtime; the normal completion returns `Runtime(paths.create(feed), handles, config, false, 0, gameDir, void, void, void)`.
/// @param basePath Initial `basePath` field stored in the returned or constructed `mq3.qcommon.files_runtime.Config` record.
/// @param homePath Initial `homePath` field stored in the returned or constructed `mq3.qcommon.files_runtime.Config` record.
/// @param cdPath Initial `cdPath` field stored in the returned or constructed `mq3.qcommon.files_runtime.Config` record.
/// @param gameDir Initial `gameDir` field stored in the returned or constructed `mq3.qcommon.files_runtime.Config` record.
/// @param feed Feed passed as `feed` to `mq3.qcommon.filesystem.create`.
function create(basePath,homePath,cdPath,gameDir,feed)
  handles=array(MAX_FILE_HANDLES,void);for index=0 to MAX_FILE_HANDLES-1 handles[index]=blankHandle() end for
  config=Config(basePath,homePath,cdPath,"baseq3",gameDir,false)
  return Runtime(paths.create(feed),handles,config,false,0,gameDir,void,void,void)
end function

/// Compute qcommon.files_runtime.fs_Initialized as `((state != void) and state.initialized)`.
/// @param state Record exposing `initialized`.
function fs_Initialized(state) return state!=void and state.initialized end function
/// Return `mq3.qcommon.filesystem.pakIsPure(state.fs, pak)` from `qcommon.files_runtime.fs_PakIsPure`.
/// @param state Record exposing `fs`.
/// @param pak Pak passed as `pak` to `mq3.qcommon.filesystem.pakIsPure`.
function fs_PakIsPure(state,pak) return paths.pakIsPure(state.fs,pak) end function
/// Load stack in qcommon.files_runtime; the normal completion returns `state.loadStack`.
/// @param state Record exposing `loadStack`.
function fs_LoadStack(state) if state==void then return 0 end if;return state.loadStack end function
/// Compute hash file name in qcommon.files_runtime; the normal completion returns `(((hash ^ (hash >> 10)) ^ (hash >> 20)) & (hashSize - 1))`.
///
/// Validation failures include `FS_HashFileName hash size`.
/// @param fname Fname used in `bytes(fname)`.
/// @param hashSize Hash size used in `(hashSize - 1)` and `(hashSize <= 0)`.
function fs_HashFileName(fname,hashSize)
  if hashSize<=0 or (hashSize&(hashSize-1))!=0 then return error(7660,"FS_HashFileName hash size") end if
  hash=0;data=bytes(fname);index=0
  while index<len(data) value=data[index];if value==46 then break end if;if value>=65 and value<=90 then value=value+32 end if;if value==92 then value=47 end if;hash=hash+value*(index+119);index=index+1 end while
  return (hash^(hash>>10)^(hash>>20))&(hashSize-1)
end function
/// Handle for file in qcommon.files_runtime; the normal completion returns `error(7661, "FS_HandleForFile: none free")`.
///
/// Validation failures include `FS_HandleForFile: none free`.
/// @param state Record exposing `handles`.
function fs_HandleForFile(state) for index=1 to MAX_FILE_HANDLES-1 if not state.handles[index].active then return index end if end for;return error(7661,"FS_HandleForFile: none free") end function
/// Compute file for handle in qcommon.files_runtime; the normal completion returns `state.handles[number]`.
///
/// Validation failures include `FS_FileForHandle: invalid handle`; `FS_FileForHandle: zip handle`.
/// @param state Record exposing `handles`.
/// @param number Zero-based index into `state.handles`.
function fs_FileForHandle(state,number) if number<=0 or number>=MAX_FILE_HANDLES or not state.handles[number].active then return error(7662,"FS_FileForHandle: invalid handle") end if;if state.handles[number].zipFile then return error(7663,"FS_FileForHandle: zip handle") end if;return state.handles[number] end function
/// Compute force flush in qcommon.files_runtime; the normal completion returns `fs_Flush(state, number)`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_FileForHandle`.
/// @param number Number passed as `number` to `mq3.qcommon.files_runtime.fs_FileForHandle`.
function fs_ForceFlush(state,number) handle=fs_FileForHandle(state,number);if handle is error then return handle end if;handle.sync=true;return fs_Flush(state,number) end function

/// Compute replace separators in qcommon.files_runtime; the normal completion returns `decode(data)`.
/// @param value Value used in `bytes(value)`.
function fs_ReplaceSeparators(value) data=bytes(value);for index=0 to len(data)-1 if data[index]==47 or data[index]==92 then data[index]=92 end if end for;return decode(data) end function
/// Compute convert path in qcommon.files_runtime; the normal completion returns `decode(data)`.
/// @param value Value used in `bytes(value)`.
function fs_ConvertPath(value) data=bytes(value);for index=0 to len(data)-1 if data[index]==92 or data[index]==58 then data[index]=47 end if end for;return decode(data) end function
/// Build os path in qcommon.files_runtime; the normal completion returns `fs_ReplaceSeparators(result)`.
/// @param base Base operand used by `fs_BuildOSPath`; its reads are shown in the implementation.
/// @param game Game used in `(game != "")` and `(result + game)`.
/// @param qpath Qpath used in `(qpath != "")` and `(result + qpath)`.
function fs_BuildOSPath(base,game,qpath) result=base;if game!="" then if len(result)>0 and result[len(result)-1]!="\\" and result[len(result)-1]!="/" then result=result+"\\" end if;result=result+game end if;if qpath!="" then if len(result)>0 and result[len(result)-1]!="\\" and result[len(result)-1]!="/" then result=result+"\\" end if;result=result+qpath end if;return fs_ReplaceSeparators(result) end function
/// Validate q path in qcommon.files_runtime; the normal completion returns `true`.
/// @param value Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`.
function fs_ValidQPath(value)
  if typeof(value)!="string" or value=="" then return false end if
  if strings.indexOf(value,":",0)>=0 then return false end if
  converted=fs_ConvertPath(value)
  if strings.startsWith(converted,"/") then return false end if
  if strings.indexOf(converted,"..",0)>=0 then return false end if
  return true
end function
/// Create path in qcommon.files_runtime; the normal completion returns `false`.
/// @param osPath Value passed as `value` to `mq3.qcommon.files_runtime.fs_ReplaceSeparators`.
function fs_CreatePath(osPath)
  converted=fs_ReplaceSeparators(osPath);data=bytes(converted)
  for index=0 to len(data)-1 if data[index]==92 and index>2 then directory=decode(slice(data,0,index));if GetFileAttributesW(directory)==0xffffffff then CreateDirectoryW(directory,0) end if end if end for;return false
end function
/// Copy file in qcommon.files_runtime; the normal completion returns `not (typeof(result) == "error")`.
/// @param fromPath From path used in `hostfs.readAllBytes(fromPath)`.
/// @param toPath Os path passed as `osPath` to `mq3.qcommon.files_runtime.fs_CreatePath`.
function fs_CopyFile(fromPath,toPath) data=hostfs.readAllBytes(fromPath);if data is error then return false end if;fs_CreatePath(toPath);result=try(hostfs.writeAllBytes(toPath,data));return not (result is error) end function
/// Return `mq3.qcommon.files_runtime.DeleteFileW(osPath)` from `qcommon.files_runtime.fs_Remove`.
/// @param osPath Null-terminated UTF-16 file path.
function fs_Remove(osPath) return DeleteFileW(osPath) end function
/// Test rename in qcommon.files_runtime; the normal completion returns `false`.
/// @param state Record exposing `config`.
/// @param fromName Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`.
/// @param toName Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`.
function fs_Rename(state,fromName,toName) if not fs_ValidQPath(fromName) or not fs_ValidQPath(toName) then return false end if;fromPath=fs_BuildOSPath(state.config.homePath,state.config.gameDir,fromName);toPath=fs_BuildOSPath(state.config.homePath,state.config.gameDir,toName);fs_CreatePath(toPath);if MoveFileExW(fromPath,toPath,1) then return true end if;if fs_CopyFile(fromPath,toPath) then fs_Remove(fromPath);return true end if;return false end function
/// Test sv rename in qcommon.files_runtime; the normal completion returns `false`.
/// @param state Record exposing `config`.
/// @param fromName Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`.
/// @param toName Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`.
function fs_SV_Rename(state,fromName,toName) if not fs_ValidQPath(fromName) or not fs_ValidQPath(toName) then return false end if;fromPath=fs_BuildOSPath(state.config.homePath,fromName,"");toPath=fs_BuildOSPath(state.config.homePath,toName,"");fs_CreatePath(toPath);if MoveFileExW(fromPath,toPath,1) then return true end if;if fs_CopyFile(fromPath,toPath) then fs_Remove(fromPath);return true end if;return false end function
/// Compute sv file exists in qcommon.files_runtime; the normal completion returns `(GetFileAttributesW(fs_BuildOSPath(state.config.homePath, name, "")) != 4294967295)`.
/// @param state Record exposing `config`.
/// @param name Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`.
function fs_SV_FileExists(state,name) if not fs_ValidQPath(name) then return false end if;return GetFileAttributesW(fs_BuildOSPath(state.config.homePath,name,""))!=0xffffffff end function

/// Compute activate in qcommon.files_runtime; the normal completion returns `number`.
/// @param state Record exposing `handles`.
/// @param number Zero-based index into `state.handles`.
/// @param name Name operand used by `activate`; its reads are shown in the implementation.
/// @param mode Mode used in `(mode == FS_APPEND)` and `(mode == FS_APPEND_SYNC)`.
/// @param data Data used in `len(data)`.
/// @param path Path operand used by `activate`; its reads are shown in the implementation.
/// @param zipFile Zip file operand used by `activate`; its reads are shown in the implementation.
/// @param unique Unique operand used by `activate`; its reads are shown in the implementation.
function activate(state,number,name,mode,data,path,zipFile,unique)
  handle=state.handles[number];handle.active=true;handle.name=name;handle.mode=mode;handle.data=data;handle.position=0;handle.path=path;handle.dirty=false;handle.sync=mode==FS_APPEND_SYNC;handle.zipFile=zipFile;handle.unique=unique;if mode==FS_APPEND or mode==FS_APPEND_SYNC then handle.position=len(data) end if;return number
end function
/// Compute f open file read in qcommon.files_runtime; the normal completion returns `OpenResult(len(data), number)`.
/// @param state Record exposing `fs`.
/// @param filename Qpath passed as `qpath` to `mq3.qcommon.filesystem.read`.
/// @param uniqueFile Unique passed as `unique` to `mq3.qcommon.files_runtime.activate`.
function fs_FOpenFileRead(state,filename,uniqueFile)
  data=try(paths.read(state.fs,filename));if data is error then return OpenResult(-1,0) end if;number=fs_HandleForFile(state);if number is error then return number end if;activate(state,number,filename,FS_READ,data,"",false,uniqueFile);return OpenResult(len(data),number)
end function
/// Compute sv f open file read in qcommon.files_runtime; the normal completion returns `OpenResult(- 1, 0)`.
/// @param state Record exposing `config`.
/// @param filename Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`.
function fs_SV_FOpenFileRead(state,filename)
  if not fs_ValidQPath(filename) then return OpenResult(-1,0) end if
  candidates=[fs_BuildOSPath(state.config.homePath,filename,""),fs_BuildOSPath(state.config.basePath,filename,""),fs_BuildOSPath(state.config.cdPath,filename,"")]
  for each path in candidates data=try(hostfs.readAllBytes(path));if not (data is error) then number=fs_HandleForFile(state);activate(state,number,filename,FS_READ,data,path,false,true);return OpenResult(len(data),number) end if end for;return OpenResult(-1,0)
end function
/// Open write in qcommon.files_runtime; the normal completion returns `number`.
///
/// Validation failures include `FS write path escapes game directory`.
/// @param state Record exposing `config`.
/// @param filename Value passed as `value` to `mq3.qcommon.files_runtime.fs_ValidQPath`.
/// @param mode Mode passed as `mode` to `mq3.qcommon.files_runtime.activate`.
/// @param server Server operand used by `openWrite`; its reads are shown in the implementation.
function openWrite(state,filename,mode,server)
  if not fs_ValidQPath(filename) then return error(7667,"FS write path escapes game directory") end if
  base=state.config.homePath;game=state.config.gameDir;if server then game="" end if;path=fs_BuildOSPath(base,game,filename);data=bytes(0,0)
  if mode==FS_APPEND or mode==FS_APPEND_SYNC then old=try(hostfs.readAllBytes(path));if not (old is error) then data=old end if end if
  fs_CreatePath(path);number=fs_HandleForFile(state);activate(state,number,filename,mode,data,path,false,true);return number
end function
/// Return `mq3.qcommon.files_runtime.openWrite(state, filename, FS_WRITE, false)` from `qcommon.files_runtime.fs_FOpenFileWrite`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.openWrite`.
/// @param filename Filename passed as `filename` to `mq3.qcommon.files_runtime.openWrite`.
function fs_FOpenFileWrite(state,filename) return openWrite(state,filename,FS_WRITE,false) end function
/// Return `mq3.qcommon.files_runtime.openWrite(state, filename, FS_APPEND, false)` from `qcommon.files_runtime.fs_FOpenFileAppend`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.openWrite`.
/// @param filename Filename passed as `filename` to `mq3.qcommon.files_runtime.openWrite`.
function fs_FOpenFileAppend(state,filename) return openWrite(state,filename,FS_APPEND,false) end function
/// Return `mq3.qcommon.files_runtime.openWrite(state, filename, FS_WRITE, true)` from `qcommon.files_runtime.fs_SV_FOpenFileWrite`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.openWrite`.
/// @param filename Filename passed as `filename` to `mq3.qcommon.files_runtime.openWrite`.
function fs_SV_FOpenFileWrite(state,filename) return openWrite(state,filename,FS_WRITE,true) end function
/// Compute f open file by mode in qcommon.files_runtime; the normal completion returns `OpenResult(0, number)`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_FOpenFileRead`.
/// @param qpath Filename passed as `filename` to `mq3.qcommon.files_runtime.fs_FOpenFileRead`.
/// @param mode Mode passed as `mode` to `mq3.qcommon.files_runtime.openWrite`.
function fs_FOpenFileByMode(state,qpath,mode)
  if mode==FS_READ then return fs_FOpenFileRead(state,qpath,true) end if
  number=0;if mode==FS_WRITE then number=fs_FOpenFileWrite(state,qpath) else number=openWrite(state,qpath,mode,false) end if;return OpenResult(0,number)
end function
/// Test f close file in qcommon.files_runtime; the normal completion returns `true`.
/// @param state Record exposing `handles`.
/// @param number Number passed as `number` to `mq3.qcommon.files_runtime.fs_Flush`.
function fs_FCloseFile(state,number) if number<=0 or number>=MAX_FILE_HANDLES then return false end if;handle=state.handles[number];if not handle.active then return false end if;if handle.dirty then fs_Flush(state,number) end if;state.handles[number]=blankHandle();return true end function
/// Return `mq3.qcommon.files_runtime.fs_FCloseFile(state, number)` from `qcommon.files_runtime.fclose`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_FCloseFile`.
/// @param number Number passed as `number` to `mq3.qcommon.files_runtime.fs_FCloseFile`.
function fclose(state,number) return fs_FCloseFile(state,number) end function
/// Compute qcommon.files_runtime.readable as `((((number > 0) and (number < MAX_FILE_HANDLES)) and state.handles[number].active) and (state.handles[number].mode == FS_READ))`.
/// @param state Record exposing `handles`.
/// @param number Zero-based index into `state.handles`.
function readable(state,number) return number>0 and number<MAX_FILE_HANDLES and state.handles[number].active and state.handles[number].mode==FS_READ end function
/// Compute qcommon.files_runtime.write as `((((number > 0) and (number < MAX_FILE_HANDLES)) and state.handles[number].active) and (state.handles[number].mode != FS_READ))`.
/// @param state Record exposing `handles`.
/// @param number Zero-based index into `state.handles`.
function write(state,number) return number>0 and number<MAX_FILE_HANDLES and state.handles[number].active and state.handles[number].mode!=FS_READ end function
/// Return `mq3.qcommon.files_runtime.fs_FileForHandle(state, number)` from `qcommon.files_runtime.file`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_FileForHandle`.
/// @param number Number passed as `number` to `mq3.qcommon.files_runtime.fs_FileForHandle`.
function file(state,number) return fs_FileForHandle(state,number) end function

/// Read files runtime in qcommon.files_runtime; the normal completion returns `result`.
///
/// Validation failures include `FS_Read invalid handle or count`.
/// @param state Record exposing `handles`.
/// @param count Count used in `(count < 0)` and `(not readable(state, number) or (count < 0))`.
/// @param number Number passed as `number` to `mq3.qcommon.files_runtime.readable`.
function fs_Read(state,count,number)
  if not readable(state,number) or count<0 then return error(7664,"FS_Read invalid handle or count") end if;handle=state.handles[number];amount=count;if handle.position+amount>len(handle.data) then amount=len(handle.data)-handle.position end if;if amount<0 then amount=0 end if
  result=bytes(0,0);if amount>0 then result=slice(handle.data,handle.position,amount) end if;handle.position=handle.position+amount;return result
end function
/// Return `mq3.qcommon.files_runtime.fs_Read(state, count, number)` from `qcommon.files_runtime.fs_Read2`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_Read`.
/// @param count Count passed as `count` to `mq3.qcommon.files_runtime.fs_Read`.
/// @param number Number passed as `number` to `mq3.qcommon.files_runtime.fs_Read`.
function fs_Read2(state,count,number) return fs_Read(state,count,number) end function
/// Compute replace range in qcommon.files_runtime; the normal completion returns `result`.
/// @param data Data used in `len(data)` and `data[index]`.
/// @param offset Offset used in `(offset + index)` and `(offset + len(value))`.
/// @param value Value used in `len(value)` and `value[index]`.
function replaceRange(data,offset,value)
  size=offset+len(value);if size<len(data) then size=len(data) end if;result=bytes(size,0);if len(data)>0 then for index=0 to len(data)-1 result[index]=data[index] end for end if;if len(value)>0 then for index=0 to len(value)-1 result[offset+index]=value[index] end for end if;return result
end function
/// Write files runtime in qcommon.files_runtime; the normal completion returns `len(value)`.
///
/// Validation failures include `FS_Write invalid handle`.
/// @param state Record exposing `handles`.
/// @param data Data used in `replaceRange(handle.data, handle.position, value)`.
/// @param number Number passed as `number` to `mq3.qcommon.files_runtime.write`.
function fs_Write(state,data,number)
  if not write(state,number) then return error(7665,"FS_Write invalid handle") end if;value=data;if typeof(value)=="string" then value=bytes(value) end if;handle=state.handles[number];handle.data=replaceRange(handle.data,handle.position,value);handle.position=handle.position+len(value);handle.dirty=true;if handle.sync then fs_Flush(state,number) end if;return len(value)
end function
/// Return `mq3.qcommon.files_runtime.fs_Write(state, bytes(text), number)` from `qcommon.files_runtime.fs_Printf`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_Write`.
/// @param number Number passed as `number` to `mq3.qcommon.files_runtime.fs_Write`.
/// @param text Text used in `bytes(text)` and `fs_Write(state, bytes(text), number)`.
function fs_Printf(state,number,text) return fs_Write(state,bytes(text),number) end function
/// Test flush in qcommon.files_runtime; the normal completion returns `true`.
/// @param state Record exposing `handles`.
/// @param number Zero-based index into `state.handles`.
function fs_Flush(state,number) if number<=0 or number>=MAX_FILE_HANDLES then return false end if;handle=state.handles[number];if not handle.active or handle.mode==FS_READ then return false end if;result=try(hostfs.writeAllBytes(handle.path,handle.data));if result is error then return false end if;handle.dirty=false;return true end function
/// Seek files runtime in qcommon.files_runtime; the normal completion returns `0`.
/// @param state Record exposing `handles`.
/// @param number Zero-based index into `state.handles`.
/// @param offset Offset used in `(handle.position + offset)` and `(len(handle.data) + offset)`.
/// @param origin Origin used in `(origin == 1)` and `(origin == 2)`.
function fs_Seek(state,number,offset,origin)
  if number<=0 or number>=MAX_FILE_HANDLES or not state.handles[number].active then return -1 end if;handle=state.handles[number];position=offset;if origin==1 then position=handle.position+offset else if origin==2 then position=len(handle.data)+offset end if;if position<0 then position=0 end if;if position>len(handle.data) then position=len(handle.data) end if;handle.position=position;return 0
end function
/// Compute f tell in qcommon.files_runtime; the normal completion returns `state.handles[number].position`.
/// @param state Record exposing `handles`.
/// @param number Zero-based index into `state.handles`.
function fs_FTell(state,number) if number<=0 or number>=MAX_FILE_HANDLES or not state.handles[number].active then return -1 end if;return state.handles[number].position end function

/// Read file in qcommon.files_runtime; the normal completion returns `data`.
///
/// Direct state writes: `state.loadStack`.
/// @param state Record exposing `loadStack`, `fs`. Updated in place: `loadStack`.
/// @param qpath Qpath passed as `qpath` to `mq3.qcommon.filesystem.read`.
function fs_ReadFile(state,qpath) state.loadStack=state.loadStack+1;data=try(paths.read(state.fs,qpath));state.loadStack=state.loadStack-1;if data is error then return void end if;return data end function
/// Compute free file in qcommon.files_runtime; the normal completion returns `0`.
///
/// Validation failures include `FS_FreeFile NULL`.
/// @param state Reserved argument; this implementation does not read its value.
/// @param data Data used in `(data == void)`.
function fs_FreeFile(state,data) if data==void then return error(7666,"FS_FreeFile NULL") end if;return 0 end function
/// Write file in qcommon.files_runtime; the normal completion returns `fs_FCloseFile(state, handle)`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_FOpenFileWrite`.
/// @param qpath Filename passed as `filename` to `mq3.qcommon.files_runtime.fs_FOpenFileWrite`.
/// @param data Data passed as `data` to `mq3.qcommon.files_runtime.fs_Write`.
function fs_WriteFile(state,qpath,data) handle=fs_FOpenFileWrite(state,qpath);if handle is error then return false end if;fs_Write(state,data,handle);return fs_FCloseFile(state,handle) end function
/// Compute file is in pak in qcommon.files_runtime; the normal completion returns `InPak(false, 0)`.
/// @param state Record exposing `fs`.
/// @param filename Virtual game path; leading separators, .., and :: are rejected.
function fs_FileIsInPAK(state,filename)
  wanted=paths.normalize(filename);for each search in state.fs.paths if search.kind==1 and paths.pakIsPure(state.fs,search.pak) then for each entry in search.pak.archive.entries if stringEqualsIgnoreCaseAscii(paths.normalize(entry.name),wanted) then return InPak(true,search.pak.pureChecksum) end if end for end if end for;return InPak(false,0)
end function

/// Compute qcommon.files_runtime.fs_FilenameCompare as `not stringEqualsIgnoreCaseAscii(fs_ConvertPath(a), fs_ConvertPath(b))`.
/// @param a Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`.
/// @param b Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`.
function fs_FilenameCompare(a,b) return not stringEqualsIgnoreCaseAscii(fs_ConvertPath(a),fs_ConvertPath(b)) end function
/// Compute shifted str str in qcommon.files_runtime; the normal completion returns `strings.substr(text, at, (len(text) - at))`.
/// @param text Text used in `len(text)` and `(len(text) - at)`.
/// @param encoded Encoded used in `bytes(encoded)`.
/// @param shift Shift used in `(data[index] + shift)`.
function fs_ShiftedStrStr(text,encoded,shift) data=bytes(encoded);for index=0 to len(data)-1 data[index]=data[index]+shift end for;needle=decode(data);at=strings.indexOf(text,needle,0);if at<0 then return "" end if;return strings.substr(text,at,len(text)-at) end function
/// Compute path cmp in qcommon.files_runtime; the normal completion returns `0`.
/// @param a Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`.
/// @param b Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`.
function fs_PathCmp(a,b)
  left=bytes(strings.toLowerAscii(fs_ConvertPath(a)));right=bytes(strings.toLowerAscii(fs_ConvertPath(b)));count=len(left);if len(right)<count then count=len(right) end if
  for index=0 to count-1 if left[index]<right[index] then return -1 else if left[index]>right[index] then return 1 end if end for;if len(left)<len(right) then return -1 else if len(left)>len(right) then return 1 end if;return 0
end function
/// Compute qcommon.files_runtime.pathLess as `(fs_PathCmp(a, b) < 0)`.
/// @param a A passed as `a` to `mq3.qcommon.files_runtime.fs_PathCmp`.
/// @param b B passed as `b` to `mq3.qcommon.files_runtime.fs_PathCmp`.
function pathLess(a,b) return fs_PathCmp(a,b)<0 end function
/// Compute sort file list in qcommon.files_runtime; the normal completion returns `values`.
/// @param values Values used in `sort.sortBy(values, pathLess)`.
/// @param numFiles Reserved argument; this implementation does not read its value.
function fs_SortFileList(values,numFiles) sort.sortBy(values,pathLess);return values end function
/// Return `mq3.qcommon.files_runtime.fs_PathCmp(a, b)` from `qcommon.files_runtime.paksort`.
/// @param a A passed as `a` to `mq3.qcommon.files_runtime.fs_PathCmp`.
/// @param b B passed as `b` to `mq3.qcommon.files_runtime.fs_PathCmp`.
function paksort(a,b) return fs_PathCmp(a,b) end function
/// Compute return path in qcommon.files_runtime; the normal completion returns `[len(path), path, depth]`.
/// @param name Value passed as `value` to `mq3.qcommon.files_runtime.fs_ConvertPath`.
function fs_ReturnPath(name) converted=fs_ConvertPath(name);data=bytes(converted);depth=0;last=-1;for index=0 to len(data)-1 if data[index]==47 then depth=depth+1;last=index end if end for;path="";if last>=0 then path=decode(slice(data,0,last)) end if;return [len(path),path,depth] end function
/// Add file to list in qcommon.files_runtime; the normal completion returns `(values + [name])`.
/// @param name B passed as `b` to `mq3.qcommon.files_runtime.fs_FilenameCompare`.
/// @param values Values used in `len(values)` and `(values + [name])`.
function fs_AddFileToList(name,values) for each old in values if not fs_FilenameCompare(old,name) then return values end if end for;if len(values)>=4095 then return values end if;return values+[name] end function
/// Compute filter name in qcommon.files_runtime; the normal completion returns `(strings.indexOf(strings.toLowerAscii(name), strings.toLowerAscii(filter), 0) >= 0)`.
/// @param name Name used in `strings.toLowerAscii(name)` and `strings.indexOf(strings.toLowerAscii(name), strings.toLowerAscii(filter), 0)`.
/// @param filter Filter used in `(filter == "")` and `(filter == void)`.
function filterName(name,filter) if filter==void or filter=="" then return true end if;return strings.indexOf(strings.toLowerAscii(name),strings.toLowerAscii(filter),0)>=0 end function
/// Compute list filtered files in qcommon.files_runtime; the normal completion returns `result`.
/// @param state Record exposing `fs`.
/// @param path Path passed as `path` to `mq3.qcommon.filesystem.listFiles`.
/// @param extension Extension passed as `extension` to `mq3.qcommon.filesystem.suffix`.
/// @param filter Filter passed as `filter` to `mq3.qcommon.files_runtime.filterName`.
function fs_ListFilteredFiles(state,path,extension,filter)
  values=[]
  if path=="" then
    for each search in state.fs.paths
      if search.kind==1 and paths.pakIsPure(state.fs,search.pak) then for each entry in search.pak.archive.entries if paths.suffix(entry.name,extension) then values=fs_AddFileToList(entry.name,values) end if end for
      else if search.kind==0 and len(state.fs.serverPakChecksums)==0 then for each name in search.looseFiles if paths.suffix(name,extension) then values=fs_AddFileToList(name,values) end if end for end if
    end for
  else values=paths.listFiles(state.fs,path,extension) end if
  result=[];for each name in values if filterName(name,filter) then result=fs_AddFileToList(name,result) end if end for;return result
end function
/// Return `mq3.qcommon.files_runtime.fs_ListFilteredFiles(state, path, extension, "")` from `qcommon.files_runtime.fs_ListFiles`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_ListFilteredFiles`.
/// @param path Path passed as `path` to `mq3.qcommon.files_runtime.fs_ListFilteredFiles`.
/// @param extension Extension passed as `extension` to `mq3.qcommon.files_runtime.fs_ListFilteredFiles`.
function fs_ListFiles(state,path,extension) return fs_ListFilteredFiles(state,path,extension,"") end function
/// Compute qcommon.files_runtime.fs_FreeFileList as `0`.
/// @param values Reserved argument; this implementation does not read its value.
function fs_FreeFileList(values) return 0 end function
/// Compute pack list in qcommon.files_runtime; the normal completion returns `FileList(count, values, output)`.
/// @param values Initial `names` field stored in the returned or constructed `mq3.qcommon.files_runtime.FileList` record.
/// @param capacity Capacity used in `bytes(capacity, 0)` and `((offset + needed) > capacity)`.
function packList(values,capacity)
  output=bytes(capacity,0);offset=0;count=0;for each value in values data=bytes(value);needed=len(data)+1;if offset+needed>capacity then break end if;for index=0 to len(data)-1 output[offset+index]=data[index] end for;offset=offset+needed;count=count+1 end for;return FileList(count,values,output)
end function
/// Get file list in qcommon.files_runtime; the normal completion returns `packList(fs_ListFiles(state, path, extension), capacity)`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_GetModList`.
/// @param path Path passed as `path` to `mq3.qcommon.files_runtime.fs_ListFiles`.
/// @param extension Extension passed as `extension` to `mq3.qcommon.files_runtime.fs_ListFiles`.
/// @param capacity Capacity passed as `capacity` to `mq3.qcommon.files_runtime.fs_GetModList`.
function fs_GetFileList(state,path,extension,capacity) if path=="$modlist" then return fs_GetModList(state,capacity) end if;return packList(fs_ListFiles(state,path,extension),capacity) end function
/// Compute sys count file list in qcommon.files_runtime; the normal completion returns `len(values)`.
/// @param values Values used in `len(values)` and `(values == void)`.
function sys_CountFileList(values) if values==void then return 0 end if;return len(values) end function
/// Compute sys concatenate file lists in qcommon.files_runtime; the normal completion returns `result`.
/// @param first First used in `(first != void)` and `(result + first)`.
/// @param second Second used in `(second != void)` and `(result + second)`.
/// @param third Third used in `(third != void)` and `(result + third)`.
function sys_ConcatenateFileLists(first,second,third) result=[];if first!=void then result=result+first end if;if second!=void then result=result+second end if;if third!=void then result=result+third end if;return result end function
/// Get mod list in qcommon.files_runtime; the normal completion returns `packList(values, capacity)`.
/// @param state Record exposing `listModsFn`, `context`, `config`.
/// @param capacity Capacity passed as `capacity` to `mq3.qcommon.files_runtime.packList`.
function fs_GetModList(state,capacity) values=[];if state.listModsFn!=void then values=state.listModsFn(state.context,[state.config.basePath,state.config.cdPath,state.config.homePath]) end if;return packList(values,capacity) end function

/// Return `mq3.qcommon.filesystem.loadPak(path, basename, feed)` from `qcommon.files_runtime.fs_LoadZipFile`.
/// @param path Path passed as `path` to `mq3.qcommon.filesystem.loadPak`.
/// @param basename Game name passed as `gameName` to `mq3.qcommon.filesystem.loadPak`.
/// @param feed Feed passed as `feed` to `mq3.qcommon.filesystem.loadPak`.
function fs_LoadZipFile(path,basename,feed) return paths.loadPak(path,basename,feed) end function
/// Return `mq3.qcommon.filesystem.mountHostGameDirectory(state.fs, path, game)` from `qcommon.files_runtime.fs_AddGameDirectory`.
/// @param state Record exposing `fs`.
/// @param path Root passed as `root` to `mq3.qcommon.filesystem.mountHostGameDirectory`.
/// @param game Game name passed as `gameName` to `mq3.qcommon.filesystem.mountHostGameDirectory`.
function fs_AddGameDirectory(state,path,game) return paths.mountHostGameDirectory(state.fs,path,game) end function
/// Return `mq3.qcommon.filesystem.idPak(pak, base)` from `qcommon.files_runtime.fs_idPak`.
/// @param pak Name passed as `name` to `mq3.qcommon.filesystem.idPak`.
/// @param base Base passed as `base` to `mq3.qcommon.filesystem.idPak`.
function fs_idPak(pak,base) return paths.idPak(pak,base) end function
/// Compute join values in qcommon.files_runtime; the normal completion returns `text`.
/// @param values Sequence traversed as `value` by the loop in `joinValues`.
function joinValues(values) text="";for each value in values if text!="" then text=text+" " end if;text=text+str(value) end for;return text end function
/// Return `mq3.qcommon.files_runtime.joinValues(paths.loadedPakChecksums(state.fs))` from `qcommon.files_runtime.fs_LoadedPakChecksums`.
/// @param state Record exposing `fs`.
function fs_LoadedPakChecksums(state) return joinValues(paths.loadedPakChecksums(state.fs)) end function
/// Return `mq3.qcommon.files_runtime.joinValues(paths.loadedPakNames(state.fs))` from `qcommon.files_runtime.fs_LoadedPakNames`.
/// @param state Record exposing `fs`.
function fs_LoadedPakNames(state) return joinValues(paths.loadedPakNames(state.fs)) end function
/// Return `mq3.qcommon.files_runtime.joinValues(paths.loadedPakPureChecksums(state.fs))` from `qcommon.files_runtime.fs_LoadedPakPureChecksums`.
/// @param state Record exposing `fs`.
function fs_LoadedPakPureChecksums(state) return joinValues(paths.loadedPakPureChecksums(state.fs)) end function
/// Return `mq3.qcommon.files_runtime.joinValues(paths.referencedPakChecksums(state.fs))` from `qcommon.files_runtime.fs_ReferencedPakChecksums`.
/// @param state Record exposing `fs`.
function fs_ReferencedPakChecksums(state) return joinValues(paths.referencedPakChecksums(state.fs)) end function
/// Return `mq3.qcommon.files_runtime.joinValues(paths.referencedPakNames(state.fs))` from `qcommon.files_runtime.fs_ReferencedPakNames`.
/// @param state Record exposing `fs`.
function fs_ReferencedPakNames(state) return joinValues(paths.referencedPakNames(state.fs)) end function
/// Return `mq3.qcommon.files_runtime.joinValues(paths.referencedPakPureTokens(state.fs))` from `qcommon.files_runtime.fs_ReferencedPakPureChecksums`.
/// @param state Record exposing `fs`.
function fs_ReferencedPakPureChecksums(state) return joinValues(paths.referencedPakPureTokens(state.fs)) end function
/// Compute game pure checksum in qcommon.files_runtime; the normal completion returns `str(value)`.
/// @param state Record exposing `fs`.
function fs_GamePureChecksum(state) value=paths.qagamePakChecksum(state.fs);if value==void then return "" end if;return str(value) end function
/// Return `mq3.qcommon.filesystem.clearPakReferences(state.fs, flags)` from `qcommon.files_runtime.fs_ClearPakReferences`.
/// @param state Record exposing `fs`.
/// @param flags Flags passed as `flags` to `mq3.qcommon.filesystem.clearPakReferences`.
function fs_ClearPakReferences(state,flags) return paths.clearPakReferences(state.fs,flags) end function
/// Parse numbers in qcommon.files_runtime; the normal completion returns `result`.
/// @param text Text used in `strings.trim(text)` and `strings.split(strings.trim(text), " ")`.
function parseNumbers(text) result=[];for each part in strings.split(strings.trim(text)," ") if part!="" then result=result+[numbers.atoi(part)] end if end for;return result end function
/// Parse names in qcommon.files_runtime; the normal completion returns `result`.
/// @param text Text used in `strings.trim(text)` and `strings.split(strings.trim(text), " ")`.
function parseNames(text) result=[];for each part in strings.split(strings.trim(text)," ") if part!="" then result=result+[part] end if end for;return result end function
/// Compute reorder pure in qcommon.files_runtime; the normal completion returns `len(ordered)`.
/// @param state Record exposing `fs`.
function reorderPure(state)
  if len(state.fs.serverPakChecksums)==0 then return 0 end if;ordered=[];rest=[]
  for each checksum in state.fs.serverPakChecksums for each search in state.fs.paths if search.kind==1 and search.pak.checksum==checksum then ordered=ordered+[search] end if end for end for
  for each search in state.fs.paths found=false;for each old in ordered if old==search then found=true end if end for;if not found then rest=rest+[search] end if end for;state.fs.paths=ordered+rest;return len(ordered)
end function
/// Compute pure server set loaded paks in qcommon.files_runtime; the normal completion returns `len(state.fs.serverPakChecksums)`.
/// @param state Record exposing `fs`.
/// @param sums Text passed as `text` to `mq3.qcommon.files_runtime.parseNumbers`.
/// @param names Text passed as `text` to `mq3.qcommon.files_runtime.parseNames`.
function fs_PureServerSetLoadedPaks(state,sums,names) paths.setPureServerPakInfo(state.fs,parseNumbers(sums),parseNames(names));reorderPure(state);return len(state.fs.serverPakChecksums) end function
/// Compute pure server set referenced paks in qcommon.files_runtime; the normal completion returns `len(state.fs.serverReferencedPakChecksums)`.
/// @param state Record exposing `fs`.
/// @param sums Text passed as `text` to `mq3.qcommon.files_runtime.parseNumbers`.
/// @param names Text passed as `text` to `mq3.qcommon.files_runtime.parseNames`.
function fs_PureServerSetReferencedPaks(state,sums,names) paths.setPureServerReferencedPaks(state.fs,parseNumbers(sums),parseNames(names));return len(state.fs.serverReferencedPakChecksums) end function

/// Update `state.lastGameDir`, `state.initialized` in qcommon.files_runtime; the normal completion returns `len(state.fs.paths)`.
///
/// Direct state writes: `state.lastGameDir`, `state.initialized`.
/// @param state Record exposing `fs`, `config`. Updated in place: `lastGameDir`, `initialized`.
/// @param gameName Game name used in `stringEqualsIgnoreCaseAscii(state.config.baseGame, gameName)` and `((state.config.baseGame != "") and not stringEqualsIgnoreCaseAscii(state.config.baseGame, gameName))`.
function fs_Startup(state,gameName)
  state.fs.paths=[];games=[gameName]
  if state.config.baseGame!="" and not stringEqualsIgnoreCaseAscii(state.config.baseGame,gameName) then games=games+[state.config.baseGame] end if
  if state.config.gameDir!="" and not contains(games,state.config.gameDir) then games=games+[state.config.gameDir] end if
  roots=[state.config.cdPath,state.config.basePath,state.config.homePath]
  for each game in games seen=[];for each root in roots if root!="" and not contains(seen,root) then fs_AddGameDirectory(state,root,game);seen=seen+[root] end if end for end for
  state.lastGameDir=state.config.gameDir;state.initialized=true;return len(state.fs.paths)
end function
/// Test files runtime in qcommon.files_runtime; the normal completion returns `false`.
/// @param values Sequence traversed as `old` by the loop in `contains`.
/// @param value Value used in `stringEqualsIgnoreCaseAscii(old, value)`.
function contains(values,value) for each old in values if stringEqualsIgnoreCaseAscii(old,value) then return true end if end for;return false end function
/// Set restrictions in qcommon.files_runtime; the normal completion returns `true`.
/// @param state Record exposing `config`.
function fs_SetRestrictions(state) state.config.restrict=true;return true end function
/// Update `state.initialized` in qcommon.files_runtime; the normal completion returns `0`.
///
/// Direct state writes: `state.initialized`.
/// @param state Record exposing `handles`, `fs`. Updated in place: `initialized`.
/// @param closeMissingFile Reserved argument; this implementation does not read its value.
function fs_Shutdown(state,closeMissingFile) for index=1 to MAX_FILE_HANDLES-1 if state.handles[index].active then fs_FCloseFile(state,index) end if end for;state.fs.paths=[];state.initialized=false;return 0 end function
/// Compute restart in qcommon.files_runtime; the normal completion returns `oldLoaded`.
/// @param state Record exposing `initialized`, `fs`, `config`.
/// @param checksumFeed Integer whose low 32 bits are retained.
function fs_Restart(state,checksumFeed) oldLoaded=state.initialized;fs_Shutdown(state,false);state.fs.checksumFeed=n.i32(checksumFeed);paths.clearPakReferences(state.fs,0);fs_Startup(state,state.config.baseGame);return oldLoaded end function
/// Test conditional restart in qcommon.files_runtime; the normal completion returns `false`.
/// @param state Record exposing `fs`, `lastGameDir`, `config`.
/// @param checksumFeed Integer whose low 32 bits are retained.
function fs_ConditionalRestart(state,checksumFeed) if n.i32(checksumFeed)!=state.fs.checksumFeed or state.lastGameDir!=state.config.gameDir then fs_Restart(state,checksumFeed);return true end if;return false end function
/// Compute init filesystem in qcommon.files_runtime; the normal completion returns `state.initialized`.
/// @param state Record exposing `config`, `initialized`.
function fs_InitFilesystem(state) fs_Startup(state,state.config.baseGame);fs_SetRestrictions(state);return state.initialized end function
/// Compute qcommon.files_runtime.cvars as `state.config`.
/// @param state Record exposing `config`.
function cvars(state) return state.config end function

/// Return `mq3.qcommon.files_runtime.fs_ListFiles(state, path, extension)` from `qcommon.files_runtime.fs_Dir_f`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_ListFiles`.
/// @param path Path passed as `path` to `mq3.qcommon.files_runtime.fs_ListFiles`.
/// @param extension Extension passed as `extension` to `mq3.qcommon.files_runtime.fs_ListFiles`.
function fs_Dir_f(state,path,extension) return fs_ListFiles(state,path,extension) end function
/// Compute new dir f in qcommon.files_runtime; the normal completion returns `fs_SortFileList(values, len(values))`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_ListFilteredFiles`.
/// @param filter Filter passed as `filter` to `mq3.qcommon.files_runtime.fs_ListFilteredFiles`.
function fs_NewDir_f(state,filter) values=fs_ListFilteredFiles(state,"","",filter);return fs_SortFileList(values,len(values)) end function
/// Compute path f in qcommon.files_runtime; the normal completion returns `result`.
/// @param state Record exposing `fs`.
function fs_Path_f(state) result=[];for each search in state.fs.paths if search.kind==1 then result=result+[search.pak.archive.path] else result=result+[fs_BuildOSPath(search.root,search.gameName,"")] end if end for;return result end function
/// Compute touch file f in qcommon.files_runtime; the normal completion returns `opened.length`.
/// @param state State passed as `state` to `mq3.qcommon.files_runtime.fs_FOpenFileRead`.
/// @param name Filename passed as `filename` to `mq3.qcommon.files_runtime.fs_FOpenFileRead`.
function fs_TouchFile_f(state,name) opened=fs_FOpenFileRead(state,name,false);if opened.handle!=0 then fs_FCloseFile(state,opened.handle) end if;return opened.length end function
