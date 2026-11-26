// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 G_RegisterCvars/G_UpdateCvars with the ported engine VM-Cvar bridge.
package mq3.game.cvars
import mq3.game.cvar_tables as cvarTables
import mq3.qcommon.cvar as cv

/// `Row` record for cvars, containing `vmName`, `name`, `defaultString`, `flags` and `modificationCount` and related fields.
struct Row
  /// Name used for the console variable in the VM-facing cvar table.
  vmName
  /// Engine console-variable name registered by this row.
  name
  /// Default textual value registered for the console variable.
  defaultString
  /// Console-variable registration flags supplied to the host.
  flags
  /// Revision counter incremented when the console variable changes.
  modificationCount
  /// Nonzero when changes to this console variable need processing or announcement.
  trackChange
  /// Nonzero when changing this console variable requires refreshing team shaders.
  teamShader
  /// VM instance or VM-facing console-variable record associated with this adapter.
  vm
end struct
/// `State` record for cvars, containing `level`, `registry`, `rows`, `effectFn` and `registered` and related fields.
struct State
  /// Game-level state shared with the operation or runtime.
  level
  /// Registry of currently loaded preprocessor/token sources.
  registry
  /// Console-variable table rows managed by the cvar subsystem.
  rows
  /// Injected callback for effect; invoked through the State service/state record.
  effectFn
  /// Nonzero after the relevant cvars or resources are registered.
  registered
  /// State tracking password changes and dependent connection settings.
  passwordState
end struct
/// Set `level.gameCvars` to `state` and `level.cvarSetFn` to `set` in `mq3.game.cvars.attach`. Return paths include `state`.
/// @param level Game-level state; accesses `spawner`, `cvarMaintenance`, `gameCvars` and `cvarSetFn`. May update `level.gameCvars` and `level.cvarSetFn` in place.
/// @param buildDate Value used by `entries` in `["","gamedate",buildDate,64,0,false,false],`.
function attach(level,buildDate)
  if level.spawner == void then return error(491,"Game Cvars require spawn state") end if
  state = State(level,level.spawner.cvars,[],void,false,level.cvarMaintenance)
  for each data in cvarTables.entries(buildDate)
    snapshot = void
    if data[0] != "" then snapshot = cv.createVm() end if
    state.rows = state.rows+[Row(data[0],data[1],data[2],data[3],data[4],data[5],data[6],snapshot)]
  end for
  level.gameCvars = state
  if level.cvarSetFn == void then level.cvarSetFn = set end if
  return state
end function
/// Update `state.level`, `level.gameCvars`, `level.spawner.cvars` and `level.cvarMaintenance` and related state during `rebind`.
/// @param level Game-level state; accesses `spawner`, `gameCvars`, `cvarMaintenance` and `cvarSetFn`. May update `level.gameCvars`, `level.spawner.cvars` and `level.cvarMaintenance` and additional fields in place.
/// @param state Cvars state; accesses `level`, `registry`, `passwordState` and `rows`. May update `state.level` in place.
function rebind(level,state)
  if level.spawner == void then return error(491,"Game Cvars require spawn state") end if
  state.level = level; level.gameCvars = state; level.spawner.cvars = state.registry
  level.cvarMaintenance = state.passwordState
  if level.cvarSetFn == void then level.cvarSetFn = set end if
  for each row in state.rows
    syncValue(level,row)
  end for
  return void
end function
/// Require and return the game cvar module state attached to the level.
/// @param level Game-level state; accesses `gameCvars`.
function moduleState(level)
  if level.gameCvars == void then return error(491,"Game Cvars require module state") end if
  return level.gameCvars
end function
/// Use `state.effectFn` to perform `observeCvar`.
/// @param state Cvars state; accesses `effectFn`.
/// @param kind Value passed as argument 2 to `state.effectFn`.
/// @param index Index of the entry to access.
/// @param key Lookup key or field name used by the operation.
/// @param value Value passed as argument 5 to `state.effectFn`.
function observeCvar(state,kind,index,key,value)
  if state.effectFn != void then state.effectFn(state,kind,index,key,value) end if
  return void
end function
/// Apply `mq3.game.cvars.moduleState`, `mq3.game.cvars.observeCvar` and `mq3.qcommon.cvar.set2` while evaluating `set`.
/// @param level Game-level state; accesses `gameCvars`.
/// @param key Lookup key or field name used by the operation.
/// @param value Value passed as argument 5 to `state.effectFn`.
function set(level,key,value)
  state = moduleState(level); observeCvar(state,3,-1,key,value)
  cv.set2(state.registry,key,value,true); return void
end function
/// Update `level.cheats`, `level.dedicated`, `level.spawner.gametype` and `level.spawner.restarted` and related state during `syncValue`.
/// @param level Game-level state; accesses `cheats`, `dedicated`, `spawner`, `maxclientsCvar` and `dmflags` and related fields. May update `level.cheats`, `level.dedicated` and `level.spawner.gametype` and additional fields in place.
/// @param row Row record; accesses `vm` and `vmName`.
function syncValue(level,row)
  v = row.vm
  if v == void then return void end if
  switch row.vmName
    case "g_cheats"
      level.cheats = v.integer
    end case
    case "g_dedicated"
      level.dedicated = v.integer
    end case
    case "g_gametype"
      level.spawner.gametype = v.integer
    end case
    case "g_restarted"
      level.spawner.restarted = v.integer
    end case
    case "g_maxclients"
      level.maxclientsCvar = v.integer
    end case
    case "g_dmflags"
      level.dmflags = v.integer
    end case
    case "g_fraglimit"
      level.fraglimit = v.integer
    end case
    case "g_timelimit"
      level.timelimit = v.integer
    end case
    case "g_capturelimit"
      level.capturelimit = v.integer
    end case
    case "g_synchronousClients"
      level.synchronousClients = v.integer != 0
    end case
    case "g_friendlyFire"
      level.friendlyFire = v.integer
    end case
    case "g_warmup"
      level.warmup = v.integer; level.warmupCvarModificationCount = v.modificationCount
    end case
    case "g_doWarmup"
      level.spawner.doWarmup = v.integer
    end case
    case "g_password"
      level.cvarMaintenance.password = v.string; level.cvarMaintenance.passwordModificationCount = v.modificationCount
    end case
    case "g_allowVote"
      level.allowVote = v.integer
    end case
    case "g_teamAutoJoin"
      level.teamAutoJoin = v.integer
    end case
    case "g_maxGameClients"
      level.maxGameClients = v.integer
    end case
    case "g_teamForceBalance"
      level.teamForceBalance = v.integer
    end case
    case "g_speed"
      level.playerSpeed = v.value
    end case
    case "g_gravity"
      level.gravity = v.value; level.spawner.gravity = v.value
    end case
    case "g_knockback"
      level.knockback = v.value
    end case
    case "g_quadfactor"
      level.quadfactor = v.value
    end case
    case "g_weaponRespawn"
      level.weaponRespawn = v.integer
    end case
    case "g_weaponTeamRespawn"
      level.weaponTeamRespawn = v.integer
    end case
    case "g_forcerespawn"
      level.forceRespawn = v.integer
    end case
    case "g_inactivity"
      level.inactivity = v.integer
    end case
    case "g_motd"
      level.spawner.motd = v.string
    end case
    case "g_blood"
      level.blood = v.integer
    end case
    case "g_listEntity"
      level.listEntity = v.integer
    end case
    case "g_smoothClients"
      level.smoothClients = v.integer != 0
    end case
    case "pmove_fixed"
      level.pmoveFixed = v.integer != 0
    end case
    case "pmove_msec"
      level.pmoveMsec = v.integer
    end case
  end switch
  return void
end function
/// Return `void` for `remapTeamShaders`.
/// @param level Not read by this implementation; retained in the `remapTeamShaders` signature.
function remapTeamShaders(level)
  // The entire original body is guarded by MISSIONPACK; Baseq3 is empty.
  return void
end function
/// Set `level.warmupModificationCount` to `level.warmupCvarModificationCount` in `mq3.game.cvars.register`.
/// @param level Game-level state; accesses `spawner`, `cvarSetFn`, `warmupModificationCount` and `warmupCvarModificationCount`. May update `level.warmupModificationCount` in place.
function register(level)
  state = moduleState(level); remapped = false; index = 0
  for each row in state.rows
    observeCvar(state,1,index,row.name,row.defaultString)
    cv.registerVm(state.registry,row.vm,row.name,row.defaultString,row.flags); syncValue(level,row)
    if row.vm != void then row.modificationCount = row.vm.modificationCount end if
    if row.teamShader then remapped = true end if
    index = index+1
  end for
  if remapped then remapTeamShaders(level) end if
  if level.spawner.gametype < 0 or level.spawner.gametype >= 8 then
    observeCvar(state,4,-1,"","g_gametype "+str(level.spawner.gametype)+" is out of range, defaulting to 0\n")
    if level.cvarSetFn == void then return error(491,"Game Cvars require engine set delivery") end if
    level.cvarSetFn(level,"g_gametype","0")
  end if
  level.warmupModificationCount = level.warmupCvarModificationCount
  state.registered = true; return void
end function
/// Use `level.serverCommandFn` to perform `update`.
/// @param level Game-level state; accesses `serverCommandFn`.
function update(level)
  state = moduleState(level)
  if not state.registered then return error(491,"Game Cvars must be registered before update") end if
  remapped = false; index = 0
  for each row in state.rows
    if row.vm != void then
      observeCvar(state,2,index,"",""); cv.updateVm(state.registry,row.vm); syncValue(level,row)
      if row.modificationCount != row.vm.modificationCount then
        row.modificationCount = row.vm.modificationCount
        if row.trackChange then
          if level.serverCommandFn == void then return error(491,"Cvar change requires server-command delivery") end if
          level.serverCommandFn(level,-1,"print \"Server: "+row.name+" changed to "+row.vm.string+"\n\"")
        end if
        if row.teamShader then remapped = true end if
      end if
    end if
    index = index+1
  end for
  if remapped then remapTeamShaders(level) end if
  return void
end function
