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
struct State browser cacheHost queryState syscallHost ui clientState glconfig configStrings clipboard cdKey fsGame modifiedFlags keyCatchers realtime end struct

function fail(message) return error(7801,"cl_ui: "+message) end function
function create(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings)
  if browser==void then browser=lan.create() end if;if configStrings==void then configStrings=array(MAX_CONFIGSTRINGS,"") end if
  return State(browser,cacheHost,queryState,syscallHost,ui,clientState,glconfig,configStrings,"","", "",0,0,0)
end function
function bounded(text,capacity) if text==void or capacity<=0 then return "" end if;raw=bytes(text);count=len(raw);if count>=capacity then count=capacity-1 end if;return decode(slice(raw,0,count)) end function

function GetClientState(state) if state==void or state.clientState==void then return fail("client state unavailable") end if;return hostState.encodeClientState(state.clientState) end function
function LAN_LoadCachedServers(state) if state==void then return false end if;return cache.load(state.browser,state.cacheHost) end function
function LAN_SaveServersToCache(state) if state==void then return false end if;return cache.save(state.browser,state.cacheHost) end function
function LAN_ResetPings(state,source) return lan.resetPings(state.browser,source) end function
function LAN_AddServer(state,source,name,address) return lan.add(state.browser,source,name,address) end function
function LAN_RemoveServer(state,source,address) return lan.remove(state.browser,source,address) end function
function LAN_GetServerCount(state,source) return lan.count(state.browser,source) end function
function LAN_GetServerAddressString(state,source,index,capacity) return bounded(lan.address(state.browser,source,index),capacity) end function
function LAN_GetServerInfo(state,source,index,capacity) return bounded(lan.serverInfo(state.browser,source,index),capacity) end function
function LAN_GetServerPing(state,source,index) return lan.serverPing(state.browser,source,index) end function
function LAN_GetServerPtr(state,source,index) return lan.at(state.browser,source,index) end function
function LAN_CompareServers(state,source,sortKey,sortDir,first,second) return lan.compare(state.browser,source,sortKey,sortDir,first,second) end function
function LAN_GetPingQueueCount(state) return lan.pingCount(state.browser) end function
function LAN_ClearPing(state,index) return lan.clearPing(state.browser,index) end function
function LAN_GetPing(state,index,capacity) value=lan.getPing(state.browser,index);return [bounded(value[0],capacity),value[1]] end function
function LAN_GetPingInfo(state,index,capacity) return bounded(lan.getPingInfo(state.browser,index),capacity) end function
function LAN_MarkServerVisible(state,source,index,visible) return lan.markVisible(state.browser,source,index,visible) end function
function LAN_ServerIsVisible(state,source,index) return lan.isVisible(state.browser,source,index) end function
function LAN_UpdateVisiblePings(state,source)
  if state.queryState!=void then queries.setRealtime(state.queryState,state.realtime);return queries.updateVisiblePings(state.queryState,source) end if;return lan.updateVisiblePings(state.browser,source)
end function
function LAN_GetServerStatus(state,address,capacity)
  value=void;if state.queryState!=void then queries.setRealtime(state.queryState,state.realtime);value=queries.serverStatus(state.queryState,address) else value=lan.serverStatus(state.browser,address) end if
  if value==void then return [false,""] end if;return [true,bounded(value,capacity)]
end function
function CL_GetGlconfig(state) if state==void or typeof(state.glconfig)!="bytes" then return fail("glconfig unavailable") end if;return slice(state.glconfig,0,len(state.glconfig)) end function
function GetClipboardData(state,capacity) return bounded(state.clipboard,capacity) end function
function Key_KeynumToStringBuf(state,keynum,capacity) if state.syscallHost==void or state.syscallHost.keys.keyNameFn==void then return "" end if;return bounded(state.syscallHost.keys.keyNameFn(state.syscallHost.context,keynum),capacity) end function
function Key_GetBindingBuf(state,keynum,capacity) if state.syscallHost==void or state.syscallHost.keys.bindingFn==void then return "" end if;return bounded(state.syscallHost.keys.bindingFn(state.syscallHost.context,keynum),capacity) end function
function Key_GetCatcher(state) if state.syscallHost!=void and state.syscallHost.keys.getCatcherFn!=void then return state.syscallHost.keys.getCatcherFn(state.syscallHost.context) end if;return state.keyCatchers end function
function Key_SetCatcher(state,catcher) state.keyCatchers=catcher;if state.syscallHost!=void and state.syscallHost.keys.setCatcherFn!=void then state.syscallHost.keys.setCatcherFn(state.syscallHost.context,catcher) end if;return void end function

function keySegment(value,offset) raw=bytes(value);result=bytes(16,0);if offset<len(raw) then count=len(raw)-offset;if count>16 then count=16 end if;if count>0 then copyBytes(result,0,raw,offset,count) end if end if;return decode(result) end function
function normalizedKey(value) raw=bytes(value);result=bytes(16,0);count=len(raw);if count>16 then count=16 end if;if count>0 then copyBytes(result,0,raw,0,count) end if;return result end function
function CLUI_GetCDKey(state,capacity)
  offset=0;if UI_usesUniqueCDKey(state) and state.fsGame!="" then offset=16 end if;return bounded(keySegment(state.cdKey,offset),capacity)
end function
function CLUI_SetCDKey(state,value)
  old=bytes(state.cdKey);combined=bytes(32,0);count=len(old);if count>32 then count=32 end if;if count>0 then copyBytes(combined,0,old,0,count) end if;part=normalizedKey(value);offset=0;if UI_usesUniqueCDKey(state) and state.fsGame!="" then offset=16 end if;copyBytes(combined,offset,part,0,16);state.cdKey=decode(combined);state.modifiedFlags=state.modifiedFlags|CVAR_ARCHIVE;return void
end function
function GetConfigString(state,index,capacity) if index<0 or index>=MAX_CONFIGSTRINGS or index>=len(state.configStrings) or state.configStrings[index]=="" then return void end if;return bounded(state.configStrings[index],capacity) end function
function FloatAsInt(value) return n.i32(n.floatBits(value)) end function
function CL_UISystemCalls(state,vm,base) if state==void or state.syscallHost==void then return fail("UI syscall host unavailable") end if;return syscalls.dispatch(state.syscallHost,vm,base) end function
function CL_ShutdownUI(state)
  if state==void then return void end if
  // cls.keyCatchers is host-owned in Baseq3.  Read and update that authoritative
  // value before inspecting the VM, so shutdown also clears UI ownership when
  // the local facade mirror is stale or the VM has already gone away.
  Key_SetCatcher(state,Key_GetCatcher(state)&(~hostState.KEYCATCH_UI))
  if state.ui==void then return void end if;return uiVm.shutdown(state.ui)
end function
function CL_InitUI(state,connectionState,connectedToPureServer,vmUi) if state==void or state.ui==void then return fail("UI VM unavailable") end if;return uiVm.initialize(state.ui,connectionState,connectedToPureServer,vmUi) end function
function UI_usesUniqueCDKey(state) if state==void or state.ui==void then return false end if;return uiVm.usesUniqueCdKey(state.ui) end function
function UI_GameCommand(state) if state==void or state.ui==void then return false end if;return uiVm.consoleCommand(state.ui,state.realtime)!=0 end function
