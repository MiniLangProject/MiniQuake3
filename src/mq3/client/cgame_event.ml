// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/cgame/cg_event.c.  Effects are represented as
// boundary actions so the retail cgame QVM and this observer never emit twice.
package mq3.client.cgame_event
import mq3.game.trajectory as trajectory

const EV_EVENT_BITS=0x300
const EF_PLAYER_EVENT=0x10
const EF_KAMIKAZE=0x00100000
const ET_EVENTS=13
const RANK_TIED_FLAG=0x4000
const MAX_CLIENTS=64
const STEP_TIME=200
const MAX_STEP_CHANGE=32.0
const CHAN_AUTO=0
const CHAN_VOICE=2
const CHAN_ITEM=3
const CHAN_BODY=4

struct Action boundary kind entity channel parm origin origin2 weapon other text dispatched end struct
struct Record serverTime sourceEntity effectiveEntity event eventParm position actions suppressed end struct
struct State previousEvents eventOnly seenTime painTime painDirection time predictedClient demoPlayback follow noPredict synchronous stepTime stepChange landTime landChange itemPickup itemPickupTime itemPickupBlendTime weaponSelect weaponSelectTime powerupActive powerupTime records audio render hud stateActions errors decoded dispatched suppressed end struct

function create(maxEntities)
  return State(array(maxEntities,0),array(maxEntities,false),array(maxEntities,0),array(maxEntities,-1000000),array(maxEntities,0),0,0,false,false,false,false,0,0.0,0,0,0,0,0,0,0,0,0,[],[],[],[],[],[],0,0,0)
end function

function action(boundary,kind,entity,channel,parm,origin,origin2,weapon,other,text,dispatched)
  return Action(boundary,kind,entity,channel,parm,origin,origin2,weapon,other,text,dispatched)
end function
function appendAction(value,result,boundary,kind,entity,channel,parm,origin,origin2,weapon,other,text,emit)
  item=action(boundary,kind,entity,channel,parm,origin,origin2,weapon,other,text,emit);result=result+[item]
  if boundary=="audio" then value.audio=value.audio+[item]
  else if boundary=="render" then value.render=value.render+[item]
  else if boundary=="hud" then value.hud=value.hud+[item]
  else value.stateActions=value.stateActions+[item] end if
  if emit then value.dispatched=value.dispatched+1 else value.suppressed=value.suppressed+1 end if
  return result
end function

// CG_PlaceString
function placeString(rank)
  prefix="";suffix="";if (rank&RANK_TIED_FLAG)!=0 then rank=rank&(~RANK_TIED_FLAG);prefix="Tied for " end if
  if rank==1 then suffix="^41st^7"
  else if rank==2 then suffix="^12nd^7"
  else if rank==3 then suffix="^33rd^7"
  else if rank==11 then suffix="11th"
  else if rank==12 then suffix="12th"
  else if rank==13 then suffix="13th"
  else if rank%10==1 then suffix=str(rank)+"st"
  else if rank%10==2 then suffix=str(rank)+"nd"
  else if rank%10==3 then suffix=str(rank)+"rd"
  else suffix=str(rank)+"th" end if
  return prefix+suffix
end function

function eventName(event)
  switch event
    case 0 return "EV_NONE" end case
    case 1 return "EV_FOOTSTEP" end case
    case 2 return "EV_FOOTSTEP_METAL" end case
    case 3 return "EV_FOOTSPLASH" end case
    case 4 return "EV_FOOTWADE" end case
    case 5 return "EV_SWIM" end case
    case 6 return "EV_STEP_4" end case
    case 7 return "EV_STEP_8" end case
    case 8 return "EV_STEP_12" end case
    case 9 return "EV_STEP_16" end case
    case 10 return "EV_FALL_SHORT" end case
    case 11 return "EV_FALL_MEDIUM" end case
    case 12 return "EV_FALL_FAR" end case
    case 13 return "EV_JUMP_PAD" end case
    case 14 return "EV_JUMP" end case
    case 15 return "EV_WATER_TOUCH" end case
    case 16 return "EV_WATER_LEAVE" end case
    case 17 return "EV_WATER_UNDER" end case
    case 18 return "EV_WATER_CLEAR" end case
    case 19 return "EV_ITEM_PICKUP" end case
    case 20 return "EV_GLOBAL_ITEM_PICKUP" end case
    case 21 return "EV_NOAMMO" end case
    case 22 return "EV_CHANGE_WEAPON" end case
    case 23 return "EV_FIRE_WEAPON" end case
    case 24 return "EV_USE_ITEM0" end case
    case 25 return "EV_USE_ITEM1" end case
    case 26 return "EV_USE_ITEM2" end case
    case 27 return "EV_USE_ITEM3" end case
    case 28 return "EV_USE_ITEM4" end case
    case 29 return "EV_USE_ITEM5" end case
    case 30 return "EV_USE_ITEM6" end case
    case 31 return "EV_USE_ITEM7" end case
    case 32 return "EV_USE_ITEM8" end case
    case 33 return "EV_USE_ITEM9" end case
    case 34 return "EV_USE_ITEM10" end case
    case 35 return "EV_USE_ITEM11" end case
    case 36 return "EV_USE_ITEM12" end case
    case 37 return "EV_USE_ITEM13" end case
    case 38 return "EV_USE_ITEM14" end case
    case 39 return "EV_USE_ITEM15" end case
    case 40 return "EV_ITEM_RESPAWN" end case
    case 41 return "EV_ITEM_POP" end case
    case 42 return "EV_PLAYER_TELEPORT_IN" end case
    case 43 return "EV_PLAYER_TELEPORT_OUT" end case
    case 44 return "EV_GRENADE_BOUNCE" end case
    case 45 return "EV_GENERAL_SOUND" end case
    case 46 return "EV_GLOBAL_SOUND" end case
    case 47 return "EV_GLOBAL_TEAM_SOUND" end case
    case 48 return "EV_BULLET_HIT_FLESH" end case
    case 49 return "EV_BULLET_HIT_WALL" end case
    case 50 return "EV_MISSILE_HIT" end case
    case 51 return "EV_MISSILE_MISS" end case
    case 52 return "EV_MISSILE_MISS_METAL" end case
    case 53 return "EV_RAILTRAIL" end case
    case 54 return "EV_SHOTGUN" end case
    case 55 return "EV_BULLET" end case
    case 56 return "EV_PAIN" end case
    case 57 return "EV_DEATH1" end case
    case 58 return "EV_DEATH2" end case
    case 59 return "EV_DEATH3" end case
    case 60 return "EV_OBITUARY" end case
    case 61 return "EV_POWERUP_QUAD" end case
    case 62 return "EV_POWERUP_BATTLESUIT" end case
    case 63 return "EV_POWERUP_REGEN" end case
    case 64 return "EV_GIB_PLAYER" end case
    case 65 return "EV_SCOREPLUM" end case
    case 66 return "EV_PROXIMITY_MINE_STICK" end case
    case 67 return "EV_PROXIMITY_MINE_TRIGGER" end case
    case 68 return "EV_KAMIKAZE" end case
    case 69 return "EV_OBELISKEXPLODE" end case
    case 70 return "EV_OBELISKPAIN" end case
    case 71 return "EV_INVUL_IMPACT" end case
    case 72 return "EV_JUICED" end case
    case 73 return "EV_LIGHTNINGBOLT" end case
    case 74 return "EV_DEBUG_LINE" end case
    case 75 return "EV_STOPLOOPINGSOUND" end case
    case 76 return "EV_TAUNT" end case
    case 77 return "EV_TAUNT_YES" end case
    case 78 return "EV_TAUNT_NO" end case
    case 79 return "EV_TAUNT_FOLLOWME" end case
    case 80 return "EV_TAUNT_GETFLAG" end case
    case 81 return "EV_TAUNT_GUARDBASE" end case
    case 82 return "EV_TAUNT_PATROL" end case
    case default return "UNKNOWN" end case
  end switch
end function

function painSound(health)
  if health<25 then return "*pain25_1.wav" end if;if health<50 then return "*pain50_1.wav" end if;if health<75 then return "*pain75_1.wav" end if;return "*pain100_1.wav"
end function

// CG_PainEvent
function painEvent(value,entity,health,origin,emit)
  if entity<0 or entity>=len(value.painTime) then return [] end if
  if value.time-value.painTime[entity]<500 then return [] end if
  value.painTime[entity]=value.time;value.painDirection[entity]=value.painDirection[entity]^1
  return appendAction(value,[],"audio","custom:"+painSound(health),entity,CHAN_VOICE,health,origin,void,0,0,"",emit)
end function

// CG_ItemPickup
function itemPickup(value,itemNum,isWeapon,weaponTag,autoSwitch)
  value.itemPickup=itemNum;value.itemPickupTime=value.time;value.itemPickupBlendTime=value.time
  if isWeapon and autoSwitch and weaponTag!=2 then value.weaponSelectTime=value.time;value.weaponSelect=weaponTag end if
  return void
end function

// CG_Obituary is kept semantic here: the full target, attacker and means of
// death reach the HUD boundary, where configured player names/gender live.
function obituary(value,es,position,emit)
  return appendAction(value,[],"hud","obituary",es.otherEntityNum,0,es.eventParm,position,void,0,es.otherEntityNum2,"",emit)
end function

function audio(value,result,kind,entity,channel,parm,origin,emit) return appendAction(value,result,"audio",kind,entity,channel,parm,origin,void,0,0,"",emit) end function
function render(value,result,kind,es,position,emit) return appendAction(value,result,"render",kind,es.number,0,es.eventParm,position,es.origin2,es.weapon,es.otherEntityNum,"",emit) end function
function stateAction(value,result,kind,es,position,emit) return appendAction(value,result,"state",kind,es.number,0,es.eventParm,position,es.origin2,es.weapon,es.otherEntityNum,"",emit) end function

// CG_UseItem
function useItem(value,es,position,event,emit)
  itemNum=event-24;if itemNum<0 or itemNum>5 then itemNum=0 end if;result=[]
  if es.number==value.predictedClient then result=appendAction(value,result,"hud","use-item",es.number,0,itemNum,position,void,0,0,"",emit) end if
  if itemNum==0 then result=audio(value,result,"use-nothing",es.number,CHAN_BODY,itemNum,position,emit)
  else if itemNum==2 then result=audio(value,result,"medkit",es.number,CHAN_BODY,itemNum,position,emit);result=stateAction(value,result,"medkit-usage",es,position,emit)
  else if itemNum==5 then result=audio(value,result,"invulnerability-use",es.number,CHAN_BODY,itemNum,position,emit) end if
  return result
end function

// CG_EntityEvent.  Symbolic media names preserve the exact choice point; the
// active retail VM resolves them to registered handles and owns emission.
function entityEvent(value,es,entity,position,event,emit)
  result=[];client=es.clientNum;if client<0 or client>=MAX_CLIENTS then client=0 end if
  if event>=1 and event<=5 then result=audio(value,result,eventName(event),entity,CHAN_BODY,es.eventParm,position,emit)
  else if event>=6 and event<=9 then
    if client==value.predictedClient and not value.demoPlayback and not value.follow and not value.noPredict and not value.synchronous then
      delta=value.time-value.stepTime;old=0.0;if delta<STEP_TIME then old=value.stepChange*(STEP_TIME-delta)/STEP_TIME end if
      value.stepChange=old+4.0*(event-5);if value.stepChange>MAX_STEP_CHANGE then value.stepChange=MAX_STEP_CHANGE end if;value.stepTime=value.time;result=stateAction(value,result,"step-smoothing",es,position,emit)
    end if
  else if event>=10 and event<=12 then
    amount=-8;if event==11 then amount=-16 else if event==12 then amount=-24 end if
    sound="land";if event==11 then sound="custom:*pain100_1.wav" else if event==12 then sound="custom:*fall1.wav";if entity>=0 and entity<len(value.painTime) then value.painTime[entity]=value.time end if end if
    channel=CHAN_AUTO;if event==11 then channel=CHAN_VOICE end if;result=audio(value,result,sound,entity,channel,0,position,emit)
    if client==value.predictedClient then value.landChange=amount;value.landTime=value.time;result=stateAction(value,result,"land-smoothing",es,position,emit) end if
  else if event==13 then result=render(value,result,"jump-pad-smoke",es,position,emit);result=audio(value,result,"jump-pad",-1,CHAN_VOICE,0,position,emit);result=audio(value,result,"custom:*jump1.wav",entity,CHAN_VOICE,0,position,emit)
  else if event==14 then result=audio(value,result,"custom:*jump1.wav",entity,CHAN_VOICE,0,position,emit)
  else if event>=15 and event<=18 then result=audio(value,result,eventName(event),entity,CHAN_AUTO,0,position,emit)
  else if event==19 or event==20 then
    sound="item-pickup";soundEntity=entity;if event==20 then sound="global-item-pickup";soundEntity=value.predictedClient end if;result=audio(value,result,sound,soundEntity,CHAN_AUTO,es.eventParm,position,emit)
    if entity==value.predictedClient then itemPickup(value,es.eventParm,false,0,false);result=appendAction(value,result,"hud","item-pickup",entity,0,es.eventParm,position,void,0,0,"",emit) end if
  else if event==21 then if entity==value.predictedClient then result=stateAction(value,result,"out-of-ammo-change",es,position,emit) end if
  else if event==22 then result=audio(value,result,"weapon-select",entity,CHAN_AUTO,0,position,emit)
  else if event==23 then result=render(value,result,"fire-weapon",es,position,emit)
  else if event>=24 and event<=39 then result=useItem(value,es,position,event,emit)
  else if event==40 or event==41 then result=audio(value,result,"item-respawn",entity,CHAN_AUTO,0,position,emit);if event==40 then result=stateAction(value,result,"item-respawn-time",es,position,emit) end if
  else if event==42 or event==43 then sound="teleport-in";if event==43 then sound="teleport-out" end if;result=audio(value,result,sound,entity,CHAN_AUTO,0,position,emit);result=render(value,result,"spawn-effect",es,position,emit)
  else if event==44 then result=audio(value,result,"grenade-bounce",entity,CHAN_AUTO,es.eventParm,position,emit)
  else if event==45 or event==46 then sound="general-sound";soundEntity=entity;channel=CHAN_VOICE;if event==46 then sound="global-sound";soundEntity=value.predictedClient;channel=CHAN_AUTO end if;result=audio(value,result,sound,soundEntity,channel,es.eventParm,position,emit)
  else if event==47 then result=audio(value,result,"global-team-sound",value.predictedClient,CHAN_AUTO,es.eventParm,position,emit)
  else if event==48 then result=render(value,result,"bullet-hit-flesh",es,position,emit)
  else if event==49 then result=render(value,result,"bullet-hit-wall",es,position,emit)
  else if event==50 then result=render(value,result,"missile-hit-player",es,position,emit)
  else if event==51 then result=render(value,result,"missile-hit-wall",es,position,emit)
  else if event==52 then result=render(value,result,"missile-hit-metal",es,position,emit)
  else if event==53 then result=render(value,result,"rail-trail",es,position,emit);if es.eventParm!=255 then result=render(value,result,"rail-impact",es,position,emit) end if
  else if event==54 then result=render(value,result,"shotgun-fire",es,position,emit)
  else if event==55 then value.errors=value.errors+["Unknown event: 55"];result=stateAction(value,result,"unknown-event",es,position,emit)
  else if event==56 then if entity!=value.predictedClient then result=painEvent(value,entity,es.eventParm,position,emit) end if
  else if event>=57 and event<=59 then result=audio(value,result,"custom:*death"+str(event-56)+".wav",entity,CHAN_VOICE,0,position,emit)
  else if event==60 then result=obituary(value,es,position,emit)
  else if event>=61 and event<=63 then value.powerupActive=event-60;value.powerupTime=value.time;result=audio(value,result,eventName(event),entity,CHAN_ITEM,0,position,emit);result=stateAction(value,result,"powerup-active",es,position,emit)
  else if event==64 then if (es.eFlags&EF_KAMIKAZE)==0 then result=audio(value,result,"gib",entity,CHAN_BODY,0,position,emit) end if;result=render(value,result,"gib-player",es,position,emit)
  else if event==65 then result=appendAction(value,result,"hud","score-plum",es.otherEntityNum,0,es.time,position,void,0,0,"",emit)
  else if event==66 then result=audio(value,result,"proximity-mine-stick",entity,CHAN_AUTO,es.eventParm,position,emit)
  else if event==67 then result=audio(value,result,"proximity-mine-trigger",entity,CHAN_AUTO,0,position,emit)
  else if event>=68 and event<=73 then result=render(value,result,eventName(event),es,position,emit)
  else if event==74 then result=render(value,result,"debug-line",es,position,emit)
  else if event==75 then result=audio(value,result,"stop-looping-sound",entity,0,0,position,emit);es.loopSound=0
  else if event==76 then result=audio(value,result,"custom:*taunt.wav",entity,CHAN_VOICE,0,position,emit)
  else if event>=77 and event<=82 then result=appendAction(value,result,"hud","voice-chat",entity,0,event,position,void,0,0,eventName(event),emit)
  else value.errors=value.errors+["Unknown event: "+str(event)];result=stateAction(value,result,"unknown-event",es,position,emit) end if
  return result
end function

// CG_CheckEvents
function checkEvent(value,es,serverTime,retailActive)
  sourceEntity=es.number;if sourceEntity<0 or sourceEntity>=len(value.previousEvents) then return error(7710,"event entity number out of range") end if
  // CG_ResetEntity makes a slot eligible after EVENT_VALID_MSEC.  A visible
  // entity refreshes seenTime on every snapshot, exactly like snapShotTime.
  if value.seenTime[sourceEntity]!=0 and value.seenTime[sourceEntity]<serverTime-300 then value.previousEvents[sourceEntity]=0;value.eventOnly[sourceEntity]=false end if;value.seenTime[sourceEntity]=serverTime
  event=es.event;effectiveEntity=sourceEntity
  if es.eType>ET_EVENTS then
    if value.eventOnly[sourceEntity] then return void end if
    value.eventOnly[sourceEntity]=true;if (es.eFlags&EF_PLAYER_EVENT)!=0 then effectiveEntity=es.otherEntityNum end if;event=es.eType-ET_EVENTS
  else
    if event==value.previousEvents[sourceEntity] then return void end if
    value.previousEvents[sourceEntity]=event;if (event&(~EV_EVENT_BITS))==0 then return void end if
  end if
  event=event&(~EV_EVENT_BITS);position=trajectory.evaluate(es.pos,serverTime);if position is error then return position end if
  actions=entityEvent(value,es,effectiveEntity,position,event,not retailActive);record=Record(serverTime,sourceEntity,effectiveEntity,event,es.eventParm,position,actions,retailActive);value.records=value.records+[record];value.decoded=value.decoded+1;return record
end function

function observeSnapshot(value,snapshot,retailActive)
  if value==void or snapshot==void then return error(7710,"event observer requires state and snapshot") end if
  value.time=snapshot.serverTime;value.predictedClient=snapshot.playerState.clientNum;value.follow=(snapshot.playerState.pm_flags&0x1000)!=0
  before=len(value.records);for each es in snapshot.entities checked=checkEvent(value,es,snapshot.serverTime,retailActive);if checked is error then return checked end if end for
  return len(value.records)-before
end function

function clearBoundaryQueues(value) value.audio=[];value.render=[];value.hud=[];value.stateActions=[];return void end function
