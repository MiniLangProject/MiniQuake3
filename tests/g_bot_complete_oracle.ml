// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_bot as bot
import mq3.qcommon.cvar as cv
import mq3.compat.textnumbers as numbers
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.collision.world as cm
import std.fs as fs

function consoleCommand(level,mode,text) print("cmd:"+str(mode)+":"+text); return void end function
function main(args)
  world=cm.loadWorld(fs.readAllBytes(args[0]),true);level=game.create(world);spawn.create(level,"")
  level.consoleCommandFn=consoleCommand;cv.set2(level.spawner.cvars,"test"," -12.75junk",true)
  print("value:"+numbers.fixed2(bot.trap_Cvar_VariableValue(level,"test"))+"\n")
  bot.PlayerIntroSound(level,"sarge/default")
  bot.PlayerIntroSound(level,"models/players/visor/blue")
  bot.PlayerIntroSound(level,"major")
  return 0
end function
