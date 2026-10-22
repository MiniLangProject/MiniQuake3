// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_client as client
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.collision.world as cm
import mq3.game.movement as movement
import std.fs as fs

struct Context drops end struct
function require(ok,label)
  if not ok then return error(499,"g_client contract: "+label) end if
  return 1
end function
function drop(level,slot,reason)
  level.context.drops = level.context.drops+[[slot,reason]]; return void
end function
function contracts(world)
  count = 0; level = game.create(world); level.spawner = spawn.create(level,"")
  level.context = Context([]); level.dropClientFn = drop; level.maxclients = 3; level.maxclientsCvar = 3

  count = count+require(client.skin("sarge/default","red")=="sarge/red" and client.skin("visor","blue")=="visor/blue","skin helper")
  count = count+require(client.ClientCleanName("   ^0bad^1Ranger    X",36)=="bad^1Ranger   X","clean name")

  for index = 0 to 2
    ent = game.initEntity(level.entities[index]); game.bindClient(level,ent,level.clients[index]); ent.client.connected = 2
  end for
  level.clients[0].team = c.TEAM_RED; level.clients[0].teamLeader = true
  level.clients[1].team = c.TEAM_BLUE; level.clients[2].team = c.TEAM_BLUE
  count = count+require(client.TeamCount(level,-1,c.TEAM_RED)==1 and client.TeamCount(level,2,c.TEAM_BLUE)==1,"team count")
  count = count+require(client.TeamLeader(level,c.TEAM_RED)==0 and client.TeamLeader(level,c.TEAM_BLUE)==-1,"team leader")
  count = count+require(client.PickTeam(level,-1)==c.TEAM_RED,"team selection")

  player = level.entities[0]; player.client.ps.delta_angles = [1,2,3]; player.client.cmdAngles = [100,200,300]
  client.SetClientViewAngle(player,[10.0,20.0,30.0])
  count = count+require(player.client.ps.viewangles==[10.0,20.0,30.0] and player.s.angles==[10.0,20.0,30.0],"view angle")

  client.InitBodyQue(level)
  count = count+require(len(level.bodyQue)==8 and level.bodyQueIndex==0 and level.bodyQue[0]!=void,"body queue")

  spot = game.spawn(level); spot.classname = "info_player_deathmatch"; spot.s.origin = [128.0,64.0,32.0]
  level.num_entities = spot.slot+1; nearest = client.SelectNearestDeathmatchSpawnPoint(level,[0.0,0.0,0.0])
  count = count+require(nearest==spot and not client.SpotWouldTelefrag(level,spot),"spawn query")
  origin = [0.0,0.0,0.0]; angles = [0.0,0.0,0.0]
  count = count+require(client.SelectSpawnPoint(level,[0.0,0.0,0.0],origin,angles)==spot and origin==[128.0,64.0,41.0],"spawn selection")

  start = game.spawn(level); start.classname = "info_player_start"; client.SP_info_player_start(level,start)
  count = count+require(start.classname=="info_player_deathmatch","player start")
  intermission = game.spawn(level); intermission.classname = "info_player_intermission"; client.SP_info_player_intermission(level,intermission)
  count = count+require(intermission.inuse,"intermission marker")

  client.trap_DropClient(level,2,"contract")
  count = count+require(level.context.drops==[[2,"contract"]],"drop boundary")
  return count
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true); count = contracts(world)
  print("PASS: "+str(count)+" g_client complete contracts"); return 0
end function
