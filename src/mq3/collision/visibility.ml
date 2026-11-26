// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CMod_LoadVisibility, CM_ClusterPVS and area portal connectivity from cm_test.c.
package mq3.collision.visibility
import mq3.compat.numeric as n

/// Visibility record for collision.visibility, containing `clusters`, `areas`, `numClusters`, `numAreas`, `clusterBytes`, `data`, and 4 further fields.
struct Visibility
  clusters
  areas
  numClusters
  numAreas
  clusterBytes
  data
  vised
  portals
  floodnums
  noAreas
end struct

/// Create the collision.visibility error for `fail` with 3504 and the supplied diagnostic text.
/// @param message Message used in `("Visibility: " + message)` and `error(3504, ("Visibility: " + message))`.
function fail(message)
  return error(3504,"Visibility: "+message)
end function

/// Load visibility in collision.visibility; the normal completion returns `state`.
/// @param map Record exposing `counts`, `offsets`, `data`, `lengths`.
function load(map)
  clusters = array(map.counts[4],0); areas = array(map.counts[4],0)
  numClusters = 0; numAreas = 0; index = 0
  while index < len(clusters)
    off = map.offsets[4]+index*48
    cluster = n.readI32(map.data,off); area = n.readI32(map.data,off+4)
    if cluster < -1 or cluster >= 131072 or area < -1 or area >= 256 then return fail("invalid leaf cluster/area") end if
    clusters[index] = cluster; areas[index] = area
    if cluster >= numClusters then numClusters = cluster+1 end if
    if area >= numAreas then numAreas = area+1 end if
    index = index+1
  end while
  vised = map.lengths[16] != 0
  clusterBytes = 0; data = void
  if vised then
    count = n.readI32(map.data,map.offsets[16]); clusterBytes = n.readI32(map.data,map.offsets[16]+4)
    if count < numClusters or clusterBytes < ((count+7)>>3) then return fail("visibility cannot address leaf clusters") end if
    numClusters = count
    data = slice(map.data,map.offsets[16]+8,map.lengths[16]-8)
  else
    // The original rounds the cluster count to 32 BYTES, without dividing by 8.
    clusterBytes = (numClusters+31) & ~31
    data = bytes(clusterBytes,255)
  end if
  state = Visibility(clusters,areas,numClusters,numAreas,clusterBytes,data,vised,array(numAreas*numAreas,0),array(numAreas,0),false)
  floodConnections(state)
  return state
end function

/// Compute leaf cluster in collision.visibility; the normal completion returns `state.clusters[leaf]`.
/// @param state Record exposing `clusters`.
/// @param leaf Zero-based index into `state.clusters`.
function leafCluster(state,leaf)
  if leaf < 0 or leaf >= len(state.clusters) then return fail("invalid leaf number") end if
  return state.clusters[leaf]
end function
/// Compute leaf area in collision.visibility; the normal completion returns `state.areas[leaf]`.
/// @param state Record exposing `areas`.
/// @param leaf Zero-based index into `state.areas`.
function leafArea(state,leaf)
  if leaf < 0 or leaf >= len(state.areas) then return fail("invalid leaf number") end if
  return state.areas[leaf]
end function
/// Compute cluster pvs in collision.visibility; the normal completion returns `slice(state.data, offset, state.clusterBytes)`.
/// @param state Record exposing `numClusters`, `vised`, `clusterBytes`, `data`.
/// @param cluster Cluster used in `(cluster >= 0)` and `(cluster < state.numClusters)`.
function clusterPVS(state,cluster)
  offset = 0
  if cluster >= 0 and cluster < state.numClusters and state.vised then offset = cluster*state.clusterBytes end if
  // Invalid clusters return the first row, even when real visibility is present.
  return slice(state.data,offset,state.clusterBytes)
end function

// Hot PVS tests need one bit, not a freshly copied visibility row.
// Match clusterPVS's first-row fallback for invalid source clusters.
/// @param state Visibility table and its per-cluster row width.
/// @param sourceCluster Source cluster index; invalid or unavailable rows fall back to the first row.
/// @param targetCluster Target cluster index whose bit is tested; negative/out-of-row indices return false.
/// @returns True when the selected PVS bit is set; false when it is clear or the target bit is out of range.
function clusterVisible(state as Visibility,sourceCluster as int,targetCluster as int) returns bool
  if targetCluster<0 or (targetCluster>>3)>=state.clusterBytes then return false end if
  offset=0
  if sourceCluster>=0 and sourceCluster<state.numClusters and state.vised then offset=sourceCluster*state.clusterBytes end if
  return (state.data[offset+(targetCluster>>3)]&(1<<(targetCluster&7)))!=0
end function

/// Update `state.floodnums` in collision.visibility.
///
/// Direct state writes: `state.floodnums`.
/// @param state Record exposing `numAreas`, `floodnums`, `portals`. Updated in place: `floodnums`.
function floodConnections(state)
  state.floodnums = array(state.numAreas,0)
  number = 0; root = 0
  while root < state.numAreas
    if state.floodnums[root] != 0 then root = root+1; continue end if
    number = number+1; pending = [root]; cursor = 0; state.floodnums[root] = number
    while cursor < len(pending)
      area = pending[cursor]; cursor = cursor+1; nextArea = 0
      while nextArea < state.numAreas
        if state.portals[area*state.numAreas+nextArea] > 0 and state.floodnums[nextArea] == 0 then
          state.floodnums[nextArea] = number; pending = pending+[nextArea]
        end if
        nextArea = nextArea+1
      end while
    end while
    root = root+1
  end while
  return void
end function

/// Compute adjust area portal state in collision.visibility.
/// @param state Record exposing `numAreas`, `portals`.
/// @param area1 Area 1 used in `(area1 < 0)` and `(area1 * state.numAreas)`.
/// @param area2 Area 2 used in `(area2 < 0)` and `(area2 * state.numAreas)`.
/// @param open Open operand used by `adjustAreaPortalState`; its reads are shown in the implementation.
function adjustAreaPortalState(state,area1,area2,open)
  if area1 < 0 or area2 < 0 then return void end if
  if area1 >= state.numAreas or area2 >= state.numAreas then return fail("invalid area number") end if
  first = area1*state.numAreas+area2; second = area2*state.numAreas+area1
  change = 1
  if not open then change = -1 end if
  steps = 1
  if first == second then steps = 2 end if
  // A caught error must not leave a corrupt graph. C drops the map on this error.
  if state.portals[first]+change*steps < 0 or state.portals[first]+change*steps > 2147483647 then return fail("invalid portal reference count") end if
  state.portals[first] = state.portals[first]+change
  state.portals[second] = state.portals[second]+change
  floodConnections(state)
  return void
end function

/// Compute areas connected in collision.visibility; the normal completion returns `(state.floodnums[area1] == state.floodnums[area2])`.
/// @param state Record exposing `noAreas`, `numAreas`, `floodnums`.
/// @param area1 Zero-based index into `state.floodnums`.
/// @param area2 Zero-based index into `state.floodnums`.
function areasConnected(state,area1,area2)
  if state.noAreas then return true end if
  if area1 < 0 or area2 < 0 then return false end if
  if area1 >= state.numAreas or area2 >= state.numAreas then return fail("invalid area number") end if
  return state.floodnums[area1] == state.floodnums[area2]
end function

/// Write area bits in collision.visibility; the normal completion returns `count`.
///
/// Direct state writes: `buffer elements`.
/// @param state Record exposing `numAreas`, `noAreas`, `floodnums`.
/// @param buffer Mutable sequence written at `index`, `(index >> 3)`.
/// @param area Zero-based index into `state.floodnums`.
function writeAreaBits(state,buffer,area)
  count = (state.numAreas+7)>>3
  if typeof(buffer) != "bytes" or len(buffer) < count then return fail("short area bit buffer") end if
  if state.noAreas or area == -1 then
    index = 0
    while index < count
      buffer[index] = 255; index = index+1
    end while
  else
    if area < 0 or area >= state.numAreas then return fail("invalid area number") end if
    index = 0
    while index < state.numAreas
      if state.floodnums[index] == state.floodnums[area] then buffer[index>>3] = buffer[index>>3] | (1 << (index & 7)) end if
      index = index+1
    end while
  end if
  return count
end function
