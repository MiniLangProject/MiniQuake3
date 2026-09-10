// SPDX-License-Identifier: GPL-2.0-or-later
// Differential consumer for tests/reference/mover_push_oracle.c.
import mq3.game.movers as movers
import mq3.game.entities as game
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.game.constants as c
import mq3.collision.world as cm
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.fs as fs
import std.string as strings

struct Context
  blocked
  obstacle
end struct

function blocked(level,self,other)
  level.context.blocked = level.context.blocked+1; level.context.obstacle = other.slot; return void
end function
function boolean(value)
  if value then return 1 end if
  return 0
end function
function vectorWords(result,value)
  for each part in value
    result = result+[n.floatBits(part)]
  end for
  return result
end function
function snapshot(result,ent)
  result = result+[boolean(ent.inuse)]; result = vectorWords(result,ent.r.currentOrigin); result = vectorWords(result,ent.r.currentAngles)
  result = vectorWords(result,ent.s.pos.trBase); result = vectorWords(result,ent.s.apos.trBase)
  result = result+[ent.s.groundEntityNum,ent.s.pos.trTime,ent.s.apos.trTime,boolean(ent.client != void)]
  if ent.client != void then result = vectorWords(result,ent.client.ps.origin); result = result+[ent.client.ps.delta_angles[1]]
  else result = result+[0,0,0,0] end if
  return result
end function
function setupEntity(level,slot,kind,origin)
  ent = game.initEntity(level.entities[slot]); ent.s.eType = kind; ent.s.origin = origin; ent.s.pos.trBase = origin
  ent.r.mins = [-4.0,-4.0,-4.0]; ent.r.maxs = [4.0,4.0,4.0]; ent.r.currentOrigin = origin
  ent.r.contents = 0x2000000; ent.clipmask = 0x2000000; ent.s.groundEntityNum = 1023; game.link(level,ent); return ent
end function
function setupBlocker(level,origin)
  ent = setupEntity(level,5,c.ET_GENERAL,origin); ent.r.mins = [-20.0,-20.0,-20.0]; ent.r.maxs = [20.0,20.0,20.0]; game.link(level,ent); return ent
end function
function push(level,pusher,move,angleMove)
  result = movers.pushPart(level,pusher,move,angleMove,[])
  if not result[0] then
    index = len(result[2])-1
    while index >= 0
      movers.restorePush(level,result[2][index]); index = index-1
    end while
  end if
  return result
end function
function linearTrajectory(ent)
  ent.s.pos.trType = c.TR_LINEAR; ent.s.pos.trTime = 0; ent.s.pos.trDelta = [100.0,0.0,0.0]; return void
end function
function checkExpected(expected,actual)
  if len(expected) < len(actual)*4 then return error(490,"Short mover oracle") end if
  for index = 0 to len(actual)-1
    wanted = n.readU32(expected,index*4)
    if n.u32(actual[index]) != wanted then return error(490,"Mover mismatch word "+str(index)+" got "+str(n.u32(actual[index]))+" wanted "+str(wanted)) end if
  end for
  return void
end function
function main(args)
  if len(args) != 3 then return error(490,"Expected BSP, case and oracle") end if
  caseId = textnum.atoi(args[1]); expected = fs.readAllBytes(args[2]); world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  level = game.create(world); level.time = 100; level.previousTime = 90; level.context = Context(0,-1)
  pusher = setupEntity(level,1,c.ET_MOVER,[0.0,0.0,0.0]); actor = setupEntity(level,3,c.ET_ITEM,[0.0,0.0,9.0]); actor.s.groundEntityNum = 1
  success = true; obstacle = -1
  if caseId == 1 then
    result = push(level,pusher,[10.0,0.0,0.0],[0.0,0.0,0.0]); success = result[0]; if result[1] != void then obstacle = result[1].slot end if
  else if caseId == 2 then
    actor.s.eType = c.ET_PLAYER; client = game.createClient(ps.create(),0,[0,0,0]); game.bindClient(level,actor,client)
    client.ps.origin = [10.0,0.0,9.0]; client.ps.delta_angles[1] = 123; actor.r.currentOrigin = client.ps.origin; game.link(level,actor)
    result = push(level,pusher,[0.0,0.0,0.0],[0.0,90.0,0.0]); success = result[0]; if result[1] != void then obstacle = result[1].slot end if
  else if caseId == 3 then
    setupBlocker(level,[5.0,0.0,9.0]); result = push(level,pusher,[10.0,0.0,0.0],[0.0,0.0,0.0]); success = result[0]; if result[1] != void then obstacle = result[1].slot end if
  else if caseId == 4 then
    actor = setupEntity(level,3,c.ET_ITEM,[10.0,0.0,0.0]); actor.s.groundEntityNum = 1023; pusher.s.eFlags = pusher.s.eFlags | 0x400
    setupBlocker(level,[10.0,0.0,0.0]); result = push(level,pusher,[10.0,0.0,0.0],[0.0,0.0,0.0]); success = result[0]; if result[1] != void then obstacle = result[1].slot end if
  else if caseId == 5 then
    slave = setupEntity(level,2,c.ET_MOVER,[100.0,0.0,0.0]); pusher.teamchain = slave; pusher.blocked = blocked; linearTrajectory(pusher); linearTrajectory(slave)
    setupEntity(level,4,c.ET_ITEM,[100.0,0.0,9.0]).s.groundEntityNum = 2; setupBlocker(level,[105.0,0.0,9.0])
    movers.moveTeam(level,pusher); success = level.context.blocked == 0; obstacle = level.context.obstacle
  else return error(490,"Invalid mover case") end if
  actual = [0x4d505553,caseId,boolean(success),obstacle]
  for slot = 1 to 5
    actual = snapshot(actual,level.entities[slot])
  end for
  checkExpected(expected,actual); print "PASS: "+str(len(actual))+" mover-push words"; return 0
end function
