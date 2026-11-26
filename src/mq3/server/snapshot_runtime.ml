// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Concrete bridge from the MiniQuake3 collision/game level to snapshot_build.
package mq3.server.snapshot_runtime
import mq3.server.snapshot_build as runtimeSnapshotBuild
import mq3.collision.world as cm
import mq3.collision.visibility as visibility
import mq3.game.entitystate as entitystate
import std.array as arrays

/// Runtime record for server.snapshot_runtime, containing `scene`, `buildWorld`.
struct Runtime
  /// Linked collision scene used to determine snapshot visibility.
  scene
  /// Snapshot-builder world containing entity states and visibility data.
  buildWorld
end struct

/// Return `mq3.collision.world.pointLeafnum(host.context.world, origin)` from `server.snapshot_runtime.pointLeaf`.
/// @param host Record exposing `context`.
/// @param origin Point passed as `point` to `mq3.collision.world.pointLeafnum`.
function pointLeaf(host,origin) return cm.pointLeafnum(host.context.world,origin) end function
/// Return `mq3.collision.visibility.leafArea(host.context.world.visibility, leaf)` from `server.snapshot_runtime.leafArea`.
/// @param host Record exposing `context`.
/// @param leaf Leaf passed as `leaf` to `mq3.collision.visibility.leafArea`.
function leafArea(host,leaf) return visibility.leafArea(host.context.world.visibility,leaf) end function
/// Return `mq3.collision.visibility.leafCluster(host.context.world.visibility, leaf)` from `server.snapshot_runtime.leafCluster`.
/// @param host Record exposing `context`.
/// @param leaf Leaf passed as `leaf` to `mq3.collision.visibility.leafCluster`.
function leafCluster(host,leaf) return visibility.leafCluster(host.context.world.visibility,leaf) end function
/// Return `mq3.collision.visibility.writeAreaBits(host.context.world.visibility, bits, area)` from `server.snapshot_runtime.writeAreaBits`.
/// @param host Record exposing `context`.
/// @param bits Buffer passed as `buffer` to `mq3.collision.visibility.writeAreaBits`.
/// @param area Area passed as `area` to `mq3.collision.visibility.writeAreaBits`.
function writeAreaBits(host,bits,area) return visibility.writeAreaBits(host.context.world.visibility,bits,area) end function
/// Return `mq3.collision.visibility.clusterPVS(host.context.world.visibility, cluster)` from `server.snapshot_runtime.clusterPvs`.
/// @param host Record exposing `context`.
/// @param cluster Cluster passed as `cluster` to `mq3.collision.visibility.clusterPVS`.
function clusterPvs(host,cluster) return visibility.clusterPVS(host.context.world.visibility,cluster) end function
/// Return `mq3.collision.visibility.areasConnected(host.context.world.visibility, first, second)` from `server.snapshot_runtime.areasConnected`.
/// @param host Record exposing `context`.
/// @param first Area 1 passed as `area1` to `mq3.collision.visibility.areasConnected`.
/// @param second Area 2 passed as `area2` to `mq3.collision.visibility.areasConnected`.
function areasConnected(host,first,second) return visibility.areasConnected(host.context.world.visibility,first,second) end function

/// Apply `mq3.server.snapshot_build.services` for host services in server.snapshot_runtime.
///
/// Validation failures include `snapshot runtime: missing collision scene`.
/// @param scene Record exposing `world`.
function hostServices(scene)
  if scene==void or scene.world==void then return error(6880,"snapshot runtime: missing collision scene") end if
  return runtimeSnapshotBuild.services(pointLeaf,leafArea,leafCluster,writeAreaBits,clusterPvs,areasConnected,scene)
end function

/// Apply `mq3.server.snapshot_build.snapshotEntity`, `mq3.game.entitystate.copy` for mapped entity in server.snapshot_runtime.
/// @param gameEntity Record exposing `r`, `s`.
function mappedEntity(gameEntity)
  spatial=gameEntity.r
  return runtimeSnapshotBuild.snapshotEntity(entitystate.copy(gameEntity.s),spatial.linked,spatial.svFlags,spatial.singleClient,spatial.clusters,spatial.lastCluster,spatial.areanum,spatial.areanum2)
end function

/// Create snapshot runtime in server.snapshot_runtime; the normal completion returns `Runtime(level.scene, runtimeSnapshotBuild.world(true, mapped, ringCapacity))`.
///
/// Validation failures include `snapshot runtime: missing level`.
/// @param level Record exposing `scene`, `num_entities`, `entities`.
/// @param ringCapacity Ring capacity passed as `ringCapacity` to `mq3.server.snapshot_build.world`.
function create(level,ringCapacity)
  if level==void or level.scene==void then return error(6881,"snapshot runtime: missing level") end if
  mapped=array(level.num_entities,void)
  if level.num_entities>0 then
    for index=0 to level.num_entities-1 mapped[index]=mappedEntity(level.entities[index]) end for
  end if
  return Runtime(level.scene,runtimeSnapshotBuild.world(true,mapped,ringCapacity))
end function

// Refresh game-owned state and spatial metadata while preserving the server's
// per-snapshot deduplication counters and persistent packet-entity ring.
/// @param runtime Record exposing `scene`, `buildWorld`.
/// @param level Record exposing `scene`, `num_entities`, `entities`.
function syncLevel(runtime,level)
  if runtime==void or level==void or level.scene!=runtime.scene then return error(6882,"snapshot runtime: level/scene mismatch") end if
  if level.num_entities<0 or level.num_entities>len(level.entities) then return error(6883,"snapshot runtime: invalid entity count") end if
  if len(runtime.buildWorld.entities)<level.num_entities then
    expanded=array(level.num_entities,void)
    if len(runtime.buildWorld.entities)>0 then copyArray(expanded,0,runtime.buildWorld.entities,0,len(runtime.buildWorld.entities)) end if
    runtime.buildWorld.entities=expanded
  end if
  index=0
  while index<level.num_entities
    fresh=mappedEntity(level.entities[index])
    if runtime.buildWorld.entities[index]!=void then fresh.snapshotCounter=runtime.buildWorld.entities[index].snapshotCounter end if
    runtime.buildWorld.entities[index]=fresh
    index=index+1
  end while
  if len(runtime.buildWorld.entities)>level.num_entities then runtime.buildWorld.entities=arrays.slice(runtime.buildWorld.entities,0,level.num_entities) end if
  return level.num_entities
end function

/// Build client frame in server.snapshot_runtime.
///
/// Validation failures include `snapshot runtime: bad client number`.
/// @param runtime Record exposing `buildWorld`, `scene`.
/// @param level Record exposing `clients`, `num_entities`, `entities`.
/// @param clientNum Zero-based index into `level.entities`, `level.clients`.
/// @param zombie Zombie passed as `zombie` to `mq3.server.snapshot_build.buildClientSnapshot`.
function buildClientFrame(runtime,level,clientNum,zombie)
  if clientNum<0 or clientNum>=len(level.clients) or clientNum>=level.num_entities then return error(6884,"snapshot runtime: bad client number") end if
  syncLevel(runtime,level);runtime.buildWorld.active=true
  present=level.entities[clientNum].client!=void
  return runtimeSnapshotBuild.buildClientSnapshot(runtime.buildWorld,hostServices(runtime.scene),level.clients[clientNum].ps,present,zombie)
end function
