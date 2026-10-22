// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_mover as mover
import mq3.game.entities as game
import mq3.game.constants as c
import mq3.collision.world as cm
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.fs as fs

function makeMoverFixtureEntity(level,slot,kind,origin)
  ent = game.initEntity(level.entities[slot]); ent.s.eType = kind; ent.s.origin = origin; ent.s.pos.trBase = origin
  ent.r.mins = [-4.0,-4.0,-4.0]; ent.r.maxs = [4.0,4.0,4.0]; ent.r.currentOrigin = origin
  ent.r.contents = 1; ent.clipmask = 1; ent.s.groundEntityNum = 1023; game.link(level,ent); return ent
end function
function check(expected,words)
  if len(expected) != len(words)*4 then return error(490,"Mover complete oracle size mismatch") end if
  for index = 0 to len(words)-1
    wanted = n.readU32(expected,index*4)
    if n.u32(words[index]) != wanted then return error(490,"Mover complete mismatch word "+str(index)+" got "+str(n.u32(words[index]))+" wanted "+str(wanted)) end if
  end for
  return void
end function
function vectorWords(words,value)
  for each part in value words = words+[n.floatBits(part)] end for
  return words
end function
function main(args)
  if len(args) != 3 then return error(490,"Expected BSP, case and oracle") end if
  caseId = textnum.atoi(args[1]); world = cm.loadWorld(fs.readAllBytes(args[0]),true); level = game.create(world)
  pusher = makeMoverFixtureEntity(level,1,c.ET_MOVER,[0.0,0.0,0.0]); pusher.r.mins = [-8.0,-8.0,-8.0]; pusher.r.maxs = [8.0,8.0,8.0]; game.link(level,pusher)
  mine = makeMoverFixtureEntity(level,3,c.ET_MISSILE,[0.0,0.0,7.9]); mine.classname = "prox mine"; mine.movedir = [0.0,0.0,1.0]; mine.s.loopSound = 77; mine.splashDamage = 0
  activator = makeMoverFixtureEntity(level,4,c.ET_GENERAL,[100.0,100.0,100.0]); mine.activator = activator
  move = [0.0,0.0,0.0]
  if caseId == 1 then mine.enemy = pusher; move = [10.0,0.0,0.0]
  else if caseId != 2 then return error(490,"Invalid mover complete case") end if
  result = mover.G_MoverPush(level,pusher,move,[0.0,0.0,0.0])
  words = [0x4d4f5643,caseId]
  if result[0] then words = words+[1] else words = words+[0] end if
  words = vectorWords(words,mine.s.pos.trBase); words = vectorWords(words,mine.r.currentOrigin); words = words+[mine.s.loopSound]
  if mine.activator == void then words = words+[-1] else words = words+[mine.activator.slot] end if
  if activator.inuse then words = words+[1] else words = words+[0] end if
  if mine.s.eType == c.ET_GENERAL then words = words+[1] else words = words+[0] end if
  check(fs.readAllBytes(args[2]),words); print "PASS: "+str(len(words))+" g_mover Missionpack words"; return 0
end function
