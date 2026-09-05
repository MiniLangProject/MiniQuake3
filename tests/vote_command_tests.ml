// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.vote_commands as voteCommands
import mq3.game.votes as votes
import mq3.game.cvars as cvars
import mq3.qcommon.cvar as cv
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.collision.world as cm
import mq3.compat.numeric as n
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
end struct
function readInt(reader)
  if reader.offset < 0 or reader.offset+4 > len(reader.data) then return error(499,"Vote-command input offset "+str(reader.offset)+" / "+str(len(reader.data))) end if
  value = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return value
end function
function readString(reader)
  size = readInt(reader)
  if size < 0 or reader.offset+size > len(reader.data) then return error(499,"Vote-command input string at "+str(reader.offset)+" length "+str(size)) end if
  value = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return value
end function
function word(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected vote-command output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"Vote-command mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
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
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Vote-command string mismatch at byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function commandSnapshot(level)
  check = level.context
  words(check,[180,level.time,level.allowVote,level.maxclients,level.voteTime,level.voteExecuteTime,level.voteYes,level.voteNo,level.numVotingClients])
  for index = 0 to 1
    words(check,[level.teamVoteTime[index],level.teamVoteYes[index],level.teamVoteNo[index],level.numteamVotingClients[index]])
  end for
  textWord(check,level.voteString); textWord(check,level.voteDisplayString)
  textWord(check,level.teamVoteString[0]); textWord(check,level.teamVoteString[1])
  for index = 0 to 63
    client = level.clients[index]; boolWord(check,level.entities[index].inuse)
    words(check,[client.connected,client.team]); boolWord(check,client.teamLeader)
    words(check,[client.ps.eFlags,client.voteCount,client.teamVoteCount,client.ps.clientNum]); textWord(check,client.netname)
  end for
  for index = 8 to 19
    textWord(check,level.spawner.configstrings[index])
  end for
  return void
end function
function recordCommandBoundary(level,kind,arg)
  commandSnapshot(level)
  words(level.context,[150,kind,arg,level.voteTime,level.voteExecuteTime,level.teamVoteTime[0],level.teamVoteTime[1]])
  level.context.events = level.context.events+1; return void
end function
function recordServer(level,slot,text)
  recordCommandBoundary(level,1,slot); textWord(level.context,text); return void
end function
function recordConsole(level,when,text)
  recordCommandBoundary(level,2,when); textWord(level.context,text); return void
end function
function recordUserinfoChanged(level,slot)
  recordCommandBoundary(level,3,slot); boolWord(level.context,level.clients[slot].teamLeader); return void
end function
function recordEffect(state,kind,index,key,value)
  check = state.level.context; commandSnapshot(state.level); words(check,[kind,index]); textWord(check,key); textWord(check,value)
  check.events = check.events+1; return void
end function
function configure(world,reader,check)
  level = game.create(world); state = spawn.create(level,""); level.context = check
  state.effectFn = recordEffect; level.serverCommandFn = recordServer; level.consoleCommandFn = recordConsole
  level.clientUserinfoChangedFn = recordUserinfoChanged
  level.maxclients = readInt(reader); level.time = readInt(reader); level.allowVote = readInt(reader)
  level.voteTime = readInt(reader); level.voteExecuteTime = readInt(reader); level.voteYes = readInt(reader)
  level.voteNo = readInt(reader); level.numVotingClients = readInt(reader)
  for index = 0 to 1
    level.teamVoteTime[index] = readInt(reader); level.teamVoteYes[index] = readInt(reader)
    level.teamVoteNo[index] = readInt(reader); level.numteamVotingClients[index] = readInt(reader)
  end for
  level.voteString = readString(reader); level.voteDisplayString = readString(reader)
  for index = 0 to 1
    level.teamVoteString[index] = readString(reader)
  end for
  rotation = readString(reader)
  if rotation != "" then cv.set2(state.cvars,"NeXtMaP",rotation,true) end if
  for index = 0 to 63
    game.bindClient(level,level.entities[index],level.clients[index]); client = level.clients[index]
    level.entities[index].inuse = readInt(reader) != 0; client.connected = readInt(reader); client.team = readInt(reader)
    client.teamLeader = readInt(reader) != 0; client.ps.eFlags = readInt(reader)
    client.voteCount = readInt(reader); client.teamVoteCount = readInt(reader); client.ps.clientNum = readInt(reader); client.netname = readString(reader)
  end for
  for index = 8 to 19
    state.configstrings[index] = "before-"+str(index)
  end for
  return level
end function
function requireCommand(condition,label)
  if not condition then return error(499,"Failed vote-command contract: "+label) end if
  return void
end function
function noopCommandServer(level,slot,text)
  return void
end function
function commandContracts(world)
  level = game.create(world); ent = level.entities[0]
  requireCommand(try(voteCommands.callVote(level,void,[])) is error,"missing caller")
  requireCommand(try(voteCommands.callVote(level,ent,[])) is error,"missing binding")
  game.bindClient(level,ent,level.clients[0]); ent.slot = 64
  requireCommand(try(voteCommands.castVote(level,ent,[])) is error,"caller storage")
  ent.slot = 0; level.maxclients = 65
  requireCommand(try(voteCommands.callTeamVote(level,ent,[])) is error,"client limit")
  level.maxclients = 4
  requireCommand(try(voteCommands.callVote(level,ent,[])) is error,"required server delivery")
  level.serverCommandFn = noopCommandServer; level.allowVote = 1
  requireCommand(try(voteCommands.callVote(level,ent,["callvote","map","q3dm1"])) is error,"required registry")
  requireCommand(try(voteCommands.boundedText(decode(bytes([97,0,98])),64)) is error,"embedded NUL")
  requireCommand(try(voteCommands.boundedText("x",0)) is error,"argument capacity")
  requireCommand(try(voteCommands.teamArguments(["callteamvote","leader",decode(bytes(1023,97)),"tail"])) is error,"native strcat overflow")
  requireCommand(len(bytes(voteCommands.teamArguments(["callteamvote","leader",decode(bytes(1022,97)),"tail"]))) == 1023,"one-byte final copy")
  level.voteExecuteTime = 1; level.voteString = "map old"
  requireCommand(try(voteCommands.callVote(level,ent,["callvote","fraglimit","20"])) is error,"required console delivery")
  state = spawn.create(level,""); cvars.attach(level,"Sep  5 2026"); cvars.register(level)
  requireCommand(level.allowVote == 1,"registered allowVote")
  cv.set2(state.cvars,"g_allowVote","0",true)
  requireCommand(level.allowVote == 1,"allowVote retains VM snapshot before refresh")
  cvars.update(level); requireCommand(level.allowVote == 0,"allowVote refresh")
  level.voteTime = 0; voteCommands.callVote(level,ent,["callvote","fraglimit","20"])
  requireCommand(level.voteTime == 0,"disabled call after engine update")
  level.voteTime = 1; voteCommands.castVote(level,ent,["vote","yes"])
  requireCommand(level.voteYes == 1,"existing vote may be cast with allowVote disabled")
  cv.set2(state.cvars,"nextmap","vstr rotation",true)
  requireCommand(voteCommands.nextMap(level) == "vstr rotation","live nextmap registry")
  cv.set2(state.cvars,"nextmap","",true)
  requireCommand(voteCommands.nextMap(level) == "","cleared nextmap registry")
  other = game.create(world); spawn.create(other,""); cvars.rebind(other,level.gameCvars)
  requireCommand(other.allowVote == 0,"module rebind carries allowVote")
  print "PASS: 19 vote-command runtime contracts"; return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args)>3 and args[3]=="--contracts" then return commandContracts(world) end if
  reader = Reader(fs.readAllBytes(args[1]),0); check = Check(fs.readAllBytes(args[2]),0,0,0,0)
  level = configure(world,reader,check); count = readInt(reader)
  for index = 1 to count
    kind = readInt(reader); level.time = readInt(reader); slot = readInt(reader); argc = readInt(reader); argv = []
    argIndex = 0
    while argIndex < argc
      argv = argv+[readString(reader)]; argIndex = argIndex+1
    end while
    switch kind
      case 1
        voteCommands.callVote(level,level.entities[slot],argv)
      end case
      case 2
        voteCommands.castVote(level,level.entities[slot],argv)
      end case
      case 3
        voteCommands.callTeamVote(level,level.entities[slot],argv)
      end case
      case 4
        voteCommands.castTeamVote(level,level.entities[slot],argv)
      end case
      case 5
        votes.check(level)
      end case
      case 6
        votes.checkTeam(level,slot)
      end case
      case 7
        level.clients[slot].connected = cv.atoi(argv[0]); level.clients[slot].team = cv.atoi(argv[1])
      end case
      case 8
        cv.set2(level.spawner.cvars,"nextmap",argv[0],true)
      end case
      case 9
        level.allowVote = cv.atoi(argv[0])
      end case
      case default
        return error(499,"Invalid vote-command test action")
      end case
    end switch
    commandSnapshot(level); check.actions = check.actions+1
  end for
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete vote-command stream") end if
  print "PASS: "+str(check.actions)+" vote-command actions / "+str(check.words)+" exact words / "+str(check.events)+" ordered effects"; return 0
end function
