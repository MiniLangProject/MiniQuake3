// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native facade for client/cl_ui.c over the productive UI services.
package mq3.client.cl_ui_runtime
import mq3.client.ui_lan_browser as lan
import mq3.client.ui_lan_cache as cache
import mq3.client.ui_lan_queries as queries
import mq3.client.ui_host_lifecycle as hostState
import mq3.client.ui_vm as uiVm
import mq3.vm.syscall_ui as syscalls
import mq3.compat.numeric as n

const MAX_CONFIGSTRINGS=1024
const CVAR_ARCHIVE=1
/// Stores engine client UI runtime state, including `browser`, `cacheHost`, `queryState`, `syscallHost`, `ui`, `clientState` and additional values.
struct State browser cacheHost queryState syscallHost ui clientState glconfig configStrings clipboard cdKey fsGame modifiedFlags keyCatchers realtime end struct

/// Creates the engine client UI runtime error `7801` with diagnostic text `"cl_ui: "+message`.
/// @param message Argument 2 of `error`; passed as `"cl_ui: "+message`.
function fail(message) return error(7801,"cl_ui: "+message) end function
/// Calls `mq3.client.ui_lan_browser.create`, `mq3.client.cl_ui_runtime.State` from engine client UI runtime `create`.
/// @param browser Value used by `if browser==void then browser=lan.create() end if`.
/// @param cacheHost Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`.
/// @param queryState Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`.
/// @param syscallHost Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`.
/// @param ui Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`.
/// @param clientState Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`.
/// @param glconfig Value used by `return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)`.
/// @param configStrings Value used by `if configStrings==void then configStrings=array(MAX_CONFIGSTRINGS,"") end if`.
function create(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings)
  if browser==void then browser=lan.create() end if;if configStrings==void then configStrings=array(MAX_CONFIGSTRINGS,"") end if
  return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)
end function
/// Calls `decode`, `slice` from engine client UI runtime `bounded`. The final path returns `decode(slice(raw,0,count))`.
/// @param text Text consumed or emitted by `bounded` in the engine client UI runtime path.
/// @param capacity Maximum number of entries or bytes accepted by this container.
function bounded(text,capacity) if text==void or capacity<=0 then return "" end if;raw=bytes(text);count=len(raw);if count>=capacity then count=capacity-1 end if;return decode(slice(raw,0,count)) end function

/// Calls `mq3.client.ui_host_lifecycle.encodeClientState` from engine client UI runtime `GetClientState`. The final path returns `hostState.encodeClientState(state.clientState)`.
/// @param state Record read through `state.clientState`.
function GetClientState(state) if state==void or state.clientState==void then return fail("client state unavailable") end if;return hostState.encodeClientState(state.clientState) end function
/// Calls `mq3.client.ui_lan_cache.load` from engine client UI runtime `LAN_LoadCachedServers`. The final path returns `cache.load(state.browser,state.cacheHost)`.
/// @param state Record read through `state.browser`, `state.cacheHost`.
function LAN_LoadCachedServers(state) if state==void then return false end if;return cache.load(state.browser,state.cacheHost) end function
/// Calls `mq3.client.ui_lan_cache.save` from engine client UI runtime `LAN_SaveServersToCache`. The final path returns `cache.save(state.browser,state.cacheHost)`.
/// @param state Record read through `state.browser`, `state.cacheHost`.
function LAN_SaveServersToCache(state) if state==void then return false end if;return cache.save(state.browser,state.cacheHost) end function
/// Adapts `mq3.client.ui_lan_browser.resetPings` to engine client UI runtime `LAN_ResetPings`, returning its result for `state.browser, source`.
/// @param state Record read through `state.browser`.
/// @param source Argument 2 of `mq3.client.ui_lan_browser.resetPings`.
function LAN_ResetPings(state,source) return lan.resetPings(state.browser,source) end function
/// Adapts `mq3.client.ui_lan_browser.add` to engine client UI runtime `LAN_AddServer`, returning its result for `state.browser, source, name, address`.
/// @param state Record read through `state.browser`.
/// @param source Argument 2 of `mq3.client.ui_lan_browser.add`.
/// @param name Argument 3 of `mq3.client.ui_lan_browser.add`.
/// @param address Argument 4 of `mq3.client.ui_lan_browser.add`.
function LAN_AddServer(state,source,name,address) return lan.add(state.browser,source,name,address) end function
/// Adapts `mq3.client.ui_lan_browser.remove` to engine client UI runtime `LAN_RemoveServer`, returning its result for `state.browser, source, address`.
/// @param state Record read through `state.browser`.
/// @param source Argument 2 of `mq3.client.ui_lan_browser.remove`.
/// @param address Argument 3 of `mq3.client.ui_lan_browser.remove`.
function LAN_RemoveServer(state,source,address) return lan.remove(state.browser,source,address) end function
/// Adapts `mq3.client.ui_lan_browser.count` to engine client UI runtime `LAN_GetServerCount`, returning its result for `state.browser, source`.
/// @param state Record read through `state.browser`.
/// @param source Argument 2 of `mq3.client.ui_lan_browser.count`.
function LAN_GetServerCount(state,source) return lan.count(state.browser,source) end function
/// Adapts `mq3.client.cl_ui_runtime.bounded` to engine client UI runtime `LAN_GetServerAddressString`, returning its result for `lan.address(state.browser,source,index), capacity`.
/// @param state Record read through `state.browser`.
/// @param source Argument 1 of `mq3.client.cl_ui_runtime.bounded`; passed as `lan.address(state.browser,source,index)`.
/// @param index Argument 1 of `mq3.client.cl_ui_runtime.bounded`; passed as `lan.address(state.browser,source,index)`.
/// @param capacity Maximum number of entries or bytes accepted by this container. Forwarded to `mq3.client.cl_ui_runtime.bounded`.
function LAN_GetServerAddressString(state,source,index,capacity) return bounded(lan.address(state.browser,source,index),capacity) end function
/// Adapts `mq3.client.cl_ui_runtime.bounded` to engine client UI runtime `LAN_GetServerInfo`, returning its result for `lan.serverInfo(state.browser,source,index), capacity`.
/// @param state Record read through `state.browser`.
/// @param source Argument 1 of `mq3.client.cl_ui_runtime.bounded`; passed as `lan.serverInfo(state.browser,source,index)`.
/// @param index Argument 1 of `mq3.client.cl_ui_runtime.bounded`; passed as `lan.serverInfo(state.browser,source,index)`.
/// @param capacity Maximum number of entries or bytes accepted by this container. Forwarded to `mq3.client.cl_ui_runtime.bounded`.
function LAN_GetServerInfo(state,source,index,capacity) return bounded(lan.serverInfo(state.browser,source,index),capacity) end function
/// Adapts `mq3.client.ui_lan_browser.serverPing` to engine client UI runtime `LAN_GetServerPing`, returning its result for `state.browser, source, index`.
/// @param state Record read through `state.browser`.
/// @param source Argument 2 of `mq3.client.ui_lan_browser.serverPing`.
/// @param index Argument 3 of `mq3.client.ui_lan_browser.serverPing`.
function LAN_GetServerPing(state,source,index) return lan.serverPing(state.browser,source,index) end function
/// Adapts `mq3.client.ui_lan_browser.at` to engine client UI runtime `LAN_GetServerPtr`, returning its result for `state.browser, source, index`.
/// @param state Record read through `state.browser`.
/// @param source Argument 2 of `mq3.client.ui_lan_browser.at`.
/// @param index Argument 3 of `mq3.client.ui_lan_browser.at`.
function LAN_GetServerPtr(state,source,index) return lan.at(state.browser,source,index) end function
/// Adapts `mq3.client.ui_lan_browser.compare` to engine client UI runtime `LAN_CompareServers`, returning its result for `state.browser, source, sortKey, sortDir, first, second`.
/// @param state Record read through `state.browser`.
/// @param source Argument 2 of `mq3.client.ui_lan_browser.compare`.
/// @param sortKey Argument 3 of `mq3.client.ui_lan_browser.compare`.
/// @param sortDir Argument 4 of `mq3.client.ui_lan_browser.compare`.
/// @param first Argument 5 of `mq3.client.ui_lan_browser.compare`.
/// @param second Argument 6 of `mq3.client.ui_lan_browser.compare`.
function LAN_CompareServers(state,source,sortKey,sortDir,first,second) return lan.compare(state.browser,source,sortKey,sortDir,first,second) end function
/// Adapts `mq3.client.ui_lan_browser.pingCount` to engine client UI runtime `LAN_GetPingQueueCount`, returning its result for `state.browser`.
/// @param state Record read through `state.browser`.
function LAN_GetPingQueueCount(state) return lan.pingCount(state.browser) end function
/// Adapts `mq3.client.ui_lan_browser.clearPing` to engine client UI runtime `LAN_ClearPing`, returning its result for `state.browser, index`.
/// @param state Record read through `state.browser`.
/// @param index Argument 2 of `mq3.client.ui_lan_browser.clearPing`.
function LAN_ClearPing(state,index) return lan.clearPing(state.browser,index) end function
/// Calls `mq3.client.ui_lan_browser.getPing`, `mq3.client.cl_ui_runtime.bounded` from engine client UI runtime `LAN_GetPing`. The final path returns `[bounded(value[0],capacity),value[1]]`.
/// @param state Record read through `state.browser`.
/// @param index Value used by `value=lan.getPing(state.browser,index)`.
/// @param capacity Maximum number of entries or bytes accepted by this container.
function LAN_GetPing(state,index,capacity) value=lan.getPing(state.browser,index);return [bounded(value[0],capacity),value[1]] end function
/// Adapts `mq3.client.cl_ui_runtime.bounded` to engine client UI runtime `LAN_GetPingInfo`, returning its result for `lan.getPingInfo(state.browser,index), capacity`.
/// @param state Record read through `state.browser`.
/// @param index Argument 1 of `mq3.client.cl_ui_runtime.bounded`; passed as `lan.getPingInfo(state.browser,index)`.
/// @param capacity Maximum number of entries or bytes accepted by this container. Forwarded to `mq3.client.cl_ui_runtime.bounded`.
function LAN_GetPingInfo(state,index,capacity) return bounded(lan.getPingInfo(state.browser,index),capacity) end function
/// Adapts `mq3.client.ui_lan_browser.markVisible` to engine client UI runtime `LAN_MarkServerVisible`, returning its result for `state.browser, source, index, visible`.
/// @param state Record read through `state.browser`.
/// @param source Argument 2 of `mq3.client.ui_lan_browser.markVisible`.
/// @param index Argument 3 of `mq3.client.ui_lan_browser.markVisible`.
/// @param visible Argument 4 of `mq3.client.ui_lan_browser.markVisible`.
function LAN_MarkServerVisible(state,source,index,visible) return lan.markVisible(state.browser,source,index,visible) end function
/// Adapts `mq3.client.ui_lan_browser.isVisible` to engine client UI runtime `LAN_ServerIsVisible`, returning its result for `state.browser, source, index`.
/// @param state Record read through `state.browser`.
/// @param source Argument 2 of `mq3.client.ui_lan_browser.isVisible`.
/// @param index Argument 3 of `mq3.client.ui_lan_browser.isVisible`.
function LAN_ServerIsVisible(state,source,index) return lan.isVisible(state.browser,source,index) end function
/// Calls `mq3.client.ui_lan_queries.setRealtime`, `mq3.client.ui_lan_queries.updateVisiblePings`, `mq3.client.ui_lan_browser.updateVisiblePings` from engine client UI runtime `LAN_UpdateVisiblePings`. The final path returns `lan.updateVisiblePings(state.browser,source)`.
/// @param state Record read through `state.queryState`, `state.realtime`, `state.browser`.
/// @param source Value used by `return queries.updateVisiblePings(state.queryState,source) end if`.
function LAN_UpdateVisiblePings(state,source)
  if state.queryState!=void then queries.setRealtime(state.queryState,state.realtime);return queries.updateVisiblePings(state.queryState,source) end if;return lan.updateVisiblePings(state.browser,source)
end function
/// Calls `mq3.client.ui_lan_queries.setRealtime`, `mq3.client.ui_lan_queries.serverStatus`, `mq3.client.ui_lan_browser.serverStatus` and additional helpers from engine client UI runtime `LAN_GetServerStatus`. The final path returns `[true,bounded(value,capacity)]`.
/// @param state Record read through `state.queryState`, `state.realtime`, `state.browser`.
/// @param address Value used by `value=queries.serverStatus(state.queryState,address) else value=lan.serverStatus(state.browser,address) end if`.
/// @param capacity Maximum number of entries or bytes accepted by this container.
function LAN_GetServerStatus(state,address,capacity)
  value=void;if state.queryState!=void then queries.setRealtime(state.queryState,state.realtime);value=queries.serverStatus(state.queryState,address) else value=lan.serverStatus(state.browser,address) end if
  if value==void then return [false,""] end if;return [true,bounded(value,capacity)]
end function
/// Calls `slice` from engine client UI runtime `CL_GetGlconfig`. The final path returns `slice(state.glconfig,0,len(state.glconfig))`.
/// @param state Record read through `state.glconfig`.
function CL_GetGlconfig(state) if state==void or typeof(state.glconfig)!="bytes" then return fail("glconfig unavailable") end if;return slice(state.glconfig,0,len(state.glconfig)) end function
/// Adapts `mq3.client.cl_ui_runtime.bounded` to engine client UI runtime `GetClipboardData`, returning its result for `state.clipboard, capacity`.
/// @param state Record read through `state.clipboard`.
/// @param capacity Maximum number of entries or bytes accepted by this container. Forwarded to `mq3.client.cl_ui_runtime.bounded`.
function GetClipboardData(state,capacity) return bounded(state.clipboard,capacity) end function
/// Calls `mq3.client.cl_ui_runtime.bounded`, `state.syscallHost.keys.keyNameFn` from engine client UI runtime `Key_KeynumToStringBuf`. The final path returns `bounded(state.syscallHost.keys.keyNameFn(state.syscallHost.context,keynum),capacity)`.
/// @param state Record read through `state.syscallHost`, `state.syscallHost.keys.keyNameFn`, `state.syscallHost.context`.
/// @param keynum Quake III key number identifying the keyboard or mouse input.
/// @param capacity Maximum number of entries or bytes accepted by this container.
function Key_KeynumToStringBuf(state,keynum,capacity) if state.syscallHost==void or state.syscallHost.keys.keyNameFn==void then return "" end if;return bounded(state.syscallHost.keys.keyNameFn(state.syscallHost.context,keynum),capacity) end function
/// Calls `mq3.client.cl_ui_runtime.bounded`, `state.syscallHost.keys.bindingFn` from engine client UI runtime `Key_GetBindingBuf`. The final path returns `bounded(state.syscallHost.keys.bindingFn(state.syscallHost.context,keynum),capacity)`.
/// @param state Record read through `state.syscallHost`, `state.syscallHost.keys.bindingFn`, `state.syscallHost.context`.
/// @param keynum Quake III key number identifying the keyboard or mouse input.
/// @param capacity Maximum number of entries or bytes accepted by this container.
function Key_GetBindingBuf(state,keynum,capacity) if state.syscallHost==void or state.syscallHost.keys.bindingFn==void then return "" end if;return bounded(state.syscallHost.keys.bindingFn(state.syscallHost.context,keynum),capacity) end function
/// Calls `state.syscallHost.keys.getCatcherFn` from engine client UI runtime `Key_GetCatcher`. The final path returns `state.keyCatchers`.
/// @param state Record read through `state.syscallHost`, `state.syscallHost.keys.getCatcherFn`, `state.syscallHost.context`, `state.keyCatchers`.
function Key_GetCatcher(state) if state.syscallHost!=void and state.syscallHost.keys.getCatcherFn!=void then return state.syscallHost.keys.getCatcherFn(state.syscallHost.context) end if;return state.keyCatchers end function
/// Updates `state.keyCatchers` during engine client UI runtime `Key_SetCatcher`.
/// @param state Mutable engine client UI runtime record/storage; this routine assigns `state.keyCatchers`.
/// @param catcher Value assigned to `state.keyCatchers`.
function Key_SetCatcher(state,catcher) state.keyCatchers=catcher;if state.syscallHost!=void and state.syscallHost.keys.setCatcherFn!=void then state.syscallHost.keys.setCatcherFn(state.syscallHost.context,catcher) end if;return void end function

/// Calls `copyBytes`, `decode` from engine client UI runtime `keySegment`. The final path returns `decode(result)`.
/// @param value Value used by `raw=bytes(value)`.
/// @param offset Value tested by `offset<len(raw)` before the calculation continues.
function keySegment(value,offset) raw=bytes(value);result=bytes(16,0);if offset<len(raw) then count=len(raw)-offset;if count>16 then count=16 end if;if count>0 then copyBytes(result,0,raw,offset,count) end if end if;return decode(result) end function
/// Calls `copyBytes` from engine client UI runtime `normalizedKey`. The final path returns `result`.
/// @param value Value used by `raw=bytes(value)`.
function normalizedKey(value) raw=bytes(value);result=bytes(16,0);count=len(raw);if count>16 then count=16 end if;if count>0 then copyBytes(result,0,raw,0,count) end if;return result end function
/// Calls `mq3.client.cl_ui_runtime.UI_usesUniqueCDKey`, `mq3.client.cl_ui_runtime.bounded`, `mq3.client.cl_ui_runtime.keySegment` from engine client UI runtime `CLUI_GetCDKey`. The final path returns `bounded(keySegment(state.cdKey,offset),capacity)`.
/// @param state Record read through `state.fsGame`, `state.cdKey`.
/// @param capacity Maximum number of entries or bytes accepted by this container.
function CLUI_GetCDKey(state,capacity)
  offset=0;if UI_usesUniqueCDKey(state) and state.fsGame!="" then offset=16 end if;return bounded(keySegment(state.cdKey,offset),capacity)
end function
/// Updates `state.cdKey`, `state.modifiedFlags` during engine client UI runtime `CLUI_SetCDKey`.
/// @param state Mutable engine client UI runtime record/storage; this routine assigns `state.cdKey`, `state.modifiedFlags`.
/// @param value Value used by `part=normalizedKey(value)`.
function CLUI_SetCDKey(state,value)
  old=bytes(state.cdKey);combined=bytes(32,0);count=len(old);if count>32 then count=32 end if;if count>0 then copyBytes(combined,0,old,0,count) end if;part=normalizedKey(value);offset=0;if UI_usesUniqueCDKey(state) and state.fsGame!="" then offset=16 end if;copyBytes(combined,offset,part,0,16);state.cdKey=decode(combined);state.modifiedFlags=state.modifiedFlags|CVAR_ARCHIVE;return void
end function
/// Calls `mq3.client.cl_ui_runtime.bounded` from engine client UI runtime `GetConfigString`. The final path returns `bounded(state.configStrings[index],capacity)`.
/// @param state Record read through `state.configStrings`.
/// @param index Value tested by `index<0 or index>=MAX_CONFIGSTRINGS or index>=len(state.configStrings) or state.configStrings[index]==""` before the calculation continues.
/// @param capacity Maximum number of entries or bytes accepted by this container.
function GetConfigString(state,index,capacity) if index<0 or index>=MAX_CONFIGSTRINGS or index>=len(state.configStrings) or state.configStrings[index]=="" then return void end if;return bounded(state.configStrings[index],capacity) end function
/// Adapts `mq3.compat.numeric.i32` to engine client UI runtime `FloatAsInt`, returning its result for `n.floatBits(value)`.
/// @param value Argument 1 of `mq3.compat.numeric.i32`; passed as `n.floatBits(value)`.
function FloatAsInt(value) return n.i32(n.floatBits(value)) end function
/// Calls `mq3.vm.syscall_ui.dispatch` from engine client UI runtime `CL_UISystemCalls`. The final path returns `syscalls.dispatch(state.syscallHost,vm,base)`.
/// @param state Record read through `state.syscallHost`.
/// @param vm Value used by `return syscalls.dispatch(state.syscallHost,vm,base)`.
/// @param base Value used by `return syscalls.dispatch(state.syscallHost,vm,base)`.
function CL_UISystemCalls(state,vm,base) if state==void or state.syscallHost==void then return fail("UI syscall host unavailable") end if;return syscalls.dispatch(state.syscallHost,vm,base) end function
/// Calls `mq3.client.cl_ui_runtime.Key_SetCatcher`, `mq3.client.cl_ui_runtime.Key_GetCatcher`, `mq3.client.ui_vm.shutdown` from engine client UI runtime `CL_ShutdownUI`. The final path returns `uiVm.shutdown(state.ui)`.
/// @param state Record read through `state.ui`.
function CL_ShutdownUI(state)
  if state==void then return void end if
  // cls.keyCatchers is host-owned in Baseq3.  Read and update that authoritative
  // value before inspecting the VM, so shutdown also clears UI ownership when
  // the local facade mirror is stale or the VM has already gone away.
  Key_SetCatcher(state,Key_GetCatcher(state)&(~hostState.KEYCATCH_UI))
  if state.ui==void then return void end if;return uiVm.shutdown(state.ui)
end function
/// Calls `mq3.client.ui_vm.initialize` from engine client UI runtime `CL_InitUI`. The final path returns `uiVm.initialize(state.ui,connectionState,connectedToPureServer,vmUi)`.
/// @param state Record read through `state.ui`.
/// @param connectionState Value used by `return uiVm.initialize(state.ui,connectionState,connectedToPureServer,vmUi)`.
/// @param connectedToPureServer Value used by `return uiVm.initialize(state.ui,connectionState,connectedToPureServer,vmUi)`.
/// @param vmUi Value used by `return uiVm.initialize(state.ui,connectionState,connectedToPureServer,vmUi)`.
function CL_InitUI(state,connectionState,connectedToPureServer,vmUi) if state==void or state.ui==void then return fail("UI VM unavailable") end if;return uiVm.initialize(state.ui,connectionState,connectedToPureServer,vmUi) end function
/// Calls `mq3.client.ui_vm.usesUniqueCdKey` from engine client UI runtime `UI_usesUniqueCDKey`. The final path returns `uiVm.usesUniqueCdKey(state.ui)`.
/// @param state Record read through `state.ui`.
function UI_usesUniqueCDKey(state) if state==void or state.ui==void then return false end if;return uiVm.usesUniqueCdKey(state.ui) end function
/// Calls `mq3.client.ui_vm.consoleCommand` from engine client UI runtime `UI_GameCommand`. The final path returns `uiVm.consoleCommand(state.ui,state.realtime)!=0`.
/// @param state Record read through `state.ui`, `state.realtime`.
function UI_GameCommand(state) if state==void or state.ui==void then return false end if;return uiVm.consoleCommand(state.ui,state.realtime)!=0 end function
