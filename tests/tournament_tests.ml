// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.tournament as tournament
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
struct Check
  expected
  offset
  words
  promote
end struct
function word(check,value)
  if check.offset+4 > len(check.expected) or n.u32(value) != n.readU32(check.expected,check.offset) then return error(499,"CheckTournament mismatch at "+str(check.offset)) end if
  check.offset = check.offset+4; check.words = check.words+1; return void
end function
function words(check,values)
  for each value in values
    word(check,value)
  end for
  return void
end function
function string(check,value)
  data = bytes(value); word(check,len(data))
  for each part in data
    if check.expected[check.offset] != part then return error(499,"CheckTournament string mismatch") end if
    check.offset = check.offset+1
  end for
  return void
end function
function effect(state,kind,index,key,value)
  words(state.level.context,[1,index]); string(state.level.context,key); string(state.level.context,value); return void
end function
function tournamentTestAddPlayer(level)
  words(level.context,[130,1,level.numPlayingClients]); if level.context.promote then level.numPlayingClients = 2 end if
  return void
end function
function tournamentTestLog(level,message)
  words(level.context,[130,2]); string(level.context,message); return void
end function
function tournamentTestCvar(level,key,value)
  words(level.context,[130,3]); string(level.context,key); string(level.context,value); return void
end function
function tournamentTestConsole(level,when,text)
  words(level.context,[130,4,when]); string(level.context,text); return void
end function
function configure(level,input,check)
  state = spawn.create(level,""); level.context = check; state.context = check; state.effectFn = effect; state.gametype = n.readI32(input,0)
  level.numPlayingClients = n.readI32(input,4); state.warmupTime = n.readI32(input,8); level.time = n.readI32(input,12)
  level.warmup = n.readI32(input,16); level.warmupCvarModificationCount = n.readI32(input,20); level.warmupModificationCount = n.readI32(input,24)
  level.maxclients = n.readI32(input,28); check.promote = n.readI32(input,40) != 0
  red = n.readI32(input,32); blue = n.readI32(input,36); index = 0
  while index < red
    level.clients[index].connected = 2; level.clients[index].team = 1; index = index+1
  end while
  limit = red+blue
  while index < limit
    level.clients[index].connected = 2; level.clients[index].team = 2; index = index+1
  end while
  level.tournamentAddFn = tournamentTestAddPlayer; level.gameLogFn = tournamentTestLog; level.cvarSetFn = tournamentTestCvar; level.consoleCommandFn = tournamentTestConsole
  level.spawner = state
  return state
end function
function require(condition,label)
  if not condition then return error(499,"Failed tournament contract: "+label) end if
  return void
end function
function contracts(world)
  level = game.create(world); require(try(tournament.check(level)) is error,"spawn state")
  spawn.create(level,""); level.numPlayingClients = 1; level.spawner.gametype = 1
  require(tournament.addPlayer(level) == void,"empty queue needs no promotion callback")
  level.maxclients = 65; require(try(tournament.teamCount(level,-1,1)) is error,"client limit")
  print "PASS: 3 CheckTournament runtime contracts"; return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args)>3 and args[3]=="--contracts" then return contracts(world) end if
  input=fs.readAllBytes(args[1]); expected=fs.readAllBytes(args[2]); check=Check(expected,0,0,false)
  level=game.create(world); state=configure(level,input,check); tournament.check(level)
  restarted = 0; if level.restarted then restarted = 1 end if
  word(check,140); words(check,[state.warmupTime,level.warmupModificationCount,restarted,level.numPlayingClients])
  if check.offset != len(expected) then return error(499,"Missing CheckTournament output") end if
  print "PASS: "+str(check.words)+" exact CheckTournament words"; return 0
end function
