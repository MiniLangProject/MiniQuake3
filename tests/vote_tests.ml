// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.votes as votes
import mq3.game.frame as frame
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
  value = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return value
end function
function readString(reader)
  size = readInt(reader); value = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return value
end function
function word(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected vote output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"Vote mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
  check.offset = check.offset+4; check.words = check.words+1; return void
end function
function words(check,values)
  for each value in values
    word(check,value)
  end for
  return void
end function
function booleanWord(check,value)
  if value then return word(check,1) end if
  return word(check,0)
end function
function string(check,value)
  data = bytes(value); word(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Vote string mismatch at byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function boundary(level,kind,arg)
  words(level.context,[150,kind,arg,level.voteTime,level.voteExecuteTime,level.teamVoteTime[0],level.teamVoteTime[1]])
  level.context.events = level.context.events+1; return void
end function
function recordServer(level,slot,text)
  boundary(level,1,slot); string(level.context,text); return void
end function
function recordConsole(level,when,text)
  boundary(level,2,when); string(level.context,text); return void
end function
function recordUserinfoChanged(level,slot)
  boundary(level,3,slot); booleanWord(level.context,level.clients[slot].teamLeader); return void
end function
function effect(state,kind,index,key,value)
  check = state.level.context; words(check,[kind,index]); string(check,key); string(check,value)
  check.events = check.events+1; return void
end function
function recordStage(level,kind,arg)
  words(level.context,[110,kind,arg]); level.context.events = level.context.events+1; return void
end function
function recordVoteCvar(level,key,value)
  words(level.context,[110,7]); string(level.context,key); string(level.context,value)
  level.context.events = level.context.events+1; return void
end function
function configure(world,reader,check)
  level = game.create(world); state = spawn.create(level,""); level.context = check
  state.effectFn = effect; level.serverCommandFn = recordServer; level.consoleCommandFn = recordConsole
  level.clientUserinfoChangedFn = recordUserinfoChanged; level.frameStageFn = recordStage; level.cvarSetFn = recordVoteCvar
  level.maxclients = readInt(reader); level.maxclientsCvar = level.maxclients; level.time = readInt(reader)
  level.voteTime = readInt(reader); level.voteExecuteTime = readInt(reader); level.voteYes = readInt(reader)
  level.voteNo = readInt(reader); level.numVotingClients = readInt(reader)
  for index = 0 to 1
    level.teamVoteTime[index] = readInt(reader); level.teamVoteYes[index] = readInt(reader)
    level.teamVoteNo[index] = readInt(reader); level.numteamVotingClients[index] = readInt(reader)
  end for
  level.voteString = readString(reader)
  for index = 0 to 1
    level.teamVoteString[index] = readString(reader)
  end for
  for index = 0 to 63
    game.bindClient(level,level.entities[index],level.clients[index])
    client = level.clients[index]; client.connected = readInt(reader); client.team = readInt(reader)
    client.teamLeader = readInt(reader) != 0; level.entities[index].r.svFlags = readInt(reader); client.netname = readString(reader)
  end for
  state.configstrings[8] = "vote-before"; state.configstrings[12] = "red-before"; state.configstrings[13] = "blue-before"
  return level
end function
function snapshot(level)
  check = level.context
  words(check,[160,level.framenum,level.previousTime,level.time,level.voteTime,level.voteExecuteTime,level.voteYes,level.voteNo,level.numVotingClients])
  for index = 0 to 1
    words(check,[level.teamVoteTime[index],level.teamVoteYes[index],level.teamVoteNo[index],level.numteamVotingClients[index]])
  end for
  string(check,level.voteString); string(check,level.teamVoteString[0]); string(check,level.teamVoteString[1])
  for index = 0 to 63
    client = level.clients[index]; words(check,[client.connected,client.team]); booleanWord(check,client.teamLeader)
    word(check,level.entities[index].r.svFlags); string(check,client.netname)
  end for
  string(check,level.spawner.configstrings[8]); string(check,level.spawner.configstrings[12]); string(check,level.spawner.configstrings[13])
  return void
end function
function require(condition,label)
  if not condition then return error(499,"Failed vote contract: "+label) end if
  return void
end function
function noopServer(level,slot,text)
  return void
end function
function contracts(world)
  level = game.create(world); votes.check(level); votes.checkTeam(level,3)
  level.voteTime = 1; level.voteYes = 1; level.time = 100
  require(try(votes.check(level)) is error,"server-command delivery")
  level.voteTime = 0; level.voteExecuteTime = 1
  require(try(votes.check(level)) is error,"console-command delivery")
  level.serverCommandFn = noopServer; level.voteTime = 1
  require(try(votes.check(level)) is error,"spawn state")
  require(try(votes.setLeader(level,1,-1)) is error,"negative leader slot")
  require(try(votes.setLeader(level,1,64)) is error,"leader slot beyond storage")
  level.maxclients = 65; require(try(votes.checkTeamLeader(level,1)) is error,"client limit")
  level.maxclients = 1; level.clients[0].connected = 2; level.clients[0].team = 1
  require(try(votes.setLeader(level,1,0)) is error,"userinfo delivery")
  spawn.create(level,""); level.teamVoteTime[0] = 1; level.teamVoteYes[0] = 1; level.teamVoteString[0] = "leader"
  require(try(votes.checkTeam(level,1)) is error,"missing leader argument storage")
  require(try(votes.commandText(decode(bytes([97,0,98])))) is error,"embedded NUL")
  require(try(votes.commandText(decode(bytes(1024,97)))) is error,"oversized vote command")
  other = game.create(world); level.teamVoteTime[1] = 9
  require(other.teamVoteTime[1] == 0 and other.teamVoteString[0] == "","independent vote arrays")
  print "PASS: 11 vote/leader runtime contracts"; return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args)>3 and args[3]=="--contracts" then return contracts(world) end if
  reader = Reader(fs.readAllBytes(args[1]),0); check = Check(fs.readAllBytes(args[2]),0,0,0,0)
  level = configure(world,reader,check); count = readInt(reader)
  for index = 1 to count
    kind = readInt(reader); time = readInt(reader); team = readInt(reader); slot = readInt(reader)
    if kind != 6 then level.time = time end if
    switch kind
      case 1
        votes.check(level)
      end case
      case 2
        votes.checkTeam(level,team)
      end case
      case 3
        votes.setLeader(level,team,slot)
      end case
      case 4
        votes.checkTeamLeader(level,team)
      end case
      case 5
        votes.printTeam(level,team,"print \"Team notice.\n\"")
      end case
      case 6
        frame.run(level,time)
      end case
      case default
        return error(499,"Invalid vote test action")
      end case
    end switch
    snapshot(level); check.actions = check.actions+1
  end for
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete vote stream") end if
  print "PASS: "+str(check.actions)+" vote/leader actions / "+str(check.words)+" exact words / "+str(check.events)+" ordered effects"; return 0
end function
