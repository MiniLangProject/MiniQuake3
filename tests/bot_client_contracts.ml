// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_clients as bots
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs

struct Context
  events
  userinfos
  setupResult
  state
end struct

function require(condition,label)
  if not condition then return error(499,"Bot client contract: "+label) end if
  return 1
end function
function same(actual,expected)
  if len(actual) != len(expected) then return false end if
  for index = 0 to len(actual)-1
    if actual[index] != expected[index] then return false end if
  end for
  return true
end function
function event(level,text) level.context.events = level.context.events+[text]; return void end function
function minimum(level) return event(level,"minimum") end function
function begin(level,slot)
  return event(level,"begin:"+str(slot)+":"+str(level.context.state.queue[0].spawnTime))
end function
function userinfo(level,slot)
  event(level,"userinfo:"+str(slot)); return level.context.userinfos[slot]
end function
function intro(level,model) return event(level,"intro:"+model) end function
function printMessage(level,text) return event(level,"print:"+text) end function
function drop(level,slot,message) return event(level,"drop:"+str(slot)+":"+message) end function
function setupClient(level,slot,settings,restart)
  event(level,"setup:"+str(slot)+":"+settings.characterfile+":"+str(settings.skill)+":"+settings.team+":"+str(restart))
  return level.context.setupResult
end function

function fixture(world)
  level = game.create(world); spawn.create(level,""); level.maxclients = 4; level.time = 1000
  state = bots.create(); level.context = Context([],array(64,""),true,state)
  state.minimumPlayersFn = minimum; state.clientBeginFn = begin; state.userinfoFn = userinfo
  state.introSoundFn = intro; state.printFn = printMessage; state.dropClientFn = drop; state.setupClientFn = setupClient
  return [level,state]
end function

function contracts(world)
  count = 0; pair = fixture(world); level = pair[0]; state = pair[1]
  level.clients[0].connected = 2; level.clients[0].team = 1; level.clients[0].ps.clientNum = 2
  level.clients[1].connected = 2; level.clients[1].team = 2; level.clients[1].ps.clientNum = 1
  level.clients[2].connected = 1; level.clients[2].team = 1; level.clients[2].ps.clientNum = 0
  level.clients[3].connected = 2; level.clients[3].team = 1; level.clients[3].ps.clientNum = 3
  level.entities[1].r.svFlags = 8; level.entities[3].r.svFlags = 8
  count = count+require(bots.countHumanPlayers(level,-1)==1 and bots.countHumanPlayers(level,1)==1 and bots.countHumanPlayers(level,2)==0,"human count follows ps.clientNum entity")
  count = count+require(bots.countBotPlayers(level,state,-1)==2 and bots.countBotPlayers(level,state,1)==1 and bots.countBotPlayers(level,state,2)==1,"connected bot team count")

  count = count+require(bots.addBotToSpawnQueue(level,state,7,500),"first queue insert")
  count = count+require(state.queue[0].clientNum==7 and state.queue[0].spawnTime==1500,"queue deadline")
  count = count+require(bots.countBotPlayers(level,state,-1)==2,"future queued bot is excluded by original counter")
  level.time = 1500
  count = count+require(bots.countBotPlayers(level,state,-1)==3,"due queued bot is counted")
  bots.checkBotSpawn(level,state)
  count = count+require(same(level.context.events,["minimum","begin:7:1500"]),"minimum check and begin order")
  count = count+require(state.queue[0].spawnTime==0,"due begin clears after callback")

  level.context.events = []; level.time = 2000; level.spawner.gametype = 2; bots.addBotToSpawnQueue(level,state,4,1)
  level.context.userinfos[4] = "\\model\\sarge/default"
  level.time = 2001; bots.checkBotSpawn(level,state)
  count = count+require(same(level.context.events,["minimum","begin:4:2001","userinfo:4","intro:sarge/default"]),"single-player intro after cleared begin")

  state = bots.create(); level.context.state = state; state.clientBeginFn = begin; state.printFn = printMessage
  for index = 0 to 15
    bots.addBotToSpawnQueue(level,state,index,index+1)
  end for
  level.context.events = []
  count = count+require(not bots.addBotToSpawnQueue(level,state,19,99),"full queue immediate fallback")
  count = count+require(same(level.context.events,["print:^3Unable to delay spawn\n","begin:19:2002"]),"full queue warning and immediate begin")
  state.queue[4].clientNum = 5; state.queue[7].clientNum = 5; state.queue[4].spawnTime = 41; state.queue[7].spawnTime = 71
  count = count+require(bots.removeQueuedBotBegin(state,5) and state.queue[4].spawnTime==0 and state.queue[7].spawnTime==71,"removal stops at first matching client")
  count = count+require(not bots.removeQueuedBotBegin(state,99),"missing queue removal")

  pair = fixture(world); level = pair[0]; state = pair[1]
  longPath = decode(bytes(150,120)); longTeam = decode(bytes(150,121))
  level.context.userinfos[3] = "\\characterfile\\"+longPath+"\\skill\\3.75junk\\team\\"+longTeam
  count = count+require(bots.botConnect(level,state,3,false),"successful BotAI setup")
  expected = "setup:3:"+decode(bytes(143,120))+":3.75:"+decode(bytes(143,121))+":false"
  count = count+require(same(level.context.events,["userinfo:3",expected]),"settings extraction, CRT skill and Q_strncpyz limits")
  level.context.events = []; level.context.setupResult = false
  count = count+require(not bots.botConnect(level,state,3,true),"setup failure result")
  count = count+require(level.context.events[1]=="setup:3:"+decode(bytes(143,120))+":3.75:"+decode(bytes(143,121))+":true" and level.context.events[2]=="drop:3:BotAISetupClient failed","failed setup drops exact message")

  bare = bots.create(); level.context.state = bare
  count = count+require(try(bots.botConnect(level,bare,0,false)) is error,"connect requires userinfo")
  bare.userinfoFn = userinfo
  count = count+require(try(bots.botConnect(level,bare,0,false)) is error,"connect requires setup service")
  level.maxclients = 65
  count = count+require(try(bots.countHumanPlayers(level,-1)) is error,"count protects native client storage")
  return count
end function

function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  count = contracts(world); print("PASS: "+str(count)+" bot client contracts\n"); return 0
end function
