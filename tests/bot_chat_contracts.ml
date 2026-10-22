// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_chat as chat
function req(value,label) if not value then return error(499,"ai_chat contract: "+label) end if;return 1 end function
function setup()
  s=chat.create();s.mapTitle="q3dm1";s.players[0]=chat.createPlayer("Ranger",0,10);s.players[1]=chat.createPlayer("Sarge",0,5);s.players[2]=chat.createPlayer("Crash",0,20);return s
end function
function bot() b=chat.createBot(0);b.score=10;return b end function
function contracts()
  n=0;s=setup();b=bot();n=n+req(chat.numActivePlayers(s)==3,"active players");n=n+req(not chat.isFirstInRankings(s,b) and not chat.isLastInRankings(s,b),"ranking comparisons");n=n+req(chat.firstClientInRankings(s)=="Crash" and chat.lastClientInRankings(s)=="Sarge","ranking names")
  s.randomValues=[0.9];n=n+req(chat.randomOpponentName(s,b)=="Sarge","C decrement opponent selection")
  n=n+req(chat.mapTitle(s)=="q3dm1","map title");n=n+req(chat.weaponNameForMeansOfDeath(chat.MOD_ROCKET_SPLASH)=="Rocket Launcher" and chat.weaponNameForMeansOfDeath(999)=="[unknown weapon]","weapon names")
  s.randomValues=[0.99];s.randomIndex=0;n=n+req(chat.randomWeaponName(s)=="BFG10K","base random weapon");s.missionpack=true;s.randomValues=[0.85];s.randomIndex=0;n=n+req(chat.randomWeaponName(s)=="Proximity Launcher","missionpack random weapon")
  b.inventory[chat.INVENTORY_QUAD]=1;n=n+req(not chat.validChatPosition(s,b),"powerup position gate");b.inventory[chat.INVENTORY_QUAD]=0;s.pointBelow=chat.CONTENTS_LAVA;n=n+req(not chat.validChatPosition(s,b),"lava gate");s.pointBelow=0;s.pointAbove=chat.MASK_WATER;n=n+req(not chat.validChatPosition(s,b),"water gate");b.dead=true;n=n+req(chat.validChatPosition(s,b),"dead position valid")
  s=setup();b=bot();s.entities[1].valid=true;s.entities[1].visible=1.0;n=n+req(chat.visibleEnemies(s,b),"visible enemy");s.entities[1].invisible=true;n=n+req(not chat.visibleEnemies(s,b),"invisible silent enemy");s.entities[1].shooting=true;n=n+req(chat.visibleEnemies(s,b),"invisible shooting enemy")
  s=setup();b=bot();s.fastChat=true;n=n+req(chat.chatEnterGame(s,b,false) and s.actions[0].chat=="game_enter" and b.chatto==chat.CHAT_ALL,"enter game");n=n+req(not chat.chatExitGame(s,b,false),"chat cooldown")
  s=setup();b=bot();s.fastChat=true;s.teamplay=true;n=n+req(not chat.chatStartLevel(s,b,false) and s.actions[0].kind=="ea-command","team start taunt")
  s=setup();b=bot();s.fastChat=true;b.score=20;s.players[0].score=20;n=n+req(chat.chatEndLevel(s,b,false) and s.actions[0].chat=="level_end_victory","victory chat")
  s=setup();b=bot();s.fastChat=true;b.botdeathtype=chat.MOD_WATER;b.lastkilledby=1;n=n+req(chat.chatDeath(s,b,false) and s.actions[0].chat=="death_drown","drowning chat")
  s=setup();b=bot();s.fastChat=true;b.enemydeathtype=chat.MOD_GAUNTLET;b.lastkilledplayer=1;n=n+req(chat.chatKill(s,b,false) and s.actions[0].chat=="kill_gauntlet","gauntlet kill")
  s=setup();b=bot();s.fastChat=true;b.enemy=1;n=n+req(chat.chatEnemySuicide(s,b,false) and s.actions[0].variables[0]=="Sarge","enemy suicide")
  s=setup();b=bot();s.fastChat=true;b.lasthurtClient=1;b.lasthurtMod=chat.MOD_RAILGUN;n=n+req(chat.chatHitTalking(s,b,false) and s.actions[0].variables[1]=="Shotgun","historical hit-talking MOD quirk")
  s=setup();b=bot();s.fastChat=true;b.lasthurtClient=1;b.lasthurtMod=chat.MOD_RAILGUN;b.enemy=2;n=n+req(chat.chatHitNoDeath(s,b,false) and s.actions[0].chat=="hit_nodeath","hit no death")
  s=setup();b=bot();s.fastChat=true;b.enemy=1;s.hurtMods[1]=chat.MOD_SHOTGUN;n=n+req(chat.chatHitNoKill(s,b,false) and s.actions[0].chat=="hit_nokill" and s.actions[0].variables[1]=="Shotgun","hit no kill enemy hurt MOD")
  s=setup();b=bot();s.fastChat=true;b.lastkilledplayer=1;s.randomValues=[0.0,0.0,0.0,0.0];n=n+req(chat.chatRandom(s,b,false) and s.actions[0].chat=="random_misc","random misc")
  s=setup();b=bot();s.fastChat=true;chat.chatKill(s,b,true);n=n+req(len(s.actions)==1 and not s.actions[0].dispatched,"retail host suppression")
  s=setup();b=bot();s.initialChatCounts=[["game_enter",2],["death_lava",1]];n=n+req(chat.chatTest(s,b,false)==3 and len(s.actions)==6,"chat test enumeration")
  n=n+req(chat.chatTime(s,b)==2.0,"fixed original chat time")
  return n
end function
function main(args) n=contracts();print("PASS: "+str(n)+" ai_chat contracts");return 0 end function
