// SPDX-License-Identifier: GPL-2.0-or-later
// AAS-independent host state for the be_interface.c BotLib lifecycle exports.
package mq3.botlib.lifecycle_runtime

import mq3.compat.numeric as n
import mq3.botlib.lib_variables as libvars

const BLERR_NOERROR=0
const BLERR_LIBRARYNOTSETUP=1
const BLERR_INVALIDENTITYNUMBER=2

struct State variables setup maxclients maxentities mapName mapLoads frames time entityUpdates removedEntities end struct

function create() return State([],false,128,1024,"",0,0,0.0,0,0) end function
function variableIndex(state,name)
  return libvars.indexOf(state,name)
end function
function varSet(state,name,value)
  libvars.set(state,name,value)
  return BLERR_NOERROR
end function
function varGet(state,name)
  return libvars.getString(state,name)
end function
function varGetValue(state,name) return libvars.getValue(state,name) end function
function varDefault(state,name,value) return libvars.variable(state,name,value) end function
function varString(state,name,value) return libvars.variableString(state,name,value) end function
function varValue(state,name,value) return libvars.variableValue(state,name,value) end function
function varChanged(state,name) return libvars.changed(state,name) end function
function varSetNotModified(state,name) return libvars.setNotModified(state,name) end function
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
  state.setup=false;libvars.deAllocAll(state);state.mapName="";return BLERR_NOERROR
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
