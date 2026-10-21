// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 qcommon/cmd.c token state and command text buffer.
package mq3.qcommon.command_buffer

const EXEC_NOW = 0
const EXEC_INSERT = 1
const EXEC_APPEND = 2
const MAX_CMD_BUFFER = 16384
const MAX_CMD_LINE = 1024
const MAX_STRING_TOKENS = 1024
const MAX_STRING_CHARS = 1024
const BIG_INFO_STRING = 8192

struct State
  buffer
  argv
  command
  wait
  executeFn
  printFn
  context
  functions
  cvarCommandFn
  cvarContextCommandFn
  cvarCommandContext
  clientGameCommandFn
  serverGameCommandFn
  uiGameCommandFn
  forwardCommandFn
  clientRunning
  serverRunning
  cvarStringFn
  readFileFn
  freeFileFn
end struct

struct Command
  name
  callback
  contextCallback
  callbackContext
end struct

function create()
  return State("",[],"",0,void,void,void,[],void,void,void,void,void,void,void,false,false,void,void,void)
end function

function visibleBytes(text)
  data = bytes(text); length = 0
  while length < len(data) and data[length] != 0
    length = length+1
  end while
  return slice(data,0,length)
end function

function copyString(text,capacity)
  if capacity < 1 then return "" end if
  data = visibleBytes(text); length = len(data)
  if length >= capacity then length = capacity-1 end if
  return decode(slice(data,0,length))
end function

function emit(state,message)
  if state.printFn != void then state.printFn(state,message) end if
  return void
end function

function isUnquotedWhitespace(value)
  // The frozen Windows Baseq3 target uses signed char for these comparisons.
  return value <= 32 or value >= 128
end function

function tokenizeString(state,text)
  state.argv = []
  if text == void then return void end if
  state.command = copyString(text,BIG_INFO_STRING)
  data = visibleBytes(text); length = len(data); at = 0
  while true
    if len(state.argv) == MAX_STRING_TOKENS then return void end if
    while true
      while at < length and isUnquotedWhitespace(data[at])
        at = at+1
      end while
      if at >= length then return void end if
      if data[at] == 47 and at+1 < length and data[at+1] == 47 then return void end if
      if data[at] == 47 and at+1 < length and data[at+1] == 42 then
        at = at+2
        while at < length and not (data[at] == 42 and at+1 < length and data[at+1] == 47)
          at = at+1
        end while
        if at >= length then return void end if
        at = at+2
      else
        break
      end if
    end while
    if data[at] == 34 then
      at = at+1; start = at
      while at < length and data[at] != 34
        at = at+1
      end while
      state.argv = state.argv+[decode(slice(data,start,at-start))]
      if at >= length then return void end if
      at = at+1
    else
      start = at
      while at < length and not isUnquotedWhitespace(data[at])
        if data[at] == 34 then break end if
        if data[at] == 47 and at+1 < length and (data[at+1] == 47 or data[at+1] == 42) then break end if
        at = at+1
      end while
      state.argv = state.argv+[decode(slice(data,start,at-start))]
      if at >= length then return void end if
    end if
  end while
end function

function argc(state) return len(state.argv) end function
function argv(state,index)
  if index < 0 or index >= len(state.argv) then return "" end if
  return state.argv[index]
end function
function argvBuffer(state,index,capacity) return copyString(argv(state,index),capacity) end function
function argsFrom(state,start)
  if start < 0 then start = 0 end if
  result = ""; index = start
  while index < len(state.argv)
    result = result+state.argv[index]
    if index != len(state.argv)-1 then result = result+" " end if
    index = index+1
  end while
  return result
end function
function args(state) return argsFrom(state,1) end function
function argsBuffer(state,capacity) return copyString(args(state),capacity) end function
function cmd(state) return state.command end function

function addText(state,text)
  part = decode(visibleBytes(text))
  if len(bytes(state.buffer))+len(bytes(part)) >= MAX_CMD_BUFFER then
    emit(state,"Cbuf_AddText: overflow\n"); return false
  end if
  state.buffer = state.buffer+part; return true
end function

function insertText(state,text)
  part = decode(visibleBytes(text)); amount = len(bytes(part))+1
  if amount+len(bytes(state.buffer)) > MAX_CMD_BUFFER then
    emit(state,"Cbuf_InsertText overflowed\n"); return false
  end if
  state.buffer = part+"\n"+state.buffer; return true
end function

function executeLine(state,line)
  if state.executeFn != void then state.executeFn(state,line) end if
  return void
end function

function execute(state)
  while len(bytes(state.buffer)) > 0
    if state.wait != 0 then state.wait = state.wait-1; return void end if
    data = bytes(state.buffer); size = len(data); index = 0; quotes = 0
    while index < size
      if data[index] == 34 then quotes = quotes+1 end if
      if (quotes & 1) == 0 and data[index] == 59 then break end if
      if data[index] == 10 or data[index] == 13 then break end if
      index = index+1
    end while
    if index >= MAX_CMD_LINE-1 then index = MAX_CMD_LINE-1 end if
    line = decode(slice(data,0,index))
    if index == size then
      state.buffer = ""
    else
      index = index+1
      state.buffer = decode(slice(data,index,size-index))
    end if
    executeLine(state,line)
  end while
  return void
end function

function executeText(state,when,text)
  if when == EXEC_NOW then
    if text != void and len(visibleBytes(text)) > 0 then executeLine(state,decode(visibleBytes(text))) else execute(state) end if
    return void
  end if
  if when == EXEC_INSERT then return insertText(state,text) end if
  if when == EXEC_APPEND then return addText(state,text) end if
  return error(3511,"Cbuf_ExecuteText: bad exec_when")
end function

function waitCommand(state)
  if argc(state) == 2 then
    // atoi-compatible decimal prefix behavior is supplied by the C runtime.
    state.wait = atoi(argv(state,1))
  else
    state.wait = 1
  end if
  return void
end function

function addCommand(state,name,callback)
  for each entry in state.functions
    if entry.name == name then
      if callback != void then emit(state,"Cmd_AddCommand: "+name+" already defined\n") end if
      return false
    end if
  end for
  state.functions = [Command(name,callback,void,void)]+state.functions; return true
end function

// Context-bearing registrations keep subsystem state out of the global
// command state while leaving the original Cmd_AddCommand surface unchanged.
function addContextCommand(state,name,callback,context)
  for each entry in state.functions
    if entry.name == name then
      if callback != void then emit(state,"Cmd_AddCommand: "+name+" already defined\n") end if
      return false
    end if
  end for
  state.functions = [Command(name,void,callback,context)]+state.functions; return true
end function

function removeCommand(state,name)
  result = []; found = false
  for each entry in state.functions
    if not found and entry.name == name then found = true else result = result+[entry] end if
  end for
  state.functions = result; return found
end function

function commandCompletion(state,callback)
  for each entry in state.functions callback(state,entry.name) end for
  return void
end function

function lowerAscii(value)
  if value >= 65 and value <= 90 then return value+32 end if
  return value
end function
function sameInsensitive(left,right)
  a = bytes(left); b = bytes(right)
  if len(a) != len(b) then return false end if
  for index = 0 to len(a)-1
    if lowerAscii(a[index]) != lowerAscii(b[index]) then return false end if
  end for
  return true
end function
function containsInsensitive(name,part,start)
  source = bytes(name); wanted = bytes(part)
  if len(wanted) == 0 then return start end if
  while start+len(wanted) <= len(source)
    matches = true
    for index = 0 to len(wanted)-1
      if lowerAscii(source[start+index]) != lowerAscii(wanted[index]) then matches = false; break end if
    end for
    if matches then return start end if
    start = start+1
  end while
  return -1
end function

// Case-insensitive Com_Filter subset used by Cmd_List_f, including Baseq3's
// *, ?, bracket ranges and doubled opening/closing bracket conventions.
function filterName(pattern,name)
  filter = bytes(pattern); source = bytes(name); fi = 0; ni = 0
  while fi < len(filter)
    if filter[fi] == 42 then
      fi = fi+1; start = fi
      while fi < len(filter) and filter[fi] != 42 and filter[fi] != 63 fi = fi+1 end while
      part = decode(slice(filter,start,fi-start))
      if len(bytes(part)) > 0 then
        found = containsInsensitive(name,part,ni); if found < 0 then return false end if
        ni = found+len(bytes(part))
      end if
    else if filter[fi] == 63 then
      fi = fi+1; ni = ni+1
    else if filter[fi] == 91 and fi+1 < len(filter) and filter[fi+1] == 91 then
      fi = fi+1
    else if filter[fi] == 91 then
      fi = fi+1; found = false
      while fi < len(filter) and not found
        if filter[fi] == 93 and (fi+1 >= len(filter) or filter[fi+1] != 93) then break end if
        if fi+2 < len(filter) and filter[fi+1] == 45 and (filter[fi+2] != 93 or (fi+3 < len(filter) and filter[fi+3] == 93)) then
          if ni < len(source) and lowerAscii(source[ni]) >= lowerAscii(filter[fi]) and lowerAscii(source[ni]) <= lowerAscii(filter[fi+2]) then found = true end if
          fi = fi+3
        else
          if ni < len(source) and lowerAscii(filter[fi]) == lowerAscii(source[ni]) then found = true end if
          fi = fi+1
        end if
      end while
      if not found then return false end if
      while fi < len(filter) and not (filter[fi] == 93 and (fi+1 >= len(filter) or filter[fi+1] != 93)) fi = fi+1 end while
      fi = fi+1; ni = ni+1
    else
      if ni >= len(source) or lowerAscii(filter[fi]) != lowerAscii(source[ni]) then return false end if
      fi = fi+1; ni = ni+1
    end if
  end while
  return true
end function

function defaultExtension(path,extension)
  data = bytes(path); index = len(data)-1
  while index >= 0 and data[index] != 47
    if data[index] == 46 then return path end if
    index = index-1
  end while
  return path+extension
end function

function execCommand(state)
  if argc(state) != 2 then emit(state,"exec <filename> : execute a script file\n"); return void end if
  filename = defaultExtension(copyString(argv(state,1),64),".cfg")
  if state.readFileFn == void then return error(3511,"exec requires FS_ReadFile service") end if
  contents = state.readFileFn(state,filename)
  if contents == void then emit(state,"couldn't exec "+argv(state,1)+"\n"); return void end if
  emit(state,"execing "+argv(state,1)+"\n"); insertText(state,contents)
  if state.freeFileFn != void then state.freeFileFn(state,contents) end if
  return void
end function
function vstrCommand(state)
  if argc(state) != 2 then emit(state,"vstr <variablename> : execute a variable command\n"); return void end if
  if state.cvarStringFn == void then return error(3511,"vstr requires Cvar_VariableString service") end if
  return insertText(state,state.cvarStringFn(state,argv(state,1))+"\n")
end function
function echoCommand(state)
  index = 1
  while index < argc(state) emit(state,argv(state,index)+" "); index = index+1 end while
  emit(state,"\n"); return void
end function
function listCommand(state)
  match = void; if argc(state) > 1 then match = argv(state,1) end if
  count = 0
  for each entry in state.functions
    if match == void or filterName(match,entry.name) then emit(state,entry.name+"\n"); count = count+1 end if
  end for
  emit(state,str(count)+" commands\n"); return void
end function

function executeString(state,text)
  tokenizeString(state,text); if argc(state) == 0 then return void end if
  found = -1
  for index = 0 to len(state.functions)-1
    if sameInsensitive(argv(state,0),state.functions[index].name) then found = index; break end if
  end for
  if found >= 0 then
    entry = state.functions[found]; remaining = []
    for index = 0 to len(state.functions)-1 if index != found then remaining = remaining+[state.functions[index]] end if end for
    state.functions = [entry]+remaining
    if entry.callback != void then entry.callback(state); return void end if
    if entry.contextCallback != void then entry.contextCallback(state,entry.callbackContext); return void end if
  end if
  if state.cvarCommandFn != void and state.cvarCommandFn(state) then return void end if
  if state.cvarContextCommandFn != void and state.cvarContextCommandFn(state,state.cvarCommandContext) then return void end if
  if state.clientRunning and state.clientGameCommandFn != void and state.clientGameCommandFn(state) then return void end if
  if state.serverRunning and state.serverGameCommandFn != void and state.serverGameCommandFn(state) then return void end if
  if state.clientRunning and state.uiGameCommandFn != void and state.uiGameCommandFn(state) then return void end if
  if state.forwardCommandFn != void then state.forwardCommandFn(state,decode(visibleBytes(text))) end if
  return void
end function

function initCommands(state)
  addCommand(state,"cmdlist",listCommand); addCommand(state,"exec",execCommand)
  addCommand(state,"vstr",vstrCommand); addCommand(state,"echo",echoCommand); addCommand(state,"wait",waitCommand)
  state.executeFn = executeString; return void
end function

extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
