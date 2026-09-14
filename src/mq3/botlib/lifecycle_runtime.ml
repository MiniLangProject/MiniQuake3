// SPDX-License-Identifier: GPL-2.0-or-later
// AAS-independent host state for the be_interface.c BotLib lifecycle exports.
package mq3.botlib.lifecycle_runtime

import mq3.compat.numeric as n

const BLERR_NOERROR=0
const BLERR_LIBRARYNOTSETUP=1
const BLERR_INVALIDENTITYNUMBER=2

struct Variable name value modified end struct
struct State variables setup maxclients maxentities mapName mapLoads frames time entityUpdates removedEntities end struct

function create() return State([],false,128,1024,"",0,0,0.0,0,0) end function
function variableIndex(state,name)
  if state==void or name==void then return -1 end if
  if len(state.variables)==0 then return -1 end if
  for index=0 to len(state.variables)-1 if stringEqualsIgnoreCaseAscii(state.variables[index].name,name) then return index end if end for
  return -1
end function
function varSet(state,name,value)
  if state==void or name==void or value==void then return BLERR_NOERROR end if
  index=variableIndex(state,name)
  if index<0 then state.variables=state.variables+[Variable(name,value,true)]
  else state.variables[index].value=value;state.variables[index].modified=true end if
  return BLERR_NOERROR
end function
function varGet(state,name)
  index=variableIndex(state,name);if index<0 then return "" end if;return state.variables[index].value
end function
function integerVariable(state,name,fallback)
  value=varGet(state,name);if value=="" then return fallback end if
  return n.trunc32(toNumber(value))
end function

function setup(state)
  if state==void then return BLERR_LIBRARYNOTSETUP end if
  // Export_BotLibSetup clears botlibglobals, while the libvars set by
  // BotInitLibrary remain alive and seed these two limits.
  state.maxclients=integerVariable(state,"maxclients",128)
  state.maxentities=integerVariable(state,"maxentities",1024)
  state.setup=true;state.mapName="";state.mapLoads=0;state.frames=0;state.time=0.0;state.entityUpdates=0;state.removedEntities=0
  return BLERR_NOERROR
end function
function shutdown(state)
  if state==void or not state.setup then return BLERR_LIBRARYNOTSETUP end if
  state.setup=false;state.variables=[];state.mapName="";return BLERR_NOERROR
end function
function startFrame(state,time)
  if state==void or not state.setup then return BLERR_LIBRARYNOTSETUP end if
  state.time=time;state.frames=state.frames+1;return BLERR_NOERROR
end function
function loadMap(state,mapName)
  if state==void or not state.setup then return BLERR_LIBRARYNOTSETUP end if
  if mapName==void then mapName="" end if
  state.mapName=mapName;state.mapLoads=state.mapLoads+1;return BLERR_NOERROR
end function
function updateEntity(state,entity,present)
  if state==void or not state.setup then return BLERR_LIBRARYNOTSETUP end if
  // ValidEntityNumber in be_interface.c accepts both boundary values.
  if entity<0 or entity>state.maxentities then return BLERR_INVALIDENTITYNUMBER end if
  state.entityUpdates=state.entityUpdates+1;if not present then state.removedEntities=state.removedEntities+1 end if
  return BLERR_NOERROR
end function
