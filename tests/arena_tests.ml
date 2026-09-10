// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.arenas as arenas
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.items as items
import mq3.game.server_commands as serverCommands
import mq3.game.intermission as intermission
import mq3.game.constants as c
import mq3.qcommon.cvar as cv
import mq3.collision.world as cm
import std.fs as fs

struct Check
  console
  links
end struct
function require(condition,label)
  if not condition then return error(499,"Failed arena contract: "+label) end if
  return void
end function
function arenaConsole(level,when,text)
  level.context.console = level.context.console+[[when,text]]; return void
end function
function observe(level,kind,ent)
  if kind == 1 then level.context.links = level.context.links+[ent.slot] end if
  return void
end function
function serverMessage(level,slot,text)
  return void
end function
function setup(world)
  level = game.create(world); state = spawn.create(level,""); state.gametype = 2; level.context = Check([],[])
  level.consoleCommandFn = arenaConsole; level.serverCommandFn = serverMessage; level.observeFn = observe; level.maxclients = 2; level.maxclientsCvar = 2; level.num_entities = 64
  cv.get(state.cvars,"g_podiumDist","80",0); cv.get(state.cvars,"g_podiumDrop","70",0)
  for slot = 0 to 1
    ent = level.entities[slot]; ent.inuse = true; ent.health = 100; ent.s.number = slot; game.bindClient(level,ent,level.clients[slot])
    ent.client.connected = 2; ent.client.team = c.TEAM_FREE; ent.client.ps.clientNum = slot; ent.client.netname = "player"+str(slot)
    ent.r.mins = [-15.0,-15.0,-24.0]; ent.r.maxs = [15.0,15.0,32.0]; ent.r.ownerNum = 1023
  end for
  level.entities[1].r.svFlags = 8
  return level
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  empty = setup(world); empty.entities[0].r.svFlags = 8; arenas.updateTournamentInfo(empty)
  require(len(empty.context.console) == 0,"postgame ignores bot-only match")
  spectator = setup(world); spectator.intermissiontime = 1; spectator.clients[0].team = c.TEAM_SPECTATOR; arenas.updateTournamentInfo(spectator)
  require(len(spectator.context.console) == 1,"spectator postgame command")
  require(spectator.context.console[0][1] == "postgame 1 0 0 0 0 0 0 0 1 16384 0","spectator postgame payload")
  level = setup(world)
  level.time = 7000; level.intermissiontime = 7000
  level.clients[0].accuracy_hits = 5; level.clients[0].accuracy_shots = 10
  level.clients[0].ps.persistant[c.PERS_SCORE] = 10; level.clients[0].ps.persistant[c.PERS_IMPRESSIVE_COUNT] = 3
  level.clients[0].ps.persistant[c.PERS_EXCELLENT_COUNT] = 4; level.clients[0].ps.persistant[c.PERS_GAUNTLET_FRAG_COUNT] = 5
  level.clients[1].ps.persistant[c.PERS_SCORE] = 7
  arenas.updateTournamentInfo(level)
  require(len(level.context.console) == 1,"one postgame command")
  require(level.context.console[0][0] == 2 and level.context.console[0][1] == "postgame 2 0 50 3 4 5 10 1 0 0 10 1 1 7","active-player postgame payload")

  level.intermission_origin = [100.0,200.0,300.0]; level.intermission_angle = [0.0,90.0,0.0]
  level.clients[0].ps.weapon = c.WP_GAUNTLET; level.entities[0].s.weapon = c.WP_GAUNTLET
  arenas.spawnModelsOnVictoryPads(level)
  require(level.num_entities == 67 and level.context.links == [64,65,66],"podium spawn and link order")
  require(level.entities[64].classname == "podium" and level.entities[64].s.modelindex != 0 and level.entities[64].r.contents == 1,"podium model")
  require(level.podium1.slot == 65 and level.podium2.slot == 66 and level.podium3 == void,"two victory models")
  require(level.podium1.client == level.clients[0] and level.podium1.physicsObject and level.podium1.item == void,"victory body client physics")
  require(level.podium1.s.torsoAnim == c.TORSO_STAND2 and level.podium1.s.legsAnim == c.LEGS_IDLE and level.podium1.count == 0,"winner model state")
  require(level.podium2.s.weapon == c.WP_MACHINEGUN and level.podium2.count == 1,"runner-up model state")
  require(level.podium1.nextthink == 9000 and level.entities[64].nextthink == 7100,"presentation think schedule")

  level.time = 9000; items.run(level,level.podium1)
  require((level.podium1.s.torsoAnim & ~128) == c.TORSO_GESTURE and level.podium1.nextthink == 11294,"celebration starts through physics-object item path")
  require((level.clients[0].ps.externalEvent & 255) == c.EV_TAUNT,"celebration event reaches copied client")
  level.time = 11294; items.run(level,level.podium1)
  require((level.podium1.s.torsoAnim & ~128) == c.TORSO_STAND2 and level.podium1.nextthink == 0,"celebration stops")

  level.time = 12000; level.podium1.nextthink = 13000; level.podium1.think = arenas.celebrateStart
  require(serverCommands.command(level,["abort_podium"]),"abort command handled")
  require(level.podium1.nextthink == 12000 and level.podium1.think == arenas.celebrateStop,"default podium abort")
  level.spawner.gametype = 0; level.podium1.nextthink = 13000; serverCommands.command(level,["abort_podium"])
  require(level.podium1.nextthink == 13000,"abort ignored outside single player")
  level.spawner.gametype = 2; level.intermissiontime = 0; level.time = 14000
  point = game.spawn(level); point.classname = "info_player_intermission"; point.s.origin = [12.0,34.0,56.0]; point.s.angles = [1.0,2.0,3.0]
  priorEntities = level.num_entities; priorCommands = len(level.context.console)
  intermission.begin(level)
  require(level.intermissiontime == 14000 and len(level.context.console) == priorCommands+1,"single-player begin uses real postgame default")
  require(level.num_entities == priorEntities+3 and level.podium1 != void and level.podium2 != void,"single-player begin uses real podium default")
  require(level.clients[0].ps.pm_type == c.PM_INTERMISSION and level.clients[1].ps.pm_type == c.PM_INTERMISSION,"single-player begin moves clients")
  print "PASS: 22 Baseq3 postgame/podium runtime contracts"; return 0
end function
