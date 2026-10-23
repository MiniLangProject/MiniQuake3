// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native translation of code/game/ai_chat.c. Host observations and chat
// submission are typed so a retail QVM owner can suppress duplicate effects.
package mq3.game.bot_chat
import mq3.game.game_headers as headers
import mq3.compat.numeric as numeric

const MAX_CLIENTS=64
const TEAM_SPECTATOR=3
const CHAT_ALL=0
const CHAT_TEAM=1
const GT_TOURNAMENT=1
const TIME_BETWEENCHATTING=25.0
const ENTITYNUM_WORLD=1022
const LTG_TEAMHELP=1
const LTG_TEAMACCOMPANY=2
const LTG_RUSHBASE=5
const CONTENTS_LAVA=headers.CONTENTS_LAVA
const CONTENTS_SLIME=headers.CONTENTS_SLIME
const MASK_WATER=56

const MOD_UNKNOWN=0
const MOD_SHOTGUN=1
const MOD_GAUNTLET=2
const MOD_MACHINEGUN=3
const MOD_GRENADE=4
const MOD_GRENADE_SPLASH=5
const MOD_ROCKET=6
const MOD_ROCKET_SPLASH=7
const MOD_PLASMA=8
const MOD_PLASMA_SPLASH=9
const MOD_RAILGUN=10
const MOD_LIGHTNING=11
const MOD_BFG=12
const MOD_BFG_SPLASH=13
const MOD_WATER=14
const MOD_SLIME=15
const MOD_LAVA=16
const MOD_CRUSH=17
const MOD_TELEFRAG=18
const MOD_FALLING=19
const MOD_SUICIDE=20
const MOD_TARGET_LASER=21
const MOD_TRIGGER_HURT=22
// Baseq3 ends at 23. Missionpack inserts five values before its grapple (28).
const MOD_GRAPPLE=23
const MOD_NAIL=23
const MOD_CHAINGUN=24
const MOD_PROXIMITY_MINE=25
const MOD_KAMIKAZE=26
const MOD_JUICED=27
const MOD_MISSIONPACK_GRAPPLE=28

const INVENTORY_QUAD=headers.INVENTORY_QUAD
const INVENTORY_HASTE=headers.INVENTORY_HASTE
const INVENTORY_INVISIBILITY=headers.INVENTORY_INVISIBILITY
const INVENTORY_REGEN=headers.INVENTORY_REGEN
const INVENTORY_FLIGHT=headers.INVENTORY_FLIGHT

struct Player active name team score end struct
struct Entity valid number dead invisible shooting visible end struct
struct HostAction kind client channel chat variables value dispatched end struct
struct Bot
  client entitynum character cs score lastchatTime chatto observer dead origin inventory
  eye viewangles lastkilledby lastkilledplayer enemy botdeathtype enemydeathtype botsuicide
  ltgtype thinktime lasthurtClient lasthurtMod
end struct
struct State
  players entities maxclients mapTitle teamplay gametype botNoChat fastChat now
  randomValues randomIndex characteristics pointBelow pointAbove groundEntity hurtMods
  missionpack initialChatCounts actions hostActionFn
end struct

function createPlayer(name,team,score) return Player(name!="",name,team,score) end function
function createEntity(number) return Entity(false,number,false,false,false,0.0) end function
function createBot(client)
  return Bot(client,client,client,client,0,-1000.0,CHAT_ALL,false,false,[0.0,0.0,0.0],array(64,0),[0.0,0.0,0.0],[0.0,0.0,0.0],-1,-1,-1,MOD_UNKNOWN,MOD_UNKNOWN,false,0,0.1,0,MOD_UNKNOWN)
end function
function create()
  players=[];entities=[]
  for i=0 to MAX_CLIENTS-1 players=players+[Player(false,"",TEAM_SPECTATOR,0)];entities=entities+[createEntity(i)] end for
  // Characteristic order: enter/exit, start/end, death, kill, insult,
  // hit-talking, hit-no-death, hit-no-kill, random, misc, CPM.
  return State(players,entities,MAX_CLIENTS,"",false,0,false,false,100.0,[],0,[1.0,1.0,1.0,1.0,0.5,1.0,1.0,1.0,1.0,0.5,600.0],0,0,ENTITYNUM_WORLD,array(MAX_CLIENTS,MOD_UNKNOWN),false,[],[],void)
end function
function randomValue(state)
  if state.randomIndex<len(state.randomValues) then value=state.randomValues[state.randomIndex];state.randomIndex=state.randomIndex+1;return value end if
  return 0.0
end function
function characteristic(state,index) if index>=0 and index<len(state.characteristics) then return state.characteristics[index] end if;return 0.0 end function
function emit(state,kind,bot,channel,chat,variables,value,retailActive)
  action=HostAction(kind,bot.client,channel,chat,variables,value,not retailActive);state.actions=state.actions+[action]
  if not retailActive and state.hostActionFn!=void then state.hostActionFn(state,action) end if
  return action
end function
function initialChat(state,bot,chat,variables,retailActive) emit(state,"initial-chat",bot,bot.chatto,chat,variables,0,retailActive);return void end function
function command(state,bot,text,retailActive) emit(state,"ea-command",bot,0,text,[],0,retailActive);return void end function
function enterChat(state,bot,channel,retailActive) emit(state,"enter-chat",bot,channel,"",[],bot.cs,retailActive);return void end function
function playerActive(player) return player.active and player.name!="" and player.team!=TEAM_SPECTATOR end function
function playerName(state,client)
  if client>=0 and client<len(state.players) and state.players[client].name!="" then return state.players[client].name end if
  return ""
end function
function sameTeam(state,bot,client)
  if not state.teamplay or client<0 or client>=len(state.players) or bot.client<0 or bot.client>=len(state.players) then return false end if
  return state.players[client].team==state.players[bot.client].team
end function

// BotNumActivePlayers
function numActivePlayers(state) count=0;limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if;for i=0 to limit-1 if playerActive(state.players[i]) then count=count+1 end if end for;return count end function
// BotIsFirstInRankings
function isFirstInRankings(state,bot) for each player in state.players if playerActive(player) and bot.score<player.score then return false end if end for;return true end function
// BotIsLastInRankings
function isLastInRankings(state,bot) for each player in state.players if playerActive(player) and bot.score>player.score then return false end if end for;return true end function
// BotFirstClientInRankings
function firstClientInRankings(state) best=-999999;client=0;for i=0 to len(state.players)-1 player=state.players[i];if playerActive(player) and player.score>best then best=player.score;client=i end if end for;return playerName(state,client) end function
// BotLastClientInRankings
function lastClientInRankings(state) worst=999999;client=0;for i=0 to len(state.players)-1 player=state.players[i];if playerActive(player) and player.score<worst then worst=player.score;client=i end if end for;return playerName(state,client) end function
// BotRandomOpponentName
function randomOpponentName(state,bot)
  opponents=[];for i=0 to len(state.players)-1 if i!=bot.client and playerActive(state.players[i]) and not sameTeam(state,bot,i) then opponents=opponents+[i] end if end for
  if len(opponents)==0 then return playerName(state,0) end if
  count=numeric.trunc32(randomValue(state)*len(opponents));for i=0 to len(opponents)-1 count=count-1;if count<=0 then return playerName(state,opponents[i]) end if end for
  return playerName(state,opponents[0])
end function
// BotMapTitle
function mapTitle(state) return state.mapTitle end function
// BotWeaponNameForMeansOfDeath
function weaponNameForMeansOfDeath(mod)
  if mod==MOD_SHOTGUN then return "Shotgun" end if;if mod==MOD_GAUNTLET then return "Gauntlet" end if;if mod==MOD_MACHINEGUN then return "Machinegun" end if
  if mod==MOD_GRENADE or mod==MOD_GRENADE_SPLASH then return "Grenade Launcher" end if;if mod==MOD_ROCKET or mod==MOD_ROCKET_SPLASH then return "Rocket Launcher" end if
  if mod==MOD_PLASMA or mod==MOD_PLASMA_SPLASH then return "Plasmagun" end if;if mod==MOD_RAILGUN then return "Railgun" end if;if mod==MOD_LIGHTNING then return "Lightning Gun" end if
  if mod==MOD_BFG or mod==MOD_BFG_SPLASH then return "BFG10K" end if;if mod==MOD_GRAPPLE then return "Grapple" end if
  return "[unknown weapon]"
end function
function weaponNameForMeansOfDeathMode(mod,missionpack)
  if not missionpack then return weaponNameForMeansOfDeath(mod) end if
  if mod==MOD_NAIL then return "Nailgun" end if;if mod==MOD_CHAINGUN then return "Chaingun" end if;if mod==MOD_PROXIMITY_MINE then return "Proximity Launcher" end if
  if mod==MOD_KAMIKAZE then return "Kamikaze" end if;if mod==MOD_JUICED then return "Prox mine" end if;if mod==MOD_MISSIONPACK_GRAPPLE then return "Grapple" end if
  return weaponNameForMeansOfDeath(mod)
end function
// BotRandomWeaponName
function randomWeaponName(state)
  scale=8.9;if state.missionpack then scale=11.9 end if;rnd=numeric.trunc32(randomValue(state)*scale)
  names=["Gauntlet","Shotgun","Machinegun","Grenade Launcher","Rocket Launcher","Plasmagun","Railgun","Lightning Gun","Nailgun","Chaingun","Proximity Launcher"]
  limit=8;if state.missionpack then limit=11 end if;if rnd>=0 and rnd<limit then return names[rnd] end if;return "BFG10K"
end function
// BotVisibleEnemies
function visibleEnemies(state,bot)
  for i=0 to len(state.entities)-1 if i!=bot.client then ent=state.entities[i];if ent.valid and not ent.dead and ent.number!=bot.entitynum and (not ent.invisible or ent.shooting) and not sameTeam(state,bot,i) and ent.visible>0.0 then return true end if end if end for;return false
end function
// BotValidChatPosition
function validChatPosition(state,bot)
  if bot.dead then return true end if
  if bot.inventory[INVENTORY_QUAD]!=0 or bot.inventory[INVENTORY_HASTE]!=0 or bot.inventory[INVENTORY_INVISIBILITY]!=0 or bot.inventory[INVENTORY_REGEN]!=0 or bot.inventory[INVENTORY_FLIGHT]!=0 then return false end if
  if (state.pointBelow&(CONTENTS_LAVA|CONTENTS_SLIME))!=0 then return false end if;if (state.pointAbove&MASK_WATER)!=0 then return false end if
  return state.groundEntity==ENTITYNUM_WORLD
end function
function commonGate(state,bot,characteristicIndex,scale)
  if state.botNoChat or bot.lastchatTime>state.now-TIME_BETWEENCHATTING or state.gametype==GT_TOURNAMENT then return false end if
  if not state.fastChat and randomValue(state)>characteristic(state,characteristicIndex)*scale then return false end if
  return numActivePlayers(state)>1
end function
function finish(state,bot,chat,variables,channel,retailActive) bot.chatto=channel;initialChat(state,bot,chat,variables,retailActive);bot.lastchatTime=state.now;return true end function

// BotChat_EnterGame
function chatEnterGame(state,bot,retailActive)
  if state.teamplay or not commonGate(state,bot,0,1.0) or not validChatPosition(state,bot) then return false end if
  return finish(state,bot,"game_enter",[playerName(state,bot.client),randomOpponentName(state,bot),"[invalid var]","[invalid var]",mapTitle(state)],CHAT_ALL,retailActive)
end function
// BotChat_ExitGame
function chatExitGame(state,bot,retailActive)
  if state.teamplay or not commonGate(state,bot,0,1.0) then return false end if
  return finish(state,bot,"game_exit",[playerName(state,bot.client),randomOpponentName(state,bot),"[invalid var]","[invalid var]",mapTitle(state)],CHAT_ALL,retailActive)
end function
// BotChat_StartLevel
function chatStartLevel(state,bot,retailActive)
  if state.botNoChat or bot.observer or bot.lastchatTime>state.now-TIME_BETWEENCHATTING then return false end if
  if state.teamplay then command(state,bot,"vtaunt",retailActive);return false end if
  if state.gametype==GT_TOURNAMENT or (not state.fastChat and randomValue(state)>characteristic(state,1)) or numActivePlayers(state)<=1 then return false end if
  return finish(state,bot,"level_start",[playerName(state,bot.client)],CHAT_ALL,retailActive)
end function
// BotChat_EndLevel
function chatEndLevel(state,bot,retailActive)
  if state.botNoChat or bot.observer or bot.lastchatTime>state.now-TIME_BETWEENCHATTING then return false end if
  if state.teamplay then if isFirstInRankings(state,bot) then command(state,bot,"vtaunt",retailActive) end if;return true end if
  if state.gametype==GT_TOURNAMENT or (not state.fastChat and randomValue(state)>characteristic(state,1)) or numActivePlayers(state)<=1 then return false end if
  values=[playerName(state,bot.client),randomOpponentName(state,bot),firstClientInRankings(state),lastClientInRankings(state),mapTitle(state)];chat="level_end"
  if isFirstInRankings(state,bot) then chat="level_end_victory";values[2]="[invalid var]" else if isLastInRankings(state,bot) then chat="level_end_lose";values[3]="[invalid var]" end if
  return finish(state,bot,chat,values,CHAT_ALL,retailActive)
end function
// BotChat_Death
function chatDeath(state,bot,retailActive)
  if not commonGate(state,bot,2,1.0) then return false end if
  name="[world]";if bot.lastkilledby>=0 and bot.lastkilledby<MAX_CLIENTS then name=playerName(state,bot.lastkilledby) end if
  if state.teamplay and sameTeam(state,bot,bot.lastkilledby) then if bot.lastkilledby==bot.client then return false end if;return finish(state,bot,"death_teammate",[name],CHAT_TEAM,retailActive) end if
  if state.teamplay then command(state,bot,"vtaunt",retailActive);return true end if
  chat="";variables=[];mod=bot.botdeathtype;special=false
  if mod==MOD_WATER then chat="death_drown";variables=[randomOpponentName(state,bot)] else if mod==MOD_SLIME then chat="death_slime";variables=[randomOpponentName(state,bot)] else if mod==MOD_LAVA then chat="death_lava";variables=[randomOpponentName(state,bot)] else if mod==MOD_FALLING then chat="death_cratered";variables=[randomOpponentName(state,bot)]
  else if bot.botsuicide or mod==MOD_CRUSH or mod==MOD_SUICIDE or mod==MOD_TARGET_LASER or mod==MOD_TRIGGER_HURT or mod==MOD_UNKNOWN then chat="death_suicide";variables=[randomOpponentName(state,bot)]
  else if mod==MOD_TELEFRAG then chat="death_telefrag";variables=[name]
  else if state.missionpack and mod==MOD_KAMIKAZE and countFor(state,"death_kamikaze")>0 then chat="death_kamikaze";variables=[name]
  else
    special=(mod==MOD_GAUNTLET or mod==MOD_RAILGUN or mod==MOD_BFG or mod==MOD_BFG_SPLASH) and randomValue(state)<0.5
    if special then if mod==MOD_GAUNTLET then chat="death_gauntlet" else if mod==MOD_RAILGUN then chat="death_rail" else chat="death_bfg" end if
    else if randomValue(state)<characteristic(state,4) then chat="death_insult" else chat="death_praise" end if
    variables=[name,weaponNameForMeansOfDeathMode(mod,state.missionpack)]
  end if
  return finish(state,bot,chat,variables,CHAT_ALL,retailActive)
end function
// BotChat_Kill
function chatKill(state,bot,retailActive)
  if not commonGate(state,bot,3,1.0) or bot.lastkilledplayer==bot.client or not validChatPosition(state,bot) or visibleEnemies(state,bot) then return false end if
  name=playerName(state,bot.lastkilledplayer)
  if state.teamplay and sameTeam(state,bot,bot.lastkilledplayer) then return finish(state,bot,"kill_teammate",[name],CHAT_TEAM,retailActive) end if
  if state.teamplay then command(state,bot,"vtaunt",retailActive);return false end if
  mod=bot.enemydeathtype;chat="kill_praise";if mod==MOD_GAUNTLET then chat="kill_gauntlet" else if mod==MOD_RAILGUN then chat="kill_rail" else if mod==MOD_TELEFRAG then chat="kill_telefrag" else if state.missionpack and bot.botdeathtype==MOD_KAMIKAZE and countFor(state,"kill_kamikaze")>0 then chat="kill_kamikaze" else if randomValue(state)<characteristic(state,4) then chat="kill_insult" else chat="kill_praise" end if
  return finish(state,bot,chat,[name],CHAT_ALL,retailActive)
end function
// BotChat_EnemySuicide
function chatEnemySuicide(state,bot,retailActive)
  if state.teamplay or not commonGate(state,bot,3,1.0) or not validChatPosition(state,bot) or visibleEnemies(state,bot) then return false end if
  name="";if bot.enemy>=0 then name=playerName(state,bot.enemy) end if;return finish(state,bot,"enemy_suicide",[name],CHAT_ALL,retailActive)
end function
function entityShooting(state,index) return index>=0 and index<len(state.entities) and state.entities[index].shooting end function
// BotChat_HitTalking
function chatHitTalking(state,bot,retailActive)
  hurt=bot.lasthurtClient;if hurt==0 or hurt==bot.client or hurt<0 or hurt>=MAX_CLIENTS or state.teamplay or not commonGate(state,bot,5,0.5) or not validChatPosition(state,bot) then return false end if
  // ai_chat.c passes lasthurt_client as MOD here; preserve that historical quirk.
  return finish(state,bot,"hit_talking",[playerName(state,hurt),weaponNameForMeansOfDeathMode(hurt,state.missionpack)],CHAT_ALL,retailActive)
end function
// BotChat_HitNoDeath
function chatHitNoDeath(state,bot,retailActive)
  hurt=bot.lasthurtClient;if hurt==0 or hurt==bot.client or hurt<0 or hurt>=MAX_CLIENTS or state.teamplay or not commonGate(state,bot,6,0.5) or not validChatPosition(state,bot) or visibleEnemies(state,bot) or entityShooting(state,bot.enemy) then return false end if
  return finish(state,bot,"hit_nodeath",[playerName(state,hurt),weaponNameForMeansOfDeathMode(bot.lasthurtMod,state.missionpack)],CHAT_ALL,retailActive)
end function
// BotChat_HitNoKill
function chatHitNoKill(state,bot,retailActive)
  if state.teamplay or not commonGate(state,bot,7,0.5) or not validChatPosition(state,bot) or visibleEnemies(state,bot) or entityShooting(state,bot.enemy) then return false end if
  mod=MOD_UNKNOWN;if bot.enemy>=0 and bot.enemy<len(state.hurtMods) then mod=state.hurtMods[bot.enemy] end if
  return finish(state,bot,"hit_nokill",[playerName(state,bot.enemy),weaponNameForMeansOfDeathMode(mod,state.missionpack)],CHAT_ALL,retailActive)
end function
// BotChat_Random
function chatRandom(state,bot,retailActive)
  if state.botNoChat or bot.observer or bot.lastchatTime>state.now-TIME_BETWEENCHATTING or state.gametype==GT_TOURNAMENT or bot.ltgtype==LTG_TEAMHELP or bot.ltgtype==LTG_TEAMACCOMPANY or bot.ltgtype==LTG_RUSHBASE then return false end if
  rnd=characteristic(state,8);if randomValue(state)>bot.thinktime*0.1 then return false end if
  if not state.fastChat and (randomValue(state)>rnd or randomValue(state)>0.25) then return false end if
  if numActivePlayers(state)<=1 or not validChatPosition(state,bot) or visibleEnemies(state,bot) then return false end if
  name=playerName(state,bot.lastkilledplayer);if bot.lastkilledplayer==bot.client then name=randomOpponentName(state,bot) end if
  if state.teamplay then command(state,bot,"vtaunt",retailActive);return false end if
  chat="random_insult";if randomValue(state)<characteristic(state,9) then chat="random_misc" end if
  return finish(state,bot,chat,[randomOpponentName(state,bot),name,"[invalid var]","[invalid var]",mapTitle(state),randomWeaponName(state)],CHAT_ALL,retailActive)
end function
// BotChatTime
function chatTime(state,bot) cpm=numeric.trunc32(characteristic(state,10));if cpm<1 then cpm=1 end if;if cpm>4000 then cpm=4000 end if;cpm=cpm+bot.character-bot.character;return 2.0 end function
function countFor(state,name) for each item in state.initialChatCounts if item[0]==name then return item[1] end if end for;return 0 end function
function testVariables(state,bot,chat)
  self=playerName(state,bot.client);opponent=randomOpponentName(state,bot);mapname=mapTitle(state);killer=playerName(state,bot.lastkilledby);victim=playerName(state,bot.lastkilledplayer);hurt=playerName(state,bot.lasthurtClient)
  if chat=="game_enter" or chat=="game_exit" then return [self,opponent,"[invalid var]","[invalid var]",mapname] end if
  if chat=="level_start" then return [self] end if
  if chat=="level_end_victory" or chat=="level_end_lose" or chat=="level_end" then return [self,opponent,firstClientInRankings(state),lastClientInRankings(state),mapname] end if
  if chat=="death_gauntlet" or chat=="death_rail" or chat=="death_bfg" or chat=="death_insult" or chat=="death_praise" then return [killer,weaponNameForMeansOfDeathMode(bot.botdeathtype,state.missionpack)] end if
  if chat=="death_drown" or chat=="death_slime" or chat=="death_lava" or chat=="death_cratered" or chat=="death_suicide" or chat=="death_telefrag" then return [killer] end if
  if chat=="kill_gauntlet" or chat=="kill_rail" or chat=="kill_telefrag" or chat=="kill_insult" or chat=="kill_praise" or chat=="enemy_suicide" then return [victim] end if
  if chat=="hit_talking" or chat=="hit_nodeath" or chat=="hit_nokill" then return [hurt,weaponNameForMeansOfDeathMode(bot.lasthurtClient,state.missionpack)] end if
  if chat=="random_misc" or chat=="random_insult" then return [opponent,victim,"[invalid var]","[invalid var]",mapname,randomWeaponName(state)] end if
  return []
end function
// BotChatTest
function chatTest(state,bot,retailActive)
  types=["game_enter","game_exit","level_start","level_end_victory","level_end_lose","level_end","death_drown","death_slime","death_lava","death_cratered","death_suicide","death_telefrag","death_gauntlet","death_rail","death_bfg","death_insult","death_praise","kill_gauntlet","kill_rail","kill_telefrag","kill_insult","kill_praise","enemy_suicide","hit_talking","hit_nodeath","hit_nokill","random_misc","random_insult"]
  total=0;for each chat in types n=countFor(state,chat);if n>0 then for i=0 to n-1 initialChat(state,bot,chat,testVariables(state,bot,chat),retailActive);enterChat(state,bot,CHAT_ALL,retailActive);total=total+1 end for end if end for;return total
end function
