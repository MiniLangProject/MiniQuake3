// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native observer port of code/cgame/cg_playerstate.c.  The QVM remains the
// owner of presentation side effects; actions recorded here are parity data.
package mq3.client.cgame_playerstate
import mq3.client.cg_local as cgabi
import mq3.game.playerstate as playerstate
import mq3.shared.math as qmath
import mq3.compat.numeric as n

/// Index of the health value in the player state's statistics array.
const STAT_HEALTH=0
/// Index of the weapons value in the player state's statistics array.
const STAT_WEAPONS=2
/// Index of the hits value in the player state's persistent-statistics array.
const PERS_HITS=1
/// Index of the rank value in the player state's persistent-statistics array.
const PERS_RANK=2
/// Index of the team value in the player state's persistent-statistics array.
const PERS_TEAM=3
/// Index of the spawn count value in the player state's persistent-statistics array.
const PERS_SPAWN_COUNT=4
/// Index of the playerevents value in the player state's persistent-statistics array.
const PERS_PLAYEREVENTS=5
/// Index of the attackee armor value in the player state's persistent-statistics array.
const PERS_ATTACKEE_ARMOR=7
/// Index of the impressive count value in the player state's persistent-statistics array.
const PERS_IMPRESSIVE_COUNT=9
/// Index of the excellent count value in the player state's persistent-statistics array.
const PERS_EXCELLENT_COUNT=10
/// Index of the defend count value in the player state's persistent-statistics array.
const PERS_DEFEND_COUNT=11
/// Index of the assist count value in the player state's persistent-statistics array.
const PERS_ASSIST_COUNT=12
/// Index of the gauntlet frag count value in the player state's persistent-statistics array.
const PERS_GAUNTLET_FRAG_COUNT=13
/// Index of the captures value in the player state's persistent-statistics array.
const PERS_CAPTURES=14
/// Player powerup slot for redflag, also used when constructing active-powerup bitsets.
const PW_REDFLAG=7
/// Player powerup slot for blueflag, also used when constructing active-powerup bitsets.
const PW_BLUEFLAG=8
/// Player powerup slot for neutralflag, also used when constructing active-powerup bitsets.
const PW_NEUTRALFLAG=9
/// Native weapon identifier selecting the machine gun.
const WP_MACHINEGUN=2
/// Native weapon identifier selecting the shotgun.
const WP_SHOTGUN=3
/// Native weapon identifier selecting the grenade launcher.
const WP_GRENADE_LAUNCHER=4
/// Native weapon identifier selecting the rocket launcher.
const WP_ROCKET_LAUNCHER=5
/// Native weapon identifier selecting the railgun.
const WP_RAILGUN=7
/// Number of native weapon slots, used to size weapon-indexed tables rather than select a weapon.
const WP_NUM_WEAPONS=11
/// Native team identifier for spectator, used by player and team presentation.
const TEAM_SPECTATOR=3
/// Native game-type value for team deathmatch, used when choosing score, lead-change, and team-result
/// feedback.
const GT_TEAM=3
/// Native game-type value for capture the flag, used when choosing score, lead-change, and team-result
/// feedback.
const GT_CTF=4
/// Player-movement mode selecting intermission input and physics behavior.
const PM_INTERMISSION=5
/// Bit marking that the stored rank is tied with another player's rank.
const RANK_TIED_FLAG=0x4000
/// Player-event bit recording the deniedreward award condition.
const PLAYEREVENT_DENIEDREWARD=1
/// Player-event bit recording the gauntletreward award condition.
const PLAYEREVENT_GAUNTLETREWARD=2
/// Player-event bit recording the holyshit award condition.
const PLAYEREVENT_HOLYSHIT=4
/// Capacity limit for the ps events collection or bounded storage used by this client module.
const MAX_PS_EVENTS=2
/// Capacity limit for the predicted events collection or bounded storage used by this client module.
const MAX_PREDICTED_EVENTS=cgabi.MAX_PREDICTED_EVENTS
/// Capacity limit for the rewardstack collection or bounded storage used by this client module.
const MAX_REWARDSTACK=cgabi.MAX_REWARDSTACK
/// Total presentation duration in milliseconds of the damage indicator.
const DAMAGE_TIME=cgabi.DAMAGE_TIME

// The integer media values are observation tags.  They intentionally do not
// call the renderer/audio traps a second time beside the real cgame QVM.
const S_NO_AMMO=1
/// Client sound-event slot for the hit feedback or announcement.
const S_HIT=2
/// Client sound-event slot for the hit team feedback or announcement.
const S_HIT_TEAM=3
/// Client sound-event slot for the capture feedback or announcement.
const S_CAPTURE=4
/// Client sound-event slot for the impressive feedback or announcement.
const S_IMPRESSIVE=5
/// Client sound-event slot for the excellent feedback or announcement.
const S_EXCELLENT=6
/// Client sound-event slot for the humiliation feedback or announcement.
const S_HUMILIATION=7
/// Client sound-event slot for the defend feedback or announcement.
const S_DEFEND=8
/// Client sound-event slot for the assist feedback or announcement.
const S_ASSIST=9
/// Client sound-event slot for the denied feedback or announcement.
const S_DENIED=10
/// Client sound-event slot for the holyshit feedback or announcement.
const S_HOLYSHIT=11
/// Client sound-event slot for the you have flag feedback or announcement.
const S_YOU_HAVE_FLAG=12
/// Client sound-event slot for the taken lead feedback or announcement.
const S_TAKEN_LEAD=13
/// Client sound-event slot for the tied lead feedback or announcement.
const S_TIED_LEAD=14
/// Client sound-event slot for the lost lead feedback or announcement.
const S_LOST_LEAD=15
/// Client sound-event slot for the sudden death feedback or announcement.
const S_SUDDEN_DEATH=16
/// Client sound-event slot for the one minute feedback or announcement.
const S_ONE_MINUTE=17
/// Client sound-event slot for the five minute feedback or announcement.
const S_FIVE_MINUTE=18
/// Client sound-event slot for the one frag feedback or announcement.
const S_ONE_FRAG=19
/// Client sound-event slot for the two frag feedback or announcement.
const S_TWO_FRAG=20
/// Client sound-event slot for the three frag feedback or announcement.
const S_THREE_FRAG=21
/// Reward-medal slot used to display the capture award.
const M_CAPTURE=101
/// Reward-medal slot used to display the impressive award.
const M_IMPRESSIVE=102
/// Reward-medal slot used to display the excellent award.
const M_EXCELLENT=103
/// Reward-medal slot used to display the gauntlet award.
const M_GAUNTLET=104
/// Reward-medal slot used to display the defend award.
const M_DEFEND=105
/// Reward-medal slot used to display the assist award.
const M_ASSIST=106

/// Stores client game playerstate state, including `time`, `serverTime`, `gametype`, `timelimit`, `levelStartTime`, `fraglimit` and additional values.
struct State
  /// Client-game time in milliseconds used for damage feedback, respawn effects, and player-state
  /// announcements.
  time
  /// Server-state timestamp in milliseconds used to anchor recorded damage feedback.
  serverTime
  /// Active game-rule identifier controlling rank, flag, reward, and frag-limit announcements.
  gametype
  /// When constructing this record, `create` supplies `0` for this member. Used by `checkLocalSounds`
  /// during subsequent processing.
  timelimit
  /// Server timestamp at which the level began, used by elapsed-match-time displays.
  levelStartTime
  /// When constructing this record, `create` supplies `0` for this member. Used by `checkLocalSounds`
  /// during subsequent processing.
  fraglimit
  /// First team or leading player's score received through server configuration strings.
  scores1
  /// Warmup deadline or state supplied by the server's warmup configuration.
  warmup
  /// True after intermission begins, suppressing gameplay-only presentation such as voice rewards.
  intermissionStarted
  /// True after a map restart, causing presentation and prediction state to be reinitialized.
  mapRestart
  /// When constructing this record, `create` supplies `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for
  /// this member. Used by `damageFeedback` during subsequent processing.
  viewaxis
  /// Ammunition-warning state: one means low ammunition and two means empty.
  lowAmmoWarning
  /// Timestamp used to time the latest attacker's HUD indication.
  attackerTime
  /// Horizontal direction component of the latest damage indicator.
  damageX
  /// Vertical direction component of the latest damage indicator.
  damageY
  /// When constructing this record, `create` supplies `0.0` for this member. Used by `damageFeedback`
  /// during subsequent processing.
  vDmgRoll
  /// When constructing this record, `create` supplies `0.0` for this member. Used by `damageFeedback`
  /// during subsequent processing.
  vDmgPitch
  /// Magnitude of the latest damage event used to scale view kick and indicators.
  damageValue
  /// When constructing this record, `create` supplies `0` for this member. Used by `damageFeedback`
  /// during subsequent processing.
  vDmgTime
  /// Timestamp used to fade the latest damage overlay or view-kick effect.
  damageTime
  /// True when the current snapshot transition represents a teleport.
  thisFrameTeleport
  /// Timestamp at which the weapon-selection display was last refreshed.
  weaponSelectTime
  /// Weapon identifier currently selected by the local player.
  weaponSelect
  /// Eye-height displacement being smoothed after a crouch transition.
  duckChange
  /// Client timestamp at which crouch-height smoothing began.
  duckTime
  /// Next sequence number in the predicted or entity event stream.
  eventSequence
  /// Ring of events generated by local player prediction.
  predictableEvents
  /// Number or top position of queued reward announcements awaiting presentation.
  rewardStack
  /// Sound resource associated with each queued reward announcement.
  rewardSound
  /// HUD shader associated with each queued reward announcement.
  rewardShader
  /// Award count associated with each queued reward announcement.
  rewardCount
  /// Bitset recording which time-limit warning thresholds have already been announced.
  timelimitWarnings
  /// Bitset recording which frag-limit warning thresholds have already been announced.
  fraglimitWarnings
  /// Host requests queued while handling player-state changes such as damage, pickups, and local
  /// sounds, retained in request order.
  actions
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `transitionPlayerState` during subsequent processing.
  transitions
end struct

/// Creates a `mq3.client.cgame_playerstate.State` record. Initializes the record with the defaults written in this constructor.
function create()
  return State(0,0,0,0,0,0,0,0,false,false,[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],0,0,0.0,0.0,0.0,0.0,0.0,0,0,false,0,0,0,0,0,array(MAX_PREDICTED_EVENTS,0),0,array(MAX_REWARDSTACK,0),array(MAX_REWARDSTACK,0),array(MAX_REWARDSTACK,0),0,0,[],0)
end function

/// Appends a client game playerstate action record to the queued engine requests.
/// @param state Mutable client game playerstate record/storage; this routine assigns `state.actions`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param a Value used by `state.actions=state.actions+[[kind,a,b,c]]`.
/// @param b Value used by `state.actions=state.actions+[[kind,a,b,c]]`.
/// @param c Value used by `state.actions=state.actions+[[kind,a,b,c]]`.
function emit(state,kind,a,b,c) state.actions=state.actions+[[kind,a,b,c]];return void end function
/// Adapts `mq3.client.cgame_playerstate.emit` to client game playerstate `localSound`, returning its result for `state, "localSound", sound, channel, 0`.
/// @param state Argument 1 of `mq3.client.cgame_playerstate.emit`.
/// @param sound Argument 3 of `mq3.client.cgame_playerstate.emit`.
/// @param channel Argument 4 of `mq3.client.cgame_playerstate.emit`.
function localSound(state,sound,channel) return emit(state,"localSound",sound,channel,0) end function
/// Adapts `mq3.client.cgame_playerstate.emit` to client game playerstate `bufferedSound`, returning its result for `state, "bufferedSound", sound, 0, 0`.
/// @param state Argument 1 of `mq3.client.cgame_playerstate.emit`.
/// @param sound Argument 3 of `mq3.client.cgame_playerstate.emit`.
function bufferedSound(state,sound) return emit(state,"bufferedSound",sound,0,0) end function

// CG_CheckAmmo
/// @param state Mutable client game playerstate record/storage; this routine assigns `state.lowAmmoWarning`.
/// @param ps Player-state record containing authoritative or predicted player data. Record read through `ps.stats`, `ps.ammo`.
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
/// @param state Mutable client game playerstate record/storage; this routine assigns `state.attackerTime`, `state.damageX`, `state.damageY`, `state.vDmgRoll` and additional values.
/// @param ps Player-state record containing authoritative or predicted player data. Record read through `ps.stats`.
/// @param yawByte Value used by `if yawByte==255 and pitchByte==255 then`.
/// @param pitchByte Value used by `if yawByte==255 and pitchByte==255 then`.
/// @param damage Value used by `kick=n.fmul(damage,scale)`.
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
/// @param state Mutable client game playerstate record/storage; this routine assigns `state.thisFrameTeleport`, `state.weaponSelectTime`, `state.weaponSelect`.
/// @param ps Player-state record containing authoritative or predicted player data. Record read through `ps.weapon`.
function respawn(state,ps) state.thisFrameTeleport=true;state.weaponSelectTime=state.time;state.weaponSelect=ps.weapon;emit(state,"respawn",ps.weapon,0,0);return void end function

/// Calls `mq3.client.cgame_playerstate.emit` from client game playerstate `entityEvent`.
/// @param state Shared client game playerstate state passed to the helper calls in `entityEvent`.
/// @param event Event identifier compared with the supported activation/input events.
/// @param eventParm Value used by `emit(state,"entityEvent",event,eventParm,clientNum)`.
/// @param clientNum Client slot identifier used by the client/server protocol.
function entityEvent(state,event,eventParm,clientNum) emit(state,"entityEvent",event,eventParm,clientNum);return void end function

// CG_CheckPlayerstateEvents
/// @param state Mutable client game playerstate record/storage; this routine assigns `state.predictableEvents[index&(MAX_PREDICTED_EVENTS-1)]`, `state.eventSequence`.
/// @param ps Player-state record containing authoritative or predicted player data. Record read through `ps.externalEvent`, `ps.externalEventParm`, `ps.clientNum`, `ps.eventSequence` and additional values.
/// @param ops Record read through `ops.externalEvent`, `ops.eventSequence`, `ops.events`.
function checkPlayerstateEvents(state,ps,ops)
  if ps.externalEvent!=0 and ps.externalEvent!=ops.externalEvent then entityEvent(state,ps.externalEvent,ps.externalEventParm,ps.clientNum) end if
  for index=ps.eventSequence-MAX_PS_EVENTS to ps.eventSequence-1
    slot=index&(MAX_PS_EVENTS-1)
    if index>=ops.eventSequence or (index>ops.eventSequence-MAX_PS_EVENTS and ps.events[slot]!=ops.events[slot]) then event=ps.events[slot];entityEvent(state,event,ps.eventParms[slot],ps.clientNum);state.predictableEvents[index&(MAX_PREDICTED_EVENTS-1)]=event;state.eventSequence=state.eventSequence+1 end if
  end for;return void
end function

// CG_CheckChangedPredictableEvents
/// @param state Mutable client game playerstate record/storage; this routine assigns `state.predictableEvents[remember]`.
/// @param ps Player-state record containing authoritative or predicted player data. Record read through `ps.eventSequence`, `ps.events`, `ps.eventParms`, `ps.clientNum`.
function checkChangedPredictableEvents(state,ps)
  for index=ps.eventSequence-MAX_PS_EVENTS to ps.eventSequence-1
    if index>=state.eventSequence then continue end if
    if index>state.eventSequence-MAX_PREDICTED_EVENTS then slot=index&(MAX_PS_EVENTS-1);remember=index&(MAX_PREDICTED_EVENTS-1);if ps.events[slot]!=state.predictableEvents[remember] then event=ps.events[slot];entityEvent(state,event,ps.eventParms[slot],ps.clientNum);state.predictableEvents[remember]=event;emit(state,"changedPredicted",event,index,0) end if end if
  end for;return void
end function

// pushReward
/// @param state Mutable client game playerstate record/storage; this routine assigns `state.rewardStack`, `state.rewardSound[state.rewardStack]`, `state.rewardShader[state.rewardStack]`, `state.rewardCount[state.rewardStack]`.
/// @param sound Sound handle or asset name passed to the audio action.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param count Value used by `state.rewardCount[state.rewardStack]=count end if`.
function pushReward(state,sound,shader,count)
  if state.rewardStack<MAX_REWARDSTACK-1 then state.rewardStack=state.rewardStack+1;state.rewardSound[state.rewardStack]=sound;state.rewardShader[state.rewardStack]=shader;state.rewardCount[state.rewardStack]=count end if;return void
end function

// CG_CheckLocalSounds
/// @param state Mutable client game playerstate record/storage; this routine assigns `state.timelimitWarnings`, `state.fraglimitWarnings`.
/// @param ps Player-state record containing authoritative or predicted player data. Record read through `ps.persistant`, `ps.stats`, `ps.powerups`.
/// @param ops Record read through `ops.persistant`, `ops.stats`, `ops.powerups`.
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
/// @param state Mutable client game playerstate record/storage; this routine assigns `state.transitions`, `state.thisFrameTeleport`, `state.mapRestart`, `state.duckChange` and additional values.
/// @param ps Player-state record containing authoritative or predicted player data. Record read through `ps.clientNum`, `ps.damageEvent`, `ps.damageCount`, `ps.damageYaw` and additional values.
/// @param old Value used by `ops=old`.
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
