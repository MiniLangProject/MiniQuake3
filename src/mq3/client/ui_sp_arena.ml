// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Single-player arena launch from code/q3_ui/ui_sparena.c.
package mq3.client.ui_sp_arena

import mq3.shared.info as arenaInfo
import mq3.compat.textnumbers as textNumbers
import std.string as strings

const ARENAS_PER_TIER=4
const EXEC_APPEND=2

/// Stores UI sp arena host-service callbacks, including `context`, `variableValueFn`, `setValueFn`, `numTiersFn`, `executeTextFn`.
struct Services context variableValueFn setValueFn numTiersFn executeTextFn end struct
/// Stores UI sp arena operation result, including `maxClientsRaised`, `selection`, `map`, `command`.
struct Result maxClientsRaised selection map command end struct

/// Creates a `mq3.client.ui_sp_arena.Services` record. Assigns `context` from `context`, `variableValueFn` from `variableValueFn`, `setValueFn` from `setValueFn`, `numTiersFn` from `numTiersFn`.
/// @param context Value used to initialize `Services.context`.
/// @param variableValueFn Value used to initialize `Services.variableValueFn`.
/// @param setValueFn Value used to initialize `Services.setValueFn`.
/// @param numTiersFn Value used to initialize `Services.numTiersFn`.
/// @param executeTextFn Value used to initialize `Services.executeTextFn`.
function services(context,variableValueFn,setValueFn,numTiersFn,executeTextFn)
  return Services(context,variableValueFn,setValueFn,numTiersFn,executeTextFn)
end function

// UI_SPArena_Start. Host callbacks are the four original trap/UI boundaries.
/// @param host Record read through `host.variableValueFn`, `host.setValueFn`, `host.numTiersFn`, `host.executeTextFn` and additional values.
/// @param infoText Value used by `level=textNumbers.atoi(arenaInfo.value(infoText,"num"))`.
function start(host,infoText)
  if host==void or host.variableValueFn==void or host.setValueFn==void or host.numTiersFn==void or host.executeTextFn==void then return error(7750,"UI_SPArena_Start: incomplete services") end if
  maxClients=host.variableValueFn(host.context,"sv_maxclients");if maxClients is error then return maxClients end if
  raised=false
  if maxClients<8.0 then value=host.setValueFn(host.context,"sv_maxclients",8);if value is error then return value end if;raised=true end if
  level=textNumbers.atoi(arenaInfo.value(infoText,"num"));special=arenaInfo.value(infoText,"special")
  if special!="" then
    if strings.equalsIgnoreCaseAscii(special,"training") then level=-4
    else if strings.equalsIgnoreCaseAscii(special,"final") then level=host.numTiersFn(host.context)*ARENAS_PER_TIER end if
  end if
  value=host.setValueFn(host.context,"ui_spSelection",level);if value is error then return value end if
  map=arenaInfo.value(infoText,"map");command="spmap "+map+"\n";value=host.executeTextFn(host.context,EXEC_APPEND,command);if value is error then return value end if
  return Result(raised,level,map,command)
end function
