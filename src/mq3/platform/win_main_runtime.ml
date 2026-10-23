// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive Windows host and deterministic facade for code/win32/win_main.c.
package mq3.platform.win_main_runtime

import std.string as strings

const MEM_THRESHOLD=100663296
const MAX_FOUND_FILES=4096
const MAX_QUED_EVENTS=256
const SE_NONE=0
const SE_KEY=1
const SE_CHAR=2
const SE_MOUSE=3
const SE_JOYSTICK_AXIS=4
const SE_CONSOLE=5
const SE_PACKET=6

extern function lowMemoryNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_low_physical_memory" returns i32
extern function millisecondsNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_milliseconds" returns u32
extern function cwdNative(output as bytes,capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_cwd" returns i32
extern function mkdirNative(path as ptr,length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_mkdir" returns i32
extern function clipboardNative(output as bytes,capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_clipboard" returns i32
extern function scanCdNative(output as bytes,capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_scan_cd" returns i32
extern function spkOpenNative(path as ptr,length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_open" returns i32
extern function spkWriteNative(text as ptr,length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_write" returns i32
extern function spkCloseNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_close" returns void
extern function listFilesNative(directory as ptr,directoryLength as i32,extension as ptr,extensionLength as i32,filter as ptr,filterLength as i32,wantSubs as i32,output as bytes,capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_list_files" returns i32
extern function dllLoadNative(path as ptr,length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_load" returns ptr
extern function dllSymbolNative(handle as ptr,name as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_symbol" returns ptr
extern function dllAttachNative(handle as ptr,systemCalls as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_attach" returns i32
extern function dllUnloadNative(handle as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_unload" returns i32

struct Event time type value value2 ptrLength data end struct
struct Dll handle entryPoint path end struct
struct Stream file data position active readFn seekFn context end struct
struct StreamRead data count end struct
struct Runtime
  commandLine events head tail overflows printed fatal errorText quitCode initialized
  arch cpuString cpuId username consoleVisible inputStarted networkStarted streamStarted
  dlls streams frameCount totalMsec actions
  clockFn pumpFn consoleFn packetFn inputInitFn inputShutdownFn inputFrameFn
  networkInitFn networkRestartFn commonInitFn commonFrameFn createConsoleFn destroyConsoleFn
  showConsoleFn errorConsoleFn sleepFn context
end struct

function create()
  return Runtime("",array(MAX_QUED_EVENTS,void),0,0,0,"",false,"",void,false,
    "unknown Windows variant","detect",0,"",false,false,false,false,[],[],0,0,[],
    void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

function emit(state,kind,text,value) state.actions=state.actions+[[kind,text,value]];return void end function

function Spk_Open(state,name)
  if state==void or typeof(name)!="string" then return false end if;data=bytes(name)
  result=spkOpenNative(nativeBytesPtr(data),len(data))!=0;emit(state,"spk-open",name,0);return result
end function
function Spk_Close(state) spkCloseNative();emit(state,"spk-close","",0);return void end function
function Spk_Printf(state,text)
  if state==void or typeof(text)!="string" then return false end if;data=bytes(text);ok=spkWriteNative(nativeBytesPtr(data),len(data))!=0
  if ok then emit(state,"spk-write",text,len(data)) end if;return ok
end function

function Sys_LowPhysicalMemory() return lowMemoryNative()!=0 end function
function Sys_BeginProfiling(state) if state!=void then emit(state,"profiling","",0) end if;return void end function

function Sys_Error(state,text)
  if state==void then return error(7560,"Sys_Error: missing runtime") end if
  state.fatal=true;state.errorText=text;state.printed=state.printed+text+"\n";state.consoleVisible=true
  if state.errorConsoleFn!=void then state.errorConsoleFn(state.context,text) end if
  if state.showConsoleFn!=void then state.showConsoleFn(state.context,1,true) end if
  if state.inputShutdownFn!=void and state.inputStarted then state.inputShutdownFn(state.context) end if
  state.inputStarted=false;emit(state,"fatal",text,1);return false
end function
function Sys_Quit(state)
  if state==void then return error(7560,"Sys_Quit: missing runtime") end if
  if state.inputShutdownFn!=void and state.inputStarted then state.inputShutdownFn(state.context) end if
  if state.destroyConsoleFn!=void then state.destroyConsoleFn(state.context) end if
  state.inputStarted=false;state.quitCode=0;emit(state,"quit","",0);return void
end function
function Sys_Print(state,message) if state==void then return false end if;state.printed=state.printed+message;emit(state,"print",message,len(bytes(message)));return true end function

function Sys_Mkdir(path) data=bytes(path);return mkdirNative(nativeBytesPtr(data),len(data))!=0 end function
function Sys_Cwd() data=bytes(32768,0);length=cwdNative(data,len(data));if length<0 then return "" end if;return decode(slice(data,0,length)) end function
function Sys_DefaultCDPath() return "" end function
function Sys_DefaultBasePath() return Sys_Cwd() end function

function decodeFileList(data,size)
  result=[];start=0
  for index=0 to size-1
    if data[index]==0 then if index>start then result=result+[decode(slice(data,start,index-start))] end if;start=index+1 end if
  end for
  return result
end function
function nativeList(directory,extension,filter,wantSubs)
  dir=bytes(directory);ext=bytes(extension);pattern=bytes(filter);sub=0;if wantSubs then sub=1 end if
  capacity=1048576;output=bytes(capacity,0);size=listFilesNative(nativeBytesPtr(dir),len(dir),nativeBytesPtr(ext),len(ext),nativeBytesPtr(pattern),len(pattern),sub,output,capacity)
  if size<0 then return error(7561,"Sys_ListFiles: native result exceeds one MiB") end if
  return decodeFileList(output,size)
end function
function Sys_ListFilteredFiles(basedir,subdirs,filter)
  found=nativeList(basedir,"",filter,false);if found is error or subdirs=="" then return found end if
  result=[];prefix=strings.toLowerAscii(subdirs+"\\")
  for each name in found if strings.startsWith(strings.toLowerAscii(name),prefix) then result=result+[name] end if end for
  return result
end function
function strgtr(s0,s1)
  left=bytes(s0);right=bytes(s1);count=len(left);if len(right)<count then count=len(right) end if
  if count>0 then for index=0 to count-1 if right[index]>left[index] then return true end if;if right[index]<left[index] then return false end if end for end if
  return false
end function
function Sys_ListFiles(directory,extension,filter,wantSubs)
  if filter!=void and filter!="" then return nativeList(directory,"",filter,false) end if
  wanted=extension;if wanted==void then wanted="" end if;directories=wanted=="/";if directories then wanted="" end if
  return nativeList(directory,wanted,"",wantSubs or directories)
end function
function Sys_FreeFileList(list) if list==void then return 0 end if;return len(list) end function

function Sys_ScanForCD() data=bytes(32768,0);length=scanCdNative(data,len(data));if length<=0 then return "" end if;return decode(slice(data,0,length)) end function
function Sys_CheckCD() return true end function
function Sys_GetClipboardData() data=bytes(1048576,0);length=clipboardNative(data,len(data));if length<0 then return void end if;return decode(slice(data,0,length)) end function

function Sys_UnloadDll(state,dll)
  if dll==void or dll.handle==void then return true end if
  if dllUnloadNative(dll.handle)==0 then return error(7562,"Sys_UnloadDll FreeLibrary failed") end if
  dll.handle=void;dll.entryPoint=void;return true
end function
function joinPath(base,game,name)
  result=base;if result!="" and not strings.endsWith(result,"\\") and not strings.endsWith(result,"/") then result=result+"\\" end if
  if game!="" then result=result+game+"\\" end if;return result+name
end function
function tryDll(path)
  data=bytes(path);handle=dllLoadNative(nativeBytesPtr(data),len(data));if handle==void or handle==0 then return void end if
  vm=bytes("vmMain\x00");entry=dllSymbolNative(handle,nativeBytesPtr(vm));dll=bytes("dllEntry\x00");init=dllSymbolNative(handle,nativeBytesPtr(dll))
  if entry==void or entry==0 or init==void or init==0 then dllUnloadNative(handle);return void end if
  return Dll(handle,entry,path)
end function
function Sys_LoadDll(state,name,basepath,cdpath,gamedir,systemCalls)
  filename=name+"x86.dll";candidates=[filename,joinPath(basepath,gamedir,filename)];if cdpath!="" then candidates=candidates+[joinPath(cdpath,gamedir,filename)] end if
  for each path in candidates loaded=tryDll(path);if loaded!=void then if systemCalls!=void and systemCalls!=0 and dllAttachNative(loaded.handle,systemCalls)==0 then Sys_UnloadDll(state,loaded);continue end if;state.dlls=state.dlls+[loaded];emit(state,"dll-load",path,0);return loaded end if end for
  return void
end function

function Sys_InitStreamThread(state) state.streamStarted=true;return void end function
function Sys_ShutdownStreamThread(state) state.streamStarted=false;state.streams=[];return void end function
function Sys_BeginStreamedFile(state,file,readAhead,context,readFn,seekFn)
  if readAhead<0 or readFn==void or seekFn==void then return error(7563,"invalid streamed file") end if
  stream=Stream(file,bytes(0,0),0,true,readFn,seekFn,context);state.streams=state.streams+[stream];return stream
end function
function Sys_EndStreamedFile(state,stream) if stream==void or not stream.active then return error(7563,"wrong streamed file") end if;stream.active=false;return void end function
function Sys_StreamedRead(stream,size,count)
  if stream==void or not stream.active or size<=0 or count<0 then return error(7563,"invalid streamed read") end if
  data=stream.readFn(stream.context,stream.file,size*count);return StreamRead(data,len(data)/size)
end function
function Sys_StreamSeek(stream,offset,origin) if stream==void or not stream.active then return error(7563,"invalid streamed seek") end if;stream.position=stream.seekFn(stream.context,stream.file,offset,origin);return stream.position end function
function Sys_StreamThread(state) return state!=void and state.streamStarted end function

function now(state) if state.clockFn!=void then return state.clockFn(state.context) end if;return millisecondsNative() end function
function Sys_QueEvent(state,time,type,value,value2,ptrLength,data)
  if state==void then return error(7564,"Sys_QueEvent: missing runtime") end if;index=state.head&(MAX_QUED_EVENTS-1)
  if state.head-state.tail>=MAX_QUED_EVENTS then state.tail=state.tail+1;state.overflows=state.overflows+1;emit(state,"event-overflow","",state.overflows) end if
  if time==0 then time=now(state) end if;state.events[index]=Event(time,type,value,value2,ptrLength,data);state.head=state.head+1;return void
end function
function popEvent(state) if state.head<=state.tail then return void end if;event=state.events[state.tail&(MAX_QUED_EVENTS-1)];state.tail=state.tail+1;return event end function
function Sys_GetEvent(state)
  event=popEvent(state);if event!=void then return event end if
  if state.pumpFn!=void then state.pumpFn(state.context) end if
  if state.consoleFn!=void then text=state.consoleFn(state.context);if text!=void and text!="" then Sys_QueEvent(state,0,SE_CONSOLE,0,0,len(bytes(text))+1,text) end if end if
  if state.packetFn!=void then packet=state.packetFn(state.context);if packet!=void then Sys_QueEvent(state,0,SE_PACKET,0,0,len(packet.data),packet) end if end if
  event=popEvent(state);if event!=void then return event end if;return Event(millisecondsNative(),SE_NONE,0,0,0,void)
end function

function Sys_In_Restart_f(state) if state.inputShutdownFn!=void then state.inputShutdownFn(state.context) end if;if state.inputInitFn!=void then state.inputInitFn(state.context) end if;state.inputStarted=true;return void end function
function Sys_Net_Restart_f(state) if state.networkRestartFn!=void then state.networkRestartFn(state.context) end if;return void end function
function Sys_Init(state,platform,major,build,cpuId,currentUser)
  if major<4 or platform==0 then return Sys_Error(state,"Quake3 requires Windows version 4 or greater") end if
  if platform==2 then
    state.arch="winnt"
  else if platform==1 then
    if build>=1998 then state.arch="win98" else if build>=1111 then state.arch="win95 osr2.x" else state.arch="win95" end if
  else
    state.arch="unknown Windows variant"
  end if
  state.cpuId=cpuId
  if cpuId==0 then state.cpuString="generic" else if cpuId==0x20 then state.cpuString="x86 (pre-Pentium)" else if cpuId==0x21 then state.cpuString="x86 (P5/PPro, non-MMX)" else if cpuId==0x22 then state.cpuString="x86 (P5/Pentium2, MMX)" else if cpuId==0x23 then state.cpuString="Intel Pentium III" else if cpuId==0x30 then state.cpuString="AMD w/ 3DNow!" else if cpuId==0x10 then state.cpuString="Alpha AXP" else state.cpuString="generic";state.cpuId=0 end if
  state.username=currentUser;if state.inputInitFn!=void then state.inputInitFn(state.context) end if;state.inputStarted=true;state.initialized=true;return true
end function

function WinMain(state,commandLine,maxFrames)
  if state==void or maxFrames<0 then return error(7565,"WinMain: invalid arguments") end if;state.commandLine=commandLine
  if state.createConsoleFn!=void then state.createConsoleFn(state.context) end if;state.consoleVisible=true;Sys_InitStreamThread(state)
  if state.commonInitFn!=void then state.commonInitFn(state.context,commandLine) end if;if state.networkInitFn!=void then state.networkInitFn(state.context) end if;state.networkStarted=true
  previous=now(state)
  while state.quitCode==void and state.frameCount<maxFrames
    if state.inputFrameFn!=void then state.inputFrameFn(state.context) end if;start=now(state)
    if state.commonFrameFn!=void then state.commonFrameFn(state.context) end if;finish=now(state);state.totalMsec=state.totalMsec+finish-start;state.frameCount=state.frameCount+1;previous=finish
  end while
  return state.frameCount
end function
