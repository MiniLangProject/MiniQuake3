// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Concrete bridge from the MiniQuake3 collision/game level to snapshot_build.
package mq3.server.snapshot_runtime
import mq3.server.snapshot_build as runtimeSnapshotBuild
import mq3.collision.world as cm
import mq3.collision.visibility as visibility
import mq3.game.entitystate as entitystate
import std.array as arrays

struct Runtime scene buildWorld end struct

function pointLeaf(host,origin) return cm.pointLeafnum(host.context.world,origin) end function
function leafArea(host,leaf) return visibility.leafArea(host.context.world.visibility,leaf) end function
function leafCluster(host,leaf) return visibility.leafCluster(host.context.world.visibility,leaf) end function
function writeAreaBits(host,bits,area) return visibility.writeAreaBits(host.context.world.visibility,bits,area) end function
function clusterPvs(host,cluster) return visibility.clusterPVS(host.context.world.visibility,cluster) end function
function areasConnected(host,first,second) return visibility.areasConnected(host.context.world.visibility,first,second) end function

function hostServices(scene)
  if scene==void or scene.world==void then return error(6880,"snapshot runtime: missing collision scene") end if
  return runtimeSnapshotBuild.services(pointLeaf,leafArea,leafCluster,writeAreaBits,clusterPvs,areasConnected,scene)
end function

function mappedEntity(gameEntity)
  spatial=gameEntity.r
  return runtimeSnapshotBuild.snapshotEntity(entitystate.copy(gameEntity.s),spatial.linked,spatial.svFlags,spatial.singleClient,spatial.clusters,spatial.lastCluster,spatial.areanum,spatial.areanum2)
end function

function create(level,ringCapacity)
  if level==void or level.scene==void then return error(6881,"snapshot runtime: missing level") end if
  mapped=[]
  if level.num_entities>0 then
    for index=0 to level.num_entities-1 mapped=mapped+[mappedEntity(level.entities[index])] end for
  end if
  return Runtime(level.scene,runtimeSnapshotBuild.world(true,mapped,ringCapacity))
end function

// Refresh game-owned state and spatial metadata while preserving the server's
// per-snapshot deduplication counters and persistent packet-entity ring.
function syncLevel(runtime,level)
  if runtime==void or level==void or level.scene!=runtime.scene then return error(6882,"snapshot runtime: level/scene mismatch") end if
  if level.num_entities<0 or level.num_entities>len(level.entities) then return error(6883,"snapshot runtime: invalid entity count") end if
  index=0
  while index<level.num_entities
    fresh=mappedEntity(level.entities[index])
    if index<len(runtime.buildWorld.entities) then
      fresh.snapshotCounter=runtime.buildWorld.entities[index].snapshotCounter
      runtime.buildWorld.entities[index]=fresh
    else runtime.buildWorld.entities=runtime.buildWorld.entities+[fresh] end if
    index=index+1
  end while
  if len(runtime.buildWorld.entities)>level.num_entities then runtime.buildWorld.entities=arrays.slice(runtime.buildWorld.entities,0,level.num_entities) end if
  return level.num_entities
end function

function buildClientFrame(runtime,level,clientNum,zombie)
  if clientNum<0 or clientNum>=len(level.clients) or clientNum>=level.num_entities then return error(6884,"snapshot runtime: bad client number") end if
  syncLevel(runtime,level);runtime.buildWorld.active=true
  present=level.entities[clientNum].client!=void
  return runtimeSnapshotBuild.buildClientSnapshot(runtime.buildWorld,hostServices(runtime.scene),level.clients[clientNum].ps,present,zombie)
end function
