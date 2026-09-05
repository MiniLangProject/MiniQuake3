// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.client_info as clientInfo
import mq3.shared.info as infoStrings
import mq3.game.vote_commands as voteCommands
import mq3.game.votes as votes
import mq3.game.team_status as teamStatus
import mq3.game.client_spawn as clientSpawn
import mq3.game.entities as game
import mq3.game.playerstate as ps
import mq3.game.spawn as spawn
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
end struct
function readInt(reader)
  if reader.offset+4 > len(reader.data) then return error(499,"Incomplete userinfo input") end if
  value = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return value
end function
function readString(reader)
  size = readInt(reader)
  if size < 0 or reader.offset+size > len(reader.data) then return error(499,"Invalid userinfo test string") end if
  value = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return value
end function
function word(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected userinfo output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"Userinfo mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
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
  data = bytes(value); word(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Userinfo string mismatch at byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function infoSnapshot(level)
  check = level.context
  words(check,[200,level.time,level.spawner.gametype,level.maxclients,level.teamScores[1],level.teamScores[2],level.lastTeamLocationTime])
  for index = 0 to 1
    words(check,[level.teamVoteTime[index],level.teamVoteYes[index],level.teamVoteNo[index],level.numteamVotingClients[index]])
    textWord(check,level.teamVoteString[index])
  end for
  for index = 0 to 63
    ent = level.entities[index]; client = level.clients[index]
    boolWord(check,ent.client != void); boolWord(check,ent.inuse); word(check,ent.r.svFlags); words(check,ps.words(client.ps))
    words(check,[client.connected,client.team,client.spectatorState]); boolWord(check,client.localClient); boolWord(check,client.predictItemPickup)
    word(check,client.maxHealth); boolWord(check,client.teamInfo); words(check,[client.wins,client.losses]); boolWord(check,client.teamLeader)
    boolWord(check,client.pmoveFixed); words(check,[client.voteCount,client.teamVoteCount,client.teamStateLocation,ent.s.powerups])
    textWord(check,client.netname); textWord(check,level.spawner.configstrings[544+index])
  end for
  for index = 8 to 19
    textWord(check,level.spawner.configstrings[index])
  end for
  return void
end function
function recordInfoEvent(level,kind,arg,text)
  infoSnapshot(level); words(level.context,[201,kind,arg]); textWord(level.context,text)
  level.context.events = level.context.events+1; return void
end function
function readUserinfo(level,slot)
  recordInfoEvent(level,1,slot,""); return level.context.userinfos[slot]
end function
function recordServer(level,slot,text)
  return recordInfoEvent(level,2,slot,text)
end function
function recordLog(level,text)
  return recordInfoEvent(level,3,-1,text)
end function
function recordInfoConfig(state,kind,index,key,value)
  if kind != 1 or key != "" then return error(499,"Unexpected userinfo config effect") end if
  return recordInfoEvent(state.level,4,index,value)
end function
function recordConsole(level,when,text)
  return recordInfoEvent(level,5,when,text)
end function
function configure(world,reader,check)
  level = game.create(world); state = spawn.create(level,""); level.context = check
  state.effectFn = recordInfoConfig; level.userinfoFn = readUserinfo; level.serverCommandFn = recordServer
  level.gameLogFn = recordLog; level.consoleCommandFn = recordConsole
  level.maxclients = readInt(reader); level.maxclientsCvar = level.maxclients; state.gametype = readInt(reader); level.time = readInt(reader)
  level.teamScores[1] = readInt(reader); level.teamScores[2] = readInt(reader); level.lastTeamLocationTime = readInt(reader)
  level.allowVote = 1; level.numteamVotingClients = [2,2]
  for index = 0 to 63
    ent = level.entities[index]; client = level.clients[index]
    if readInt(reader) != 0 then game.bindClient(level,ent,client) end if
    ent.inuse = readInt(reader) != 0; ent.r.svFlags = readInt(reader); client.connected = readInt(reader); client.team = readInt(reader)
    client.spectatorState = readInt(reader); client.localClient = readInt(reader) != 0; client.predictItemPickup = readInt(reader) != 0
    client.maxHealth = readInt(reader); client.teamInfo = readInt(reader) != 0; client.wins = readInt(reader); client.losses = readInt(reader)
    client.teamLeader = readInt(reader) != 0; client.pmoveFixed = readInt(reader) != 0
    client.voteCount = readInt(reader); client.teamVoteCount = readInt(reader)
    client.ps = ps.load(reader.data,reader.offset); reader.offset = reader.offset+468
    client.teamStateLocation = 70+index; ent.s.powerups = index % 4
    client.netname = readString(reader); check.userinfos = check.userinfos+[readString(reader)]
    state.configstrings[544+index] = "before-player-"+str(index)
  end for
  for index = 8 to 19
    state.configstrings[index] = "before-"+str(index)
  end for
  return level
end function
function requireInfo(condition,label)
  if not condition then return error(499,"Failed userinfo contract: "+label) end if
  return void
end function
function contractInfo(level,slot)
  return "\\name\\Player\\handicap\\50"
end function
function noopInfoLog(level,text)
  return void
end function
function noopInfoServer(level,slot,text)
  return void
end function
function infoContracts(world)
  level = game.create(world)
  requireInfo(try(clientInfo.changed(level,-1)) is error,"negative slot")
  requireInfo(try(clientInfo.changed(level,64)) is error,"slot beyond storage")
  requireInfo(try(clientInfo.changed(level,0)) is error,"missing client binding")
  game.bindClient(level,level.entities[0],level.clients[0])
  requireInfo(try(clientInfo.changed(level,0)) is error,"userinfo delivery")
  level.userinfoFn = contractInfo
  requireInfo(try(clientInfo.changed(level,0)) is error,"spawn state")
  spawn.create(level,"")
  requireInfo(try(clientInfo.changed(level,0)) is error,"game-log delivery")
  level.gameLogFn = noopInfoLog; level.clients[0].connected = 2; level.clients[0].netname = "Old"
  requireInfo(try(clientInfo.changed(level,0)) is error,"rename delivery")
  level.maxclients = 65; requireInfo(try(clientInfo.teamLeader(level,1)) is error,"team leader client limit")
  requireInfo(try(clientInfo.pickTeam(level,-1)) is error,"pick team client limit")
  requireInfo(try(clientInfo.cleanName("",1)) is error,"fallback capacity")
  requireInfo(try(infoStrings.value(decode(bytes(8192,97)),"x")) is error,"BIG_INFO_STRING bound")
  requireInfo(try(infoStrings.copy("x",0)) is error,"copy capacity")
  requireInfo(try(infoStrings.valid(void)) is error,"NULL validation string")
  requireInfo(try(infoStrings.value("x",decode(bytes([97,0,98])))) is error,"NUL key")
  requireInfo(try(clientInfo.cleanName(decode(bytes([97,0,98])),36)) is error,"NUL name")
  requireInfo(infoStrings.value(void,"x") == "" and infoStrings.value("x",void) == "","NULL lookup returns empty")
  requireInfo(clientSpawn.infoValue("\\HaNdIcAp\\25\\handicap\\90","HANDICAP") == "25","spawn shares native lookup")
  level.maxclients = 4; level.serverCommandFn = noopInfoServer; level.clients[0].team = 1
  votes.setLeader(level,1,0)
  requireInfo(level.clients[0].teamLeader and level.spawner.configstrings[544] != "","vote defaults to actual userinfo")
  print "PASS: 18 userinfo runtime contracts"; return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args)>3 and args[3]=="--contracts" then return infoContracts(world) end if
  reader = Reader(fs.readAllBytes(args[1]),0); check = Check(fs.readAllBytes(args[2]),0,0,0,0,[])
  level = configure(world,reader,check); count = readInt(reader)
  for index = 1 to count
    kind = readInt(reader); level.time = readInt(reader); slot = readInt(reader); param = readInt(reader)
    first = readString(reader); second = readString(reader)
    if kind >= 2 and kind <= 6 then words(check,[202,kind]) end if
    switch kind
      case 1
        check.userinfos[slot] = first; clientInfo.changed(level,slot)
      end case
      case 2
        textWord(check,clientInfo.cleanName(first,param))
      end case
      case 3
        if (param & 1) != 0 then first = void end if
        if (param & 2) != 0 then second = void end if
        textWord(check,infoStrings.value(first,second))
      end case
      case 4
        boolWord(check,infoStrings.valid(first))
      end case
      case 5
        word(check,clientInfo.pickTeam(level,param))
      end case
      case 6
        word(check,clientInfo.teamLeader(level,param))
      end case
      case 7
        votes.setLeader(level,param,slot)
      end case
      case 8
        voteCommands.callTeamVote(level,level.entities[slot],["callteamvote",first,second])
      end case
      case 9
        voteCommands.castTeamVote(level,level.entities[slot],["teamvote",first])
      end case
      case 10
        votes.checkTeam(level,param)
      end case
      case 11
        level.clients[slot].connected = param; level.clients[slot].team = textnum.atoi(first)
      end case
      case 12
        teamStatus.check(level)
      end case
      case default
        return error(499,"Invalid userinfo test action")
      end case
    end switch
    if kind < 2 or kind > 6 then infoSnapshot(level) end if
    check.actions = check.actions+1
  end for
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete userinfo stream") end if
  print "PASS: "+str(check.actions)+" userinfo actions / "+str(check.words)+" exact words / "+str(check.events)+" ordered effects"; return 0
end function
