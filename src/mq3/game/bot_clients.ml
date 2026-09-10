// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_bot.c client counting, delayed begin queue and BotConnect glue.
package mq3.game.bot_clients
import mq3.shared.info as infoStrings
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textNumbers

const CON_CONNECTED = 2
const SVF_BOT = 8
const GT_SINGLE_PLAYER = 2
const BOT_SPAWN_QUEUE_DEPTH = 16

struct SpawnEntry
  clientNum
  spawnTime
end struct
struct BotSettings
  characterfile
  skill
  team
end struct
struct State
  queue
  minimumPlayersFn
  clientBeginFn
  userinfoFn
  introSoundFn
  printFn
  dropClientFn
  setupClientFn
end struct

function create()
  queue = []
  for index = 0 to BOT_SPAWN_QUEUE_DEPTH-1
    queue = queue+[SpawnEntry(0,0)]
  end for
  return State(queue,void,void,void,void,void,void,void)
end function

function clientLimit(level)
  if level.maxclients < 0 or level.maxclients > 64 then return error(496,"Invalid bot client limit") end if
  return level.maxclients
end function

function entityForClient(level,client)
  number = client.ps.clientNum
  if number < 0 or number >= 1024 then return error(496,"Invalid bot client entity number") end if
  return level.entities[number]
end function

function countHumanPlayers(level,team)
  count = 0; limit = clientLimit(level)
  for index = 0 to limit-1
    client = level.clients[index]
    if client.connected != CON_CONNECTED then continue end if
    if (entityForClient(level,client).r.svFlags & SVF_BOT) != 0 then continue end if
    if team >= 0 and client.team != team then continue end if
    count = count+1
  end for
  return count
end function

function countBotPlayers(level,state,team)
  if state == void then return error(496,"Bot count requires queue state") end if
  count = 0; limit = clientLimit(level)
  for index = 0 to limit-1
    client = level.clients[index]
    if client.connected != CON_CONNECTED then continue end if
    if (entityForClient(level,client).r.svFlags & SVF_BOT) == 0 then continue end if
    if team >= 0 and client.team != team then continue end if
    count = count+1
  end for
  for index = 0 to BOT_SPAWN_QUEUE_DEPTH-1
    entry = state.queue[index]
    if entry.spawnTime == 0 then continue end if
    if entry.spawnTime > level.time then continue end if
    count = count+1
  end for
  return count
end function

function addBotToSpawnQueue(level,state,clientNum,delay)
  if state == void then return error(496,"Bot queue insertion requires state") end if
  for index = 0 to BOT_SPAWN_QUEUE_DEPTH-1
    entry = state.queue[index]
    if entry.spawnTime == 0 then
      entry.spawnTime = n.add32(level.time,delay); entry.clientNum = clientNum; return true
    end if
  end for
  if state.printFn == void then return error(496,"Bot queue overflow requires diagnostic delivery") end if
  state.printFn(level,"^3Unable to delay spawn\n")
  if state.clientBeginFn == void then return error(496,"Bot queue overflow requires ClientBegin") end if
  state.clientBeginFn(level,clientNum); return false
end function

function removeQueuedBotBegin(state,clientNum)
  if state == void then return error(496,"Bot queue removal requires state") end if
  for index = 0 to BOT_SPAWN_QUEUE_DEPTH-1
    entry = state.queue[index]
    if entry.clientNum == clientNum then entry.spawnTime = 0; return true end if
  end for
  return false
end function

function beginClient(level,state,entry)
  if state.clientBeginFn == void then return error(496,"Bot spawn requires ClientBegin") end if
  state.clientBeginFn(level,entry.clientNum); entry.spawnTime = 0
  if level.spawner.gametype == GT_SINGLE_PLAYER then
    if state.userinfoFn == void then return error(496,"Bot intro requires userinfo") end if
    userinfo = infoStrings.copy(state.userinfoFn(level,entry.clientNum),1024)
    model = infoStrings.value(userinfo,"model")
    if state.introSoundFn == void then return error(496,"Bot intro requires sound delivery") end if
    state.introSoundFn(level,model)
  end if
  return void
end function

function checkBotSpawn(level,state)
  if state == void then return error(496,"Bot spawn check requires state") end if
  if state.minimumPlayersFn == void then return error(496,"Bot spawn check requires minimum-player service") end if
  state.minimumPlayersFn(level)
  for index = 0 to BOT_SPAWN_QUEUE_DEPTH-1
    entry = state.queue[index]
    if entry.spawnTime == 0 then continue end if
    if entry.spawnTime > level.time then continue end if
    beginClient(level,state,entry)
  end for
  return void
end function

function botConnect(level,state,clientNum,restart)
  if state == void then return error(496,"Bot connect requires state") end if
  if state.userinfoFn == void then return error(496,"Bot connect requires userinfo") end if
  userinfo = infoStrings.copy(state.userinfoFn(level,clientNum),1024)
  settings = BotSettings(infoStrings.copy(infoStrings.value(userinfo,"characterfile"),144),
    n.f32(textNumbers.atof(infoStrings.value(userinfo,"skill"))),
    infoStrings.copy(infoStrings.value(userinfo,"team"),144))
  if state.setupClientFn == void then return error(496,"Bot connect requires setup service") end if
  if not state.setupClientFn(level,clientNum,settings,restart) then
    if state.dropClientFn == void then return error(496,"Bot setup failure requires DropClient") end if
    state.dropClientFn(level,clientNum,"BotAISetupClient failed"); return false
  end if
  return true
end function
