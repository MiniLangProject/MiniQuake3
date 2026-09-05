// SPDX-License-Identifier: GPL-2.0-or-later
// Verbatim Baseq3 G_RunFrame orchestration versus MiniLang.
import mq3.game.frame as frame
import mq3.game.entities as game
import mq3.game.playerstate as ps
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs

struct Check
  expected
  offset
  words
end struct
function checkWord(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected G_RunFrame output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"G_RunFrame mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
  check.offset = check.offset+4; check.words = check.words+1
  return void
end function
function checkWords(check,values)
  for each value in values
    checkWord(check,value)
  end for
  return void
end function
function checkString(check,value)
  data = bytes(value); checkWord(check,len(data))
  for each part in data
    if check.expected[check.offset] != part then return error(499,"G_RunFrame string mismatch") end if
    check.offset = check.offset+1
  end for
  return void
end function
function stage(level,kind,arg)
  checkWords(level.context,[110,kind,arg]); return void
end function
function runEntity(level,kind,ent)
  outputKind = 12
  if kind == 1 then outputKind = 10 else if kind == 2 then outputKind = 11 else if kind == 4 then outputKind = 13 end if
  checkWords(level.context,[110,outputKind,ent.slot]); return void
end function
function endFrame(level,ent)
  checkWords(level.context,[110,14,ent.slot]); return void
end function
function think(level,ent)
  checkWords(level.context,[110,15,ent.slot]); ent.count = ent.count+1; return void
end function
function cvarSet(level,key,value)
  checkWords(level.context,[110,7]); checkString(level.context,key); checkString(level.context,value); return void
end function
function noopCvarRefresh(level)
  return void
end function
function noopStage(level,kind,arg)
  return void
end function
function configure(level,input,check)
  spawn.create(level,""); level.context = check; level.updateCvarsFn = recordCvarRefresh; level.frameStageFn = stage; level.runEntityFn = runEntity
  level.clientEndFrameFn = endFrame; level.cvarSetFn = cvarSet
  level.time = n.readI32(input,0); level.previousTime = n.readI32(input,4); level.framenum = n.readI32(input,8)
  level.restarted = n.readI32(input,12) != 0; level.maxclients = n.readI32(input,16); mode = n.readI32(input,20)
  level.maxclientsCvar = level.maxclients
  for slot = 0 to 63
    game.bindClient(level,level.entities[slot],level.clients[slot])
  end for
  level.listEntity = 0; if mode == 2 then level.listEntity = 1 end if
  if mode != 0 then
    ent = game.initEntity(level.entities[0]); game.bindClient(level,ent,level.clients[0]); level.clients[0].connected = 2
    ent = game.initEntity(level.entities[64]); ent.s.eType = c.ET_MISSILE
    ent = game.initEntity(level.entities[65]); ent.s.eType = c.ET_ITEM
    ent = game.initEntity(level.entities[66]); ent.s.eType = c.ET_MOVER
    ent = game.initEntity(level.entities[67]); ent.think = think; ent.nextthink = n.readI32(input,24); level.num_entities = 68
  end if
  return n.readI32(input,28)
end function
function requireContract(condition,label)
  if not condition then return error(499,"Failed G_RunFrame contract: "+label) end if
  return void
end function
function contracts(world)
  level = game.create(world); spawn.create(level,"")
  requireContract(try(frame.run(level,100)) is error,"maintenance boundary")
  level.updateCvarsFn = noopCvarRefresh; level.frameStageFn = noopStage; level.maxclients = 65
  requireContract(try(frame.run(level,100)) is error,"client limit")
  level2 = game.create(world); spawn.create(level2,""); level2.restarted = true; frame.run(level2,999)
  requireContract(level2.framenum == 0 and level2.time == 0,"restart early return")
  print "PASS: 3 G_RunFrame runtime contracts"; return 0
end function
function recordCvarRefresh(level)
  return stage(level,0,0)
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args) > 3 and args[3] == "--contracts" then return contracts(world) end if
  input = fs.readAllBytes(args[1]); expected = fs.readAllBytes(args[2]); check = Check(expected,0,0)
  level = game.create(world); levelTime = configure(level,input,check); frame.run(level,levelTime)
  checkWord(check,120); checkWords(check,[level.framenum,level.previousTime,level.time,level.num_entities])
  for index = 64 to 67
    checkWord(check,level.entities[index].count)
  end for
  if check.offset != len(expected) then return error(499,"Missing G_RunFrame output") end if
  print "PASS: "+str(check.words)+" exact G_RunFrame words"; return 0
end function
