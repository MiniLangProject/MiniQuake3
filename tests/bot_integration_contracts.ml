// SPDX-License-Identifier: GPL-2.0-or-later
// Integration contracts for the default g_bot.c registry/client wiring.
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.lifecycle as lifecycle
import mq3.game.client_connect as clientConnect
import mq3.game.client_disconnect as clientDisconnect
import mq3.game.frame as frame
import mq3.game.bot_clients as botClients
import mq3.collision.world as cm
import mq3.qcommon.cvar as cv
import std.fs as fs

struct Context
  events
  userinfos
end struct

function require(condition,label)
  if not condition then return error(499,"Bot integration contract: "+label) end if
  return 1
end function
function event(level,text)
  level.context.events = level.context.events+[text]; return void
end function
function readRegistry(level,name)
  event(level,"read:"+name)
  if name == "scripts/bots.txt" then return "{ name Sarge }" end if
  if name == "scripts/arenas.txt" then return "{ map q3dm1 }" end if
  return void
end function
function listRegistry(level,path,extension,capacity)
  event(level,"list:"+path+":"+extension+":"+str(capacity)); return []
end function
function quietPrint(level,text) return event(level,"print:"+text) end function
function userinfo(level,slot) return level.context.userinfos[slot] end function
function allowPacket(level,address) return false end function
function setupClient(level,slot,settings,restart)
  event(level,"setup:"+str(slot)+":"+settings.characterfile+":"+str(restart)); return true
end function
function aasUnavailable(services)
  event(services.context,"aas-unavailable"); return false
end function
function integrationDrop(level,slot,message)
  return event(level,"drop:"+str(slot)+":"+message)
end function
function integrationBegin(level,slot) return event(level,"begin:"+str(slot)) end function
function minimum(level) return event(level,"minimum") end function
function logMessage(level,text) return event(level,"log:"+text) end function
function removeHook(level,slot) return event(level,"remove-hook:"+str(slot)) end function
function shutdownClient(state,slot,restart)
  state.context.events = state.context.events+["shutdown:"+str(slot)+":"+str(restart)]; return true
end function
function noopRefresh(level) return void end function
function noopStage(level,kind,arg) return void end function

function attached(world)
  level = game.create(world); spawn.create(level,""); level.context = Context([],array(64,""))
  level.gamePrintFn = quietPrint; lifecycle.attach(level,"Sep  8 2026")
  return level
end function

function contracts(world)
  count = 0; level = attached(world); state = lifecycle.get(level)
  state.botRegistry.readFileFn = readRegistry; state.botRegistry.listFilesFn = listRegistry
  lifecycle.defaultInitBots(level,0)
  count = count+require(len(state.botRegistry.botInfos)==1 and len(state.botRegistry.arenaInfos)==1,"default G_InitBots loads bot and arena registries")
  count = count+require(cv.find(level.spawner.cvars,"g_botsFile") != void and cv.find(level.spawner.cvars,"g_arenasFile") != void and cv.find(level.spawner.cvars,"bot_minplayers") != void,"default G_InitBots registers original Cvars")

  level = attached(world); state = lifecycle.get(level); clients = state.botClients
  level.userinfoFn = userinfo; level.filterPacketFn = allowPacket; clients.setupClientFn = setupClient
  level.context.userinfos[0] = "\\ip\\localhost\\characterfile\\bots/sarge_c.c\\skill\\4\\team\\red"
  cv.set2(level.spawner.cvars,"session0","0 0 0 0 0 0 0",true)
  result = clientConnect.connect(level,0,false,true)
  count = count+require(result is void and level.context.events[0]=="setup:0:bots/sarge_c.c:true","ClientConnect uses default G_BotConnect")

  level = attached(world); state = lifecycle.get(level)
  level.userinfoFn = userinfo; level.dropClientFn = integrationDrop
  level.context.userinfos[2] = "\\characterfile\\bots/sarge_c.c\\skill\\3.5\\team\\blue"
  state.botClientResources.context = level; state.botClientResources.aasInitializedFn = aasUnavailable
  result = lifecycle.defaultBotConnect(level,2,0)
  count = count+require(not result and state.botState.botstates[2] != void and not state.botState.botstates[2].inuse,"default G_BotConnect owns BotAISetupClient resources")
  count = count+require(level.context.events[0]=="aas-unavailable" and level.context.events[1]=="drop:2:BotAISetupClient failed","resource setup failure reaches default DropClient")
  result = state.botState.shutdownClientFn(state.botState,2,0)
  count = count+require(not result,"bot lifecycle default shutdown uses resource owner for inactive client")

  level = attached(world); state = lifecycle.get(level); clients = state.botClients
  clients.queue[0].clientNum = 3; clients.queue[0].spawnTime = 50
  clientDisconnect.disconnect(level,3)
  count = count+require(clients.queue[0].spawnTime==0,"ClientDisconnect removes lifecycle queue entry before NULL client return")
  clients.queue[0].clientNum = 4; clients.queue[0].spawnTime = 60; level.removeQueuedBotBeginFn = removeHook
  clientDisconnect.disconnect(level,4)
  count = count+require(clients.queue[0].spawnTime==60 and level.context.events[len(level.context.events)-1]=="remove-hook:4","explicit disconnect queue hook keeps priority")

  level = attached(world); state = lifecycle.get(level); clients = state.botClients
  level.time = 99; level.maxclients = 0; level.updateCvarsFn = noopRefresh; level.frameStageFn = noopStage
  clients.clientBeginFn = integrationBegin; clients.minimumPlayersFn = minimum
  clients.queue[0].clientNum = 7; clients.queue[0].spawnTime = 100
  frame.run(level,100)
  count = count+require(clients.queue[0].spawnTime==0 and level.context.events[0]=="minimum" and level.context.events[1]=="begin:7","G_RunFrame checks bot queue after time update")

  level = attached(world); state = lifecycle.get(level); clients = state.botClients
  level.removeQueuedBotBeginFn = removeHook; level.gameLogFn = logMessage; level.maxclients = 1
  ent = level.entities[0]; game.bindClient(level,ent,level.clients[0]); ent.inuse = true; ent.r.svFlags = 8
  state.botState.context = level.context; state.botState.shutdownClientFn = shutdownClient
  clientDisconnect.disconnect(level,0)
  count = count+require(level.context.events[len(level.context.events)-1]=="shutdown:0:false","ClientDisconnect uses default BotAIShutdownClient")
  return count
end function

function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  count = contracts(world); print "PASS: "+str(count)+" bot integration contracts"; return 0
end function
