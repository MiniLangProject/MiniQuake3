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

const EXEC_APPEND = 2

function trap_Cvar_VariableValue(level,var_name)
  variable = cv.find(level.spawner.cvars,var_name)
  if variable == void then return 0.0 end if
  // g_bot.c requests the string trap and reparses it with atof.  Do the same
  // rather than returning Cvar.value, whose cache belongs to the engine.
  return numbers.atof32(variable.string)
end function

function G_ParseInfos(state,buf,max) return registry.parseInfos(state,buf,max) end function
function G_LoadArenasFromFile(state,filename) return registry.loadArenasFromFile(state,filename) end function
function G_LoadArenas(state,arenasFile) return registry.loadArenas(state,arenasFile) end function
function G_GetArenaInfoByMap(state,map) return registry.getArenaInfoByMap(state,map) end function
function G_LoadBotsFromFile(state,filename) return registry.loadBotsFromFile(state,filename) end function
function G_LoadBots(state,botEnable,botsFile) return registry.loadBots(state,botEnable,botsFile) end function
function G_GetBotInfoByNumber(state,num) return registry.getBotInfoByNumber(state,num) end function
function G_GetBotInfoByName(state,name) return registry.getBotInfoByName(state,name) end function

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

function G_AddRandomBot(level,state,team) return population.addRandomBot(level,state,team) end function
function G_RemoveRandomBot(level,state,team) return population.removeRandomBot(level,state,team) end function
function G_CountHumanPlayers(level,team) return clients.countHumanPlayers(level,team) end function
function G_CountBotPlayers(level,state,team) return clients.countBotPlayers(level,state,team) end function
function G_CheckMinimumPlayers(level,state) return population.checkMinimumPlayers(level,state) end function
function G_CheckBotSpawn(level,state) return clients.checkBotSpawn(level,state) end function
function AddBotToSpawnQueue(level,state,clientNum,delay) return clients.addBotToSpawnQueue(level,state,clientNum,delay) end function
function G_RemoveQueuedBotBegin(state,clientNum) return clients.removeQueuedBotBegin(state,clientNum) end function
function G_BotConnect(level,state,clientNum,restart) return clients.botConnect(level,state,clientNum,restart) end function

function G_AddBot(level,state,name,skill,team,delay,altname)
  return population.addBot(level,state,name,skill,team,delay,altname)
end function
function Svcmd_AddBot_f(level,state,argv)
  args = []; index = 1
  while index < len(argv) args = args+[argv[index]]; index = index+1 end while
  return population.serviceAddBot(level,state,args)
end function
function Svcmd_BotList_f(level,state) return population.botList(level,state) end function
function G_SpawnBots(level,state,botList,baseDelay) return population.spawnBots(level,state,botList,baseDelay) end function

function G_InitBots(level,state,restart,mapname,botEnable,botsFile,arenasFile)
  G_LoadBots(state.registry,botEnable,botsFile)
  G_LoadArenas(state.registry,arenasFile)
  if level.spawner.gametype == population.GT_SINGLE_PLAYER then
    return population.initSinglePlayer(level,state,restart,mapname)
  end if
  return true
end function
