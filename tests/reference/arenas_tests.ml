// SPDX-License-Identifier: GPL-2.0-or-later
// Differential consumer for tests/reference/arenas_oracle.c.
import mq3.game.arenas as arenas
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.game.playerstate as ps
import mq3.qcommon.cvar as cv
import mq3.collision.world as cm
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.fs as fs

struct Context
  when
  message
  links
end struct
function arenaOracleConsole(level,when,message)
  level.context.when = when; level.context.message = message; return void
end function
function observe(level,kind,ent)
  if kind == 1 then level.context.links = level.context.links+[ent.slot] end if
  return void
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
function textWords(result,value)
  data = bytes(value); result = result+[len(data)]
  for each part in data
    result = result+[part]
  end for
  return result
end function
function thinkTag(ent)
  if ent.think == arenas.celebrateStart then return 1 end if
  if ent.think == arenas.celebrateStop then return 2 end if
  if ent.think == arenas.podiumPlacementThink then return 3 end if
  return 0
end function
function clientSlot(level,ent)
  if ent.client == void then return -1 end if
  for slot = 0 to 2
    if ent.client == level.clients[slot] then return slot end if
  end for
  return -2
end function
function snapshot(result,level,ent)
  result = result+[boolean(ent.inuse),ent.s.number,ent.s.eType,ent.s.eFlags,ent.s.powerups,ent.s.loopSound,ent.s.event,ent.s.eventParm,ent.s.weapon]
  result = result+[ent.s.legsAnim,ent.s.torsoAnim,ent.s.modelindex,ent.s.groundEntityNum]
  result = vectorWords(result,ent.s.pos.trBase); result = result+[ent.s.pos.trType,ent.s.pos.trTime,ent.s.pos.trDuration]; result = vectorWords(result,ent.s.pos.trDelta)
  result = vectorWords(result,ent.s.apos.trBase); result = vectorWords(result,ent.r.currentOrigin)
  result = vectorWords(result,ent.r.mins); result = vectorWords(result,ent.r.maxs); result = vectorWords(result,ent.r.absmin); result = vectorWords(result,ent.r.absmax)
  result = result+[ent.r.svFlags,ent.r.contents,ent.r.ownerNum,ent.clipmask,ent.timestamp,boolean(ent.physicsObject),n.floatBits(ent.physicsBounce),boolean(ent.takedamage)]
  result = result+[ent.count,ent.nextthink,thinkTag(ent),clientSlot(level,ent)]
  if ent.classname == void then result = textWords(result,"") else result = textWords(result,ent.classname) end if
  return result
end function
function setup(world)
  level = game.create(world); state = spawn.create(level,""); state.gametype = 2
  level.context = Context(-1,"",[]); level.consoleCommandFn = arenaOracleConsole; level.observeFn = observe
  level.maxclients = 3; level.maxclientsCvar = 3; level.num_entities = 64; level.time = 7000
  level.intermission_origin = [100.25,-200.5,300.75]; level.intermission_angle = [13.0,91.0,-7.0]
  cv.get(state.cvars,"g_podiumDist","80",0); cv.get(state.cvars,"g_podiumDrop","70",0)
  for slot = 0 to 2
    ent = game.initEntity(level.entities[slot]); client = game.createClient(ps.create(),c.TEAM_FREE,[0,0,0]); game.bindClient(level,ent,client)
    client.connected = 2; client.team = c.TEAM_FREE; client.netname = "player"+str(slot)
    ent.r.mins = [-15.0-slot,-16.0-slot,-24.0-slot]; ent.r.maxs = [15.0+slot,16.0+slot,32.0+slot]
    ent.r.absmin = [-20.0-slot,-21.0-slot,-25.0-slot]; ent.r.absmax = [20.0+slot,21.0+slot,33.0+slot]
    ent.r.ownerNum = 40+slot; ent.r.svFlags = 0x10+slot; if slot == 0 then ent.s.weapon = c.WP_GAUNTLET else ent.s.weapon = c.WP_NONE end if
    ent.s.eFlags = 0x55+slot; ent.s.powerups = 0x66+slot; ent.s.loopSound = 70+slot; ent.s.event = 80+slot
    level.sortedClients[slot] = slot; client.ps.persistant[c.PERS_RANK] = slot; client.ps.persistant[c.PERS_SCORE] = 30-slot*7
  end for
  level.numNonSpectatorClients = 3; return level
end function
function podiumSlot(ent)
  if ent == void then return -1 end if
  return ent.slot
end function
function checkExpected(expected,actual)
  if len(expected) != len(actual)*4 then return error(490,"Arena oracle size mismatch") end if
  for index = 0 to len(actual)-1
    wanted = n.readI32(expected,index*4); got = n.i32(actual[index])
    if got != wanted then return error(490,"Arena mismatch word "+str(index)+" got "+str(got)+" wanted "+str(wanted)) end if
  end for
  return void
end function
function main(args)
  if len(args) != 3 then return error(490,"Expected BSP, case and oracle") end if
  caseId = textnum.atoi(args[1]); expected = fs.readAllBytes(args[2]); world = cm.loadWorld(fs.readAllBytes(args[0]),true); level = setup(world)
  rankCalls = 0; eventCalls = 0
  if caseId == 1 then
    client = level.clients[0]; client.accuracy_hits = 17; client.accuracy_shots = 23
    client.ps.persistant[c.PERS_IMPRESSIVE_COUNT] = 4; client.ps.persistant[c.PERS_EXCELLENT_COUNT] = 5
    client.ps.persistant[c.PERS_GAUNTLET_FRAG_COUNT] = 6; client.ps.persistant[c.PERS_KILLED] = 0
    level.entities[1].r.svFlags = level.entities[1].r.svFlags | 8; level.entities[2].r.svFlags = level.entities[2].r.svFlags | 8
    arenas.updateTournamentInfo(level); rankCalls = 1
  else if caseId == 2 then
    level.clients[0].team = c.TEAM_SPECTATOR; level.entities[1].r.svFlags = level.entities[1].r.svFlags | 8; level.entities[2].r.svFlags = level.entities[2].r.svFlags | 8
    arenas.updateTournamentInfo(level); rankCalls = 1
  else if caseId == 3 then arenas.spawnModelsOnVictoryPads(level)
  else if caseId == 4 then
    arenas.spawnModelsOnVictoryPads(level); level.time = 8100; arenas.podiumPlacementThink(level,level.entities[64]); arenas.celebrateStart(level,level.podium1)
    eventCalls = 1; level.time = level.time+2294; arenas.celebrateStop(level,level.podium1)
  else if caseId == 5 then
    arenas.spawnModelsOnVictoryPads(level); level.podium1.nextthink = 99999; level.podium1.think = arenas.celebrateStart; level.time = 12345; arenas.abortPodium(level,[])
    level.spawner.gametype = 0; level.podium1.nextthink = 22222; level.podium1.think = arenas.celebrateStart; arenas.abortPodium(level,[])
  else return error(490,"Invalid arena case") end if
  actual = [0x4152454e,caseId,rankCalls,level.context.when]; actual = textWords(actual,level.context.message)
  modelCalls = 0; if level.spawner.configstrings[33] == "models/mapobjects/podium/podium4.md3" then modelCalls = 1 end if
  actual = actual+[level.num_entities,modelCalls,len(level.context.links)]; for each slot in level.context.links actual = actual+[slot] end for
  actual = actual+[podiumSlot(level.podium1),podiumSlot(level.podium2),podiumSlot(level.podium3),eventCalls]
  for slot = 64 to 67 actual = snapshot(actual,level,level.entities[slot]) end for
  for slot = 0 to 2
    actual = actual+[level.clients[slot].ps.externalEvent,level.clients[slot].ps.externalEventParm,level.clients[slot].ps.externalEventTime]
  end for
  checkExpected(expected,actual); print "PASS: "+str(len(actual))+" arena words"; return 0
end function
