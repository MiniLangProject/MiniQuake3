// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_bot as bot
import mq3.game.bot_registry as registry
import mq3.game.bot_clients as clients
import mq3.game.bot_population as population
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.collision.world as cm
import std.fs as fs

struct Context events end struct
function require(ok,label) if not ok then return error(499,"g_bot complete: "+label) end if;return 1 end function
function consoleCommand(level,mode,text) level.context.events=level.context.events+[str(mode)+":"+text];return void end function
function printMessage(context,text) context.events=context.events+[text];return void end function
function readFile(context,name)
  if name=="scripts/bots.txt" then return "{ name Sarge model sarge/default aifile bots/sarge_c.c }" end if
  if name=="scripts/arenas.txt" then return "{ map q3dm1 fraglimit 5 bots Sarge }" end if
  return void
end function
function listFiles(context,path,extension,capacity) return [] end function
function begin(level,slot) level.context.events=level.context.events+["begin:"+str(slot)];return void end function
function minimum(level) return void end function
function main(args)
  count=0;world=cm.loadWorld(fs.readAllBytes(args[0]),true);level=game.create(world);spawn.create(level,"")
  level.context=Context([]);level.consoleCommandFn=consoleCommand
  bot.PlayerIntroSound(level,"sarge/default");bot.PlayerIntroSound(level,"visor/red");bot.PlayerIntroSound(level,"major")
  count=count+require(level.context.events==["2:play sound/player/announce/sarge.wav\n","2:play sound/player/announce/red.wav\n","2:play sound/player/announce/major.wav\n"],"intro sound model/skin rules")
  reg=registry.create(readFile,listFiles,printMessage,level.context)
  count=count+require(len(bot.G_ParseInfos(reg,"{ a b } { c d }",1))==1,"parse facade capacity")
  bot.G_LoadBots(reg,true,"");bot.G_LoadArenas(reg,"")
  count=count+require(bot.G_GetBotInfoByName(reg,"sArGe")!=void and bot.G_GetBotInfoByNumber(reg,0)!=void and bot.G_GetArenaInfoByMap(reg,"Q3DM1")!=void,"registry facade")
  queue=clients.create();queue.clientBeginFn=begin;queue.minimumPlayersFn=minimum
  level.time=100;bot.AddBotToSpawnQueue(level,queue,7,10);count=count+require(queue.queue[0].spawnTime==110,"queue facade")
  bot.G_RemoveQueuedBotBegin(queue,7);count=count+require(queue.queue[0].spawnTime==0,"queue removal facade")
  pop=population.create(reg,queue);level.spawner.gametype=0
  count=count+require(bot.G_CountHumanPlayers(level,-1)==0 and bot.G_CountBotPlayers(level,queue,-1)==0,"count facade")
  count=count+require(bot.G_InitBots(level,pop,false,"q3dm1",true,"","") and len(reg.botInfos)==1 and len(reg.arenaInfos)==1,"init facade")
  print("PASS: "+str(count)+" g_bot complete contracts");return 0
end function
