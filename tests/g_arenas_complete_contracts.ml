// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_arenas as arenas
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.qcommon.cvar as cv
import mq3.collision.world as cm
import std.fs as fs

struct Context commands end struct
function require(ok,label) if not ok then return error(499,"g_arenas contract: "+label) end if;return 1 end function
function arenaCommand(level,when,text) level.context.commands=level.context.commands+[[when,text]];return void end function
function quiet(level,slot,text) return void end function
function setup(world,missionpack,gametype)
  level=game.create(world);state=spawn.create(level,"");state.missionpack=missionpack;state.gametype=gametype
  level.context=Context([]);level.consoleCommandFn=arenaCommand;level.serverCommandFn=quiet;level.maxclients=3;level.maxclientsCvar=3;level.num_entities=64;level.time=7000
  cv.get(state.cvars,"g_podiumDist","80",0);cv.get(state.cvars,"g_podiumDrop","70",0)
  for slot=0 to 2
    ent=game.initEntity(level.entities[slot]);game.bindClient(level,ent,level.clients[slot]);ent.client.connected=2;ent.client.team=c.TEAM_FREE;ent.client.netname="player"+str(slot);ent.client.ps.clientNum=slot
    ent.r.mins=[-15.0,-15.0,-24.0];ent.r.maxs=[15.0,15.0,32.0];ent.r.ownerNum=1023
    ent.client.ps.persistant[c.PERS_SCORE]=30-slot*7
  end for
  level.entities[1].r.svFlags=8;level.entities[2].r.svFlags=8
  return level
end function
function contracts(world)
  checks=0
  base=setup(world,false,2);base.clients[0].accuracy_hits=17;base.clients[0].accuracy_shots=23
  arenas.UpdateTournamentInfo(base)
  checks=checks+require(base.context.commands[0][1]=="postgame 3 0 73 0 0 0 30 1 0 0 30 1 1 23 2 2 16","Baseq3 payload")

  spectator=setup(world,true,2);spectator.clients[0].team=c.TEAM_SPECTATOR;arenas.UpdateTournamentInfo(spectator)
  checks=checks+require(spectator.context.commands[0][1]=="postgame 2 0 0 0 0 0 0 0 0 0 0 0 0 1 0 23 2 1 16","Missionpack spectator payload")

  duel=setup(world,true,2);duel.entities[1].r.svFlags=0;duel.clients[0].ps.persistant[c.PERS_IMPRESSIVE_COUNT]=4;duel.clients[0].ps.persistant[c.PERS_EXCELLENT_COUNT]=5
  duel.clients[0].ps.persistant[c.PERS_DEFEND_COUNT]=6;duel.clients[0].ps.persistant[c.PERS_ASSIST_COUNT]=7;duel.clients[0].ps.persistant[c.PERS_GAUNTLET_FRAG_COUNT]=8;duel.clients[0].ps.persistant[c.PERS_CAPTURES]=9
  arenas.UpdateTournamentInfo(duel)
  checks=checks+require(duel.context.commands[0][1]=="postgame 3 0 0 4 5 6 7 8 30 1 30 23 7000 9 0 0 30 1 1 23 2 2 16","Missionpack tournament payload")

  team=setup(world,true,4);team.clients[0].team=c.TEAM_RED;team.teamScores[c.TEAM_RED]=7;team.teamScores[c.TEAM_BLUE]=5;team.clients[0].ps.persistant[c.PERS_KILLED]=1
  arenas.UpdateTournamentInfo(team)
  checks=checks+require(team.context.commands[0][1]=="postgame 3 0 0 0 0 0 0 0 30 0 7 5 7000 0 0 0 30 1 0 23 2 0 16","Missionpack team scores and perfect gate")

  podium=setup(world,false,2);podium.entities[1].r.svFlags=0;podium.intermission_origin=[100.0,200.0,300.0];podium.intermission_angle=[0.0,90.0,0.0]
  arenas.SpawnModelsOnVictoryPads(podium)
  checks=checks+require(podium.podium1!=void and podium.podium2!=void and podium.podium1.think!=void,"C facade podium callbacks")
  podium.time=9000;arenas.CelebrateStart(podium,podium.podium1);checks=checks+require(podium.podium1.nextthink==11294 and podium.podium1.think!=void,"celebration timer")
  arenas.Svcmd_AbortPodium_f(podium,[]);checks=checks+require(podium.podium1.nextthink==9000 and podium.podium1.think!=void,"abort podium")
  return checks
end function
function main(args) world=cm.loadWorld(fs.readAllBytes(args[0]),true);checks=contracts(world);print("PASS: "+str(checks)+" complete g_arenas contracts");return 0 end function
