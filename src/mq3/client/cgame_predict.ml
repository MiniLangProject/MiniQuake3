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

const CMD_BACKUP=64
const SOLID_BMODEL=0xffffff
const MASK_PLAYERSOLID=0x2010001
const CONTENTS_BODY=0x2000000
const PMF_FOLLOW=0x1000
const EF_NODRAW=0x80

struct Entity state lerpOrigin lerpAngles miscTime end struct
struct Services worldTraceFn entityTraceFn worldPointFn entityPointFn triggerTouchFn moverAdjustFn context end struct
struct State predicted valid solidEntities triggerEntities physicsTime hyperspace predictedError predictedErrorTime moved traceCount pointCount predictions transitions lastMode packetBackupExceeded warnings end struct
struct RunContext observer services end struct

function create()
  return State(void,false,[],[],0,false,[0.0,0.0,0.0],0,false,0,0,0,0,"none",false,[])
end function
function services(context) return Services(void,void,void,void,void,void,context) end function
function entity(source)
  return Entity(source,[source.origin[0],source.origin[1],source.origin[2]],[source.angles[0],source.angles[1],source.angles[2]],-1)
end function
function copy3(value) return [value[0],value[1],value[2]] end function

// CG_BuildSolidList.  Snapshot entities already carry the state selected by
// CG_SetNextSnap, so the native observer can classify them directly.
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

function lerpAngle(first,second,fraction)
  delta=second-first;if delta>180.0 then delta=delta-360.0 else if delta< -180.0 then delta=delta+360.0 end if
  return n.f32(first+fraction*delta)
end function

// CG_InterpolatePlayerState.
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

function addPredictableEvent(ps,event,parm)
  slot=ps.eventSequence&1;ps.events[slot]=event;ps.eventParms[slot]=parm;ps.eventSequence=n.add32(ps.eventSequence,1);return void
end function

function validItem(index) return typeof(index)=="int" and index>0 and index<36 end function
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

function predictionTrace(p,start,finish)
  run=p.context;return trace(run.observer,run.services,start,p.k.mins,p.k.maxs,finish,p.ps.clientNum,p.k.mask)
end function
function predictionPoint(p,point)
  run=p.context;return pointContents(run.observer,run.services,point,p.ps.clientNum)
end function
function latest(commands) if commands==void or len(commands)==0 then return void end if;return commands[len(commands)-1] end function
function adjusted(host,origin,ground,fromTime,toTime)
  if host.moverAdjustFn==void then return copy3(origin) end if;return host.moverAdjustFn(host,origin,ground,fromTime,toTime)
end function

// CG_PredictPlayerState.  This is deliberately an observer: all state is a
// deep copy and transition delivery is counted rather than emitted.  Retail
// cgame.qvm continues to own visible gameplay and event dispatch.
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
