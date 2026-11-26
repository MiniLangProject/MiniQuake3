// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Server snapshot visibility and ring construction from server/sv_snapshot.c.
package mq3.server.snapshot_build
import mq3.game.g_public as gpublic
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
import std.sort as sorts
import std.ds.list as snapshotLists

/// Maximum number of entity states gathered for one snapshot.
const MAX_SNAPSHOT_ENTITIES=1024
/// Bit vector of area visibility.
const MAX_MAP_AREA_BYTES=32
/// Maximum number of addressable game-entity slots.
const MAX_GENTITIES=1024
/// Don't send entity to clients, even if it has effects.
const SVF_NOCLIENT=gpublic.SVF_NOCLIENT
/// Entity visibility flag interpreting the single-client field as a recipient bit mask.
const SVF_CLIENTMASK=gpublic.SVF_CLIENTMASK
/// Send to all connected clients.
const SVF_BROADCAST=gpublic.SVF_BROADCAST
/// Merge a second pvs at origin2 into snapshots.
const SVF_PORTAL=gpublic.SVF_PORTAL
/// Only send to a single client (entityShared_t->singleClient).
const SVF_SINGLECLIENT=gpublic.SVF_SINGLECLIENT
/// Send entity to everyone but one client.
const SVF_NOTSINGLECLIENT=gpublic.SVF_NOTSINGLECLIENT

/// Services record for server.snapshot_build, containing `pointLeafFn`, `leafAreaFn`, `leafClusterFn`, `writeAreaBitsFn`, `clusterPvsFn`, `areasConnectedFn`, and 1 further fields.
struct Services
  /// Host callback that returns the BSP leaf containing a point.
  pointLeafFn
  /// Host callback that returns the portal area containing a BSP leaf.
  leafAreaFn
  /// Host callback that returns the visibility cluster containing a BSP leaf.
  leafClusterFn
  /// Host callback that serializes the area-visibility mask for a snapshot.
  writeAreaBitsFn
  /// Host callback that returns the potentially visible set for a visibility cluster.
  clusterPvsFn
  /// Host callback that tests whether two portal areas are connected.
  areasConnectedFn
  /// Caller-supplied data associated with collision visibility queries used to gather snapshot
  /// entities.
  context
end struct
/// SnapshotEntity record for server.snapshot_build, containing `state`, `linked`, `svFlags`, `singleClient`, `clusters`, `lastCluster`, and 3 further fields.
struct SnapshotEntity
  /// Network entity-state payload considered for inclusion in a snapshot.
  state
  /// True when this entity or resource is linked into the world.
  linked
  /// Server-side visibility and entity-behavior flags.
  svFlags
  /// Client number selected or excluded by the entity's single-client visibility flags.
  singleClient
  /// Cluster records or assignments used to group navigation and visibility areas.
  clusters
  /// Final visibility cluster used when the explicit cluster list overflows.
  lastCluster
  /// Primary collision-map area containing this entity, used for snapshot area visibility.
  areaNum
  /// Second AAS area number used by the operation.
  areaNum2
  /// Generation marker used to avoid adding an entity twice to one snapshot.
  snapshotCounter
end struct
/// World record for server.snapshot_build, containing `active`, `snapshotCounter`, `entities`, `ring`, `ringCapacity`, `nextSnapshotEntities`.
struct World
  /// True while this entry participates in the active runtime.
  active
  /// Generation marker used to avoid adding an entity twice to one snapshot.
  snapshotCounter
  /// Game or BSP entity records tracked by this subsystem.
  entities
  /// Circular storage retaining entity states referenced by sent snapshots.
  ring
  /// Number of entity-state slots in the snapshot ring.
  ringCapacity
  /// Next absolute insertion position in the circular snapshot-entity buffer.
  nextSnapshotEntities
end struct
/// Frame record for server.snapshot_build, containing `areaBytes`, `areaBits`, `playerState`, `numEntities`, `firstEntity`.
struct Frame
  /// Number of valid bytes in the snapshot's area-visibility mask.
  areaBytes
  /// Bitset of map areas visible in this snapshot.
  areaBits
  /// Authoritative player-state record used for snapshots and game simulation.
  playerState
  /// Number of entity records currently represented by this state or snapshot.
  numEntities
  /// First entity-state position for this snapshot in the shared circular snapshot buffer.
  firstEntity
end struct
/// EntityNumbers record for server.snapshot_build, containing `values`, `count`.
struct EntityNumbers
  /// Sorted entity numbers selected for the snapshot.
  values
  /// Number of valid entries represented by this result.
  count
end struct

/// Create `mq3.server.snapshot_build.Services` with pointLeafFn=pointLeafFn; leafAreaFn=leafAreaFn; leafClusterFn=leafClusterFn; writeAreaBitsFn=writeAreaBitsFn; clusterPvsFn=clusterPvsFn; areasConnectedFn=areasConnectedFn; context=context.
/// @param pointLeafFn Initial `pointLeafFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record.
/// @param leafAreaFn Initial `leafAreaFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record.
/// @param leafClusterFn Initial `leafClusterFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record.
/// @param writeAreaBitsFn Initial `writeAreaBitsFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record.
/// @param clusterPvsFn Initial `clusterPvsFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record.
/// @param areasConnectedFn Initial `areasConnectedFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record.
/// @param context Initial `context` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record.
function services(pointLeafFn,leafAreaFn,leafClusterFn,writeAreaBitsFn,clusterPvsFn,areasConnectedFn,context)
  return Services(pointLeafFn,leafAreaFn,leafClusterFn,writeAreaBitsFn,clusterPvsFn,areasConnectedFn,context)
end function
/// Create `mq3.server.snapshot_build.SnapshotEntity` with state=state; linked=linked; svFlags=svFlags; singleClient=singleClient; clusters=clusters; lastCluster=lastCluster; areaNum=areaNum; areaNum2=areaNum2; snapshotCounter=0.
/// @param state Initial `state` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record.
/// @param linked Initial `linked` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record.
/// @param svFlags Initial `svFlags` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record.
/// @param singleClient Initial `singleClient` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record.
/// @param clusters Initial `clusters` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record.
/// @param lastCluster Initial `lastCluster` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record.
/// @param areaNum Initial `areaNum` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record.
/// @param areaNum2 Initial `areaNum2` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record.
function snapshotEntity(state,linked,svFlags,singleClient,clusters,lastCluster,areaNum,areaNum2)
  return SnapshotEntity(state,linked,svFlags,singleClient,clusters,lastCluster,areaNum,areaNum2,0)
end function
/// Compute world in server.snapshot_build; the normal completion returns `World(active, 0, entities, array(ringCapacity, void), ringCapacity, 0)`.
///
/// Validation failures include `snapshot build: invalid ring capacity`.
/// @param active Initial `active` field stored in the returned or constructed `mq3.server.snapshot_build.World` record.
/// @param entities Initial `entities` field stored in the returned or constructed `mq3.server.snapshot_build.World` record.
/// @param ringCapacity Initial `ringCapacity` field stored in the returned or constructed `mq3.server.snapshot_build.World` record.
function world(active,entities,ringCapacity)
  if ringCapacity<=0 then return error(6870,"snapshot build: invalid ring capacity") end if
  return World(active,0,entities,array(ringCapacity,void),ringCapacity,0)
end function
/// Create `mq3.server.snapshot_build.Frame` with areaBytes=0; areaBits=bytes(MAX_MAP_AREA_BYTES, 0); playerState=playerstate.create(); numEntities=0; firstEntity=0.
function frame()
  return Frame(0,bytes(MAX_MAP_AREA_BYTES,0),playerstate.create(),0,0)
end function
/// Create `mq3.server.snapshot_build.EntityNumbers` with values=array(MAX_SNAPSHOT_ENTITIES, 0); count=0.
function entityNumbers() return EntityNumbers(array(MAX_SNAPSHOT_ENTITIES,0),0) end function

// SV_QsortEntityNumbers semantics. Keep the caller-owned input detached while
// using the standard-library O(n log n) sort instead of repeatedly concatenating
// arrays in an O(n^2) insertion sort on every client snapshot.
/// @param numbers Numbers used in `len(numbers)` and `typeof(numbers)`.
function sortEntityNumbers(numbers)
  if typeof(numbers)!="array" then return error(6871,"snapshot build: invalid entity list") end if
  sorted=array(len(numbers),0)
  if len(numbers)>0 then copyArray(sorted,0,numbers,0,len(numbers)) end if
  sorts.sort(sorted)
  index=1
  while index<len(sorted)
    if sorted[index-1]==sorted[index] then return error(6871,"snapshot build: duplicated entity") end if
    index=index+1
  end while
  return sorted
end function

/// Return `mq3.server.snapshot_build.addEntityMode(worldState, entity, numbers, void)` from `server.snapshot_build.addEntity`.
/// @param worldState World state passed as `worldState` to `mq3.server.snapshot_build.addEntityMode`.
/// @param entity Entity passed as `entity` to `mq3.server.snapshot_build.addEntityMode`.
/// @param numbers Numbers passed as `numbers` to `mq3.server.snapshot_build.addEntityMode`.
function addEntity(worldState,entity,numbers)
  return addEntityMode(worldState,entity,numbers,void)
end function
/// Add entity mode in server.snapshot_build; the normal completion returns `true`.
///
/// Direct state writes: `entity.snapshotCounter`, `numbers.count`.
/// @param worldState Record exposing `snapshotCounter`.
/// @param entity Record exposing `snapshotCounter`, `state`. Updated in place: `snapshotCounter`.
/// @param numbers Record exposing `count`, `values`. Updated in place: `count`.
/// @param builder Record exposing `add`.
function addEntityMode(worldState,entity,numbers,builder)
  if entity.snapshotCounter==worldState.snapshotCounter then return false end if
  entity.snapshotCounter=worldState.snapshotCounter
  if numbers.count>=MAX_SNAPSHOT_ENTITIES then return false end if
  if builder==void then numbers.values[numbers.count]=entity.state.number else builder.add(entity.state.number) end if
  numbers.count=numbers.count+1
  return true
end function

/// Compute pvs contains in server.snapshot_build; the normal completion returns `((pvs[(cluster >> 3)] & (1 << (cluster & 7))) != 0)`.
/// @param pvs Pvs used in `len(pvs)` and `pvs[(cluster >> 3)]`.
/// @param cluster Cluster used in `(cluster < 0)` and `(cluster & 7)`.
function pvsContains(pvs,cluster)
  if cluster<0 or (cluster>>3)>=len(pvs) then return false end if
  return (pvs[cluster>>3]&(1<<(cluster&7)))!=0
end function
/// Compute distance squared in server.snapshot_build; the normal completion returns `(((x * x) + (y * y)) + (z * z))`.
/// @param first First used in `first[0]` and `first[1]`.
/// @param second Second used in `second[0]` and `second[1]`.
function distanceSquared(first,second)
  x=first[0]-second[0];y=first[1]-second[1];z=first[2]-second[2]
  return x*x+y*y+z*z
end function

// Host callbacks provide CM_PointLeafnum, leaf area/cluster, CM_WriteAreaBits,
// CM_ClusterPVS and CM_AreasConnected. Portal recursion stays in MiniLang.
/// @param worldState World state passed as `worldState` to `mq3.server.snapshot_build.addVisibleMode`.
/// @param host Host passed as `host` to `mq3.server.snapshot_build.addVisibleMode`.
/// @param origin Origin passed as `origin` to `mq3.server.snapshot_build.addVisibleMode`.
/// @param outFrame Out frame passed as `outFrame` to `mq3.server.snapshot_build.addVisibleMode`.
/// @param numbers Numbers passed as `numbers` to `mq3.server.snapshot_build.addVisibleMode`.
/// @param portal Portal passed as `portal` to `mq3.server.snapshot_build.addVisibleMode`.
function addEntitiesVisibleFromPoint(worldState,host,origin,outFrame,numbers,portal)
  return addVisibleMode(worldState,host,origin,outFrame,numbers,portal,void)
end function
/// Add visible mode in server.snapshot_build; updates `outFrame.areaBytes`.
///
/// Validation failures include `snapshot build: client mask index`.
/// Direct state writes: `outFrame.areaBytes`.
/// @param worldState Record exposing `active`, `entities`, `snapshotCounter`.
/// @param host Record exposing `pointLeafFn`, `leafAreaFn`, `leafClusterFn`, `writeAreaBitsFn`, `clusterPvsFn`, `areasConnectedFn`.
/// @param origin Second passed as `second` to `mq3.server.snapshot_build.distanceSquared`.
/// @param outFrame Record exposing `areaBits`, `playerState`. Updated in place: `areaBytes`.
/// @param numbers Numbers passed as `numbers` to `mq3.server.snapshot_build.addEntityMode`.
/// @param portal Reserved argument; this implementation does not read its value.
/// @param builder Builder passed as `builder` to `mq3.server.snapshot_build.addEntityMode`.
function addVisibleMode(worldState,host,origin,outFrame,numbers,portal,builder)
  if not worldState.active then return void end if
  leaf=host.pointLeafFn(host,origin);clientArea=host.leafAreaFn(host,leaf);clientCluster=host.leafClusterFn(host,leaf)
  outFrame.areaBytes=host.writeAreaBitsFn(host,outFrame.areaBits,clientArea)
  clientPvs=host.clusterPvsFn(host,clientCluster)
  index=0
  while index<len(worldState.entities)
    entity=worldState.entities[index]
    if entity==void or not entity.linked then index=index+1;continue end if
    if entity.state.number!=index then entity.state.number=index end if
    flags=entity.svFlags;clientNum=outFrame.playerState.clientNum
    if (flags&SVF_NOCLIENT)!=0 then index=index+1;continue end if
    if (flags&SVF_SINGLECLIENT)!=0 and entity.singleClient!=clientNum then index=index+1;continue end if
    if (flags&SVF_NOTSINGLECLIENT)!=0 and entity.singleClient==clientNum then index=index+1;continue end if
    if (flags&SVF_CLIENTMASK)!=0 then
      if clientNum>=32 then return error(6872,"snapshot build: client mask index") end if
      if ((~entity.singleClient)&(1<<clientNum))!=0 then index=index+1;continue end if
    end if
    if entity.snapshotCounter==worldState.snapshotCounter then index=index+1;continue end if
    if (flags&SVF_BROADCAST)!=0 then addEntityMode(worldState,entity,numbers,builder);index=index+1;continue end if
    if not host.areasConnectedFn(host,clientArea,entity.areaNum) and not host.areasConnectedFn(host,clientArea,entity.areaNum2) then index=index+1;continue end if
    if len(entity.clusters)==0 then index=index+1;continue end if
    visible=false;last=0
    for each cluster in entity.clusters
      last=cluster
      if pvsContains(clientPvs,cluster) then visible=true;break end if
    end for
    if not visible and entity.lastCluster!=0 then
      cluster=last
      while cluster<=entity.lastCluster
        if pvsContains(clientPvs,cluster) then visible=true;break end if
        cluster=cluster+1
      end while
      // Preserve Baseq3's exact boundary check after the overflow scan.
      if cluster==entity.lastCluster then visible=false else visible=true end if
    end if
    if not visible then index=index+1;continue end if
    addEntityMode(worldState,entity,numbers,builder)
    if (flags&SVF_PORTAL)!=0 then
      inRange=true
      if entity.state.generic1!=0 and distanceSquared(entity.state.origin,origin)>entity.state.generic1*entity.state.generic1 then inRange=false end if
      if inRange then addVisibleMode(worldState,host,entity.state.origin2,outFrame,numbers,true,builder) end if
    end if
    index=index+1
  end while
  return void
end function

/// Build client snapshot in server.snapshot_build; the normal completion returns `outFrame`.
///
/// Validation failures include `snapshot build: bad client entity`; `snapshot build: entity ring wrapped`.
/// Direct state writes: `worldState.snapshotCounter`, `worldState.nextSnapshotEntities`.
/// @param worldState Record exposing `snapshotCounter`, `entities`, `nextSnapshotEntities`, `ring`, `ringCapacity`. Updated in place: `snapshotCounter`, `nextSnapshotEntities`.
/// @param host Host passed as `host` to `mq3.server.snapshot_build.addVisibleMode`.
/// @param ps Record exposing `clientNum`, `origin`, `viewheight`.
/// @param clientEntityPresent Client entity present used in `(not clientEntityPresent or zombie)`.
/// @param zombie Zombie used in `(not clientEntityPresent or zombie)`.
function buildClientSnapshot(worldState,host,ps,clientEntityPresent,zombie)
  worldState.snapshotCounter=worldState.snapshotCounter+1
  outFrame=frame()
  if not clientEntityPresent or zombie then return outFrame end if
  // Visibility has side effects and portal recursion: collect once, grow only
  // as needed, then detach the used prefix before the existing checked sort.
  numbers=EntityNumbers(void,0);builder=snapshotLists.List.withCapacity(32)
  outFrame.playerState=playerstate.copy(ps);clientNum=ps.clientNum
  if clientNum<0 or clientNum>=MAX_GENTITIES or clientNum>=len(worldState.entities) then return error(6873,"snapshot build: bad client entity") end if
  clientEntity=worldState.entities[clientNum];if clientEntity!=void then clientEntity.snapshotCounter=worldState.snapshotCounter end if
  origin=[ps.origin[0],ps.origin[1],ps.origin[2]+ps.viewheight]
  addVisibleMode(worldState,host,origin,outFrame,numbers,false,builder)
  selected=builder.toArray()
  selected=sortEntityNumbers(selected)
  for index=0 to MAX_MAP_AREA_BYTES-1 outFrame.areaBits[index]=outFrame.areaBits[index]^255 end for
  outFrame.firstEntity=worldState.nextSnapshotEntities
  for each number in selected
    worldState.ring[worldState.nextSnapshotEntities%worldState.ringCapacity]=entitystate.copy(worldState.entities[number].state)
    worldState.nextSnapshotEntities=worldState.nextSnapshotEntities+1
    if worldState.nextSnapshotEntities>=0x7FFFFFFE then return error(6874,"snapshot build: entity ring wrapped") end if
    outFrame.numEntities=outFrame.numEntities+1
  end for
  return outFrame
end function
