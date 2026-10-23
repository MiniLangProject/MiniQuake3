// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native observer port of code/cgame/cg_playerstate.c.  The QVM remains the
// owner of presentation side effects; actions recorded here are parity data.
package mq3.client.cgame_playerstate
import mq3.client.cg_local as cgabi
import mq3.game.playerstate as playerstate
import mq3.shared.math as qmath
import mq3.compat.numeric as n

const STAT_HEALTH=0
const STAT_WEAPONS=2
const PERS_HITS=1
const PERS_RANK=2
const PERS_TEAM=3
const PERS_SPAWN_COUNT=4
const PERS_PLAYEREVENTS=5
const PERS_ATTACKEE_ARMOR=7
const PERS_IMPRESSIVE_COUNT=9
const PERS_EXCELLENT_COUNT=10
const PERS_DEFEND_COUNT=11
const PERS_ASSIST_COUNT=12
const PERS_GAUNTLET_FRAG_COUNT=13
const PERS_CAPTURES=14
const PW_REDFLAG=7
const PW_BLUEFLAG=8
const PW_NEUTRALFLAG=9
const WP_MACHINEGUN=2
const WP_SHOTGUN=3
const WP_GRENADE_LAUNCHER=4
const WP_ROCKET_LAUNCHER=5
const WP_RAILGUN=7
const WP_NUM_WEAPONS=11
const TEAM_SPECTATOR=3
const GT_TEAM=3
const GT_CTF=4
const PM_INTERMISSION=5
const RANK_TIED_FLAG=0x4000
const PLAYEREVENT_DENIEDREWARD=1
const PLAYEREVENT_GAUNTLETREWARD=2
const PLAYEREVENT_HOLYSHIT=4
const MAX_PS_EVENTS=2
const MAX_PREDICTED_EVENTS=cgabi.MAX_PREDICTED_EVENTS
const MAX_REWARDSTACK=cgabi.MAX_REWARDSTACK
const DAMAGE_TIME=cgabi.DAMAGE_TIME

// The integer media values are observation tags.  They intentionally do not
// call the renderer/audio traps a second time beside the real cgame QVM.
const S_NO_AMMO=1
const S_HIT=2
const S_HIT_TEAM=3
const S_CAPTURE=4
const S_IMPRESSIVE=5
const S_EXCELLENT=6
const S_HUMILIATION=7
const S_DEFEND=8
const S_ASSIST=9
const S_DENIED=10
const S_HOLYSHIT=11
const S_YOU_HAVE_FLAG=12
const S_TAKEN_LEAD=13
const S_TIED_LEAD=14
const S_LOST_LEAD=15
const S_SUDDEN_DEATH=16
const S_ONE_MINUTE=17
const S_FIVE_MINUTE=18
const S_ONE_FRAG=19
const S_TWO_FRAG=20
const S_THREE_FRAG=21
const M_CAPTURE=101
const M_IMPRESSIVE=102
const M_EXCELLENT=103
const M_GAUNTLET=104
const M_DEFEND=105
const M_ASSIST=106

struct State time serverTime gametype timelimit levelStartTime fraglimit scores1 warmup intermissionStarted mapRestart viewaxis lowAmmoWarning attackerTime damageX damageY vDmgRoll vDmgPitch damageValue vDmgTime damageTime thisFrameTeleport weaponSelectTime weaponSelect duckChange duckTime eventSequence predictableEvents rewardStack rewardSound rewardShader rewardCount timelimitWarnings fraglimitWarnings actions transitions end struct

function create()
  return State(0,0,0,0,0,0,0,0,false,false,[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],0,0,0.0,0.0,0.0,0.0,0.0,0,0,false,0,0,0,0,0,array(MAX_PREDICTED_EVENTS,0),0,array(MAX_REWARDSTACK,0),array(MAX_REWARDSTACK,0),array(MAX_REWARDSTACK,0),0,0,[],0)
end function

function emit(state,kind,a,b,c) state.actions=state.actions+[[kind,a,b,c]];return void end function
function localSound(state,sound,channel) return emit(state,"localSound",sound,channel,0) end function
function bufferedSound(state,sound) return emit(state,"bufferedSound",sound,0,0) end function

// CG_CheckAmmo
function checkAmmo(state,ps)
  weapons=ps.stats[STAT_WEAPONS];total=0
  for weapon=WP_MACHINEGUN to WP_NUM_WEAPONS-1
    if (weapons&(1<<weapon))==0 then continue end if
    if weapon==WP_ROCKET_LAUNCHER or weapon==WP_GRENADE_LAUNCHER or weapon==WP_RAILGUN or weapon==WP_SHOTGUN then total=total+ps.ammo[weapon]*1000 else total=total+ps.ammo[weapon]*200 end if
    if total>=5000 then state.lowAmmoWarning=0;return void end if
  end for
  previous=state.lowAmmoWarning;if total==0 then state.lowAmmoWarning=2 else state.lowAmmoWarning=1 end if
  if state.lowAmmoWarning!=previous then localSound(state,S_NO_AMMO,1) end if;return void
end function

// CG_DamageFeedback
function damageFeedback(state,ps,yawByte,pitchByte,damage)
  state.attackerTime=state.time;health=ps.stats[STAT_HEALTH];scale=1.0;if health>=40 then scale=n.fdiv(40.0,health) end if
  kick=n.fmul(damage,scale);if kick<5.0 then kick=5.0 end if;if kick>10.0 then kick=10.0 end if
  if yawByte==255 and pitchByte==255 then
    state.damageX=0.0;state.damageY=0.0;state.vDmgRoll=0.0;state.vDmgPitch=n.fneg(kick)
  else
    pitch=n.f32(pitchByte/255.0*360.0);yaw=n.f32(yawByte/255.0*360.0);basis=qmath.AngleVectors([pitch,yaw,0.0]);dir=[n.fneg(basis[0][0]),n.fneg(basis[0][1]),n.fneg(basis[0][2])]
    front=qmath.DotProduct(dir,state.viewaxis[0]);left=qmath.DotProduct(dir,state.viewaxis[1]);up=qmath.DotProduct(dir,state.viewaxis[2]);dist=n.fsqrt(n.fadd(n.fmul(front,front),n.fmul(left,left)));if dist<0.1 then dist=0.1 end if
    state.vDmgRoll=n.fmul(kick,left);state.vDmgPitch=n.fneg(n.fmul(kick,front));if front<=0.1 then front=0.1 end if;state.damageX=n.fdiv(n.fneg(left),front);state.damageY=n.fdiv(up,dist)
  end if
  if state.damageX>1.0 then state.damageX=1.0 end if;if state.damageX< -1.0 then state.damageX= -1.0 end if;if state.damageY>1.0 then state.damageY=1.0 end if;if state.damageY< -1.0 then state.damageY= -1.0 end if
  if kick>10.0 then kick=10.0 end if;state.damageValue=kick;state.vDmgTime=state.time+DAMAGE_TIME;state.damageTime=state.serverTime;return void
end function

// CG_Respawn
function respawn(state,ps) state.thisFrameTeleport=true;state.weaponSelectTime=state.time;state.weaponSelect=ps.weapon;emit(state,"respawn",ps.weapon,0,0);return void end function

function entityEvent(state,event,eventParm,clientNum) emit(state,"entityEvent",event,eventParm,clientNum);return void end function

// CG_CheckPlayerstateEvents
function checkPlayerstateEvents(state,ps,ops)
  if ps.externalEvent!=0 and ps.externalEvent!=ops.externalEvent then entityEvent(state,ps.externalEvent,ps.externalEventParm,ps.clientNum) end if
  for index=ps.eventSequence-MAX_PS_EVENTS to ps.eventSequence-1
    slot=index&(MAX_PS_EVENTS-1)
    if index>=ops.eventSequence or (index>ops.eventSequence-MAX_PS_EVENTS and ps.events[slot]!=ops.events[slot]) then event=ps.events[slot];entityEvent(state,event,ps.eventParms[slot],ps.clientNum);state.predictableEvents[index&(MAX_PREDICTED_EVENTS-1)]=event;state.eventSequence=state.eventSequence+1 end if
  end for;return void
end function

// CG_CheckChangedPredictableEvents
function checkChangedPredictableEvents(state,ps)
  for index=ps.eventSequence-MAX_PS_EVENTS to ps.eventSequence-1
    if index>=state.eventSequence then continue end if
    if index>state.eventSequence-MAX_PREDICTED_EVENTS then slot=index&(MAX_PS_EVENTS-1);remember=index&(MAX_PREDICTED_EVENTS-1);if ps.events[slot]!=state.predictableEvents[remember] then event=ps.events[slot];entityEvent(state,event,ps.eventParms[slot],ps.clientNum);state.predictableEvents[remember]=event;emit(state,"changedPredicted",event,index,0) end if end if
  end for;return void
end function

// pushReward
function pushReward(state,sound,shader,count)
  if state.rewardStack<MAX_REWARDSTACK-1 then state.rewardStack=state.rewardStack+1;state.rewardSound[state.rewardStack]=sound;state.rewardShader[state.rewardStack]=shader;state.rewardCount[state.rewardStack]=count end if;return void
end function

// CG_CheckLocalSounds
function checkLocalSounds(state,ps,ops)
  if ps.persistant[PERS_TEAM]!=ops.persistant[PERS_TEAM] then return void end if
  if ps.persistant[PERS_HITS]>ops.persistant[PERS_HITS] then localSound(state,S_HIT,1) else if ps.persistant[PERS_HITS]<ops.persistant[PERS_HITS] then localSound(state,S_HIT_TEAM,1) end if
  if ps.stats[STAT_HEALTH]<ops.stats[STAT_HEALTH]-1 and ps.stats[STAT_HEALTH]>0 then emit(state,"pain",ps.stats[STAT_HEALTH],0,0) end if
  if state.intermissionStarted then return void end if
  reward=false
  if ps.persistant[PERS_CAPTURES]!=ops.persistant[PERS_CAPTURES] then pushReward(state,S_CAPTURE,M_CAPTURE,ps.persistant[PERS_CAPTURES]);reward=true end if
  if ps.persistant[PERS_IMPRESSIVE_COUNT]!=ops.persistant[PERS_IMPRESSIVE_COUNT] then pushReward(state,S_IMPRESSIVE,M_IMPRESSIVE,ps.persistant[PERS_IMPRESSIVE_COUNT]);reward=true end if
  if ps.persistant[PERS_EXCELLENT_COUNT]!=ops.persistant[PERS_EXCELLENT_COUNT] then pushReward(state,S_EXCELLENT,M_EXCELLENT,ps.persistant[PERS_EXCELLENT_COUNT]);reward=true end if
  if ps.persistant[PERS_GAUNTLET_FRAG_COUNT]!=ops.persistant[PERS_GAUNTLET_FRAG_COUNT] then pushReward(state,S_HUMILIATION,M_GAUNTLET,ps.persistant[PERS_GAUNTLET_FRAG_COUNT]);reward=true end if
  if ps.persistant[PERS_DEFEND_COUNT]!=ops.persistant[PERS_DEFEND_COUNT] then pushReward(state,S_DEFEND,M_DEFEND,ps.persistant[PERS_DEFEND_COUNT]);reward=true end if
  if ps.persistant[PERS_ASSIST_COUNT]!=ops.persistant[PERS_ASSIST_COUNT] then pushReward(state,S_ASSIST,M_ASSIST,ps.persistant[PERS_ASSIST_COUNT]);reward=true end if
  if ps.persistant[PERS_PLAYEREVENTS]!=ops.persistant[PERS_PLAYEREVENTS] then
    changed=ps.persistant[PERS_PLAYEREVENTS]^ops.persistant[PERS_PLAYEREVENTS]
    if (changed&PLAYEREVENT_DENIEDREWARD)!=0 then localSound(state,S_DENIED,2) else if (changed&PLAYEREVENT_GAUNTLETREWARD)!=0 then localSound(state,S_HUMILIATION,2) else if (changed&PLAYEREVENT_HOLYSHIT)!=0 then localSound(state,S_HOLYSHIT,2) end if;reward=true
  end if
  if state.gametype>=GT_TEAM and ((ps.powerups[PW_REDFLAG]!=ops.powerups[PW_REDFLAG] and ps.powerups[PW_REDFLAG]!=0) or (ps.powerups[PW_BLUEFLAG]!=ops.powerups[PW_BLUEFLAG] and ps.powerups[PW_BLUEFLAG]!=0) or (ps.powerups[PW_NEUTRALFLAG]!=ops.powerups[PW_NEUTRALFLAG] and ps.powerups[PW_NEUTRALFLAG]!=0)) then localSound(state,S_YOU_HAVE_FLAG,2) end if
  if not reward and state.warmup==0 and ps.persistant[PERS_RANK]!=ops.persistant[PERS_RANK] and state.gametype<GT_TEAM then
    if ps.persistant[PERS_RANK]==0 then bufferedSound(state,S_TAKEN_LEAD) else if ps.persistant[PERS_RANK]==RANK_TIED_FLAG then bufferedSound(state,S_TIED_LEAD) else if (ops.persistant[PERS_RANK]&(~RANK_TIED_FLAG))==0 then bufferedSound(state,S_LOST_LEAD) end if
  end if
  if state.timelimit>0 then
    msec=state.time-state.levelStartTime
    if (state.timelimitWarnings&4)==0 and msec>(state.timelimit*60+2)*1000 then state.timelimitWarnings=state.timelimitWarnings|7;localSound(state,S_SUDDEN_DEATH,2)
    else if (state.timelimitWarnings&2)==0 and msec>(state.timelimit-1)*60*1000 then state.timelimitWarnings=state.timelimitWarnings|3;localSound(state,S_ONE_MINUTE,2)
    else if state.timelimit>5 and (state.timelimitWarnings&1)==0 and msec>(state.timelimit-5)*60*1000 then state.timelimitWarnings=state.timelimitWarnings|1;localSound(state,S_FIVE_MINUTE,2) end if
  end if
  if state.fraglimit>0 and state.gametype<GT_CTF then
    high=state.scores1
    if (state.fraglimitWarnings&4)==0 and high==state.fraglimit-1 then state.fraglimitWarnings=state.fraglimitWarnings|7;bufferedSound(state,S_ONE_FRAG)
    else if state.fraglimit>2 and (state.fraglimitWarnings&2)==0 and high==state.fraglimit-2 then state.fraglimitWarnings=state.fraglimitWarnings|3;bufferedSound(state,S_TWO_FRAG)
    else if state.fraglimit>3 and (state.fraglimitWarnings&1)==0 and high==state.fraglimit-3 then state.fraglimitWarnings=state.fraglimitWarnings|1;bufferedSound(state,S_THREE_FRAG) end if
  end if;return void
end function

// CG_TransitionPlayerState.  Event and sound actions are observation only.
function transitionPlayerState(state,ps,old)
  state.transitions=state.transitions+1;ops=old
  if ps.clientNum!=ops.clientNum then state.thisFrameTeleport=true;ops=playerstate.copy(ps) end if
  if ps.damageEvent!=ops.damageEvent and ps.damageCount!=0 then damageFeedback(state,ps,ps.damageYaw,ps.damagePitch,ps.damageCount) end if
  if ps.persistant[PERS_SPAWN_COUNT]!=ops.persistant[PERS_SPAWN_COUNT] then respawn(state,ps) end if
  if state.mapRestart then respawn(state,ps);state.mapRestart=false end if
  if ps.pm_type!=PM_INTERMISSION and ps.persistant[PERS_TEAM]!=TEAM_SPECTATOR then checkLocalSounds(state,ps,ops) end if
  checkAmmo(state,ps);checkPlayerstateEvents(state,ps,ops)
  if ps.viewheight!=ops.viewheight then state.duckChange=ps.viewheight-ops.viewheight;state.duckTime=state.time end if;return void
end function
