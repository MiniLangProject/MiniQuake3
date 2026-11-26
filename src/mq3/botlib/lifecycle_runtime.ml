// SPDX-License-Identifier: GPL-2.0-or-later
// AAS-independent host state for the be_interface.c BotLib lifecycle exports.
package mq3.botlib.lifecycle_runtime

import mq3.compat.numeric as n
import mq3.botlib.lib_variables as libvars

/// Bot-library status indicating successful completion.
const BLERR_NOERROR=0
/// Bot-library error indicating that setup has not completed.
const BLERR_LIBRARYNOTSETUP=1
/// Bot-library error indicating an out-of-range entity number.
const BLERR_INVALIDENTITYNUMBER=2

/// `State` record for lifecycle runtime, containing `variables`, `setup`, `maxclients`, `maxentities` and `mapName` and related fields.
struct State
  /// Bot-library configuration variables consulted during setup and map loading.
  variables
  /// True after the bot-library setup sequence has completed.
  setup
  /// Client limit supplied when setting up the bot-library lifecycle.
  maxclients
  /// Maximum number of entities.
  maxentities
  /// Name of the current game map.
  mapName
  /// Number of map-load operations performed by the bot runtime.
  mapLoads
  /// Number of bot-library frame updates processed since setup.
  frames
  /// Time supplied to the most recent bot-library frame.
  time
  /// Number of entity-state updates delivered to the bot library.
  entityUpdates
  /// Entity numbers removed from bot-library tracking.
  removedEntities
  /// True when developer bot-library diagnostics are enabled.
  developer
end struct

/// Create a `mq3.botlib.lifecycle_runtime.State` record, initializing `maxclients` as `128` and `maxentities` as `1024`.
function create() return State([],false,128,1024,"",0,0,0.0,0,0,0) end function
/// Forward `variableIndex` to `mq3.botlib.lib_variables.indexOf` and return the delegated result.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function variableIndex(state,name)
  return libvars.indexOf(state,name)
end function
/// Apply `mq3.botlib.lib_variables.set` while evaluating `varSet`. Return paths include `BLERR_NOERROR`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param value Text to parse, format or deliver.
function varSet(state,name,value)
  libvars.set(state,name,value)
  return BLERR_NOERROR
end function
/// Forward `varGet` to `mq3.botlib.lib_variables.getString` and return the delegated result.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function varGet(state,name)
  return libvars.getString(state,name)
end function
/// Forward `varGetValue` to `mq3.botlib.lib_variables.getValue` and return the delegated result.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function varGetValue(state,name) return libvars.getValue(state,name) end function
/// Forward `varDefault` to `mq3.botlib.lib_variables.variable` and return the delegated result.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param value Text to parse, format or deliver.
function varDefault(state,name,value) return libvars.variable(state,name,value) end function
/// Forward `varString` to `mq3.botlib.lib_variables.variableString` and return the delegated result.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param value Text to parse, format or deliver.
function varString(state,name,value) return libvars.variableString(state,name,value) end function
/// Forward `varValue` to `mq3.botlib.lib_variables.variableValue` and return the delegated result.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param value Text to parse, format or deliver.
function varValue(state,name,value) return libvars.variableValue(state,name,value) end function
/// Forward `varChanged` to `mq3.botlib.lib_variables.changed` and return the delegated result.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function varChanged(state,name) return libvars.changed(state,name) end function
/// Forward `varSetNotModified` to `mq3.botlib.lib_variables.setNotModified` and return the delegated result.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
function varSetNotModified(state,name) return libvars.setNotModified(state,name) end function
/// Apply `mq3.botlib.lifecycle_runtime.varGet` while evaluating `integerVariable`. Return paths include `n.trunc32(toNumber(value))`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param fallback Value used when the requested entry is unavailable.
function integerVariable(state,name,fallback)
  value=varGet(state,name);if value=="" then return fallback end if
  return n.trunc32(toNumber(value))
end function

/// Update `state.maxclients`, `state.maxentities`, `state.setup` and `state.mapName` and related state during `setup`. Return paths include `BLERR_NOERROR`.
/// @param state Lifecycle runtime state; accesses `maxclients`, `maxentities`, `setup`, `mapName` and `mapLoads` and related fields. May update `state.maxclients`, `state.maxentities` and `state.setup` and additional fields in place.
function setup(state)
  if state==void then return BLERR_LIBRARYNOTSETUP end if
  // Export_BotLibSetup clears botlibglobals, while the libvars set by
  // BotInitLibrary remain alive and seed these two limits.
  state.maxclients=integerVariable(state,"maxclients",128)
  state.maxentities=integerVariable(state,"maxentities",1024)
  state.setup=true;state.mapName="";state.mapLoads=0;state.frames=0;state.time=0.0;state.entityUpdates=0;state.removedEntities=0
  return BLERR_NOERROR
end function
/// Set `state.setup` to `false` and `state.mapName` to `""` in `mq3.botlib.lifecycle_runtime.shutdown`. Return paths include `BLERR_NOERROR`.
/// @param state Lifecycle runtime state; accesses `setup` and `mapName`. May update `state.setup` and `state.mapName` in place.
function shutdown(state)
  if state==void or not state.setup then return BLERR_LIBRARYNOTSETUP end if
  state.setup=false;libvars.deAllocAll(state);state.mapName="";return BLERR_NOERROR
end function
/// Set `state.time` to `time` and `state.frames` to `state.frames+1` in `mq3.botlib.lifecycle_runtime.startFrame`. Return paths include `BLERR_NOERROR`.
/// @param state Lifecycle runtime state; accesses `setup`, `time` and `frames`. May update `state.time` and `state.frames` in place.
/// @param time Time value in the units expected by this module.
function startFrame(state,time)
  if state==void or not state.setup then return BLERR_LIBRARYNOTSETUP end if
  state.time=time;state.frames=state.frames+1;return BLERR_NOERROR
end function
/// Set `state.mapName` to `mapName` and `state.mapLoads` to `state.mapLoads+1` in `mq3.botlib.lifecycle_runtime.loadMap`. Return paths include `BLERR_NOERROR`.
/// @param state Lifecycle runtime state; accesses `setup`, `mapName` and `mapLoads`. May update `state.mapName` and `state.mapLoads` in place.
/// @param mapName Value used by `loadMap` in `if mapName==void then mapName="" end if`.
function loadMap(state,mapName)
  if state==void or not state.setup then return BLERR_LIBRARYNOTSETUP end if
  if mapName==void then mapName="" end if
  state.mapName=mapName;state.mapLoads=state.mapLoads+1;return BLERR_NOERROR
end function
/// Set `state.entityUpdates` to `state.entityUpdates+1` and `state.removedEntities` to `state.removedEntities+1` in `mq3.botlib.lifecycle_runtime.updateEntity`. Return paths include `BLERR_NOERROR`.
/// @param state Lifecycle runtime state; accesses `setup`, `maxentities`, `entityUpdates` and `removedEntities`. May update `state.entityUpdates` and `state.removedEntities` in place.
/// @param entity Value used by `updateEntity` in `if entity<0 or entity>state.maxentities then return BLERR_INVALIDENTITYNUMBER end if`.
/// @param present Value used by `updateEntity` in `if not present then state.removedEntities=state.removedEntities+1 end if`.
function updateEntity(state,entity,present)
  if state==void or not state.setup then return BLERR_LIBRARYNOTSETUP end if
  // ValidEntityNumber in be_interface.c accepts both boundary values.
  if entity<0 or entity>state.maxentities then return BLERR_INVALIDENTITYNUMBER end if
  state.entityUpdates=state.entityUpdates+1;if not present then state.removedEntities=state.removedEntities+1 end if
  return BLERR_NOERROR
end function
