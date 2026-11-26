// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 common.c startup command-line processing.
package mq3.qcommon.startup_commands
import mq3.qcommon.command_buffer as commands

/// Maximum number of command lines retained for startup console processing.
const MAX_CONSOLE_LINES = 32
/// Created by a set command.
const CVAR_USER_CREATED = 128

/// State record for qcommon.startup_commands, containing `commandState`, `lines`, `cvarSetFn`, `cvarGetFn`, `context`.
struct State
  /// Command buffer receiving commands parsed from the startup arguments.
  commandState
  /// Startup command lines split from the process command line.
  lines
  /// Host callback that sets a configuration variable in the host registry.
  cvarSetFn
  /// Host callback that retrieves a configuration variable from the host registry.
  cvarGetFn
  /// Caller-supplied data associated with configuration-variable access while processing startup
  /// commands.
  context
end struct

/// Create `mq3.qcommon.startup_commands.State` with commandState=commandState; lines=[]; cvarSetFn=void; cvarGetFn=void; context=void.
/// @param commandState Initial `commandState` field stored in the returned or constructed `mq3.qcommon.startup_commands.State` record.
function create(commandState) return State(commandState,[],void,void,void) end function

/// Parse command line in qcommon.startup_commands; the normal completion returns `result`.
///
/// Direct state writes: `state.lines`.
/// @param state Updated in place: `lines`.
/// @param commandLine Text passed as `text` to `mq3.qcommon.command_buffer.visibleBytes`.
function parseCommandLine(state,commandLine)
  data=commands.visibleBytes(commandLine);result=[];start=0;index=0;inQuote=false
  while index < len(data)
    if data[index]==34 then inQuote=not inQuote end if
    if (data[index]==43 and not inQuote) or data[index]==10 or data[index]==13 then
      // The native routine returns before replacing the 32nd separator.
      if len(result)+1==MAX_CONSOLE_LINES then
        result=result+[decode(slice(data,start,len(data)-start))];state.lines=result;return result
      end if
      result=result+[decode(slice(data,start,index-start))];start=index+1
    end if
    index=index+1
  end while
  result=result+[decode(slice(data,start,len(data)-start))];state.lines=result;return result
end function

/// Test safe mode in qcommon.startup_commands; the normal completion returns `false`.
/// @param state Record exposing `lines`, `commandState`.
function safeMode(state)
  for index=0 to len(state.lines)-1
    commands.tokenizeString(state.commandState,state.lines[index])
    name=commands.argv(state.commandState,0)
    if commands.sameInsensitive(name,"safe") or commands.sameInsensitive(name,"cvar_restart") then
      state.lines[index]="";return true
    end if
  end for
  return false
end function

/// Compute startup variable in qcommon.startup_commands.
///
/// Validation failures include `Startup variables require Cvar_Set and Cvar_Get services`; `Cvar_Get returned NULL for startup variable`.
/// @param state Record exposing `cvarSetFn`, `cvarGetFn`, `lines`, `commandState`.
/// @param match Match used in `(match == void)` and `(name == match)`.
function startupVariable(state,match)
  if state.cvarSetFn==void or state.cvarGetFn==void then return error(3512,"Startup variables require Cvar_Set and Cvar_Get services") end if
  for each line in state.lines
    commands.tokenizeString(state.commandState,line)
    if commands.argv(state.commandState,0)!="set" then continue end if
    name=commands.argv(state.commandState,1)
    if match==void or name==match then
      state.cvarSetFn(state,name,commands.argv(state.commandState,2))
      variable=state.cvarGetFn(state,name,"",0)
      if variable==void then return error(3512,"Cvar_Get returned NULL for startup variable") end if
      variable.flags=variable.flags|CVAR_USER_CREATED
    end if
  end for
  return void
end function

/// Test prefix set in qcommon.startup_commands; the normal completion returns `true`.
/// @param line Line used in `bytes(line)`.
function prefixSet(line)
  data=bytes(line);wanted=bytes("set")
  for index=0 to 2
    if index>=len(data) or commands.lowerAscii(data[index])!=wanted[index] then return false end if
  end for
  return true
end function

/// Add startup commands in qcommon.startup_commands; the normal completion returns `added`.
/// @param state Record exposing `lines`, `commandState`.
function addStartupCommands(state)
  added=false
  for each line in state.lines
    if len(commands.visibleBytes(line))==0 then continue end if
    if not prefixSet(line) then added=true end if
    commands.addText(state.commandState,line);commands.addText(state.commandState,"\n")
  end for
  return added
end function
