// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native, read-only prediction observer port of code/cgame/cg_predict.c.
// The retail cgame QVM remains authoritative.  This module replays the same
// snapshot/command boundary on copied state, so validation cannot fire events
// or mutate the live QVM twice.
package mq3.client.cgame_predict
import mq3.compat.numeric as n
import mq3.game.constants as c
import mq3.game.playerstate as playerstate
import mq3.game.pmove as pmove
import mq3.game.movement as movement
import mq3.game.trajectory as trajectory
import mq3.game.jumppad as jumppad

/// Number of recent user commands retained in the command-history ring.
const CMD_BACKUP=64
/// Encoded solid value indicating that the entity uses an inline brush collision model.
const SOLID_BMODEL=0xffffff
/// Combined collision-content mask used by player movement traces.
const MASK_PLAYERSOLID=0x2010001
/// Collision-content bit identifying body volumes or surfaces during client traces.
const CONTENTS_BODY=0x2000000
/// Player-movement state flag indicating follow.
const PMF_FOLLOW=0x1000
/// Entity-state flag selecting nodraw behavior in client presentation.
const EF_NODRAW=0x80

/// Stores client game predict entity record, including `state`, `lerpOrigin`, `lerpAngles`, `miscTime`.
struct Entity
  /// When constructing this record, `entity` supplies `source` for this member.
  state
  /// Entity position after snapshot interpolation and smoothing.
  lerpOrigin
  /// Entity orientation after snapshot interpolation and smoothing.
  lerpAngles
  /// When constructing this record, `entity` supplies `-1` for this member.
  miscTime
end struct
/// Stores client game predict host-service callbacks, including `worldTraceFn`, `entityTraceFn`, `worldPointFn`, `entityPointFn`, `triggerTouchFn`, `moverAdjustFn` and additional values.
struct Services
  /// Host callback for the world trace operation; an unset callback leaves that host operation
  /// unavailable.
  worldTraceFn
  /// Host callback for the entity trace operation; an unset callback leaves that host operation
  /// unavailable.
  entityTraceFn
  /// Host callback for the world point operation; an unset callback leaves that host operation
  /// unavailable.
  worldPointFn
  /// Host callback for the entity point operation; an unset callback leaves that host operation
  /// unavailable.
  entityPointFn
  /// Host callback for the trigger touch operation; an unset callback leaves that host operation
  /// unavailable.
  triggerTouchFn
  /// Host callback for the mover adjust operation; an unset callback leaves that host operation
  /// unavailable.
  moverAdjustFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for local player-movement
  /// prediction.
  context
end struct
/// Stores client game predict state, including `predicted`, `valid`, `solidEntities`, `triggerEntities`, `physicsTime`, `hyperspace` and additional values.
struct State
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `touchItem` and `touchTriggerPrediction` during subsequent processing.
  predicted
  /// True when the stored data passed the validation required by its consumer.
  valid
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `buildSolidList` and `trace` during subsequent processing.
  solidEntities
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `buildSolidList` and `touchTriggerPrediction` during subsequent processing.
  triggerEntities
  /// Snapshot time selected as the basis for player-state prediction.
  physicsTime
  /// True when prediction has entered a teleport trigger requiring the hyperspace view effect.
  hyperspace
  /// Positional discrepancy between predicted and authoritative player state.
  predictedError
  /// Timestamp from which the stored player-prediction error is smoothed away.
  predictedErrorTime
  /// When constructing this record, `create` supplies `false` for this member. Used by `predict` during
  /// subsequent processing.
  moved
  /// When constructing this record, `create` supplies `0` for this member. Used by `trace` during
  /// subsequent processing.
  traceCount
  /// When constructing this record, `create` supplies `0` for this member. Used by `pointContents`
  /// during subsequent processing.
  pointCount
  /// When constructing this record, `create` supplies `0` for this member. Used by `predict` during
  /// subsequent processing.
  predictions
  /// When constructing this record, `create` supplies `0` for this member. Used by `predict` during
  /// subsequent processing.
  transitions
  /// When constructing this record, `create` supplies `"none"` for this member. Used by `predict`
  /// during subsequent processing.
  lastMode
  /// When constructing this record, `create` supplies `false` for this member. Used by `predict` during
  /// subsequent processing.
  packetBackupExceeded
  /// Nonfatal diagnostic messages collected while processing the input.
  warnings
end struct
/// Stores client game predict run context record, including `observer`, `services`.
struct RunContext
  /// When constructing this record, `predict` supplies `state` for this member.
  observer
  /// Service callbacks and context used to access the host engine from this client subsystem.
  services
end struct

/// Creates a `mq3.client.cgame_predict.State` record. Initializes the record with the defaults written in this constructor.
function create()
  return State(void,false,[],[],0,false,[0.0,0.0,0.0],0,false,0,0,0,0,"none",false,[])
end function
/// Creates a `mq3.client.cgame_predict.Services` record. Assigns `context` from `context`.
/// @param context Value used to initialize `Services.context`.
function services(context) return Services(void,void,void,void,void,void,context) end function
/// Creates a `mq3.client.cgame_predict.Entity` record. Assigns `state` from `source`.
/// @param source Record read through `source.origin`, `source.angles`.
function entity(source)
  return Entity(source,[source.origin[0],source.origin[1],source.origin[2]],[source.angles[0],source.angles[1],source.angles[2]],-1)
end function
/// Copies the X, Y and Z components into a fresh client game predict vector.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function copy3(value) return [value[0],value[1],value[2]] end function

// CG_BuildSolidList.  Snapshot entities already carry the state selected by
// CG_SetNextSnap, so the native observer can classify them directly.
/// @param state Mutable client game predict record/storage; this routine assigns `state.solidEntities`, `state.triggerEntities`.
/// @param current Value used by `chosen=current`.
/// @param next Value used by `if next!=void and not nextFrameTeleport and not thisFrameTeleport then chosen=next end if`.
/// @param nextFrameTeleport Value used by `if next!=void and not nextFrameTeleport and not thisFrameTeleport then chosen=next end if`.
/// @param thisFrameTeleport Value used by `if next!=void and not nextFrameTeleport and not thisFrameTeleport then chosen=next end if`.
function buildSolidList(state,current,next,nextFrameTeleport,thisFrameTeleport)
  state.solidEntities=[];state.triggerEntities=[];chosen=current
  if next!=void and not nextFrameTeleport and not thisFrameTeleport then chosen=next end if
  if chosen==void then return error(7740,"CG_BuildSolidList: NULL snapshot") end if
  for each source in chosen.entities
    value=entity(source)
    if source.eType==c.ET_ITEM or source.eType==c.ET_PUSH_TRIGGER or source.eType==c.ET_TELEPORT_TRIGGER then state.triggerEntities=state.triggerEntities+[value]
    else if source.solid!=0 then state.solidEntities=state.solidEntities+[value] end if
  end for
  return len(state.solidEntities)
end function

// CG_ClipMoveToEntities / CG_Trace.  Collision details stay owned by the
// engine callback; the original nearest/allsolid/startsolid merge is here.
/// @param state Mutable client game predict record/storage; this routine assigns `state.traceCount`.
/// @param host Record read through `host.worldTraceFn`, `host.entityTraceFn`.
/// @param start Value used by `result=host.worldTraceFn(host,start,mins,maxs,finish,mask)`.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds.
/// @param finish Value used by `result=host.worldTraceFn(host,start,mins,maxs,finish,mask)`.
/// @param skipNumber Value used by `if value.state.number==skipNumber then continue end if`.
/// @param mask Value used by `result=host.worldTraceFn(host,start,mins,maxs,finish,mask)`.
function trace(state,host,start,mins,maxs,finish,skipNumber,mask)
  if host==void or host.worldTraceFn==void then return error(7740,"CG_Trace: missing world collision") end if
  result=host.worldTraceFn(host,start,mins,maxs,finish,mask);state.traceCount=state.traceCount+1
  if result is error then return result end if
  if host.entityTraceFn==void then return result end if
  for each value in state.solidEntities
    if value.state.number==skipNumber then continue end if
    hit=host.entityTraceFn(host,value,start,mins,maxs,finish,mask);state.traceCount=state.traceCount+1
    if hit is error then return hit end if
    if hit.trace.allsolid or hit.trace.fraction<result.trace.fraction then result=hit;result.entityNum=value.state.number
    else if hit.trace.startsolid then result.trace.startsolid=true end if
    if result.trace.allsolid then return result end if
  end for
  return result
end function

// CG_PointContents.
/// @param state Mutable client game predict record/storage; this routine assigns `state.pointCount`.
/// @param host Record read through `host.worldPointFn`, `host.entityPointFn`.
/// @param point Value used by `contents=host.worldPointFn(host,point)`.
/// @param passEntityNum Value used by `if value.state.number==passEntityNum or value.state.solid!=SOLID_BMODEL then continue end if`.
function pointContents(state,host,point,passEntityNum)
  if host==void or host.worldPointFn==void then return error(7740,"CG_PointContents: missing world collision") end if
  contents=host.worldPointFn(host,point);state.pointCount=state.pointCount+1
  if contents is error then return contents end if
  if host.entityPointFn!=void then
    for each value in state.solidEntities
      if value.state.number==passEntityNum or value.state.solid!=SOLID_BMODEL then continue end if
      addition=host.entityPointFn(host,value,point);state.pointCount=state.pointCount+1;if addition is error then return addition end if;contents=contents|addition
    end for
  end if
  return contents
end function

/// Calls `mq3.compat.numeric.f32` from client game predict `lerpAngle`. The final path returns `n.f32(first+fraction*delta)`.
/// @param first Value used by `delta=second-first`.
/// @param second Value used by `delta=second-first`.
/// @param fraction Interpolation or blend fraction between the endpoint values.
function lerpAngle(first,second,fraction)
  delta=second-first;if delta>180.0 then delta=delta-360.0 else if delta< -180.0 then delta=delta+360.0 end if
  return n.f32(first+fraction*delta)
end function

// CG_InterpolatePlayerState.
/// @param current Record read through `current.playerState`, `current.serverTime`, `current.playerState.bobCycle`, `current.playerState.origin` and additional values.
/// @param next Record read through `next.serverTime`, `next.playerState.bobCycle`, `next.playerState.origin`, `next.playerState.viewangles` and additional values.
/// @param time Value used by `fraction=n.f32((time-current.serverTime)*1.0/(next.serverTime-current.serverTime))`.
/// @param grabAngles Value used by `if grabAngles and latestCommand!=void then pmove.updateViewAngles(output,latestCommand) end if`.
/// @param latestCommand Value used by `if grabAngles and latestCommand!=void then pmove.updateViewAngles(output,latestCommand) end if`.
/// @param nextFrameTeleport Value used by `if nextFrameTeleport or next==void or next.serverTime<=current.serverTime then return output end if`.
function interpolatePlayerState(current,next,time,grabAngles,latestCommand,nextFrameTeleport)
  if current==void then return error(7740,"CG_InterpolatePlayerState: NULL snapshot") end if
  output=playerstate.copy(current.playerState)
  if grabAngles and latestCommand!=void then pmove.updateViewAngles(output,latestCommand) end if
  if nextFrameTeleport or next==void or next.serverTime<=current.serverTime then return output end if
  fraction=n.f32((time-current.serverTime)*1.0/(next.serverTime-current.serverTime))
  bob=next.playerState.bobCycle;if bob<current.playerState.bobCycle then bob=bob+256 end if
  output.bobCycle=n.i32(current.playerState.bobCycle+fraction*(bob-current.playerState.bobCycle))
  for axis=0 to 2
    output.origin[axis]=n.f32(current.playerState.origin[axis]+fraction*(next.playerState.origin[axis]-current.playerState.origin[axis]))
    if not grabAngles then output.viewangles[axis]=lerpAngle(current.playerState.viewangles[axis],next.playerState.viewangles[axis],fraction) end if
    output.velocity[axis]=n.f32(current.playerState.velocity[axis]+fraction*(next.playerState.velocity[axis]-current.playerState.velocity[axis]))
  end for
  return output
end function

/// Updates `ps.events[slot]`, `ps.eventParms[slot]`, `ps.eventSequence` during client game predict `addPredictableEvent`.
/// @param ps Mutable client game predict record/storage; this routine assigns `ps.events[slot]`, `ps.eventParms[slot]`, `ps.eventSequence`.
/// @param event Event identifier compared with the supported activation/input events.
/// @param parm Value used by `ps.eventParms[slot]=parm`.
function addPredictableEvent(ps,event,parm)
  slot=ps.eventSequence&1;ps.events[slot]=event;ps.eventParms[slot]=parm;ps.eventSequence=n.add32(ps.eventSequence,1);return void
end function

/// Computes `typeof(index)=="int" and index>0 and index<36` for client game predict `validItem`.
/// @param index Value used by `return typeof(index)=="int" and index>0 and index<36`.
function validItem(index) return typeof(index)=="int" and index>0 and index<36 end function
/// Calls `mq3.client.cgame_predict.validItem`, `mq3.game.constants.itemType`, `mq3.game.constants.itemTag` and additional helpers from client game predict `canGrabItem`.
/// @param gametype Quake III game-type identifier.
/// @param ent Record read through `ent.modelindex`, `ent.modelindex2`.
/// @param ps Player-state record containing authoritative or predicted player data. Record read through `ps.ammo`, `ps.stats`, `ps.persistant`, `ps.powerups`.
function canGrabItem(gametype,ent,ps)
  index=ent.modelindex;if not validItem(index) then return error(7740,"CG_TouchItem: invalid baseq3 item") end if;type=c.itemType(index);tag=c.itemTag(index)
  if type==c.IT_WEAPON then return true end if
  if type==c.IT_AMMO then return ps.ammo[tag]<200 end if
  if type==c.IT_ARMOR then return ps.stats[c.STAT_ARMOR]<ps.stats[c.STAT_MAX_HEALTH]*2 end if
  if type==c.IT_HEALTH then quantity=c.itemQuantity(index);if quantity==5 or quantity==100 then return ps.stats[c.STAT_HEALTH]<ps.stats[c.STAT_MAX_HEALTH]*2 end if;return ps.stats[c.STAT_HEALTH]<ps.stats[c.STAT_MAX_HEALTH] end if
  if type==c.IT_POWERUP then return true end if
  if type==c.IT_TEAM then
    if gametype!=4 then return false end if;team=ps.persistant[c.PERS_TEAM]
    if team==c.TEAM_RED then return tag==c.PW_BLUEFLAG or (tag==c.PW_REDFLAG and ent.modelindex2!=0) or (tag==c.PW_REDFLAG and ps.powerups[c.PW_BLUEFLAG]!=0) end if
    if team==c.TEAM_BLUE then return tag==c.PW_REDFLAG or (tag==c.PW_BLUEFLAG and ent.modelindex2!=0) or (tag==c.PW_BLUEFLAG and ps.powerups[c.PW_REDFLAG]!=0) end if;return false
  end if
  if type==c.IT_HOLDABLE then return ps.stats[c.STAT_HOLDABLE_ITEM]==0 end if
  if type==c.IT_BAD then return error(7740,"CG_TouchItem: IT_BAD") end if;return false
end function

// CG_TouchItem.  The shared trajectory and item rules are the same native
// BG_PlayerTouchesItem/BG_CanItemBeGrabbed ports used by qagame.
/// @param state Mutable client game predict record/storage; this routine assigns `state.eFlags`, `state.predicted.stats[c.STAT_WEAPONS]`, `state.predicted.ammo[tag]`.
/// @param value Mutable client game predict record/storage; this routine assigns `value.state.eFlags`, `value.miscTime`.
/// @param time Value assigned to `value.miscTime`.
/// @param gametype Quake III game-type identifier.
/// @param predictItems Value used by `if not predictItems then return false end if`.
function touchItem(state,value,time,gametype,predictItems)
  if not predictItems then return false end if
  if not trajectory.playerTouchesItem(state.predicted,value.state.pos,time) then return false end if
  if value.miscTime==time then return false end if
  allowed=canGrabItem(gametype,value.state,state.predicted);if allowed is error then return allowed end if;if not allowed then return false end if
  addPredictableEvent(state.predicted,c.EV_ITEM_PICKUP,value.state.modelindex);value.state.eFlags=value.state.eFlags|EF_NODRAW;value.miscTime=time
  type=c.itemType(value.state.modelindex)
  if type==c.IT_WEAPON then tag=c.itemTag(value.state.modelindex);state.predicted.stats[c.STAT_WEAPONS]=state.predicted.stats[c.STAT_WEAPONS]|(1<<tag);if state.predicted.ammo[tag]==0 then state.predicted.ammo[tag]=1 end if end if
  return true
end function

// CG_TouchTriggerPrediction.  Contact against inline trigger models remains an
// engine callback, while item, teleport and jump-pad effects are native here.
/// @param state Mutable client game predict record/storage; this routine assigns `state.hyperspace`.
/// @param host Record read through `host.triggerTouchFn`.
/// @param time Value used by `if ent.eType==c.ET_ITEM and not spectator then picked=touchItem(state,value,time,gametype,predictItems)`.
/// @param gametype Quake III game-type identifier.
/// @param predictItems Value used by `if ent.eType==c.ET_ITEM and not spectator then picked=touchItem(state,value,time,gametype,predictItems)`.
/// @param mins Minimum X, Y and Z coordinates of the axis-aligned bounds.
/// @param maxs Maximum X, Y and Z coordinates of the axis-aligned bounds.
function touchTriggerPrediction(state,host,time,gametype,predictItems,mins,maxs)
  ps=state.predicted;if ps.stats[c.STAT_HEALTH]<=0 then return 0 end if;spectator=ps.pm_type==c.PM_SPECTATOR
  if ps.pm_type!=c.PM_NORMAL and not spectator then return 0 end if;touched=0
  for each value in state.triggerEntities
    ent=value.state
    if ent.eType==c.ET_ITEM and not spectator then picked=touchItem(state,value,time,gametype,predictItems);if picked is error then return picked end if;if picked then touched=touched+1 end if;continue end if
    if ent.solid!=SOLID_BMODEL or host.triggerTouchFn==void then continue end if
    contact=host.triggerTouchFn(host,value,ps.origin,mins,maxs);if contact is error then return contact end if;if not contact then continue end if
    if ent.eType==c.ET_TELEPORT_TRIGGER then state.hyperspace=true;touched=touched+1
    else if ent.eType==c.ET_PUSH_TRIGGER then jumppad.touch(ps,ent.number,ent.origin2);touched=touched+1 end if
  end for
  if ps.jumppad_frame!=ps.pmove_framecount then ps.jumppad_frame=0;ps.jumppad_ent=0 end if
  return touched
end function

/// Calls `mq3.client.cgame_predict.trace` from client game predict `predictionTrace`. The final path returns `trace(run.observer,run.services,start,p.k.mins,p.k.maxs,finish,p.ps.clientNum,p.k.mask)`.
/// @param p Record read through `p.context`, `p.k.mins`, `p.k.maxs`, `p.ps.clientNum` and additional values.
/// @param start Value used by `return trace(run.observer,run.services,start,p.k.mins,p.k.maxs,finish,p.ps.clientNum,p.k.mask)`.
/// @param finish Value used by `return trace(run.observer,run.services,start,p.k.mins,p.k.maxs,finish,p.ps.clientNum,p.k.mask)`.
function predictionTrace(p,start,finish)
  run=p.context;return trace(run.observer,run.services,start,p.k.mins,p.k.maxs,finish,p.ps.clientNum,p.k.mask)
end function
/// Calls `mq3.client.cgame_predict.pointContents` from client game predict `predictionPoint`. The final path returns `pointContents(run.observer,run.services,point,p.ps.clientNum)`.
/// @param p Record read through `p.context`, `p.ps.clientNum`.
/// @param point Value used by `return pointContents(run.observer,run.services,point,p.ps.clientNum)`.
function predictionPoint(p,point)
  run=p.context;return pointContents(run.observer,run.services,point,p.ps.clientNum)
end function
/// Evaluates client game predict `latest` and returns `void`, `commands[len(commands)-1]` according to its guard/selection conditions.
/// @param commands Sequence read at `commands[len(commands)-1]`.
function latest(commands) if commands==void or len(commands)==0 then return void end if;return commands[len(commands)-1] end function
/// Calls `mq3.client.cgame_predict.copy3`, `host.moverAdjustFn` from client game predict `adjusted`. The final path returns `host.moverAdjustFn(host,origin,ground,fromTime,toTime)`.
/// @param host Record read through `host.moverAdjustFn`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param ground Value used by `return host.moverAdjustFn(host,origin,ground,fromTime,toTime)`.
/// @param fromTime Value used by `return host.moverAdjustFn(host,origin,ground,fromTime,toTime)`.
/// @param toTime Value used by `return host.moverAdjustFn(host,origin,ground,fromTime,toTime)`.
function adjusted(host,origin,ground,fromTime,toTime)
  if host.moverAdjustFn==void then return copy3(origin) end if;return host.moverAdjustFn(host,origin,ground,fromTime,toTime)
end function

// CG_PredictPlayerState.  This is deliberately an observer: all state is a
// deep copy and transition delivery is counted rather than emitted.  Retail
// cgame.qvm continues to own visible gameplay and event dispatch.
/// @param state Mutable client game predict record/storage; this routine assigns `state.hyperspace`, `state.packetBackupExceeded`, `state.valid`, `state.predicted` and additional values.
/// @param current Record read through `current.playerState`, `current.playerState.pm_flags`, `current.playerState.commandTime`, `current.playerState.persistant`.
/// @param next Value used by `build=buildSolidList(state,current,next,nextFrameTeleport,thisFrameTeleport)`.
/// @param time Value used by `if demoPlayback or (current.playerState.pm_flags&PMF_FOLLOW)!=0 then state.predicted=interpolatePlayerState(current,next,time,false,command,ne...`.
/// @param oldTime Value assigned to `state.predictedErrorTime`.
/// @param commands Sequence read at `commands[0]`.
/// @param demoPlayback Value used by `if demoPlayback or (current.playerState.pm_flags&PMF_FOLLOW)!=0 then state.predicted=interpolatePlayerState(current,next,time,false,command,ne...`.
/// @param noPredict Value used by `if noPredict or synchronousClients then state.predicted=interpolatePlayerState(current,next,time,true,command,nextFrameTeleport)`.
/// @param synchronousClients Value used by `if noPredict or synchronousClients then state.predicted=interpolatePlayerState(current,next,time,true,command,nextFrameTeleport)`.
/// @param nextFrameTeleport Value used by `build=buildSolidList(state,current,next,nextFrameTeleport,thisFrameTeleport)`.
/// @param thisFrameTeleport Value used by `build=buildSolidList(state,current,next,nextFrameTeleport,thisFrameTeleport)`.
/// @param gametype Quake III game-type identifier.
/// @param predictItems Value used by `triggers=touchTriggerPrediction(state,host,time,gametype,predictItems,move.k.mins,move.k.maxs)`.
/// @param pmoveFixed Value assigned to `move.fixed`.
/// @param pmoveMsec Value used by `interval=pmoveMsec`.
/// @param host host record passed to the client game predict helper calls.
function predict(state,current,next,time,oldTime,commands,demoPlayback,noPredict,synchronousClients,nextFrameTeleport,thisFrameTeleport,gametype,predictItems,pmoveFixed,pmoveMsec,host)
  if state==void or current==void or host==void then return error(7740,"CG_PredictPlayerState: missing state") end if
  state.hyperspace=false;state.packetBackupExceeded=false;build=buildSolidList(state,current,next,nextFrameTeleport,thisFrameTeleport);if build is error then return build end if
  if not state.valid then state.valid=true;state.predicted=playerstate.copy(current.playerState) end if
  command=latest(commands)
  if demoPlayback or (current.playerState.pm_flags&PMF_FOLLOW)!=0 then state.predicted=interpolatePlayerState(current,next,time,false,command,nextFrameTeleport);state.lastMode="interpolate";state.predictions=state.predictions+1;return state.predicted end if
  if noPredict or synchronousClients then state.predicted=interpolatePlayerState(current,next,time,true,command,nextFrameTeleport);state.lastMode="angles";state.predictions=state.predictions+1;return state.predicted end if
  old=playerstate.copy(state.predicted)
  if commands!=void and len(commands)>0 and commands[0].serverTime>current.playerState.commandTime and commands[0].serverTime<time then state.packetBackupExceeded=true;state.lastMode="frozen";return state.predicted end if
  base=current;if next!=void and not nextFrameTeleport and not thisFrameTeleport then base=next end if;state.predicted=playerstate.copy(base.playerState);state.physicsTime=base.serverTime
  interval=pmoveMsec;if interval<8 then interval=8 else if interval>33 then interval=33 end if
  run=RunContext(state,host);move=pmove.create(state.predicted,predictionTrace,predictionPoint,run);move.fixed=pmoveFixed;move.fixedMsec=interval;move.noFootsteps=false
  if state.predicted.pm_type==c.PM_DEAD then move.k.mask=MASK_PLAYERSOLID&~CONTENTS_BODY else move.k.mask=MASK_PLAYERSOLID end if
  if current.playerState.persistant[c.PERS_TEAM]==c.TEAM_SPECTATOR then move.k.mask=move.k.mask&~CONTENTS_BODY end if
  state.moved=false;latestTime=-2147483648;if command!=void then latestTime=command.serverTime end if
  if commands!=void then
    for each source in commands
      if source==void or source.serverTime<=state.predicted.commandTime or source.serverTime>latestTime then continue end if
      if state.predicted.commandTime==old.commandTime then
        if thisFrameTeleport then state.predictedError=[0.0,0.0,0.0];thisFrameTeleport=false
        else
          position=adjusted(host,state.predicted.origin,state.predicted.groundEntityNum,state.physicsTime,oldTime);delta=[old.origin[0]-position[0],old.origin[1]-position[1],old.origin[2]-position[2]];length=n.fsqrt(delta[0]*delta[0]+delta[1]*delta[1]+delta[2]*delta[2])
          if length>0.1 then state.predictedError=[state.predictedError[0]+delta[0],state.predictedError[1]+delta[1],state.predictedError[2]+delta[2]];state.predictedErrorTime=oldTime end if
        end if
      end if
      move.cmd=pmove.Command(source.serverTime,[source.angles[0],source.angles[1],source.angles[2]],source.buttons,source.weapon,source.forwardmove,source.rightmove,source.upmove);move.gauntletHit=false
      if pmoveFixed then pmove.updateViewAngles(move.ps,move.cmd);move.cmd.serverTime=n.quotient(move.cmd.serverTime+interval-1,interval)*interval end if
      advanced=pmove.move(move);if advanced is error then return advanced end if;state.moved=true
      triggers=touchTriggerPrediction(state,host,time,gametype,predictItems,move.k.mins,move.k.maxs);if triggers is error then return triggers end if
    end for
  end if
  if not state.moved then state.lastMode="not-moved";state.predictions=state.predictions+1;return state.predicted end if
  state.predicted.origin=adjusted(host,state.predicted.origin,state.predicted.groundEntityNum,state.physicsTime,time);state.transitions=state.transitions+1;state.lastMode="predicted";state.predictions=state.predictions+1
  if state.predicted.eventSequence>old.eventSequence+2 then state.warnings=state.warnings+["dropped event"] end if
  return state.predicted
end function
