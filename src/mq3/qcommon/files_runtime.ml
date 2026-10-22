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

const MAX_FILE_HANDLES=64
const FS_READ=0
const FS_WRITE=1
const FS_APPEND=2
const FS_APPEND_SYNC=3

struct Handle active name mode data position path dirty sync zipFile unique end struct
struct OpenResult length handle end struct
struct InPak found checksum end struct
struct FileList count names packed end struct
struct Config basePath homePath cdPath baseGame gameDir restrict end struct
struct Runtime fs handles config initialized loadStack lastGameDir context listModsFn commandFn end struct

extern function GetFileAttributesW(name as wstr) from "kernel32.dll" returns u32
extern function CreateDirectoryW(name as wstr,security as ptr) from "kernel32.dll" returns bool
extern function DeleteFileW(name as wstr) from "kernel32.dll" returns bool
extern function MoveFileExW(oldName as wstr,newName as wstr,flags as u32) from "kernel32.dll" returns bool

function blankHandle() return Handle(false,"",FS_READ,bytes(0,0),0,"",false,false,false,false) end function
function create(basePath,homePath,cdPath,gameDir,feed)
  handles=array(MAX_FILE_HANDLES,void);for index=0 to MAX_FILE_HANDLES-1 handles[index]=blankHandle() end for
  config=Config(basePath,homePath,cdPath,"baseq3",gameDir,false)
  return Runtime(paths.create(feed),handles,config,false,0,gameDir,void,void,void)
end function

function fs_Initialized(state) return state!=void and state.initialized end function
function fs_PakIsPure(state,pak) return paths.pakIsPure(state.fs,pak) end function
function fs_LoadStack(state) if state==void then return 0 end if;return state.loadStack end function
function fs_HashFileName(fname,hashSize)
  if hashSize<=0 or (hashSize&(hashSize-1))!=0 then return error(7660,"FS_HashFileName hash size") end if
  hash=0;data=bytes(fname);index=0
  while index<len(data) value=data[index];if value==46 then break end if;if value>=65 and value<=90 then value=value+32 end if;if value==92 then value=47 end if;hash=hash+value*(index+119);index=index+1 end while
  return (hash^(hash>>10)^(hash>>20))&(hashSize-1)
end function
function fs_HandleForFile(state) for index=1 to MAX_FILE_HANDLES-1 if not state.handles[index].active then return index end if end for;return error(7661,"FS_HandleForFile: none free") end function
function fs_FileForHandle(state,number) if number<=0 or number>=MAX_FILE_HANDLES or not state.handles[number].active then return error(7662,"FS_FileForHandle: invalid handle") end if;if state.handles[number].zipFile then return error(7663,"FS_FileForHandle: zip handle") end if;return state.handles[number] end function
function fs_ForceFlush(state,number) handle=fs_FileForHandle(state,number);if handle is error then return handle end if;handle.sync=true;return fs_Flush(state,number) end function

function fs_ReplaceSeparators(value) data=bytes(value);for index=0 to len(data)-1 if data[index]==47 or data[index]==92 then data[index]=92 end if end for;return decode(data) end function
function fs_ConvertPath(value) data=bytes(value);for index=0 to len(data)-1 if data[index]==92 or data[index]==58 then data[index]=47 end if end for;return decode(data) end function
function fs_BuildOSPath(base,game,qpath) result=base;if game!="" then if len(result)>0 and result[len(result)-1]!="\\" and result[len(result)-1]!="/" then result=result+"\\" end if;result=result+game end if;if qpath!="" then if len(result)>0 and result[len(result)-1]!="\\" and result[len(result)-1]!="/" then result=result+"\\" end if;result=result+qpath end if;return fs_ReplaceSeparators(result) end function
function fs_CreatePath(osPath)
  converted=fs_ReplaceSeparators(osPath);data=bytes(converted)
  for index=0 to len(data)-1 if data[index]==92 and index>2 then directory=decode(slice(data,0,index));if GetFileAttributesW(directory)==0xffffffff then CreateDirectoryW(directory,0) end if end if end for;return false
end function
function fs_CopyFile(fromPath,toPath) data=hostfs.readAllBytes(fromPath);if data is error then return false end if;fs_CreatePath(toPath);result=try(hostfs.writeAllBytes(toPath,data));return not (result is error) end function
function fs_Remove(osPath) return DeleteFileW(osPath) end function
function fs_Rename(state,fromName,toName) fromPath=fs_BuildOSPath(state.config.homePath,state.config.gameDir,fromName);toPath=fs_BuildOSPath(state.config.homePath,state.config.gameDir,toName);fs_CreatePath(toPath);if MoveFileExW(fromPath,toPath,1) then return true end if;if fs_CopyFile(fromPath,toPath) then fs_Remove(fromPath);return true end if;return false end function
function fs_SV_Rename(state,fromName,toName) fromPath=fs_BuildOSPath(state.config.homePath,fromName,"");toPath=fs_BuildOSPath(state.config.homePath,toName,"");fs_CreatePath(toPath);if MoveFileExW(fromPath,toPath,1) then return true end if;if fs_CopyFile(fromPath,toPath) then fs_Remove(fromPath);return true end if;return false end function
function fs_SV_FileExists(state,name) return GetFileAttributesW(fs_BuildOSPath(state.config.homePath,name,""))!=0xffffffff end function

function activate(state,number,name,mode,data,path,zipFile,unique)
  handle=state.handles[number];handle.active=true;handle.name=name;handle.mode=mode;handle.data=data;handle.position=0;handle.path=path;handle.dirty=false;handle.sync=mode==FS_APPEND_SYNC;handle.zipFile=zipFile;handle.unique=unique;if mode==FS_APPEND or mode==FS_APPEND_SYNC then handle.position=len(data) end if;return number
end function
function fs_FOpenFileRead(state,filename,uniqueFile)
  data=try(paths.read(state.fs,filename));if data is error then return OpenResult(-1,0) end if;number=fs_HandleForFile(state);if number is error then return number end if;activate(state,number,filename,FS_READ,data,"",false,uniqueFile);return OpenResult(len(data),number)
end function
function fs_SV_FOpenFileRead(state,filename)
  candidates=[fs_BuildOSPath(state.config.homePath,filename,""),fs_BuildOSPath(state.config.basePath,filename,""),fs_BuildOSPath(state.config.cdPath,filename,"")]
  for each path in candidates data=try(hostfs.readAllBytes(path));if not (data is error) then number=fs_HandleForFile(state);activate(state,number,filename,FS_READ,data,path,false,true);return OpenResult(len(data),number) end if end for;return OpenResult(-1,0)
end function
function openWrite(state,filename,mode,server)
  base=state.config.homePath;game=state.config.gameDir;if server then game="" end if;path=fs_BuildOSPath(base,game,filename);data=bytes(0,0)
  if mode==FS_APPEND or mode==FS_APPEND_SYNC then old=try(hostfs.readAllBytes(path));if not (old is error) then data=old end if end if
  fs_CreatePath(path);number=fs_HandleForFile(state);activate(state,number,filename,mode,data,path,false,true);return number
end function
function fs_FOpenFileWrite(state,filename) return openWrite(state,filename,FS_WRITE,false) end function
function fs_FOpenFileAppend(state,filename) return openWrite(state,filename,FS_APPEND,false) end function
function fs_SV_FOpenFileWrite(state,filename) return openWrite(state,filename,FS_WRITE,true) end function
function fs_FOpenFileByMode(state,qpath,mode)
  if mode==FS_READ then return fs_FOpenFileRead(state,qpath,true) end if
  number=0;if mode==FS_WRITE then number=fs_FOpenFileWrite(state,qpath) else number=openWrite(state,qpath,mode,false) end if;return OpenResult(0,number)
end function
function fs_FCloseFile(state,number) if number<=0 or number>=MAX_FILE_HANDLES then return false end if;handle=state.handles[number];if not handle.active then return false end if;if handle.dirty then fs_Flush(state,number) end if;state.handles[number]=blankHandle();return true end function
function fclose(state,number) return fs_FCloseFile(state,number) end function
function readable(state,number) return number>0 and number<MAX_FILE_HANDLES and state.handles[number].active and state.handles[number].mode==FS_READ end function
function write(state,number) return number>0 and number<MAX_FILE_HANDLES and state.handles[number].active and state.handles[number].mode!=FS_READ end function
function file(state,number) return fs_FileForHandle(state,number) end function

function fs_Read(state,count,number)
  if not readable(state,number) or count<0 then return error(7664,"FS_Read invalid handle or count") end if;handle=state.handles[number];amount=count;if handle.position+amount>len(handle.data) then amount=len(handle.data)-handle.position end if;if amount<0 then amount=0 end if
  result=bytes(0,0);if amount>0 then result=slice(handle.data,handle.position,amount) end if;handle.position=handle.position+amount;return result
end function
function fs_Read2(state,count,number) return fs_Read(state,count,number) end function
function replaceRange(data,offset,value)
  size=offset+len(value);if size<len(data) then size=len(data) end if;result=bytes(size,0);if len(data)>0 then for index=0 to len(data)-1 result[index]=data[index] end for end if;if len(value)>0 then for index=0 to len(value)-1 result[offset+index]=value[index] end for end if;return result
end function
function fs_Write(state,data,number)
  if not write(state,number) then return error(7665,"FS_Write invalid handle") end if;value=data;if typeof(value)=="string" then value=bytes(value) end if;handle=state.handles[number];handle.data=replaceRange(handle.data,handle.position,value);handle.position=handle.position+len(value);handle.dirty=true;if handle.sync then fs_Flush(state,number) end if;return len(value)
end function
function fs_Printf(state,number,text) return fs_Write(state,bytes(text),number) end function
function fs_Flush(state,number) if number<=0 or number>=MAX_FILE_HANDLES then return false end if;handle=state.handles[number];if not handle.active or handle.mode==FS_READ then return false end if;result=try(hostfs.writeAllBytes(handle.path,handle.data));if result is error then return false end if;handle.dirty=false;return true end function
function fs_Seek(state,number,offset,origin)
  if number<=0 or number>=MAX_FILE_HANDLES or not state.handles[number].active then return -1 end if;handle=state.handles[number];position=offset;if origin==1 then position=handle.position+offset else if origin==2 then position=len(handle.data)+offset end if;if position<0 then position=0 end if;if position>len(handle.data) then position=len(handle.data) end if;handle.position=position;return 0
end function
function fs_FTell(state,number) if number<=0 or number>=MAX_FILE_HANDLES or not state.handles[number].active then return -1 end if;return state.handles[number].position end function

function fs_ReadFile(state,qpath) state.loadStack=state.loadStack+1;data=try(paths.read(state.fs,qpath));state.loadStack=state.loadStack-1;if data is error then return void end if;return data end function
function fs_FreeFile(state,data) if data==void then return error(7666,"FS_FreeFile NULL") end if;return 0 end function
function fs_WriteFile(state,qpath,data) handle=fs_FOpenFileWrite(state,qpath);if handle is error then return false end if;fs_Write(state,data,handle);return fs_FCloseFile(state,handle) end function
function fs_FileIsInPAK(state,filename)
  wanted=paths.normalize(filename);for each search in state.fs.paths if search.kind==1 and paths.pakIsPure(state.fs,search.pak) then for each entry in search.pak.archive.entries if stringEqualsIgnoreCaseAscii(paths.normalize(entry.name),wanted) then return InPak(true,search.pak.pureChecksum) end if end for end if end for;return InPak(false,0)
end function

function fs_FilenameCompare(a,b) return not stringEqualsIgnoreCaseAscii(fs_ConvertPath(a),fs_ConvertPath(b)) end function
function fs_ShiftedStrStr(text,encoded,shift) data=bytes(encoded);for index=0 to len(data)-1 data[index]=data[index]+shift end for;needle=decode(data);at=strings.indexOf(text,needle,0);if at<0 then return "" end if;return strings.substr(text,at,len(text)-at) end function
function fs_PathCmp(a,b)
  left=bytes(strings.toLowerAscii(fs_ConvertPath(a)));right=bytes(strings.toLowerAscii(fs_ConvertPath(b)));count=len(left);if len(right)<count then count=len(right) end if
  for index=0 to count-1 if left[index]<right[index] then return -1 else if left[index]>right[index] then return 1 end if end for;if len(left)<len(right) then return -1 else if len(left)>len(right) then return 1 end if;return 0
end function
function pathLess(a,b) return fs_PathCmp(a,b)<0 end function
function fs_SortFileList(values,numFiles) sort.sortBy(values,pathLess);return values end function
function paksort(a,b) return fs_PathCmp(a,b) end function
function fs_ReturnPath(name) converted=fs_ConvertPath(name);data=bytes(converted);depth=0;last=-1;for index=0 to len(data)-1 if data[index]==47 then depth=depth+1;last=index end if end for;path="";if last>=0 then path=decode(slice(data,0,last)) end if;return [len(path),path,depth] end function
function fs_AddFileToList(name,values) for each old in values if not fs_FilenameCompare(old,name) then return values end if end for;if len(values)>=4095 then return values end if;return values+[name] end function
function filterName(name,filter) if filter==void or filter=="" then return true end if;return strings.indexOf(strings.toLowerAscii(name),strings.toLowerAscii(filter),0)>=0 end function
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
function fs_ListFiles(state,path,extension) return fs_ListFilteredFiles(state,path,extension,"") end function
function fs_FreeFileList(values) return 0 end function
function packList(values,capacity)
  output=bytes(capacity,0);offset=0;count=0;for each value in values data=bytes(value);needed=len(data)+1;if offset+needed>capacity then break end if;for index=0 to len(data)-1 output[offset+index]=data[index] end for;offset=offset+needed;count=count+1 end for;return FileList(count,values,output)
end function
function fs_GetFileList(state,path,extension,capacity) if path=="$modlist" then return fs_GetModList(state,capacity) end if;return packList(fs_ListFiles(state,path,extension),capacity) end function
function sys_CountFileList(values) if values==void then return 0 end if;return len(values) end function
function sys_ConcatenateFileLists(first,second,third) result=[];if first!=void then result=result+first end if;if second!=void then result=result+second end if;if third!=void then result=result+third end if;return result end function
function fs_GetModList(state,capacity) values=[];if state.listModsFn!=void then values=state.listModsFn(state.context,[state.config.basePath,state.config.cdPath,state.config.homePath]) end if;return packList(values,capacity) end function

function fs_LoadZipFile(path,basename,feed) return paths.loadPak(path,basename,feed) end function
function fs_AddGameDirectory(state,path,game) return paths.mountHostGameDirectory(state.fs,path,game) end function
function fs_idPak(pak,base) return paths.idPak(pak,base) end function
function joinValues(values) text="";for each value in values if text!="" then text=text+" " end if;text=text+str(value) end for;return text end function
function fs_LoadedPakChecksums(state) return joinValues(paths.loadedPakChecksums(state.fs)) end function
function fs_LoadedPakNames(state) return joinValues(paths.loadedPakNames(state.fs)) end function
function fs_LoadedPakPureChecksums(state) return joinValues(paths.loadedPakPureChecksums(state.fs)) end function
function fs_ReferencedPakChecksums(state) return joinValues(paths.referencedPakChecksums(state.fs)) end function
function fs_ReferencedPakNames(state) return joinValues(paths.referencedPakNames(state.fs)) end function
function fs_ReferencedPakPureChecksums(state) return joinValues(paths.referencedPakPureTokens(state.fs)) end function
function fs_GamePureChecksum(state) value=paths.qagamePakChecksum(state.fs);if value==void then return "" end if;return str(value) end function
function fs_ClearPakReferences(state,flags) return paths.clearPakReferences(state.fs,flags) end function
function parseNumbers(text) result=[];for each part in strings.split(strings.trim(text)," ") if part!="" then result=result+[numbers.atoi(part)] end if end for;return result end function
function parseNames(text) result=[];for each part in strings.split(strings.trim(text)," ") if part!="" then result=result+[part] end if end for;return result end function
function reorderPure(state)
  if len(state.fs.serverPakChecksums)==0 then return 0 end if;ordered=[];rest=[]
  for each checksum in state.fs.serverPakChecksums for each search in state.fs.paths if search.kind==1 and search.pak.checksum==checksum then ordered=ordered+[search] end if end for end for
  for each search in state.fs.paths found=false;for each old in ordered if old==search then found=true end if end for;if not found then rest=rest+[search] end if end for;state.fs.paths=ordered+rest;return len(ordered)
end function
function fs_PureServerSetLoadedPaks(state,sums,names) paths.setPureServerPakInfo(state.fs,parseNumbers(sums),parseNames(names));reorderPure(state);return len(state.fs.serverPakChecksums) end function
function fs_PureServerSetReferencedPaks(state,sums,names) paths.setPureServerReferencedPaks(state.fs,parseNumbers(sums),parseNames(names));return len(state.fs.serverReferencedPakChecksums) end function

function fs_Startup(state,gameName)
  state.fs.paths=[];games=[gameName]
  if state.config.baseGame!="" and not stringEqualsIgnoreCaseAscii(state.config.baseGame,gameName) then games=games+[state.config.baseGame] end if
  if state.config.gameDir!="" and not contains(games,state.config.gameDir) then games=games+[state.config.gameDir] end if
  roots=[state.config.cdPath,state.config.basePath,state.config.homePath]
  for each game in games seen=[];for each root in roots if root!="" and not contains(seen,root) then fs_AddGameDirectory(state,root,game);seen=seen+[root] end if end for end for
  state.lastGameDir=state.config.gameDir;state.initialized=true;return len(state.fs.paths)
end function
function contains(values,value) for each old in values if stringEqualsIgnoreCaseAscii(old,value) then return true end if end for;return false end function
function fs_SetRestrictions(state) state.config.restrict=true;return true end function
function fs_Shutdown(state,closeMissingFile) for index=1 to MAX_FILE_HANDLES-1 if state.handles[index].active then fs_FCloseFile(state,index) end if end for;state.fs.paths=[];state.initialized=false;return 0 end function
function fs_Restart(state,checksumFeed) oldLoaded=state.initialized;fs_Shutdown(state,false);state.fs.checksumFeed=n.i32(checksumFeed);paths.clearPakReferences(state.fs,0);fs_Startup(state,state.config.baseGame);return oldLoaded end function
function fs_ConditionalRestart(state,checksumFeed) if n.i32(checksumFeed)!=state.fs.checksumFeed or state.lastGameDir!=state.config.gameDir then fs_Restart(state,checksumFeed);return true end if;return false end function
function fs_InitFilesystem(state) fs_Startup(state,state.config.baseGame);fs_SetRestrictions(state);return state.initialized end function
function cvars(state) return state.config end function

function fs_Dir_f(state,path,extension) return fs_ListFiles(state,path,extension) end function
function fs_NewDir_f(state,filter) values=fs_ListFilteredFiles(state,"","",filter);return fs_SortFileList(values,len(values)) end function
function fs_Path_f(state) result=[];for each search in state.fs.paths if search.kind==1 then result=result+[search.pak.archive.path] else result=result+[fs_BuildOSPath(search.root,search.gameName,"")] end if end for;return result end function
function fs_TouchFile_f(state,name) opened=fs_FOpenFileRead(state,name,false);if opened.handle!=0 then fs_FCloseFile(state,opened.handle) end if;return opened.length end function
