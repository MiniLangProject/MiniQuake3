// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful native port of code/qcommon/common.c.
package mq3.qcommon.common

import mq3.qcommon.headers as qcommonHeaders
import mq3.qcommon.startup_commands as startup
import mq3.qcommon.command_buffer as command
import mq3.qcommon.config_persistence as config
import mq3.qcommon.network_pump as network
import mq3.platform.engine_loop as engine
import mq3.compat.numeric as n

/// Compute the inverse cosine in radians.
/// @param value Floating-point operand.
/// @returns The principal angle in radians, with C-runtime domain handling outside [-1, 1].
extern function acos(value as double) from "ucrtbase.dll" returns double

/// Engine error-severity identifier for fatal.
const ERR_FATAL=0
/// Engine error-severity identifier for drop.
const ERR_DROP=1
/// Engine error-severity identifier for a server-triggered disconnection.
const ERR_SERVERDISCONNECT=2
/// Engine error-severity identifier for disconnect.
const ERR_DISCONNECT=3
/// Engine error-severity identifier for need cd.
const ERR_NEED_CD=4
/// Number of entries in the circular queue of pushed system events.
const MAX_PUSHED_EVENTS=1024
/// Capacity of the editable console input line.
const MAX_EDIT_LINE=qcommonHeaders.MAX_EDIT_LINE
/// Max length of an individual token.
const MAX_TOKEN_CHARS=1024
/// Memory-tag value marking an unused allocation block.
const TAG_FREE=0
/// Memory-tag value for ordinary engine allocations.
const TAG_GENERAL=1
/// Memory-tag value for bot-library allocations.
const TAG_BOTLIB=2
/// Memory-tag value for renderer allocations.
const TAG_RENDERER=3
/// Hunk allocation preference selecting the low-address bank.
const HUNK_LOW=0
/// Hunk allocation preference selecting the high-address bank.
const HUNK_HIGH=1

/// Services record for qcommon.common, containing `context`, `printFn`, `errorFn`, `quitFn`, `clockFn`, `realTimeFn`, and 12 further fields.
struct Services
  /// Caller-supplied data associated with common-engine output, events, file access, timing, and
  /// subsystem lifecycle.
  context
  /// Host callback that writes common-engine console messages to the host output channel.
  printFn
  /// Host callback that reports a host error using the requested error severity.
  errorFn
  /// Host callback that terminates the host application.
  quitFn
  /// Host callback that returns the host clock used for frame scheduling.
  clockFn
  /// Host callback that returns the host calendar time.
  realTimeFn
  /// Host callback that obtains the next event from the host event queue.
  realEventFn
  /// Host callback that reads common-engine files such as event journals and configuration data.
  readFn
  /// Host callback that writes data through the host output interface.
  writeFn
  /// Host callback that appends text to the host command buffer.
  appendFn
  /// Host callback that checks the supplied game key.
  validateKeyFn
  /// Host callback that shuts down the host client subsystem.
  shutdownClientFn
  /// Host callback that shuts down the host server subsystem.
  shutdownServerFn
  /// Host callback that shuts down the host filesystem.
  shutdownFsFn
  /// Host callback that initializes the host subsystem.
  initFn
  /// Host callback that shuts down the host subsystem and releases its resources.
  shutdownFn
  /// Host callback that handles a host console-input event.
  consoleEventFn
  /// Host callback that handles an incoming host network event.
  packetEventFn
end struct
/// SysEvent record for qcommon.common, containing `time`, `type`, `value`, `value2`, `data`.
struct SysEvent
  /// Host timestamp attached to this input or network event.
  time
  /// Event-kind identifier selecting the interpretation of the payload.
  type
  /// First integer event argument, such as a key or movement value.
  value
  /// Second integer event argument associated with the event kind.
  value2
  /// Optional event payload, such as console text or packet bytes.
  data
end struct
/// Redirect record for qcommon.common, containing `capacity`, `text`, `flushFn`, `context`.
struct Redirect
  /// Maximum number of entries allowed in the managed collection.
  capacity
  /// Buffered console output awaiting delivery to the redirect callback.
  text
  /// Host callback that flushes buffered text to its host destination.
  flushFn
  /// Caller-supplied data associated with flushing a completed redirected console-output buffer.
  context
end struct
/// CommonError record for qcommon.common, containing `code`, `message`, `fatal`.
struct CommonError
  /// Engine error-severity code associated with the failure.
  code
  /// Text associated with the reported event or diagnostic.
  message
  /// True when the failure requires terminating the application.
  fatal
end struct
/// Allocation record for qcommon.common, containing `handle`, `data`, `size`, `tag`, `temporary`, `bank`, and 2 further fields.
struct Allocation
  /// Managed identifier of this memory allocation.
  handle
  /// Usable byte storage owned by this allocation.
  data
  /// Allocated byte count charged to the owning memory arena.
  size
  /// Allocation category used for selective freeing and accounting.
  tag
  /// True when the allocation belongs to temporary hunk storage.
  temporary
  /// Low or high hunk bank charged for this allocation.
  bank
  /// True after this managed resource has been released.
  freed
  /// Human-readable label identifying the allocation.
  label
end struct
/// Zone record for qcommon.common, containing `capacity`, `used`, `nextHandle`, `allocations`.
struct Zone
  /// Maximum number of entries allowed in the managed collection.
  capacity
  /// Bytes currently charged to active allocations in this zone.
  used
  /// Handle to assign to the next allocated managed resource.
  nextHandle
  /// Managed allocations owned by this memory zone.
  allocations
end struct
/// Hunk record for qcommon.common, containing `capacity`, `lowPermanent`, `highPermanent`, `lowTemp`, `highTemp`, `markLow`, and 6 further fields.
struct Hunk
  /// Maximum number of entries allowed in the managed collection.
  capacity
  /// Permanent bytes allocated from the low hunk bank.
  lowPermanent
  /// Permanent bytes allocated from the high hunk bank.
  highPermanent
  /// Temporary bytes allocated from the low hunk bank.
  lowTemp
  /// Temporary bytes allocated from the high hunk bank.
  highTemp
  /// Low-bank allocation position saved at the hunk mark.
  markLow
  /// High-bank allocation position saved at the hunk mark.
  markHigh
  /// Allocation handle saved at the hunk mark.
  markHandle
  /// Handle to assign to the next allocated managed resource.
  nextHandle
  /// Managed allocations owned by the hunk.
  allocations
  /// Bank selected for subsequent permanent hunk allocations.
  permanentBank
  /// Bank selected for subsequent temporary hunk allocations.
  tempBank
end struct
/// Field record for qcommon.common, containing `buffer`, `cursor`, `scroll`.
struct Field
  /// Editable console input text.
  buffer
  /// Character position of the console input cursor.
  cursor
  /// Horizontal character offset of the visible input region.
  scroll
end struct
/// State record for qcommon.common, containing `services`, `commandState`, `startupState`, `configState`, `networkPump`, `engineRuntime`, and 37 further fields.
struct State
  /// Common-engine host operations for console output, files, events, timing, and lifecycle.
  services
  /// Console-command buffer and registered command handlers.
  commandState
  /// Parsed startup arguments and commands.
  startupState
  /// Configuration persistence state.
  configState
  /// Network event pump shared by the engine endpoints.
  networkPump
  /// Bound engine runtime receiving common lifecycle events.
  engineRuntime
  /// Active console-output redirection buffer and callback.
  redirect
  /// True when developer diagnostics are enabled.
  developer
  /// True while an error is being handled, preventing recursive error handling.
  errorEntered
  /// Text of the error currently being handled.
  errorMessage
  /// Timestamp of the previous engine error.
  lastErrorTime
  /// Number of error recorded by this state.
  errorCount
  /// True when running in asset-build script mode.
  buildScript
  /// True after common engine initialization has completed.
  fullyInitialized
  /// Buffered host events waiting to be dispatched.
  pushed
  /// Monotonic write position in the circular queue of pushed system events.
  head
  /// Read position in the buffered host-event queue.
  tail
  /// Event-journal mode selecting disabled, recording, or replay behavior.
  journalMode
  /// Recorded or replayable host events.
  journalEvents
  /// Next journal event to consume during replay.
  journalIndex
  /// Filesystem path of the event journal.
  journalPath
  /// True when recorded journal changes need to be saved.
  journalDirty
  /// Host timestamp associated with the current engine frame.
  frameTime
  /// Elapsed milliseconds supplied to the current engine frame.
  frameMsec
  /// Number of engine frames processed since initialization.
  frameNumber
  /// Host timestamp retained from the preceding frame.
  lastTime
  /// True when the server runs without a local graphical client.
  dedicated
  /// Frame-rate limit used when calculating the minimum frame interval.
  maxFps
  /// True when timed-demo playback disables ordinary frame pacing.
  timedemo
  /// Fixed frame-time override used when deterministic stepping is requested.
  fixedTime
  /// Multiplier applied to the elapsed simulation time.
  timescale
  /// True when camera playback enables its special frame-time policy.
  cameraMode
  /// True when a local server is active.
  svRunning
  /// General-purpose managed memory zone.
  zone
  /// Managed memory zone for small allocations.
  smallZone
  /// Low/high-bank managed hunk allocator.
  hunk
  /// Configured game key used by the host validation interface.
  cdKey
  /// True after shutdown has been requested or completed.
  shutdown
  /// Most recently emitted console diagnostic text.
  lastPrint
  /// Prefix currently being matched by console completion.
  completionString
  /// Common prefix shared by all console-completion candidates.
  shortestMatch
  /// Number of match recorded by this state.
  matchCount
  /// Editable console field receiving the completion result.
  completionField
end struct

/// Create `mq3.qcommon.common.Services` with context=context; printFn=void; errorFn=void; quitFn=void; 14 further fields.
/// @param context Initial `context` field stored in the returned or constructed `mq3.qcommon.common.Services` record.
function services(context) return Services(context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
/// Create zone in qcommon.common; the normal completion returns `Zone(capacity, 0, 1, [])`.
/// @param capacity Initial `capacity` field stored in the returned or constructed `mq3.qcommon.common.Zone` record.
function createZone(capacity) if capacity<0 then capacity=0 end if;return Zone(capacity,0,1,[]) end function
/// Create hunk in qcommon.common; the normal completion returns `Hunk(capacity, 0, 0, 0, 0, 0, 0, 1, 1, [], HUNK_LOW, HUNK_HIGH)`.
/// @param capacity Initial `capacity` field stored in the returned or constructed `mq3.qcommon.common.Hunk` record.
function createHunk(capacity) if capacity<0 then capacity=0 end if;return Hunk(capacity,0,0,0,0,0,0,1,1,[],HUNK_LOW,HUNK_HIGH) end function
/// Create common in qcommon.common.
/// @param host Initial `services` field stored in the returned or constructed `mq3.qcommon.common.State` record.
/// @param commandState Command state passed as `commandState` to `mq3.qcommon.startup_commands.create`.
function create(host,commandState)
  if host==void then host=services(void) end if;if commandState==void then commandState=command.create() end if;startupState=startup.create(commandState)
  return State(host,commandState,startupState,void,void,void,void,false,false,"",0,0,false,false,array(MAX_PUSHED_EVENTS,void),0,0,0,[],0,"journal.dat",false,0,0,0,0,false,85,false,0,1.0,false,false,createZone(16*1024*1024),createZone(512*1024),createHunk(56*1024*1024),"                                ",false,"","","",0,void)
end function
/// Compute visible in qcommon.common; the normal completion returns `decode(slice(data, 0, count))`.
/// @param text Text used in `bytes(text)`.
function visible(text) data=bytes(text);count=0;while count<len(data) and data[count]!=0 count=count+1 end while;return decode(slice(data,0,count)) end function
/// Compute lower in qcommon.common; the normal completion returns `value`.
/// @param value Value used in `(value + 32)` and `(value >= 65)`.
function lower(value) if value>=65 and value<=90 then return value+32 end if;return value end function
/// Test same prefix in qcommon.common; the normal completion returns `true`.
/// @param left Left used in `bytes(left)`.
/// @param right Right used in `bytes(right)`.
/// @param count Count used in `(count - 1)` and `(len(a) < count)`.
/// @param casesensitive Casesensitive operand used by `samePrefix`; its reads are shown in the implementation.
function samePrefix(left,right,count,casesensitive) a=bytes(left);b=bytes(right);if len(a)<count or len(b)<count then return false end if;for i=0 to count-1 av=a[i];bv=b[i];if not casesensitive then av=lower(av);bv=lower(bv) end if;if av!=bv then return false end if end for;return true end function
/// Emit common in qcommon.common; updates `state.lastPrint`.
///
/// Direct state writes: `state.lastPrint`.
/// @param state Record exposing `services`. Updated in place: `lastPrint`.
/// @param text Text used in `state.services.printFn(state.services.context, text)`.
function emit(state,text) state.lastPrint=text;if state.services.printFn!=void then state.services.printFn(state.services.context,text) end if;return void end function

/// Begin redirect in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `state.redirect`.
/// @param state Updated in place: `redirect`.
/// @param capacity Initial `capacity` field stored in the returned or constructed `mq3.qcommon.common.Redirect` record.
/// @param flushFn Initial `flushFn` field stored in the returned or constructed `mq3.qcommon.common.Redirect` record.
/// @param context Initial `context` field stored in the returned or constructed `mq3.qcommon.common.Redirect` record.
function Com_BeginRedirect(state,capacity,flushFn,context) if state==void or capacity<=0 or flushFn==void then return false end if;state.redirect=Redirect(capacity,"",flushFn,context);return true end function
/// End redirect in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `state.redirect`.
/// @param state Record exposing `redirect`. Updated in place: `redirect`.
function Com_EndRedirect(state) if state==void or state.redirect==void then return false end if;state.redirect.flushFn(state.redirect.context,state.redirect.text);state.redirect=void;return true end function
/// Compute printf in qcommon.common.
/// @param state Record exposing `redirect`.
/// @param text Text passed as `text` to `mq3.qcommon.common.visible`.
function Com_Printf(state,text)
  if state==void then return void end if;text=visible(text)
  if state.redirect!=void then if len(bytes(text))+len(bytes(state.redirect.text))>state.redirect.capacity-1 then state.redirect.flushFn(state.redirect.context,state.redirect.text);state.redirect.text="" end if;room=state.redirect.capacity-1-len(bytes(state.redirect.text));if room>0 then data=bytes(text);if len(data)>room then data=slice(data,0,room) end if;state.redirect.text=state.redirect.text+decode(data) end if;return void end if
  emit(state,text);return void
end function
/// Compute d printf in qcommon.common.
/// @param state Record exposing `developer`.
/// @param text Text passed as `text` to `mq3.qcommon.common.Com_Printf`.
function Com_DPrintf(state,text) if state!=void and state.developer then return Com_Printf(state,text) end if;return void end function
/// Update `state.errorCount`, `state.lastErrorTime`, `state.errorEntered`, `state.errorMessage` in qcommon.common; the normal completion returns `result`.
///
/// Direct state writes: `state.errorCount`, `state.lastErrorTime`, `state.errorEntered`, `state.errorMessage`.
/// @param state Record exposing `lastErrorTime`, `errorCount`, `buildScript`, `errorEntered`, `errorMessage`, `services`. Updated in place: `errorCount`, `lastErrorTime`, `errorEntered`, `errorMessage`.
/// @param code Initial `code` field stored in the returned or constructed `mq3.qcommon.common.CommonError` record.
/// @param message Initial `message` field stored in the returned or constructed `mq3.qcommon.common.CommonError` record.
function Com_Error(state,code,message)
  if state==void then return CommonError(code,message,true) end if;now=Com_Milliseconds(state);if now-state.lastErrorTime<100 then state.errorCount=state.errorCount+1;if state.errorCount>3 then code=ERR_FATAL end if else state.errorCount=0 end if;state.lastErrorTime=now;if state.buildScript then code=ERR_FATAL end if
  if state.errorEntered then code=ERR_FATAL;message="recursive error after: "+state.errorMessage end if;state.errorEntered=true;state.errorMessage=message;fatal=code==ERR_FATAL
  result=CommonError(code,message,fatal);if state.services.errorFn!=void then state.services.errorFn(state.services.context,result) end if
  if code==ERR_SERVERDISCONNECT or code==ERR_DROP or code==ERR_DISCONNECT or code==ERR_NEED_CD then state.errorEntered=false else Com_Shutdown(state) end if;return result
end function
/// Test quit f in qcommon.common; the normal completion returns `true`.
/// @param state Record exposing `errorEntered`, `services`.
function Com_Quit_f(state) if state==void then return false end if;if not state.errorEntered then if state.services.shutdownServerFn!=void then state.services.shutdownServerFn(state.services.context,"Server quit\n") end if;if state.services.shutdownClientFn!=void then state.services.shutdownClientFn(state.services.context) end if;Com_Shutdown(state);if state.services.shutdownFsFn!=void then state.services.shutdownFsFn(state.services.context,true) end if end if;if state.services.quitFn!=void then state.services.quitFn(state.services.context) end if;return true end function
/// Return `mq3.qcommon.common.Com_Error(state, ERR_DROP, "Testing drop error")` from `qcommon.common.Com_Error_f`.
/// @param state State passed as `state` to `mq3.qcommon.common.Com_Error`.
function Com_Error_f(state) return Com_Error(state,ERR_DROP,"Testing drop error") end function
/// Test freeze f in qcommon.common; the normal completion returns `true`.
/// @param state State passed as `state` to `mq3.qcommon.common.Com_Milliseconds`.
/// @param seconds Seconds used in `(seconds < 0.0)` and `(((Com_Milliseconds(state) - start) * 0.001) <= seconds)`.
function Com_Freeze_f(state,seconds) if seconds<0.0 then seconds=0.0 end if;start=Com_Milliseconds(state);while (Com_Milliseconds(state)-start)*0.001<=seconds end while;return true end function
/// Return `mq3.qcommon.common.Com_Error(state, ERR_FATAL, "Testing crash")` from `qcommon.common.Com_Crash_f`.
/// @param state State passed as `state` to `mq3.qcommon.common.Com_Error`.
function Com_Crash_f(state) return Com_Error(state,ERR_FATAL,"Testing crash") end function

/// Return `mq3.qcommon.startup_commands.parseCommandLine(state.startupState, text)` from `qcommon.common.Com_ParseCommandLine`.
/// @param state Record exposing `startupState`.
/// @param text Command line passed as `commandLine` to `mq3.qcommon.startup_commands.parseCommandLine`.
function Com_ParseCommandLine(state,text) return startup.parseCommandLine(state.startupState,text) end function
/// Return `mq3.qcommon.startup_commands.safeMode(state.startupState)` from `qcommon.common.Com_SafeMode`.
/// @param state Record exposing `startupState`.
function Com_SafeMode(state) return startup.safeMode(state.startupState) end function
/// Return `mq3.qcommon.startup_commands.startupVariable(state.startupState, match)` from `qcommon.common.Com_StartupVariable`.
/// @param state Record exposing `startupState`.
/// @param match Match passed as `match` to `mq3.qcommon.startup_commands.startupVariable`.
function Com_StartupVariable(state,match) return startup.startupVariable(state.startupState,match) end function
/// Return `mq3.qcommon.startup_commands.addStartupCommands(state.startupState)` from `qcommon.common.Com_AddStartupCommands`.
/// @param state Record exposing `startupState`.
function Com_AddStartupCommands(state) return startup.addStartupCommands(state.startupState) end function
/// Compute info print in qcommon.common; the normal completion returns `lines`.
/// @param state State passed as `state` to `mq3.qcommon.common.Com_Printf`.
/// @param text Text passed as `text` to `mq3.qcommon.common.visible`.
function Info_Print(state,text)
  data=bytes(visible(text));at=0;if at<len(data) and data[at]==92 then at=at+1 end if;lines=[]
  while at<len(data) start=at;while at<len(data) and data[at]!=92 at=at+1 end while;key=decode(slice(data,start,at-start));if at>=len(data) then line=key;while len(bytes(line))<20 line=line+" " end while;line=line+"MISSING VALUE\n";lines=lines+[line];Com_Printf(state,line);return lines end if;at=at+1;start=at;while at<len(data) and data[at]!=92 at=at+1 end while;value=decode(slice(data,start,at-start));if at<len(data) then at=at+1 end if;line=key;while len(bytes(line))<20 line=line+" " end while;line=line+value+"\n";lines=lines+[line];Com_Printf(state,line)
  end while;return lines
end function
/// Compute string contains in qcommon.common; the normal completion returns `- 1`.
/// @param str1 Text passed as `text` to `mq3.qcommon.common.visible`.
/// @param str2 Text passed as `text` to `mq3.qcommon.common.visible`.
/// @param casesensitive Casesensitive operand used by `Com_StringContains`; its reads are shown in the implementation.
function Com_StringContains(str1,str2,casesensitive)
  a=bytes(visible(str1));b=bytes(visible(str2));if len(b)==0 then return 0 end if;if len(a)<len(b) then return -1 end if
  for i=0 to len(a)-len(b) found=true;for j=0 to len(b)-1 av=a[i+j];bv=b[j];if not casesensitive then av=lower(av);bv=lower(bv) end if;if av!=bv then found=false;break end if end for;if found then return i end if end for;return -1
end function
/// Test filter in qcommon.common; the normal completion returns `true`.
/// @param filter Text passed as `text` to `mq3.qcommon.common.visible`.
/// @param name Text passed as `text` to `mq3.qcommon.common.visible`.
/// @param casesensitive Casesensitive passed as `casesensitive` to `mq3.qcommon.common.Com_StringContains`.
function Com_Filter(filter,name,casesensitive)
  pattern=bytes(visible(filter));value=bytes(visible(name));pi=0;ni=0
  while pi<len(pattern)
    if pattern[pi]==42 then pi=pi+1;start=pi;while pi<len(pattern) and pattern[pi]!=42 and pattern[pi]!=63 pi=pi+1 end while;if pi>start then token=decode(slice(pattern,start,pi-start));found=Com_StringContains(decode(slice(value,ni,len(value)-ni)),token,casesensitive);if found<0 then return false end if;ni=ni+found+(pi-start) end if
    else if pattern[pi]==63 then pi=pi+1;ni=ni+1;if ni>len(value) then return false end if
    else if pattern[pi]==91 and pi+1<len(pattern) and pattern[pi+1]==91 then pi=pi+1
    else if pattern[pi]==91 then pi=pi+1;matched=false
      while pi<len(pattern) and not matched
        if pattern[pi]==93 and (pi+1>=len(pattern) or pattern[pi+1]!=93) then break end if
        if pi+2<len(pattern) and pattern[pi+1]==45 and (pattern[pi+2]!=93 or (pi+3<len(pattern) and pattern[pi+3]==93)) then low=pattern[pi];high=pattern[pi+2];test=0;if ni<len(value) then test=value[ni] end if;if not casesensitive then low=lower(low);high=lower(high);test=lower(test) end if;if test>=low and test<=high then matched=true end if;pi=pi+3 else test=0;if ni<len(value) then test=value[ni] end if;want=pattern[pi];if not casesensitive then test=lower(test);want=lower(want) end if;if test==want then matched=true end if;pi=pi+1 end if
      end while;if not matched then return false end if;while pi<len(pattern) and not (pattern[pi]==93 and (pi+1>=len(pattern) or pattern[pi+1]!=93)) pi=pi+1 end while;pi=pi+1;ni=ni+1
    else if ni>=len(value) then return false else av=pattern[pi];bv=value[ni];if not casesensitive then av=lower(av);bv=lower(bv) end if;if av!=bv then return false end if;pi=pi+1;ni=ni+1 end if
  end while;return true
end function
/// Normalize path in qcommon.common; the normal completion returns `decode(result)`.
/// @param value Text passed as `text` to `mq3.qcommon.common.visible`.
function normalizePath(value) data=bytes(visible(value));count=len(data);if count>63 then count=63 end if;result=bytes(count,0);if count>0 then for i=0 to count-1 ch=data[i];if ch==92 or ch==58 then ch=47 end if;result[i]=ch end for end if;return decode(result) end function
/// Return `mq3.qcommon.common.Com_Filter(normalizePath(filter), normalizePath(name), casesensitive)` from `qcommon.common.Com_FilterPath`.
/// @param filter Value passed as `value` to `mq3.qcommon.common.normalizePath`.
/// @param name Value passed as `value` to `mq3.qcommon.common.normalizePath`.
/// @param casesensitive Casesensitive passed as `casesensitive` to `mq3.qcommon.common.Com_Filter`.
function Com_FilterPath(filter,name,casesensitive) return Com_Filter(normalizePath(filter),normalizePath(name),casesensitive) end function
/// Compute hash key in qcommon.common; the normal completion returns `((hash ^ (hash >> 10)) ^ (hash >> 20))`.
/// @param text Text passed as `text` to `mq3.qcommon.common.visible`.
/// @param maxLength Max length used in `(count > maxLength)`.
function Com_HashKey(text,maxLength) data=bytes(visible(text));count=len(data);if count>maxLength then count=maxLength end if;hash=0;if count>0 then for i=0 to count-1 value=data[i];if value>=128 then value=value-256 end if;hash=hash+value*(119+i) end for end if;return hash^(hash>>10)^(hash>>20) end function
/// Update `target.sec`, `target.min`, `target.hour`, `target.mday` in qcommon.common; the normal completion returns `value[0]`.
///
/// Direct state writes: `target.sec`, `target.min`, `target.hour`, `target.mday`, `target.mon`, `target.year`, `target.wday`, `target.yday` and further fields.
/// @param state Record exposing `services`.
/// @param target Updated in place: `sec`, `min`, `hour`, `mday`, `mon`, `year` and further fields.
function Com_RealTime(state,target) if state==void or state.services.realTimeFn==void then return 0 end if;value=state.services.realTimeFn(state.services.context);if target!=void and len(value)>1 then target.sec=value[1];target.min=value[2];target.hour=value[3];target.mday=value[4];target.mon=value[5];target.year=value[6];target.wday=value[7];target.yday=value[8];target.isdst=value[9] end if;return value[0] end function

/// Find allocation in qcommon.common.
/// @param zone Record exposing `allocations`.
/// @param handle Handle used in `(value.handle == handle)` and `((value.handle == handle) and not value.freed)`.
function findAllocation(zone,handle) if zone==void then return void end if;for each value in zone.allocations if value.handle==handle and not value.freed then return value end if end for;return void end function
/// Update `zone.capacity`, `zone.used`, `zone.nextHandle`, `zone.allocations` in qcommon.common.
///
/// Direct state writes: `zone.capacity`, `zone.used`, `zone.nextHandle`, `zone.allocations`.
/// @param zone Updated in place: `capacity`, `used`, `nextHandle`, `allocations`.
/// @param size Size operand used by `Z_ClearZone`; its reads are shown in the implementation.
function Z_ClearZone(zone,size) zone.capacity=size;zone.used=0;zone.nextHandle=1;zone.allocations=[];return void end function
/// Compute z available zone memory in qcommon.common; the normal completion returns `(zone.capacity - zone.used)`.
/// @param zone Record exposing `capacity`, `used`.
function Z_AvailableZoneMemory(zone) if zone==void then return 0 end if;return zone.capacity-zone.used end function
/// Return `mq3.qcommon.common.Z_AvailableZoneMemory(state.zone)` from `qcommon.common.Z_AvailableMemory`.
/// @param state Record exposing `zone`.
function Z_AvailableMemory(state) return Z_AvailableZoneMemory(state.zone) end function
/// Compute z tag malloc debug in qcommon.common; the normal completion returns `value`.
/// @param state Record exposing `zone`.
/// @param size Initial `size` field stored in the returned or constructed `mq3.qcommon.common.Allocation` record.
/// @param tag Initial `tag` field stored in the returned or constructed `mq3.qcommon.common.Allocation` record.
/// @param label Initial `label` field stored in the returned or constructed `mq3.qcommon.common.Allocation` record.
/// @param file Reserved argument; this implementation does not read its value.
/// @param line Reserved argument; this implementation does not read its value.
function Z_TagMallocDebug(state,size,tag,label,file,line)
  if state==void or size<0 or tag==TAG_FREE then return void end if;zone=state.zone;if size+zone.used>zone.capacity then return void end if;value=Allocation(zone.nextHandle,bytes(size,0),size,tag,false,HUNK_LOW,false,label);zone.nextHandle=zone.nextHandle+1;zone.used=zone.used+size;zone.allocations=zone.allocations+[value];return value
end function
/// Return `mq3.qcommon.common.Z_TagMallocDebug(state, size, tag, "", "", 0)` from `qcommon.common.Z_TagMalloc`.
/// @param state State passed as `state` to `mq3.qcommon.common.Z_TagMallocDebug`.
/// @param size Size passed as `size` to `mq3.qcommon.common.Z_TagMallocDebug`.
/// @param tag Tag passed as `tag` to `mq3.qcommon.common.Z_TagMallocDebug`.
function Z_TagMalloc(state,size,tag) return Z_TagMallocDebug(state,size,tag,"","",0) end function
/// Return `mq3.qcommon.common.Z_TagMallocDebug(state, size, TAG_GENERAL, label, file, line)` from `qcommon.common.Z_MallocDebug`.
/// @param state State passed as `state` to `mq3.qcommon.common.Z_TagMallocDebug`.
/// @param size Size passed as `size` to `mq3.qcommon.common.Z_TagMallocDebug`.
/// @param label Label passed as `label` to `mq3.qcommon.common.Z_TagMallocDebug`.
/// @param file File passed as `file` to `mq3.qcommon.common.Z_TagMallocDebug`.
/// @param line Line passed as `line` to `mq3.qcommon.common.Z_TagMallocDebug`.
function Z_MallocDebug(state,size,label,file,line) return Z_TagMallocDebug(state,size,TAG_GENERAL,label,file,line) end function
/// Return `mq3.qcommon.common.Z_MallocDebug(state, size, "", "", 0)` from `qcommon.common.Z_Malloc`.
/// @param state State passed as `state` to `mq3.qcommon.common.Z_MallocDebug`.
/// @param size Size passed as `size` to `mq3.qcommon.common.Z_MallocDebug`.
function Z_Malloc(state,size) return Z_MallocDebug(state,size,"","",0) end function
/// Update `state.zone` in qcommon.common; the normal completion returns `value`.
///
/// Direct state writes: `state.zone`.
/// @param state Record exposing `zone`, `smallZone`. Updated in place: `zone`.
/// @param size Size passed as `size` to `mq3.qcommon.common.Z_TagMallocDebug`.
/// @param label Label passed as `label` to `mq3.qcommon.common.Z_TagMallocDebug`.
/// @param file File passed as `file` to `mq3.qcommon.common.Z_TagMallocDebug`.
/// @param line Line passed as `line` to `mq3.qcommon.common.Z_TagMallocDebug`.
function S_MallocDebug(state,size,label,file,line) saved=state.zone;state.zone=state.smallZone;value=Z_TagMallocDebug(state,size,TAG_GENERAL,label,file,line);state.zone=saved;return value end function
/// Return `mq3.qcommon.common.S_MallocDebug(state, size, "", "", 0)` from `qcommon.common.S_Malloc`.
/// @param state State passed as `state` to `mq3.qcommon.common.S_MallocDebug`.
/// @param size Size passed as `size` to `mq3.qcommon.common.S_MallocDebug`.
function S_Malloc(state,size) return S_MallocDebug(state,size,"","",0) end function
/// Update `value.freed` in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `value.freed`.
/// @param state Record exposing `zone`, `smallZone`.
/// @param value Record exposing `freed`, `size`. Updated in place: `freed`.
function Z_Free(state,value)
  if state==void or value==void or value.freed then return false end if;value.freed=true;inMain=false;for each candidate in state.zone.allocations if candidate==value then inMain=true;break end if end for
  if inMain then state.zone.used=state.zone.used-value.size;if state.zone.used<0 then state.zone.used=0 end if else state.smallZone.used=state.smallZone.used-value.size;if state.smallZone.used<0 then state.smallZone.used=0 end if end if;return true
end function
/// Compute z free tags in qcommon.common; the normal completion returns `count`.
/// @param state Record exposing `zone`.
/// @param tag Tag used in `(value.tag == tag)` and `(not value.freed and (value.tag == tag))`.
function Z_FreeTags(state,tag) count=0;for each value in state.zone.allocations if not value.freed and value.tag==tag then Z_Free(state,value);count=count+1 end if end for;return count end function
/// Compute z check heap in qcommon.common; the normal completion returns `(used == state.zone.used)`.
/// @param state Record exposing `zone`.
function Z_CheckHeap(state) if state==void then return false end if;used=0;for each value in state.zone.allocations if not value.freed then used=used+value.size end if end for;return used==state.zone.used end function
/// Compute z log zone heap in qcommon.common; the normal completion returns `result`.
/// @param state Reserved argument; this implementation does not read its value.
/// @param zone Record exposing `used`, `capacity`, `allocations`.
/// @param name Name operand used by `Z_LogZoneHeap`; its reads are shown in the implementation.
function Z_LogZoneHeap(state,zone,name) result=[name,zone.used,zone.capacity,len(zone.allocations)];return result end function
/// Compute qcommon.common.Z_LogHeap as `[Z_LogZoneHeap(state, state.zone, "MAIN"), Z_LogZoneHeap(state, state.smallZone, "SMALL")]`.
/// @param state Record exposing `zone`, `smallZone`.
function Z_LogHeap(state) return [Z_LogZoneHeap(state,state.zone,"MAIN"),Z_LogZoneHeap(state,state.smallZone,"SMALL")] end function
/// Return `decode(bytes(visible(text)))` from `qcommon.common.CopyString`.
/// @param state Reserved argument; this implementation does not read its value.
/// @param text Text passed as `text` to `mq3.qcommon.common.visible`.
function CopyString(state,text) return decode(bytes(visible(text))) end function
/// Update `state.smallZone` in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `state.smallZone`.
/// @param state Updated in place: `smallZone`.
function Com_InitSmallZoneMemory(state) state.smallZone=createZone(512*1024);return true end function
/// Update `state.zone` in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `state.zone`.
/// @param state Updated in place: `zone`.
function Com_InitZoneMemory(state) state.zone=createZone(16*1024*1024);return true end function
/// Compute qcommon.common.Com_Meminfo_f as `[state.zone.used, state.zone.capacity, state.smallZone.used, state.smallZone.capacity, state.hunk.lowPermanent, state.hunk.highPermanent, state.hunk.capacity]`.
/// @param state Record exposing `zone`, `smallZone`, `hunk`.
function Com_Meminfo_f(state) return [state.zone.used,state.zone.capacity,state.smallZone.used,state.smallZone.capacity,state.hunk.lowPermanent,state.hunk.highPermanent,state.hunk.capacity] end function
/// Compute touch memory in qcommon.common; the normal completion returns `sum`.
/// @param state Record exposing `zone`, `hunk`.
function Com_TouchMemory(state) sum=0;for each value in state.zone.allocations if not value.freed and value.size>0 then for each byte in value.data sum=sum+byte end for end if end for;for each value in state.hunk.allocations if not value.freed and value.size>0 then for each byte in value.data sum=sum+byte end for end if end for;return sum end function

/// Update `state.hunk` in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `state.hunk`.
/// @param state Record exposing `hunk`. Updated in place: `hunk`.
function Com_InitHunkMemory(state) if state==void then return false end if;state.hunk=createHunk(state.hunk.capacity);return true end function
/// Compute hunk memory remaining in qcommon.common; the normal completion returns `(h.capacity - (((h.lowPermanent + h.highPermanent) + h.lowTemp) + h.highTemp))`.
/// @param state Record exposing `hunk`.
function Hunk_MemoryRemaining(state) h=state.hunk;return h.capacity-(h.lowPermanent+h.highPermanent+h.lowTemp+h.highTemp) end function
/// Compute hunk set mark in qcommon.common.
/// @param state Record exposing `hunk`.
function Hunk_SetMark(state) state.hunk.markLow=state.hunk.lowPermanent;state.hunk.markHigh=state.hunk.highPermanent;state.hunk.markHandle=state.hunk.nextHandle;return void end function
/// Compute hunk clear to mark in qcommon.common.
/// @param state Record exposing `hunk`.
function Hunk_ClearToMark(state) h=state.hunk;h.lowPermanent=h.markLow;h.highPermanent=h.markHigh;for each value in h.allocations if not value.temporary and value.handle>=h.markHandle then value.freed=true end if end for;return void end function
/// Compute qcommon.common.Hunk_CheckMark as `((state.hunk.markLow != 0) or (state.hunk.markHigh != 0))`.
/// @param state Record exposing `hunk`.
function Hunk_CheckMark(state) return state.hunk.markLow!=0 or state.hunk.markHigh!=0 end function
/// Update `state.hunk` in qcommon.common.
///
/// Direct state writes: `state.hunk`.
/// @param state Record exposing `hunk`. Updated in place: `hunk`.
function Hunk_Clear(state) state.hunk=createHunk(state.hunk.capacity);return void end function
/// Compute hunk swap banks in qcommon.common; the normal completion returns `h.permanentBank`.
/// @param state Record exposing `hunk`.
function Hunk_SwapBanks(state)
  h=state.hunk
  if h.lowTemp>h.lowPermanent then h.permanentBank=HUNK_HIGH
  else if h.highTemp>h.highPermanent then h.permanentBank=HUNK_LOW
  else if h.lowPermanent>h.highPermanent then h.permanentBank=HUNK_HIGH
  else h.permanentBank=HUNK_LOW
  end if
  h.tempBank=HUNK_HIGH;if h.permanentBank==HUNK_HIGH then h.tempBank=HUNK_LOW end if;return h.permanentBank
end function
/// Compute hunk alloc in qcommon.common; the normal completion returns `value`.
/// @param state Record exposing `hunk`.
/// @param size Initial `size` field stored in the returned or constructed `mq3.qcommon.common.Allocation` record.
/// @param preference Preference operand used by `Hunk_Alloc`; its reads are shown in the implementation.
function Hunk_Alloc(state,size,preference) h=state.hunk;size=(size+31)&~31;if size>Hunk_MemoryRemaining(state) then return void end if;bank=preference;if bank!=HUNK_LOW and bank!=HUNK_HIGH then bank=Hunk_SwapBanks(state) end if;value=Allocation(h.nextHandle,bytes(size,0),size,TAG_GENERAL,false,bank,false,"");h.nextHandle=h.nextHandle+1;if bank==HUNK_LOW then h.lowPermanent=h.lowPermanent+size else h.highPermanent=h.highPermanent+size end if;h.allocations=h.allocations+[value];return value end function
/// Compute hunk allocate temp memory in qcommon.common; the normal completion returns `value`.
/// @param state Record exposing `hunk`.
/// @param size Initial `size` field stored in the returned or constructed `mq3.qcommon.common.Allocation` record.
function Hunk_AllocateTempMemory(state,size) h=state.hunk;size=(size+15)&~15;if size>Hunk_MemoryRemaining(state) then return void end if;Hunk_SwapBanks(state);bank=h.tempBank;value=Allocation(h.nextHandle,bytes(size,0),size,TAG_GENERAL,true,bank,false,"");h.nextHandle=h.nextHandle+1;if bank==HUNK_LOW then h.lowTemp=h.lowTemp+size else h.highTemp=h.highTemp+size end if;h.allocations=h.allocations+[value];return value end function
/// Update `value.freed` in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `value.freed`.
/// @param state Record exposing `hunk`.
/// @param value Record exposing `freed`, `temporary`, `bank`, `size`. Updated in place: `freed`.
function Hunk_FreeTempMemory(state,value) if state==void or value==void or value.freed or not value.temporary then return false end if;value.freed=true;if value.bank==HUNK_LOW then state.hunk.lowTemp=state.hunk.lowTemp-value.size else state.hunk.highTemp=state.hunk.highTemp-value.size end if;return true end function
/// Compute hunk clear temp memory in qcommon.common.
/// @param state Record exposing `hunk`.
function Hunk_ClearTempMemory(state) state.hunk.lowTemp=0;state.hunk.highTemp=0;for each value in state.hunk.allocations if value.temporary then value.freed=true end if end for;return void end function
/// Compute qcommon.common.Hunk_Log as `state.hunk.allocations`.
/// @param state Record exposing `hunk`.
function Hunk_Log(state) return state.hunk.allocations end function
/// Compute hunk small log in qcommon.common; the normal completion returns `result`.
/// @param state Record exposing `hunk`.
function Hunk_SmallLog(state) result=[];for each value in state.hunk.allocations if value.size<1024 and not value.freed then result=result+[value] end if end for;return result end function
/// Compute qcommon.common.Hunk_Trash as `void`.
/// @param state Reserved argument; this implementation does not read its value.
function Hunk_Trash(state) return void end function

/// Update `state.journalMode`, `state.journalEvents`, `state.journalIndex`, `state.journalPath` in qcommon.common; the normal completion returns `mode`.
///
/// Direct state writes: `state.journalMode`, `state.journalEvents`, `state.journalIndex`, `state.journalPath`.
/// @param state Record exposing `services`, `journalPath`. Updated in place: `journalMode`, `journalEvents`, `journalIndex`, `journalPath`.
/// @param mode Mode used in `(mode == 2)` and `((mode == 2) and (state.services.readFn != void))`.
/// @param path Path used in `(path != void)`.
function Com_InitJournaling(state,mode,path) state.journalMode=mode;state.journalEvents=[];state.journalIndex=0;if path!=void then state.journalPath=path end if;if mode==2 and state.services.readFn!=void then loaded=state.services.readFn(state.services.context,state.journalPath);if loaded!=void then state.journalEvents=loaded end if end if;return mode end function
/// Update `state.head`, `state.tail`, `state.pushed` in qcommon.common.
///
/// Direct state writes: `state.head`, `state.tail`, `state.pushed`.
/// @param state Updated in place: `head`, `tail`, `pushed`.
function Com_InitPushEvent(state) state.head=0;state.tail=0;state.pushed=array(MAX_PUSHED_EVENTS,void);return void end function
/// Update `state.tail`, `state.head` in qcommon.common.
///
/// Direct state writes: `state.tail`, `state.head`.
/// @param state Record exposing `head`, `tail`, `pushed`. Updated in place: `tail`, `head`.
/// @param event Event operand used by `Com_PushEvent`; its reads are shown in the implementation.
function Com_PushEvent(state,event) if state.head-state.tail>=MAX_PUSHED_EVENTS then state.tail=state.tail+1 end if;state.pushed[state.head&(MAX_PUSHED_EVENTS-1)]=event;state.head=state.head+1;return void end function
/// Get real event in qcommon.common; the normal completion returns `value`.
///
/// Direct state writes: `state.journalIndex`, `state.journalEvents`, `state.journalDirty`.
/// @param state Record exposing `journalMode`, `journalIndex`, `journalEvents`, `services`. Updated in place: `journalIndex`, `journalEvents`, `journalDirty`.
function Com_GetRealEvent(state)
  if state.journalMode==2 then if state.journalIndex>=len(state.journalEvents) then return SysEvent(Com_Milliseconds(state),0,0,0,void) end if;value=state.journalEvents[state.journalIndex];state.journalIndex=state.journalIndex+1;return value end if
  value=SysEvent(0,0,0,0,void);if state.services.realEventFn!=void then value=state.services.realEventFn(state.services.context) end if;if state.journalMode==1 then state.journalEvents=state.journalEvents+[value];state.journalDirty=true end if;return value
end function
/// Get event in qcommon.common; the normal completion returns `Com_GetRealEvent(state)`.
///
/// Direct state writes: `state.tail`.
/// @param state Record exposing `head`, `tail`, `pushed`. Updated in place: `tail`.
function Com_GetEvent(state) if state.head>state.tail then value=state.pushed[state.tail&(MAX_PUSHED_EVENTS-1)];state.tail=state.tail+1;return value end if;return Com_GetRealEvent(state) end function
/// Compute run and time server packet in qcommon.common.
/// @param state Record exposing `services`.
/// @param address Address used in `state.services.packetEventFn(state.services.context, address, data, true)`.
/// @param data Data used in `state.services.packetEventFn(state.services.context, address, data, true)`.
function Com_RunAndTimeServerPacket(state,address,data) if state.services.packetEventFn!=void then return state.services.packetEventFn(state.services.context,address,data,true) end if;return void end function
/// Update `state.frameTime` in qcommon.common; the normal completion returns `last`.
///
/// Direct state writes: `state.frameTime`.
/// @param state Record exposing `frameTime`, `services`, `networkPump`. Updated in place: `frameTime`.
/// @param maxEvents Max events used in `(count < maxEvents)` and `(maxEvents - count)`.
function Com_EventLoop(state,maxEvents)
  count=0;last=state.frameTime;while count<maxEvents event=Com_GetEvent(state);if event==void then break end if;if event.time>last then last=event.time end if;if event.type==0 then break end if;if event.type==5 and state.services.consoleEventFn!=void then state.services.consoleEventFn(state.services.context,event.data) else if event.type==6 and state.services.packetEventFn!=void then state.services.packetEventFn(state.services.context,event.value,event.data,false) end if;count=count+1 end while
  if state.networkPump!=void then network.drain(state.networkPump,maxEvents-count) end if;state.frameTime=last;return last
end function
/// Compute milliseconds in qcommon.common; the normal completion returns `state.frameTime`.
/// @param state Record exposing `services`, `frameTime`.
function Com_Milliseconds(state) if state==void then return 0 end if;if state.services.clockFn!=void then return state.services.clockFn(state.services.context) end if;return state.frameTime end function

/// Compute qcommon.common.padKey as `"                "`.
function padKey() return "                " end function
/// Validate key in qcommon.common; the normal completion returns `state.services.validateKeyFn(state.services.context, key)`.
/// @param state Record exposing `services`.
/// @param key Key used in `bytes(key)` and `len(bytes(key))`.
function validKey(state,key) if len(bytes(key))!=16 then return false end if;if state.services.validateKeyFn==void then return true end if;return state.services.validateKeyFn(state.services.context,key) end function
/// Read key in qcommon.common; the normal completion returns `key`.
/// @param state Record exposing `services`.
/// @param filename Filename used in `(filename + "/q3key")` and `state.services.readFn(state.services.context, (filename + "/q3key"))`.
function readKey(state,filename)
  key=padKey()
  if state.services.readFn!=void then
    value=state.services.readFn(state.services.context,filename+"/q3key")
    if value!=void then
      data=bytes(value)
      if len(data)>=16 then candidate=decode(slice(data,0,16));if validKey(state,candidate) then key=candidate end if end if
    end if
  end if
  return key
end function
/// Read cd key in qcommon.common; the normal completion returns `key`.
///
/// Direct state writes: `state.cdKey`.
/// @param state Record exposing `cdKey`. Updated in place: `cdKey`.
/// @param filename Filename passed as `filename` to `mq3.qcommon.common.readKey`.
function Com_ReadCDKey(state,filename) key=readKey(state,filename);state.cdKey=key+decode(slice(bytes(state.cdKey),16,16));return key end function
/// Append cd key in qcommon.common; the normal completion returns `key`.
///
/// Direct state writes: `state.cdKey`.
/// @param state Record exposing `cdKey`. Updated in place: `cdKey`.
/// @param filename Filename passed as `filename` to `mq3.qcommon.common.readKey`.
function Com_AppendCDKey(state,filename) key=readKey(state,filename);state.cdKey=decode(slice(bytes(state.cdKey),0,16))+key;return key end function
/// Write cd key in qcommon.common.
/// @param state Record exposing `services`.
/// @param filename Filename used in `(filename + "/q3key")`.
/// @param key Key passed as `key` to `mq3.qcommon.common.validKey`.
function Com_WriteCDKey(state,filename,key) key=decode(slice(bytes(key),0,16));if not validKey(state,key) or state.services.writeFn==void then return false end if;return state.services.writeFn(state.services.context,filename+"/q3key",key+"\n// generated by quake, do not modify\r\n// Do not give this file to ANYONE.\r\n// id Software and Activision will NOT ask you to send this file to them.\r\n") end function
/// Update `state.frameTime`, `state.fullyInitialized` in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `state.frameTime`, `state.fullyInitialized`.
/// @param state Record exposing `services`. Updated in place: `frameTime`, `fullyInitialized`.
/// @param commandLine Text passed as `text` to `mq3.qcommon.common.Com_ParseCommandLine`.
function Com_Init(state,commandLine) Com_InitPushEvent(state);Com_InitSmallZoneMemory(state);Com_ParseCommandLine(state,commandLine);Com_InitZoneMemory(state);Com_InitHunkMemory(state);if state.services.initFn!=void then state.services.initFn(state.services.context,state) end if;state.frameTime=Com_Milliseconds(state);Com_AddStartupCommands(state);state.fullyInitialized=true;return true end function
/// Write config to file in qcommon.common; the normal completion returns `config.writeConfigToFile(state.configState, filename)`.
/// @param state Record exposing `configState`.
/// @param filename Filename passed as `filename` to `mq3.qcommon.config_persistence.writeConfigToFile`.
function Com_WriteConfigToFile(state,filename) if state.configState==void then return false end if;return config.writeConfigToFile(state.configState,filename) end function
/// Write configuration in qcommon.common; the normal completion returns `config.writeConfiguration(state.configState)`.
/// @param state Record exposing `configState`.
function Com_WriteConfiguration(state) if state.configState==void then return false end if;return config.writeConfiguration(state.configState) end function
/// Write config f in qcommon.common; the normal completion returns `config.writeConfigCommand(state.configState, state.commandState)`.
/// @param state Record exposing `configState`, `commandState`.
function Com_WriteConfig_f(state) if state.configState==void then return false end if;return config.writeConfigCommand(state.configState,state.commandState) end function
/// Compute modify msec in qcommon.common; the normal completion returns `msec`.
/// @param state Record exposing `fixedTime`, `timescale`, `cameraMode`, `svRunning`, `dedicated`.
/// @param msec Msec used in `(msec < 1)` and `(msec > clamp)`.
function Com_ModifyMsec(state,msec)
  if state.fixedTime!=0 then msec=state.fixedTime
  else if state.timescale!=0.0 then msec=n.trunc32(msec*state.timescale)
  else if state.cameraMode then msec=n.trunc32(msec*state.timescale)
  end if
  if msec<1 and state.timescale!=0.0 then msec=1 end if;clamp=5000;if state.svRunning and not state.dedicated then clamp=200 end if;if msec>clamp then msec=clamp end if;return msec
end function
/// Update `state.lastTime`, `state.frameMsec`, `state.frameNumber` in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `state.lastTime`, `state.frameMsec`, `state.frameNumber`.
/// @param state Record exposing `dedicated`, `maxFps`, `timedemo`, `lastTime`, `commandState`, `engineRuntime`, `frameNumber`. Updated in place: `lastTime`, `frameMsec`, `frameNumber`.
function Com_Frame(state)
  Com_WriteConfiguration(state);minimum=1;if not state.dedicated and state.maxFps>0 and not state.timedemo then minimum=1000/state.maxFps end if;current=Com_EventLoop(state,1024);msec=current-state.lastTime;spins=0
  while msec<minimum and spins<100000 previous=current;current=Com_EventLoop(state,1024);if current<=previous then current=Com_Milliseconds(state) end if;if current<=previous then break end if;msec=current-state.lastTime;spins=spins+1 end while
  if msec<minimum then return false end if;state.lastTime=current;state.frameMsec=msec;msec=Com_ModifyMsec(state,msec);command.execute(state.commandState)
  if state.engineRuntime!=void then engine.serverTick(state.engineRuntime,current,msec);if not state.dedicated then Com_EventLoop(state,1024);command.execute(state.commandState);engine.clientTick(state.engineRuntime,current,msec) end if end if;state.frameNumber=state.frameNumber+1;return true
end function
/// Update `state.shutdown` in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `state.shutdown`.
/// @param state Record exposing `shutdown`, `journalMode`, `journalDirty`, `services`, `journalPath`, `journalEvents`. Updated in place: `shutdown`.
function Com_Shutdown(state) if state==void or state.shutdown then return false end if;if state.journalMode==1 and state.journalDirty and state.services.writeFn!=void then state.services.writeFn(state.services.context,state.journalPath,state.journalEvents) end if;if state.services.shutdownFn!=void then state.services.shutdownFn(state.services.context,state) end if;state.shutdown=true;return true end function

/// Update `destination entries` in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `destination elements`.
/// @param destination Mutable sequence written at `i`.
/// @param source Source used in `len(source)` and `(count > len(source))`.
/// @param count Count used in `(count < 0)` and `(count > 0)`.
function Com_Memcpy(destination,source,count) if count<0 or count>len(source) or count>len(destination) then return false end if;if count>0 then temp=slice(source,0,count);for i=0 to count-1 destination[i]=temp[i] end for end if;return true end function
/// Update `destination entries` in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `destination elements`.
/// @param destination Mutable sequence written at `i`.
/// @param value Value used in `(value & 255)`.
/// @param count Count used in `(count < 0)` and `(count > 0)`.
function Com_Memset(destination,value,count) if count<0 or count>len(destination) then return false end if;if count>0 then for i=0 to count-1 destination[i]=value&255 end for end if;return true end function
/// Test memcmp in qcommon.common; the normal completion returns `true`.
/// @param left Left used in `left[i]` and `len(left)`.
/// @param right Right used in `right[i]` and `len(right)`.
/// @param count Count used in `(count < 0)` and `(count > 0)`.
function Com_Memcmp(left,right,count) if count<0 or count>len(left) or count>len(right) then return false end if;if count>0 then for i=0 to count-1 if left[i]!=right[i] then return false end if end for end if;return true end function
/// Copy d word in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `destination elements`.
/// @param destination Mutable sequence written at `i`.
/// @param constant Constant operand used by `_copyDWord`; its reads are shown in the implementation.
/// @param count Count used in `(count < 0)` and `(count > 0)`.
function _copyDWord(destination,constant,count) if count<0 or count>len(destination) then return false end if;if count>0 then for i=0 to count-1 destination[i]=constant end for end if;return true end function
/// Compute qcommon.common.Com_Prefetch as `void`.
/// @param source Reserved argument; this implementation does not read its value.
/// @param count Reserved argument; this implementation does not read its value.
/// @param type Reserved argument; this implementation does not read its value.
function Com_Prefetch(source,count,type) return void end function
/// Compute acos in qcommon.common; the normal completion returns `angle`.
/// @param value Floating-point operand.
function Q_acos(value) angle=n.f32(acos(value));if angle>3.141592653589793 or angle<(-3.141592653589793) then return n.f32(3.141592653589793) end if;return angle end function

/// Update `edit.buffer`, `edit.cursor`, `edit.scroll` in qcommon.common.
///
/// Direct state writes: `edit.buffer`, `edit.cursor`, `edit.scroll`.
/// @param edit Updated in place: `buffer`, `cursor`, `scroll`.
function Field_Clear(edit) edit.buffer="";edit.cursor=0;edit.scroll=0;return void end function
/// Find matches in qcommon.common; the normal completion returns `true`.
///
/// Direct state writes: `state.matchCount`, `state.shortestMatch`.
/// @param state Record exposing `completionString`, `matchCount`, `shortestMatch`. Updated in place: `matchCount`, `shortestMatch`.
/// @param value Left passed as `left` to `mq3.qcommon.common.samePrefix`.
function FindMatches(state,value) if not samePrefix(value,state.completionString,len(bytes(state.completionString)),false) then return false end if;state.matchCount=state.matchCount+1;if state.matchCount==1 then state.shortestMatch=value;return true end if;left=bytes(state.shortestMatch);right=bytes(value);count=len(left);if len(right)<count then count=len(right) end if;common=0;while common<count and lower(left[common])==lower(right[common]) common=common+1 end while;state.shortestMatch=decode(slice(left,0,common));return true end function
/// Test print matches in qcommon.common; the normal completion returns `false`.
/// @param state Record exposing `shortestMatch`.
/// @param value Left passed as `left` to `mq3.qcommon.common.samePrefix`.
function PrintMatches(state,value) if samePrefix(value,state.shortestMatch,len(bytes(state.shortestMatch)),false) then Com_Printf(state,"    "+value+"\n");return true end if;return false end function
/// Compute quote arg in qcommon.common; the normal completion returns `value`.
/// @param value Value used in `bytes(value)` and `("\"" + value)`.
function quoteArg(value) for each ch in bytes(value) if ch==32 then return "\""+value+"\"" end if end for;return value end function
/// Compute key concat args in qcommon.common; the normal completion returns `result`.
/// @param state Record exposing `commandState`, `completionField`.
function keyConcatArgs(state) result="";if command.argc(state.commandState)>1 then for i=1 to command.argc(state.commandState)-1 result=result+" "+quoteArg(command.argv(state.commandState,i)) end for end if;state.completionField.buffer=state.completionField.buffer+result;return result end function
/// Compute concat remaining in qcommon.common; the normal completion returns `text`.
/// @param state Record exposing `completionField`.
/// @param source Source used in `bytes(source)`.
/// @param start Start used in `bytes(start)` and `(decode(slice(data, i, len(needle))) == start)`.
function ConcatRemaining(state,source,start) data=bytes(source);needle=bytes(start);at=-1;if len(needle)==0 then at=0 else if len(data)>=len(needle) then for i=0 to len(data)-len(needle) if decode(slice(data,i,len(needle)))==start then at=i+len(needle);break end if end for end if;if at<0 then return keyConcatArgs(state) end if;text=decode(slice(data,at,len(data)-at));state.completionField.buffer=state.completionField.buffer+text;return text end function
/// Update `state.completionField`, `state.completionString`, `state.shortestMatch`, `state.matchCount` in qcommon.common; the normal completion returns `state.matchCount`.
///
/// Direct state writes: `state.completionField`, `state.completionString`, `state.shortestMatch`, `state.matchCount`, `field.buffer`, `field.cursor`.
/// @param state Record exposing `commandState`, `matchCount`, `shortestMatch`. Updated in place: `completionField`, `completionString`, `shortestMatch`, `matchCount`.
/// @param field Record exposing `buffer`. Updated in place: `buffer`, `cursor`.
/// @param commandNames Sequence traversed as `candidate` by the loop in `Field_CompleteCommand`.
/// @param cvarNames Sequence traversed as `candidate` by the loop in `Field_CompleteCommand`.
function Field_CompleteCommand(state,field,commandNames,cvarNames)
  state.completionField=field;command.tokenizeString(state.commandState,field.buffer);value=command.argv(state.commandState,0);if len(value)>0 and (bytes(value)[0]==92 or bytes(value)[0]==47) then value=decode(slice(bytes(value),1,len(bytes(value))-1)) end if;state.completionString=value;state.shortestMatch="";state.matchCount=0;if len(value)==0 then return 0 end if
  for each candidate in commandNames FindMatches(state,candidate) end for;for each candidate in cvarNames FindMatches(state,candidate) end for;if state.matchCount==0 then return 0 end if;original=field.buffer;field.buffer="\\"+state.shortestMatch;if state.matchCount==1 and command.argc(state.commandState)==1 then field.buffer=field.buffer+" " else ConcatRemaining(state,original,value) end if;field.cursor=len(bytes(field.buffer));if state.matchCount>1 then Com_Printf(state,"]"+field.buffer+"\n");for each candidate in commandNames PrintMatches(state,candidate) end for;for each candidate in cvarNames PrintMatches(state,candidate) end for end if;return state.matchCount
end function
/// Return `mq3.qcommon.common.Hunk_Alloc(state, size, preference)` from `qcommon.common.permanent`.
/// @param state State passed as `state` to `mq3.qcommon.common.Hunk_Alloc`.
/// @param size Size passed as `size` to `mq3.qcommon.common.Hunk_Alloc`.
/// @param preference Preference passed as `preference` to `mq3.qcommon.common.Hunk_Alloc`.
function permanent(state,size,preference) return Hunk_Alloc(state,size,preference) end function
