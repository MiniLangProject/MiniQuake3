// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_svcmds.c IP masks, ban persistence and packet decisions.
package mq3.game.ip_filters
import mq3.game.command_args as commandArgs
import mq3.shared.info as infoStrings
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum

/// `Filter` record for ip filters, containing `mask` and `compare`.
struct Filter
  mask
  compare
end struct
/// `State` record for ip filters, containing `filters`, `count`, `banBuffer`, `banVm` and `filterBanVm` and related fields.
struct State
  filters
  count
  banBuffer
  banVm
  filterBanVm
  bufferVm
  bufferVersion
  bufferVisible
  bufferCopyGeneration
end struct
/// Set `level.ipFilters` to `State(filters,0,bytes(256,0),void,void,void,0,"",0)` in `mq3.game.ip_filters.get`. Return paths include `level.ipFilters`.
/// @param level Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place.
function get(level)
  if level.ipFilters == void then
    filters = []
    for index = 0 to 1023
      filters = filters+[Filter(0,0)]
    end for
    level.ipFilters = State(filters,0,bytes(256,0),void,void,void,0,"",0)
  end if
  return level.ipFilters
end function
/// Apply `mq3.game.ip_filters.get` while evaluating `bindVm`.
/// @param level Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place.
/// @param banVm Value used by `bindVm` in `state.banVm = banVm`.
/// @param filterBanVm Value used by `bindVm` in `state.filterBanVm = filterBanVm`.
function bindVm(level,banVm,filterBanVm)
  // Explicit isolated-host bridge. Real game-Cvar rows always take priority.
  state = get(level); state.banVm = banVm; state.filterBanVm = filterBanVm; return void
end function
/// Apply `mq3.game.ip_filters.get` while evaluating `filterVm`. Return paths include `vm`.
/// @param level Game-level state; accesses `gameCvars`.
/// @param name Lookup text matched against `row.vmName`.
function filterVm(level,name)
  if level.gameCvars != void then
    for each row in level.gameCvars.rows
      if row.vmName == name and row.vm != void then return row.vm end if
    end for
    return error(486,"IP filter requires its registered game Cvar")
  end if
  state = get(level); vm = state.filterBanVm
  if name == "g_banIPs" then vm = state.banVm end if
  if vm == void then return error(486,"IP filter requires game Cvars or explicit VM bindings") end if
  return vm
end function
/// Use `level.gamePrintFn` to perform `filterPrint`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param text Text to parse, format or deliver.
function filterPrint(level,text)
  // G_Printf uses unbounded vsprintf into msg[1024]. Do not claim parity for
  // diagnostics whose payload would overflow that original stack buffer.
  if len(bytes(text)) > 1023 then return error(486,"IP diagnostic exceeds native G_Printf storage") end if
  if level.gamePrintFn == void then return error(486,"IP filter requires diagnostic delivery") end if
  level.gamePrintFn(level,text); return void
end function
/// Validate and return the number of active IP-filter entries within the fixed filter capacity.
/// @param state Ip filters state; accesses `count`.
function filterCount(state)
  if state.count < 0 or state.count > 1024 then return error(486,"Invalid IP filter count") end if
  return state.count
end function
/// Read an IP-filter byte, using zero when the requested index lies beyond the supplied data.
/// @param data Array or byte sequence accessed at `index`.
/// @param index Index of the entry to access.
function filterByte(data,index)
  if index >= len(data) then return 0 end if
  return data[index]
end function
/// Set `filter.mask` to `n.u32(mask)` and `filter.compare` to `n.u32(compare)` in `mq3.game.ip_filters.stringToFilter`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param text Text to parse, format or deliver.
/// @param filter Filter record; accesses `mask` and `compare`. May update `filter.mask` and `filter.compare` in place.
function stringToFilter(level,text,filter)
  data = infoStrings.textBytes(text); values = [0,0,0,0]; masks = [0,0,0,0]; at = 0
  for index = 0 to 3
    part = filterByte(data,at)
    if part < 48 or part > 57 then
      if part == 42 then
        at = at+1
        if filterByte(data,at) == 0 then break end if
        at = at+1; continue
      end if
      filterPrint(level,"Bad filter address: "+decode(slice(data,at,len(data)-at))+"\n"); return false
    end if
    start = at
    while filterByte(data,at) >= 48 and filterByte(data,at) <= 57
      at = at+1
      if at-start >= 128 then return error(486,"Filter octet exceeds native numeric scratch storage") end if
    end while
    values[index] = textnum.atoi(decode(slice(data,start,at-start))) & 255; masks[index] = 255
    if filterByte(data,at) == 0 then break end if
    // Native accepts any separator and ignores input beyond the fourth octet.
    at = at+1
  end for
  mask = 0; compare = 0
  for index = 0 to 3
    mask = mask | (masks[index] << (index*8)); compare = compare | (values[index] << (index*8))
  end for
  filter.mask = n.u32(mask); filter.compare = n.u32(compare); return true
end function
/// Use `level.cvarSetFn` to perform `updateBans`.
/// @param level Game-level state; accesses `cvarSetFn`.
function updateBans(level)
  state = get(level); text = ""; index = 0
  while index < filterCount(state)
    filter = state.filters[index]; index = index+1
    if n.u32(filter.compare) == 0xffffffff then continue end if
    entry = ""
    for octet = 0 to 3
      if ((filter.mask >> (octet*8)) & 255) != 255 then entry = entry+"*"
      else entry = entry+str((filter.compare >> (octet*8)) & 255) end if
      if octet < 3 then entry = entry+"." else entry = entry+" " end if
    end for
    if len(bytes(text))+len(bytes(entry)) < 256 then text = text+entry
    else filterPrint(level,"g_banIPs overflowed at MAX_CVAR_VALUE_STRING\n"); break end if
  end while
  if level.cvarSetFn == void then return error(486,"IP filter requires engine Cvar delivery") end if
  // trap_Cvar_Set changes engine storage; the VM copy waits for Cvar_Update.
  level.cvarSetFn(level,"g_banIPs",text); return void
end function
/// Apply `mq3.game.ip_filters.get`, `mq3.game.ip_filters.filterCount` and `mq3.game.ip_filters.filterPrint` while evaluating `addIP`. Return paths include `updateBans(level)`.
/// @param level Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place.
/// @param text Text to parse, format or deliver.
function addIP(level,text)
  state = get(level); index = 0
  while index < filterCount(state)
    if n.u32(state.filters[index].compare) == 0xffffffff then break end if
    index = index+1
  end while
  if index == state.count then
    if state.count == 1024 then filterPrint(level,"IP filter list is full\n"); return void end if
    state.count = state.count+1
  end if
  if not stringToFilter(level,text,state.filters[index]) then state.filters[index].compare = 0xffffffff end if
  return updateBans(level)
end function
/// Apply `mq3.shared.info.textBytes`, `mq3.game.ip_filters.filterByte` and `mq3.game.ip_filters.get` while evaluating `filterPacket`. Return paths include `filterVm(level,"g_filterBan").integer == 0`.
/// @param level Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place.
/// @param address Address within the VM memory or native data buffer.
function filterPacket(level,address)
  data = infoStrings.textBytes(address); values = [0,0,0,0]; index = 0; at = 0; initialized = 0
  while filterByte(data,at) != 0 and index < 4
    values[index] = 0; initialized = index+1
    while filterByte(data,at) >= 48 and filterByte(data,at) <= 57
      values[index] = (values[index]*10+filterByte(data,at)-48) & 255; at = at+1
    end while
    part = filterByte(data,at)
    if part == 0 or part == 58 then break end if
    index = index+1; at = at+1
  end while
  // C reads the complete unsigned word even if some local bytes were never
  // written. Reject exactly those parses; four initialized nonnumeric octets
  // (for example localhost) remain valid native zero-valued packet addresses.
  if initialized != 4 then return error(486,"Packet address leaves native octets uninitialized") end if
  incoming = 0
  for octet = 0 to 3
    incoming = incoming | (values[octet] << (octet*8))
  end for
  state = get(level); index = 0
  while index < filterCount(state)
    filter = state.filters[index]; index = index+1
    // Freed sentinel entries are deliberately not skipped by G_FilterPacket.
    if (n.u32(incoming) & n.u32(filter.mask)) == n.u32(filter.compare) then return filterVm(level,"g_filterBan").integer != 0 end if
  end while
  return filterVm(level,"g_filterBan").integer == 0
end function
/// Apply `mq3.game.ip_filters.get`, `mq3.game.ip_filters.filterVm` and `mq3.shared.info.textBytes` while evaluating `banBytes`. Return paths include `state.banBuffer`.
/// @param level Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place.
function banBytes(level)
  state = get(level); vm = filterVm(level,"g_banIPs")
  // Only an actual VM copy clears the hidden tail. Register first writes -1
  // to the counter and can still skip copying if the engine counter is -1.
  if state.bufferVm != vm or state.bufferVisible != vm.string or state.bufferCopyGeneration != vm.copyGeneration then
    data = infoStrings.textBytes(vm.string)
    if len(data) > 255 then return error(486,"Ban VM string exceeds native storage") end if
    state.banBuffer = bytes(256,0); index = 0
    while index < len(data)
      state.banBuffer[index] = data[index]; index = index+1
    end while
    state.bufferVm = vm; state.bufferVersion = vm.modificationCount; state.bufferVisible = vm.string; state.bufferCopyGeneration = vm.copyGeneration
  end if
  return state.banBuffer
end function
/// Apply `mq3.game.ip_filters.get`, `mq3.game.ip_filters.banBytes` and `mq3.game.ip_filters.filterVm` while evaluating `processBans`.
/// @param level Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place.
function processBans(level)
  state = get(level); data = banBytes(level); at = 0; start = 0
  // Original copies to an unused local str, then parses/mutates g_banIPs.string.
  while data[start] != 0
    while data[at] != 0 and data[at] != 32
      at = at+1
    end while
    if data[at] == 0 then break end if
    while data[at] == 32
      data[at] = 0; at = at+1
    end while
    visible = 0
    while data[visible] != 0
      visible = visible+1
    end while
    vm = filterVm(level,"g_banIPs"); vm.string = decode(slice(data,0,visible)); state.bufferVisible = vm.string
    if data[start] != 0 then
      finish = start
      while data[finish] != 0
        finish = finish+1
      end while
      addIP(level,decode(slice(data,start,finish-start)))
    end if
    start = at; data = banBytes(level)
  end while
  return void
end function
/// Apply `mq3.game.ip_filters.filterPrint`, `mq3.game.ip_filters.addIP` and `mq3.game.command_args.argument` while evaluating `addCommand`. Return paths include `addIP(level,commandArgs.argument(argv,1,1024))`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param argv Command argument strings in their original order.
function addCommand(level,argv)
  if len(argv) < 2 then filterPrint(level,"Usage:  addip <ip-mask>\n"); return void end if
  return addIP(level,commandArgs.argument(argv,1,1024))
end function
/// Apply `mq3.game.ip_filters.filterPrint`, `mq3.game.command_args.argument` and `mq3.game.ip_filters.stringToFilter` while evaluating `removeCommand`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param argv Command argument strings in their original order.
function removeCommand(level,argv)
  if len(argv) < 2 then filterPrint(level,"Usage:  sv removeip <ip-mask>\n"); return void end if
  text = commandArgs.argument(argv,1,1024); wanted = Filter(0,0)
  if not stringToFilter(level,text,wanted) then return void end if
  state = get(level); index = 0
  while index < filterCount(state)
    filter = state.filters[index]; index = index+1
    if filter.mask == wanted.mask and filter.compare == wanted.compare then
      filter.compare = 0xffffffff; filterPrint(level,"Removed.\n"); return updateBans(level)
    end if
  end while
  filterPrint(level,"Didn't find "+text+".\n"); return void
end function
