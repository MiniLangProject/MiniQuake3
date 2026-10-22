// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_chat as chat
function configured()
  s=chat.create();s.maxclients=4;s.mapTitle="q3dm17";s.players[0]=chat.createPlayer("Ranger",0,12);s.players[1]=chat.createPlayer("Sarge",0,5);s.players[2]=chat.createPlayer("Spec",chat.TEAM_SPECTATOR,99);return s
end function
function bit(value) if value then return 1 end if;return 0 end function
function main(args)
  s=configured();b=chat.createBot(0);b.score=12
  print("active|"+str(chat.numActivePlayers(s)))
  print("rank|"+str(bit(chat.isFirstInRankings(s,b)))+"|"+str(bit(chat.isLastInRankings(s,b)))+"|"+chat.firstClientInRankings(s)+"|"+chat.lastClientInRankings(s))
  print("map|"+chat.mapTitle(s))
  print("weapon|"+chat.weaponNameForMeansOfDeath(chat.MOD_GAUNTLET)+"|"+chat.weaponNameForMeansOfDeath(chat.MOD_GRENADE_SPLASH)+"|"+chat.weaponNameForMeansOfDeath(chat.MOD_BFG)+"|"+chat.weaponNameForMeansOfDeath(chat.MOD_GRAPPLE)+"|"+chat.weaponNameForMeansOfDeath(99))
  s.randomValues=[0.0,0.90];print("random|"+chat.randomWeaponName(s)+"|"+chat.randomWeaponName(s))
  value=chat.chatTime(s,b);value=value+0.0;print("time|2.0")
  return 0
end function
