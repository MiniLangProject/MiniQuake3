// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_population as population
import mq3.game.bot_registry as registry
import mq3.game.bot_clients as clients
import mq3.game.entities as game
import mq3.shared.info as infoStrings
import mq3.collision.world as cm
import std.fs as fs
import std.string as strings

struct Context
  events
  userinfos
  nextClient
  connectFailure
end struct
struct Spawner
  gametype
end struct
function require(condition,label)
  if not condition then return error(499,"Bot population contract: "+label) end if
  return 1
end function
function same(a,b)
  if len(a) != len(b) then return false end if
  for i = 0 to len(a)-1 if a[i] != b[i] then return false end if end for
  return true
end function
function event(level,text) level.context.events = level.context.events+[text]; return void end function
function printMessage(level,text) return event(level,"print:"+text) end function
function command(level,mode,text) return event(level,"cmd:"+str(mode)+":"+text) end function
function server(level,slot,text) return event(level,"server:"+str(slot)+":"+text) end function
function cvarSet(level,key,value) return event(level,"cvar:"+key+":"+value) end function
function allocate(level) event(level,"allocate"); return level.context.nextClient end function
function setUserinfo(level,slot,value) level.context.userinfos[slot] = value; return event(level,"userinfo:"+str(slot)) end function
function connect(level,slot,firstTime,isBot)
  event(level,"connect:"+str(slot)+":"+str(firstTime)+":"+str(isBot))
  if level.context.connectFailure then return "rejected" end if
  return void
end function
function begin(level,slot) return event(level,"begin:"+str(slot)) end function

function fixture(world)
  level = game.create(world); level.spawner = Spawner(0); level.maxclients = 8; level.maxclientsCvar = 8
  level.context = Context([],array(64,""),4,false)
  bots = registry.create(void,void,printMessage,level)
  bots.botInfos = [
    "\\name\\Sarge\\funname\\^1Sarge\\model\\sarge/default\\headmodel\\sarge\\gender\\male\\color1\\1\\color2\\2\\aifile\\bots/sarge_c.c",
    "\\name\\Major\\model\\major/default\\aifile\\bots/major_c.c",
    "\\name\\Visor\\aifile\\bots/visor_c.c"]
  bots.arenaInfos = ["\\map\\q3dm0\\fraglimit\\0\\timelimit\\0\\special\\training\\bots\\Sarge Major"]
  queue = clients.create(); queue.clientBeginFn = begin; queue.printFn = printMessage
  state = population.create(bots,queue); state.allocateClientFn = allocate; state.connectClientFn = connect
  state.setUserinfoFn = setUserinfo; state.consoleFn = command; state.serverCommandFn = server
  state.printFn = printMessage; state.cvarSetFn = cvarSet
  return [level,state]
end function
function bind(level,slot,team,name,bot)
  client = level.clients[slot]; client.ps.clientNum = slot; client.connected = 2; client.team = team; client.netname = name
  level.entities[slot].client = client; if bot then level.entities[slot].r.svFlags = 8 end if
  return void
end function

function contracts(world)
  count = 0; pair = fixture(world); level = pair[0]; state = pair[1]
  cleaned = population.clean("^1A^^B"+decode(bytes([1,67])))
  count = count+require(cleaned=="A^C","Q_CleanStr color and printable filtering got "+cleaned)
  bind(level,0,1,"Sarge",true); bind(level,1,2,"Human",false)
  level.randSeed = 1; state.spSkill = 3.5
  count = count+require(population.addRandomBot(level,state,1),"random bot candidate exists")
  count = count+require(level.context.events[0]=="cmd:1:addbot Major 3.500000 red 0\n" or level.context.events[0]=="cmd:1:addbot Visor 3.500000 red 0\n","random bot excludes used same-team name")
  level.context.events = []; count = count+require(population.removeRandomBot(level,state,1),"remove matching bot")
  count = count+require(same(level.context.events,["cmd:1:kick Sarge\n"]),"remove emits first clean bot name")
  level.context.events = []; count = count+require(not population.removeRandomBot(level,state,3) and len(level.context.events)==0,"remove missing team")

  pair = fixture(world); level = pair[0]; state = pair[1]; state.minimumPlayers = 2; level.time = 9999
  count = count+require(not population.checkMinimumPlayers(level,state) and len(level.context.events)==0,"minimum throttled before ten seconds")
  level.time = 10000; level.spawner.gametype = 3
  count = count+require(population.checkMinimumPlayers(level,state),"team minimum check runs")
  count = count+require(len(level.context.events)==2 and stringsContains(level.context.events[0]," red 0\n") and stringsContains(level.context.events[1]," blue 0\n"),"team minimum adds both sides")
  count = count+require(state.checkTime==10000,"minimum deadline stored")
  level.intermissiontime = 1; level.time = 30000; level.context.events = []
  count = count+require(not population.checkMinimumPlayers(level,state) and state.checkTime==10000,"intermission suppresses check without advancing timer")

  pair = fixture(world); level = pair[0]; state = pair[1]; level.time = 10000; level.spawner.gametype = 1; state.minimumPlayers = 1
  bind(level,0,3,"^2Watcher",true); bind(level,1,0,"Human",false)
  population.checkMinimumPlayers(level,state)
  count = count+require(same(level.context.events,["cmd:1:kick Watcher\n"]),"tournament removes spectator bot before playing bot")

  pair = fixture(world); level = pair[0]; state = pair[1]
  slot = population.addBot(level,state,"Major",2.5,"",0,"")
  count = count+require(slot==4 and same(level.context.events,["allocate","userinfo:4","connect:4:true:true","begin:4"]),"addbot allocation/userinfo/connect/begin order")
  info = level.context.userinfos[4]
  count = count+require(infoStrings.value(info,"name")=="Major" and infoStrings.value(info,"model")=="major/default" and infoStrings.value(info,"headmodel")=="major/default","addbot names and model defaults")
  count = count+require(infoStrings.value(info,"sex")=="male" and infoStrings.value(info,"color1")=="4" and infoStrings.value(info,"color2")=="5","addbot cosmetic defaults")
  count = count+require(infoStrings.value(info,"handicap")=="70" and infoStrings.value(info,"skill")==" 2.50" and infoStrings.value(info,"team")=="red","addbot skill handicap and nonteam default")
  count = count+require(level.entities[4].inuse and (level.entities[4].r.svFlags&8)!=0,"allocated entity marked as bot")

  level.context.events = []; level.context.nextClient = 5; level.spawner.gametype = 3
  level.teamScores[1] = 0; level.teamScores[2] = 1
  population.addBot(level,state,"Sarge",4.0,"",500,"Alt")
  count = count+require(infoStrings.value(level.context.userinfos[5],"name")=="Alt" and infoStrings.value(level.context.userinfos[5],"team")=="red","team pick and alternative name")
  count = count+require(state.clients.queue[0].clientNum==5 and state.clients.queue[0].spawnTime==500,"delayed bot enters begin queue")
  count = count+require(level.context.events[len(level.context.events)-1]=="connect:5:true:true","delayed connect does not begin immediately")

  pair = fixture(world); level = pair[0]; state = pair[1]; level.context.nextClient = -1
  count = count+require(population.addBot(level,state,"Sarge",4.0,"",0,"")==-1,"full server add failure")
  count = count+require(len(level.context.events)==3 and level.context.events[1]=="print:^1Unable to add bot.  All player slots are in use.\n","full server diagnostics")
  level.context.events = []; count = count+require(population.addBot(level,state,"Missing",4.0,"",0,"")==-1 and len(level.context.events)==1,"unknown bot diagnostic")

  pair = fixture(world); level = pair[0]; state = pair[1]; level.time = 2001; level.startTime = 0; state.clRunning = true
  count = count+require(population.serviceAddBot(level,state,["Visor","3.25","blue","7","Neo"]),"Svcmd addbot parses arguments")
  count = count+require(infoStrings.value(level.context.userinfos[4],"name")=="Neo" and infoStrings.value(level.context.userinfos[4],"team")=="blue" and state.clients.queue[0].spawnTime==2008,"Svcmd addbot values reach queue")
  count = count+require(level.context.events[len(level.context.events)-1]=="server:-1:loaddefered\n","Svcmd preserves misspelled deferred-media command")
  level.context.events = []; state.botEnable = false
  count = count+require(not population.serviceAddBot(level,state,["Sarge"]) and len(level.context.events)==0,"disabled addbot command is silent")

  pair = fixture(world); level = pair[0]; state = pair[1]; state.spSkill = 9.0
  finish = population.spawnBots(level,state,"  Sarge   Major ",2000)
  count = count+require(finish==5000 and same(level.context.events,["cvar:g_spSkill:5","cmd:1:addbot Sarge 5.000000 free 2000\n","cmd:1:addbot Major 5.000000 free 3500\n"]),"G_SpawnBots skill clamp tokenization and stagger")
  level.context.events = []; level.spawner.gametype = 2
  count = count+require(population.initSinglePlayer(level,state,false,"q3dm0"),"single-player arena found")
  count = count+require(level.context.events[0]=="cvar:fraglimit:10" and level.context.events[1]=="cvar:timelimit:0" and stringsContains(level.context.events[2]," 12000\n"),"training arena limits and base delay")
  level.context.events = []; population.botList(level,state)
  count = count+require(len(level.context.events)==4 and stringsContains(level.context.events[3],"visor/default"),"bot list header, rows and defaults")
  return count
end function

function stringsContains(text,part)
  return strings.indexOf(text,part,0)>=0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true); count = contracts(world)
  print("PASS: "+str(count)+" bot population contracts\n"); return 0
end function
