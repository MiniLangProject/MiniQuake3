// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.ai_main as ai
import mq3.format.pk3 as pk3
import std.string as strings
function req(ok,label) if not ok then return error(7912,"ai_main retail: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if
  bots=pk3.read(archive,"scripts/bots.txt");character=pk3.read(archive,"botfiles/bots/default_c.c");team=pk3.read(archive,"botfiles/teamplay.h")
  if bots is error then return bots end if;if character is error then return character end if;if team is error then return team end if
  count=0;count=count+req(strings.indexOf(decode(bots),"{",0)>=0,"retail bot roster")
  count=count+req(strings.indexOf(decode(character),"skill 1",0)>=0,"retail character definitions")
  count=count+req(strings.indexOf(decode(team),"type \"iamteamleader\"",0)>=0,"retail team chat")
  count=count+req(ai.RemoveColorEscapeSequences("^1Sarge") == "Sarge","native command sanitation")
  count=count+req(ai.AngleDifference(5.0,355.0)==10.0,"native retail view turn")
  print("PASS: "+str(count)+" ai_main retail-backed contracts bytes="+str(len(bots)+len(character)+len(team))+"\n");return 0
end function

