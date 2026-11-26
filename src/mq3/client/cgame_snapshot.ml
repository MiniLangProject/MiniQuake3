// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native state-machine port of code/cgame/cg_snapshot.c.
package mq3.client.cgame_snapshot
import mq3.game.entitystate as entitystate

/// Maximum event age in milliseconds before an entity event is considered stale.
const EVENT_VALID_MSEC=300
/// Entity-state type selecting the player protocol interpretation.
const ET_PLAYER=1
/// Entity-state flag selecting teleport bit behavior in client presentation.
const EF_TELEPORT_BIT=4
/// Player-movement state flag indicating follow.
const PMF_FOLLOW=0x1000
/// Snapshot flag indicating that the server state is not yet active for normal gameplay.
const SNAPFLAG_NOT_ACTIVE=1
/// Snapshot bit toggled on server/map restarts so clients can recognize a new server state.
const SNAPFLAG_SERVERCOUNT=4
/// Stores client game snapshot snapshot metadata and contents, including `number`, `serverTime`, `snapFlags`, `serverCommandSequence`, `playerState`, `entities`.
struct Snapshot
  /// When constructing this record, `wrap` supplies `number` for this member.
  number
  /// Server simulation time in milliseconds used to order and transition client-game snapshots.
  serverTime
  /// Snapshot flags describing rate delay and dropped-command conditions.
  snapFlags
  /// Reliable server-command sequence executed when this snapshot is installed or becomes current.
  serverCommandSequence
  /// Player-state record associated with this client snapshot.
  playerState
  /// Entity-state or renderer-entity entries represented by the current snapshot or scene.
  entities
end struct
/// Stores client game snapshot cent record, including `currentState`, `nextState`, `currentValid`, `interpolate`, `previousEvent`, `trailTime` and additional values.
struct Cent
  /// Entity state received in the current server snapshot.
  currentState
  /// Entity state from the following snapshot, used when interpolation is available.
  nextState
  /// True when the current snapshot contains a valid state for this entity.
  currentValid
  /// True when a valid following snapshot permits interpolation of this entity.
  interpolate
  /// Last processed entity event, retained to avoid replaying the same event.
  previousEvent
  /// Last trail-emission time, allowing missile trails to catch up across dropped packets.
  trailTime
  /// Entity position after snapshot interpolation and smoothing.
  lerpOrigin
  /// Entity orientation after snapshot interpolation and smoothing.
  lerpAngles
  /// Timestamp of the most recent snapshot containing this entity.
  snapShotTime
  /// When constructing this record, `cent` supplies `0` for this member.
  playerResets
  /// When constructing this record, `cent` supplies `0` for this member.
  events
end struct
/// Stores client game snapshot state, including `time`, `latestSnapshotNum`, `latestSnapshotTime`, `processedSnapshotNum`, `snap`, `nextSnap` and additional values.
struct State
  /// Client presentation time in milliseconds used to process and transition between server snapshots.
  time
  /// Sequence number of the latest snapshot received from the engine.
  latestSnapshotNum
  /// Server timestamp associated with the latest received snapshot.
  latestSnapshotTime
  /// Highest snapshot sequence already requested or processed by CGame.
  processedSnapshotNum
  /// Current snapshot used as the lower endpoint of client interpolation.
  snap
  /// Following snapshot used as the upper endpoint of client interpolation, when available.
  nextSnap
  /// Snapshot history indexed by sequence number for interpolation and delta decoding.
  snapshots
  /// Entity-state or renderer-entity entries represented by the current snapshot or scene.
  entities
  /// True when the current snapshot transition represents a teleport.
  thisFrameTeleport
  /// True when the following snapshot transition must bypass interpolation.
  nextFrameTeleport
  /// When constructing this record, `create` supplies `0` for this member. Used by `setInitialSnapshot`
  /// and `setNextSnap` during subsequent processing.
  solidBuilds
  /// When constructing this record, `create` supplies `0` for this member. Used by `setInitialSnapshot`
  /// during subsequent processing.
  respawns
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `executeSequence` during subsequent processing.
  executedSequences
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `readNextSnapshot` during subsequent processing.
  lagometer
  /// Diagnostic messages collected while parsing or processing the input.
  errors
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `transitionSnapshot` during subsequent processing.
  playerStateTransitions
  /// True when snapshots and commands are being read from a recorded demo.
  demoPlayback
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `transitionSnapshot` during subsequent processing.
  noPredict
  /// When constructing this record, `create` supplies `false` for this member. Used by
  /// `transitionSnapshot` during subsequent processing.
  synchronousClients
  /// Optional prediction attachment retained by the snapshot record; the snapshot factory initializes
  /// it to an absent value.
  prediction
end struct
/// Creates a client entity with separate current/next entity states and cleared interpolation/event history.
function cent() return Cent(entitystate.create(),entitystate.create(),false,false,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0) end function
/// Creates the client-game snapshot transition state and allocates the requested entity slots.
/// @param maxEntities Number of client-entity slots allocated; ensureEntity rejects numbers outside this range.
function create(maxEntities) return State(0,0,0,0,void,void,[],array(maxEntities,void),false,false,0,0,[],[],[],[],false,false,false,void) end function
/// Wraps parsed player/entity data with its snapshot number, server-command sequence and snapshot flags.
/// @param number Value used to initialize `Snapshot.number`.
/// @param source Record read through `source.serverTime`, `source.playerState`, `source.entities`.
/// @param snapFlags Value used to initialize `Snapshot.snapFlags`.
/// @param commandSequence Value used to initialize `Snapshot.serverCommandSequence`.
function wrap(number,source,snapFlags,commandSequence) return Snapshot(number,source.serverTime,snapFlags,commandSequence,source.playerState,source.entities) end function
/// Lazily creates the requested client entity, or returns error 7701 when its number is outside the entity table.
/// @param state Mutable client game snapshot record/storage; this routine assigns `state.entities[number]`.
/// @param number Zero-based entity slot to initialize or read.
function ensureEntity(state,number)
  if number<0 or number>=len(state.entities) then return error(7701,"snapshot entity number out of range") end if
  if state.entities[number]==void then state.entities[number]=cent() end if;return state.entities[number]
end function
/// Converts player state into an ET_PLAYER entity state, copying position, view angles, flags, client number and weapon.
/// @param ps Player-state record containing authoritative or predicted player data. Record read through `ps.clientNum`, `ps.eFlags`, `ps.origin`, `ps.viewangles` and additional values.
function playerEntity(ps)
  value=entitystate.create();value.number=ps.clientNum;value.eType=ET_PLAYER;value.eFlags=ps.eFlags;value.origin=[ps.origin[0],ps.origin[1],ps.origin[2]];value.angles=[ps.viewangles[0],ps.viewangles[1],ps.viewangles[2]];value.clientNum=ps.clientNum;value.weapon=ps.weapon;return value
end function
// CG_ResetEntity
/// @param state Record read through `state.time`, `state.snap.serverTime`.
/// @param value Mutable client game snapshot record/storage; this routine assigns `value.previousEvent`, `value.trailTime`, `value.lerpOrigin`, `value.lerpAngles` and additional values.
function resetEntity(state,value)
  if value.snapShotTime<state.time-EVENT_VALID_MSEC then value.previousEvent=0 end if;value.trailTime=state.snap.serverTime;value.lerpOrigin=[value.currentState.origin[0],value.currentState.origin[1],value.currentState.origin[2]];value.lerpAngles=[value.currentState.angles[0],value.currentState.angles[1],value.currentState.angles[2]];if value.currentState.eType==ET_PLAYER then value.playerResets=value.playerResets+1 end if;return void
end function
// CG_TransitionEntity
/// @param state Shared client game snapshot state passed to the helper calls in `transitionEntity`.
/// @param value Mutable client game snapshot record/storage; this routine assigns `value.currentState`, `value.currentValid`, `value.interpolate`, `value.events`.
function transitionEntity(state,value)
  value.currentState=value.nextState;value.currentValid=true;if not value.interpolate then resetEntity(state,value) end if;value.interpolate=false;value.events=value.events+1;return void
end function
/// Appends a reliable server-command sequence to the snapshot model's execution log.
/// @param state Mutable client game snapshot record/storage; this routine assigns `state.executedSequences`.
/// @param sequence Value used by `state.executedSequences=state.executedSequences+[sequence]`.
function executeSequence(state,sequence) state.executedSequences=state.executedSequences+[sequence];return void end function
// CG_SetInitialSnapshot
/// @param state Mutable client game snapshot record/storage; this routine assigns `state.snap`, `state.solidBuilds`, `state.respawns`.
/// @param snap Record read through `snap.playerState.clientNum`, `snap.playerState`, `snap.serverCommandSequence`, `snap.entities`.
function setInitialSnapshot(state,snap)
  state.snap=snap;local=ensureEntity(state,snap.playerState.clientNum);if local is error then return local end if;local.currentState=playerEntity(snap.playerState);state.solidBuilds=state.solidBuilds+1;executeSequence(state,snap.serverCommandSequence);state.respawns=state.respawns+1
  for each source in snap.entities value=ensureEntity(state,source.number);if value is error then return value end if;value.currentState=source;value.interpolate=false;value.currentValid=true;resetEntity(state,value);value.events=value.events+1 end for;return void
end function
// CG_TransitionSnapshot
/// @param state Mutable client game snapshot record/storage; this routine assigns `state.snap`, `state.nextSnap`, `state.thisFrameTeleport`, `state.playerStateTransitions`.
function transitionSnapshot(state)
  if state.snap==void then return error(7701,"CG_TransitionSnapshot: NULL cg.snap") end if;if state.nextSnap==void then return error(7701,"CG_TransitionSnapshot: NULL cg.nextSnap") end if;executeSequence(state,state.nextSnap.serverCommandSequence)
  for each source in state.snap.entities value=ensureEntity(state,source.number);if value is error then return value end if;value.currentValid=false end for
  old=state.snap;state.snap=state.nextSnap;local=ensureEntity(state,state.snap.playerState.clientNum);if local is error then return local end if;local.currentState=playerEntity(state.snap.playerState);local.interpolate=false
  for each source in state.snap.entities value=ensureEntity(state,source.number);if value is error then return value end if;transitionEntity(state,value);value.snapShotTime=state.snap.serverTime end for;state.nextSnap=void
  if ((state.snap.playerState.eFlags^old.playerState.eFlags)&EF_TELEPORT_BIT)!=0 then state.thisFrameTeleport=true end if
  if state.demoPlayback or (state.snap.playerState.pm_flags&PMF_FOLLOW)!=0 or state.noPredict or state.synchronousClients then state.playerStateTransitions=state.playerStateTransitions+[[state.snap.playerState,old.playerState]] end if;return void
end function
// CG_SetNextSnap
/// @param state Mutable client game snapshot record/storage; this routine assigns `state.nextSnap`, `state.nextFrameTeleport`, `state.solidBuilds`.
/// @param snap Record read through `snap.playerState.clientNum`, `snap.playerState`, `snap.entities`, `snap.playerState.eFlags` and additional values.
function setNextSnap(state,snap)
  if state.snap==void then return error(7701,"CG_SetNextSnap: NULL cg.snap") end if;state.nextSnap=snap;local=ensureEntity(state,snap.playerState.clientNum);if local is error then return local end if;local.nextState=playerEntity(snap.playerState);oldLocal=ensureEntity(state,state.snap.playerState.clientNum);if oldLocal is error then return oldLocal end if;oldLocal.interpolate=true
  for each source in snap.entities value=ensureEntity(state,source.number);if value is error then return value end if;value.nextState=source;if not value.currentValid or ((value.currentState.eFlags^source.eFlags)&EF_TELEPORT_BIT)!=0 then value.interpolate=false else value.interpolate=true end if end for
  state.nextFrameTeleport=((snap.playerState.eFlags^state.snap.playerState.eFlags)&EF_TELEPORT_BIT)!=0;if snap.playerState.clientNum!=state.snap.playerState.clientNum then state.nextFrameTeleport=true end if;if ((snap.snapFlags^state.snap.snapFlags)&SNAPFLAG_SERVERCOUNT)!=0 then state.nextFrameTeleport=true end if;state.solidBuilds=state.solidBuilds+1;return void
end function
/// Finds a buffered snapshot by number, returning void when it has not been published.
/// @param state Record read through `state.snapshots`.
/// @param number Value tested by `snap.number==number` before the calculation continues.
function findSnapshot(state,number) for each snap in state.snapshots if snap.number==number then return snap end if end for;return void end function
// CG_ReadNextSnapshot
/// @param state Mutable client game snapshot record/storage; this routine assigns `state.errors`, `state.processedSnapshotNum`, `state.lagometer`.
function readNextSnapshot(state)
  if state.latestSnapshotNum>state.processedSnapshotNum+1000 then state.errors=state.errors+["WARNING: CG_ReadNextSnapshot: way out of range, "+str(state.latestSnapshotNum)+" > "+str(state.processedSnapshotNum)] end if
  while state.processedSnapshotNum<state.latestSnapshotNum state.processedSnapshotNum=state.processedSnapshotNum+1;snap=findSnapshot(state,state.processedSnapshotNum);if snap!=void then state.lagometer=state.lagometer+[snap.serverTime];return snap end if;state.lagometer=state.lagometer+[void] end while;return void
end function
// CG_ProcessSnapshots
/// @param state Mutable client game snapshot record/storage; this routine assigns `state.time`.
/// @param time Value assigned to `state.time`.
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
/// @param state Mutable client game snapshot record/storage; this routine assigns `state.snapshots`, `state.latestSnapshotNum`, `state.latestSnapshotTime`.
/// @param number Value assigned to `state.latestSnapshotNum`.
/// @param source Record read through `source.serverTime`.
/// @param snapFlags Snapshot flags controlling validity, interpolation and server restarts.
/// @param commandSequence Reliable server-command sequence associated with the snapshot.
/// @param time Value used by `return processSnapshots(state,time)`.
function publish(state,number,source,snapFlags,commandSequence,time)
  wrapped=wrap(number,source,snapFlags,commandSequence);state.snapshots=state.snapshots+[wrapped];state.latestSnapshotNum=number;state.latestSnapshotTime=source.serverTime;return processSnapshots(state,time)
end function
