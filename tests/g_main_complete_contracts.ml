// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_main as g
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.collision.world as cm
import std.fs as fs
struct ContractState prints thinks end struct
function require(value,message) if not value then return error(481,"g_main contract failed: "+message) end if;return 1 end function
function printed(level,text) level.context.prints=level.context.prints+[text];return void end function
function thought(level,ent) level.context.thinks=level.context.thinks+1;ent.count=ent.count+1;return void end function
function main(args)
  level=game.create(cm.loadWorld(fs.readAllBytes(args[0]),true));spawn.create(level,"");level.context=ContractState([],0);level.gamePrintFn=printed;count=0
  g.G_Printf(level,"value %d %s",[17,"ok"]);count=count+require(level.context.prints[0]=="value 17 ok","G_Printf formatting")
  g.Com_Printf(level,"hex %x",[255]);count=count+require(level.context.prints[1]=="hex ff","Com_Printf alias")
  count=count+require(try(g.G_Error(level,"fatal %d",[9])) is error,"G_Error raises")
  count=count+require(try(g.Com_Error(level,1,"drop %s",["x"])) is error,"Com_Error raises")
  huge="";for index=0 to 1024 huge=huge+"x" end for;count=count+require(try(g.G_Printf(level,huge,[])) is error,"diagnostic capacity")
  ent=game.initEntity(level.entities[64]);ent.nextthink=10;ent.think=thought;level.time=10;g.G_RunThink(level,ent)
  count=count+require(level.context.thinks==1 and ent.nextthink==0 and ent.count==1,"G_RunThink production body")
  level.restarted=true;runtime=g.createRuntime(level);count=count+require(g.vmMain(runtime,g.GAME_RUN_FRAME,[999])==0 and level.time==10,"vmMain frame restart guard")
  runtime.gmainArgv=["unknown"];level.dedicated=0;count=count+require(g.vmMain(runtime,g.GAME_CONSOLE_COMMAND,[])==false,"vmMain console routing")
  count=count+require(g.vmMain(runtime,999,[])==-1,"vmMain unknown export")
  count=count+require(g.ScoreIsTied(level)==false,"score path")
  count=count+require(try(g.gameCvarTable(level)) is error,"unattached cvar table rejects")
  print "PASS: "+str(count)+" g_main complete contracts";return 0
end function
