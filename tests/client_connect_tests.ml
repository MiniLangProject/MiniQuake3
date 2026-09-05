// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.client_connect as clientConnect
import mq3.game.session as sessions
import mq3.game.client_info as clientInfo
import mq3.game.votes as votes
import mq3.game.cvars as gameCvars
import mq3.game.entities as game
import mq3.game.playerstate as ps
import mq3.game.spawn as spawn
import mq3.qcommon.cvar as cv
import mq3.collision.world as cm
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.fs as fs
struct Reader
  data
  offset
end struct
struct Check
  expected
  offset
  words
  events
  actions
  userinfos
  filterResult
  botResult
end struct
function readInt(reader)
  if reader.offset+4 > len(reader.data) then return error(499,"Incomplete connect input") end if
  value = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return value
end function
function readString(reader)
  size = readInt(reader)
  if size < 0 or reader.offset+size > len(reader.data) then return error(499,"Invalid connect test string") end if
  value = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return value
end function
function word(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected connect output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"Connect mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
  check.offset = check.offset+4; check.words = check.words+1; return void
end function
function words(check,values)
  for each value in values
    word(check,value)
  end for
  return void
end function
function boolWord(check,value)
  if value then return word(check,1) end if
  return word(check,0)
end function
function textWord(check,value)
  if value == void then return word(check,-1) end if
  data = bytes(value); word(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Userinfo string mismatch at byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function floatWords(check,values)
  for each value in values
    word(check,n.floatBits(value))
  end for
  return void
end function
function seedConnectClient(level,slot)
  client = level.clients[slot]; data = bytes(468,0)
  for index = 0 to 116
    value = 100+slot+index
    for b = 0 to 3
      data[index*4+b] = (value >> (b*8)) & 255
    end for
  end for
  client.ps = ps.load(data,0)
  client.team = 17
  client.cmdAngles = [1,2,3]
  client.noclip = true
  client.damage_armor = 17
  client.damage_blood = 17
  client.damage_knockback = 17
  client.damage_from = [1.5,2.5,3.5]
  client.damage_fromWorld = true
  client.lasthurt_client = 17
  client.lasthurt_mod = 17
  client.lasthurtcarrier = 13.5
  client.accuracy_hits = 17
  client.hook = level.entities[100]
  client.connected = 17
  client.spectatorState = 17
  client.spectatorClient = 17
  client.spectatorTime = 17
  client.enterTime = 17
  client.accuracy_shots = 17
  client.readyToExit = true
  client.lastkilled_client = 17
  client.respawnTime = 17
  client.rewardTime = 17
  client.lastKillTime = 17
  client.cmdWeapon = 17
  client.lastfraggedcarrier = 13.5
  client.fragcarrier = 17
  client.carrierdefense = 17
  client.basedefense = 17
  client.predictItemPickup = true
  client.captures = 17
  client.flagrecovery = 17
  client.assists = 17
  client.lastreturnedflag = 13.5
  client.flagsince = 13.5
  client.localClient = true
  client.initialSpawn = true
  client.pmoveFixed = true
  client.maxHealth = 17
  client.teamStateState = 17
  client.teamStateLocation = 17
  client.voteCount = 17
  client.teamVoteCount = 17
  client.teamInfo = true
  client.wins = 17
  client.losses = 17
  client.teamLeader = 17
  client.cmdServerTime = 17
  client.cmdButtons = 17
  client.cmdForwardmove = 17
  client.cmdRightmove = 17
  client.cmdUpmove = 17
  client.lastCmdTime = 17
  client.buttons = 17
  client.oldbuttons = 17
  client.latched_buttons = 17
  client.oldOrigin = [1.5,2.5,3.5]
  client.accurateCount = 17
  client.inactivityTime = 17
  client.inactivityWarning = true
  client.airOutTime = 17
  client.fireHeld = true
  client.switchTeamTime = 17
  client.timeResidual = 17
  return void
end function
function connectClientSnapshot(check,client)
  words(check,ps.words(client.ps))
  word(check,client.team)
  words(check,client.cmdAngles)
  boolWord(check,client.noclip)
  word(check,client.damage_armor)
  word(check,client.damage_blood)
  word(check,client.damage_knockback)
  floatWords(check,client.damage_from)
  boolWord(check,client.damage_fromWorld)
  word(check,client.lasthurt_client)
  word(check,client.lasthurt_mod)
  word(check,n.floatBits(client.lasthurtcarrier))
  word(check,client.accuracy_hits)
  boolWord(check,client.hook != void)
  word(check,client.connected)
  word(check,client.spectatorState)
  word(check,client.spectatorClient)
  word(check,client.spectatorTime)
  word(check,client.enterTime)
  word(check,client.accuracy_shots)
  textWord(check,client.netname)
  boolWord(check,client.readyToExit)
  word(check,client.lastkilled_client)
  word(check,client.respawnTime)
  word(check,client.rewardTime)
  word(check,client.lastKillTime)
  word(check,client.cmdWeapon)
  word(check,n.floatBits(client.lastfraggedcarrier))
  word(check,client.fragcarrier)
  word(check,client.carrierdefense)
  word(check,client.basedefense)
  boolWord(check,client.predictItemPickup)
  word(check,client.captures)
  word(check,client.flagrecovery)
  word(check,client.assists)
  word(check,n.floatBits(client.lastreturnedflag))
  word(check,n.floatBits(client.flagsince))
  boolWord(check,client.localClient)
  boolWord(check,client.initialSpawn)
  boolWord(check,client.pmoveFixed)
  word(check,client.maxHealth)
  word(check,client.teamStateState)
  word(check,client.teamStateLocation)
  word(check,client.voteCount)
  word(check,client.teamVoteCount)
  boolWord(check,client.teamInfo)
  word(check,client.wins)
  word(check,client.losses)
  word(check,clientInfo.leaderValue(client))
  word(check,client.cmdServerTime)
  word(check,client.cmdButtons)
  word(check,client.cmdForwardmove)
  word(check,client.cmdRightmove)
  word(check,client.cmdUpmove)
  word(check,client.lastCmdTime)
  word(check,client.buttons)
  word(check,client.oldbuttons)
  word(check,client.latched_buttons)
  floatWords(check,client.oldOrigin)
  word(check,client.accurateCount)
  word(check,client.inactivityTime)
  boolWord(check,client.inactivityWarning)
  word(check,client.airOutTime)
  boolWord(check,client.fireHeld)
  word(check,client.switchTeamTime)
  word(check,client.timeResidual)
  return void
end function
function connectSnapshot(level)
  check = level.context
  words(check,[210,level.time,level.spawner.gametype,level.maxclients]); boolWord(check,level.newSession)
  words(check,[level.teamAutoJoin,level.maxGameClients,level.follow1,level.follow2,level.numConnectedClients,level.numNonSpectatorClients,level.numPlayingClients,level.numVotingClients])
  words(check,level.numteamVotingClients); words(check,level.sortedClients); boolWord(check,level.spawner.spawning)
  words(check,[len(level.spawner.vars),level.intermissiontime,level.intermissionQueued]); words(check,level.teamScores)
  for index = 0 to 63
    ent = level.entities[index]; client = level.clients[index]
    boolWord(check,ent.client == client); boolWord(check,ent.inuse); word(check,ent.r.svFlags)
    connectClientSnapshot(check,client); textWord(check,level.spawner.configstrings[544+index])
    textWord(check,cv.find(level.spawner.cvars,"session"+str(index)).string)
  end for
  textWord(check,cv.find(level.spawner.cvars,"session").string)
  textWord(check,level.spawner.configstrings[6]); textWord(check,level.spawner.configstrings[7]); return void
end function
function connectRecord(level,kind,arg,key,text)
  connectSnapshot(level); words(level.context,[211,kind,arg]); textWord(level.context,key); textWord(level.context,text)
  level.context.events = level.context.events+1; return void
end function
function connectReadCvar(level,key,size)
  connectRecord(level,1,size,key,""); return sessions.cvarText(level,key)
end function
function connectSetCvar(level,key,text)
  connectRecord(level,2,-1,key,text); cv.set2(level.spawner.cvars,key,text,true); return void
end function
function connectReadUserinfo(level,slot)
  connectRecord(level,3,slot,"",""); return level.context.userinfos[slot]
end function
function connectFilter(level,ip)
  connectRecord(level,4,-1,"",ip); return level.context.filterResult
end function
function connectBot(level,slot,restart)
  text = "0"; if restart then text = "1" end if
  connectRecord(level,5,slot,"",text); return level.context.botResult
end function
function connectLog(level,text)
  return connectRecord(level,6,-1,"",text)
end function
function connectServer(level,slot,text)
  return connectRecord(level,7,slot,"",text)
end function
function connectConfig(state,kind,index,key,text)
  if kind != 1 then return error(499,"Unexpected connect config effect") end if
  return connectRecord(state.level,8,index,key,text)
end function
function connectPrint(level,text)
  return connectRecord(level,9,-1,"",text)
end function
function connectCallbacks(level,check)
  level.context = check; level.cvarStringFn = connectReadCvar; level.cvarSetFn = connectSetCvar
  level.userinfoFn = connectReadUserinfo; level.filterPacketFn = connectFilter; level.botConnectFn = connectBot
  level.gameLogFn = connectLog; level.serverCommandFn = connectServer; level.gamePrintFn = connectPrint
  level.spawner.effectFn = connectConfig; return void
end function
function configureConnect(world,reader,check)
  level = game.create(world); state = spawn.create(level,"")
  level.maxclients = readInt(reader); level.maxclientsCvar = level.maxclients; state.gametype = readInt(reader); level.time = readInt(reader)
  level.startTime = 1000; level.teamScores[1] = readInt(reader); level.teamScores[2] = readInt(reader)
  level.newSession = readInt(reader) != 0; level.teamAutoJoin = readInt(reader); level.maxGameClients = readInt(reader)
  level.numNonSpectatorClients = readInt(reader); level.intermissiontime = readInt(reader)
  check.filterResult = readInt(reader) != 0; check.botResult = readInt(reader) != 0
  level.cvarMaintenance.password = readString(reader); cv.set2(state.cvars,"session",readString(reader),true)
  state.spawning = true; state.vars = [[],[],[]]
  for index = 0 to 63
    seedConnectClient(level,index); client = level.clients[index]; ent = level.entities[index]
    if readInt(reader) != 0 then game.bindClient(level,ent,client) end if
    ent.inuse = readInt(reader) != 0; ent.r.svFlags = readInt(reader); client.connected = readInt(reader); client.team = readInt(reader)
    client.spectatorState = readInt(reader); client.spectatorClient = readInt(reader); client.spectatorTime = readInt(reader)
    client.wins = readInt(reader); client.losses = readInt(reader); client.teamLeader = readInt(reader)
    client.netname = readString(reader); check.userinfos = check.userinfos+[readString(reader)]
    cv.set2(state.cvars,"session"+str(index),readString(reader),true); state.configstrings[544+index] = "before-player-"+str(index)
  end for
  connectCallbacks(level,check); return level
end function
function resetConnectLevel(level,maxclients)
  registry = level.spawner.cvars; type = level.spawner.gametype; check = level.context
  fresh = game.create(level.scene.world); state = spawn.create(fresh,""); state.cvars = registry; state.gametype = type
  fresh.maxclients = maxclients; fresh.maxclientsCvar = maxclients; fresh.time = 1000; fresh.startTime = 1000
  fresh.teamAutoJoin = level.teamAutoJoin; fresh.maxGameClients = level.maxGameClients; fresh.cvarMaintenance = level.cvarMaintenance
  connectCallbacks(fresh,check); return fresh
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args)>3 and args[3]=="--contracts" then return connectContracts(world) end if
  reader = Reader(fs.readAllBytes(args[1]),0); check = Check(fs.readAllBytes(args[2]),0,0,0,0,[],false,true)
  level = configureConnect(world,reader,check); count = readInt(reader)
  for index = 1 to count
    kind = readInt(reader); level.time = readInt(reader); slot = readInt(reader); p0 = readInt(reader); p1 = readInt(reader)
    first = readString(reader); second = readString(reader)
    switch kind
      case 1
        check.userinfos[slot] = first; result = clientConnect.connect(level,slot,p0 != 0,p1 != 0)
        word(check,212); textWord(check,result)
      end case
      case 2
        sessions.initClient(level,level.clients[slot],first)
      end case
      case 3
        cv.set2(level.spawner.cvars,"session"+str(slot),first,true); sessions.readClient(level,level.clients[slot])
      end case
      case 4
        sessions.writeClient(level,level.clients[slot])
      end case
      case 5
        cv.set2(level.spawner.cvars,"session",first,true); level.spawner.gametype = p0; sessions.initWorld(level)
      end case
      case 6
        sessions.writeWorld(level)
      end case
      case 7
        sessions.broadcastTeamChange(level,level.clients[slot],p0)
      end case
      case 8
        level.clients[slot].connected = p0; level.clients[slot].team = p1
      end case
      case 9
        level = resetConnectLevel(level,p0)
      end case
      case 10
        level.teamAutoJoin = p0; level.maxGameClients = p1; level.spawner.gametype = textnum.atoi(first)
      end case
      case 11
        level.cvarMaintenance.password = first
      end case
      case 12
        check.filterResult = p0 != 0; check.botResult = p1 != 0
      end case
      case 13
        clientInfo.changed(level,slot)
      end case
      case 14
        votes.setLeader(level,p0,slot)
      end case
      case default
        return error(499,"Invalid connect action")
      end case
    end switch
    connectSnapshot(level); check.actions = check.actions+1
  end for
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete connect stream") end if
  print "PASS: "+str(check.actions)+" connect actions / "+str(check.words)+" exact words / "+str(check.events)+" ordered effects"; return 0
end function
function requireConnect(condition,label)
  if not condition then return error(499,"Failed connect contract: "+label) end if
  return void
end function
function contractConnectInfo(level,slot)
  return "\\name\\Ranger\\ip\\localhost\\handicap\\50"
end function
function contractConnectFilter(level,text)
  return false
end function
function contractConnectLog(level,text)
  return void
end function
function contractConnectServer(level,slot,text)
  return void
end function
function connectContracts(world)
  level = game.create(world); client = level.clients[0]; count = 0
  requireConnect(try(clientConnect.connect(level,-1,true,false)) is error,"negative slot"); count = count+1
  requireConnect(try(clientConnect.connect(level,64,true,false)) is error,"upper slot"); count = count+1
  requireConnect(try(clientConnect.connect(level,0,true,false)) is error,"userinfo delivery"); count = count+1
  level.userinfoFn = contractConnectInfo
  requireConnect(try(clientConnect.connect(level,0,true,false)) is error,"IP filter decision"); count = count+1
  requireConnect(try(sessions.sessionSlot(level,void)) is error,"NULL client"); count = count+1
  requireConnect(try(sessions.sessionSlot(level,game.createClient(ps.create(),0,[0,0,0]))) is error,"foreign client"); count = count+1
  requireConnect(try(sessions.cvarText(level,"session")) is error,"Cvar storage"); count = count+1
  spawn.create(level,"")
  requireConnect(try(sessions.writeClient(level,client)) is error,"Cvar set delivery"); count = count+1
  for each text in ["","0 1","1 2 3 4 5 6","1 nope 3 4 5 6 0","1 2 3 4 5 6 nope","1 2 3 4 5 6 0x"]
    cv.set2(level.spawner.cvars,"session0",text,true); client.wins = 919
    requireConnect(try(sessions.readClient(level,client)) is error and client.wins == 919,"partial scanf rejection preserves session"); count = count+1
  end for
  cv.set2(level.spawner.cvars,"session0",decode(bytes([49,0,50])),true)
  requireConnect(try(sessions.readClient(level,client)) is error,"embedded NUL session"); count = count+1
  level.maxclients = 65
  requireConnect(try(sessions.writeWorld(level)) is error,"world client limit"); count = count+1
  level.maxclients = 4; level.spawner.gametype = 3
  requireConnect(try(sessions.initWorld(level)) is error and level.newSession,"reset print delivery"); count = count+1
  level.spawner.gametype = 0; sessions.initWorld(level)
  requireConnect(level.newSession,"matching gametype retains newSession"); count = count+1
  seedConnectClient(level,0); held = level.clients[0]; game.bindClient(level,level.entities[0],held); game.resetClient(held)
  requireConnect(held == level.clients[0] and held == level.entities[0].client and held.ps.stats[0] == 0 and held.cmdAngles[0] == 0,"reset preserves persistent binding"); count = count+1
  gameCvars.attach(level,"Sep  5 2026"); gameCvars.register(level)
  cv.set2(level.spawner.cvars,"g_teamAutoJoin","1",true); cv.set2(level.spawner.cvars,"g_maxGameClients","2",true); gameCvars.update(level)
  requireConnect(level.teamAutoJoin == 1 and level.maxGameClients == 2,"registered Cvars refresh session decisions"); count = count+1
  level.filterPacketFn = contractConnectFilter; level.newSession = false
  requireConnect(try(clientConnect.connect(level,0,true,true)) is error,"bot setup delivery"); count = count+1
  requireConnect(try(clientConnect.connect(level,0,true,false)) is error,"connect log delivery"); count = count+1
  level.gameLogFn = contractConnectLog
  requireConnect(try(clientConnect.connect(level,0,true,false)) is error,"connect announcement delivery"); count = count+1
  level.serverCommandFn = contractConnectServer
  requireConnect(clientConnect.connect(level,0,true,false) == void and level.clients[0].connected == 1,"real registry default read after session write"); count = count+1
  cv.set2(level.spawner.cvars,"g_teamAutoJoin","0",true); cv.set2(level.spawner.cvars,"g_maxGameClients","1",true); gameCvars.update(level)
  level.numNonSpectatorClients = 1; sessions.initClient(level,level.clients[1],"")
  requireConnect(level.clients[1].team == 3 and sessions.cvarText(level,"session1") != "","maxGameClients affects default persisted session"); count = count+1
  print "PASS: "+str(count)+" connect runtime contracts"; return 0
end function
