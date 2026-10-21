// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native state-machine port of code/cgame/cg_snapshot.c.
package mq3.client.cgame_snapshot
import mq3.game.entitystate as entitystate

const EVENT_VALID_MSEC=300
const ET_PLAYER=1
const EF_TELEPORT_BIT=4
const PMF_FOLLOW=0x1000
const SNAPFLAG_NOT_ACTIVE=1
const SNAPFLAG_SERVERCOUNT=4
struct Snapshot number serverTime snapFlags serverCommandSequence playerState entities end struct
struct Cent currentState nextState currentValid interpolate previousEvent trailTime lerpOrigin lerpAngles snapShotTime playerResets events end struct
struct State time latestSnapshotNum latestSnapshotTime processedSnapshotNum snap nextSnap snapshots entities thisFrameTeleport nextFrameTeleport solidBuilds respawns executedSequences lagometer errors playerStateTransitions demoPlayback noPredict synchronousClients prediction end struct
function cent() return Cent(entitystate.create(),entitystate.create(),false,false,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0) end function
function create(maxEntities) return State(0,0,0,0,void,void,[],array(maxEntities,void),false,false,0,0,[],[],[],[],false,false,false,void) end function
function wrap(number,source,snapFlags,commandSequence) return Snapshot(number,source.serverTime,snapFlags,commandSequence,source.playerState,source.entities) end function
function ensureEntity(state,number)
  if number<0 or number>=len(state.entities) then return error(7701,"snapshot entity number out of range") end if
  if state.entities[number]==void then state.entities[number]=cent() end if;return state.entities[number]
end function
function playerEntity(ps)
  value=entitystate.create();value.number=ps.clientNum;value.eType=ET_PLAYER;value.eFlags=ps.eFlags;value.origin=[ps.origin[0],ps.origin[1],ps.origin[2]];value.angles=[ps.viewangles[0],ps.viewangles[1],ps.viewangles[2]];value.clientNum=ps.clientNum;value.weapon=ps.weapon;return value
end function
// CG_ResetEntity
function resetEntity(state,value)
  if value.snapShotTime<state.time-EVENT_VALID_MSEC then value.previousEvent=0 end if;value.trailTime=state.snap.serverTime;value.lerpOrigin=[value.currentState.origin[0],value.currentState.origin[1],value.currentState.origin[2]];value.lerpAngles=[value.currentState.angles[0],value.currentState.angles[1],value.currentState.angles[2]];if value.currentState.eType==ET_PLAYER then value.playerResets=value.playerResets+1 end if;return void
end function
// CG_TransitionEntity
function transitionEntity(state,value)
  value.currentState=value.nextState;value.currentValid=true;if not value.interpolate then resetEntity(state,value) end if;value.interpolate=false;value.events=value.events+1;return void
end function
function executeSequence(state,sequence) state.executedSequences=state.executedSequences+[sequence];return void end function
// CG_SetInitialSnapshot
function setInitialSnapshot(state,snap)
  state.snap=snap;local=ensureEntity(state,snap.playerState.clientNum);if local is error then return local end if;local.currentState=playerEntity(snap.playerState);state.solidBuilds=state.solidBuilds+1;executeSequence(state,snap.serverCommandSequence);state.respawns=state.respawns+1
  for each source in snap.entities value=ensureEntity(state,source.number);if value is error then return value end if;value.currentState=source;value.interpolate=false;value.currentValid=true;resetEntity(state,value);value.events=value.events+1 end for;return void
end function
// CG_TransitionSnapshot
function transitionSnapshot(state)
  if state.snap==void then return error(7701,"CG_TransitionSnapshot: NULL cg.snap") end if;if state.nextSnap==void then return error(7701,"CG_TransitionSnapshot: NULL cg.nextSnap") end if;executeSequence(state,state.nextSnap.serverCommandSequence)
  for each source in state.snap.entities value=ensureEntity(state,source.number);if value is error then return value end if;value.currentValid=false end for
  old=state.snap;state.snap=state.nextSnap;local=ensureEntity(state,state.snap.playerState.clientNum);if local is error then return local end if;local.currentState=playerEntity(state.snap.playerState);local.interpolate=false
  for each source in state.snap.entities value=ensureEntity(state,source.number);if value is error then return value end if;transitionEntity(state,value);value.snapShotTime=state.snap.serverTime end for;state.nextSnap=void
  if ((state.snap.playerState.eFlags^old.playerState.eFlags)&EF_TELEPORT_BIT)!=0 then state.thisFrameTeleport=true end if
  if state.demoPlayback or (state.snap.playerState.pm_flags&PMF_FOLLOW)!=0 or state.noPredict or state.synchronousClients then state.playerStateTransitions=state.playerStateTransitions+[[state.snap.playerState,old.playerState]] end if;return void
end function
// CG_SetNextSnap
function setNextSnap(state,snap)
  if state.snap==void then return error(7701,"CG_SetNextSnap: NULL cg.snap") end if;state.nextSnap=snap;local=ensureEntity(state,snap.playerState.clientNum);if local is error then return local end if;local.nextState=playerEntity(snap.playerState);oldLocal=ensureEntity(state,state.snap.playerState.clientNum);if oldLocal is error then return oldLocal end if;oldLocal.interpolate=true
  for each source in snap.entities value=ensureEntity(state,source.number);if value is error then return value end if;value.nextState=source;if not value.currentValid or ((value.currentState.eFlags^source.eFlags)&EF_TELEPORT_BIT)!=0 then value.interpolate=false else value.interpolate=true end if end for
  state.nextFrameTeleport=((snap.playerState.eFlags^state.snap.playerState.eFlags)&EF_TELEPORT_BIT)!=0;if snap.playerState.clientNum!=state.snap.playerState.clientNum then state.nextFrameTeleport=true end if;if ((snap.snapFlags^state.snap.snapFlags)&SNAPFLAG_SERVERCOUNT)!=0 then state.nextFrameTeleport=true end if;state.solidBuilds=state.solidBuilds+1;return void
end function
function findSnapshot(state,number) for each snap in state.snapshots if snap.number==number then return snap end if end for;return void end function
// CG_ReadNextSnapshot
function readNextSnapshot(state)
  if state.latestSnapshotNum>state.processedSnapshotNum+1000 then state.errors=state.errors+["WARNING: CG_ReadNextSnapshot: way out of range, "+str(state.latestSnapshotNum)+" > "+str(state.processedSnapshotNum)] end if
  while state.processedSnapshotNum<state.latestSnapshotNum state.processedSnapshotNum=state.processedSnapshotNum+1;snap=findSnapshot(state,state.processedSnapshotNum);if snap!=void then state.lagometer=state.lagometer+[snap.serverTime];return snap end if;state.lagometer=state.lagometer+[void] end while;return void
end function
// CG_ProcessSnapshots
function processSnapshots(state,time)
  state.time=time
  while state.snap==void snap=readNextSnapshot(state);if snap==void then return false end if;if (snap.snapFlags&SNAPFLAG_NOT_ACTIVE)==0 then initial=setInitialSnapshot(state,snap);if initial is error then return initial end if end if end while
  while true
    if state.nextSnap==void then snap=readNextSnapshot(state);if snap==void then break end if;next=setNextSnap(state,snap);if next is error then return next end if;if state.nextSnap.serverTime<state.snap.serverTime then return error(7701,"CG_ProcessSnapshots: Server time went backwards") end if end if
    if state.time>=state.snap.serverTime and state.time<state.nextSnap.serverTime then break end if;transition=transitionSnapshot(state);if transition is error then return transition end if
  end while
  if state.snap==void then return error(7701,"CG_ProcessSnapshots: cg.snap == NULL") end if;if state.time<state.snap.serverTime then state.time=state.snap.serverTime end if;if state.nextSnap!=void and state.nextSnap.serverTime<=state.time then return error(7701,"CG_ProcessSnapshots: cg.nextSnap->serverTime <= cg.time") end if;return true
end function
// Engine-side observer: preserve every published snapshot and run the native
// transition model without issuing Cgame events a second time.
function publish(state,number,source,snapFlags,commandSequence,time)
  wrapped=wrap(number,source,snapFlags,commandSequence);state.snapshots=state.snapshots+[wrapped];state.latestSnapshotNum=number;state.latestSnapshotTime=source.serverTime;return processSnapshots(state,time)
end function
