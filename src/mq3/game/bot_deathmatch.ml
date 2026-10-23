// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete ai_dmq3.c file adapter. Existing native combat, inventory,
// navigation and team ports remain the single implementation for their
// functions; this module supplies the remaining game-policy/lifecycle layer.
package mq3.game.bot_deathmatch
import mq3.game.game_headers as headers
import mq3.game.bot_combat_ai as combat
import mq3.game.bot_inventory_ai as inventory
import mq3.game.bot_navigation as navigation
import mq3.game.bot_team_helpers as teams
import mq3.game.bot_lifecycle as lifecycle
import mq3.game.bot_ai_commands as commands
import mq3.game.constants as c
import mq3.shared.info as info
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trig
import std.string as strings

const MAX_CLIENTS=64
const GT_TEAM=3
const GT_CTF=4
const GT_1FCTF=5
const GT_OBELISK=6
const GT_HARVESTER=7
const TEAM_RED=1
const TEAM_BLUE=2
const INVENTORY_HEALTH=headers.INVENTORY_HEALTH
const INVENTORY_TELEPORTER=headers.INVENTORY_TELEPORTER
const INVENTORY_MEDKIT=headers.INVENTORY_MEDKIT
const INVENTORY_KAMIKAZE=headers.INVENTORY_KAMIKAZE
const INVENTORY_INVULNERABILITY=headers.INVENTORY_INVULNERABILITY
const INVENTORY_ENVIRONMENTSUIT=headers.INVENTORY_ENVIRONMENTSUIT
const INVENTORY_NEUTRALFLAG=headers.INVENTORY_NEUTRALFLAG
const INVENTORY_REDCUBE=headers.INVENTORY_REDCUBE
const INVENTORY_BLUECUBE=headers.INVENTORY_BLUECUBE
const INVENTORY_SCOUT=headers.INVENTORY_SCOUT
const INVENTORY_GUARD=headers.INVENTORY_GUARD
const INVENTORY_DOUBLER=headers.INVENTORY_DOUBLER
const INVENTORY_AMMOREGEN=headers.INVENTORY_AMMOREGEN
const ET_MISSILE=3
const WP_GRENADE_LAUNCHER=4
const WP_PROX_LAUNCHER=11
const EF_DEAD=1
const EF_KAMIKAZE=0x100000
const CONTENTS_WATER=headers.CONTENTS_WATER
const CONTENTS_SLIME=headers.CONTENTS_SLIME
const CONTENTS_LAVA=headers.CONTENTS_LAVA

struct Goal number entitynum areanum origin mins maxs end struct
struct Entity number valid eType weapon flags powerups generic1 origin mins maxs contents modelindex classname event eventParm otherEntityNum otherEntityNum2 eventTime end struct
struct Waypoint name origin areanum next end struct
struct LastTask valid decisionmaker ltgtype teamgoal teammate end struct
struct Action kind client text value point dispatched end struct
struct State
  gametype missionpack maxclients mapname configs skins entities snapshotEntities bspEntities
  redFlag blueFlag neutralFlag redObelisk blueObelisk neutralObelisk
  combatServices inventoryServices navigationServices teamState commandServices
  now randomValue pointAreaFn traceAreasFn visibleFn strategyFn deathmatchFn
  waypoints lastTasks orderTimes entityEventTimes kamikazeBodies soundNames actions hostActionFn
  redAltGoals blueAltGoals setup maxBspModelIndex lastTeleportTime lastTeleportOrigin
end struct

function goal() return Goal(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
function entity(number) return Entity(number,false,0,0,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,"",0,0,0,0,0) end function
function copyGoal(value) return Goal(value.number,value.entitynum,value.areanum,value.origin+[ ],value.mins+[ ],value.maxs+[ ]) end function
function create()
  values=[];events=[];for i=0 to 1023 values=values+[entity(i)];events=events+[0] end for
  team=teams.create();combatServices=combat.create();inventoryServices=inventory.create();nav=navigation.create()
  return State(0,false,MAX_CLIENTS,"",array(MAX_CLIENTS,""),array(MAX_CLIENTS,""),values,[],[],goal(),goal(),goal(),goal(),goal(),goal(),combatServices,inventoryServices,nav,team,void,0.0,0.0,void,void,void,void,void,[],array(MAX_CLIENTS,LastTask(false,0,0,goal(),0)),array(MAX_CLIENTS,0.0),events,array(MAX_CLIENTS,0),array(256,""),[],void,[],[],false,0,0.0,[0.0,0.0,0.0])
end function
function emit(state,kind,bot,text,value,point,retailActive)
  action=Action(kind,bot.client,text,value,point,not retailActive);state.actions=state.actions+[action]
  if not retailActive and state.hostActionFn!=void then state.hostActionFn(state,action) end if;return action
end function
function sync(state) state.combatServices.gametype=state.gametype;state.teamState.gametype=state.gametype;state.teamState.maxclients=state.maxclients;state.teamState.configs=state.configs;return void end function
function teamValue(state,bot) sync(state);return teams.team(state.teamState,bot) end function
function distanceSquared(a,b) x=a[0]-b[0];y=a[1]-b[1];z=a[2]-b[2];return x*x+y*y+z*z end function

// Bot1FCTFCarryingFlag
function bot1FCTFCarryingFlag(state,bot) return state.gametype==GT_1FCTF and bot.inventory[INVENTORY_NEUTRALFLAG]>0 end function
// BotCTFCarryingFlag
function botCTFCarryingFlag(state,bot) sync(state);return combat.ctfCarryingFlag(state.combatServices,bot) end function
// BotHarvesterCarryingCubes
function botHarvesterCarryingCubes(state,bot) return state.gametype==GT_HARVESTER and (bot.inventory[INVENTORY_REDCUBE]>0 or bot.inventory[INVENTORY_BLUECUBE]>0) end function
// BotTeam, BotOppositeTeam and BotSameTeam
function botTeam(state,bot) return teamValue(state,bot) end function
function botOppositeTeam(state,bot) sync(state);return teams.oppositeTeam(state.teamState,bot) end function
function botSameTeam(state,bot,entityNumber) sync(state);return teams.sameTeam(state.teamState,bot,entityNumber) end function
// BotEnemyFlag and BotTeamFlag
function botEnemyFlag(state,bot) if teamValue(state,bot)==TEAM_RED then return state.blueFlag end if;return state.redFlag end function
function botTeamFlag(state,bot) if teamValue(state,bot)==TEAM_RED then return state.redFlag end if;return state.blueFlag end function

// Entity predicates.
function entityCarriesFlag(value) return combat.entityCarriesFlag(value) end function
function entityCarriesFlagMode(value,missionpack) return entityCarriesFlag(value) or (missionpack and (value.powerups&(1<<c.PW_NEUTRALFLAG))!=0) end function
function entityIsInvisible(value) return combat.entityIsInvisible(value) end function
function entityIsShooting(value) return combat.entityIsShooting(value) end function
function entityIsChatting(value) return combat.entityIsChatting(value) end function
function entityHasQuad(value) return combat.entityHasQuad(value) end function
function entityHasKamikaze(value) return (value.flags&EF_KAMIKAZE)!=0 end function
function entityCarriesCubes(state,value) return state.gametype==GT_HARVESTER and value.generic1>0 end function
function entityIsDead(state,value) sync(state);return teams.entityIsDead(state.teamState,value.number) end function

// BotSetUserInfo
function botSetUserInfo(state,bot,key,value,retailActive) emit(state,"userinfo",bot,key+"="+value,0,[],retailActive);return void end function
// BotRememberLastOrderedTask
function botRememberLastOrderedTask(state,bot)
  if not bot.ordered then return void end if;state.lastTasks[bot.client]=LastTask(true,bot.decisionmaker,bot.ltgtype,copyGoal(bot.teamGoal),bot.teammate);return void
end function
// BotSetTeamStatus
function botSetTeamStatus(state,bot,retailActive)
  task=0;if bot.ltgtype==2 then task=1 else if bot.ltgtype==3 then task=2 else if bot.ltgtype==4 or bot.ltgtype==12 or bot.ltgtype==13 then task=3 else if bot.ltgtype==5 then task=2 else if bot.ltgtype==6 then task=4 else if bot.ltgtype==7 or bot.ltgtype==8 then task=5 end if
  botSetUserInfo(state,bot,"teamtask",str(task),retailActive);return task
end function
// BotSetLastOrderedTask
function botSetLastOrderedTask(state,bot,retailActive)
  task=state.lastTasks[bot.client];if not task.valid or task.ltgtype==0 then return false end if
  if state.gametype==GT_CTF and task.ltgtype==6 then if (teamValue(state,bot)==TEAM_RED and bot.redflagstatus==0) or (teamValue(state,bot)==TEAM_BLUE and bot.blueflagstatus==0) then task.valid=false;state.lastTasks[bot.client]=task;return false end if end if
  bot.decisionmaker=task.decisionmaker;bot.ordered=true;bot.ltgtype=task.ltgtype;bot.teamGoal=copyGoal(task.teamgoal);bot.teammate=task.teammate;bot.teamgoalTime=state.now+300.0;botSetTeamStatus(state,bot,retailActive);return true
end function
// BotRefuseOrder
function botRefuseOrder(state,bot,retailActive) orderTime=state.orderTimes[bot.client];if bot.ordered and orderTime!=0.0 and orderTime>state.now-10.0 then emit(state,"negative",bot,"no",0,[],retailActive);state.orderTimes[bot.client]=0.0;return true end if;return false end function

function strategicGoal(state,bot,name,retreat,retailActive)
  emit(state,"strategy",bot,name,intValue(retreat),[],retailActive);if state.strategyFn!=void then state.strategyFn(state,bot,name,retreat) end if;return void
end function
function intValue(value) if value then return 1 end if;return 0 end function
function botCTFSeekGoals(state,bot,retailActive) return strategicGoal(state,bot,"ctf",false,retailActive) end function
function botCTFRetreatGoals(state,bot,retailActive) return strategicGoal(state,bot,"ctf",true,retailActive) end function
function bot1FCTFSeekGoals(state,bot,retailActive) return strategicGoal(state,bot,"oneflag",false,retailActive) end function
function bot1FCTFRetreatGoals(state,bot,retailActive) return strategicGoal(state,bot,"oneflag",true,retailActive) end function
function botObeliskSeekGoals(state,bot,retailActive) return strategicGoal(state,bot,"obelisk",false,retailActive) end function
function botObeliskRetreatGoals(state,bot,retailActive) return strategicGoal(state,bot,"obelisk",true,retailActive) end function
function botGoHarvest(state,bot,retailActive) bot.ltgtype=12;bot.teamgoalTime=state.now+120.0;return strategicGoal(state,bot,"harvest",false,retailActive) end function
function botHarvesterSeekGoals(state,bot,retailActive) return strategicGoal(state,bot,"harvester",false,retailActive) end function
function botHarvesterRetreatGoals(state,bot,retailActive) return strategicGoal(state,bot,"harvester",true,retailActive) end function
// BotTeamGoals
function botTeamGoals(state,bot,retreat,retailActive)
  if state.gametype==GT_CTF then if retreat then return botCTFRetreatGoals(state,bot,retailActive) end if;return botCTFSeekGoals(state,bot,retailActive) end if
  if state.gametype==GT_1FCTF then if retreat then return bot1FCTFRetreatGoals(state,bot,retailActive) end if;return bot1FCTFSeekGoals(state,bot,retailActive) end if
  if state.gametype==GT_OBELISK then if retreat then return botObeliskRetreatGoals(state,bot,retailActive) end if;return botObeliskSeekGoals(state,bot,retailActive) end if
  if state.gametype==GT_HARVESTER then if retreat then return botHarvesterRetreatGoals(state,bot,retailActive) end if;return botHarvesterSeekGoals(state,bot,retailActive) end if;return void
end function

// Client and string helpers.
function botPointAreaNum(state,origin) if state.pointAreaFn!=void then area=state.pointAreaFn(state,origin);if area!=0 then return area end if end if;if state.traceAreasFn!=void then values=state.traceAreasFn(state,origin,[origin[0],origin[1],origin[2]+10.0]);if len(values)>0 then return values[0] end if end if;return 0 end function
function clientName(state,client) if client<0 or client>=MAX_CLIENTS then return "[client out of range]" end if;return teams.cleanClientText(info.value(state.configs[client],"n")) end function
function clientSkin(state,client) if client<0 or client>=MAX_CLIENTS then return "[client out of range]" end if;return info.value(state.configs[client],"model") end function
function clientFromName(state,name) sync(state);return teams.clientFromName(state.teamState,name) end function
function clientOnSameTeamFromName(state,bot,name) sync(state);return teams.clientOnSameTeamFromName(state.teamState,bot,name) end function
function stristr(text,needle) return strings.indexOf(strings.toLowerAscii(text),strings.toLowerAscii(needle),0) end function
function easyClientName(state,client)
  value=clientName(state,client);value=strings.replaceAll(value," ","");left=strings.indexOf(value,"[",0);right=strings.indexOf(value,"]",0)
  if left>=0 and right>=0 then if right>left then value=strings.substr(value,0,left)+strings.substr(value,right+1,len(value)-right-1) else value=strings.substr(value,0,right)+strings.substr(value,left+1,len(value)-left-1) end if end if
  lower=strings.toLowerAscii(value);if strings.startsWith(lower,"mr") then value=strings.substr(value,2,len(value)-2) end if
  data=bytes(strings.toLowerAscii(value));kept=[];for each ch in data if (ch>=97 and ch<=122) or (ch>=48 and ch<=57) or ch==95 then kept=kept+[ch] end if end for;return decode(bytes(kept))
end function
function botSynonymContext(state,bot) context=1|2|4;if state.gametype==GT_CTF or state.gametype==GT_1FCTF then if teamValue(state,bot)==TEAM_RED then context=context|8 else context=context|16 end if end if;return context end function

// Existing native inventory/combat/navigation implementations.
function botChooseWeapon(state,bot) return inventory.chooseWeapon(state.inventoryServices,bot) end function
function botSetupForMovement(state,bot) return navigation.setupForMovement(state.navigationServices,bot) end function
function botUpdateBattleInventory(state,bot,enemy) return inventory.updateBattleInventory(state.inventoryServices,bot,enemy) end function
function botUpdateInventory(state,bot) return inventory.updateInventory(state.inventoryServices,bot) end function
function botCheckItemPickup(state,bot,oldInventory,retailActive) emit(state,"item-pickup-check",bot,"",len(oldInventory),[],retailActive);return void end function
function botBattleUseItems(state,bot,retailActive)
  used=false;if bot.inventory[INVENTORY_HEALTH]<40 and bot.inventory[INVENTORY_TELEPORTER]>0 and botCTFCarryingFlag(state,bot)==0 and not bot1FCTFCarryingFlag(state,bot) and not botHarvesterCarryingCubes(state,bot) then emit(state,"use-item",bot,"teleporter",0,[],retailActive);used=true end if
  if bot.inventory[INVENTORY_HEALTH]<60 and bot.inventory[INVENTORY_MEDKIT]>0 then emit(state,"use-item",bot,"medkit",0,[],retailActive);used=true end if;return used
end function
function botUseKamikaze(state,bot,retailActive) if bot.inventory[INVENTORY_KAMIKAZE]<=0 then return false end if;if botCTFCarryingFlag(state,bot)!=0 or bot1FCTFCarryingFlag(state,bot) or botHarvesterCarryingCubes(state,bot) then return false end if;emit(state,"use-item",bot,"kamikaze",0,[],retailActive);return true end function
function botUseInvulnerability(state,bot,retailActive) if bot.inventory[INVENTORY_INVULNERABILITY]<=0 then return false end if;emit(state,"use-item",bot,"invulnerability",0,[],retailActive);return true end function
function botSetTeleportTime(state,bot) state.combatServices.floatTimeFn=nowFn;state.combatServices.context=state;return combat.setTeleportTime(state.combatServices,bot) end function
function nowFn(services) return services.context.now end function
function botIsDead(state,bot) return combat.isDead(bot) end function
function botIsObserver(state,bot) return bot.curPs.pm_type==c.PM_SPECTATOR end function
function botIntermission(state,bot) sync(state);return combat.intermission(state.combatServices,bot) end function
function botInLavaOrSlime(state,bot) return combat.inLavaOrSlime(state.combatServices,bot) end function

// Waypoint pool/lifecycle.
function botInitWaypoints(state) state.waypoints=[];return 0 end function
function botCreateWayPoint(state,name,origin,areanum) value=Waypoint(name,origin+[ ],areanum,void);state.waypoints=[value]+state.waypoints;return value end function
function botFindWayPoint(state,waypoints,name) wanted=strings.toLowerAscii(name);for each item in waypoints if strings.toLowerAscii(item.name)==wanted then return item end if end for;return void end function
function botFreeWaypoints(state,waypoints) state.waypoints=[];return void end function
function teamPlayIsOn(state) return state.gametype>=GT_TEAM end function
function botAggression(state,bot) return combat.aggression(bot) end function
function botFeelingBad(state,bot) return combat.feelingBad(bot) end function
function botWantsToRetreat(state,bot) sync(state);return combat.wantsToRetreat(state.combatServices,bot) end function
function botWantsToChase(state,bot) sync(state);return combat.wantsToChase(state.combatServices,bot) end function
function botWantsToHelp(state,bot) return true end function
function botCanAndWantsToRocketJump(state,bot) return combat.canAndWantsToRocketJump(state.combatServices,bot) end function
function botHasPersistantPowerupAndWeapon(state,bot)
  inv=bot.inventory;if state.missionpack and inv[INVENTORY_SCOUT]==0 and inv[INVENTORY_GUARD]==0 and inv[INVENTORY_DOUBLER]==0 and inv[INVENTORY_AMMOREGEN]==0 then return false end if
  if inv[INVENTORY_HEALTH]<60 or (inv[INVENTORY_HEALTH]<80 and inv[1]<40) then return false end if
  if inv[13]>0 and inv[25]>7 then return true end if;if inv[10]>0 and inv[24]>5 then return true end if;if inv[9]>0 and inv[22]>50 then return true end if;if inv[8]>0 and inv[23]>5 then return true end if
  if state.missionpack and ((inv[15]>0 and inv[26]>5) or (inv[16]>0 and inv[27]>5) or (inv[17]>0 and inv[28]>40)) then return true end if
  return inv[11]>0 and inv[21]>20
end function
function botGoCamp(state,bot,value) return navigation.goCamp(state.navigationServices,bot,value) end function
function botWantsToCamp(state,bot) return navigation.wantsToCamp(state.navigationServices,bot) end function
function botDontAvoid(state,bot,name) return navigation.dontAvoid(state.navigationServices,bot,name) end function
function botGoForPowerups(state,bot) return navigation.goForPowerups(state.navigationServices,bot) end function
function botRoamGoal(state,bot) angle=state.randomValue*6.283185307;return [bot.origin[0]+100.0*trig.cos(angle),bot.origin[1]+100.0*trig.sin(angle),bot.origin[2]] end function
function botAttackMove(state,bot,tfl) return combat.attackMove(state.combatServices,bot,tfl) end function
function botEntityVisible(state,viewer,eye,viewangles,fov,ent) if state.visibleFn!=void then return state.visibleFn(state,viewer,eye,viewangles,fov,ent) end if;if ent>=0 and ent<len(state.entities) and state.entities[ent].valid then return 1.0 end if;return 0.0 end function
function botFindEnemy(state,bot,curenemy) return combat.findEnemy(state.combatServices,bot,curenemy) end function
function carrierVisible(state,bot,teamCarrier,cubes)
  for i=0 to state.maxclients-1 if i!=bot.client and state.entities[i].valid and botEntityVisible(state,bot.entitynum,bot.eye,bot.viewangles,360.0,i)>0.0 then same=botSameTeam(state,bot,i);carrying=entityCarriesFlagMode(state.entities[i],state.missionpack);if cubes then carrying=entityCarriesCubes(state,state.entities[i]) end if;if carrying and same==teamCarrier then return i end if end if end for;return -1
end function
function botTeamFlagCarrierVisible(state,bot) return carrierVisible(state,bot,true,false) end function
function botTeamFlagCarrier(state,bot) for i=0 to state.maxclients-1 if botSameTeam(state,bot,i) and entityCarriesFlagMode(state.entities[i],state.missionpack) then return i end if end for;return -1 end function
function botEnemyFlagCarrierVisible(state,bot) return carrierVisible(state,bot,false,false) end function
function botVisibleTeamMatesAndEnemies(state,bot,range)
  teammates=0;enemies=0;for i=0 to state.maxclients-1 if i!=bot.client and state.entities[i].valid and distanceSquared(bot.origin,state.entities[i].origin)<range*range and botEntityVisible(state,bot.entitynum,bot.eye,bot.viewangles,360.0,i)>0.0 then if botSameTeam(state,bot,i) then teammates=teammates+1 else enemies=enemies+1 end if end if end for;return [teammates,enemies]
end function
function botTeamCubeCarrierVisible(state,bot) return carrierVisible(state,bot,true,true) end function
function botEnemyCubeCarrierVisible(state,bot) return carrierVisible(state,bot,false,true) end function
function botAimAtEnemy(state,bot) return combat.aimAtEnemy(state.combatServices,bot) end function
function botCheckAttack(state,bot) return combat.checkAttack(state.combatServices,bot) end function

// Map, movers and activation.
function botMapScripts(state,bot,retailActive) if strings.toLowerAscii(state.mapname)=="q3tourney6" or strings.toLowerAscii(state.mapname)=="mpq3tourney6" then bot.tfl=bot.tfl&(~0x200000);emit(state,"map-script",bot,state.mapname,0,[],retailActive);return true end if;return false end function
function botSetMovedir(angles) return navigation.setMovedir(angles) end function
function botModelMinsMaxs(state,modelindex,eType,contents)
  for each value in state.entities if value.valid and value.modelindex==modelindex and (eType==0 or value.eType==eType) and (contents==0 or value.contents==contents) then return [value.number,[value.origin[0]+value.mins[0],value.origin[1]+value.mins[1],value.origin[2]+value.mins[2]],[value.origin[0]+value.maxs[0],value.origin[1]+value.maxs[1],value.origin[2]+value.maxs[2]]] end if end for;return [0,[0.0,0.0,0.0],[0.0,0.0,0.0]]
end function
function botFuncButtonActivateGoal(state,bot,bspent,activategoal) return navigation.getActivateGoal(state.navigationServices,bot,bspent,activategoal) end function
function botFuncDoorActivateGoal(state,bot,bspent,activategoal) return navigation.getActivateGoal(state.navigationServices,bot,bspent,activategoal) end function
function botTriggerMultipleActivateGoal(state,bot,bspent,activategoal) return navigation.getActivateGoal(state.navigationServices,bot,bspent,activategoal) end function
function botGetActivateGoal(state,bot,entitynum,activategoal) return navigation.getActivateGoal(state.navigationServices,bot,entitynum,activategoal) end function
function botPopFromActivateGoalStack(state,bot) return navigation.popActivateGoal(state.navigationServices,bot) end function
function botPushOntoActivateGoalStack(state,bot,activategoal) return navigation.pushActivateGoal(state.navigationServices,bot,activategoal) end function
function botClearActivateGoalStack(state,bot) return navigation.clearActivateGoalStack(state.navigationServices,bot) end function
function botEnableActivateGoalAreas(state,activategoal,enable) return navigation.enableActivateGoalAreas(state.navigationServices,activategoal,enable) end function
function botIsGoingToActivateEntity(state,bot,entitynum) return navigation.isGoingToActivateEntity(state.navigationServices,bot,entitynum) end function
function botGoForActivateGoal(state,bot,activategoal) return navigation.goForActivateGoal(state.navigationServices,bot,activategoal) end function
function botPrintActivateGoalInfo(state,bot,activategoal,bspent,retailActive) emit(state,"activate-info",bot,str(bspent),activategoal.goal.entitynum,activategoal.goal.origin,retailActive);return void end function
function botRandomMove(state,bot,moveresult) return navigation.randomMove(state.navigationServices,bot,moveresult) end function
function botAIBlocked(state,bot,moveresult,activate,retailActive) if not moveresult.failure then return false end if;emit(state,"blocked",bot,"",activate,moveresult.movedir,retailActive);return true end function
function botAIPredictObstacles(state,bot,value) return navigation.predictObstacles(state.navigationServices,bot,value,true) end function

// Console/snapshot event layer.
function botCheckConsoleMessages(state,bot,retailActive) emit(state,"console-check",bot,"",0,[],retailActive);return void end function
function botCheckForGrenades(state,bot,value,retailActive) if value.eType!=ET_MISSILE or value.weapon!=WP_GRENADE_LAUNCHER then return false end if;emit(state,"avoid-spot",bot,"grenade",160,value.origin,retailActive);return true end function
function botCheckForProxMines(state,bot,value,retailActive)
  if value.eType!=ET_MISSILE or value.weapon!=WP_PROX_LAUNCHER or value.generic1==teamValue(state,bot) then return false end if
  armed=(bot.inventory[11]>0 and bot.inventory[21]>0) or (bot.inventory[8]>0 and bot.inventory[23]>0) or (bot.inventory[13]>0 and bot.inventory[25]>0);if not armed then return false end if
  emit(state,"avoid-spot",bot,"proxmine",160,value.origin,retailActive);return true
end function
function botCheckForKamikazeBody(state,bot,value) if (value.flags&EF_KAMIKAZE)!=0 and (value.flags&EF_DEAD)!=0 then state.kamikazeBodies[bot.client]=value.number;return true end if;return false end function
function botCheckEvents(state,bot,value,retailActive)
  if value.number<0 or value.number>=len(state.entityEventTimes) or state.entityEventTimes[value.number]==value.eventTime then return false end if;state.entityEventTimes[value.number]=value.eventTime
  if value.event==1 then target=value.otherEntityNum;attacker=value.otherEntityNum2;if target==bot.client then bot.numDeaths=bot.numDeaths+1;emit(state,"obituary-death",bot,str(attacker),value.eventParm,[],retailActive) else if attacker==bot.client then bot.lastKilledPlayer=target;bot.killedEnemyTime=state.now;bot.numKills=bot.numKills+1;emit(state,"obituary-kill",bot,str(target),value.eventParm,[],retailActive) else if attacker==bot.enemy and target==attacker then bot.enemySuicide=true end if
  else if value.event==2 then state.lastTeleportOrigin=value.origin+[ ];state.lastTeleportTime=state.now
  else emit(state,"event",bot,"",value.event,value.origin,retailActive) end if;return true
end function
function botCheckSnapshot(state,bot,retailActive)
  emit(state,"avoid-clear",bot,"",0,[0.0,0.0,0.0],retailActive);state.kamikazeBodies[bot.client]=0;count=0
  for each value in state.snapshotEntities botCheckEvents(state,bot,value,retailActive);botCheckForGrenades(state,bot,value,retailActive);botCheckForProxMines(state,bot,value,retailActive);botCheckForKamikazeBody(state,bot,value);count=count+1 end for;return count
end function
function botCheckAir(state,bot) if bot.inventory[INVENTORY_ENVIRONMENTSUIT]<=0 and state.combatServices.pointContentsFn!=void and (state.combatServices.pointContentsFn(state.combatServices,bot.eye)&(CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA))!=0 then return false end if;bot.lastairTime=state.now;return true end function
function botAlternateRoute(state,bot,value) return navigation.alternateRoute(state.navigationServices,bot,value) end function
function botGetAlternateRouteGoal(state,bot,base) return navigation.getAlternateRouteGoal(state.navigationServices,bot,base,state.redAltGoals,state.blueAltGoals) end function
function botSetupAlternativeRouteGoals(state) state.setup=true;emit(state,"alternate-route-setup",lifecycle.createBot(0),"",0,[],true);return len(state.redAltGoals)+len(state.blueAltGoals) end function
function botDeathmatchAI(state,bot,thinktime) if state.deathmatchFn!=void then return state.deathmatchFn(state,bot,thinktime) end if;bot.thinktime=thinktime;return 0 end function

function botSetEntityNumForGoalWithModel(state,value,eType,modelname)
  wanted=0;if strings.startsWith(modelname,"*") then wanted=toNumber(strings.substr(modelname,1,len(modelname)-1)) end if
  for each ent in state.entities if ent.valid and (eType==0 or ent.eType==eType) and ent.modelindex==wanted and distanceSquared(value.origin,ent.origin)<100.0 then value.entitynum=ent.number;return ent.number end if end for;return 0
end function
function botSetEntityNumForGoal(state,value,classname)
  // Preserve the original Baseq3 condition: equal classnames are skipped.
  for each ent in state.entities if ent.valid and strings.toLowerAscii(ent.classname)!=strings.toLowerAscii(classname) and distanceSquared(value.origin,ent.origin)<100.0 then value.entitynum=ent.number;return ent.number end if end for;return 0
end function
function botGoalForBSPEntity(state,classname,value)
  for each ent in state.bspEntities if strings.toLowerAscii(ent.classname)==strings.toLowerAscii(classname) then value.origin=ent.origin+[ ];value.areanum=botPointAreaNum(state,ent.origin);return value.areanum!=0 end if end for;return false
end function
function botSetupDeathmatchAI(state,retailActive) state.setup=true;state.maxBspModelIndex=0;for each ent in state.bspEntities if ent.modelindex>state.maxBspModelIndex then state.maxBspModelIndex=ent.modelindex end if end for;botInitWaypoints(state);emit(state,"deathmatch-setup",lifecycle.createBot(0),state.mapname,state.gametype,[],retailActive);return true end function
function botShutdownDeathmatchAI(state) state.setup=false;state.redAltGoals=[];state.blueAltGoals=[];botInitWaypoints(state);return void end function

// Exact aliases for the remaining existing native implementations.
function inFieldOfVision(viewangles,fov,angles) return combat.inFieldOfVision(viewangles,fov,angles) end function
