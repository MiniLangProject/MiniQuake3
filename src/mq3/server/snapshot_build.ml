// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Server snapshot visibility and ring construction from server/sv_snapshot.c.
package mq3.server.snapshot_build
import mq3.game.g_public as gpublic
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
import std.sort as sorts
import std.ds.list as snapshotLists

const MAX_SNAPSHOT_ENTITIES=1024
const MAX_MAP_AREA_BYTES=32
const MAX_GENTITIES=1024
const SVF_NOCLIENT=gpublic.SVF_NOCLIENT
const SVF_CLIENTMASK=gpublic.SVF_CLIENTMASK
const SVF_BROADCAST=gpublic.SVF_BROADCAST
const SVF_PORTAL=gpublic.SVF_PORTAL
const SVF_SINGLECLIENT=gpublic.SVF_SINGLECLIENT
const SVF_NOTSINGLECLIENT=gpublic.SVF_NOTSINGLECLIENT

struct Services pointLeafFn leafAreaFn leafClusterFn writeAreaBitsFn clusterPvsFn areasConnectedFn context end struct
struct SnapshotEntity state linked svFlags singleClient clusters lastCluster areaNum areaNum2 snapshotCounter end struct
struct World active snapshotCounter entities ring ringCapacity nextSnapshotEntities end struct
struct Frame areaBytes areaBits playerState numEntities firstEntity end struct
struct EntityNumbers values count end struct

function services(pointLeafFn,leafAreaFn,leafClusterFn,writeAreaBitsFn,clusterPvsFn,areasConnectedFn,context)
  return Services(pointLeafFn,leafAreaFn,leafClusterFn,writeAreaBitsFn,clusterPvsFn,areasConnectedFn,context)
end function
function snapshotEntity(state,linked,svFlags,singleClient,clusters,lastCluster,areaNum,areaNum2)
  return SnapshotEntity(state,linked,svFlags,singleClient,clusters,lastCluster,areaNum,areaNum2,0)
end function
function world(active,entities,ringCapacity)
  if ringCapacity<=0 then return error(6870,"snapshot build: invalid ring capacity") end if
  return World(active,0,entities,array(ringCapacity,void),ringCapacity,0)
end function
function frame()
  return Frame(0,bytes(MAX_MAP_AREA_BYTES,0),playerstate.create(),0,0)
end function
function entityNumbers() return EntityNumbers(array(MAX_SNAPSHOT_ENTITIES,0),0) end function

// SV_QsortEntityNumbers semantics. Keep the caller-owned input detached while
// using the standard-library O(n log n) sort instead of repeatedly concatenating
// arrays in an O(n^2) insertion sort on every client snapshot.
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

function addEntity(worldState,entity,numbers)
  return addEntityMode(worldState,entity,numbers,void)
end function
function addEntityMode(worldState,entity,numbers,builder)
  if entity.snapshotCounter==worldState.snapshotCounter then return false end if
  entity.snapshotCounter=worldState.snapshotCounter
  if numbers.count>=MAX_SNAPSHOT_ENTITIES then return false end if
  if builder==void then numbers.values[numbers.count]=entity.state.number else builder.add(entity.state.number) end if
  numbers.count=numbers.count+1
  return true
end function

function pvsContains(pvs,cluster)
  if cluster<0 or (cluster>>3)>=len(pvs) then return false end if
  return (pvs[cluster>>3]&(1<<(cluster&7)))!=0
end function
function distanceSquared(first,second)
  x=first[0]-second[0];y=first[1]-second[1];z=first[2]-second[2]
  return x*x+y*y+z*z
end function

// Host callbacks provide CM_PointLeafnum, leaf area/cluster, CM_WriteAreaBits,
// CM_ClusterPVS and CM_AreasConnected. Portal recursion stays in MiniLang.
function addEntitiesVisibleFromPoint(worldState,host,origin,outFrame,numbers,portal)
  return addVisibleMode(worldState,host,origin,outFrame,numbers,portal,void)
end function
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
