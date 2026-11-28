// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Productive Windows host and deterministic facade for code/win32/win_main.c.
package mq3.platform.win_main_runtime

import std.string as strings

/// Physical-memory threshold used by the platform's low-memory startup heuristic.
const MEM_THRESHOLD=100663296
/// Maximum number of filesystem search results retained by the platform adapter.
const MAX_FOUND_FILES=4096
/// Capacity of the bounded system-event queue.
const MAX_QUED_EVENTS=256
/// Event-queue result indicating that no input or system event is available.
const SE_NONE=0
/// System-event type carrying a key code and its press or release state.
const SE_KEY=1
/// System-event type carrying a character for text input.
const SE_CHAR=2
/// System-event type carrying relative horizontal and vertical mouse movement.
const SE_MOUSE=3
/// System-event type carrying a joystick axis identifier and value.
const SE_JOYSTICK_AXIS=4
/// System-event type carrying a completed console command line.
const SE_CONSOLE=5
/// System-event type carrying a received network packet.
const SE_PACKET=6

/// Tests the legacy low-memory threshold of at most 96 MiB total physical memory.
/// @returns 1 below or at the threshold; 0 otherwise or if the memory query fails.
extern function lowMemoryNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_low_physical_memory" returns i32
/// Reads the Windows multimedia clock.
/// @returns The unsigned 32-bit millisecond counter returned by timeGetTime.
extern function millisecondsNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_milliseconds" returns u32
/// Copies the current directory as NUL-terminated UTF-8 text.
/// @param output Writable UTF-8 text buffer, including space for NUL.
/// @param capacity Output-buffer capacity in bytes.
/// @returns UTF-8 byte length excluding NUL, or -1 on query/conversion failure.
extern function cwdNative(output as bytes,capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_cwd" returns i32
/// Creates a directory from a UTF-8 path.
/// @param path Pointer to the UTF-8 path bytes.
/// @param length Path length in UTF-8 bytes, excluding any trailing NUL.
/// @returns 1 if created or already present, 0 on creation failure, or -1 for invalid UTF-8 input.
extern function mkdirNative(path as ptr,length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_mkdir" returns i32
/// Reads Unicode clipboard text as UTF-8 and truncates at newline, carriage return, or backspace.
/// @param output Writable UTF-8 text buffer, including space for NUL.
/// @param capacity Output-buffer capacity in bytes.
/// @returns UTF-8 byte length, or -1 if the clipboard cannot be read or converted.
extern function clipboardNative(output as bytes,capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_clipboard" returns i32
/// Searches CD-ROM drives for a recognized Quake III installation directory.
/// @param output Writable UTF-8 text buffer, including space for NUL.
/// @param capacity Output-buffer capacity in bytes.
/// @returns UTF-8 directory length, 0 if no installation is found, or -1 on conversion failure.
extern function scanCdNative(output as bytes,capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_scan_cd" returns i32
/// Get the drive-letter bitmask for optical drives with readable media, where bit 0 represents A:.
/// @returns Drive-letter bitmask, or zero if no readable optical volume is found.
extern function retailCdDrivesNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_retail_cd_drives" returns u32
/// Replaces the currently open diagnostic output file with a UTF-8-selected binary file.
/// @param path Pointer to the UTF-8 path bytes.
/// @param length Path length in UTF-8 bytes, excluding any trailing NUL.
/// @returns 1 when the output file opens; 0 on path conversion or open failure.
extern function spkOpenNative(path as ptr,length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_open" returns i32
/// Writes and flushes bytes to the currently open diagnostic output file.
/// @param text Read-only bytes written to the diagnostic output file.
/// @param length Number of bytes to write and flush.
/// @returns 1 if every requested byte is written; 0 for invalid state/input or a short write.
extern function spkWriteNative(text as ptr,length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_write" returns i32
/// Closes the current diagnostic output file and clears its native handle.
extern function spkCloseNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_close" returns void
/// Enumerates matching paths into a NUL-separated UTF-8 result buffer.
/// @param directory UTF-8 directory path.
/// @param directoryLength Directory-path length in bytes.
/// @param extension UTF-8 extension filter used when no recursive filter is supplied.
/// @param extensionLength Extension-filter length in bytes.
/// @param filter Optional UTF-8 recursive path filter.
/// @param filterLength Recursive-filter length in bytes.
/// @param wantSubs Nonzero requests directories; zero requests files in the nonrecursive branch.
/// @param output Writable buffer for NUL-separated UTF-8 names.
/// @param capacity Output-buffer capacity in bytes.
/// @returns Bytes used, negative required size if capacity is insufficient, or 0 for no results/conversion failure.
extern function listFilesNative(directory as ptr,directoryLength as i32,extension as ptr,extensionLength as i32,filter as ptr,filterLength as i32,wantSubs as i32,output as bytes,capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_list_files" returns i32
/// Loads a native module from a UTF-8 path.
/// @param path Pointer to the UTF-8 path bytes.
/// @param length Path length in UTF-8 bytes, excluding any trailing NUL.
/// @returns The module handle, or 0 if path conversion or LoadLibraryW fails.
extern function dllLoadNative(path as ptr,length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_load" returns ptr
/// Looks up an exported symbol in a loaded native module.
/// @param handle Loaded HMODULE returned by mq3_winmain_dll_load.
/// @param name NUL-terminated native export name.
/// @returns The export address, or 0 for invalid arguments or an absent symbol.
extern function dllSymbolNative(handle as ptr,name as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_symbol" returns ptr
/// Calls a module's dllEntry export with the engine syscall callback.
/// @param handle Loaded HMODULE returned by mq3_winmain_dll_load.
/// @param systemCalls Address of the engine syscall callback passed to dllEntry.
/// @returns 1 after dllEntry is called; 0 for invalid handles/callbacks or a missing export.
extern function dllAttachNative(handle as ptr,systemCalls as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_attach" returns i32
/// Releases a loaded native module reference.
/// @param handle Loaded HMODULE returned by mq3_winmain_dll_load.
/// @returns 1 when FreeLibrary succeeds; 0 otherwise.
extern function dllUnloadNative(handle as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_unload" returns i32

/// Data record for `mq3.platform.win_main_runtime.Event`; groups `time`, `type`, `value`, `value2`, `ptrLength`, `data`.
struct Event
  /// Windows system-event timestamp in milliseconds, filled from the host clock when needed.
  time
  /// System-event category selecting how the accompanying values are interpreted.
  type
  /// Primary event value: a key or character code, horizontal motion, or joystick-axis selector.
  value
  /// Secondary event value: key press state, vertical motion, or joystick-axis magnitude.
  value2
  /// Length in bytes of the optional payload carried by the system event.
  ptrLength
  /// Optional byte payload carried by a console or network system event.
  data
end struct
/// Data record for `mq3.platform.win_main_runtime.Dll`; groups `handle`, `entryPoint`, `path`.
struct Dll
  /// Resource handle used to identify the registered or opened object.
  handle
  /// Loaded module entry point used to call into the dynamic library.
  entryPoint
  /// Filesystem or virtual asset path associated with this record.
  path
end struct
/// Data record for `mq3.platform.win_main_runtime.Stream`; groups `file`, `data`, `position`, `active`, `readFn`, `seekFn`, and 1 further field.
struct Stream
  /// Open file object used by the stream or cursor.
  file
  /// Buffered bytes backing the streamed-file adapter.
  data
  /// Current byte position in the streamed file.
  position
  /// Whether this object is currently active and accepts processing.
  active
  /// Host callback used to perform read operations for this subsystem.
  readFn
  /// Host callback used to perform seek operations for this subsystem.
  seekFn
  /// File-backend state passed to the stream's read and seek callbacks.
  context
end struct
/// Data record for `mq3.platform.win_main_runtime.StreamRead`; groups `data`, `count`.
struct StreamRead
  /// Bytes returned by the streamed-file read operation.
  data
  /// Number of bytes returned by the streamed-file read.
  count
end struct
/// Data record for `mq3.platform.win_main_runtime.Runtime`; groups `commandLine`, `events`, `head`, `tail`, `overflows`, `printed`, and 34 further fields.
struct Runtime
  /// Command-line text supplied when initializing the platform runtime.
  commandLine
  /// Pending input or system events awaiting delivery.
  events
  /// Producer cursor of the next native system-event slot to fill.
  head
  /// Consumer position of the next event to remove from the queue.
  tail
  /// Number of events lost because the queue reached capacity.
  overflows
  /// Console text captured from platform print calls.
  printed
  /// Whether a fatal platform error has occurred.
  fatal
  /// Text describing the most recent platform error.
  errorText
  /// Exit status requested when terminating the application.
  quitCode
  /// Whether initialization completed successfully.
  initialized
  /// Processor or platform architecture identifier used during startup.
  arch
  /// Human-readable processor description used by platform initialization.
  cpuString
  /// Processor feature category selected by platform detection.
  cpuId
  /// Operating-system user name used for user-specific settings.
  username
  /// Whether the native console window is visible.
  consoleVisible
  /// Whether platform input services have started.
  inputStarted
  /// Whether platform network services have started.
  networkStarted
  /// Whether the streamed-file subsystem has started.
  streamStarted
  /// Loaded dynamic libraries and their entry-point records.
  dlls
  /// Open streamed-file records managed by the platform runtime.
  streams
  /// Sequence count of frames processed by this subsystem.
  frameCount
  /// Total elapsed milliseconds accumulated by the runtime.
  totalMsec
  /// Platform operations recorded for dispatch or inspection.
  actions
  /// Host callback used to perform clock operations for this subsystem.
  clockFn
  /// Host callback used to perform pump operations for this subsystem.
  pumpFn
  /// Host callback used to perform console operations for this subsystem.
  consoleFn
  /// Host callback used to perform packet operations for this subsystem.
  packetFn
  /// Host callback used to perform input init operations for this subsystem.
  inputInitFn
  /// Host callback used to perform input shutdown operations for this subsystem.
  inputShutdownFn
  /// Host callback used to perform input frame operations for this subsystem.
  inputFrameFn
  /// Host callback used to perform network init operations for this subsystem.
  networkInitFn
  /// Host callback used to perform network restart operations for this subsystem.
  networkRestartFn
  /// Host callback used to perform common init operations for this subsystem.
  commonInitFn
  /// Host callback used to perform common frame operations for this subsystem.
  commonFrameFn
  /// Host callback used to perform create console operations for this subsystem.
  createConsoleFn
  /// Host callback used to perform destroy console operations for this subsystem.
  destroyConsoleFn
  /// Host callback used to perform show console operations for this subsystem.
  showConsoleFn
  /// Host callback used to perform error console operations for this subsystem.
  errorConsoleFn
  /// Host callback used to perform sleep operations for this subsystem.
  sleepFn
  /// Windows host state supplied to console, error-display, sleep, and frame callbacks.
  context
end struct

/// Constructs `mq3.platform.win_main_runtime.Runtime` with `commandLine` = `""`, `events` = `array(MAX_QUED_EVENTS,void)`, `head` = `0`, `tail` = `0` and the supplied remaining values.
function create()
  return Runtime("",array(MAX_QUED_EVENTS,void),0,0,0,"",false,"",void,false,
    "unknown Windows variant","detect",0,"",false,false,false,false,[],[],0,0,[],
    void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

/// Updates `state.actions` in `mq3.platform.win_main_runtime.emit`.
/// @param state Mutable record or buffer; this call updates `state.actions`.
/// @param kind Input used by `state.actions=state.actions+[[kind,text,value]]`.
/// @param text Input used by `state.actions=state.actions+[[kind,text,value]]`.
/// @param value Input used by `state.actions=state.actions+[[kind,text,value]]`.
function emit(state,kind,text,value) state.actions=state.actions+[[kind,text,value]];return void end function

/// Returns `result` from `mq3.platform.win_main_runtime.Spk_Open`; earlier branches return `false`.
/// @param state Value forwarded as `state` to `mq3.platform.win_main_runtime.emit`.
/// @param name Argument 1 supplied to `bytes`.
function Spk_Open(state,name)
  if state==void or typeof(name)!="string" then return false end if;data=bytes(name)
  result=spkOpenNative(nativeBytesPtr(data),len(data))!=0;emit(state,"spk-open",name,0);return result
end function
/// Returns `void` from `mq3.platform.win_main_runtime.Spk_Close`.
/// @param state Value forwarded as `state` to `mq3.platform.win_main_runtime.emit`.
function Spk_Close(state) spkCloseNative();emit(state,"spk-close","",0);return void end function
/// Returns `ok` from `mq3.platform.win_main_runtime.Spk_Printf`; earlier branches return `false`.
/// @param state Value forwarded as `state` to `mq3.platform.win_main_runtime.emit`.
/// @param text Argument 1 supplied to `bytes`.
function Spk_Printf(state,text)
  if state==void or typeof(text)!="string" then return false end if;data=bytes(text);ok=spkWriteNative(nativeBytesPtr(data),len(data))!=0
  if ok then emit(state,"spk-write",text,len(data)) end if;return ok
end function

/// Computes `lowMemoryNative()!=0` for `mq3.platform.win_main_runtime.Sys_LowPhysicalMemory`.
function Sys_LowPhysicalMemory() return lowMemoryNative()!=0 end function
/// Returns `void` from `mq3.platform.win_main_runtime.Sys_BeginProfiling`.
/// @param state Value forwarded as `state` to `mq3.platform.win_main_runtime.emit`.
function Sys_BeginProfiling(state) if state!=void then emit(state,"profiling","",0) end if;return void end function

/// Updates `state.fatal`, `state.errorText`, `state.printed`, `state.consoleVisible`, `state.inputStarted` in `mq3.platform.win_main_runtime.Sys_Error`; returns `false`.
/// @param state Mutable record or buffer; this call updates `state.fatal`, `state.errorText`, `state.printed`, `state.consoleVisible`, `state.inputStarted`.
/// @param text Value assigned to `state.errorText`.
function Sys_Error(state,text)
  if state==void then return error(7560,"Sys_Error: missing runtime") end if
  state.fatal=true;state.errorText=text;state.printed=state.printed+text+"\n";state.consoleVisible=true
  if state.errorConsoleFn!=void then state.errorConsoleFn(state.context,text) end if
  if state.showConsoleFn!=void then state.showConsoleFn(state.context,1,true) end if
  if state.inputShutdownFn!=void and state.inputStarted then state.inputShutdownFn(state.context) end if
  state.inputStarted=false;emit(state,"fatal",text,1);return false
end function
/// Updates `state.inputStarted`, `state.quitCode` in `mq3.platform.win_main_runtime.Sys_Quit`.
/// @param state Mutable record or buffer; this call updates `state.inputStarted`, `state.quitCode`.
function Sys_Quit(state)
  if state==void then return error(7560,"Sys_Quit: missing runtime") end if
  if state.inputShutdownFn!=void and state.inputStarted then state.inputShutdownFn(state.context) end if
  if state.destroyConsoleFn!=void then state.destroyConsoleFn(state.context) end if
  state.inputStarted=false;state.quitCode=0;emit(state,"quit","",0);return void
end function
/// Updates `state.printed` in `mq3.platform.win_main_runtime.Sys_Print`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.printed`.
/// @param message Value forwarded as `text` to `mq3.platform.win_main_runtime.emit`.
function Sys_Print(state,message) if state==void then return false end if;state.printed=state.printed+message;emit(state,"print",message,len(bytes(message)));return true end function

/// Returns `mkdirNative(nativeBytesPtr(data),len(data))!=0` from `mq3.platform.win_main_runtime.Sys_Mkdir`.
/// @param path Argument 1 supplied to `bytes`.
function Sys_Mkdir(path) data=bytes(path);return mkdirNative(nativeBytesPtr(data),len(data))!=0 end function
/// Returns `decode(slice(data,0,length))` from `mq3.platform.win_main_runtime.Sys_Cwd`; earlier branches return `""`.
function Sys_Cwd() data=bytes(32768,0);length=cwdNative(data,len(data));if length<0 then return "" end if;return decode(slice(data,0,length)) end function
/// Returns `""` for the `mq3.platform.win_main_runtime.Sys_DefaultCDPath` compatibility entry point.
function Sys_DefaultCDPath() return "" end function
/// Calls `mq3.platform.win_main_runtime.Sys_Cwd` with `()` and returns its result.
function Sys_DefaultBasePath() return Sys_Cwd() end function

/// Returns `result` from `mq3.platform.win_main_runtime.decodeFileList`.
/// @param data Argument 1 supplied to `slice`.
/// @param size Input used by `for index=0 to size-1`.
function decodeFileList(data,size)
  result=[];start=0
  for index=0 to size-1
    if data[index]==0 then if index>start then result=result+[decode(slice(data,start,index-start))] end if;start=index+1 end if
  end for
  return result
end function
/// Computes `nativeList` from `decodeFileList(output,size)` using `mq3.platform.win_main_runtime.listFilesNative`, `mq3.platform.win_main_runtime.decodeFileList`.
/// @param directory Argument 1 supplied to `bytes`.
/// @param extension Argument 1 supplied to `bytes`.
/// @param filter Argument 1 supplied to `bytes`.
/// @param wantSubs Input tested by `wantSubs`.
function nativeList(directory,extension,filter,wantSubs)
  dir=bytes(directory);ext=bytes(extension);pattern=bytes(filter);sub=0;if wantSubs then sub=1 end if
  capacity=1048576;output=bytes(capacity,0);size=listFilesNative(nativeBytesPtr(dir),len(dir),nativeBytesPtr(ext),len(ext),nativeBytesPtr(pattern),len(pattern),sub,output,capacity)
  if size<0 then return error(7561,"Sys_ListFiles: native result exceeds one MiB") end if
  return decodeFileList(output,size)
end function
/// Obtains filtered native file names and optionally restricts results to a case-insensitive subdirectory prefix.
/// @param basedir Value forwarded as `directory` to `mq3.platform.win_main_runtime.nativeList`.
/// @param subdirs Input tested by `found is error or subdirs==""`.
/// @param filter Value forwarded as `filter` to `mq3.platform.win_main_runtime.nativeList`.
function Sys_ListFilteredFiles(basedir,subdirs,filter)
  found=nativeList(basedir,"",filter,false);if found is error or subdirs=="" then return found end if
  result=[];prefix=strings.toLowerAscii(subdirs+"\\")
  for each name in found if strings.startsWith(strings.toLowerAscii(name),prefix) then result=result+[name] end if end for
  return result
end function
/// Compares common string bytes and reports whether the second string first differs with a larger byte; prefixes compare false.
/// @param s0 Argument 1 supplied to `bytes`.
/// @param s1 Argument 1 supplied to `bytes`.
function strgtr(s0,s1)
  left=bytes(s0);right=bytes(s1);count=len(left);if len(right)<count then count=len(right) end if
  if count>0 then for index=0 to count-1 if right[index]>left[index] then return true end if;if right[index]<left[index] then return false end if end for end if
  return false
end function
/// Computes `Sys_ListFiles` from `nativeList(directory,wanted,"",wantSubs or directories)` using `mq3.platform.win_main_runtime.nativeList`.
/// @param directory Value forwarded as `directory` to `mq3.platform.win_main_runtime.nativeList`.
/// @param extension Input used by `wanted=extension`.
/// @param filter Value forwarded as `filter` to `mq3.platform.win_main_runtime.nativeList`.
/// @param wantSubs Input used in the result expression `nativeList(directory,wanted,"",wantSubs or directories)`.
function Sys_ListFiles(directory,extension,filter,wantSubs)
  if filter!=void and filter!="" then return nativeList(directory,"",filter,false) end if
  wanted=extension;if wanted==void then wanted="" end if;directories=wanted=="/";if directories then wanted="" end if
  return nativeList(directory,wanted,"",wantSubs or directories)
end function
/// Returns `len(list)` from `mq3.platform.win_main_runtime.Sys_FreeFileList`; earlier branches return `0`.
/// @param list Input tested by `list==void`.
function Sys_FreeFileList(list) if list==void then return 0 end if;return len(list) end function

/// Returns `decode(slice(data,0,length))` from `mq3.platform.win_main_runtime.Sys_ScanForCD`; earlier branches return `""`.
function Sys_ScanForCD() data=bytes(32768,0);length=scanCdNative(data,len(data));if length<=0 then return "" end if;return decode(slice(data,0,length)) end function
/// List readable optical volume roots in drive-letter order for retail data discovery.
function retailCdRoots()
  mask=retailCdDrivesNative()
  letters="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  roots=[]
  for index=0 to len(letters)-1
    if (mask&(1<<index))!=0 then roots=roots+[letters[index]+":/"] end if
  end for
  return roots
end function
/// Returns `true` for the `mq3.platform.win_main_runtime.Sys_CheckCD` compatibility entry point.
function Sys_CheckCD() return true end function
/// Returns `decode(slice(data,0,length))` from `mq3.platform.win_main_runtime.Sys_GetClipboardData`; earlier branches return `void`.
function Sys_GetClipboardData() data=bytes(1048576,0);length=clipboardNative(data,len(data));if length<0 then return void end if;return decode(slice(data,0,length)) end function

/// Updates `dll.handle`, `dll.entryPoint` in `mq3.platform.win_main_runtime.Sys_UnloadDll`; returns `true`.
/// @param state Unused compatibility argument retained by this entry point.
/// @param dll Mutable record or buffer; this call updates `dll.handle`, `dll.entryPoint`.
function Sys_UnloadDll(state,dll)
  if dll==void or dll.handle==void then return true end if
  if dllUnloadNative(dll.handle)==0 then return error(7562,"Sys_UnloadDll FreeLibrary failed") end if
  dll.handle=void;dll.entryPoint=void;return true
end function
/// Returns `result+name` from `mq3.platform.win_main_runtime.joinPath`.
/// @param base Input used by `result=base`.
/// @param game Input tested by `game!=""`.
/// @param name Input used in the result expression `result+name`.
function joinPath(base,game,name)
  result=base;if result!="" and not strings.endsWith(result,"\\") and not strings.endsWith(result,"/") then result=result+"\\" end if
  if game!="" then result=result+game+"\\" end if;return result+name
end function
/// Builds `mq3.platform.win_main_runtime.Dll` for `mq3.platform.win_main_runtime.tryDll`.
/// @param path Initial value for `mq3.platform.win_main_runtime.Dll.path`.
function tryDll(path)
  data=bytes(path);handle=dllLoadNative(nativeBytesPtr(data),len(data));if handle==void or handle==0 then return void end if
  vm=bytes("vmMain\x00");entry=dllSymbolNative(handle,nativeBytesPtr(vm));dll=bytes("dllEntry\x00");init=dllSymbolNative(handle,nativeBytesPtr(dll))
  if entry==void or entry==0 or init==void or init==0 then dllUnloadNative(handle);return void end if
  return Dll(handle,entry,path)
end function
/// Updates `state.dlls` in `mq3.platform.win_main_runtime.Sys_LoadDll`.
/// @param state Mutable record or buffer; this call updates `state.dlls`.
/// @param name Input used by `filename=name+"x86.dll"`.
/// @param basepath Value forwarded as `base` to `mq3.platform.win_main_runtime.joinPath`.
/// @param cdpath Value forwarded as `base` to `mq3.platform.win_main_runtime.joinPath`.
/// @param gamedir Value forwarded as `game` to `mq3.platform.win_main_runtime.joinPath`.
/// @param systemCalls Value forwarded as `systemCalls` to `mq3.platform.win_main_runtime.dllAttachNative`.
function Sys_LoadDll(state,name,basepath,cdpath,gamedir,systemCalls)
  filename=name+"x86.dll";candidates=[filename,joinPath(basepath,gamedir,filename)];if cdpath!="" then candidates=candidates+[joinPath(cdpath,gamedir,filename)] end if
  for each path in candidates loaded=tryDll(path);if loaded!=void then if systemCalls!=void and systemCalls!=0 and dllAttachNative(loaded.handle,systemCalls)==0 then Sys_UnloadDll(state,loaded);continue end if;state.dlls=state.dlls+[loaded];emit(state,"dll-load",path,0);return loaded end if end for
  return void
end function

/// Updates `state.streamStarted` in `mq3.platform.win_main_runtime.Sys_InitStreamThread`.
/// @param state Mutable record or buffer; this call updates `state.streamStarted`.
function Sys_InitStreamThread(state) state.streamStarted=true;return void end function
/// Updates `state.streamStarted`, `state.streams` in `mq3.platform.win_main_runtime.Sys_ShutdownStreamThread`.
/// @param state Mutable record or buffer; this call updates `state.streamStarted`, `state.streams`.
function Sys_ShutdownStreamThread(state) state.streamStarted=false;state.streams=[];return void end function
/// Updates `state.streams` in `mq3.platform.win_main_runtime.Sys_BeginStreamedFile`; returns `stream`.
/// @param state Mutable record or buffer; this call updates `state.streams`.
/// @param file Value used for `mq3.platform.win_main_runtime.Stream.file`.
/// @param readAhead Input tested by `readAhead<0 or readFn==void or seekFn==void`.
/// @param context Value used for `mq3.platform.win_main_runtime.Stream.context`.
/// @param readFn Value used for `mq3.platform.win_main_runtime.Stream.readFn`.
/// @param seekFn Value used for `mq3.platform.win_main_runtime.Stream.seekFn`.
function Sys_BeginStreamedFile(state,file,readAhead,context,readFn,seekFn)
  if readAhead<0 or readFn==void or seekFn==void then return error(7563,"invalid streamed file") end if
  stream=Stream(file,bytes(0,0),0,true,readFn,seekFn,context);state.streams=state.streams+[stream];return stream
end function
/// Updates `stream.active` in `mq3.platform.win_main_runtime.Sys_EndStreamedFile`.
/// @param state Unused compatibility argument retained by this entry point.
/// @param stream Mutable record or buffer; this call updates `stream.active`.
function Sys_EndStreamedFile(state,stream) if stream==void or not stream.active then return error(7563,"wrong streamed file") end if;stream.active=false;return void end function
/// Builds `mq3.platform.win_main_runtime.StreamRead` using `stream.readFn`.
/// @param stream Record providing `stream.active`, `stream.readFn`, `stream.context`, `stream.file`.
/// @param size Input tested by `stream==void or not stream.active or size<=0 or count<0`.
/// @param count Input tested by `stream==void or not stream.active or size<=0 or count<0`.
function Sys_StreamedRead(stream,size,count)
  if stream==void or not stream.active or size<=0 or count<0 then return error(7563,"invalid streamed read") end if
  data=stream.readFn(stream.context,stream.file,size*count);return StreamRead(data,len(data)/size)
end function
/// Updates `stream.position` in `mq3.platform.win_main_runtime.Sys_StreamSeek`; returns `stream.position`.
/// @param stream Mutable record or buffer; this call updates `stream.position`.
/// @param offset Argument 3 supplied to `stream.seekFn`.
/// @param origin Argument 4 supplied to `stream.seekFn`.
function Sys_StreamSeek(stream,offset,origin) if stream==void or not stream.active then return error(7563,"invalid streamed seek") end if;stream.position=stream.seekFn(stream.context,stream.file,offset,origin);return stream.position end function
/// Computes `state!=void and state.streamStarted` for `mq3.platform.win_main_runtime.Sys_StreamThread`.
/// @param state Record providing `state.streamStarted`.
function Sys_StreamThread(state) return state!=void and state.streamStarted end function

/// Returns `millisecondsNative()` from `mq3.platform.win_main_runtime.now`; earlier branches return `state.clockFn(state.context)`.
/// @param state Record providing `state.clockFn`, `state.context`.
function now(state) if state.clockFn!=void then return state.clockFn(state.context) end if;return millisecondsNative() end function
/// Updates `state.tail`, `state.overflows`, `state.events[index]`, `state.head` in `mq3.platform.win_main_runtime.Sys_QueEvent`.
/// @param state Mutable record or buffer; this call updates `state.tail`, `state.overflows`, `state.events[index]`, `state.head`.
/// @param time Value used for `mq3.platform.win_main_runtime.Event.time`.
/// @param type Value used for `mq3.platform.win_main_runtime.Event.type`.
/// @param value Value used for `mq3.platform.win_main_runtime.Event.value`.
/// @param value2 Value used for `mq3.platform.win_main_runtime.Event.value2`.
/// @param ptrLength Value used for `mq3.platform.win_main_runtime.Event.ptrLength`.
/// @param data Value used for `mq3.platform.win_main_runtime.Event.data`.
function Sys_QueEvent(state,time,type,value,value2,ptrLength,data)
  if state==void then return error(7564,"Sys_QueEvent: missing runtime") end if;index=state.head&(MAX_QUED_EVENTS-1)
  if state.head-state.tail>=MAX_QUED_EVENTS then state.tail=state.tail+1;state.overflows=state.overflows+1;emit(state,"event-overflow","",state.overflows) end if
  if time==0 then time=now(state) end if;state.events[index]=Event(time,type,value,value2,ptrLength,data);state.head=state.head+1;return void
end function
/// Updates `state.tail` in `mq3.platform.win_main_runtime.popEvent`; returns `event`.
/// @param state Mutable record or buffer; this call updates `state.tail`.
function popEvent(state) if state.head<=state.tail then return void end if;event=state.events[state.tail&(MAX_QUED_EVENTS-1)];state.tail=state.tail+1;return event end function
/// Builds `mq3.platform.win_main_runtime.Event` using `state.pumpFn`, `state.consoleFn`, `state.packetFn`.
/// @param state Record providing `state.pumpFn`, `state.context`, `state.consoleFn`, `state.packetFn`.
function Sys_GetEvent(state)
  event=popEvent(state);if event!=void then return event end if
  if state.pumpFn!=void then state.pumpFn(state.context) end if
  if state.consoleFn!=void then text=state.consoleFn(state.context);if text!=void and text!="" then Sys_QueEvent(state,0,SE_CONSOLE,0,0,len(bytes(text))+1,text) end if end if
  if state.packetFn!=void then packet=state.packetFn(state.context);if packet!=void then Sys_QueEvent(state,0,SE_PACKET,0,0,len(packet.data),packet) end if end if
  event=popEvent(state);if event!=void then return event end if;return Event(millisecondsNative(),SE_NONE,0,0,0,void)
end function

/// Updates `state.inputStarted` in `mq3.platform.win_main_runtime.Sys_In_Restart_f`.
/// @param state Mutable record or buffer; this call updates `state.inputStarted`.
function Sys_In_Restart_f(state) if state.inputShutdownFn!=void then state.inputShutdownFn(state.context) end if;if state.inputInitFn!=void then state.inputInitFn(state.context) end if;state.inputStarted=true;return void end function
/// Returns `void` from `mq3.platform.win_main_runtime.Sys_Net_Restart_f`.
/// @param state Record providing `state.networkRestartFn`, `state.context`.
function Sys_Net_Restart_f(state) if state.networkRestartFn!=void then state.networkRestartFn(state.context) end if;return void end function
/// Updates `state.arch`, `state.cpuId`, `state.cpuString`, `state.username`, `state.inputStarted` in `mq3.platform.win_main_runtime.Sys_Init`; returns `true`.
/// @param state Mutable record or buffer; this call updates `state.arch`, `state.cpuId`, `state.cpuString`, `state.username`, `state.inputStarted`.
/// @param platform Input tested by `major<4 or platform==0`.
/// @param major Input tested by `major<4 or platform==0`.
/// @param build Input tested by `build>=1998`.
/// @param cpuId Value assigned to `state.cpuId`.
/// @param currentUser Value assigned to `state.username`.
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

/// Updates `state.commandLine`, `state.consoleVisible`, `state.networkStarted`, `state.totalMsec`, `state.frameCount` in `mq3.platform.win_main_runtime.WinMain`; returns `state.frameCount`.
/// @param state Mutable record or buffer; this call updates `state.commandLine`, `state.consoleVisible`, `state.networkStarted`, `state.totalMsec`, `state.frameCount`.
/// @param commandLine Value assigned to `state.commandLine`.
/// @param maxFrames Input tested by `state==void or maxFrames<0`.
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
