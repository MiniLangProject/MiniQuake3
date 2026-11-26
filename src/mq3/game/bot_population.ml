// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_bot.c population policy and addbot command. Engine-owned client
// allocation, userinfo storage and command buffers remain explicit services.
package mq3.game.bot_population
import mq3.game.bot_registry as botRegistry
import mq3.game.bot_clients as botClients
import mq3.game.constants as c
import mq3.shared.info as infoStrings
import mq3.compat.textnumbers as textnum
import mq3.qcommon.cvar as cv
import std.string as strings

/// Game-mode identifier selecting ffa rules.
const GT_FFA = 0
/// Game-mode identifier selecting tournament rules.
const GT_TOURNAMENT = 1
/// Game-mode identifier selecting single player rules.
const GT_SINGLE_PLAYER = 2
/// Game-mode identifier selecting team rules.
const GT_TEAM = 3
/// Server entity-flag bit controlling bot.
const SVF_BOT = 8
/// Console-command execution mode selecting insert scheduling.
const EXEC_INSERT = 1
/// Initial delay in milliseconds before queued bots begin playing.
const BOT_BEGIN_DELAY_BASE = 2000
/// Additional delay in milliseconds used to stagger consecutive bot starts.
const BOT_BEGIN_DELAY_INCREMENT = 1500

/// `State` record for bot population, containing `registry`, `clients`, `checkTime`, `minimumPlayers` and `minimumVm` and related fields.
struct State
  /// Registry of currently loaded preprocessor/token sources.
  registry
  /// Client records indexed by client slot.
  clients
  /// Deadline for the next periodic condition check.
  checkTime
  /// Target minimum player count maintained by bot population logic.
  minimumPlayers
  /// VM console-variable record controlling the minimum-player target.
  minimumVm
  /// Single-player bot skill setting.
  spSkill
  /// Setting controlling bot creation and bot-AI processing.
  botEnable
  /// Setting indicating whether a local client is running.
  clRunning
  /// Injected callback for allocate client; invoked through the State service/state record.
  allocateClientFn
  /// Injected callback for connect client; invoked through the State service/state record.
  connectClientFn
  /// Injected callback for set user information; invoked through the State service/state record.
  setUserinfoFn
  /// Injected callback for console; invoked through the State service/state record.
  consoleFn
  /// Injected callback for server command; invoked through the State service/state record.
  serverCommandFn
  /// Injected callback for print; invoked through the State service/state record.
  printFn
  /// Injected callback for console variable set; invoked through the State service/state record.
  cvarSetFn
end struct

/// Create a `mq3.game.bot_population.State` record, initializing `registry` from `registry`, `clients` from `clients` and `spSkill` as `4.0`.
/// @param registry Initial value stored in `mq3.game.bot_population.State.registry`.
/// @param clients Initial value stored in `mq3.game.bot_population.State.clients`.
function create(registry,clients)
  return State(registry,clients,0,0,void,4.0,true,false,void,void,void,void,void,void,void)
end function

/// Use `state.printFn` to perform `output`.
/// @param level Value passed as argument 1 to `state.printFn`.
/// @param state Bot population state; accesses `printFn`.
/// @param text Text to parse, format or deliver.
function output(level,state,text)
  if state.printFn != void then state.printFn(level,text) end if
  return void
end function

/// Use `state.consoleFn` to perform `console`.
/// @param level Value passed as argument 1 to `state.consoleFn`.
/// @param state Bot population state; accesses `consoleFn`.
/// @param text Text to parse, format or deliver.
function console(level,state,text)
  if state.consoleFn == void then return error(494,"Bot population requires console-command delivery") end if
  state.consoleFn(level,EXEC_INSERT,text); return void
end function

/// Apply `mq3.shared.info.textBytes` while evaluating `clean`. Return paths include `decode(bytes(result))`.
/// @param text Text to parse, format or deliver.
function clean(text)
  data = infoStrings.textBytes(text); result = []; index = 0
  while index < len(data)
    part = data[index]
    if part == 94 and index+1 < len(data) and data[index+1] != 94 then index = index+2; continue end if
    if part >= 32 and part <= 126 then result = result+[part] end if
    index = index+1
  end while
  return decode(bytes(result))
end function

/// Apply `mq3.game.bot_clients.clientLimit` and `mq3.game.bot_clients.entityForClient` while evaluating `botAlreadyUsed`.
/// @param level Game-level state; accesses `clients`.
/// @param state Not read by this implementation; retained in the `botAlreadyUsed` signature.
/// @param name Name used to identify the requested entry.
/// @param team Team identifier used by the game rules.
function botAlreadyUsed(level,state,name,team)
  limit = botClients.clientLimit(level)
  for index = 0 to limit-1
    client = level.clients[index]
    if client.connected != botClients.CON_CONNECTED then continue end if
    ent = botClients.entityForClient(level,client)
    if (ent.r.svFlags & SVF_BOT) == 0 then continue end if
    if team >= 0 and client.team != team then continue end if
    if strings.equalsIgnoreCaseAscii(name,client.netname) then return true end if
  end for
  return false
end function

/// Apply `mq3.shared.info.value`, `mq3.game.bot_population.botAlreadyUsed` and `mq3.game.bot_population.console` while evaluating `addRandomBot`.
/// @param level Game-level state; accesses `clients`.
/// @param state Bot population state; accesses `registry` and `spSkill`.
/// @param team Team identifier used by the game rules.
function addRandomBot(level,state,team)
  available = []
  for each row in state.registry.botInfos
    name = infoStrings.value(row,"name")
    if not botAlreadyUsed(level,state,name,team) then available = available+[name] end if
  end for
  if len(available) == 0 then return false end if
  // random() may be exactly 1.0; the native decrement loop then selects the
  // final candidate, so clamp the resulting one-past index to that candidate.
  choice = textnum.truncDouble32((game.random(level)/32767.0)*len(available))
  if choice >= len(available) then choice = len(available)-1 end if
  teamText = ""
  if team == c.TEAM_RED then teamText = "red" else if team == c.TEAM_BLUE then teamText = "blue" end if
  console(level,state,"addbot "+clean(infoStrings.copy(available[choice],36))+" "+textnum.fixed6(state.spSkill)+" "+teamText+" 0\n")
  return true
end function

/// Apply `mq3.game.bot_clients.clientLimit`, `mq3.game.bot_clients.entityForClient` and `mq3.game.bot_population.console` while evaluating `removeRandomBot`.
/// @param level Game-level state; accesses `clients`.
/// @param state Bot population state; accesses `consoleFn`.
/// @param team Team identifier used by the game rules.
function removeRandomBot(level,state,team)
  limit = botClients.clientLimit(level)
  for index = 0 to limit-1
    client = level.clients[index]
    if client.connected != botClients.CON_CONNECTED then continue end if
    if (botClients.entityForClient(level,client).r.svFlags & SVF_BOT) == 0 then continue end if
    if team >= 0 and client.team != team then continue end if
    console(level,state,"kick "+clean(infoStrings.copy(client.netname,36))+"\n"); return true
  end for
  return false
end function

/// Set `state.checkTime` to `level.time` and `state.minimumPlayers` to `state.minimumVm.integer` in `mq3.game.bot_population.checkMinimumPlayers`.
/// @param level Game-level state; accesses `intermissiontime`, `time`, `spawner` and `maxclients`.
/// @param state Bot population state; accesses `checkTime`, `minimumVm`, `minimumPlayers` and `clients`. May update `state.checkTime` and `state.minimumPlayers` in place.
function checkMinimumPlayers(level,state)
  if level.intermissiontime != 0 then return false end if
  if state.checkTime > level.time-10000 then return false end if
  state.checkTime = level.time
  if state.minimumVm != void then cv.updateVm(level.spawner.cvars,state.minimumVm); state.minimumPlayers = state.minimumVm.integer end if
  minplayers = state.minimumPlayers
  if minplayers <= 0 then return false end if
  gametype = level.spawner.gametype
  if gametype >= GT_TEAM then
    if minplayers >= (level.maxclients >> 1) then minplayers = (level.maxclients >> 1)-1 end if
    for each team in [c.TEAM_RED,c.TEAM_BLUE]
      humans = botClients.countHumanPlayers(level,team); bots = botClients.countBotPlayers(level,state.clients,team)
      if humans+bots < minplayers then addRandomBot(level,state,team)
      else if humans+bots > minplayers and bots != 0 then removeRandomBot(level,state,team) end if
    end for
  else if gametype == GT_TOURNAMENT then
    if minplayers >= level.maxclients then minplayers = level.maxclients-1 end if
    humans = botClients.countHumanPlayers(level,-1); bots = botClients.countBotPlayers(level,state.clients,-1)
    if humans+bots < minplayers then addRandomBot(level,state,c.TEAM_FREE)
    else if humans+bots > minplayers and bots != 0 then
      if not removeRandomBot(level,state,c.TEAM_SPECTATOR) then removeRandomBot(level,state,-1) end if
    end if
  else if gametype == GT_FFA then
    if minplayers >= level.maxclients then minplayers = level.maxclients-1 end if
    humans = botClients.countHumanPlayers(level,c.TEAM_FREE); bots = botClients.countBotPlayers(level,state.clients,c.TEAM_FREE)
    if humans+bots < minplayers then addRandomBot(level,state,c.TEAM_FREE)
    else if humans+bots > minplayers and bots != 0 then removeRandomBot(level,state,c.TEAM_FREE) end if
  end if
  return true
end function

/// Forward `infoSet` to `mq3.shared.info.setValue` and return the delegated result.
/// @param level Context forwarded to the configured host callbacks.
/// @param state Bot population state; accesses `printFn`.
/// @param value Text to parse, format or deliver.
/// @param key Lookup key or field name used by the operation.
/// @param text Text to parse, format or deliver.
function infoSet(level,state,value,key,text)
  return infoStrings.setValue(value,key,text,level,state.printFn)
end function

/// Apply `mq3.game.bot_clients.clientLimit` while evaluating `teamCount`. Return paths include `count`.
/// @param level Game-level state; accesses `clients`.
/// @param ignore Value used by `teamCount` in `if slot != ignore and client.connected != 0 and client.team == team then count = count+1 end if`.
/// @param team Team identifier used by the game rules.
function teamCount(level,ignore,team)
  count = 0; limit = botClients.clientLimit(level)
  for slot = 0 to limit-1
    client = level.clients[slot]
    if slot != ignore and client.connected != 0 and client.team == team then count = count+1 end if
  end for
  return count
end function

/// Apply `mq3.game.bot_population.teamCount` while evaluating `pickTeam`. Return paths include `c.TEAM_BLUE`.
/// @param level Game-level state; accesses `teamScores`.
/// @param ignore Value used by `teamCount` in `if slot != ignore and client.connected != 0 and client.team == team then count = count+1 end if`.
function pickTeam(level,ignore)
  blue = teamCount(level,ignore,c.TEAM_BLUE); red = teamCount(level,ignore,c.TEAM_RED)
  if blue > red then return c.TEAM_RED end if
  if red > blue then return c.TEAM_BLUE end if
  if level.teamScores[c.TEAM_BLUE] > level.teamScores[c.TEAM_RED] then return c.TEAM_RED end if
  return c.TEAM_BLUE
end function

/// Record or dispatch `"^1Error: bot has no aifile specified\n"` and `"^1Unable to add bot. All player slots are in use.\n"` actions in `addBot`. Return paths include `clientNum`.
/// @param level Game-level state; accesses `maxclients`, `spawner` and `entities`.
/// @param state Bot population state; accesses `registry`, `allocateClientFn`, `setUserinfoFn`, `connectClientFn` and `clients`.
/// @param name Name used to identify the requested entry.
/// @param skill Bot skill value used to select or interpolate characteristics.
/// @param team Team identifier used by the game rules.
/// @param delay Value passed as argument 2 to `mq3.compat.numeric.add32`.
/// @param altname Value used by `addBot` in `if altname != void and altname != "" then botname = altname end if`.
function addBot(level,state,name,skill,team,delay,altname)
  botinfo = botRegistry.getBotInfoByName(state.registry,name)
  if botinfo == void then output(level,state,"^1Error: Bot '"+name+"' not defined\n"); return -1 end if
  botname = infoStrings.value(botinfo,"funname")
  if botname == "" then botname = infoStrings.value(botinfo,"name") end if
  if altname != void and altname != "" then botname = altname end if
  userinfo = ""; userinfo = infoSet(level,state,userinfo,"name",botname)
  userinfo = infoSet(level,state,userinfo,"rate","25000"); userinfo = infoSet(level,state,userinfo,"snaps","20")
  if skill >= 1.0 and skill < 2.0 then userinfo = infoSet(level,state,userinfo,"handicap","50")
  else if skill >= 2.0 and skill < 3.0 then userinfo = infoSet(level,state,userinfo,"handicap","70")
  else if skill >= 3.0 and skill < 4.0 then userinfo = infoSet(level,state,userinfo,"handicap","90") end if
  model = infoStrings.value(botinfo,"model"); if model == "" then model = "visor/default" end if
  userinfo = infoSet(level,state,userinfo,"model",model); userinfo = infoSet(level,state,userinfo,"team_model",model)
  head = infoStrings.value(botinfo,"headmodel"); if head == "" then head = model end if
  userinfo = infoSet(level,state,userinfo,"headmodel",head); userinfo = infoSet(level,state,userinfo,"team_headmodel",head)
  value = infoStrings.value(botinfo,"gender"); if value == "" then value = "male" end if
  userinfo = infoSet(level,state,userinfo,"sex",value)
  value = infoStrings.value(botinfo,"color1"); if value == "" then value = "4" end if
  userinfo = infoSet(level,state,userinfo,"color1",value)
  value = infoStrings.value(botinfo,"color2"); if value == "" then value = "5" end if
  userinfo = infoSet(level,state,userinfo,"color2",value)
  aifile = infoStrings.value(botinfo,"aifile")
  if aifile == "" then output(level,state,"^1Error: bot has no aifile specified\n"); return -1 end if
  if state.allocateClientFn == void then return error(494,"AddBot requires BotAllocateClient") end if
  clientNum = state.allocateClientFn(level)
  if clientNum == -1 then
    output(level,state,"^1Unable to add bot.  All player slots are in use.\n")
    output(level,state,"^1Start server with more 'open' slots (or check setting of sv_maxclients cvar).\n"); return -1
  end if
  if clientNum < 0 or clientNum >= level.maxclients then return error(494,"Bot allocator returned invalid client") end if
  if team == void or team == "" then
    if level.spawner.gametype >= GT_TEAM then
      if pickTeam(level,clientNum) == c.TEAM_RED then team = "red" else team = "blue" end if
    else team = "red" end if
  end if
  userinfo = infoSet(level,state,userinfo,"characterfile",aifile)
  userinfo = infoSet(level,state,userinfo,"skill",textnum.fixed2(skill)); userinfo = infoSet(level,state,userinfo,"team",team)
  bot = level.entities[clientNum]; bot.r.svFlags = bot.r.svFlags | SVF_BOT; bot.inuse = true
  if state.setUserinfoFn == void then return error(494,"AddBot requires SetUserinfo") end if
  state.setUserinfoFn(level,clientNum,userinfo)
  if state.connectClientFn == void then return error(494,"AddBot requires ClientConnect") end if
  if state.connectClientFn(level,clientNum,true,true) != void then return clientNum end if
  if delay == 0 then
    if state.clients.clientBeginFn == void then return error(494,"AddBot requires ClientBegin") end if
    state.clients.clientBeginFn(level,clientNum)
  else botClients.addBotToSpawnQueue(level,state.clients,clientNum,delay) end if
  return clientNum
end function

/// Use `state.serverCommandFn` to perform `serviceAddBot`.
/// @param level Game-level state; accesses `time` and `startTime`.
/// @param state Bot population state; accesses `botEnable`, `clRunning` and `serverCommandFn`.
/// @param args Three-component array; components 0, 1 and 2 are used in their stored order.
function serviceAddBot(level,state,args)
  if not state.botEnable then return false end if
  name = ""; if len(args) > 0 then name = args[0] end if
  if name == "" then output(level,state,"Usage: Addbot <botname> [skill 1-5] [team] [msec delay] [altname]\n"); return false end if
  skill = 4.0; if len(args) > 1 and args[1] != "" then skill = textnum.atof32(args[1]) end if
  team = ""; if len(args) > 2 then team = args[2] end if
  delay = 0; if len(args) > 3 and args[3] != "" then delay = textnum.atoi(args[3]) end if
  altname = ""; if len(args) > 4 then altname = args[4] end if
  addBot(level,state,name,skill,team,delay,altname)
  if level.time-level.startTime > 1000 and state.clRunning then
    if state.serverCommandFn == void then return error(494,"AddBot deferred media requires server command") end if
    state.serverCommandFn(level,-1,"loaddefered\n")
  end if
  return true
end function

/// Right-pad a bot-list field to the requested width and append one separating space.
/// @param text Text to parse, format or deliver.
/// @param width Operand used to evaluate the returned expression `text+decode(bytes(width-len(data),32))+" "`.
function padded(text,width)
  data = bytes(text); if len(data) >= width then return text+" " end if
  return text+decode(bytes(width-len(data),32))+" "
end function

/// Apply `mq3.game.bot_population.output`, `mq3.shared.info.value` and `mq3.game.bot_population.padded` while evaluating `botList`.
/// @param level Value passed as argument 1 to `state.printFn`.
/// @param state Bot population state; accesses `registry`.
function botList(level,state)
  output(level,state,"^1name             model            aifile              funname\n")
  for each row in state.registry.botInfos
    name = infoStrings.value(row,"name"); if name == "" then name = "UnnamedPlayer" end if
    funname = infoStrings.value(row,"funname")
    model = infoStrings.value(row,"model"); if model == "" then model = "visor/default" end if
    aifile = infoStrings.value(row,"aifile"); if aifile == "" then aifile = "bots/default_c.c" end if
    output(level,state,padded(name,16)+padded(model,16)+padded(aifile,20)+padded(funname,20)+"\n")
  end for
  return void
end function

/// Set `state.spSkill` to `skill` in `mq3.game.bot_population.spawnBots`. Return paths include `delay`.
/// @param level Value passed as argument 1 to `state.consoleFn`.
/// @param state Bot population state; accesses `spSkill` and `cvarSetFn`. May update `state.spSkill` in place.
/// @param botList Text to parse, format or deliver.
/// @param baseDelay Value used by `spawnBots` in `delay = baseDelay`.
function spawnBots(level,state,botList,baseDelay)
  skill = state.spSkill
  if skill < 1.0 then skill = 1.0; state.spSkill = skill; if state.cvarSetFn != void then state.cvarSetFn(level,"g_spSkill","1") end if
  else if skill > 5.0 then skill = 5.0; state.spSkill = skill; if state.cvarSetFn != void then state.cvarSetFn(level,"g_spSkill","5") end if end if
  data = bytes(infoStrings.copy(botList,1024)); index = 0; delay = baseDelay
  while index < len(data)
    while index < len(data) and data[index] == 32 index = index+1 end while
    if index >= len(data) then break end if
    start = index; while index < len(data) and data[index] != 32 index = index+1 end while
    name = decode(slice(data,start,index-start))
    console(level,state,"addbot "+name+" "+textnum.fixed6(skill)+" free "+str(delay)+"\n")
    delay = delay+BOT_BEGIN_DELAY_INCREMENT
  end while
  return delay
end function

/// Use `state.cvarSetFn` to perform `initSinglePlayer`.
/// @param level Game-level state; accesses `spawner`.
/// @param state Bot population state; accesses `registry` and `cvarSetFn`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
/// @param mapname Value passed as argument 2 to `std.string.equalsIgnoreCaseAscii`.
function initSinglePlayer(level,state,restart,mapname)
  if level.spawner.gametype != GT_SINGLE_PLAYER then return false end if
  arena = botRegistry.getArenaInfoByMap(state.registry,mapname); if arena == void then return false end if
  frag = textnum.atoi(infoStrings.value(arena,"fraglimit")); time = textnum.atoi(infoStrings.value(arena,"timelimit"))
  fragText = "0"; if frag != 0 then fragText = infoStrings.value(arena,"fraglimit") end if
  timeText = "0"; if time != 0 then timeText = infoStrings.value(arena,"timelimit") end if
  if frag == 0 and time == 0 then fragText = "10" end if
  if state.cvarSetFn == void then return error(494,"Single-player bot init requires Cvar_Set") end if
  state.cvarSetFn(level,"fraglimit",fragText); state.cvarSetFn(level,"timelimit",timeText)
  delay = BOT_BEGIN_DELAY_BASE
  if strings.equalsIgnoreCaseAscii(infoStrings.value(arena,"special"),"training") then delay = delay+10000 end if
  if not restart then spawnBots(level,state,infoStrings.value(arena,"bots"),delay) end if
  return true
end function
