// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// ai_main.c server-command ingestion and bot status/configstring projection.
package mq3.game.bot_ai_commands
import mq3.game.bot_lifecycle as commandBots
import mq3.game.playerstate as ps
import mq3.shared.info as info
import mq3.game.bot_fight_state as fight
import mq3.game.bot_seek_state as seek

const CMS_NORMAL=0
const CMS_CHAT=1
const GT_CTF=4
const TEAM_RED=1
const TEAM_BLUE=2
const LTG_TEAMHELP=1
const LTG_TEAMACCOMPANY=2
const LTG_DEFENDKEYAREA=3
const LTG_GETFLAG=4
const LTG_RUSHBASE=5
const LTG_RETURNFLAG=6
const LTG_CAMP=7
const LTG_CAMPORDER=8
const LTG_PATROL=9
const LTG_GETITEM=10
const LTG_KILL=11
const LTG_HARVEST=12
const LTG_ATTACKENEMYBASE=13
const MAX_NODESWITCHES=50

struct Services
  lifecycleState
  frameLevel
  maxclients
  gametype
  resetInputFn
  getClientStateFn
  nextServerCommandFn
  queueMessageFn
  deathmatchSetupFn
  diagnosticFn
  clientNameFn
  easyClientNameFn
  goalNameFn
  topGoalNumberFn
  carryingFlagFn
  teamFn
  getPlayerConfigFn
  setBotInfoFn
  printFn
  fightServices
  seekServices
  nodeStepFn
  context
end struct
function create(state)
  return Services(state,void,64,0,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,battleNodeStep,void)
end function
function battleNodeStep(services,bot)
  if services.seekServices!=void then return seek.runNode(services.seekServices,bot) end if
  if services.fightServices==void then return error(499,"Bot AI battle services are not configured") end if
  return fight.runNode(services.fightServices,bot)
end function
function removeColorEscapeSequences(text)
  source=bytes(text);output=[];index=0
  while index<len(source)
    value=source[index]
    if value==94 and index+1<len(source) and source[index+1]!=0 and source[index+1]!=94 then index=index+2;continue end if
    // MSVC uses signed char: 0x80..0xff do not compare greater than 0x7e.
    if value==127 then index=index+1;continue end if
    output=output+[value];index=index+1
  end while
  return decode(bytes(output))
end function
function unquote(text)
  data=bytes(text);if len(data)<2 then return "" end if
  output=[];for index=1 to len(data)-2 output=output+[data[index]] end for;return decode(bytes(output))
end function
function runNodes(services,bot)
  if bot.aiNode==0 then return true end if
  if services.nodeStepFn==void then return error(499,"Bot AI node has no dispatcher: "+str(bot.aiNode)) end if
  for index=0 to MAX_NODESWITCHES-1
    if services.nodeStepFn(services,bot) then return true end if
    if not bot.inuse then return true end if
  end for
  return error(499,"Bot switched more than "+str(MAX_NODESWITCHES)+" AI nodes")
end function
function botAI(services,client,thinktime)
  services.resetInputFn(services,client)
  bot=services.lifecycleState.botstates[client]
  if bot==void or not bot.inuse then if services.diagnosticFn!=void then services.diagnosticFn(services,client) end if return false end if
  pair=services.getClientStateFn(services,client);if pair[0] then bot.curPs=pair[1] else bot.curPs=ps.create() end if
  while true
    command=services.nextServerCommandFn(services,client);if command==void then break end if
    data=bytes(command);split=-1;for index=0 to len(data)-1 if data[index]==32 then split=index;break end if end for
    if split<0 then continue end if
    nameBytes=[];for index=0 to split-1 nameBytes=nameBytes+[data[index]] end for
    argBytes=[];for index=split+1 to len(data)-1 argBytes=argBytes+[data[index]] end for
    name=decode(bytes(nameBytes));args=removeColorEscapeSequences(decode(bytes(argBytes)))
    if name=="print" then services.queueMessageFn(services,bot.cs,CMS_NORMAL,unquote(args))
    else if name=="chat" or name=="tchat" then services.queueMessageFn(services,bot.cs,CMS_CHAT,unquote(args)) end if
  end while
  services.deathmatchSetupFn(services);return runNodes(services,bot)
end function
function pad20(text) result=text;while len(bytes(result))<20 result=result+" " end while;return result end function
function action(services,bot,roamingGoal)
  if bot.ltgtype==LTG_TEAMHELP then return "helping "+services.easyClientNameFn(services,bot.teammate) end if
  if bot.ltgtype==LTG_TEAMACCOMPANY then return "accompanying "+services.easyClientNameFn(services,bot.teammate) end if
  if bot.ltgtype==LTG_DEFENDKEYAREA then return "defending "+services.goalNameFn(services,bot.teamgoalNumber) end if
  if bot.ltgtype==LTG_GETITEM then return "getting item "+services.goalNameFn(services,bot.teamgoalNumber) end if
  if bot.ltgtype==LTG_KILL then return "killing "+services.clientNameFn(services,bot.teamgoalEntitynum) end if
  if bot.ltgtype==LTG_CAMP or bot.ltgtype==LTG_CAMPORDER then return "camping" end if
  if bot.ltgtype==LTG_PATROL then return "patrolling" end if
  if bot.ltgtype==LTG_GETFLAG then return "capturing flag" end if
  if bot.ltgtype==LTG_RUSHBASE then return "rushing base" end if
  if bot.ltgtype==LTG_RETURNFLAG then return "returning flag" end if
  if bot.ltgtype==LTG_ATTACKENEMYBASE then return "attacking the enemy base" end if
  if bot.ltgtype==LTG_HARVEST then return "harvesting" end if
  return "roaming "+services.goalNameFn(services,roamingGoal)
end function
function leader(services,bot) if services.clientNameFn(services,bot.client)==bot.teamleader then return "L" end if return " " end function
function carrying(services,bot,colored)
  if services.gametype!=GT_CTF or not services.carryingFlagFn(services,bot) then return "  " end if
  if not colored then return "F " end if
  if services.teamFn(services,bot)==TEAM_RED then return "^1F " end if return "^4F "
end function
function setInfoConfigString(services,bot)
  top=services.topGoalNumberFn(services,bot.gs);value="l\\"+leader(services,bot)+"\\c\\"+carrying(services,bot,false)+"\\a\\"+action(services,bot,top)
  services.setBotInfoFn(services,bot.client,value);return value
end function
function updateInfoConfigStrings(services)
  count=0;limit=services.maxclients;if limit>64 then limit=64 end if
  for index=0 to limit-1
    bot=services.lifecycleState.botstates[index];if bot==void or not bot.inuse then continue end if
    value=services.getPlayerConfigFn(services,index);if value=="" or info.value(value,"n")=="" then continue end if
    setInfoConfigString(services,bot);count=count+1
  end for
  return count
end function
function reportStatus(services,bot)
  top=services.topGoalNumberFn(services,bot.gs);name=services.clientNameFn(services,bot.client)
  line=pad20(name)+leader(services,bot)+carrying(services,bot,true)+": "+action(services,bot,top)+"\n"
  services.printFn(services,line);return line
end function
function teamplayReport(services)
  services.printFn(services,"^1RED\n");limit=services.maxclients;if limit>64 then limit=64 end if
  for index=0 to limit-1 bot=services.lifecycleState.botstates[index];if bot==void or not bot.inuse then continue end if;value=services.getPlayerConfigFn(services,index);if value!="" and info.value(value,"n")!="" and toNumber(info.value(value,"t"))==TEAM_RED then reportStatus(services,bot) end if end for
  services.printFn(services,"^4BLUE\n")
  for index=0 to limit-1 bot=services.lifecycleState.botstates[index];if bot==void or not bot.inuse then continue end if;value=services.getPlayerConfigFn(services,index);if value!="" and info.value(value,"n")!="" and toNumber(info.value(value,"t"))==TEAM_BLUE then reportStatus(services,bot) end if end for
  return void
end function
