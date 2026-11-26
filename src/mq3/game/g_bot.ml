// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/game/g_bot.c surface.  The original module stores its
// registries, delayed-begin queue and engine traps in globals.  This facade
// keeps those objects explicit while routing every entry into the production
// registry, client, population and bot-resource implementations.
package mq3.game.g_bot

import mq3.game.bot_registry as registry
import mq3.game.bot_clients as clients
import mq3.game.bot_population as population
import mq3.qcommon.cvar as cv
import mq3.compat.textnumbers as numbers
import std.string as strings

/// Console-command execution mode selecting append scheduling.
const EXEC_APPEND = 2

/// Apply `mq3.qcommon.cvar.find` while evaluating `trap_Cvar_VariableValue`. Return paths include `numbers.atof32(variable.string)`.
/// @param level Game-level state; accesses `spawner`.
/// @param var_name Name used to identify the requested entry.
function trap_Cvar_VariableValue(level,var_name)
  variable = cv.find(level.spawner.cvars,var_name)
  if variable == void then return 0.0 end if
  // g_bot.c requests the string trap and reparses it with atof.  Do the same
  // rather than returning Cvar.value, whose cache belongs to the engine.
  return numbers.atof32(variable.string)
end function

/// Forward `G_ParseInfos` to `mq3.game.bot_registry.parseInfos` and return the delegated result.
/// @param state Bot registry state; accesses `context` and `printFn`.
/// @param buf Text to parse, format or deliver.
/// @param max Value used by `parseInfos` in `if max < 0 then return error(490,"Negative info capacity") end if`.
function G_ParseInfos(state,buf,max) return registry.parseInfos(state,buf,max) end function
/// Forward `G_LoadArenasFromFile` to `mq3.game.bot_registry.loadArenasFromFile` and return the delegated result.
/// @param state Bot registry state; accesses `arenaInfos`. May update `state.arenaInfos` in place.
/// @param filename Filename supplied to the configured loader or file service.
function G_LoadArenasFromFile(state,filename) return registry.loadArenasFromFile(state,filename) end function
/// Forward `G_LoadArenas` to `mq3.game.bot_registry.loadArenas` and return the delegated result.
/// @param state Bot registry state; accesses `arenaInfos`, `context` and `printFn`. May update `state.arenaInfos` in place.
/// @param arenasFile Filename supplied to the configured loader or file service.
function G_LoadArenas(state,arenasFile) return registry.loadArenas(state,arenasFile) end function
/// Forward `G_GetArenaInfoByMap` to `mq3.game.bot_registry.getArenaInfoByMap` and return the delegated result.
/// @param state Bot registry state; accesses `arenaInfos`.
/// @param map Value passed as argument 2 to `std.string.equalsIgnoreCaseAscii`.
function G_GetArenaInfoByMap(state,map) return registry.getArenaInfoByMap(state,map) end function
/// Forward `G_LoadBotsFromFile` to `mq3.game.bot_registry.loadBotsFromFile` and return the delegated result.
/// @param state Bot registry state; accesses `botInfos`. May update `state.botInfos` in place.
/// @param filename Filename supplied to the configured loader or file service.
function G_LoadBotsFromFile(state,filename) return registry.loadBotsFromFile(state,filename) end function
/// Forward `G_LoadBots` to `mq3.game.bot_registry.loadBots` and return the delegated result.
/// @param state Bot registry state; accesses `botInfos`. May update `state.botInfos` in place.
/// @param botEnable Value used by `loadBots` in `if not botEnable then return void end if`.
/// @param botsFile Filename supplied to the configured loader or file service.
function G_LoadBots(state,botEnable,botsFile) return registry.loadBots(state,botEnable,botsFile) end function
/// Forward `G_GetBotInfoByNumber` to `mq3.game.bot_registry.getBotInfoByNumber` and return the delegated result.
/// @param state Bot registry state; accesses `botInfos`.
/// @param num Value passed as argument 1 to `str`.
function G_GetBotInfoByNumber(state,num) return registry.getBotInfoByNumber(state,num) end function
/// Forward `G_GetBotInfoByName` to `mq3.game.bot_registry.getBotInfoByName` and return the delegated result.
/// @param state Bot registry state; accesses `botInfos`.
/// @param name Name used to identify the requested entry.
function G_GetBotInfoByName(state,name) return registry.getBotInfoByName(state,name) end function

/// Use `level.consoleCommandFn` to perform `PlayerIntroSound`.
/// @param level Game-level state; accesses `consoleCommandFn`.
/// @param modelAndSkin Value used by `PlayerIntroSound` in `model = modelAndSkin`.
function PlayerIntroSound(level,modelAndSkin)
  model = modelAndSkin; slash = strings.lastIndexOf(model,"/")
  skin = model
  if slash >= 0 then
    skin = strings.substr(model,slash+1,len(model)-slash-1)
    model = strings.substr(model,0,slash)
  end if
  if strings.equalsIgnoreCaseAscii(skin,"default") then skin = model end if
  if level.consoleCommandFn == void then return error(494,"PlayerIntroSound requires console-command delivery") end if
  level.consoleCommandFn(level,EXEC_APPEND,"play sound/player/announce/"+skin+".wav\n")
  return void
end function

/// Forward `G_AddRandomBot` to `mq3.game.bot_population.addRandomBot` and return the delegated result.
/// @param level Game-level state; accesses `clients`.
/// @param state Bot population state; accesses `registry` and `spSkill`.
/// @param team Team identifier used by the game rules.
function G_AddRandomBot(level,state,team) return population.addRandomBot(level,state,team) end function
/// Forward `G_RemoveRandomBot` to `mq3.game.bot_population.removeRandomBot` and return the delegated result.
/// @param level Game-level state; accesses `clients`.
/// @param state Bot population state; accesses `consoleFn`.
/// @param team Team identifier used by the game rules.
function G_RemoveRandomBot(level,state,team) return population.removeRandomBot(level,state,team) end function
/// Forward `G_CountHumanPlayers` to `mq3.game.bot_clients.countHumanPlayers` and return the delegated result.
/// @param level Game-level state; accesses `clients`.
/// @param team Team identifier used by the game rules.
function G_CountHumanPlayers(level,team) return clients.countHumanPlayers(level,team) end function
/// Forward `G_CountBotPlayers` to `mq3.game.bot_clients.countBotPlayers` and return the delegated result.
/// @param level Game-level state; accesses `clients` and `time`.
/// @param state Bot clients state; accesses `queue`.
/// @param team Team identifier used by the game rules.
function G_CountBotPlayers(level,state,team) return clients.countBotPlayers(level,state,team) end function
/// Forward `G_CheckMinimumPlayers` to `mq3.game.bot_population.checkMinimumPlayers` and return the delegated result.
/// @param level Game-level state; accesses `intermissiontime`, `time`, `spawner` and `maxclients`.
/// @param state Bot population state; accesses `checkTime`, `minimumVm`, `minimumPlayers` and `clients`. May update `state.checkTime` and `state.minimumPlayers` in place.
function G_CheckMinimumPlayers(level,state) return population.checkMinimumPlayers(level,state) end function
/// Forward `G_CheckBotSpawn` to `mq3.game.bot_clients.checkBotSpawn` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param state Bot clients state; accesses `minimumPlayersFn` and `queue`.
function G_CheckBotSpawn(level,state) return clients.checkBotSpawn(level,state) end function
/// Forward `AddBotToSpawnQueue` to `mq3.game.bot_clients.addBotToSpawnQueue` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param state Bot clients state; accesses `queue`, `printFn` and `clientBeginFn`.
/// @param clientNum Client slot number.
/// @param delay Value passed as argument 2 to `mq3.compat.numeric.add32`.
function AddBotToSpawnQueue(level,state,clientNum,delay) return clients.addBotToSpawnQueue(level,state,clientNum,delay) end function
/// Forward `G_RemoveQueuedBotBegin` to `mq3.game.bot_clients.removeQueuedBotBegin` and return the delegated result.
/// @param state Bot clients state; accesses `queue`.
/// @param clientNum Client slot number.
function G_RemoveQueuedBotBegin(state,clientNum) return clients.removeQueuedBotBegin(state,clientNum) end function
/// Forward `G_BotConnect` to `mq3.game.bot_clients.botConnect` and return the delegated result.
/// @param level Value passed as argument 1 to `state.userinfoFn`.
/// @param state Bot clients state; accesses `userinfoFn`, `setupClientFn` and `dropClientFn`.
/// @param clientNum Client slot number.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function G_BotConnect(level,state,clientNum,restart) return clients.botConnect(level,state,clientNum,restart) end function

/// Forward `G_AddBot` to `mq3.game.bot_population.addBot` and return the delegated result.
/// @param level Game-level state; accesses `maxclients`, `spawner` and `entities`.
/// @param state Bot population state; accesses `registry`, `allocateClientFn`, `setUserinfoFn`, `connectClientFn` and `clients`.
/// @param name Name used to identify the requested entry.
/// @param skill Bot skill value used to select or interpolate characteristics.
/// @param team Team identifier used by the game rules.
/// @param delay Value passed as argument 2 to `mq3.compat.numeric.add32`.
/// @param altname Value used by `addBot` in `if altname != void and altname != "" then botname = altname end if`.
function G_AddBot(level,state,name,skill,team,delay,altname)
  return population.addBot(level,state,name,skill,team,delay,altname)
end function
/// Apply `mq3.game.bot_population.serviceAddBot` while evaluating `Svcmd_AddBot_f`. Return paths include `population.serviceAddBot(level,state,args)`.
/// @param level Game-level state; accesses `time` and `startTime`.
/// @param state Bot population state; accesses `botEnable`, `clRunning` and `serverCommandFn`.
/// @param argv Command argument strings in their original order.
function Svcmd_AddBot_f(level,state,argv)
  args = []; index = 1
  while index < len(argv) args = args+[argv[index]]; index = index+1 end while
  return population.serviceAddBot(level,state,args)
end function
/// Forward `Svcmd_BotList_f` to `mq3.game.bot_population.botList` and return the delegated result.
/// @param level Value passed as argument 1 to `state.printFn`.
/// @param state Bot population state; accesses `registry`.
function Svcmd_BotList_f(level,state) return population.botList(level,state) end function
/// Forward `G_SpawnBots` to `mq3.game.bot_population.spawnBots` and return the delegated result.
/// @param level Value passed as argument 1 to `state.consoleFn`.
/// @param state Bot population state; accesses `spSkill` and `cvarSetFn`. May update `state.spSkill` in place.
/// @param botList Text to parse, format or deliver.
/// @param baseDelay Value used by `spawnBots` in `delay = baseDelay`.
function G_SpawnBots(level,state,botList,baseDelay) return population.spawnBots(level,state,botList,baseDelay) end function

/// Apply `mq3.game.g_bot.G_LoadBots`, `mq3.game.g_bot.G_LoadArenas` and `mq3.game.bot_population.initSinglePlayer` while evaluating `G_InitBots`.
/// @param level Game-level state; accesses `spawner`.
/// @param state G bot state; accesses `registry`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
/// @param mapname Value passed as argument 2 to `std.string.equalsIgnoreCaseAscii`.
/// @param botEnable Value used by `loadBots` in `if not botEnable then return void end if`.
/// @param botsFile Filename supplied to the configured loader or file service.
/// @param arenasFile Filename supplied to the configured loader or file service.
function G_InitBots(level,state,restart,mapname,botEnable,botsFile,arenasFile)
  G_LoadBots(state.registry,botEnable,botsFile)
  G_LoadArenas(state.registry,arenasFile)
  if level.spawner.gametype == population.GT_SINGLE_PLAYER then
    return population.initSinglePlayer(level,state,restart,mapname)
  end if
  return true
end function
