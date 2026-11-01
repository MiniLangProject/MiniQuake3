// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_cmds as cmds
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.server.client_command_dispatch as serverDispatch
import mq3.collision.world as cm
import std.fs as fs
import std.string as strings

struct Context commands logs prints end struct
struct Bridge runtime clientNum end struct
function require(ok,label) if not ok then return error(499,"g_cmds contract: "+label) end if;return 1 end function
function send(level,slot,text) level.context.commands=level.context.commands+[[slot,text]];return void end function
function log(level,text) level.context.logs=level.context.logs+[text];return void end function
function commandDiagnostic(level,text) level.context.prints=level.context.prints+[text];return void end function
function serverGame(host,clientState,parser)
  return cmds.ClientCommandState(host.context.runtime,host.context.clientNum,parser)
end function
function setup(world)
  level=game.create(world);state=spawn.create(level,"");state.gametype=0
  level.context=Context([],[],[]);level.serverCommandFn=send;level.gameLogFn=log;level.gamePrintFn=commandDiagnostic
  level.maxclients=1;level.maxclientsCvar=1;level.numConnectedClients=1;level.numPlayingClients=1;level.sortedClients[0]=0;level.time=61000;level.cheats=1
  ent=game.initEntity(level.entities[0]);game.bindClient(level,ent,level.clients[0]);ent.client.connected=2;ent.client.team=c.TEAM_FREE;ent.client.netname="Ranger";ent.client.ps.clientNum=0
  ent.client.ps.stats[c.STAT_MAX_HEALTH]=100;ent.client.ps.stats[c.STAT_HEALTH]=75;ent.health=75;ent.s.origin=[1.0,2.0,3.0]
  return level
end function
function contracts(world)
  count=0;level=setup(world);ent=level.entities[0];runtime=cmds.createRuntime(level)
  count=count+require(cmds.ConcatArgs(["say","hello","arena"],1)=="hello arena","ConcatArgs facade")
  count=count+require(cmds.SanitizeString("^1RaNGeR") == "^1ranger","name sanitizer facade")
  cmds.ClientCommandText(runtime,0,"where")
  count=count+require(len(level.context.commands)==1 and level.context.commands[0][0]==0 and level.context.commands[0][1]=="print \"(1 2 3)\n\"","raw server command reaches QAGame")
  cmds.ClientCommandText(runtime,0,"say \"hello arena\"")
  count=count+require(len(level.context.logs)==1 and level.context.logs[0]=="say: Ranger: hello arena\n","shared tokenizer preserves quoted argv")
  count=count+require(len(level.context.commands)==2 and strings.indexOf(level.context.commands[1][1],"hello arena",0)>=0,"chat delivery integrated")
  cmds.ClientCommandText(runtime,0,"god")
  count=count+require((ent.flags&0x10)!=0 and level.context.commands[2][1]=="print \"godmode ON\n\"","cheat dispatch integrated")
  count=count+require(cmds.ClientCommand(level,0,["stats"])==void,"direct GAME_CLIENT_COMMAND entry")
  cmds.Cmd_Score_f(level,ent)
  count=count+require(strings.indexOf(level.context.commands[3][1],"scores 1 0 0 0 0",0)==0,"scoreboard facade")
  count=count+require(cmds.ClientNumberFromString(level,ent,"0")==0,"client lookup facade")
  level.cheats=0
  count=count+require(not cmds.CheatsOk(level,ent) and strings.indexOf(level.context.commands[4][1],"Cheats are not enabled",0)>=0,"cheat denial facade")
  level.cheats=1;host=serverDispatch.services();host.context=Bridge(runtime,0);host.gameFn=serverGame
  route=serverDispatch.execute(host,ent,"notarget",true,serverDispatch.SS_GAME)
  count=count+require(route=="game" and (ent.flags&0x20)!=0,"SV client command to native QAGame bridge")
  return count
end function
function main(argv)
  world=cm.loadWorld(fs.readAllBytes(argv[0]),true);count=contracts(world)
  print("PASS: "+str(count)+" g_cmds complete contracts");return 0
end function
