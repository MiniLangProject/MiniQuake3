// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_dmq3.c movement policy and ai_dmnet.c route/goal execution.
package mq3.game.bot_navigation
import mq3.game.game_headers as headers
import mq3.shared.math as qmath
import mq3.compat.numeric as n

const ENTITYNUM_NONE=1023
const PMF_DUCKED=1
const PMF_TIME_KNOCKBACK=64
const PMF_TIME_WATERJUMP=256
const PRESENCE_NORMAL=2
const PRESENCE_CROUCH=4
const MFL_ONGROUND=2
const MFL_WATERJUMP=16
const MFL_TELEPORTED=32
const MFL_WALK=512
const MOVE_WALK=1
const ET_MOVER=4
const RSE_USETRAVELTYPE=2
const RSE_ENTERCONTENTS=4
const AREACONTENTS_MOVER=1024
const AREACONTENTS_MODELNUMSHIFT=24
const AREACONTENTS_MODELNUM=0xff000000
const TFL_BRIDGE=0x04000000
const TEAM_RED=1
const MAX_ACTIVATESTACK=8
const MAX_ACTIVATEAREAS=32
const CHARACTERISTIC_CAMPER=headers.CHARACTERISTIC_CAMPER
const CHARACTERISTIC_CROUCHER=headers.CHARACTERISTIC_CROUCHER
const LTG_TEAMHELP=1
const LTG_TEAMACCOMPANY=2
const LTG_DEFENDKEYAREA=3
const LTG_GETFLAG=4
const LTG_RUSHBASE=5
const LTG_CAMP=7
const LTG_CAMPORDER=8
const LTG_PATROL=9
const LTG_RETURNFLAG=6
const LTG_GETITEM=10
const LTG_KILL=11
const PATROL_BACK=1
const GT_CTF=4
const TFL_DEFAULT=0x011c0fbe
const INVENTORY_ROCKETLAUNCHER=headers.INVENTORY_ROCKETLAUNCHER
const INVENTORY_RAILGUN=headers.INVENTORY_RAILGUN
const INVENTORY_BFG10K=headers.INVENTORY_BFG10K
const INVENTORY_SLUGS=headers.INVENTORY_SLUGS
const INVENTORY_BFGAMMO=headers.INVENTORY_BFGAMMO
const GFL_ITEM=1
const GFL_DROPPED=4
const GFL_AIR=128
const CONTENTS_SOLID=headers.CONTENTS_SOLID
const CONTENTS_LAVA=headers.CONTENTS_LAVA
const CONTENTS_SLIME=headers.CONTENTS_SLIME
const CONTENTS_WATER=headers.CONTENTS_WATER
const CONTENTS_PLAYERCLIP=headers.CONTENTS_PLAYERCLIP

struct InitMove
  origin
  velocity
  viewoffset
  entitynum
  client
  thinktime
  orMoveflags
  presencetype
  viewangles
end struct
struct MoveResult failure blocked type flags blockentity movedir end struct
struct Route stopevent endcontents end struct
struct Goal areanum entitynum origin mins maxs iteminfo number flags end struct
struct EntityInfo origin modelindex end struct
struct LongTermEntity valid origin mins maxs angles end struct
struct Waypoint name goal next prev end struct
struct NavTrace fraction endpos startsolid end struct
struct ActivateGoal inuse time startTime justusedTime origin goal numareas areas areasdisabled nextIndex shoot weapon target end struct
struct Services
  initMoveStateFn
  moveInDirectionFn
  randomFn
  floatTimeFn
  predictRouteFn
  modelEntityFn
  getActivateGoalFn
  activationStackInUseFn
  clearActivationStackFn
  isGoingToActivateFn
  goForActivateGoalFn
  enableActivateGoalAreasFn
  areaTravelTimeFn
  enableRoutingAreaFn
  entityInfoFn
  enterActivateNodeFn
  nextBspEntityFn
  stringKeyFn
  floatKeyFn
  intKeyFn
  vectorKeyFn
  doorActivateGoalFn
  buttonActivateGoalFn
  triggerActivateGoalFn
  modelBoundsFn
  bboxAreasFn
  areaReachabilityFn
  areaContentsFn
  diagnosticFn
  characteristicFn
  aggressionFn
  nextCampSpotFn
  levelItemGoalFn
  removeAvoidGoalFn
  traceFn
  pointAreaFn
  pushGoalFn
  chooseNbgFn
  topGoalFn
  pointContentsFn
  popGoalFn
  resetAvoidGoalsFn
  carryingFlagFn
  touchingGoalFn
  itemNotVisibleFn
  swimmingFn
  setAvoidGoalTimeFn
  chooseWeaponFn
  chooseLtgFn
  resetAvoidReachFn
  entityLongTermInfoFn
  entityVisibleFn
  notifyFn
  resetLastAvoidReachFn
  gestureFn
  crouchFn
  roamGoalFn
  pointContentsEntityFn
  persistentPowerupWeaponFn
  teamFn
  flagGoalFn
  enterSeekNbgFn
  gametype
  context
end struct

function create() return Services(void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,0,void) end function
function need(callback,label) if callback==void then return error(498,"Bot navigation requires "+label) end if return callback end function

function setupForMovement(services,bot)
  state=bot.curPs
  initmove=InitMove([state.origin[0],state.origin[1],state.origin[2]],
    [state.velocity[0],state.velocity[1],state.velocity[2]],[0.0,0.0,n.f32(state.viewheight)],
    bot.entitynum,bot.client,bot.thinktime,0,PRESENCE_NORMAL,
    [bot.viewangles[0],bot.viewangles[1],bot.viewangles[2]])
  if state.groundEntityNum!=ENTITYNUM_NONE then initmove.orMoveflags=initmove.orMoveflags|MFL_ONGROUND end if
  if (state.pm_flags&PMF_TIME_KNOCKBACK)!=0 and state.pm_time>0 then initmove.orMoveflags=initmove.orMoveflags|MFL_TELEPORTED end if
  if (state.pm_flags&PMF_TIME_WATERJUMP)!=0 and state.pm_time>0 then initmove.orMoveflags=initmove.orMoveflags|MFL_WATERJUMP end if
  if (state.pm_flags&PMF_DUCKED)!=0 then initmove.presencetype=PRESENCE_CROUCH end if
  if bot.walker>0.5 then initmove.orMoveflags=initmove.orMoveflags|MFL_WALK end if
  need(services.initMoveStateFn,"BotInitMoveState")(services,bot.ms,initmove)
  return initmove
end function

function setMovedir(angles)
  if angles[0]==0.0 and angles[1]==-1.0 and angles[2]==0.0 then return [0.0,0.0,1.0] end if
  if angles[0]==0.0 and angles[1]==-2.0 and angles[2]==0.0 then return [0.0,0.0,-1.0] end if
  return qmath.AngleVectors(angles)[0]
end function

function randomMove(services,bot,moveresult)
  angle=n.fmul(need(services.randomFn,"random")(services),360.0)
  direction=setMovedir([0.0,angle,0.0])
  need(services.moveInDirectionFn,"BotMoveInDirection")(services,bot.ms,direction,400.0,MOVE_WALK)
  moveresult.failure=false;moveresult.movedir=[direction[0],direction[1],direction[2]]
  return moveresult
end function

function predictObstacles(services,bot,goal,enabled)
  if not enabled then return false end if
  now=need(services.floatTimeFn,"FloatTime")(services)
  if bot.predictobstaclesGoalareanum==goal.areanum and bot.predictobstaclesTime>n.fsub(now,6.0) then return false end if
  bot.predictobstaclesGoalareanum=goal.areanum
  bot.predictobstaclesTime=need(services.floatTimeFn,"FloatTime")(services)
  route=need(services.predictRouteFn,"AAS_PredictRoute")(services,bot.areanum,bot.origin,goal.areanum,bot.tfl,100,1000,RSE_USETRAVELTYPE|RSE_ENTERCONTENTS,AREACONTENTS_MOVER,TFL_BRIDGE,0)
  if (route.stopevent&RSE_ENTERCONTENTS)==0 or (route.endcontents&AREACONTENTS_MOVER)==0 then return false end if
  modelnum=(route.endcontents&AREACONTENTS_MODELNUM)>>AREACONTENTS_MODELNUMSHIFT
  if modelnum==0 then return false end if
  entitynum=need(services.modelEntityFn,"BotModelMinsMaxs")(services,modelnum,ET_MOVER,0)
  if entitynum==0 then return false end if
  pair=void
  if services.getActivateGoalFn!=void then pair=services.getActivateGoalFn(services,bot,entitynum) else activategoal=emptyActivateGoal();bspent=getActivateGoal(services,bot,entitynum,activategoal);pair=[bspent,activategoal] end if
  bspent=pair[0];activategoal=pair[1]
  if bspent==0 then return false end if
  if services.activationStackInUseFn!=void and not services.activationStackInUseFn(services,bot) then if services.clearActivationStackFn!=void then services.clearActivationStackFn(services,bot) end if end if
  already=false
  if services.isGoingToActivateFn!=void then already=services.isGoingToActivateFn(services,bot,activategoal.goal.entitynum) else already=isGoingToActivateEntity(services,bot,activategoal.goal.entitynum) end if
  if not already then
    if services.goForActivateGoalFn!=void then services.goForActivateGoalFn(services,bot,activategoal) else goForActivateGoal(services,bot,activategoal) end if
    return true
  end if
  if services.enableActivateGoalAreasFn!=void then services.enableActivateGoalAreasFn(services,activategoal,true) else enableActivateGoalAreas(services,activategoal,true) end if
  return false
end function

function copyGoalInto(target,source)
  target.areanum=source.areanum;target.entitynum=source.entitynum
  target.origin=[source.origin[0],source.origin[1],source.origin[2]]
  target.mins=[source.mins[0],source.mins[1],source.mins[2]];target.maxs=[source.maxs[0],source.maxs[1],source.maxs[2]]
  target.iteminfo=source.iteminfo;target.number=source.number;target.flags=source.flags
  return target
end function

function alternateRoute(services,bot,goal)
  alt=bot.altRouteGoal
  if alt!=void and alt.areanum!=0 then
    if bot.reachedAltRouteGoalTime!=0.0 then return goal end if
    travel=need(services.areaTravelTimeFn,"AAS_AreaTravelTimeToGoalArea")(services,bot.areanum,bot.origin,alt.areanum,bot.tfl)
    if travel!=0 and travel<20 then bot.reachedAltRouteGoalTime=need(services.floatTimeFn,"FloatTime")(services) end if
    copyGoalInto(goal,alt)
    return alt
  end if
  return goal
end function

function getAlternateRouteGoal(services,bot,base,redGoals,blueGoals)
  goals=blueGoals;if base==TEAM_RED then goals=redGoals end if
  count=len(goals);if count==0 then return false end if
  choice=n.trunc32(n.fmul(need(services.randomFn,"random")(services),n.f32(count)))
  if choice>=count then choice=count-1 end if
  selected=goals[choice]
  goal=Goal(selected.areanum,0,[selected.origin[0],selected.origin[1],selected.origin[2]],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,0,0)
  bot.altRouteGoal=goal;bot.reachedAltRouteGoalTime=0.0
  return true
end function

function emptyActivateGoal()
  return ActivateGoal(false,0.0,0.0,0.0,[0.0,0.0,0.0],Goal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0),0,[],false,-1,false,0,[0.0,0.0,0.0])
end function
function ensureActivateHeap(bot)
  if bot.activateGoalHeap==void then bot.activateGoalHeap=[];for index=0 to MAX_ACTIVATESTACK-1 bot.activateGoalHeap=bot.activateGoalHeap+[emptyActivateGoal()] end for end if
  return bot.activateGoalHeap
end function
function copyActivateGoal(source)
  goal=Goal(source.goal.areanum,source.goal.entitynum,[source.goal.origin[0],source.goal.origin[1],source.goal.origin[2]],[source.goal.mins[0],source.goal.mins[1],source.goal.mins[2]],[source.goal.maxs[0],source.goal.maxs[1],source.goal.maxs[2]],source.goal.iteminfo,source.goal.number,source.goal.flags)
  areas=[];for each area in source.areas areas=areas+[area] end for
  return ActivateGoal(source.inuse,source.time,source.startTime,source.justusedTime,[source.origin[0],source.origin[1],source.origin[2]],goal,source.numareas,areas,source.areasdisabled,source.nextIndex,source.shoot,source.weapon,[source.target[0],source.target[1],source.target[2]])
end function
function enableActivateGoalAreas(services,activategoal,enable)
  disabled=not enable;if activategoal.areasdisabled==disabled then return void end if
  for index=0 to activategoal.numareas-1 need(services.enableRoutingAreaFn,"AAS_EnableRoutingArea")(services,activategoal.areas[index],enable) end for
  activategoal.areasdisabled=disabled;return void
end function
function popActivateGoal(services,bot)
  ensureActivateHeap(bot);index=bot.activateStackIndex;if index<0 then return false end if
  goal=bot.activateGoalHeap[index];enableActivateGoalAreas(services,goal,true);goal.inuse=false;goal.justusedTime=need(services.floatTimeFn,"FloatTime")(services);bot.activateStackIndex=goal.nextIndex;return true
end function
function pushActivateGoal(services,bot,activategoal)
  ensureActivateHeap(bot);best=-1;besttime=n.fadd(need(services.floatTimeFn,"FloatTime")(services),9999.0)
  for index=0 to MAX_ACTIVATESTACK-1 candidate=bot.activateGoalHeap[index];if not candidate.inuse and candidate.justusedTime<besttime then besttime=candidate.justusedTime;best=index end if end for
  if best<0 then return false end if
  stored=copyActivateGoal(activategoal);stored.inuse=true;stored.nextIndex=bot.activateStackIndex;bot.activateGoalHeap[best]=stored;bot.activateStackIndex=best;return true
end function
function clearActivateGoalStack(services,bot) while bot.activateStackIndex>=0 popActivateGoal(services,bot) end while;return void end function
function isGoingToActivateEntity(services,bot,entitynum)
  ensureActivateHeap(bot);index=bot.activateStackIndex
  while index>=0 goal=bot.activateGoalHeap[index];if goal.time>=need(services.floatTimeFn,"FloatTime")(services) and goal.goal.entitynum==entitynum then return true end if;index=goal.nextIndex end while
  for index=0 to MAX_ACTIVATESTACK-1 goal=bot.activateGoalHeap[index];if goal.inuse then continue end if;if goal.goal.entitynum==entitynum and goal.justusedTime>n.fsub(need(services.floatTimeFn,"FloatTime")(services),2.0) then return true end if end for
  return false
end function
function goForActivateGoal(services,bot,activategoal)
  activategoal.inuse=true;if activategoal.time==0.0 then activategoal.time=n.fadd(need(services.floatTimeFn,"FloatTime")(services),10.0) end if
  activategoal.startTime=need(services.floatTimeFn,"FloatTime")(services);info=need(services.entityInfoFn,"BotEntityInfo")(services,activategoal.goal.entitynum);activategoal.origin=[info.origin[0],info.origin[1],info.origin[2]]
  if pushActivateGoal(services,bot,activategoal) then need(services.enterActivateNodeFn,"AIEnter_Seek_ActivateEntity")(services,bot,"BotGoForActivateGoal");return true end if
  enableActivateGoalAreas(services,activategoal,true);return false
end function

function resetActivateGoal(goal)
  fresh=emptyActivateGoal();goal.inuse=fresh.inuse;goal.time=0.0;goal.startTime=0.0;goal.justusedTime=0.0;goal.origin=[0.0,0.0,0.0];goal.goal=fresh.goal;goal.numareas=0;goal.areas=[];goal.areasdisabled=false;goal.nextIndex=-1;goal.shoot=false;goal.weapon=0;goal.target=[0.0,0.0,0.0];return goal
end function
function sameVector(a,b) return a[0]==b[0] and a[1]==b[1] and a[2]==b[2] end function
function modelIndex(text) data=bytes(text);digits=[];for index=1 to len(data)-1 digits=digits+[data[index]] end for;if len(digits)==0 then return 0 end if;return toNumber(decode(bytes(digits))) end function
function key(services,entity,name) return need(services.stringKeyFn,"AAS_ValueForBSPEpairKey")(services,entity,name) end function
function currentActivationDuplicate(services,bot,activategoal)
  if bot.activateStackIndex<0 then return false end if
  ensureActivateHeap(bot);top=bot.activateGoalHeap[bot.activateStackIndex]
  if not top.inuse or top.goal.entitynum!=activategoal.goal.entitynum then return false end if
  if top.time<=need(services.floatTimeFn,"FloatTime")(services) then return false end if
  return top.startTime<n.fsub(need(services.floatTimeFn,"FloatTime")(services),2.0)
end function
function prepareActivator(services,bot,entity,activategoal,kind)
  okay=false
  if kind==1 then okay=need(services.buttonActivateGoalFn,"BotFuncButtonActivateGoal")(services,bot,entity,activategoal)
  else okay=need(services.triggerActivateGoalFn,"BotTriggerMultipleActivateGoal")(services,bot,entity,activategoal) end if
  if not okay or currentActivationDuplicate(services,bot,activategoal) then return false end if
  if need(services.areaReachabilityFn,"AAS_AreaReachability")(services,bot.areanum) then
    enableActivateGoalAreas(services,activategoal,false)
    travel=need(services.areaTravelTimeFn,"AAS_AreaTravelTimeToGoalArea")(services,bot.areanum,bot.origin,activategoal.goal.areanum,bot.tfl)
    if travel==0 then return false end if
    activategoal.time=n.f32(need(services.floatTimeFn,"FloatTime")(services)+travel*0.01+5)
  end if
  return true
end function
function getActivateGoal(services,bot,entitynum,activategoal)
  resetActivateGoal(activategoal);info=need(services.entityInfoFn,"BotEntityInfo")(services,entitynum);model="*"+str(info.modelindex)
  entity=need(services.nextBspEntityFn,"AAS_NextBSPEntity")(services,0)
  while entity!=0 pair=key(services,entity,"model");if pair[0] and pair[1]==model then break end if;entity=services.nextBspEntityFn(services,entity) end while
  if entity==0 then if services.diagnosticFn!=void then services.diagnosticFn(services,"missing-model",model) end if return 0 end if
  classPair=key(services,entity,"classname");classname=classPair[1]
  if classname=="func_door" then
    health=need(services.floatKeyFn,"AAS_FloatForBSPEpairKey")(services,entity,"health")
    if health[0] and health[1]!=0.0 then need(services.doorActivateGoalFn,"BotFuncDoorActivateGoal")(services,bot,entity,activategoal);return entity end if
    spawn=need(services.intKeyFn,"AAS_IntForBSPEpairKey")(services,entity,"spawnflags");if (spawn[1]&1)!=0 then return 0 end if
    originPair=need(services.vectorKeyFn,"AAS_VectorForBSPEpairKey")(services,entity,"origin");doorOrigin=[0.0,0.0,0.0];if originPair[0] then doorOrigin=originPair[1] end if
    if not sameVector(doorOrigin,info.origin) then return 0 end if
    modelPair=key(services,entity,"model")
    if modelPair[0] and len(bytes(modelPair[1]))>1 then
      modelindex=modelIndex(modelPair[1])
      if modelindex!=0 then
        bounds=need(services.modelBoundsFn,"BotModelMinsMaxs")(services,modelindex,ET_MOVER,0);areas=need(services.bboxAreasFn,"AAS_BBoxAreas")(services,bounds[1],bounds[2],MAX_ACTIVATEAREAS*2)
        for pass=0 to 1
          for each area in areas
            if activategoal.numareas>=MAX_ACTIVATEAREAS then break end if
            reachable=services.areaReachabilityFn(services,area);if (pass==0 and not reachable) or (pass==1 and reachable) then continue end if
            if (need(services.areaContentsFn,"AAS_AreaInfo")(services,area)&AREACONTENTS_MOVER)!=0 then activategoal.areas=activategoal.areas+[area];activategoal.numareas=activategoal.numareas+1 end if
          end for
        end for
      end if
    end if
  end if
  if classname=="func_button" then return 0 end if
  targetPair=key(services,entity,"targetname");if not targetPair[0] then return 0 end if
  targets=array(10,"");targets[0]=targetPair[1];cursors=array(10,0);cursors[0]=services.nextBspEntityFn(services,0);depth=0
  while depth>=0 and depth<10
    candidate=cursors[depth]
    while candidate!=0
      target=key(services,candidate,"target")
      if target[0] and target[1]==targets[depth] then cursors[depth]=services.nextBspEntityFn(services,candidate);break end if
      candidate=services.nextBspEntityFn(services,candidate)
    end while
    if candidate==0 then depth=depth-1;continue end if
    candidateClass=key(services,candidate,"classname");if not candidateClass[0] then continue end if;kind=candidateClass[1]
    if kind=="func_button" then if prepareActivator(services,bot,candidate,activategoal,1) then return candidate end if;continue end if
    if kind=="trigger_multiple" then if prepareActivator(services,bot,candidate,activategoal,2) then return candidate end if;continue end if
    if kind=="func_timer" then continue end if
    if kind=="target_relay" or kind=="target_delay" then
      if depth+1>=10 then continue end if;nextTarget=key(services,candidate,"targetname")
      if nextTarget[0] then depth=depth+1;targets[depth]=nextTarget[1];cursors[depth]=services.nextBspEntityFn(services,0) end if
    end if
  end while
  return 0
end function

function goCamp(services,bot,goal)
  bot.decisionmaker=bot.client;bot.teammessageTime=0.0;bot.ltgtype=LTG_CAMP
  bot.teamGoal=Goal(goal.areanum,goal.entitynum,[goal.origin[0],goal.origin[1],goal.origin[2]],[goal.mins[0],goal.mins[1],goal.mins[2]],[goal.maxs[0],goal.maxs[1],goal.maxs[2]],goal.iteminfo,goal.number,goal.flags)
  camper=need(services.characteristicFn,"Characteristic_BFloat")(services,bot.character,CHARACTERISTIC_CAMPER,0.0,1.0)
  if camper>0.99 then bot.teamgoalTime=n.fadd(services.floatTimeFn(services),99999.0) else bot.teamgoalTime=n.f32(services.floatTimeFn(services)+120+180*camper+services.randomFn(services)*15) end if
  bot.campTime=services.floatTimeFn(services);bot.teammate=0;bot.arriveTime=1.0;return void
end function
function wantsToCamp(services,bot)
  camper=need(services.characteristicFn,"Characteristic_BFloat")(services,bot.character,CHARACTERISTIC_CAMPER,0.0,1.0);if camper<0.1 then return false end if
  if bot.ltgtype==LTG_TEAMHELP or bot.ltgtype==LTG_TEAMACCOMPANY or bot.ltgtype==LTG_DEFENDKEYAREA or bot.ltgtype==LTG_GETFLAG or bot.ltgtype==LTG_RUSHBASE or bot.ltgtype==LTG_CAMP or bot.ltgtype==LTG_CAMPORDER or bot.ltgtype==LTG_PATROL then return false end if
  if bot.campTime>services.floatTimeFn(services)-60+300*(1-camper) then return false end if
  if services.randomFn(services)>camper then bot.campTime=services.floatTimeFn(services);return false end if
  if services.aggressionFn(services,bot)<50.0 then return false end if
  if (bot.inventory[INVENTORY_ROCKETLAUNCHER]<=0 or bot.inventory[0]!=0) and (bot.inventory[INVENTORY_RAILGUN]<=0 or bot.inventory[INVENTORY_SLUGS]<10) and (bot.inventory[INVENTORY_BFG10K]<=0 or bot.inventory[INVENTORY_BFGAMMO]<10) then return false end if
  besttime=99999;cursor=0;best=void
  while true pair=services.nextCampSpotFn(services,cursor);cursor=pair[0];if cursor==0 then break end if;goal=pair[1];travel=services.areaTravelTimeFn(services,bot.areanum,bot.origin,goal.areanum,TFL_DEFAULT);if travel!=0 and travel<besttime then besttime=travel;best=goal end if end while
  if besttime>150 then return false end if;goCamp(services,bot,best);bot.ordered=false;return true
end function
function dontAvoid(services,bot,itemname)
  number=-1
  while true pair=services.levelItemGoalFn(services,number,itemname);number=pair[0];if number<0 then break end if;services.removeAvoidGoalFn(services,bot.gs,pair[1].number) end while
  return void
end function
function goForPowerups(services,bot)
  for each name in ["Quad Damage","Regeneration","Battle Suit","Speed","Invisibility"] dontAvoid(services,bot,name) end for
  bot.ltgTime=0.0;return void
end function

function getAirGoal(services,bot,goal)
  finish=[bot.origin[0],bot.origin[1],n.fadd(bot.origin[2],1000.0)];mins=[-15.0,-15.0,-2.0];maxs=[15.0,15.0,2.0]
  trace=services.traceFn(services,bot.origin,mins,maxs,finish,bot.entitynum,CONTENTS_SOLID|CONTENTS_PLAYERCLIP);trace=services.traceFn(services,trace.endpos,mins,maxs,bot.origin,bot.entitynum,CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)
  if trace.fraction>0.0 then area=services.pointAreaFn(services,trace.endpos);if area!=0 then goal.origin=[trace.endpos[0],trace.endpos[1],n.fsub(trace.endpos[2],2.0)];goal.areanum=area;goal.mins=[-15.0,-15.0,-1.0];goal.maxs=[15.0,15.0,1.0];goal.flags=GFL_AIR;goal.number=0;goal.iteminfo=0;goal.entitynum=0;return true end if end if;return false
end function
function goForAir(services,bot,tfl,ltg,range)
  if bot.lastairTime<n.fsub(services.floatTimeFn(services),6.0) then goal=Goal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0);if getAirGoal(services,bot,goal) then services.pushGoalFn(services,bot.gs,goal);return true end if;while services.chooseNbgFn(services,bot.gs,bot.origin,bot.inventory,tfl,ltg,range) pair=services.topGoalFn(services,bot.gs);goal=pair[1];if (services.pointContentsFn(services,goal.origin)&(CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA))==0 then return true end if;services.popGoalFn(services,bot.gs) end while;services.resetAvoidGoalsFn(services,bot.gs) end if;return false
end function
function nearbyGoal(services,bot,tfl,ltg,range)
  if goForAir(services,bot,tfl,ltg,range) then return true end if;if services.carryingFlagFn(services,bot) and services.areaTravelTimeFn(services,bot.areanum,bot.origin,bot.teamGoal.areanum,TFL_DEFAULT)<300 then range=50.0 end if;return services.chooseNbgFn(services,bot.gs,bot.origin,bot.inventory,tfl,ltg,range)
end function
function reachedGoal(services,bot,goal)
  if (goal.flags&GFL_ITEM)!=0 then if services.touchingGoalFn(services,bot.origin,goal) then if (goal.flags&GFL_DROPPED)==0 then services.setAvoidGoalTimeFn(services,bot.gs,goal.number,-1.0) end if;return true end if;if services.itemNotVisibleFn(services,bot.entitynum,bot.eye,bot.viewangles,goal) then return true end if;if bot.areanum==goal.areanum and bot.origin[0]>goal.origin[0]+goal.mins[0] and bot.origin[0]<goal.origin[0]+goal.maxs[0] and bot.origin[1]>goal.origin[1]+goal.mins[1] and bot.origin[1]<goal.origin[1]+goal.maxs[1] and not services.swimmingFn(services,bot.origin) then return true end if
  else if (goal.flags&GFL_AIR)!=0 then if services.touchingGoalFn(services,bot.origin,goal) or bot.lastairTime>n.fsub(services.floatTimeFn(services),1.0) then return true end if
  else if services.touchingGoalFn(services,bot.origin,goal) then return true end if;return false
end function
function getItemLongTermGoal(services,bot,tfl,goal)
  pair=services.topGoalFn(services,bot.gs);if not pair[0] then bot.ltgTime=0.0 else copyGoalInto(goal,pair[1]);if reachedGoal(services,bot,goal) then services.chooseWeaponFn(services,bot);bot.ltgTime=0.0 end if end if
  if bot.ltgTime<services.floatTimeFn(services) then services.popGoalFn(services,bot.gs);if services.chooseLtgFn(services,bot.gs,bot.origin,bot.inventory,tfl) then bot.ltgTime=n.fadd(services.floatTimeFn(services),20.0) else services.resetAvoidGoalsFn(services,bot.gs);services.resetAvoidReachFn(services,bot.ms) end if;pair=services.topGoalFn(services,bot.gs);if pair[0] then copyGoalInto(goal,pair[1]) end if;return pair[0] end if;return true
end function

function distSquared(a,b)
  x=n.fsub(a[0],b[0]);y=n.fsub(a[1],b[1]);z=n.fsub(a[2],b[2]);return n.fadd(n.fadd(n.fmul(x,x),n.fmul(y,y)),n.fmul(z,z))
end function
function notifyLongTerm(services,bot,event,target)
  if services.notifyFn!=void then services.notifyFn(services,bot,event,target) end if;return void
end function
function longTermEntity(services,entity)
  return need(services.entityLongTermInfoFn,"BotEntityInfo")(services,entity)
end function
function updateMovingTeamGoal(services,bot,entity,teamGoal)
  info=longTermEntity(services,entity)
  if info.valid then area=services.pointAreaFn(services,info.origin);if area!=0 and services.areaReachabilityFn(services,area) then teamGoal.entitynum=entity;teamGoal.areanum=area;teamGoal.origin=[info.origin[0],info.origin[1],info.origin[2]];teamGoal.mins=[-8.0,-8.0,-8.0];teamGoal.maxs=[8.0,8.0,8.0] end if end if
  return info
end function

// ai_dmnet.c BotGetLongTermGoal: common Baseq3 and CTF long-term goal policy.
function getLongTermGoal(services,bot,tfl,retreat,goal)
  now=services.floatTimeFn(services)
  if bot.ltgtype==LTG_TEAMHELP and not retreat then
    if bot.teammessageTime!=0.0 and bot.teammessageTime<now then notifyLongTerm(services,bot,"help_start",bot.teammate);bot.teammessageTime=0.0 end if
    if bot.teamgoalTime<services.floatTimeFn(services) then bot.ltgtype=0 end if
    if bot.teammatevisibleTime<n.fsub(services.floatTimeFn(services),10.0) then bot.ltgtype=0 end if
    info=longTermEntity(services,bot.teammate)
    if services.entityVisibleFn(services,bot.entitynum,bot.eye,bot.viewangles,bot.teammate) then if distSquared(info.origin,bot.origin)<10000.0 then services.resetAvoidReachFn(services,bot.ms);return false end if else bot.teammatevisibleTime=services.floatTimeFn(services) end if
    if info.valid then area=services.pointAreaFn(services,info.origin);if area!=0 and services.areaReachabilityFn(services,area) then bot.teamGoal.entitynum=bot.teammate;bot.teamGoal.areanum=area;bot.teamGoal.origin=[info.origin[0],info.origin[1],info.origin[2]];bot.teamGoal.mins=[-8.0,-8.0,-8.0];bot.teamGoal.maxs=[8.0,8.0,8.0] end if end if
    copyGoalInto(goal,bot.teamGoal);return true
  end if
  if bot.ltgtype==LTG_TEAMACCOMPANY and not retreat then
    if bot.teammessageTime!=0.0 and bot.teammessageTime<now then notifyLongTerm(services,bot,"accompany_start",bot.teammate);bot.teammessageTime=0.0 end if
    if bot.teamgoalTime<services.floatTimeFn(services) then notifyLongTerm(services,bot,"accompany_stop",bot.teammate);bot.ltgtype=0 end if
    info=longTermEntity(services,bot.teammate);visible=services.entityVisibleFn(services,bot.entitynum,bot.eye,bot.viewangles,bot.teammate)
    if visible then
      bot.teammatevisibleTime=services.floatTimeFn(services)
      if distSquared(info.origin,bot.origin)<n.fmul(bot.formationDist,bot.formationDist) then
        botinfo=longTermEntity(services,bot.entitynum)
        if botinfo.origin[2]+botinfo.maxs[2]>info.origin[2]+info.mins[2] and botinfo.origin[0]+botinfo.maxs[0]>info.origin[0]+info.mins[0]-4 and botinfo.origin[0]+botinfo.mins[0]<info.origin[0]+info.maxs[0]+4 and botinfo.origin[1]+botinfo.maxs[1]>info.origin[1]+info.mins[1]-4 and botinfo.origin[1]+botinfo.mins[1]<info.origin[1]+info.maxs[1]+4 and botinfo.origin[2]+botinfo.maxs[2]>info.origin[2]+info.mins[2]-4 and botinfo.origin[2]+botinfo.mins[2]<info.origin[2]+info.maxs[2]+4 then
          forward=qmath.AngleVectors(info.angles)[0];forward[2]=0.0;qmath.VectorNormalize(forward);back=[n.fsub(bot.origin[0],info.origin[0]),n.fsub(bot.origin[1],info.origin[1]),n.fsub(bot.origin[2],info.origin[2])];qmath.VectorNormalize(back)
          if qmath.DotProduct(forward,back)>0.7 then if services.initMoveStateFn!=void then setupForMovement(services,bot) end if;services.moveInDirectionFn(services,bot.ms,back,400.0,MOVE_WALK) end if
        end if
        if bot.attackcrouchTime<n.fsub(services.floatTimeFn(services),5.0) then croucher=services.characteristicFn(services,bot.character,CHARACTERISTIC_CROUCHER,0.0,1.0);if services.randomFn(services)<n.fmul(bot.thinktime,croucher) then bot.attackcrouchTime=n.f32(services.floatTimeFn(services)+5+croucher*15) end if end if
        if services.swimmingFn(services,bot.origin) then bot.attackcrouchTime=n.fsub(services.floatTimeFn(services),1.0) end if
        if bot.arriveTime<n.fsub(services.floatTimeFn(services),2.0) then if bot.arriveTime==0.0 then if services.gestureFn!=void then services.gestureFn(services,bot.client) end if;notifyLongTerm(services,bot,"accompany_arrive",bot.teammate);bot.arriveTime=services.floatTimeFn(services) else if bot.attackcrouchTime>services.floatTimeFn(services) then if services.crouchFn!=void then services.crouchFn(services,bot.client) end if else if services.randomFn(services)<n.fmul(bot.thinktime,0.05) and services.gestureFn!=void then services.gestureFn(services,bot.client) end if end if
        if bot.arriveTime>n.fsub(services.floatTimeFn(services),2.0) then bot.idealViewangles=qmath.vectoangles([n.fsub(info.origin[0],bot.origin[0]),n.fsub(info.origin[1],bot.origin[1]),n.fsub(info.origin[2],bot.origin[2])]);bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5)
        else if services.randomFn(services)<n.fmul(bot.thinktime,0.8) and services.roamGoalFn!=void then target=services.roamGoalFn(services,bot);bot.idealViewangles=qmath.vectoangles([n.fsub(target[0],bot.origin[0]),n.fsub(target[1],bot.origin[1]),n.fsub(target[2],bot.origin[2])]);bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5) end if
        if goForAir(services,bot,bot.tfl,bot.teamGoal,400.0) then if services.resetLastAvoidReachFn!=void then services.resetLastAvoidReachFn(services,bot.ms) end if;bot.nbgTime=n.fadd(services.floatTimeFn(services),8.0);if services.enterSeekNbgFn!=void then services.enterSeekNbgFn(services,bot,"BotLongTermGoal: go for air") end if;return false end if
        services.resetAvoidReachFn(services,bot.ms);return false
      end if
    end if
    if info.valid then area=services.pointAreaFn(services,info.origin);if area!=0 and services.areaReachabilityFn(services,area) then bot.teamGoal.entitynum=bot.teammate;bot.teamGoal.areanum=area;bot.teamGoal.origin=[info.origin[0],info.origin[1],info.origin[2]];bot.teamGoal.mins=[-8.0,-8.0,-8.0];bot.teamGoal.maxs=[8.0,8.0,8.0] end if end if
    copyGoalInto(goal,bot.teamGoal)
    if bot.teammatevisibleTime<n.fsub(services.floatTimeFn(services),60.0) then notifyLongTerm(services,bot,"accompany_cannotfind",bot.teammate);bot.ltgtype=0;bot.teammatevisibleTime=services.floatTimeFn(services) end if
    return true
  end if
  if bot.ltgtype==LTG_DEFENDKEYAREA then if services.areaTravelTimeFn(services,bot.areanum,bot.origin,bot.teamGoal.areanum,TFL_DEFAULT)>bot.defendawayRange then bot.defendawayTime=0.0 end if end if
  if bot.ltgtype==LTG_DEFENDKEYAREA and not retreat and bot.defendawayTime<services.floatTimeFn(services) then
    if bot.teammessageTime!=0.0 and bot.teammessageTime<now then notifyLongTerm(services,bot,"defend_start",bot.teamGoal.number);bot.teammessageTime=0.0 end if
    copyGoalInto(goal,bot.teamGoal);if bot.teamgoalTime<services.floatTimeFn(services) then notifyLongTerm(services,bot,"defend_stop",bot.teamGoal.number);bot.ltgtype=0 end if
    if distSquared(goal.origin,bot.origin)<4900.0 then services.resetAvoidReachFn(services,bot.ms);bot.defendawayTime=n.f32(services.floatTimeFn(services)+3+3*services.randomFn(services));if services.persistentPowerupWeaponFn!=void and services.persistentPowerupWeaponFn(services,bot) then bot.defendawayRange=100.0 else bot.defendawayRange=350.0 end if end if;return true
  end if
  if bot.ltgtype==LTG_KILL and not retreat then
    if bot.teammessageTime!=0.0 and bot.teammessageTime<now then notifyLongTerm(services,bot,"kill_start",bot.teamGoal.entitynum);bot.teammessageTime=0.0 end if
    if bot.lastKilledPlayer==bot.teamGoal.entitynum then notifyLongTerm(services,bot,"kill_done",bot.teamGoal.entitynum);bot.lastKilledPlayer=-1;bot.ltgtype=0 end if
    if bot.teamgoalTime<services.floatTimeFn(services) then bot.ltgtype=0 end if;return getItemLongTermGoal(services,bot,tfl,goal)
  end if
  if bot.ltgtype==LTG_GETITEM and not retreat then
    if bot.teammessageTime!=0.0 and bot.teammessageTime<now then notifyLongTerm(services,bot,"getitem_start",bot.teamGoal.number);bot.teammessageTime=0.0 end if;copyGoalInto(goal,bot.teamGoal)
    if bot.teamgoalTime<services.floatTimeFn(services) then bot.ltgtype=0 end if
    if services.itemNotVisibleFn(services,bot.entitynum,bot.eye,bot.viewangles,goal) then notifyLongTerm(services,bot,"getitem_notthere",bot.teamGoal.number);bot.ltgtype=0
    else if reachedGoal(services,bot,goal) then notifyLongTerm(services,bot,"getitem_gotit",bot.teamGoal.number);bot.ltgtype=0 end if;return true
  end if
  if (bot.ltgtype==LTG_CAMP or bot.ltgtype==LTG_CAMPORDER) and not retreat then
    if bot.teammessageTime!=0.0 and bot.teammessageTime<now then if bot.ltgtype==LTG_CAMPORDER then notifyLongTerm(services,bot,"camp_start",bot.teammate) end if;bot.teammessageTime=0.0 end if;copyGoalInto(goal,bot.teamGoal)
    if bot.teamgoalTime<services.floatTimeFn(services) then if bot.ltgtype==LTG_CAMPORDER then notifyLongTerm(services,bot,"camp_stop",0) end if;bot.ltgtype=0 end if
    if distSquared(goal.origin,bot.origin)<3600.0 then
      if bot.arriveTime==0.0 then if bot.ltgtype==LTG_CAMPORDER then notifyLongTerm(services,bot,"camp_arrive",bot.teammate) end if;bot.arriveTime=services.floatTimeFn(services) end if
      if services.randomFn(services)<n.fmul(bot.thinktime,0.8) and services.roamGoalFn!=void then target=services.roamGoalFn(services,bot);bot.idealViewangles=qmath.vectoangles([n.fsub(target[0],bot.origin[0]),n.fsub(target[1],bot.origin[1]),n.fsub(target[2],bot.origin[2])]);bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5) end if
      if bot.attackcrouchTime<n.fsub(services.floatTimeFn(services),5.0) then croucher=services.characteristicFn(services,bot.character,CHARACTERISTIC_CROUCHER,0.0,1.0);if services.randomFn(services)<n.fmul(bot.thinktime,croucher) then bot.attackcrouchTime=n.f32(services.floatTimeFn(services)+5+croucher*15) end if end if
      if bot.attackcrouchTime>services.floatTimeFn(services) and services.crouchFn!=void then services.crouchFn(services,bot.client) end if
      if services.swimmingFn(services,bot.origin) then bot.attackcrouchTime=n.fsub(services.floatTimeFn(services),1.0) end if
      if services.pointContentsEntityFn!=void and (services.pointContentsEntityFn(services,bot.eye,bot.entitynum)&(CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA))!=0 then if bot.ltgtype==LTG_CAMPORDER then notifyLongTerm(services,bot,"camp_stop",0) end if;if bot.lastgoalLtgtype==LTG_CAMPORDER then bot.lastgoalLtgtype=0 end if;bot.ltgtype=0 end if;services.resetAvoidReachFn(services,bot.ms);return false
    end if;return true
  end if
  if bot.ltgtype==LTG_PATROL and not retreat then
    if bot.teammessageTime!=0.0 and bot.teammessageTime<now then notifyLongTerm(services,bot,"patrol_start",0);bot.teammessageTime=0.0 end if
    if bot.curpatrolpoint==void then bot.ltgtype=0;return false end if
    if services.touchingGoalFn(services,bot.origin,bot.curpatrolpoint.goal) then if (bot.patrolflags&PATROL_BACK)!=0 then if bot.curpatrolpoint.prev!=void then bot.curpatrolpoint=bot.curpatrolpoint.prev else bot.curpatrolpoint=bot.curpatrolpoint.next;bot.patrolflags=bot.patrolflags&(~PATROL_BACK) end if else if bot.curpatrolpoint.next!=void then bot.curpatrolpoint=bot.curpatrolpoint.next else bot.curpatrolpoint=bot.curpatrolpoint.prev;bot.patrolflags=bot.patrolflags|PATROL_BACK end if end if
    if bot.teamgoalTime<services.floatTimeFn(services) then notifyLongTerm(services,bot,"patrol_stop",0);bot.ltgtype=0 end if;if bot.curpatrolpoint==void then bot.ltgtype=0;return false end if;copyGoalInto(goal,bot.curpatrolpoint.goal);return true
  end if
  if services.gametype==GT_CTF and (bot.ltgtype==LTG_GETFLAG or (bot.ltgtype==LTG_RUSHBASE and bot.rushbaseawayTime<services.floatTimeFn(services)) or bot.ltgtype==LTG_RETURNFLAG) then
    team=services.teamFn(services,bot);enemy=bot.ltgtype!=LTG_RUSHBASE;pair=services.flagGoalFn(services,team,enemy);if not pair[0] then bot.ltgtype=0;return false end if;copyGoalInto(goal,pair[1])
    if bot.ltgtype==LTG_GETFLAG then if bot.teammessageTime!=0.0 and bot.teammessageTime<services.floatTimeFn(services) then notifyLongTerm(services,bot,"captureflag_start",0);bot.teammessageTime=0.0 end if;if services.touchingGoalFn(services,bot.origin,goal) then if team==TEAM_RED then bot.blueflagstatus=1 else bot.redflagstatus=1 end if;bot.ltgtype=0 end if;if bot.teamgoalTime<services.floatTimeFn(services) then bot.ltgtype=0 end if;alternateRoute(services,bot,goal);return true end if
    if bot.ltgtype==LTG_RUSHBASE then if not services.carryingFlagFn(services,bot) then bot.ltgtype=0 end if;if bot.teamgoalTime<services.floatTimeFn(services) then bot.ltgtype=0 end if;if services.touchingGoalFn(services,bot.origin,goal) then if services.carryingFlagFn(services,bot) then services.resetAvoidReachFn(services,bot.ms);bot.rushbaseawayTime=n.f32(services.floatTimeFn(services)+5+10*services.randomFn(services)) else bot.ltgtype=0 end if end if;alternateRoute(services,bot,goal);return true end if
    if bot.teammessageTime!=0.0 and bot.teammessageTime<services.floatTimeFn(services) then notifyLongTerm(services,bot,"returnflag_start",0);bot.teammessageTime=0.0 end if;if services.touchingGoalFn(services,bot.origin,goal) or bot.teamgoalTime<services.floatTimeFn(services) then bot.ltgtype=0 end if;alternateRoute(services,bot,goal);return true
  end if
  return getItemLongTermGoal(services,bot,tfl,goal)
end function

// ai_dmnet.c BotLongTermGoal: leading policy before the LTG dispatcher.
function longTermGoal(services,bot,tfl,retreat,goal)
  if bot.leadTime>0.0 and not retreat then
    now=services.floatTimeFn(services);if bot.leadTime<now then notifyLongTerm(services,bot,"lead_stop",bot.leadTeammate);bot.leadTime=0.0;return getLongTermGoal(services,bot,tfl,retreat,goal) end if
    if bot.leadmessageTime<0.0 and -bot.leadmessageTime<services.floatTimeFn(services) then notifyLongTerm(services,bot,"followme",bot.leadTeammate);bot.leadmessageTime=services.floatTimeFn(services) end if
    info=updateMovingTeamGoal(services,bot,bot.leadTeammate,bot.leadTeamGoal)
    if services.entityVisibleFn(services,bot.entitynum,bot.eye,bot.viewangles,bot.leadTeammate) then bot.leadvisibleTime=services.floatTimeFn(services) end if
    if bot.leadvisibleTime<n.fsub(services.floatTimeFn(services),1.0) then bot.leadbackupTime=n.fadd(services.floatTimeFn(services),2.0) end if
    squared=distSquared(bot.origin,bot.leadTeamGoal.origin)
    if bot.leadbackupTime>services.floatTimeFn(services) then if bot.leadmessageTime<n.fsub(services.floatTimeFn(services),20.0) then notifyLongTerm(services,bot,"followme",bot.leadTeammate);bot.leadmessageTime=services.floatTimeFn(services) end if;if squared<10000.0 then bot.leadbackupTime=0.0 end if;copyGoalInto(goal,bot.leadTeamGoal);return true
    else if squared>250000.0 then if bot.leadmessageTime<n.fsub(services.floatTimeFn(services),20.0) then notifyLongTerm(services,bot,"followme",bot.leadTeammate);bot.leadmessageTime=services.floatTimeFn(services) end if;bot.idealViewangles=qmath.vectoangles([n.fsub(info.origin[0],bot.origin[0]),n.fsub(info.origin[1],bot.origin[1]),n.fsub(info.origin[2],bot.origin[2])]);bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5);return false end if
  end if
  return getLongTermGoal(services,bot,tfl,retreat,goal)
end function
